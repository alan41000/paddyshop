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
namespace app\api\controller\order;

use app\api\controller\PaddyshopApi;
use app\api\validate\OrderAftersale as OrderAftersaleValidate;
use app\common\model\OrderAftersale as OrderAftersaleModel;
use think\exception\ValidateException;

class Aftersale extends PaddyshopApi
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

	public function  list()
	{
		try{
			$where      = [];
			$current    = getParams('current');
			$size       = getParams('size');

			$where[]    = ['user_id','=',$this->user['id']];
			$params     = [
				'current'   =>  $current,
				'size'      =>  $size,
				'where'     =>  $where,
			];
			$result   = OrderAftersaleModel::list($params);
			return app('JsonOutput')->success($result);
		}catch (\Exception $e){
			return app('JsonOutput')->fail($e->getMessage());
		}
	}

	public  function  add()
	{
		try{
			$orderNo = getParams('order_no');
			$orderId = getParams('order_id');
			$reason = getParams('reason');
			$price = getParams('price');
			$msg = getParams('msg');
			$type = getParams('type');
			$images = getParams('images');
			$orderDetailId = getParams('order_detail_id');
			$qty = getParams('qty');
			$goodsId = getParams('goods_id');

			// 数据
			$data = [
				'order_no' => (int)$orderNo,
				'type' => $type,
				'order_detail_id' => $orderDetailId,
				'order_id' => $orderId,
				'goods_id' => $goodsId,
				'user_id' => $this->user['id'],
				'qty' => $qty,
				'price' => $price,
				'reason' => $reason,
				'msg' => $msg,
				'images' => $images,
				'status' => $type == 1 ? 2 : 0,
				'apply_time' => time(),
			];
			validate(OrderAftersaleValidate::class)->scene('add')->check($data);
			if($data['type'] == 2 && empty($data['qty'])) throwException('请输入退款数量');

			if(OrderAftersaleModel::add($data)){
				return app('JsonOutput')->success();
			}
			return app('JsonOutput')->fail();
		} catch (ValidateException $e) {
			return app('JsonOutput')->fail($e->getError());
		} catch(\Exception $e){
			return app('JsonOutput')->fail($e->getMessage());
		}
	}

	public  function  cancel()
	{
		try{
			$orderDetailId = getParams('order_detail_id');
			$data = [
				'order_detail_id'	=>	$orderDetailId,
				'user'	=>	$this->user
			];
			validate(OrderAftersaleValidate::class)->scene('cancel')->check($data);
			if(OrderAftersaleModel::cancel($data)){
				return app('JsonOutput')->success();
			}
			return app('JsonOutput')->fail();
		}catch (\Exception $e){
			return app('JsonOutput')->fail($e->getMessage());
		}
	}

	public function getOne()
	{
		try{
			$orderDetailId = getParams('order_detail_id');
			$res = OrderAftersaleModel::getOne(['where' =>[
				['order_detail_id','=',$orderDetailId],
				['user_id','=',$this->user['id']],
			]]);
			return app('JsonOutput')->success($res);
		}catch (\Exception $e){
			return app('JsonOutput')->fail($e->getMessage());
		}
	}

	public function delivery()
	{
		try{
			$orderDetailId = getParams('order_detail_id');
			$expressName = getParams('express_name');
			$expressNumber = getParams('express_number');
			$data = [
				'order_detail_id'	=>	$orderDetailId,
				'express_name'	=>	$expressName,
				'express_number'	=>	$expressNumber,
				'user'	=>	$this->user
			];
			validate(OrderAftersaleValidate::class)->scene('delivery')->check($data);
			if(OrderAftersaleModel::delivery($data)){
				return app('JsonOutput')->success();
			}
			return app('JsonOutput')->fail();
		} catch (ValidateException $e) {
			return app('JsonOutput')->fail($e->getError());
		} catch (\Exception $e){
			return app('JsonOutput')->fail($e->getMessage());
		}
	}
}