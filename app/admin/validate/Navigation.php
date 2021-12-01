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
 * 导航验证器
 * @Author: Alan Leung
 */
class Navigation extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'navigation';
    
    protected $rule = [
        'id'            => 'require|integer',    
        'platform'      => 'require',
        'position'      => 'require|alphaDash',
        'event_type'    => 'require|integer',
        'name'          => 'require',
        'is_enable'     => 'boolean',
        'is_need_login' => 'boolean',
        'sort'          => 'integer',
    ];
    
    protected $message  =   [
        'platform.require'          => '请选择所属平台',
        'position.require'          => '请选择位置',
        'name.require'              => '请输入名称',
    ];

    protected $scene = [
        'add'   =>  ['platform','position','event_type','name','is_enable','is_need_login','sort'],
        'edit'  =>  ['id','platform','position','event_type','name','is_enable','is_need_login','sort'],
        'del'   =>  ['id'],
    ];
}