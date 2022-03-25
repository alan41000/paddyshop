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
namespace app\api\controller\order;

use app\api\controller\PaddyshopApi;
use app\api\validate\Order as OrderValidate;
use app\common\model\Order as OrderModel;
use app\common\model\Goods as GoodsModel;
use app\common\model\UserMessage as UserMessageModel;
use think\exception\ValidateException;

class Order extends PaddyshopApi
{
    /**
     * 构造方法
     * @Author: Alan Leung
     */
    public function __construct()
    {
        // 调用父类前置方法
        parent::__construct();
    }

    /**
     * 订单确认
     * @Author: Alan Leung
     */
    public function confirm()
    {
		try{
	        // $goods = [
	        //     [
	        //         'goods_id'       =>  14,
	        //         'sku_value_id'   =>  88,
	        //         'qty'            =>  3,
	        //     ],
	        //     [
	        //         'goods_id'       =>  13,
	        //         'sku_value_id'   =>  88,
	        //         'qty'            =>  3,
	        //     ],
	        // ];
	        // dump json_encode($goods);die;
	        $goods    = json_decode(getParams('goods'),true);
	        $buy_type = getParams('buy_type');
	        $coupon   = getParams('coupon');

	        $data     = [
	            'goods'     => $goods,
	            'buy_type'  => $buy_type,
	            'user'      => $this->user,
	            'coupon'    => $coupon,
	        ];
			$res =  OrderModel::confirm($data);
			return app('JsonOutput')->success($res);
		}catch (\Exception $e){
			return app('JsonOutput')->fail($e->getMessage());
		}
    }

    /**
     * 订单添加
     * @Author: Alan Leung
     */
    public function add()
    {
        try
        {
            $goods          = json_decode(getParams('goods'),true);
            $buy_type       = getParams('buy_type');
            $coupon         = getParams('coupon');
            $payment_id     = getParams('payment_id');
            $address        = json_decode(getParams('address'),true);
            $user_note      = getParams('user_note');

            $data     = [
                'goods'         => $goods,
                'buy_type'      => $buy_type,
                'user'          => $this->user,
                'coupon'        => $coupon,
                'payment_id'    => $payment_id,
                'user_note'     => $user_note,
                'address'       => $address,
            ];
            validate(OrderValidate::class)->scene('add')->check($data);
            $res = OrderModel::add($data);
            if($res !== false && !empty($res) && is_array($res))
            {
                return app('JsonOutput')->success($res);
            }
            else
            {
                return app('JsonOutput')->fail($res);
            }
        }
        catch(\Exception $e)
        {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

    /**
     * 订单列表
     * @Author: Alan Leung
     */    
    public function list()
    {
        $where      = [];
        $current    = getParams('current');
        $size       = getParams('size');
        $status     = getParams('status');

        $where[]    = ['user_id','=',$this->user['id']];
        if(is_numeric($status)) $where[] = ['status','=',$status];
        if($status == 4) $where[] = ['user_is_comments','=',0];
        $params     = [
            'current'   =>  $current,
            'size'      =>  $size,
            'where'     =>  $where,
            'with'      =>  ['orderDetail'],
        ];
        $result   = OrderModel::list($params);

        return app('JsonOutput')->success($result);
    }
    
    /**
     * 取消订单
     * @Author: Alan Leung
     */    
    public function cancel()
    {
        try
        {
            $id = getParams('order_id');
            if(empty($id) || !is_numeric($id)) throwException('参数有误');
            
            $cancel_data = [
                'id'            =>  $id,
                'cancel_time'   =>  time(),
                'status'        =>  5
            ];
            $res = OrderModel::edit($cancel_data);
            if($res)
            {
                // 用户消息
                $msg_data = [
                    'user_id'       =>  $this->user['id'],
                    'title'         =>  '订单取消',
                    'detail'        =>  '订单取消成功',
                    'business_id'   =>  $id,
                    'business_type' =>  1,
                ];
                UserMessageModel::add($msg_data);
                return app('JsonOutput')->success();
            }
            else
            {
                return app('JsonOutput')->fail();
            }
        }
        catch(\Exception $e)
        {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

    /**
     * 获取一条订单信息
     * @Author: Alan Leung
     */    
    public function getOne()
    {
        try
        {
            $id = getParams('order_id');
            if(empty($id) || !is_numeric($id)) throwException('参数有误');
            
            $res = OrderModel::getOne([
                'where' => ['id' => $id],
                'with'  => ['orderDetail','addressInfo'],
            ]);
            if($res)
            {
                return app('JsonOutput')->success($res);
            }
            else
            {
                return app('JsonOutput')->fail();
            }
        }
        catch(\Exception $e)
        {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

    /**
     * 支付
     * @Author: Alan Leung
     */    
    public function pay()
    {
        try{
            $order_id       = getParams('order_id');
            $payment_id     = getParams('payment_id');
			$isH5   = getParams('isH5');
            $data = [
                'order_id'          =>  $order_id,
                'user'              =>  $this->user,
                'payment_id'        =>  $payment_id,
	            'isH5'  => empty($isH5) ? false : $isH5,
            ];
            $res = OrderModel::pay($data);
            if($res)
            {
                return app('JsonOutput')->success($res);
            }
            else
            {
                return app('JsonOutput')->fail();
            }
        }
        catch(\Exception $e){
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

    /**
     * 微信支付回调
     * @Author: Alan Leung
     */    
    public function wxPayNotify()
    {
        try{
            // $result = empty($GLOBALS['HTTP_RAW_POST_DATA']) ? xmlToArray(file_get_contents('php://input')) : xmlToArray($GLOBALS['HTTP_RAW_POST_DATA']);
            // file_put_contents('test.txt', json_encode($result));
	        $isH5 = getParams('ish5');
			if(!empty($isH5) && $isH5 == 1){
				$isH5 = true;
			}else{
				$isH5 = false;
			}

            if(OrderModel::notify('Weixin',$isH5) === true)
            {
                return xml(['return_code' => 'SUCCESS', 'return_msg' => 'OK']);
            }
            return xml(['return_code' => 'FAIL']);
        }catch(\Exception $e){        
            trace($e->getMessage(), 'error');
            return xml(['return_code' => 'FAIL']);
        }
    }

    /**
     * 确认收货
     * @Author: Alan Leung
     */    
    public function receipt()
    {
        try
        {
            $id = getParams('order_id');
            if(empty($id) || !is_numeric($id)) throwException('参数有误');
            
            $cancel_data = [
                'id'            =>  $id,
                'collect_time'  =>  time(),
                'status'        =>  4
            ];
            $res = OrderModel::edit($cancel_data);
            if($res)
            {
                // 库存扣除：确认收货减库存
                if(config()['paddyshop']['goods_inventory_rules'] == '3'){
                    GoodsModel::inventoryDeduct($id);
                }
                return app('JsonOutput')->success();
            }
            else
            {
                return app('JsonOutput')->fail();
            }
        }
        catch(\Exception $e)
        {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

	/**
	 * 订单状态数量统计
	 * @Author: Alan Leung
	 */
	public function  getOrderCounts()
	{
		$result = [0,0,0,0];
		// 待付款
		$result[0] = OrderModel::count([
			'field'   =>  'user_id,status',
			'where'     =>  [
				['user_id','=',$this->user['id']],
				['status','=',1],
			],
		]);
		// 待发货
		$result[1] =  OrderModel::count([
			'field'   =>  'user_id,status',
			'where'     =>  [
				['user_id','=',$this->user['id']],
				['status','=',2],
			],
		]);
		// 待收货
		$result[2] = OrderModel::count([
			'field'   =>  'user_id,status',
			'where'     =>  [
				['user_id','=',$this->user['id']],
				['status','=',3],
			],
		]);
		// 待评价
		$result[3] = OrderModel::count([
			'field'   =>  'user_id,status,user_is_comments',
			'where'     =>  [
				['user_id','=',$this->user['id']],
				['status','=',4],
				['user_is_comments','=',0],
			],
		]);

		return app('JsonOutput')->success($result);
	}
}