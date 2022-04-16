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
use think\facade\Cache;
use think\facade\Db;

class UserSearch extends PaddyShop
{
	public  static  function  add($data)
	{
		$user = Cache::remember('token:' . $data['token'], function () {
			return Db::name('User')->withoutField('password,salt')->where(['token' => $this->token])->find();
		});
		if(!empty($user) && !empty($user['token_expire']) && $user['token_expire'] > time()){
			$userSearch = self::getOne(['where'=>[
				['keyword','=',$data['keyword']],
				['user_id','=',$user['id']],
			]]);
			if(empty($userSearch)){
				$userSearch = [
					'keyword' => $data['keyword'],
					'user_id' => $user['id'],
				];
				return (new static)->create($userSearch);
			}else{
				$userSearch = [
					'id' => $userSearch['id'],
					'keyword' => $userSearch['keyword'],
					'user_id' => $userSearch['user_id'],
				];
				return self::edit($userSearch);
			}
		}
	}
}