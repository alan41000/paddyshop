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
namespace app\api\controller\user;

use app\api\controller\PaddyshopApi;
use app\common\model\UserSearch as UserSearchModel;

class UserSearch extends PaddyshopApi
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

	public function getAll()
	{
		$where      = ['user_id'=>$this->user['id']];
		$current    = getParams('current');
		$size       = getParams('size');

		$params     = [
			'current'   =>  $current,
			'size'      =>  $size,
			'order' => 'update_time desc',
			'where'     =>  $where,
		];
		$result   = UserSearchModel::getAll($params);

		return app('JsonOutput')->success($result);
	}
}