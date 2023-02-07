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
 * 订单售后验证器
 * @Author: Alan Leung
 */
class OrderAftersale extends Validate
{
	/**
	 * 设置表名
	 * @var bool
	 */
	protected $name = 'order_aftersale';

	protected $rule = [
		'id'            => 'require|integer|gt:0',
		'order_no'	=>	'require|integer|gt:0',
		'order_id'         => 'require|integer|gt:0',
		'order_detail_id'      => 'require|integer|gt:0',
		'goods_id'      => 'require|integer|gt:0',
		'user_id'      => 'require|integer|gt:0',
		'status'    => 'require|integer',
		'type'       => 'require|integer|gt:0',
		'reason'     => 'require',
//		'qty'      => 'require|integer|gt:0',
		'price'		=>	'require|float|gt:0',
		'msg'		=>	'require|chsDash',
//		'images'	=>	'require|chsDash',
		'express_name'	=>	'require',
		'express_number'	=>	'require',
	];

	protected $message  =   [
		'id.require'         => '参数有误',
		'id.integer'         => '参数有误',
		'id.gt'         => '参数有误',
		'order_no.require'           => '订单号有误',
		'order_no.integer'           => '订单号有误',
		'order_no.gt'           => '订单号有误',
		'order_id.require'           => '订单号有误',
		'order_id.integer'           => '订单号有误',
		'order_id.gt'           => '订单号有误',
		'order_detail_id.require'      => '订单详情有误',
		'order_detail_id.integer'      => '订单详情有误',
		'order_detail_id.gt'      => '订单详情有误',
		'goods_id.require'      => '商品参数有误',
		'goods_id.integer'      => '商品参数有误',
		'goods_id.gt'      => '商品参数有误',
		'user_id.require'      => '用户数据有误',
		'user_id.integer'      => '用户数据有误',
		'user_id.gt'      => '用户数据有误',
		'type.require'      => '请选择退款类型',
		'type.integer'      => '退款类型有误',
		'type.gt'      => '退款类型有误',
		'reason.require'      => '请选择退款原因',
		'qty.require'      => '请选择退款数量',
		'qty.integer'      => '退款数量有误',
		'qty.gt'      => '退款数量有误',
		'price.require'      => '请输入退款金额',
		'price.float'      => '退款金额有误',
		'price.gt'      => '退款金额有误',
		'msg.require'      => '请输入退款退款说明',
		'msg.chsDash'      => '退款说明仅支持汉字、字母、数字和下划线_及破折号-',
	];

	protected $scene = [
		'add' =>  ['order_no','order_id','order_detail_id','goods_id','user_id','type','reason','qty','price','msg'],
		'delivery' =>  ['order_detail_id','express_name','express_number'],
		'cancel' =>  ['order_detail_id'],
	];
}