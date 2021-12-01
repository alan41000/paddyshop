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

namespace app\common\model;

class Admin extends PaddyShop
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'permission_admin';

    /**
     * 登录
     * @Author: Alan Leung
     */
    public static function login($params = [])
    {
        $where = ['username' => $params['username']];
        $admin = self::getOne(['where'=>$where,'field'=>'id,username,password,salt,status']);

        if(empty($admin))
        {
            throwException('管理员不存在');
        }

        $password = loginPwdEncryption($params['password'], $admin['salt']);
        if($password != $admin['password'])
        {
            throwException('密码错误');
        }

        // 重写数据
        $salt = getNumberCode(6);
        $token = createToken($admin['id']);
        $data = [
            'id'            =>  $admin['id'],
            'salt'          =>  $salt,
            'password'      =>  loginPwdEncryption($params['password'], $salt),
            'token'         =>  $token,
            'token_expire'  =>  time() + 86400, //1天有效期
            'last_login'    =>  time(),
            'last_ip'       =>  getRealIP(),
        ];

        if(self::edit($data))
        {
            $admin = self::getOne(['where'=>$where,'field'=>'id,username,nickname,token,token_expire,last_login,last_ip,role_id,status']);
            return $admin;
        }
        throwException('系统开了个小差，请稍后再试！');
    }

    /**
     * 修改密码
     * @Author: Alan Leung
     * @param {*} $params
     */    
    public static function editPassword($params)
    {
        $where = ['id' => $params['id']];
        $admin = Admin::where($where)->field('id,username,password,salt')->findOrFail();

        $password = loginPwdEncryption($params['password'], $admin['salt']);
        if($password != $admin['password'])
        {
            throwException('原密码错误');
        }

        // 重写数据
        $salt = getNumberCode(6);
        $data = [
            'id'            =>  $params['id'],
            'salt'          =>  $salt,
            'password'      =>  loginPwdEncryption($params['newPassword'], $salt),
        ];
        if(self::edit($data))
        {
            return true;
        }

        return false;
    }
}