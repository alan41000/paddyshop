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
namespace app\admin\controller\setting;

use app\admin\controller\PaddyshopAdmin;
use app\admin\validate\Region as RegionValidate;
use think\exception\ValidateException;
use app\common\model\Region as RegionModel;
use think\facade\Cache;

class Region extends PaddyshopAdmin
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
    public function list(int $parent_id = 0)
    {
        $params = [
            'where'     =>  ['parent_id' => $parent_id],
            'order'     =>  'id asc',
        ];
        $result = [];
        $result['records'] = RegionModel::getAll($params);
        $result['records'] = self::handleRegion($result['records']);
        return app('JsonOutput')->success($result);
    }

    /**
     * 详情
     * @Author: Alan Leung
     */    
    public function getOne()
    {
        try
        {
            $id = getParams('id');
            if(empty($id) || !is_numeric($id)) throwException('参数有误');
            $data = RegionModel::getOne(['where'=>['id'=>$id]]);           

            return app('JsonOutput')->success($data);
        }
        catch(\Exception $e)
        {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

    /**
     * 添加
     * @Author: Alan Leung
     */
    public function add()
    {
        $parent_id  = getParams('parent_id');
        $name       = getParams('name');
        $level      = getParams('level');
        $is_enable  = getParams('is_enable');
        $sort       = getParams('sort');

        $data = [
            'parent_id'     =>  empty($parent_id) ? 0 : $parent_id,
            'name'          =>  $name,
            'level'         =>  0,
            'is_enable'     =>  $is_enable,
            'sort'          =>  $sort,
        ];
        
        try {
            validate(RegionValidate::class)->scene('add')->check($data);
            if(RegionModel::add($data))
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
        $id         = getParams('id');
        $parent_id  = getParams('parent_id');
        $name       = getParams('name');
        $level      = getParams('level');
        $is_enable  = getParams('is_enable');
        $sort       = getParams('sort');

        $data = [
            'id'            =>  $id,
            'parent_id'     =>  $parent_id,
            'name'          =>  $name,
            'is_enable'     =>  $is_enable,
            'sort'          =>  $sort,
        ];

        try {            
            validate(RegionValidate::class)->scene('edit')->check($data);
            if(RegionModel::edit($data))
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
            validate(RegionValidate::class)->scene('del')->check($data);
            if(RegionModel::del($data))
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
        $data = Cache::remember('regionTree', function(){
            return treeHandle(RegionModel::getAll(['field'=>'id,parent_id,name'])->toArray());
        },3600);
        
        return app('JsonOutput')->success($data);
    }

    private static function handleRegion($data)
    {
        if(!empty($data)){
            foreach($data as &$v)
            {
                $v['loaded'] = false;
                $v['children'] = [];
                $v['hasChildren'] = RegionModel::count(['where'=>['parent_id'=>$v['id']]]) > 0 ? true : false;
            }
        }
        return $data;
    }
}