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
namespace app\admin\controller\finance;

use app\admin\controller\PaddyshopAdmin;
use app\common\model\PayLog as PayLogModel;

/**
 * 支付日志
 * @Author: Alan Leung
 */
class Paylog extends PaddyshopAdmin
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
            'with'      =>  ['userInfo'],
            'where'     =>  $where,
        ];
        $result = PayLogModel::list($params);
        return app('JsonOutput')->success($result);
    }

    private static function whereBuilder()
    {
        $where = [];
        $payment_id = getParams('payment_id');
        if(!empty($payment_id)){
            $where[] = ['payment_id','=',$payment_id];
        }
        $trade_no = getParams('trade_no');
        if(!empty($trade_no)){
            $where[] = ['trade_no','=',$trade_no];
        }
        $buyer_user = getParams('buyer_user');
        if(!empty($buyer_user)){
            $where[] = ['buyer_user','=',$buyer_user];
        }
        $user_id = getParams('user_id');
        if(!empty($user_id)){
            $where[] = ['user_id','=',$user_id];
        }

        return $where;
    }
}