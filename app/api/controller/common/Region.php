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
namespace app\api\controller\common;

use app\api\controller\PaddyshopApi;
use app\common\model\Region as RegionModel;
use think\exception\ValidateException;
use think\facade\Cache;

class Region extends PaddyshopApi
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
     * 列表树
     * @Author: Alan Leung
     */
    public function tree()
    {
        $data = Cache::remember('regionTree', function(){
            return treeHandle(RegionModel::getAll()->toArray());
        },3600);
        
        return app('JsonOutput')->success($data);
    }

    /**
     * 根据父id获取地区列表
     * @Author: Alan Leung
     */    
    public function list()
    {
        $parent_id = getParams('parent_id');
        $data = RegionModel::getAll(['where'=>['parent_id'=>$parent_id],'order'=>'id asc'])->toArray();
        return app('JsonOutput')->success($data);
    }
}