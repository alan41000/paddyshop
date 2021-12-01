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

namespace app\api\validate;

use think\Validate;

/**
 * 会员验证器
 * @Author: Alan Leung
 */
class User extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'user';
    
    protected $rule = [
        'id'            => 'require|integer',
        'status'        => 'integer',
        'username'      => 'require',
        'nickname'      => 'alphaDash',
        'password'      => 'require',
        'mobile'        => 'mobile',
        'email'         => 'email',
        'gender'        => 'integer',
        // 'avatar'        => 'string',
        // 'province'      => 'string',
        // 'city'          => 'string',
        'birthday'      => 'integer',
        // 'address'       => 'string',
        'integral'      => 'integer',
        'referrer'      => 'integer',
    ];
    
    protected $message  =   [
        'username.require'          => '请输入用户名',
    ];

    protected $scene = [
        'usernameLogin' =>  ['username','password'],
    ];
}