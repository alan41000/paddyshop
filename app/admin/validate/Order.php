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

namespace app\admin\validate;

use think\Validate;

/**
 * 订单验证器
 * @Author: Alan Leung
 */
class Order extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'order';
    
    protected $rule = [
        'id'            => 'require|integer|gt:0',
        'status'        => 'require|integer',
        'delivery_time' => 'integer|integer|gt:0',
        'express_id'    => 'require|integer|gt:0',
        'express_number'=> 'require',
    ];
    
    protected $message  =   [
        'id.require'                    => '参数有误',
        'id.integer'                    => '参数有误',
        'id.gt'                         => '参数有误',
        'status.require'                => '状态参数有误',
        'status.integer'                => '状态参数有误',
        'delivery_time.require'         => '发货时间有误',
        'delivery_time.integer'         => '发货时间有误',
        'express_id.integer'            => '快递参数有误',
        'express_number.require'        => '请输入快递单号',
    ];

    protected $scene = [
        'delivery'   =>  ['id','status','delivery_time','express_id','express_number'],
    ];
}