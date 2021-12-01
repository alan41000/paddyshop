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
use app\common\model\GoodsCategory as GoodsCategoryModel;

class Category extends PaddyshopApi
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
     * 商品分类
     * @Author: Alan Leung
     */    
    public function categoryList()
    {
        $params = [
            'where' => [
                ['is_enable','=',1],
            ],
        ];
        $data = treeHandle(GoodsCategoryModel::getAll($params)->toArray());
        return app('JsonOutput')->success($data);
    }
}