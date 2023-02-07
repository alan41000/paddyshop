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

	private static  function  userAdd($params,$type)
	{
		$user_data = [];
		switch ($type){
			case 'wechatMiniApp':
				$user_data = [
					'unionid_weixin' => $params['unionid'] ?? '',
					'openid_weixin' => $params['openid'] ?? '',
					'token'        => createToken(time()),
					'token_expire' => time() + 86400 * 30,
					'nickname'     => '微信用户'.time(), // TODO 优化用户名
					'last_login'   => time(),
					'last_ip'      => getRealIP(),
				];
				break;

			case 'wechatH5':
				$user_data = [
					'unionid_weixin' => $params['raw']['unionid'] ?? '',
					'openid_weixin_web' => $params['raw']['openid'],
					'token'          => createToken(time()),
					'token_expire'   => time() + 86400 * 30,
					'nickname'       => $params['raw']['nickname'],
					'gender'         => $params['raw']['sex'],
					'avatar'         => $params['raw']['headimgurl'],
					'province'       => $params['raw']['province'],
					'city'           => $params['raw']['city'],
					'last_login'     => time(),
					'last_ip'      => getRealIP(),
				];
				break;

			default:
				throwException('系统开了个小差，请稍后再试！');
		}

		$userInfo = self::add($user_data);
		if($userInfo && config()['paddyshop']['wallet_enable'] == '1'){
			Wallet::createWalletIfNotExist($userInfo['id']);
		}
		return $userInfo;
	}

	private static  function  userUpdate($params,$userInfo,$type)
	{
		if(config()['paddyshop']['wallet_enable'] == '1'){
			Wallet::createWalletIfNotExist($userInfo['id']);
		}

		$user_data = [];
		switch ($type){
			case 'wechatMiniApp':
				$user_data = [
					'id'           => $userInfo['id'],
					'unionid_weixin' => $params['unionid'] ?? '',
					'openid_weixin' => $params['openid'] ?? '',
					'token'        => createToken(time()),
					'token_expire' => time() + 86400 * 30,
					'last_login'   => time(),
					'last_ip'      => getRealIP(),
				];
				break;

			case 'wechatH5':
				$user_data = [
					'id'             => $userInfo['id'],
					'unionid_weixin' => $params['raw']['unionid'] ?? '',
					'openid_weixin_web' => $params['raw']['openid'] ?? '',
					'token'          => createToken(time()),
					'token_expire'   => time() + 86400 * 30,
					'nickname'       => $params['raw']['nickname'],
					'gender'         => $params['raw']['sex'],
					'avatar'         => $params['raw']['headimgurl'],
					'province'       => $params['raw']['province'],
					'city'           => $params['raw']['city'],
					'last_login'     => time(),
				];
				break;

			default:
				throwException('系统开了个小差，请稍后再试！');
		}

		if(self::edit($user_data))
		{
			if($type == 'wechatMiniApp'){
				return User::where(['openid_weixin'=>$params['openid']])->find();
			}
			if($type == 'wechatH5'){
				return User::where(['openid_weixin_web'=>$params['raw']['openid']])->find();
			}
		}
		throwException('系统开了个小差，请稍后再试！');
	}

	public static function wechatMiniAppAuth($params)
	{
		$unionid = $params['unionid'] ?? '';
		if(!empty($unionid)){
			$userInfo = User::where(['unionid_weixin'=>$unionid])->find();
			if(empty($userInfo)){
				return self::userAdd($params,'wechatMiniApp');
			}else{
				return self::userUpdate($params,$userInfo,'wechatMiniApp');
			}
		}else{
			$userInfo = User::where(['openid_weixin'=>$params['openid']])->find();
			if(empty($userInfo)){
				return self::userAdd($params,'wechatMiniApp');
			}else{
				return self::userUpdate($params,$userInfo,'wechatMiniApp');
			}
		}
	}

	public static function wechatH5Auth($params)
	{
		$unionid = $params['raw']['unionid'] ?? '';
		if(!empty($unionid)){
			$userInfo = User::where(['unionid_weixin'=>$unionid])->find();
			if(empty($userInfo)){
				return self::userAdd($params,'wechatH5');
			}else{
				return self::userUpdate($params,$userInfo,'wechatH5');
			}
		}else{
			$userInfo = User::where(['openid_weixin_web'=>$params['raw']['openid']])->find();
			if(empty($userInfo)){
				return self::userAdd($params,'wechatH5');
			}else{
				return self::userUpdate($params,$userInfo,'wechatH5');
			}
		}
	}
}