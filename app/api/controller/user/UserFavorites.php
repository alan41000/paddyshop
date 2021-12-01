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
namespace app\api\controller\user;

use app\api\controller\PaddyshopApi;
use app\api\validate\UserFavorites as UserFavoritesValidate;
use app\common\model\UserFavorites as UserFavoritesModel;
use think\exception\ValidateException;

class UserFavorites extends PaddyshopApi
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
     * 列表
     * @Author: Alan Leung
     */    
    public function list()
    {
        $where      = ['user_id'=>$this->user['id']];
        $current    = getParams('current');
        $size       = getParams('size');
        
        $params     = [
            'current'   =>  $current,
            'size'      =>  $size,
            'where'     =>  $where,
            'with'      =>  ['goodsInfo']
        ];
        $result   = UserFavoritesModel::list($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 添加收藏
     * @Author: Alan Leung
     */    
    public function add()
    {
        $user_id    = $this->user['id'];
        $goods_id   = getParams('goods_id');

        $data = [
            'user_id'       =>  $user_id,
            'goods_id'      =>  $goods_id,
        ];

        try {            
            validate(UserFavoritesValidate::class)->scene('add')->check($data);
            $res = UserFavoritesModel::add($data);
            if($res)
            {
                return app('JsonOutput')->success($res);
            }
            else
            {
                return app('JsonOutput')->fail();
            }
        } catch (ValidateException $e) {
            return app('JsonOutput')->fail($e->getError());
        }
    }

    /**
     * 删除
     * @Author: Alan Leung
     */    
    public function del()
    {
        $user_id        = $this->user['id'];
        $favorites_id   = getParams('favorites_id');

        $data = [
            'user_id'   =>  $user_id,
            'id'        =>  $favorites_id,
        ];

        try {            
            validate(UserFavoritesValidate::class)->scene('del')->check($data);
            if(UserFavoritesModel::del($data))
            {
                return app('JsonOutput')->success();
            }
            else
            {
                return app('JsonOutput')->fail();
            }
        } catch (ValidateException $e) {
            return app('JsonOutput')->fail($e->getError());
        }
    }

    /**
     * 查询是否已收藏
     * @Author: Alan Leung
     */    
    public function checkHasFavorites()
    {
        $user_id    = $this->user['id'];
        $goods_id = getParams('goods_id');

        $data = [
            'user_id'       =>  $user_id,
            'goods_id'      =>  $goods_id,
        ];

        try {
            validate(UserFavoritesValidate::class)->scene('checkHasFavorites')->check($data);
            $favorites_data = [
                'where' =>  [
                    ['user_id','=', $user_id],
                    ['goods_id','=', $goods_id,]
                ]
            ];
            $res = UserFavoritesModel::getOne($favorites_data);
            if(!empty($res))
            {
                return app('JsonOutput')->success(['hasFavorites'=>true,'favorites_id'=>$res['id']]);
            }
            else
            {
                return app('JsonOutput')->success(['hasFavorites'=>false]);
            }            
        } catch (ValidateException $e) {
            return app('JsonOutput')->fail($e->getError());
        } catch (\Exception $ee){
            return app('JsonOutput')->fail($ee->getMessage());
        }
    }
}