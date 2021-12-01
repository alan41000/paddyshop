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

class GoodsCategory extends PaddyShop
{
    protected $type = [
        'is_enable'             =>  'boolean',
        'is_home_recommended'   =>  'boolean',
    ];

    public function getIconAttr($value)
    {
        return filePathHandle($value);
    }

    public function setIconAttr($value)
    {
        return attachmentPathHandle($value);
    }

    /**
     * 关联商品列表
     * @Author: Alan Leung
     */    
    public function GoodsList()
    {
        return $this->hasManyThrough('Goods','GoodsCategoryJoin','category_id','id','id','goods_id');
    }
}