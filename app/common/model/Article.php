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

class Article extends PaddyShop
{
    protected $type = [
        'is_enable' =>  'boolean',
    ];

    public function getImagesAttr($value)
    {
        return filePathHandle($value);
    }

    public function setImagesAttr($value)
    {
        return attachmentPathHandle($value);
    }
}