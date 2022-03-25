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
namespace app\admin\controller\marketing;

use app\admin\controller\PaddyshopAdmin;
use app\common\model\CouponUser as CouponUserModel;

/**
 * 优惠券记录控制器
 * @Author: Alan Leung
 */
class CouponUser extends PaddyshopAdmin
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
	public function list()
	{
		$current    = getParams('current');
		$size       = getParams('size');

		$params = [
			'current'   =>  $current,
			'size'      =>  $size,
//			'where'     =>  $this->whereBuilder(),
			'with'      => ['userInfo','couponInfo'],
		];
		$result             = CouponUserModel::list($params);

		return app('JsonOutput')->success($result);
	}
}