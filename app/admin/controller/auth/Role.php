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
use app\admin\validate\Role as RoleValidate;
use app\common\model\Role as RoleModel;
use think\exception\ValidateException;

/**
 * 角色控制器
 * @Author: Alan Leung
 */
class Role extends PaddyshopAdmin
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
    public static function list()
    {
        $current    = getParams('current');
        $size       = getParams('size');
        $params = [
            'current'   =>  $current,
            'size'      =>  $size,
        ];
        $result = RoleModel::list($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 添加
     * @Author: Alan Leung
     */
    public static function add()
    {
        $name           = getParams('name');
        $is_enable      = getParams('is_enable');
        $code           = getParams('code');
        $platform_id    = getParams('platform_id');
        $menu_ids       = json_encode(getParams('menu_ids'));

        $data = [
            'name'          =>  $name,
            'is_enable'     =>  $is_enable,
            'code'          =>  $code,
            'platform_id'   =>  $platform_id,
            'menu_ids'      =>  $menu_ids,
        ];
        try {            
            validate(RoleValidate::class)->scene('add')->check($data);
            if(RoleModel::add($data) > 0)
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
    public static function edit()
    {
        $id             = getParams('id');
        $name           = getParams('name');
        $is_enable      = getParams('is_enable');
        $code           = getParams('code');
        $platform_id    = getParams('platform_id');
        $menu_ids       = json_encode(getParams('menu_ids'));

        $data = [
            'id'            =>  $id,
            'name'          =>  $name,
            'is_enable'     =>  $is_enable,
            'code'          =>  $code,
            'platform_id'   =>  $platform_id,
            'menu_ids'      =>  $menu_ids,
        ];

        try {            
            validate(RoleValidate::class)->scene('edit')->check($data);
            if(RoleModel::edit($data))
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
    public static function del()
    {
        $id = getParams('id');
        $data = ['id'=>$id];

        try {            
            validate(RoleValidate::class)->scene('del')->check($data);
            if(RoleModel::del($data))
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
    * 获取角色权限
    * @Author: Alan Leung
    */
	public function getPermission()
	{
        $id = getParams('roleId');
        $params = ['where'=>['id'=>$id],'field'=>'menu_ids'];
        $data = RoleModel::getOne($params);
        return app('JsonOutput')->success($data['menu_ids']);
    }
    
    /**
    * 角色授权
    * @Author: Alan Leung
    */
	public function authz()
	{
        $id         = getParams('roleId');
        $menu_ids   = getParams('menu_ids');

		$data = [
            'id'            =>  $id,
            'menu_ids'      =>  $menu_ids,
        ];
        
        if(RoleModel::edit($data))
        {
            return app('JsonOutput')->success();
        }
        else
        {
            return app('JsonOutput')->fail();
        }
	}
}