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
class Cart extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'cart';
    
    protected $rule = [
        'id'            => 'require|integer|gt:0',
        'ids'           => 'require|array',
        'user_id'       => 'require|integer|gt:0',
        'goods_id'      => 'require|integer|gt:0',
        'qty'           => 'require|integer|gt:0',
        'sku_value_id'  => 'require|integer|gt:0',
    ];
    
    protected $message  =   [
        'id.require'            => '参数有误',
        'id.integer'            => '参数有误',
        'ids.require'           => '参数有误',
        'ids.array'             => '参数有误',
        'user_id.require'       => '用户数据有误',
        'user_id.integer'       => '用户数据有误',
        'goods_id.require'      => '请选择商品',
        'goods_id.integer'      => '商品数据有误',
        'qty.require'           => '请输入数量',
        'qty.integer'           => '数量数据有误',
        'sku_value_id.require'  => '请选择商品规格',
        'sku_value_id.integer'  => '规格数据有误',
    ];

    protected $scene = [
        'add'           =>  ['user_id','goods_id','qty','sku_value_id'],
        'updateNum'     =>  ['id','qty'],
        'del'           =>  ['ids'],
        'moveFavorites' =>  ['ids'],
    ];
}