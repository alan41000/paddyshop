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
namespace app\admin\controller\store;

use app\admin\controller\PaddyshopAdmin;
use app\admin\validate\Article as ArticleValidate;
use think\exception\ValidateException;
use app\common\model\Article as ArticleModel;

class Article extends PaddyshopAdmin
{
    protected $autoWriteTimestamp = true;

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
     * 获取文章列表
     * @Author: Alan Leung
     */
    public function list()
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
     * 添加一篇文章
     * @Author: Alan Leung
     */
    public function add()
    {
        $title          = getParams('title');
        $content        = getParams('content');
        $category_id    = getParams('category_id');
        $keywords       = getParams('keywords');
        $description    = getParams('description');
        $url            = getParams('url');
        $views_count    = getParams('views_count');
        $images         = getParams('images');
        $is_enable      = getParams('is_enable');

        $data = [
            'title'         =>  $title,
            'content'       =>  $content,
            'category_id'   =>  $category_id,
            'keywords'      =>  $keywords,
            'description'   =>  $description,
            'url'           =>  $url,
            'views_count'   =>  $views_count,
            'images'        =>  $images,
            'is_enable'     =>  $is_enable,
        ];
        
        try {            
            validate(ArticleValidate::class)->scene('add')->check($data);
            if(ArticleModel::add($data))
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
     * 编辑一篇文章
     * @Author: Alan Leung
     */
    public function edit()
    {
        $id             = getParams('id');
        $title          = getParams('title');
        $content        = getParams('content');
        $category_id    = getParams('category_id');
        $keywords       = getParams('keywords');
        $description    = getParams('description');
        $url            = getParams('url');
        $views_count    = getParams('views_count');
        $images         = getParams('images');
        $is_enable      = getParams('is_enable');

        $data = [
            'id'            =>  $id,
            'title'         =>  $title,
            'content'       =>  $content,
            'category_id'   =>  $category_id,
            'keywords'      =>  $keywords,
            'description'   =>  $description,
            'url'           =>  $url,
            'views_count'   =>  $views_count,
            'images'        =>  $images,
            'is_enable'     =>  $is_enable,
        ];

        try {            
            validate(ArticleValidate::class)->scene('edit')->check($data);
            if(ArticleModel::edit($data))
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
     * 删除一篇文章
     * @Author: Alan Leung
     */
    public function del()
    {
        $id = getParams('id');
        $data = ['id'=>$id];

        try {            
            validate(ArticleValidate::class)->scene('del')->check($data);
            if(ArticleModel::del($data))
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
     * 条件构造器
     * @Author: Alan Leung
     */    
    private function whereBuilder()
    {
        $title = getParams('title');
        $where = [];
        if(!empty($title)){
            $where[] = ['title','like','%'.$title.'%'];
        }
        return $where;
    }
}