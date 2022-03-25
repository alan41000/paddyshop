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
namespace app\api\controller\marketing;

use app\api\controller\PaddyshopApi;
use app\common\model\Coupon as CouponModel;

class Coupon extends PaddyshopApi
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
	 * 优惠券列表（领券中心）
	 * @Author: Alan Leung
	 */
	public  function couponList()
	{
		$where      = [
			['is_enable','=',1],
			['is_user_receive','=',1],
		];
		$current    = getParams('current');
		$size       = getParams('size');

		$params     = [
			'current'   =>  $current,
			'size'      =>  $size,
			'where'     =>  $where,
		];
		$result   = CouponModel::list($params);

		return app('JsonOutput')->success($result);
	}

	/**
	 * 商品可用优惠券列表
	 * @Author: Alan Leung
	 */
	public  function  goodsCouponList(int $goods_id)
	{
		$couponList = CouponModel::inApplyRangeCouponList($goods_id);
		return app('JsonOutput')->success($couponList);
	}
}