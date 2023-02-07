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

class RefundLog extends PaddyShop
{
	/**
	 * 关联用户
	 * @Author: Alan Leung
	 */
	public function userInfo()
	{
		return $this->hasOne('User', 'id', 'user_id');
	}
}