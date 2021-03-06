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

class Navigation extends PaddyShop
{
    protected $type = [
        'is_enable'     =>  'boolean',
        'is_need_login' =>  'boolean',
        'platform'      =>  'array',
    ];

    public function getImagesUrlAttr($value)
    {
        return filePathHandle($value);
    }

    public function setImagesUrlAttr($value)
    {
        return attachmentPathHandle($value);
    }
}