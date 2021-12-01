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
 * 地区验证器
 * @Author: Alan Leung
 */
class Region extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'region';
    
    protected $rule = [
        'id'            => 'require|integer',
        'parent_id'     => 'require|integer',
        'name'          => 'require|chsAlpha',
        'level'         => 'integer',
        'is_enable'     => 'integer',
        'sort'          => 'integer',
    ];
    
    protected $message = [
        'name.require'  => '请输入地区名',
    ];

    protected $scene = [
        'add'   =>  ['parent_id','name','level','is_enable','sort'],
        'edit'  =>  ['id','parent_id','name','level','is_enable','sort'],
        'del'   =>  ['id'],
    ];
}