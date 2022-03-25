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
 * 优惠券验证器
 * @Author: Alan Leung
 */
class Coupon extends Validate
{
	/**
	 * 设置表名
	 * @var bool
	 */
	protected $name = 'user';

	protected $rule = [
		'id'            => 'require|integer',
		'name'        => 'require|chsAlphaNum',
		'desc'        => 'chsAlphaNum',
		'type'         => 'integer',
		'value'        => 'require|float',
		'expire_type'      => 'integer',
		 'expire_hour'      => 'integer',
		 'start_time'      => 'date',
		 'end_time'      => 'date',
		 'min_order_price'      => 'require|float',
		 'apply_range'      => 'integer',
		 'apply_range_config'        => 'array',
		 'total_qty'      => 'integer',
		 'sort'          => 'integer',
		 'is_enable'       => 'boolean',
		'is_user_receive'       => 'boolean',
		'is_reg_send'       => 'boolean',
	];

	protected $message  =   [

	];

	protected $scene = [
		'add'   =>  ['name','desc','type','value','expire_type','expire_hour','start_time','end_time','min_order_price','apply_range','total_qty','sort','is_enable','is_user_receive','is_reg_send'],
		'edit'  =>  ['id','name','desc','type','value','expire_type','expire_hour','start_time','end_time','min_order_price','apply_range','total_qty','sort','is_enable','is_user_receive','is_reg_send'],
		'del'   =>  ['id'],
	];
}