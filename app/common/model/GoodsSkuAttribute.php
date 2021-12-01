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

class GoodsSkuAttribute extends PaddyShop
{
    // 设置json类型字段
    protected $json = ['item'];

    // 设置JSON数据返回数组
    protected $jsonAssoc = true;

    // 设置JSON字段的类型
    protected $jsonType = [
        'item'   =>	'string'
    ];

    /**
     * 删除
     * @Author: Alan Leung
     */
    public static function del($goods_id)
    {
        if(GoodsSkuAttribute::where(['goods_id'=>$goods_id])->delete())
        {
            return true;
        }
        return false;
    }
}
