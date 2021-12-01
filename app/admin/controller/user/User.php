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
namespace app\admin\controller\user;

use app\admin\controller\PaddyshopAdmin;
use app\admin\validate\User as UserValidate;
use app\common\model\User as UserModel;
use think\exception\ValidateException;

/**
 * 会员控制器
 * @Author: Alan Leung
 */
class User extends PaddyshopAdmin
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
            'current'       =>  $current,
            'size'          =>  $size,
            'where'         =>  $this->whereBuilder(),
            'field'         =>  'address,
                                avatar,
                                birthday,
                                city,
                                create_time,
                                email,
                                gender,
                                id,
                                integral,
                                is_delete_time,
                                locking_integral,
                                mobile,
                                nickname,
                                openid_alipay,
                                openid_baidu,
                                openid_qq,
                                openid_toutiao,
                                openid_weixin,
                                openid_weixin_web,
                                province,
                                referrer,
                                status,
                                unionid_qq,
                                unionid_weixin,
                                update_time,
                                username',
        ];

        $result   = UserModel::list($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 添加
     * @Author: Alan Leung
     */
    public function add()
    {
        $status         = getParams('status');
        $username       = getParams('username');
        $nickname       = getParams('nickname');
        $password       = getParams('password');
        $mobile         = getParams('mobile');
        $email          = getParams('email');
        $gender         = getParams('gender');
        $avatar         = getParams('avatar');
        $province       = getParams('province');
        $city           = getParams('city');
        $birthday       = getParams('birthday');
        $address        = getParams('address');
        $integral       = getParams('integral');
        $referrer       = getParams('referrer');

        $data = [
            'status'        =>  $status,
            'username'      =>  $username,
            'nickname'      =>  $nickname,
            'mobile'        =>  $mobile,
            'email'         =>  $email,
            'gender'        =>  $gender,
            'avatar'        =>  $avatar,
            'province'      =>  $province,
            'city'          =>  $city,
            'birthday'      =>  $birthday,
            'address'       =>  $address,
            'integral'      =>  $integral,
            'referrer'      =>  $referrer,
        ];

        if(!empty($password))
        {
            $salt               = getNumberCode(6);
            $data['salt']       = $salt;
            $data['password']   = loginPwdEncryption(getParams('password'),$salt);
        }

        try {            
            validate(UserValidate::class)->scene('add')->check($data);
            if(UserModel::add($data))
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
        // $username       = getParams('username');
        // $avatar         = getParams('avatar');
        // $password       = getParams('password');
        // $referrer       = getParams('referrer');
        // $integral       = getParams('integral');
        // $address        = getParams('address');
        $id             = getParams('id');
        $status         = getParams('status');
        $nickname       = getParams('nickname');
        $mobile         = getParams('mobile');
        $email          = getParams('email');
        $gender         = getParams('gender');
        $province       = getParams('province');
        $city           = getParams('city');
        $birthday       = getParams('birthday');

        $data = [
            'id'            =>  $id,
            'status'        =>  $status,
            'nickname'      =>  $nickname,
            'mobile'        =>  $mobile,
            'email'         =>  $email,
            'gender'        =>  $gender,
            'province'      =>  $province,
            'city'          =>  $city,
            'birthday'      =>  $birthday,
            // 'username'      =>  $username,
            // 'avatar'        =>  $avatar,
            // 'address'       =>  $address,
            // 'integral'      =>  $integral,
            // 'referrer'      =>  $referrer,
        ];

        // if(!empty($password))
        // {
        //     $salt               = getNumberCode(6);
        //     $data['salt']       = $salt;
        //     $data['password']   = loginPwdEncryption(getParams('password'),$salt);
        // }

        try {            
            validate(UserValidate::class)->scene('edit')->check($data);
            if(UserModel::edit($data))
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
            validate(UserValidate::class)->scene('del')->check($data);
            if(UserModel::del($data))
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

    public function getAll()
    {
        $result = UserModel::getAll();
        return app('JsonOutput')->success($result);
    }

    /**
     * 条件构造器
     * @Author: Alan Leung
     */    
    private function whereBuilder()
    {
        $nickname   = getParams('nickname');
        $mobile     = getParams('mobile');
        $province   = getParams('province');
        $city       = getParams('city');
        $status     = getParams('status');
        $birthday   = getParams('birthday');
        $where      = [];
        if(!empty($nickname)){
            $where[] = ['nickname','like','%'.$nickname.'%'];
        }
        if(!empty($mobile)){
            $where[] = ['mobile','like','%'.$mobile.'%'];
        }
        if(!empty($province)){
            $where[] = ['province','like','%'.$province.'%'];
        }
        if(!empty($city)){
            $where[] = ['city','like','%'.$city.'%'];
        }
        if(!empty($status)){
            $where[] = ['status','=',$status];
        }
        if(!empty($birthday)){
            $where[] = ['birthday','=',strtotime($birthday)];
        }
        return $where;
    }
}