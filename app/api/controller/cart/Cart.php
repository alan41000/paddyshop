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
namespace app\api\controller\cart;

use app\api\controller\PaddyshopApi;
use app\api\validate\Cart as CartValidate;
use app\common\model\Cart as CartModel;

class Cart extends PaddyshopApi
{
    /**
     * 构造方法
     * @Author: Alan Leung
     */    
    public function __construct()
    {
        // 调用父类前置方法
        parent::__construct();
    }

    /**
     * 按页查询购物车数据
     * @Author: Alan Leung
     */    
    public function list()
    {
        $where      = [];
        $current    = getParams('current');
        $size       = getParams('size');

        $where[]    = ['user_id','=',$this->user['id']];
        
        $params     = [
            'current'   =>  $current,
            'size'      =>  $size,
            'where'     =>  $where,
        ];
        $result   = CartModel::list($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 获取所有购物车数据
     * @Author: Alan Leung
     */    
    public function getAll()
    {
        $where      = [];
        $where[]    = ['user_id','=',$this->user['id']];
        
        $params     = [
            'where'     =>  $where,
            'order'     =>  ['update_time desc']
        ];
        $result   = CartModel::getAll($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 添加购物车
     * @Author: Alan Leung
     */    
    public function add()
    {
        try
        {
            $goods_id   = getParams('goods_id');
            $qty        = getParams('qty');
            $sku_value_id   = getParams('sku_value_id');
            $user_id    = $this->user['id'];

            $data = [
                'goods_id'  =>  $goods_id,
                'qty'       =>  $qty,
                'sku_value_id' =>  $sku_value_id,
                'user_id'   =>  $user_id,
            ];            
            validate(CartValidate::class)->scene('add')->check($data);
            $result = CartModel::add($data);
            if($result)
            {
                return app('JsonOutput')->success($result);
            }
            else
            {
                return app('JsonOutput')->fail();
            }
        }
        catch(\Exception $e)
        {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

    /**
     * 修改购物车数量
     * @Author: Alan Leung
     */    
    public function updateNum()
    {
        try
        {
            $id     = getParams('id');
            $qty    = getParams('qty');

            $data = [
                'id'    =>  $id,
                'qty'   =>  $qty,
            ];            
            validate(CartValidate::class)->scene('updateNum')->check($data);
            $result = CartModel::edit($data);
            if($result)
            {
                return app('JsonOutput')->success();
            }
            else
            {
                return app('JsonOutput')->fail();
            }
        }
        catch(\Exception $e)
        {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

    /**
     * 删除
     * @Author: Alan Leung
     */    
    public function del()
    {
        try
        {
            $ids = getParams('ids');
            $user_id = $this->user['id'];
    
            validate(CartValidate::class)->scene('del')->check(['ids'=>  $ids]);
            if(CartModel::del($ids,$user_id))
            {
                return app('JsonOutput')->success();
            }
            return app('JsonOutput')->fail();
        }
        catch(\Exception $e)
        {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

    /**
     * 移到收藏夹
     * @Author: Alan Leung
     */    
    public function moveFavorites()
    {
        try
        {
            $ids = getParams('ids');
            $user_id = $this->user['id'];
    
            validate(CartValidate::class)->scene('moveFavorites')->check(['ids'=>  $ids]);
            if(CartModel::moveFavorites($ids,$user_id))
            {
                return app('JsonOutput')->success();
            }
            return app('JsonOutput')->fail();
        }
        catch(\Exception $e)
        {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }
}