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

use think\Exception;

class GoodsPhoto extends PaddyShop
{
    protected $type = [
        'is_show'   =>  'boolean',
    ];

    public function getUrlAttr($value)
    {
        return filePathHandle($value);
    }

    public function setUrlAttr($value)
    {
        return attachmentPathHandle($value);
    }

    /**
     * 删除
     * @Author: Alan Leung
     */
    public static function del($goods_id)
    {
        if(GoodsPhoto::where(['goods_id'=>$goods_id])->delete())
        {
            return true;
        }
        return false;
    }
}