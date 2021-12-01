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

class UserFavorites extends PaddyShop
{
    /**
     * 关联商品
     * @Author: Alan Leung
     */    
    public function goodsInfo()
    {
        return $this->hasOne('Goods', 'id', 'goods_id');
    }

    /**
     * 删除
     * @Author: Alan Leung
     * @param {*} $data
     */    
    public static function del($data)
    {
        $user_favorites = UserFavorites::where([
            ['id','=',$data['id']],
            ['user_id','=',$data['user_id']],
        ])->find();

        if(!empty($user_favorites))
        {
            $user_favorites_del = UserFavorites::destroy($data['id']);
            if($user_favorites_del)
            {
                return true;
            }
        }
        return false;
    }
}