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
use app\admin\validate\Coupon as CouponValidate;
use app\common\model\Coupon as CouponModel;
use app\common\model\Goods as GoodsModel;
use think\exception\ValidateException;

/**
 * 优惠券控制器
 * @Author: Alan Leung
 */
class Coupon extends PaddyshopAdmin
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
		];
		$result             = CouponModel::list($params);

		return app('JsonOutput')->success($result);
	}

	public  function  add()
	{
		$name          = getParams('name');
		$desc        = getParams('desc');
		$min_order_price  = getParams('min_order_price');
		$type   = getParams('type');
		$value      = $type == 0 ? getParams('value_price') : getParams('value_rate');
		$expire_type    = getParams('expire_type');
		$expire_hour            = getParams('expire_hour');
		$start_time    = getParams('start_time');
		$end_time         = getParams('end_time');
		$apply_range      = getParams('apply_range');
		if($apply_range == 1){
			$apply_range_config      =  getParams('category_ids');
		}else if($apply_range == 2){
			$apply_range_config      =  getParams('goods_ids');
		}else{
			$apply_range_config = '';
		}
		$total_qty      = getParams('total_qty');
		$sort      = getParams('sort');
		$is_enable      = getParams('is_enable');
		$is_user_receive      = getParams('is_user_receive');
		$is_reg_send      = getParams('is_reg_send');

		$data = [
			'name'         =>  $name,
			'desc'       =>  empty($desc) ? '' : $desc,
			'min_order_price' => $min_order_price,
			'type'   =>  $type,
			'value'      =>  $value,
			'expire_type'   =>  $expire_type,
			'expire_hour'           =>  $expire_hour,
			'start_time'   =>  empty($start_time) ? '1970-01-01 08:00:00' : $start_time[0],
			'end_time'        =>  empty($end_time) ? '1970-01-01 08:00:00' : $end_time[1],
			'apply_range'        =>  $apply_range,
			'apply_range_config'        =>  $apply_range_config,
			'total_qty'        =>  $total_qty,
			'sort'        =>  $sort,
			'is_enable'     =>  $is_enable,
			'is_user_receive'     =>  $is_user_receive,
			'is_reg_send'     =>  $is_reg_send,
		];

		try {
			validate(CouponValidate::class)->scene('add')->check($data);
			if(CouponModel::add($data))
			{
				return app('JsonOutput')->success();
			}
			else
			{
				return app('JsonOutput')->fail();
			}
		} catch (ValidateException $ee) {
			return app('JsonOutput')->fail($ee->getError());
		} catch (\Exception $e) {
			return app('JsonOutput')->fail($e->getMessage());
		}
	}

	public  function  edit()
	{
		$id          = getParams('id');
		$name          = getParams('name');
		$desc        = getParams('desc');
		$min_order_price  = getParams('min_order_price');
		$type   = getParams('type');
		$value      = $type == 0 ? getParams('value_price') : getParams('value_rate');
		$expire_type    = getParams('expire_type');
		$expire_hour            = getParams('expire_hour');
		$start_time    = getParams('expire_time');
		$end_time         = getParams('expire_time');
		$apply_range      = getParams('apply_range');
		if($apply_range == 1){
			$apply_range_config      =  getParams('category_ids');
		}else if($apply_range == 2){
			$apply_range_config      =  getParams('goods_ids');
		}else{
			$apply_range_config = '';
		}
		$total_qty      = getParams('total_qty');
		$sort      = getParams('sort');
		$is_enable      = getParams('is_enable');
		$is_user_receive      = getParams('is_user_receive');
		$is_reg_send      = getParams('is_reg_send');

		$data = [
			'id'         =>  $id,
			'name'         =>  $name,
			'desc'       =>  $desc,
			'min_order_price' => $min_order_price,
			'type'   =>  $type,
			'value'      =>  $value,
			'expire_type'   =>  $expire_type,
			'expire_hour'           =>  $expire_hour,
			'start_time'   =>  empty($start_time) ? '1970-01-01 08:00:00' : $start_time[0],
			'end_time'        =>  empty($end_time) ? '1970-01-01 08:00:00' : $end_time[1],
			'apply_range'        =>  $apply_range,
			'apply_range_config'        =>  empty($apply_range_config) ? '' : $apply_range_config,
			'total_qty'        =>  $total_qty,
			'sort'        =>  $sort,
			'is_enable'     =>  $is_enable,
			'is_user_receive'     =>  $is_user_receive,
			'is_reg_send'     =>  $is_reg_send,
		];

		try {
			validate(CouponValidate::class)->scene('edit')->check($data);
			if(CouponModel::edit($data))
			{
				return app('JsonOutput')->success();
			}
			else
			{
				return app('JsonOutput')->fail();
			}
		} catch (ValidateException $ee) {
			return app('JsonOutput')->fail($ee->getError());
		} catch (\Exception $e) {
			return app('JsonOutput')->fail($e->getMessage());
		}
	}

	/**
	 * 删除
	 * @Author: Alan Leung
	 */
	public function del()
	{
		$id = getParams('id');
		$data = ['id'=>$id];

		try {
			validate(CouponValidate::class)->scene('del')->check($data);
			if(CouponModel::del($data))
			{
				return app('JsonOutput')->success();
			}
			else
			{
				return app('JsonOutput')->fail();
			}
		} catch (ValidateException $e) {
			return app('JsonOutput')->fail($e->getError());
		}
	}

	/**
	 * 条件构造器
	 * @Author: Alan Leung
	 */
	private function whereBuilder()
	{
		$name = getParams('name');
		$where = [];
		if(!empty($name)){
			$where[] = ['name','like','%'.$name.'%'];
		}
		return $where;
	}

	/**
	 * 优惠券关联商品列表
	 * @Author: Alan Leung
	 */
	public function goodsListForCoupon()
	{
		try {
			$is_shelves = getParams('is_shelves');
			$data_params = [
				'with'		=> ['goodsCategory'],
				'where'		=> ['is_shelves' => $is_shelves],
			];
			$ret = GoodsModel::getAll($data_params);
			$retData = [];
			if(!empty($ret))
			{
				foreach($ret as $k=>$v)
				{
					$retData[$k]['key'] 		= $v['id'];
					$retData[$k]['label']		= $v['title'];
				}
			}
			return app('JsonOutput')->success($retData);
		} catch (\Exception $e) {
			return app('JsonOutput')->fail($e->getMessage());
		}

	}
}