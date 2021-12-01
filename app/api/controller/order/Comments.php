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
use app\common\model\GoodsComments as GoodsCommentsModel;
use think\exception\ValidateException;

class Comments extends PaddyshopApi
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
     * 获取订单评价信息
     * @Author: Alan Leung
     */    
    public function getOrderCommentsInfo()
    {
        try{
            $orderId = getParams('orderId');
            $orderInfo = OrderModel::getOne([
                'where' =>  ['id' => $orderId],
                'with'  =>  ['commentsGoodsInfo'],
            ]);
            if(empty($orderInfo) || $orderInfo['user_is_comments'] > 0) throwException('订单数据有误');
            return app('JsonOutput')->success($orderInfo);
        }catch(\Exception $e){
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

    public function addOrderComments()
    {
        try{
            $orderId = getParams('orderId');
            $goods = getParams('goods');
            $isAnonymous = getParams('isAnonymous');
            $data = [
                'order_id'  =>  $orderId,
                'user_id'   =>  $this->user['id'],
                'goods'     =>  $goods,
                'is_anonymous'  =>  $isAnonymous,
            ];
            if(GoodsCommentsModel::add($data));{
                return app('JsonOutput')->success();
            }
            return app('JsonOutput')->fail();
        }catch(\Exception $e){
            return app('JsonOutput')->fail($e->getMessage());
        }
    }
}