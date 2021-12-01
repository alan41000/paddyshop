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
namespace app\admin\controller\goods;

use app\admin\controller\PaddyshopAdmin;
use app\admin\validate\GoodsCategory as CategoryValidate;
use app\common\model\GoodsCategory as CategoryModel;
use think\exception\ValidateException;

/**
 * 商品分类控制器
 * @Author: Alan Leung
 */
class Category extends PaddyshopAdmin
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
        $current    = getParams('current');
        $size       = getParams('size');
        $params = [
            'current'   =>  $current,
            'size'      =>  $size,
        ];
        $result = CategoryModel::list($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 添加
     * @Author: Alan Leung
     */
    public function add()
    {
        $parent_id              = getParams('parent_id');
        $icon                   = getParams('icon');
        $name                   = getParams('name');
        $vice_name              = getParams('vice_name');
        $describe               = getParams('describe');
        $is_home_recommended    = getParams('is_home_recommended');
        $sort                   = getParams('sort');
        $is_enable              = getParams('is_enable');

        $data = [
            'parent_id'             =>  $parent_id,
            'icon'                  =>  $icon,
            'name'                  =>  $name,
            'vice_name'             =>  $vice_name,
            'describe'              =>  $describe,
            'is_home_recommended'   =>  $is_home_recommended,
            'sort'                  =>  $sort,
            'is_enable'             =>  $is_enable,
        ];
        try {            
            validate(CategoryValidate::class)->scene('add')->check($data);
            if(CategoryModel::add($data))
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
     * 编辑
     * @Author: Alan Leung
     */
    public function edit()
    {
        $id                     = getParams('id');
        $parent_id              = getParams('parent_id');
        $icon                   = getParams('icon');
        $name                   = getParams('name');
        $vice_name              = getParams('vice_name');
        $describe               = getParams('describe');
        $is_home_recommended    = getParams('is_home_recommended');
        $sort                   = getParams('sort');
        $is_enable              = getParams('is_enable');

        $data = [
            'id'                    =>  $id,
            'parent_id'             =>  $parent_id,
            'icon'                  =>  $icon,
            'name'                  =>  $name,
            'vice_name'             =>  $vice_name,
            'describe'              =>  $describe,
            'is_home_recommended'   =>  $is_home_recommended,
            'sort'                  =>  $sort,
            'is_enable'             =>  $is_enable,
        ];
        try {            
            validate(CategoryValidate::class)->scene('edit')->check($data);
            if(CategoryModel::edit($data))
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
     * 删除
     * @Author: Alan Leung
     */
    public function del()
    {
        $id = getParams('id');
        $data = ['id'=>$id];

        try {            
            validate(CategoryValidate::class)->scene('del')->check($data);
            if(CategoryModel::del($data))
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
            'where' =>  $this->whereBuilder(),
        ];
        $data = treeHandle(CategoryModel::getAll($params)->toArray());
        return app('JsonOutput')->success($data);
    }

    /**
     * 条件构造器
     * @Author: Alan Leung
     */    
    private function whereBuilder()
    {
        $is_enable = getParams('is_enable');
        $name = getParams('name');        
        $where = [];
        if(isset($is_enable) && is_numeric($is_enable)){
            $where[] = ['is_enable','=', $is_enable];
        }
        if(!empty($name)){
            $where[] = ['name','like','%'.$name.'%'];
        }
        return $where;
    }
}