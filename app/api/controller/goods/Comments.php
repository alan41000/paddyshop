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
namespace app\api\controller\goods;

use app\api\controller\PaddyshopApi;
use app\common\model\GoodsComments as GoodsCommentsModel;
use think\exception\ValidateException;

class Comments extends PaddyshopApi
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
     * 获取评价
     * @Author: Alan Leung
     */    
    public function list()
    {
        try{
            $goodsId    = getParams('goodsId');
            if(empty($goodsId) || !is_numeric($goodsId)) throwException('参数有误');
            $current    = getParams('current');
            $size       = getParams('size');
            $params = [
                'current'   =>  $current,
                'size'      =>  $size,
                'where'     =>  ['goods_id' => $goodsId],
                'with'      =>  ['userInfo']
            ];
            $result = GoodsCommentsModel::list($params);
            return app('JsonOutput')->success($result);
        }catch(\Exception $e){
            return app('JsonOutput')->fail($e->getMessage());
        }
    }
}