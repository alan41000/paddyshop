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
namespace app\api\controller\auth;

use EasyWeChat\Factory as EasyWechat;
use app\api\validate\User as UserValidate;
use app\api\controller\PaddyshopApi;
use app\common\model\User as UserModel;
use think\exception\ValidateException;

class Auth extends PaddyshopApi
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
     * 用户名登录
     * @Author: Alan Leung
     */
    public function usernameLogin()
    {
        $username   = getParams('username');
        $password   = getParams('password');

        $data = [
            'username'      =>  $username,
            'password'      =>  $password,
        ];

        try {
            validate(UserValidate::class)->scene('usernameLogin')->check($data);
            $loginResult = UserModel::usernameLogin($data);
            return $loginResult;
        } catch (ValidateException $e) {
            return app('JsonOutput')->fail($e->getError());
        }
    }
    
    /**
     * 微信小程序授权登录
     * @Author: Alan Leung
     * @param {string} $authcode
     * @param {string} $iv
     * @param {string} $encryptedData
     */    
    public function wechatMiniAppAuth(string $authcode,string $iv,string $encryptedData)
    {
        try
        {
            $config = [
                'app_id' => config()['paddyshop']['weixinminiapp_appid'],
                'secret' => config()['paddyshop']['weixinminiapp_appsecret'],
            
                // 下面为可选项
                // 指定 API 调用返回结果的类型：array(default)/collection/object/raw/自定义类名
                'response_type' => 'array',
            
                'log' => [
                    'level' => 'debug',
                    'file' => __DIR__.'/wechat.log',
                ],
            ];
            
            $app = EasyWechat::miniProgram($config);
            $user_base_data = $app->auth->session($authcode);
            if(isset($user_base_data['session_key']) && isset($user_base_data['openid']))
            {
                $decryptedData = $app->encryptor->decryptData($user_base_data['session_key'], $iv, $encryptedData);
                $decryptedData['user_base_data'] = $user_base_data;
                $userInfo = UserModel::wechatMiniAppAuth($decryptedData);
                if($userInfo)
                {
                    return app('JsonOutput')->success($userInfo);
                }
            }
            else
            {
                throwException($user_base_data['errmsg']);
            }
        } catch (\Exception $e) {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

	/**
	 * 微信H5授权登录
	 * @Author: Alan Leung
	 * @param {string} $code
	 */
	public  function  wechatH5Auth(string $code)
	{
		try{
			$config = [
				'app_id' => config()['paddyshop']['weixinh5_appid'],
				'secret' => config()['paddyshop']['weixinh5_appsecret'],

				// 指定 API 调用返回结果的类型：array(default)/collection/object/raw/自定义类名
				'response_type' => 'array',
			];

			$app = EasyWechat::officialAccount($config);
			$res = $app->oauth->userFromCode($code)->toArray();;
			if(isset($res['id']) && isset($res['raw'])){
				$userInfo = UserModel::wechatH5Auth($res);
				if($userInfo)
				{
					return app('JsonOutput')->success($userInfo);
				}
			}
			throwException('授权登录失败');
		}catch (\Exception $e){
			return app('JsonOutput')->fail($e->getMessage());
		}
	}
}