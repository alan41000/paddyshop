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

namespace app\admin\controller;

use app\BaseController;
use think\facade\Request;
use think\facade\Cache;
use think\facade\Db;
use app\common\model\Config as ConfigModel;

class PaddyshopAdmin extends BaseController
{
    /**
     * Token
     * @var string
     */
    public $token;

    /**
     * 登录控制器白名单
     * @var object
     */
    protected $loginWhiteList = ['login'];

    /**
     * 权限验证白名单
     * @var object
     */
    protected $permissionWhiteList = ['login','permissionmenu','shopdata'];

    /**
     * 管理员信息
     * @var object
     */
    protected $admin;

    /**
     * 核心基础初始化
     * @access protected
     * @return void
     */
    protected function __construct()
    {
        // 绑定公共类
        bind('JsonOutput','app\common\controller\JsonOutput');

        // 系统初始化
        $this->systemInit();

        // 公共数据初始化
		$this->commonInit();
    }

    /**
     * 系统初始化
     * @access protected
     * @return void
     */
    private function systemInit()
    {
        ConfigModel::init();
    }

    /**
     * 验证Token
     * @Author: Alan Leung
     * @Date: 2020-11-30 21:14:33
     */
    private function checkToken()
    {
        // 获取token
        $data = Cache::remember('token:' . $this->token, function () {
            return Db::name('PermissionAdmin')->withoutField('password,salt')->where(['token' => $this->token])->find();
        });

        // 存在Token则进行验证
        if (!is_null($data)) {
            // 检测Token是否过期
            if (!empty($data['token_expire']) && $data['token_expire'] > time() ) {
                $this->admin = $data;
                return true;
            }
        }

        return false;
    }

    /**
     * 验证权限
     * @access private
     * @return string|true
     */
    private function checkPermission($controller = null, $action = null)
    {
        // 控制器/方法
        $controller = strtolower(empty($controller) ? request()->controller() : $controller);
        $action = strtolower(empty($action) ? request()->action() : $action);

        // 不需要校验权限的方法
        if(!empty($this->permissionWhiteList) && in_array($action, $this->permissionWhiteList))
        {
            return true;
        }

        // 管理员
        $admin = $this->admin;
        if(!empty($admin))
        {
            // 角色组权限列表校验
            if(empty($admin['role_id']))
            {
                return false;
            }

            $roleId = $admin['role_id'];

            // 超级管理员直接返回true
            if($roleId == 1)
            {
                return true;
            }

            $permission = $this->getAdminPermission($roleId);
            if(!empty($permission) && is_array($permission))
            {
                foreach($permission as $v)
                {
                    if(!empty($v['permission']))
                    {
                        if($controller.':'.$action == $v['permission']){
                            return true;
                            break;
                        }
                    }
                }
            }
        }

        return false;
    }

    /**
     * 是否需要登录
     * @Author: Alan Leung
     * @Date: 2020-11-30 21:14:33
     */
    private function isNeedLogin($controller = null, $action = null)
    {
        $controller = strtolower(empty($controller) ? request()->controller() : $controller);
        $action = strtolower(empty($action) ? request()->action() : $action);

        // 不需要校验的方法
        if(!empty($this->loginWhiteList) && in_array($action, $this->loginWhiteList))
        {
            return false;
        }

		return true;
    }

    /**
     * 获取权限列表
     * @Author: Alan Leung
     * @Date: 2020-12-01 22:20:42
     */
    private function getAdminPermission($roleId)
    {
        $roleData = Db::name('PermissionRole')->field('id,menu_ids')->where(['id'=>$roleId])->find();
        $menuIds = json_decode($roleData['menu_ids'],true);
        $menuData = Db::name('PermissionMenu')->where('id','in',$menuIds)->select()->toArray();
        return $menuData;
    }

    /**
     * 公共数据初始化
     * @Author: Alan Leung
     */    
    private function commonInit()
    {
        // 公共参数赋值
        $token = Request::header('token');
        $this->token = isset($token) && !empty($token) ? $token : '';

        // 是否需要登录
        if($this->isNeedLogin())
        {
            // 验证Token
            if (!$this->checkToken()) {
                // 未授权，请重新登录(401)
                die(json_encode(['msg'=>'登录失效，请重新登录！','code'=>401]));

            }

            // 是否有权限
            if(!$this->checkPermission())
            {
                die(json_encode(['msg'=>'权限不足！','code'=>401]));
            }
        }
    }
}