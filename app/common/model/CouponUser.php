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

namespace app\common\model;

use think\Exception;

class CouponUser extends PaddyShop
{
	protected $type = [
		'start_time'      =>  'timestamp',
		'end_time'     =>  'timestamp',
		'use_time'        =>  'timestamp',
	];

	/**
	 * 关联优惠券信息
	 * @Author: Alan Leung
	 * @Date: 2021-01-24 17:06:31
	 */
	public function couponInfo()
	{
		return $this->hasOne('Coupon', 'id', 'coupon_id');
	}

	/**
	 * 关联会员
	 * @Author: Alan Leung
	 * @Date: 2021-02-07 22:17:17
	 */
	public function userInfo()
	{
		return $this->hasOne('User', 'id', 'user_id')->field('id,user_no,birthday,address,avatar,nickname,mobile');
	}

	/**
	 * 校验优惠券领取
	 * @Author: Alan Leung
	 */
	public static function checkReceive($data)
	{
		// 获取优惠劵信息
		$coupon = self::getOne(['where' => ['coupon_id'=>$data['coupon_id']]]);
		if(empty($coupon) || !$coupon['is_enable'])
		{
			throwException('优惠劵不存在或已删除');
		}

		if($coupon['total_count'] > 0 && $coupon['sent_count'] >= $coupon['total_count'])
		{
			throwException('优惠劵不存在或已删除');
		}

		// 是否已过期
		switch($coupon['expire_type'])
		{
			// 固定日期
			case 1 :
				if($coupon['end_time'] < time())
				{
					throwException('优惠劵已过期');
				}
				break;

			default :
				throwException('优惠劵过期类型有误');
		}

		// 用户领取
		if(!$coupon['is_user_receive'])
		{
			throwException('优惠劵不支持用户领取');
		}

		// 是否领取过
		$coupon_user = CouponUser::getOne([
			'where'=>[
				['user_id','=',$data['user_id']],
				['coupon_id','=',$data['id']],
			]
		]);
		if(!empty($coupon_user))
		{
			throwException('您已领取该优惠券');
		}

		return true;
	}

	/**
	 * 校验优惠券使用
	 * @Author: Alan Leung
	 */
	public  static  function  checkUse($data,$total_price)
	{
//		$coupon = Coupon::getOne(['where'=>['id' => $data['coupon_id']]]);
//		if(empty($coupon)) throwException('优惠券信息有误');

		$couponUser = CouponUser::getOne(['where'=>['id' => $data['couponUser_id']]]);
		if(empty($couponUser)) throwException('优惠券信息有误');
		if($couponUser['use_time'] > 0) throwException('优惠券已使用过');
		if($couponUser['start_time'] > time() || $couponUser['end_time'] < time()) throwException('优惠券超出使用期限');
		$applyRangeCheck = CouponUser::isInApplyRange([$data['couponUser_id']],$data['goods'],$total_price);
		if(empty($applyRangeCheck)) throwException('当前订单不可使用此优惠券');
		return true;
	}

	/**
	 * 发送优惠券
	 * @Author: Alan Leung
	 */
	public  static  function  send($data)
	{
			// 获取优惠券信息
			$coupon = Coupon::getOne(['where'=>['id' => $data['coupon_id']]]);
			if(empty($coupon)) throwException('优惠券信息有误');

			return self::transaction(function () use ($data,$coupon) {
				$coupon_user = [
					'coupon_id'  => $data['coupon_id'],
					'user_id'    => $data['user_id'],
					'start_time' => $coupon['expire_type'] == 1 ? $coupon['start_time'] : time(),
					'end_time'   => $coupon['expire_type'] == 1 ? $coupon['end_time'] : time() + 3600 * $coupon['expire_hour'],
				];
				self::add($coupon_user);

				// 更新已发放数量
				self::updateReceiveQty($coupon);
				return true;
			});
	}

	/**
	 * 更新已发放优惠券数量
	 * @Author: Alan Leung
	 */
	public static function updateReceiveQty($coupon)
	{
		return (new Coupon)->where(['id'=>$coupon['id']])->inc('receive_qty')->update();
	}

	/**
	 * 判断当前优惠券是否满足订单使用条件
	 * @Author: Alan Leung
	 */
	public static function isInApplyRange($couponList, $goodsIds, $totalPrice)
	{
		foreach ($couponList as $k=>$v) {
			// 不满足满减条件
			if($totalPrice < $v['min_order_price']){
				unset($couponList[$k]);
				continue;
			}
			switch ($v['apply_range']){
				case 1:
					$goods_category_ids = [];
					foreach ($goodsIds as $vg){
						$res = GoodsCategoryJoin::getAll(['where'=>['goods_id'=>$vg]]);
						$goods_category_ids = array_merge($res,$goods_category_ids);
					}
					if(empty(array_intersect(array_unique($goods_category_ids),$v['apply_range_config']))){
						unset($couponList[$k]);
					}
					break;

				case 2:
					$applyGoodsIds = array_intersect($v['apply_range_config'], $goodsIds);
					if(empty($applyGoodsIds)){
						unset($couponList[$k]);
					}
					break;

				default:
					break;
			}
		}
		return $couponList;
	}

}