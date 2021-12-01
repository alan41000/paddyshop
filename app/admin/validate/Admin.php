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
 * 管理员验证器
 * @Author: Alan Leung
 */
class Admin extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'permission_admin';
    
    protected $rule =   [       
        'username'     => 'require|alphaDash|length:4,20|unique:permission_admin',
        'password'     => 'require|min:6|max:32',
        'newPassword'   => 'require|min:6|max:32',
        'confirmPassword'=> 'require|min:6|max:32',
        'role_id'      => 'integer|gt:0',
        'nickname'     => 'require|max:50',
        'email'        => 'email',
        'status'       => 'in:1,2',
    ];
    
    protected $message  =   [
        'username.require'          => '请输入用户名',
        'username.unique'           => '用户名已存在',
        'password.require'          => '请输入密码',
        'nickname.require'          => '请输入昵称', 
    ];

    protected $scene = [
        'add'   =>  ['role_id','password','email','nickname','avatar','status'],
        'edit'  =>  ['id','role_id','email','nickname','avatar','status'],
        'del'   =>  ['id'],
        'editPassword'   =>  ['id','password','newPassword','confirmPassword'],
    ];

    public function sceneLogin()
    {
    	return $this->only(['username','password'])
            ->remove('username', 'unique');
    } 
    
}