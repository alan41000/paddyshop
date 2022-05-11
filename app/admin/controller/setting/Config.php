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
namespace app\admin\controller\setting;

use app\admin\controller\PaddyshopAdmin;
use app\admin\validate\Config as ConfigValidate;
use think\exception\ValidateException;
use app\common\model\Config as ConfigModel;

class Config extends PaddyshopAdmin
{
    protected $autoWriteTimestamp = true;

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
     * 获取设置列表
     * @Author: Alan Leung
     */
    public function getAll()
    {
        $data = ConfigModel::getAll();
		if(!empty($data)){
			foreach ($data as &$v){
				if($v['name'] == 'common_website_logo' || $v['name'] == 'common_website_icon'){
					$v['value'] = config('paddyshop.website_url').$v['value'];
				}
				if(($v['name'] == 'app_weixinminiapp_appsecret' || $v['name'] == 'app_weixinh5_appsecret' || $v['name'] == 'payment_weixin_key') && $this->admin['role_id'] !== 1){
					$v['value'] = '非超级管理员不显示';
				}
			}
		}
        return app('JsonOutput')->success($data);
    }

    /**
     * 设置保存
     * @Author: Alan Leung
     */
    public function save()
    {       
        try {
            $data = request()->param();
            if(!empty($data) && is_array($data)){
                if(ConfigModel::edit($data) === true){
                    cache()->clear();
                    ConfigModel::init();
                    return app('JsonOutput')->success();
                }
            }
            return app('JsonOutput')->fail();
        } catch (\Exception $e) {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }
}