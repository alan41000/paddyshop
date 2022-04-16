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
use think\facade\Cache;
use think\facade\Db;

class GoodsHistory extends PaddyShop
{
	/**
	 * 关联商品信息
	 * @Author: Alan Leung
	 */
	public function goodsInfo()
	{
		return $this->hasOne('Goods', 'id', 'goods_id');
	}

	public  static  function  add($data)
	{
		$user = Cache::remember('token:' . $data['token'], function () {
			return Db::name('User')->withoutField('password,salt')->where(['token' => $this->token])->find();
		});
		if(!empty($user) && !empty($user['token_expire']) && $user['token_expire'] > time()){
			$goodsHistory = self::getOne(['where'=>[
				['goods_id','=',$data['goods_id']],
				['user_id','=',$user['id']],
			]]);
			if(empty($goodsHistory)){
				$goodsHistory = [
					'goods_id' => $data['goods_id'],
					'user_id' => $user['id'],
				];
				return (new static)->create($goodsHistory);
			}else{
				$goodsHistory = [
					'id' => $goodsHistory['id'],
					'goods_id' => $goodsHistory['goods_id'],
					'user_id' => $goodsHistory['user_id'],
				];
				return self::edit($goodsHistory);
			}
		}
	}
}