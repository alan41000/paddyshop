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
use app\admin\validate\Admin as AdminValidate;
use app\common\model\Admin as AdminModel;
use app\common\model\Role as RoleModel;
use app\common\model\Menu as MenuModel;
use think\exception\ValidateException;

/**
 * 管理员控制器
 * @Author: Alan Leung
 */
class Admin extends PaddyshopAdmin
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
        $field      = 'id,role_id,username,nickname,email,gender,last_login,last_ip,status,create_time,update_time';
        $params = [
            'current'   =>  $current,
            'size'      =>  $size,
            'field'     =>  $field,
            'where'     =>  $this->whereBuilder()
        ];
        $result   = AdminModel::list($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 添加
     * @Author: Alan Leung
     */
    public function add()
    {
        $salt       = getNumberCode(6);
        $role_id    = getParams('role_id');
        $username   = getParams('username');
        $password   = loginPwdEncryption(getParams('password'),$salt);
        $nickname   = getParams('nickname');
        $status     = getParams('status');
        $email      = getParams('email');

        $data = [
            'role_id'       =>  $role_id,
            'username'      =>  $username,
            'password'      =>  $password,
            'nickname'      =>  $nickname,
            'status'        =>  $status,
            'salt'          =>  $salt,
            'email'         =>  $email,
        ];
        try {            
            validate(AdminValidate::class)->scene('add')->check($data);
            if(AdminModel::add($data))
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
        $role_id    = getParams('role_id');
        $password   = getParams('password');
        $nickname   = getParams('nickname');
        $status     = getParams('status');
        $email      = getParams('email');

        $data = [
            'id'            =>  $id,
            'role_id'       =>  $role_id,
            'nickname'      =>  $nickname,
            'status'        =>  $status,
            'email'         =>  $email,
        ];
        if(!empty($password))
        {
            $salt               = getNumberCode(6);
            $data['salt']       = $salt;
            $data['password']   = loginPwdEncryption(getParams('password'),$salt);
        }

        try {            
            validate(AdminValidate::class)->scene('edit')->check($data);
            if(AdminModel::edit($data))
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
            validate(AdminValidate::class)->scene('del')->check($data);
            if(AdminModel::del($data))
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
     * 登录
     * @Author: Alan Leung
     */
    public function login()
    {
        $username   = getParams('username');
        $password   = getParams('password');

        $data = [
            'username'      =>  $username,
            'password'      =>  $password,
        ];

        try {            
            validate(AdminValidate::class)->scene('login')->check($data);
            $loginResult = AdminModel::login($data);
            return app('JsonOutput')->success($loginResult);
        } catch (ValidateException $e) {
            return app('JsonOutput')->fail($e->getError());
        } catch (\Exception $e) {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

    /**
    * 权限菜单
    * @Author: Alan Leung
    */
	public function permissionMenu()
	{
        $token = $this->token;

		$admin_params = [
			'where'		=>	[
				['token','=',$token]
			],
            'field'     =>  'id,role_id,username,nickname,email,last_login,last_ip,status,create_time,update_time'
		];
        $admin = AdminModel::getOne($admin_params);
		if(empty($admin))
		{
			return app('JsonOutput')->fail();
        }
        
        // 超级管理员全部权限菜单推送
        if($admin['role_id'] == 1)
        {
            $res = treeHandle(MenuModel::permissionList(['where'=>['is_enable'=>1]])->toArray());
            return app('JsonOutput')->success($res);
        }

        $role_params = [
            'where'		=>	[
				['id','=',$admin['role_id']]
			],
        ];
		$role = RoleModel::getOne($role_params);
		$menu_params = [
			'where'	=>[
				['id','in',$role['menu_ids']],
                ['is_enable','=',1],
			],
		];
        return app('JsonOutput')->success(treeHandle(MenuModel::permissionList($menu_params)->toArray()));
    }

    /**
     * 修改密码
     * @Author: Alan Leung
     */    
    public function editPassword()
    {
        $id                 = $this->admin['id'];
        $password           = getParams('password');
        $newPassword        = getParams('newPassword');
        $confirmPassword    = getParams('confirmPassword');

        $data = [
            'id'                =>  $id,
            'password'          =>  $password,
            'newPassword'       =>  $newPassword,
            'confirmPassword'   =>  $confirmPassword,
        ];        

        try {            
            validate(AdminValidate::class)->scene('editPassword')->check($data);
            if($newPassword !== $confirmPassword) throwException('新密码与确认密码不一致！');
            if(AdminModel::editPassword($data))
            {
                return app('JsonOutput')->success();
            }
            else
            {
                return app('JsonOutput')->fail();
            }
        } catch (ValidateException $e) {
            return app('JsonOutput')->fail($e->getError());
        } catch (\Exception $ee) {
            return app('JsonOutput')->fail($ee->getMessage());
        }
    }

    /**
     * 条件构造器
     * @Author: Alan Leung
     */    
    private function whereBuilder()
    {
        $username = getParams('username');
        $nickname = getParams('nickname');
        $role_id = getParams('role_id');
        $email = getParams('email');
        $where = [];
        if(!empty($username)){
            $where[] = ['username','like','%'.$username.'%'];
        }
        if(!empty($nickname)){
            $where[] = ['nickname','like','%'.$nickname.'%'];
        }
        if(!empty($role_id)){
            $where[] = ['role_id','=',$role_id];
        }
        if(!empty($email)){
            $where[] = ['email','=',$email];
        }
        return $where;
    }
}