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

namespace app\api\controller;

use app\BaseController;
use think\facade\Request;
use think\facade\Cache;
use think\facade\Db;
use app\common\model\Config as ConfigModel;

class PaddyshopApi extends BaseController
{
    // Token
    public $token;

    // 会员信息
    protected $user;

    // 登录控制器白名单
    protected $loginWhiteList = [
        'usernamelogin',
        'detail',
        'banner',
        'indexlist',
        'categorylist',
        'wechatminiappauth',
        'search',
        'navlist',
        'wxpaynotify',
        'apiconfig',
	    'wechath5auth',
	    'getwechatsignpackage',
	    'orderrecordbarrage',
	    'getgoodsrecommend',
	    'couponlist',
	    'goodscouponlist'
    ];

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

        // 网站状态
        $this->siteStstusCheck();

		// 公共数据初始化
		$this->commonInit();
    }

    /**
     * 是否需要登录
     * @Author: Alan Leung
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
     * 验证Token
     * @Author: Alan Leung
     */
    private function checkToken()
    {
        // 获取token
        $data = Cache::remember('token:' . $this->token, function () {
            return Db::name('User')->withoutField('password,salt')->where(['token' => $this->token])->find();
        });

        // 存在Token则进行验证
        if(!is_null($data)) {
            // 检测Token是否过期
            if (!empty($data['token_expire']) && $data['token_expire'] > time() ) {
                $this->user = $data;
                return true;
            }
        }

        return false;
    }

    /**
     * 检查网站是否开启
     * @Author: Alan Leung
     */    
    private function siteStstusCheck()
    {
        if(config()['paddyshop']['website_enable'] !== '1'){
            die(json_encode(['msg'=>'网站关闭中，请稍后访问。','code' => 999]));
        }
    }

    /**
     * 系统初始化
     * @access private
     * @return void
     */
    private function systemInit()
    {
        // 配置初始化
        ConfigModel::init();
    }

    /**
     * 公共数据初始化
     * @Author: Alan Leung
     */    
    private function commonInit()
    {
        // 公共参数赋值
        $token = Request::header('PaddyShopToken');
        $this->token = isset($token) && !empty($token) ? $token : '';

        // 是否需要登录
        if($this->isNeedLogin())
        {
            // 验证Token
            if (!$this->checkToken()) {
	            crosHeader();
                // 未授权，请重新登录(401)
                die(json_encode(['msg'=>'登录失效，请重新登录！','code'=>401]));
            }
        }
    }
}