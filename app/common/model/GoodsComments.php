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

class GoodsComments extends PaddyShop
{
    protected $type = [
        'reply_time'    =>  'timestamp',
        'is_show'       =>  'boolean',
        'is_anonymous'  =>  'boolean',
        'is_reply'      =>  'boolean',
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
     * 关联会员详情
     * @Author: Alan Leung
     */
    public function userInfo()
    {
        return $this->hasOne('user', 'id', 'user_id')->bind(['nickname', 'avatar']);
    }

    public function goodsInfo()
    {
        return $this->hasOne('goods', 'id', 'goods_id');
    }

    /**
     * 添加
     * @Author: Alan Leung
     * @param {*} $data
     */    
    public static function add($data)
    {
        return self::transaction(function () use ($data) {
            foreach($data['goods'] as $v)
            {
                $commentData = [
                    'user_id'       =>  $data['user_id'],
                    'order_id'      =>  $data['order_id'],
                    'goods_id'      =>  $v['id'],
                    'business_type' =>  'order',
                    'content'       =>  $v['content'],
                    'images'        =>  isset($v['images'])? $v['images'] : '',
                    'rating'        =>  $v['rating'],
                    'is_anonymous'  =>  $data['is_anonymous'] == true ? 1: 0,
                ];
                GoodsComments::create($commentData);
            }
            // 修改订单状态
            $orderData = [
                'id'                =>  $data['order_id'],
                'status'            =>  4,
                'user_is_comments'  =>  time(),
            ];            
            Order::edit($orderData);

            return true;
        });
    }

    /**
     * 字段更新
     * @Author: Alan Leung
     */
    public static function fieldUpdate($data)
    {
        $comments = GoodsComments::find($data['id']);
        if(!empty($comments))
        {
            $data = [
                'id'            =>  $data['id'],
                $data['field']  =>  $data['params']
            ];
            $goods = GoodsComments::update($data,['id'=>$data['id']]);
            if($goods)
            {
                return true;
            }
        }

        return false;
    }
}