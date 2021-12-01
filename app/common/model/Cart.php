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

class Cart extends PaddyShop
{
    // 设置json类型字段
    protected $json = ['sku'];

    // 设置JSON数据返回数组
    protected $jsonAssoc = true;

    // 设置JSON字段的类型
    protected $jsonType = [
        'sku'   =>	'string'
    ];

    public function getImagesAttr($value)
    {
        return filePathHandle($value);
    }

    public function setImagesAttr($value)
    {
        return attachmentPathHandle($value);
    }

    /**
     * 添加
     * @Author: Alan Leung
     */
    public static function add($data)
    {
        // 获取商品信息
        $goodsInfo = Goods::getOne([
            'where'=>[
                ['id','=',$data['goods_id']],
                ['is_shelves','=',1],
            ]
        ]);
        if(empty($goodsInfo)) throwException('商品已下架或删除');

        // 获取sku信息
        $skuValueInfo = GoodsSkuValue::getOne(['where'=>['id'=>$data['sku_value_id']]]);
        if(empty($skuValueInfo)) throwException('商品规格有误');
        if($skuValueInfo['inventory'] < $data['qty']) throwException('商品库存不足');

        $skuValueInfoSearch = [
            'id'    =>  $skuValueInfo['id'],
            'name'  =>  $skuValueInfo['sku'],
        ];

        // 查询购物车
        $cartInfo = self::getOne(['where'=>[
            ['goods_id','=',$data['goods_id']],
            ['user_id','=',$data['user_id']],
            ['sku','=', json_encode($skuValueInfoSearch)],
        ]]);
        if(empty($cartInfo))
        {
            $cart_data = [
                'goods_id'  =>  $data['goods_id'],
                'user_id'   =>  $data['user_id'],
                'title'     =>  $goodsInfo['title'],
                'images'    =>  $goodsInfo['home_recommended_images'],
                'original_price'    =>  empty($skuValueInfo['original_price']) ? 0 : $skuValueInfo['original_price'],
                'price'     =>  $skuValueInfo['price'],
                'qty'       =>  $data['qty'],
                'sku'       =>  ['id'=>$data['sku_value_id'],'name'=>$skuValueInfo['sku']],
            ];
            $cart = Cart::create($cart_data);
        }
        else
        {
            $cart_data = [
                'id'        =>  $cartInfo['id'],
                'qty'       =>  $cartInfo['qty'] + $data['qty'],
            ];
            $cart = self::edit($cart_data);
        }
        
        if($cart)
        {
            return $cart;
        }

        return false;
    }

    /**
     * 删除
     * @Author: Alan Leung
     * @param {*} $data
     */    
    public static function del($ids,$user_id = 0)
    {
        return self::transaction(function () use ($ids, $user_id) {
            foreach($ids as $v)
            {
                Cart::where(['id'=>$v,'user_id'=>$user_id])->failException()->find();
                Cart::destroy($v);
            }
            return true;
        });
    }

    /**
     * 移到收藏夹
     * @Author: Alan Leung
     * @param {*} $ids
     * @param {*} $user_id
     */    
    public static function moveFavorites($ids,$user_id)
    {
        return self::transaction(function () use ($ids, $user_id) {
            foreach($ids as $v)
            {
                $cart = Cart::where(['id'=>$v,'user_id'=>$user_id])->failException()->find();
                Cart::destroy($v);
                $userFavorites = UserFavorites::where(['goods_id'=>$cart['goods_id'],'user_id'=>$user_id])->find();
                if(empty($userFavorites))
                {
                    UserFavorites::add(['user_id'=>$user_id,'goods_id'=>$cart['goods_id']]);
                }                
            }
            return true;
        });
    }
}