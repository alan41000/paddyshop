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

namespace app\admin\validate;

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
        'mobile'        => 'mobile',
        'email'         => 'email',
        'gender'        => 'integer',
        'birthday'      => 'date',
        // 'integral'      => 'integer',
        // 'referrer'      => 'integer',
        // 'username'      => 'require',
        // 'password'      => 'string',
        // 'nickname'      => 'alphaDash',
        // 'avatar'        => 'string',
        // 'province'      => 'string',
        // 'city'          => 'string',
        // 'address'       => 'string',
    ];
    
    protected $message  =   [
        
    ];

    protected $scene = [
        'add'   =>  ['status','mobile','email','gender','birthday'],
        'edit'  =>  ['id','status','mobile','email','gender','birthday'],
        'del'   =>  ['id'],
    ];    
}