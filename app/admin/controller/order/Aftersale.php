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
namespace app\admin\controller\order;

use app\admin\controller\PaddyshopAdmin;
//use app\admin\validate\OrderAftersale as OrderAftersaleValidate;
use app\common\model\OrderAftersale as OrderAftersaleModel;
use think\exception\ValidateException;

/**
 * 售后控制器
 * @Author: Alan Leung
 */
class Aftersale extends PaddyshopAdmin
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
			'where'     =>  $where,
			'with'      =>  ['orderDetail','userInfo','addressInfo']
		];
		$result   = OrderAftersaleModel::list($params);

		return app('JsonOutput')->success($result);
	}

	public  function  audit()
	{
		try{
			$id = getParams('id');
			$refundment = getParams('refundment');
			$params = [
				'id'   =>  $id,
				'refundment'	=>	$refundment,
			];
			$res   = OrderAftersaleModel::audit($params);
			if($res){
				return app('JsonOutput')->success();
			}
			return app('JsonOutput')->fail();
		}catch (\Exception $e){
			return app('JsonOutput')->fail($e->getMessage());
		}
	}

	/**
	 * 拒绝
	 * @Author: Alan Leung
	 */
	public function refuse()
	{
		try{
			$id = getParams('id');
			$refuse_reason = getParams('refuse_reason');
			$params = [
				'id'   =>  $id,
				'refuse_reason'	=>	$refuse_reason,
			];
			$res   = OrderAftersaleModel::refuse($params);
			if($res){
				return app('JsonOutput')->success();
			}
			return app('JsonOutput')->fail();
		}catch (\Exception $e){
			return app('JsonOutput')->fail($e->getMessage());
		}
	}

	/**
	 * 确认
	 * @Author: Alan Leung
	 */
	public function confirm()
	{
		try{
			$id = getParams('id');
			$params = [
				'id'   =>  $id,
			];
			$res   = OrderAftersaleModel::confirm($params);
			if($res){
				return app('JsonOutput')->success();
			}
			return app('JsonOutput')->fail();
		}catch (\Exception $e){
			return app('JsonOutput')->fail($e->getMessage());
		}
	}

	private static function whereBuilder()
	{
		$where = [];
		$order_no = getParams('order_no');
		if(!empty($order_no)){
			$where[] = ['order_no','=',$order_no];
		}
		$status = getParams('status');
		if(is_numeric($status)){
			$where[] = ['status','=',$status];
		}

		return $where;
	}
}