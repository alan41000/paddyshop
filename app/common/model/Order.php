<?php
// +----------------------------------------------------------------------
// | PaddyShop 全网多平台免费开源电商系统
// +----------------------------------------------------------------------
// | Copyright (c) 2021 https://paddyshop.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Alan Leung
// +----------------------------------------------------------------------

namespace app\common\model;

use think\Exception;
use EasyWeChat\Factory as EasyWeChat;

class Order extends PaddyShop
{
    protected $type = [
        'confirm_time'      =>  'timestamp',
        'delivery_time'     =>  'timestamp',
        'cancel_time'       =>  'timestamp',
        'collect_time'      =>  'timestamp',
        'close_time'        =>  'timestamp',
        'comments_time'     =>  'timestamp',
        'pay_time'       =>  'timestamp',
    ];

    /**
     * 关联订单详情
     * @Author: Alan Leung
     */
    public function orderDetail()
    {
        return $this->hasMany('OrderDetail', 'order_id', 'id');
    }

    /**
     * 关联会员详情
     * @Author: Alan Leung
     */
    public function userInfo()
    {
        return $this->hasOne('user', 'id', 'user_id');
    }

    /**
     * 关联地址信息
     * @Author: Alan Leung
     */    
    public function addressInfo()
    {
        return $this->hasOne('OrderAddress', 'order_id', 'id');
    }

    public function commentsGoodsInfo()
    {
        return $this->hasManyThrough('Goods','OrderDetail','order_id','id','id','goods_id');
    }

    /**
     * 添加订单
     * @Author: Alan Leung
     */
    public static function add($data)
    {
        if(isset($data['buy_type']))
        {
            switch($data['buy_type'])
            {
                // 立即购买
                case 'buyNow' :
                    $goods = self::confirmByGoods($data['goods']);
                    break;

                // 购物车
                case 'cart' :
                    $goods = self::confirmByCart($data['goods']);
                    break;

                // 默认
                default :
                    throwException('参数有误！');
            }
        } else {
            throwException('参数有误！');
        }

        $total_price = self::calculatePrice($goods);

	    // 优惠券校验
	    if(!empty($data['coupon'])){
		    CouponUser::checkUse($data,$total_price);
	    }

		$preferential_price = self::calculatePreferentialPrice($data,$total_price);
	    $increase_price = 0;
        
        // 订单主信息
        $order_data = [
            'order_no'              => date('YmdHis').getNumberCode(6),
            'user_id'               => $data['user']['id'],
            'user_note'             => $data['user_note'],
            'status'                => 1,
            'preferential_price'    => $preferential_price,
            'increase_price'        => $increase_price,
            'price'                 => $total_price,
            'total_price'           => ($total_price - $preferential_price) <= 0 ? 0 : $total_price - $preferential_price,
            'extension_data'        => '',
            'payment_id'            => $data['payment_id'],
            'qty_total'             => array_sum(array_column(array_column($goods, 'skuValue_selected'),'qty')),
            'client_type'           => '',
            'order_model'           => 0,
            'is_under_line'         => 0,
        ];

        try {
            // 开始事务
            self::startTrans();
            
            // 订单添加
            $order = Order::create($order_data);
            if($order)
            {
                foreach($goods as $k=>$v)
                {
                    // 写入订单详情
                    $detail_data = [
                        'user_id'           =>  $data['user']['id'],
                        'order_id'          =>  $order->id,
                        'goods_id'          =>  $v['goods_id'],
                        'title'             =>  $v['title'],
                        'images'            =>  empty($v['skuValue_selected']['images']) ? $v['goodsImages'][0]['url'] : $v['skuValue_selected']['images'],
                        'original_price'    =>  empty($v['skuValue_selected']['original_price']) ? 0 : $v['skuValue_selected']['original_price'],
                        'price'             =>  $v['skuValue_selected']['price'],
                        'total_price'       =>  $v['skuValue_selected']['price'] * $v['skuValue_selected']['qty'],
                        'sku'               =>  $v['skuValue_selected']['sku'],
                        'qty'               =>  $v['skuValue_selected']['qty'],
                        'model'             =>  empty($v['model']) ? '' : $v['model'],
                        'sku_weight'        =>  0,
                        'sku_code'          =>  $v['skuValue_selected']['code'],
                        'sku_barcode'       =>  '',
                        'refund_price'      =>  0,
                        'returned_qty'      =>  0,
                    ];
                    OrderDetail::add($detail_data);
                }

                if(!empty($data['address']))
                {
                    // 写入订单地址
                    $address_data = [
                        'user_id'               => $data['user']['id'],
                        'order_id'              => $order->id,
                        'address_id'            => $data['address']['id'],
                        'tag'                   => $data['address']['tag'],
                        'name'                  => $data['address']['name'],
                        'tel'                   => $data['address']['tel'],
                        'province'              => $data['address']['province'],
                        'city'                  => $data['address']['city'],
                        'county'                => $data['address']['county'],
                        'address'               => $data['address']['address'],
                        'province_name'         => $data['address']['province_name'],
                        'city_name'             => $data['address']['city_name'],
                        'county_name'           => $data['address']['county_name'],
                        'lng'                   => $data['address']['lng'],
                        'lat'                   => $data['address']['lat'],
                    ];
                    OrderAddress::add($address_data);
                }
            }

            // 库存扣除：下单减库存
            if(config()['paddyshop']['goods_inventory_rules'] == '1'){
                Goods::inventoryDeduct($order->id);
            }

            // 删除购物车
            if($data['buy_type'] == 'cart')
            {
                Cart::del(array_column($data['goods'],'id'),$data['user']['id']);
            }

			// 优惠券处理
	        CouponUser::edit([
				'id' => $data['coupon']['coupon_user_id'],
				'use_time' => time(),
				'order_id' => $order->id,
	        ]);

            // 订单提交成功
            self::commit();
            return $order->toArray();

        } catch (Exception $e) {
            // 回滚事务
            self::rollback();
            return $e->getMessage();
        }
    }

    /**
     * 订单确认
     * @Author: Alan Leung
     * @param {*} $params
     */
    public static function confirm($data)
    {
        if(isset($data['buy_type']))
        {
            switch($data['buy_type'])
            {
                // 立即购买
                case 'buyNow' :
                    $goods = self::confirmByGoods($data['goods']);
                    break;

                // 购物车
                case 'cart' :
                    $goods = self::confirmByCart($data['goods']);
                    break;

                // 默认
                default :
					throwException('参数有误！');
            }
        } else {
	        throwException('参数有误！');
        }
        
        // 计算价格信息
        if(!empty($goods))
        {
			// 当前用户可用的优惠券
	        $coupon_list = CouponUser::getAll([
				'where'=>[
					['user_id','=',$data['user']['id']],
			        ['use_time','=',0],
			        ['start_time','<=',time()],
			        ['end_time','>',time()],
		        ],
				'with'=>['couponInfo']])->toArray();
	        // 计算订单总价
	        $total_price = self::calculatePrice($goods);
	        // 满足订单使用条件的优惠券
	        $coupon_list = CouponUser::isInApplyRange($coupon_list, array_column($goods,'goods_id'),$total_price);
			// 计算优惠价
	        $preferential_price = self::calculatePreferentialPrice($data,$total_price);
			// 增加的价格
			$increase_price = 0;
			// 价格打包数据
            $price_data = [
                // 总价
                'total_price'           => $total_price,

                // 订单实际支付金额(已减去优惠金额, 已加上增加金额)
                'actual_price'          => ($total_price - number_format($preferential_price,2) + $increase_price) < 0 ? 0 : number_format($total_price - number_format($preferential_price,2) + $increase_price,2) ,

                // 优惠金额
                'preferential_price'    => number_format($preferential_price,2),

                // 增加金额
                'increase_price'        => $increase_price,
            ];

            // 返回数据
            $result = [
                'goods_list'                => $goods,      // 商品清单
                'price_data'                => $price_data, // 优惠金额，总金额，增加金额，订单实际支付金额
	            'coupon_list'               => $coupon_list,
            ];
			return  $result;
        }
	    throwException('参数有误！');
    }

    public static function confirmByGoods($data = [])
    {
        // 获取商品
        $p = [
            'where' => [
                'id'                => intval($data[0]['goods_id']),
                'is_shelves'        => 1,
            ],
            'field' => 'id, title, images, inventory_unit, buy_min_number, buy_max_number, model',
        ];
        $res = Goods::getAll($p);
        if(empty($res))
        {
            return false;
        }

        // 匹配已选择的规格
        if(!empty($res[0]['skuValue'])){
            foreach($res[0]['skuValue'] as $v)
            {
                if($data[0]['sku_value_id'] == $v['id'])
                {
                    $res[0]['skuValue_selected'] = $v;
                    $res[0]['skuValue_selected']['qty'] = $data[0]['qty'];
                    break;
                }
            }
        }        
        $res[0]['goods_id'] = $data[0]['goods_id'];
        return $res->toArray();
    }

    public static function confirmByCart($data = [])
    {
        foreach($data as &$v)
        {
            // 获取商品
            $p = [
                'where' => [
                    ['id','=',$v['goods_id']],
                    ['is_shelves' ,'=', 1],
                ],
                'field' => 'id, title, images, inventory_unit, buy_min_number, buy_max_number, model',
            ];
            $goodsInfo = Goods::getOne($p);
            if(empty($goodsInfo))
            {
                return false;
            }

            // 匹配已选择的规格
            foreach($goodsInfo['skuValue'] as $vs)
            {
                if($v['sku']['id'] == $vs['id'])
                {
                    $v['skuValue_selected'] = $vs;
                    $v['skuValue_selected']['qty'] = $v['qty'];
                    // $vr['qty'] = $vd['qty'];
                    break;
                }
            }

            $v['goodsImages'] = $goodsInfo['goodsImages'];
        }

        return $data;
    }

    /**
     * 计算价格
     * @Author: Alan Leung
     * @param {*} $goods
     */
    public static function calculatePrice($goods)
    {
        // 应使用skuValue_selected里面的price来计算价格
        $total_price = 0;
        foreach($goods as $vg)
        {
            $total_price += $vg['skuValue_selected']['price'] * $vg['skuValue_selected']['qty'];
        }
        return $total_price;
    }

	/**
	 * 计算优惠价格
	 * @Author: Alan Leung
	 * @param {*} $goods
	 */
	public  static  function  calculatePreferentialPrice($params,$total_price)
	{
		$preferentialPrice = 0;

		// 优惠券
		if(!empty($params['coupon']['coupon_id'])){
			$coupon = Coupon::getOne([
				'where' => [
					['id','=',$params['coupon']['coupon_id']],
				]
			]);
			if(empty($coupon)){
				throwException('优惠券数据有误');
			}
			// 满减券
			if($coupon['type'] == 0 && $total_price >= $coupon['min_order_price']){
				$preferentialPrice = $coupon['value'];
			}
			// 折扣券
			if($coupon['type'] == 1){
				$preferentialPrice = $total_price * ((10 - $coupon['value']) / 10);
			}
		}
		return $preferentialPrice;
	}

    /**
     * 编辑订单
     * @Author: Alan Leung
     * @param {*} $data
     */    
    public static function edit($data)
    {
        $order = Order::update($data,['id'=>$data['id']]);
        if($order)
        {
            return $order;
        }

        return false;
    }

    /**
     * 发起支付
     * @Author: Alan Leung
     * @param {*} $params
     */    
    public static function pay($params = [])
    {
        if(empty($params['order_id']))
        {
            throwException('订单id有误');
        }

        if(empty($params['user']))
        {
            throwException('用户信息有误');
        }
        
        // 获取订单信息
        $where = ['id'=>intval($params['order_id']), 'user_id' => $params['user']['id']];
        $order = self::getOne(['where' => $where]);
        if(empty($order))
        {
            throwException('资源不存在或已被删除');
        }
        if($order['status'] != 1)
        {
            throwException('订单状态不可操作');
        }

        // 支付处理
        $payment_id = 0;
        if(!empty($params['payment_id'])){
            $payment_id = $params['payment_id'];
        }
        else{
            $payment_id = $order['payment_id'];
        }
        switch($payment_id)
        {
            // 微信支付
            case 1:
				$isH5 =$params['isH5'];
                $app = self::wxPayConfig($isH5);
                $result = $app->order->unify([
                    'body'          => '订单支付-'.$order['order_no'],
                    'out_trade_no'  => $order['order_no'],
                    'total_fee'     => $order['total_price'] * 100,
                    // 'spbill_create_ip' => '123.12.12.123', // 可选，如不传该参数，SDK 将会自动获取相应 IP 地址
                    'notify_url'    => config()['paddyshop']['website_url'].'api/order.order/wxPayNotify',
                    'trade_type'    => 'JSAPI',
                    'openid'        => $params['user']['openid_weixin'],
                ]);

				if($result['return_code'] == 'SUCCESS'){
					if($result['result_code'] == 'SUCCESS'){
						if($isH5 == true){
							$jssdk = $result->jssdk;
							$res = $jssdk->sdkconfig($result['prepay_id']);
							return $res;
						}else{
							$appId =config()['paddyshop']['weixinminiapp_appid'];
							$nonceStr = $result['nonce_str'];
							$prepay_id = $result['prepay_id'];
							$timeStamp = time();
							$key = config()['paddyshop']['weixinpay_key'];
							$paySign = md5("appId=$appId&nonceStr=$nonceStr&package=prepay_id=$prepay_id&signType=MD5&timeStamp=$timeStamp&key=$key");
							$res = [
								'nonceStr'  =>  $nonceStr,
								'prepay_id' =>  $prepay_id,
								'timeStamp' =>  strval($timeStamp),
								'paySign'   =>  $paySign,
								'signType'  =>  'MD5',
							];
							return $res;
						}
					} else {
						throwException($result['err_code_des'].'，'.$result['err_code']);
					}
				} else {
					throwException($result['return_msg'] ?? '支付配置有误');
				}
                break;
            
            // 钱包支付
            case 2:
                $pay_data = [
                    'user'          => $params['user'],
                    'order'         => $order,
                    'total_price'   => $order['total_price'],
                    'client_type'   => $order['client_type'],
                ];

                if(Wallet::payMoney($pay_data)){
                    if(self::orderPayHandle($pay_data)){
                        $orderInfo = Order::getOne(['where'=>['id'=>$order['id']]]);
                        return $orderInfo;
                    }
                }
                break;

            default:
                throwException('请选择支付方式');
                break;
        }        
    }

    /**
     * 订单支付处理
     * @Author: Alan Leung
     * @param {*} $params
     */    
    private static function orderPayHandle($params)
    {
        if(empty($params['order']))
        {
            throwException('资源不存在或已被删除');
        }
        if($params['order']['status'] > 1)
        {            
            throwException('订单状态不可操作');
        }

        if(empty($params['order']['payment_id']))
        {
            throwException('支付方式有误');
        }

        return self::transaction(function () use ($params) {
            // 写入支付日志
            $pay_log_data = [
                'user_id'       => $params['order']['user_id'],
                'order_id'      => $params['order']['id'],
                'total_price'   => $params['order']['total_price'],
                'trade_no'      => $params['pay']['trade_no'] ?? '',
                'buyer_user'    => $params['pay']['buyer_user'] ?? '',
                'pay_price'     => $params['pay']['pay_price'] ?? $params['order']['total_price'],
                'subject'       => $params['pay']['subject'] ?? '订单支付',
                'payment_id'    => $params['order']['payment_id'],
                'business_type' => 1,
            ];
            (new PayLog())->add($pay_log_data);

            // 订单标记支付成功
            $upd_data = array(
                'id'            => $params['order']['id'],
                'status'        => 2,
                'pay_status'    => 1,
                'pay_price'     => $params['pay']['pay_price'] ?? 0,
                'payment_id'    => $params['order']['payment_id'],
                'pay_time'      => time(),
            );
            Order::edit($upd_data);

            // 库存扣除：付款减库存
            if(config()['paddyshop']['goods_inventory_rules'] == '2'){
                Goods::inventoryDeduct($params['order']['id']);
            }

            // 增加销量
            Goods::addSalesCount($params['order']['id']);
            
            // 消息通知
            UserMessage::add([
                'user_id'       =>  $params['order']['user_id'],
                'title'         =>  '订单支付',
                'detail'        =>  '订单支付成功，金额'.$params['order']['total_price'].'元',
                'business_id'   =>  $params['order']['id'],
                'business_type' =>  1,
                'type'          =>  0,
                'is_read'       =>  0,
            ]);

            return true;
        });
    }

    /**
     * 支付回调
     * @Author: Alan Leung
     * @param {*} $type
     */    
    public static function notify($type,$isH5 = false)
    {
        switch($type)
        {
            case 'Weixin':
                $app = self::wxPayConfig($isH5);
                $response = $app->handlePaidNotify(function($message, $fail){
                    // 订单信息
                    $order = self::getOne(['where'=>['order_no'=>$message['out_trade_no']]]);
                    if(empty($order) || $order['status'] > 1){
                        return true;
                    }       
                
                    if ($message['return_code'] === 'SUCCESS') { // return_code 表示通信状态，不代表支付状态
                        if ($message['result_code'] === 'SUCCESS') {
                            $payData = [
                                'trade_no'      =>  $message['transaction_id'] ?? '',
                                'buyer_user'    =>  $message['openid'] ?? '',
                                'pay_price'     =>  isset($message['total_fee']) ? ($message['total_fee'] / 100) : 0,
                            ];
                            $data = [
                                'order' =>  $order,
                                'pay'   =>  $payData,
                            ];
                            self::orderPayHandle($data);
                        }
                    } else {
                        return $fail('通信失败，请稍后再通知我');
                    }
                
                    return true; // 返回处理完成
                });
                return $response;
                break;

            default:
                return false;
                break;
        }
    }

    /**
     * 微信支付配置
     * @Author: Alan Leung
     */    
    private static function wxPayConfig($isH5 = false)
    {
		if($isH5 == true){
			$config = [
				// 必要配置
				'app_id'             => config()['paddyshop']['weixinh5_appid'],
				'mch_id'             => config()['paddyshop']['weixinpay_mch_id'],
				'key'                => config()['paddyshop']['weixinpay_key'],

				// 如需使用敏感接口（如退款、发送红包等）需要配置 API 证书路径(登录商户平台下载 API 证书)
				'cert_path'          => '', // XXX: 绝对路径！！！！
				'key_path'           => '',      // XXX: 绝对路径！！！！

				'notify_url'         => config()['paddyshop']['website_url'].'api/order.order/wxPayNotify/ish5/1',

				'sandbox'       => false, // 设置为 false 或注释则关闭沙箱模式
			];
		}else{
			$config = [
				// 必要配置
				'app_id'             => config()['paddyshop']['weixinminiapp_appid'],
				'mch_id'             => config()['paddyshop']['weixinpay_mch_id'],
				'key'                => config()['paddyshop']['weixinpay_key'],

				// 如需使用敏感接口（如退款、发送红包等）需要配置 API 证书路径(登录商户平台下载 API 证书)
				'cert_path'          => '', // XXX: 绝对路径！！！！
				'key_path'           => '',      // XXX: 绝对路径！！！！

				'notify_url'         => config()['paddyshop']['website_url'].'api/order.order/wxPayNotify',
				'sandbox'       => false, // 设置为 false 或注释则关闭沙箱模式
			];
		}

        return EasyWeChat::payment($config);
    }

    public static function sum($params = [])
    {
        $sumField = $params['sumField'];
        $field = empty($params['field']) ? '*' : $params['field'];
        $where = empty($params['where']) ? [] : $params['where'];
        $res = Order::where($where)->field($field)->order('id','desc')->sum($sumField);
        return (float)$res;
    }
}