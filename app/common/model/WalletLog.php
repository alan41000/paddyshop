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

class WalletLog extends PaddyShop
{
    /**
     * 关联会员
     * @Author: Alan Leung
     */
    public function userInfo()
    {
        return $this->hasOne('User', 'id', 'user_id');
    }

    /**
     * 求和统计
     * @Author: Alan Leung
     * @param {*} $params
     */
    public static function sum($where,$field)
    {        
        return WalletLog::where($where)->sum($field);
    }
}