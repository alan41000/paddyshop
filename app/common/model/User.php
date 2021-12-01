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

class User extends PaddyShop
{
    protected $type = [
        'birthday'    =>  'timestamp',
    ];

    /**
     * 用户名登录
     * @Author: Alan Leung
     * @param {*} $params
     */
    public static function usernameLogin($params)
    {
        $where = ['username' => $params['username']];
        $user = User::where($where)->field('id,username,password,salt,status,is_delete_time')->find();

        if(empty($user))
        {
            return app('JsonOutput')->fail('账户不存在');
        }

        $password = loginPwdEncryption($params['password'], $user['salt']);
        if($password != $user['password'])
        {
            return app('JsonOutput')->fail('密码错误');
        }

        // 重写数据
        $salt = getNumberCode(6);
        $token = createToken($user['id']);
        $data = [
            'id'            =>  $user['id'],
            'salt'          =>  $salt,
            'password'      =>  loginPwdEncryption($params['password'], $salt),
            'token'         =>  $token,
            'token_expire'  =>  time() + 86400, //1天有效期
            'last_login'    =>  time(),
            'last_ip'       =>  '',
        ];

        if(self::edit($data))
        {
            $user = User::where($where)->field('
            id,
            username,
            nickname,
            token,
            token_expire,
            status,
            mobile,
            email,
            gender,
            avatar,
            province,
            city,
            birthday,
            address,
            integral,
            locking_integral,
            referrer,
            openid_alipay,
            openid_weixin,
            unionid_weixin,
            openid_weixin_web,
            openid_baidu,
            openid_toutiao,
            openid_qq,
            unionid_qq
            ')->find();
            return app('JsonOutput')->success($user);
        }

        return app('JsonOutput')->fail('系统开了个小差，请稍后再试！');
    }

    public static function wechatMiniAppAuth($params)
    {
        // 查询会员是否已注册
        $userInfo = User::where(['openid_weixin'=>$params['user_base_data']['openid']])->find();
        if(empty($userInfo))
        {
            $user_data = [
                'openid_alipay'         => '',
                'openid_weixin'         => $params['user_base_data']['openid'],
                'unionid_weixin'        => $params['user_base_data']['unionid'] ?? '',
                'openid_weixin_web'     => '',
                'openid_baidu'          => '',
                'openid_toutiao'        => '',
                'openid_qq'             => '',
                'unionid_qq'            => '',
                'status'                => 0,
                'salt'                  => '',
                'password'              => '',
                'token'                 => createToken(time()),
                'token_expire'          => time() + 86400 * 30,
                'username'              => '',
                'nickname'              => $params['nickName'],
                'mobile'                => '',
                'email'                 => '',
                'gender'                => $params['gender'],
                'avatar'                => $params['avatarUrl'],
                'province'              => $params['province'],
                'city'                  => $params['city'],
                'birthday'              => 0,
                'address'               => '',
                'integral'              => 0,
                'locking_integral'      => 0,
                'referrer'              => '',
                'is_delete_time'        => 0,
                'last_login'            => time(),
                'last_ip'               => '',
            ];

            $userInfo = self::add($user_data);
            if($userInfo && config()['paddyshop']['wallet_enable'] == '1'){
                Wallet::createWalletIfNotExist($userInfo['id']);
            }
            return $userInfo;
        }
        else
        {
            if(config()['paddyshop']['wallet_enable'] == '1'){
                Wallet::createWalletIfNotExist($userInfo['id']);
            }            
            $user_data = [
                'id'                    => $userInfo['id'],
                'token'                 => createToken(time()),
                'token_expire'          => time() + 86400 * 30,
                'nickname'              => $params['nickName'],
                'gender'                => $params['gender'],
                'avatar'                => $params['avatarUrl'],
                'province'              => $params['province'],
                'city'                  => $params['city'],
                'last_login'            => time(),
            ];

            if(self::edit($user_data))
            {
                return User::where(['openid_weixin'=>$params['user_base_data']['openid']])->find();
            }
            throwException('系统错误');
        }
    }
}