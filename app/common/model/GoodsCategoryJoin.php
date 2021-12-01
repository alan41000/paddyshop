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

class GoodsCategoryJoin extends PaddyShop
{
    public function goodsInfo()
    {
        return $this->hasOne('goods', 'id', 'goods_id')->bind([
            'title',
            'inventory',
            'inventory_unit',
            'images',
            'original_price',
            'price',
            'is_shelves',
            'sales_count',
            'home_recommended_images',        
        ]);
    }

    /**
     * 删除
     * @Author: Alan Leung
     */
    public static function del($goods_id)
    {
        if(GoodsCategoryJoin::where(['goods_id'=>$goods_id])->delete())
        {
            return true;
        }
        return false;
    }
}
