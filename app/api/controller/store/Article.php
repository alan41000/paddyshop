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
namespace app\api\controller\store;

use app\api\controller\PaddyshopApi;
use app\common\model\Article as ArticleModel;

class Article extends PaddyshopApi
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
     * 文章列表
     * @Author: Alan Leung
     */
    public function articleList()
    {
        $current    = getParams('current');
        $size       = getParams('size');
        $params = [
            'current'   =>  $current,
            'size'      =>  $size,
            'where'     =>  $this->whereBuilder(),
        ];
        $result = ArticleModel::list($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 文章详情
     * @Author: Alan Leung
     */
    public  function  articleDetail()
    {
        try{
            $articleId = getParams('articleId');
            if(empty($articleId) || !is_numeric($articleId)) throwException('参数有误');
            $data = ArticleModel::getOne(['where'=>['id'=>$articleId]]);
            if(empty($data)) throwException('数据有误');
            return app('JsonOutput')->success($data);
        }catch (\Exception $e){
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

    /**
     * 条件构造器
     * @Author: Alan Leung
     */
    private function whereBuilder()
    {
        $title = getParams('title');
        $categoryId = getParams('categoryId');
        $where = [];
        $where[] = ['is_enable','=',1];
        if(!empty($title)){
            $where[] = ['title','like','%'.$title.'%'];
        }
        if(!empty($categoryId)){
            $where[] = ['category_id','=',$categoryId];
        }
        return $where;
    }
}