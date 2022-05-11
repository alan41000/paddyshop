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
 * 角色验证器
 * @Author: Alan Leung
 */
class Role extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'permission_admin';
    
    protected $rule = [
        'id'            => 'require|integer',    
        'name'          => 'require|length:2,150',
        'is_enable'     => 'integer',
        // 'code'         => 'string',        
        // 'menu_ids'     => 'string',        
    ];
    
    protected $message  =   [
        'username.require'          => '请输入角色名',
    ];

    protected $scene = [
        'add'   =>  ['name','is_enable'],
        'edit'  =>  ['id','name','is_enable'],
        'del'   =>  ['id'],
    ];    
}