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
use app\admin\validate\ArticleCategory as ArticleCategoryValidate;
use think\exception\ValidateException;
use app\common\model\ArticleCategory as ArticleCategoryModel;

class ArticleCategory extends PaddyshopAdmin
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
     * 获取分类列表
     * @Author: Alan Leung
     */
    public function list()
    {
        $current    = getParams('current');
        $size       = getParams('size');
        $params = [
            'current'       =>  $current,
            'size'          =>  $size,
        ];

        $result   = ArticleCategoryModel::list($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 添加一个分类
     * @Author: Alan Leung
     */
    public function add()
    {
        $parent_id      = getParams('parent_id');
        $name           = getParams('name');
        $sort           = getParams('sort');
        $is_navi        = getParams('is_navi');

        $data = [
            'parent_id'     =>  $parent_id,
            'name'          =>  $name,
            'sort'          =>  $sort,
            'is_navi'       =>  $is_navi,
        ];
        
        try {            
            validate(ArticleCategoryValidate::class)->scene('add')->check($data);
            if(ArticleCategoryModel::add($data))
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
     * 编辑一个分类
     * @Author: Alan Leung
     */
    public function edit()
    {
        $id             = getParams('id');
        $parent_id      = getParams('parent_id');
        $name           = getParams('name');
        $sort           = getParams('sort');
        $is_navi        = getParams('is_navi');

        $data = [
            'id'            =>  $id,
            'parent_id'     =>  $parent_id,
            'name'          =>  $name,
            'sort'          =>  $sort,
            'is_navi'       =>  $is_navi,
        ];

        try {
            validate(ArticleCategoryValidate::class)->scene('edit')->check($data);
            if(ArticleCategoryModel::edit($data))
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
     * 删除一个分类
     * @Author: Alan Leung
     */
    public function del()
    {
        $id = getParams('id');
        $data = ['id'=>$id];

        try {            
            validate(ArticleCategoryValidate::class)->scene('del')->check($data);
            if(ArticleCategoryModel::del($data))
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
     * 列表树
     * @Author: Alan Leung
     */
    public function tree()
    {
        $params = [
            'where' =>  $this->whereBuilder()
        ];
        $data = treeHandle(ArticleCategoryModel::getAll($params)->toArray());
        return app('JsonOutput')->success($data);
    }

    /**
     * 条件构造器
     * @Author: Alan Leung
     */    
    private function whereBuilder()
    {
        $name = getParams('name');
        $where = [];
        if(!empty($name)){
            $where[] = ['name','like','%'.$name.'%'];
        }
        return $where;
    }
}