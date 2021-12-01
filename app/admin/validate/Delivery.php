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
 * 配送方式验证器
 * @Author: Alan Leung
  */
class Delivery extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'delivery';
    
    protected $rule = [
        'id'            => 'require|integer',    
        'name'          => 'require|chsAlpha',
        'is_enable'     => 'require|boolean',
        'sort'          => 'integer',
    ];
    
    protected $message  =   [
        'name.require'              => '请输入名称',
    ];

    protected $scene = [
        'add'   =>  ['name','is_enable','sort'],
        'edit'  =>  ['id','name','is_enable','sort'],
        'del'   =>  ['id'],
    ];
}