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
 * 菜单验证器
 * @Author: Alan Leung
 */
class Menu extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'permission_menu';
    
    protected $rule = [
        'id'                => 'require|integer',
        'parent_id'         => 'integer',
        'title'             => 'require',
        'sort'              => 'integer',
        // 'icon'              => 'string',
        // 'name'              => 'string',
        // 'permission'        => 'string',
        // 'path'              => 'string',
        // 'component'         => 'string',
        'type'              => 'integer',
        // 'platform_id'       => 'integer',
        // 'is_enable'         => 'integer',
    ];
    
    protected $message  =   [
        'title.require'          => '请输入菜单名称',
    ];

    protected $scene = [
        'add'   =>  ['parent_id','title','sort','type','platform_id','is_enable'],
        'edit'  =>  ['id','parent_id','title','sort','type','platform_id','is_enable'],
        // 'add'   =>  ['parent_id','title','sort','icon','menu_code','permission_code','path','component','type','platformId','is_enable'],
        // 'edit'  =>  ['id','parent_id','title','sort','icon','menu_code','permission_code','path','component','type','platformId','is_enable'],
        'del'   =>  ['id'],
    ];    
}