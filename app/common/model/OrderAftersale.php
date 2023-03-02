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
use EasyWeChat\Factory as EasyWeChat;

class OrderAftersale extends PaddyShop
{
    protected $type = [
        'apply_time'    => 'timestamp',
        'confirm_time'  => 'timestamp',
        'delivery_time' => 'timestamp',
        'audit_time'    => 'timestamp',
        'cancel_time'   => 'timestamp',
    ];

	// 设置json类型字段
	protected $json = ['images'];

	// 设置JSON数据返回数组
	protected $jsonAssoc = true;

	public function getImagesAttr($value)
	{
		if(!empty($value)){
			foreach($value as &$v){
				$v = filePathHandle($v);
			}
		}
		return$value;
	}

	/**
	 * 关联订单详情
	 * @Author: Alan Leung
	 */
	public function orderDetail()
	{
		return $this->hasMany('OrderDetail', 'order_id', 'order_id');
	}

	/**
	 * 关联会员详情
	 * @Author: Alan Leung
	 */
	public function userInfo()
	{
		return $this->hasOne('user', 'id', 'user_id')->field('id,nickname,avatar,mobile');
	}

	/**
	 * 关联地址信息
	 * @Author: Alan Leung
	 */
	public function addressInfo()
	{
		return $this->hasOne('OrderAddress', 'order_id', 'id');
	}

	public static function add($data)
	{
		// 1.获取订单数据
		$orderInfo = Order::getOne(['where'=>[
			['id','=',$data['order_id']],
			['user_id','=',$data['user_id']],
		]]);

		// 2.订单是否可发起售后
		if($orderInfo['status'] < 2)  throwException('订单无法售后');

		// 3.当前是否存在进行中
		$orderAftersaleCount = OrderAftersale::count(['where' => [
			['order_id', '=', $data['order_id']],
			['order_detail_id', '=', $data['order_detail_id']],
			['user_id', '=', $data['user_id']],
			['status', '<=', 2],
		]]);
		if($orderAftersaleCount > 0) throwException('订单售后正在进行中，请勿重复申请');

		// 历史退款金额
		$where = [
			['order_id', '=', $data['order_id']],
			['user_id', '=', $data['user_id']],
			['status', '<=', 3],
		];
		$historyPrice = OrderAftersale::where($where)->sum('price');
		if(($data['price'] + $historyPrice) > $orderInfo['pay_price'])
		{
			throwException('退款金额大于支付金额[ 历史退款'.$historyPrice.'元, 订单金额'.$orderInfo['pay_price'].'元 ]');
		}

		// 历史退货数量
		$where[] = ['order_detail_id', '=', $data['order_detail_id']];
		$historyQty = OrderAftersale::where($where)->sum('qty');
		if($data['type'] == 2)
		{
			if(($data['qty']+$historyQty) > $orderInfo['qty_total'])
			{
				throwException('退货数量大于购买数量[ 历史退货数量 '.$historyQty.', 订单商品数量 '.$orderInfo['qty_total']);
			}
		}

		// 数据添加
		$refunddata = [
			'order_no'          => $orderInfo['order_no'],
			'type'              => $data['type'],
			'order_detail_id'   => $data['order_detail_id'],
			'order_id'          => $data['order_id'],
			'goods_id'          => $data['goods_id'],
			'user_id'           => $data['user_id'],
			'qty'            => ($data['type'] == 2) ? $data['qty'] : 0,
			'price'             => $data['price'],
			'reason'            => $data['reason'],
			'msg'               => $data['msg'],
			'images'            => $data['images'],
			'status'            => ($data['type'] == 1) ? 2 : 0,
			'apply_time'        => time(),
		];
		$res = self::create($refunddata);

		// 修改退货状态
		if($res){
			OrderDetail::edit([
				'id'	=>	$data['order_detail_id'],
				'refund_status'	=>	1,
			]);
			return $res;
		}
		return false;
	}

	public static function refuse($params)
	{
		// 售后订单信息
		$orderAftersaleInfo = self::getOne(['where' => [
			['id','=',$params['id']],
		]]);
		if(empty($orderAftersaleInfo)) throwException('订单数据有误');

		// 状态校验
		if(!in_array($orderAftersaleInfo['status'], [0,2])) throwException('状态不可操作');

		// 数据
		$data = [
			'id'	=>	$params['id'],
			'status'            => 4,
			'refuse_reason'     => $params['refuse_reason'],
			'audit_time'        => time(),
		];

		// 更新售后订单数据
		$res = self::edit($data);

		// 更新订单详情数据
		OrderDetail::edit([
			'id'	=> $orderAftersaleInfo['order_detail_id'],
			'refund_status'	=>	1,
		]);

		return $res;
	}

	public static function confirm($params)
	{
		// 售后订单信息
		$orderAftersaleInfo = self::getOne(['where' => [
			['id','=',$params['id']],
		]]);
		if(empty($orderAftersaleInfo)) throwException('订单数据有误');

		// 状态校验
		if($orderAftersaleInfo['status'] != 0) throwException('状态不可操作');

		// 数据
		$data = [
			'id'	=>	$params['id'],
			'status'            => 1,
			'confirm_time'     => time(),
		];

		// 更新售后订单数据
		$res = self::edit($data);
		if($res){
			return true;
		}else{
			return false;
		}
	}

	public static function audit($params)
	{
		// 售后订单
		$orderAftersaleInfo = self::getOne(['where' => [
			['id','=',$params['id']],
		]]);
		if(empty($orderAftersaleInfo)) throwException('订单数据有误');

		// 状态校验
		if($orderAftersaleInfo['status'] != 2) throwException('状态不可操作');

		// 获取订单数据
		$orderInfo = Order::getOne(['where' => ['id'=>$orderAftersaleInfo['order_id']]]);
		if(empty($orderInfo)) throwException('数据有误');

		// 历史退款金额
		$where = [
			['order_id', '=', $orderAftersaleInfo['order_id']],
			['user_id', '=', $orderAftersaleInfo['user_id']],
			['status', '=', 3],
		];
		$historyPrice = OrderAftersale::where($where)->sum('price');
		if(($orderAftersaleInfo['price'] + $historyPrice) > $orderInfo['pay_price'])
		{
			throwException('退款金额大于支付金额[ 历史退款'.$historyPrice.'元, 订单金额'.$orderInfo['pay_price'].'元 ]');
		}

		// 历史退货数量
		$where[] = ['order_detail_id', '=', $orderAftersaleInfo['order_detail_id']];
		$historyQty = OrderAftersale::where($where)->sum('qty');
		if($orderAftersaleInfo['type'] == 2)
		{
			if(($orderAftersaleInfo['qty']+$historyQty) > $orderInfo['qty_total'])
			{
				throwException('退货数量大于购买数量[ 历史退货数量 '.$historyQty.', 订单商品数量 '.$orderInfo['qty_total']);
			}
		}

		// 订单支付方式校验
		$payLogInfo = PayLog::getOne(['where' => ['order_id'=>$orderAftersaleInfo['order_id']]]);

		// 手动处理不校验支付日志
		if($params['refundment'] != 2 && empty($payLogInfo))
		{
			throwException('支付日志不存在，请使用手动处理方式');
		}

		// 原路退回(钱包支付方式使用退至钱包)/退到钱包(走事务处理)/手动处理
		$is_walet = false;
		if($params['refundment'] == 1)
		{
			if($payLogInfo['payment_id'] == 2)
			{
				$is_walet = true;
			} else {
				// 原路退回(微信支付)
				self::refundmentBack($params, $orderAftersaleInfo, $orderInfo, $payLogInfo);
			}
		} elseif($params['refundment'] == 2){
			$is_walet = true;
		} else {
			// 手动处理不涉及金额
//			return true;
		}

		// 退款事务
		return self::transaction(function () use ($is_walet, $orderAftersaleInfo,$orderInfo,$params) {
			// 钱包退款
			if($is_walet === true)
			{
				self::walletRefundment($orderAftersaleInfo, $orderInfo);
			}
			$refund_price = priceNumberFormat($orderInfo['refund_price'] + $orderAftersaleInfo['price']);
			$returned_qty = intval($orderInfo['returned_qty'] + $orderAftersaleInfo['qty']);
            $order_upd_data = [
                'id'           => $orderInfo['id'],
                'pay_status'   => ($refund_price >= $orderInfo['pay_price']) ? 2 : 3,
                'refund_price' => $refund_price,
                'returned_qty' => $returned_qty,
                'close_time'   => time(),
            ];

			// 如果退款金额和退款数量到达订单实际是否金额和购买数量则关闭订单
			if($refund_price >= $orderInfo['pay_price'] || $returned_qty >= $orderInfo['qty_total'])
			{
				$order_upd_data['status'] = 6;
			}
			// 更新主订单
			Order::edit($order_upd_data);

			// 订单详情
			$detail_upd_data = [
				'id'	=>	$orderAftersaleInfo['order_detail_id'],
				'refund_price'      => priceNumberFormat($orderInfo['refund_price'] + $orderAftersaleInfo['price']),
				'returned_qty' => intval($orderInfo['returned_qty'] + $orderAftersaleInfo['qty']),
			];
			OrderDetail::edit($detail_upd_data);

			// 库存回滚
			if(config()['paddyshop']['goods_inventory_rules'] < 3)
			{
				Goods::inventoryRollBack($orderAftersaleInfo);
			}

			// 返还积分
			// TODO 优化积分返还规则：是否退全款才返还积分
			if(!empty($orderInfo['extension_data'])){
				$userInfo = User::getOne([
					'where'=>['id'=>$orderInfo['user_id']],
					'field'=>'integral',
				]);
				foreach(json_decode($orderInfo['extension_data'],true) as $v){
					if($v['name'] == '积分抵现'){
						// 加积分
						User::where('id', $orderInfo['user_id'])->inc('integral', $v['business'])->update();
						// 写入积分日志
						UserIntegralLog::add(
							[
								'user_id' => $orderInfo['user_id'],
								'type'  => 1,
								'original_integral' => $userInfo['integral'],
								'new_integral' => $userInfo['integral'] + $v['business'],
								'operation_integral' => $v['business'],
								'msg' => '订单退款返还积分'
							]
						);
					}
				}
			}

			// 商品销量释放
			$flag = (config()['paddyshop']['goods_inventory_rules'] == 1) ? ($orderInfo['status'] == 4) : ($orderInfo['pay_status'] != 0);
			if($flag && $orderAftersaleInfo['qty'] > 0)
			{
				$goodsInfo = Goods::getOne(['where'=>['id'=>$orderAftersaleInfo['goods_id']]]);
				Goods::edit([
					'id' => $orderAftersaleInfo['goods_id'],
					'sales_count'	=>  $goodsInfo['sales_count'] - $orderAftersaleInfo['qty'],
				]);
			}

			// 消息通知
			$detail = '订单退款成功，金额'.priceNumberFormat($orderAftersaleInfo['price']).'元';
            UserMessage::add([
                'user_id'     => $orderInfo['user_id'],
                'title'       => '订单退款',
                'detail'      => $detail,
                'business_id' => $orderInfo['id'],
            ]);

			// 更新退款状态
			$data = [
				'id'	=>	$orderAftersaleInfo['id'],
				'status'        => 3,
				'refundment'    => $params['refundment'],
				'audit_time'    => time(),
			];
			// 仅退款是否退了数量
			if(config()['paddyshop']['goods_inventory_rules'] < 3)
			{
				$data['qty'] = $orderAftersaleInfo['qty'];
			}
			// 数据更新
			OrderAftersale::edit($data);
			return true;
		});
	}

	/**
	 * 退至钱包
	 * @author  Alan Leung
	 */
	private static function walletRefundment($orderAftersaleInfo, $orderInfo)
	{
		// 获取用户钱包校验
		$walletInfo = Wallet::getOne(['where' => ['user_id' => $orderInfo['user_id']]]);
		if(empty($walletInfo)) throwException('钱包数据有误');

		// 钱包更新数据
		$data = [
			'id'	=> $walletInfo['id'],
			'normal_money'      => priceNumberFormat($walletInfo['normal_money'] + $orderAftersaleInfo['price']),
		];
		Wallet::edit($data);

		// 钱包变更日志
		$msg = $orderInfo['order_no'].'订单退款'.$orderAftersaleInfo['price'].'元';
		$log_data = [
			'user_id'           => $walletInfo['user_id'],
			'wallet_id'         => $walletInfo['id'],
			'serial_no'		=> date('YmdHis').getNumberCode(6),
			'business_type'     => 0,
			'operation_type'    => 1,
			'money_type'        => 0,
			'operation_money'   => $orderAftersaleInfo['price'],
			'original_money'    => $walletInfo['normal_money'],
			'latest_money'      => $data['normal_money'],
			'msg'               => $msg,
		];
		WalletLog::add($log_data);

		//TODO退款日志

		// 消息通知
		UserMessage::add([
			'user_id'	=> $orderInfo['user_id'],
			'title'	=>	'账户余额变动',
			'detail'	=>	$msg,
			'business_id'	=> $orderInfo['id'],
		]);
		return true;
	}

	private static function refundmentBack($params, $orderAftersaleInfo,$orderInfo,$payLogInfo)
	{
		// 交易平台单号
		if(empty($payLogInfo['trade_no'])) throwException('平台单号为空，请确认支付日志是否存在');

		// 操作退款
		$app = self::wxPayConfig();
		$result = $app->refund->byOutTradeNumber($orderInfo['order_no'], date('YmdHis').getNumberCode(6), $payLogInfo['pay_price'], $orderAftersaleInfo['price'], [
			// 可在此处传入其他参数，详细参数见微信支付文档
			'refund_desc' => $orderInfo['order_no'].'订单退款'.$orderAftersaleInfo['price'].'元',
		]);
		if ($result['return_code'] === 'SUCCESS') {
			if ($result['result_code'] === 'SUCCESS') {
				// 写入退款日志
				$refund_log = [
					'user_id'       => $orderInfo['user_id'],
                    'order_id'  => $orderInfo['id'],
					'business_id'   => $orderInfo['id'],
					'pay_price'     => $orderInfo['pay_price'],
					'trade_no'      => $result['out_trade_no'] ?? '',
					'buyer_user'    => '',
					'refund_price'  => $result['refund_fee'] ?? '',
//					'msg'           => $pay_params['refund_reason'],
					'msg'           => '',
					'payment'       => $payLogInfo['payment'] ?? '', // TODO 处理payment
					'payment_name'  => $payLogInfo['payment_name'] ?? '', //TODO 处理payment_name
					'refundment'    => $params['refundment'],
					'business_type' => 0,
//					'return_params' => isset($ret['data']['return_params']) ? $ret['data']['return_params'] : '',
				];
				RefundLog::add($refund_log);
				return true;
			}else{
                throwException(($result['err_code'] ?? '').'|'.($result['err_code_des'] ?? ''));
            }
		}
		throwException($result['return_msg'] . '|'.($result['err_code'] ?? '').'|'.($result['err_code_des'] ?? ''));
	}

	/**
	 * 退货发货操作
	 * @author  Alan Leung
	 */
	public static function delivery($data)
	{
		// 获取申请数据
		$where = [
			'order_detail_id'        => intval($data['order_detail_id']),
			'user_id'   => $data['user']['id'],
		];
		$orderAftersaleInfo = OrderAftersale::getOne(['where'=>$where]);
		if(empty($orderAftersaleInfo)) throwException('数据不存在或已删除');

		// 状态
		if($orderAftersaleInfo['type'] == 0) throwException('该售后订单为仅退款，不能操作退货操作');
		if($orderAftersaleInfo['status'] != 1) throwException('该售后订单状态不可操作');

		if(OrderAftersale::edit([
			'id'	=>	$orderAftersaleInfo['id'],
			'status'	=> 2,
			'express_name'	=>	$data['express_name'],
			'express_number'	=>	$data['express_number'],
			'delivery_time'	=>	time(),
		])){
			return true;
		}
		return false;
	}

	/**
	 * 取消退款
	 * @author  Alan Leung
	 */
	public static function cancel($data)
	{
		$where = [
			'order_detail_id'        => intval($data['order_detail_id']),
			'user_id'   => $data['user']['id'],
		];
		$orderAftersaleInfo = OrderAftersale::getOne(['where'=>$where]);
		if(empty($orderAftersaleInfo)) throwException('数据不存在或已删除');

		// 状态
		if($orderAftersaleInfo['status'] > 2) throwException('该售后订单状态不可操作');

		if(OrderAftersale::edit([
			'id'	=>	$orderAftersaleInfo['id'],
			'status'	=> 5,
			'cancel_time' => time(),
		])){
			return true;
		}
		return false;
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
				'cert_path'          => file_exists(root_path().'wechatpay_apiclient_cert.pem') ? root_path().'wechatpay_apiclient_cert.pem' : '',
				'key_path'           => file_exists(root_path().'wechatpay_apiclient_key.pem') ? root_path().'wechatpay_apiclient_key.pem' : '',
				// 回调地址
				'notify_url'         => config()['paddyshop']['website_url'].'api/order.order/wxPayNotify/ish5/1',
				//  设置为false 或注释则关闭沙箱模式
				'sandbox'       => false,
			];
		}else{
			$config = [
				// 必要配置
				'app_id'             => config()['paddyshop']['weixinminiapp_appid'],
				'mch_id'             => config()['paddyshop']['weixinpay_mch_id'],
				'key'                => config()['paddyshop']['weixinpay_key'],
				// 如需使用敏感接口（如退款、发送红包等）需要配置 API 证书路径(登录商户平台下载 API 证书)
				'cert_path'          => file_exists(root_path().'wechatpay_apiclient_cert.pem') ? root_path().'wechatpay_apiclient_cert.pem' : '',
				'key_path'           => file_exists(root_path().'wechatpay_apiclient_key.pem') ? root_path().'wechatpay_apiclient_key.pem' : '',
				// 回调地址
				'notify_url'         => config()['paddyshop']['website_url'].'api/order.order/wxPayNotify',
				// 设置为 false 或注释则关闭沙箱模式
				'sandbox'       => false,
			];
		}

		return EasyWeChat::payment($config);
	}

}