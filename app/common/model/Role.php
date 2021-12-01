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

class Role extends PaddyShop
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'permission_role';

    protected $type = [
        'is_enable' =>  'boolean',
        'menu_ids'  =>  'array',
    ];
}