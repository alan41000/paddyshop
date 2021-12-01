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
namespace app\admin\controller\order;

use app\admin\controller\PaddyshopAdmin;
use app\admin\validate\Order as OrderValidate;
use app\common\model\Order as OrderModel;
use think\exception\ValidateException;

/**
 * 订单控制器
 * @Author: Alan Leung
 */
class Order extends PaddyshopAdmin
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
     * 列表
     * @Author: Alan Leung
     */
    public static function list()
    {
        $current    = getParams('current');
        $size       = getParams('size');
        $where      = self::whereBuilder();
        $params = [
            'current'   =>  $current,
            'size'      =>  $size,
            'where'     =>  $where,
            'with'      =>  ['orderDetail','userInfo','addressInfo']
        ];
        $result   = OrderModel::list($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 发货
     * @Author: Alan Leung
     */    
    public static function delivery()
    {
        try {
            $orderId        = getParams('data')['order_id'];
            $expressId      = getParams('data')['express_id'];
            $expressNumber  = getParams('data')['express_number'];
            $orderInfo      = OrderModel::getOne(['where'=>['id'=>$orderId]]);
            if(empty($orderInfo) || $orderInfo['status'] !== 2){
                throwException('订单数据有误');
            }
            $orderData = [
                'id'            =>  $orderId,
                'status'        =>  3,
                'delivery_time' =>  time(),
                'express_id'    =>  $expressId,
                'express_number'=>  $expressNumber,
            ];
            validate(OrderValidate::class)->scene('delivery')->check($orderData);
            if(OrderModel::edit($orderData)){
                return app('JsonOutput')->success();
            }
            return app('JsonOutput')->fail();
        } catch (ValidateException $e) {
            return app('JsonOutput')->fail($e->getError());
        } catch (\Exception $ee) {
            return app('JsonOutput')->fail($ee->getMessage());
        }
    }

    private static function whereBuilder()
    {
        $where = [];
        $order_no = getParams('order_no');
        if(!empty($order_no)){
            $where[] = ['order_no','=',$order_no];
        }
        $status = getParams('status');
        if(is_numeric($status)){
            $where[] = ['status','=',$status];
        }

        return $where;
    }
}