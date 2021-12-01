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
 * 配置验证器
 * @Author: Alan Leung
 */
class Config extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'config';
    
    protected $rule = [
        'value'         => 'require|string',
        'name'          => 'require|int',
        'describe'      => 'string',
    ];
    
    protected $message  =   [
        'value.require'     => '请输入配置值',
    ];
}