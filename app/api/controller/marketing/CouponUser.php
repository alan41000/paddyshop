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
use app\common\model\CouponUser as CouponUserModel;
use think\exception\ValidateException;

class CouponUser extends PaddyshopApi
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
	public  function list(int $type = 0)
	{
		$where      = [
			['user_id','=',$this->user['id']],
		];

		switch ($type){
			// 未使用
			case  0:
				$where[] = ['use_time','=',0];
				$where[] = ['end_time','>',time()];
				break;

			// 已使用
			case  1:
				$where[] = ['use_time','>',0];
				break;

			// 已过期
			case  2:
				$where[] = ['use_time','=',0];
				$where[] = ['end_time','<',time()];
				break;

			default:
		}
		$current    = getParams('current');
		$size       = getParams('size');

		$params     = [
			'current'   =>  $current,
			'size'      =>  $size,
			'where'     =>  $where,
			'with'      => ['couponInfo']
		];
		$result   = CouponUserModel::list($params);

		return app('JsonOutput')->success($result);
	}

	/**
	 * 领券
	 * @Author: Alan Leung
	 */
	public  function  receive(int $coupon_id)
	{
		$data = [
			'coupon_id'        =>  $coupon_id,
			'user_id'      =>  $this->user['id'],
		];

		try {
			// 领券前校验
			$res_check = CouponUserModel::checkReceive($data);
			if($res_check === true){
				CouponUserModel::send($data);
				return app('JsonOutput')->success();
			}
			return app('JsonOutput')->fail();
		} catch (ValidateException $e) {
			return app('JsonOutput')->fail($e->getError());
		} catch (\Exception $e) {
			return app('JsonOutput')->fail($e->getMessage());
		}
	}
}