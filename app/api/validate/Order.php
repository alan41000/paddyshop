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

namespace app\api\validate;

use think\Validate;

/**
 * 购物车验证器
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
        'goods'         => 'require|array',
        'buy_type'      => 'require|alpha',
        'user'          => 'require|array',
        'coupon'        => 'integer|gt:0',
        'payment_id'    => 'require|integer|gt:0',
        'address'       => 'require|array',
        'user_note'     => 'chsDash',
    ];
    
    protected $message  =   [
        'goods.require'         => '请选择下单商品',
        'goods.array'           => '商品数据有误',
        'buy_type.require'      => '请选择购买类型',
        'buy_type.alpha'        => '购买类型数据有误',
        'user.require'          => '用户数据有误',
        'user.array'            => '用户数据格式有误',
        'coupon.integer'        => '优惠券数据有误',
        'payment_id.require'    => '请选择支付方式',
        'payment_id.integer'    => '支付方式数据有误',
        'payment_id.gt'         => '请选择支付方式',
        'address.require'       => '请选择收货地址',
        'address.array'         => '规格数据有误',
        'user_note.chsDash'     => '用户留言仅支持汉字、字母、数字和下划线_及破折号-',
    ];

    protected $scene = [
        'add' =>  ['goods','buy_type','user','coupon','payment_id','address','user_note'],
    ];
}