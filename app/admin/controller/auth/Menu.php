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
namespace app\admin\controller\auth;

use app\admin\controller\PaddyshopAdmin;
use app\admin\validate\Menu as MenuValidate;
use app\common\model\Menu as MenuModel;
use think\exception\ValidateException;

/**
 * 权限控制器
 * @Author: Alan Leung
 */
class Menu extends PaddyshopAdmin
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
        $result   = MenuModel::list($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 添加
     * @Author: Alan Leung
     */
    public function add()
    {
        $parent_id          = getParams('parent_id');
        $title              = getParams('title');
        $sort               = getParams('sort');
        $icon               = getParams('icon');
        $name               = getParams('name');
        $permission         = getParams('permission');
        $path               = getParams('path');
        $component          = getParams('component');
        $type               = getParams('type');
        $platform_id        = getParams('platform_id');
        $is_enable          = getParams('is_enable');

        $data = [
            'parent_id'         => $parent_id,
            'title'             => $title,
            'sort'              => $sort,
            'icon'              => $icon,
            'name'              => $name,
            'permission'        => $permission,
            'path'              => $path,
            'component'         => $component,
            'type'              => $type,
            'platform_id'       => $platform_id,
            'is_enable'         => $is_enable,
        ];

        try {            
            validate(MenuValidate::class)->scene('add')->check($data);
            if(MenuModel::add($data))
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
        $id                 = getParams('id');
        $parent_id          = getParams('parent_id');
        $title              = getParams('title');
        $sort               = getParams('sort');
        $icon               = getParams('icon');
        $name               = getParams('name');
        $permission         = getParams('permission');
        $path               = getParams('path');
        $component          = getParams('component');
        $type               = getParams('type');
        $platform_id        = getParams('platform_id');
        $is_enable          = getParams('is_enable');

        $data = [
            'id'                => $id,
            'parent_id'         => $parent_id,
            'title'             => $title,
            'sort'              => $sort,
            'icon'              => $icon,
            'name'              => $name,
            'permission'        => $permission,
            'path'              => $path,
            'component'         => $component,
            'type'              => $type,
            'platform_id'       => $platform_id,
            'is_enable'         => $is_enable,
        ];

        try {            
            validate(MenuValidate::class)->scene('edit')->check($data);
            if(MenuModel::edit($data))
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
            validate(MenuValidate::class)->scene('del')->check($data);
            if(MenuModel::del($data))
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
        $data   = treeHandle(MenuModel::permissionList()->toArray());
        return app('JsonOutput')->success($data);
    }
}