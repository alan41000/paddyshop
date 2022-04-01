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

class Coupon extends PaddyShop
{
	protected $type = [
		'value'      =>  'float',
		'start_time'      =>  'timestamp:Y-m-d',
		'end_time'     =>  'timestamp:Y-m-d',
		 'is_enable'       =>  'boolean',
		 'is_user_receive'      =>  'boolean',
		 'is_reg_send'        =>  'boolean',
		'apply_range_config'    => 'array',
	];

	public function setEndTimeAttr($value)
	{
		return strtotime($value) + 86399; //往后加一天减一秒
	}

	/**
	 * 商品可用优惠券列表
	 * @Author: Alan Leung
	 */
	public  static  function  inApplyRangeCouponList(int $goods_id)
	{
		// 获取所有有效优惠券
		$couponList = self::getAll(['where'=>[
			['is_enable','=',1],
			['is_user_receive','=',1],
		]])->toArray();
		if(!empty($couponList)){
			foreach ($couponList as $k=>$v){
				switch ($v['apply_range']){
					// 商品分类
					case 1:
						$goods_category_ids = GoodsCategoryJoin::getAll(['where'=>['goods_id'=>$goods_id]])->toArray();
						if(empty(array_intersect(array_column($goods_category_ids,'category_id'),$v['apply_range_config']))){
							unset($couponList[$k]);
						}
						break;

					// 指定商品
					case 2:
						if(!in_array($goods_id, $v['apply_range_config'])){
							unset($couponList[$k]);
						}
						break;
				}
			}
		}
		return array_values($couponList);
	}
}