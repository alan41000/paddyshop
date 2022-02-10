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
namespace app\api\controller\common;

use app\api\controller\PaddyshopApi;

class Config extends PaddyshopApi
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
     * 前端系统配置
     * @Author: Alan Leung
     */    
    public function apiConfig()
    {
        $data = [
            'website_name'  =>  config()['paddyshop']['website_name'],
            'website_logo'  =>  config()['paddyshop']['website_logo'],
            'website_icon'  =>  config()['paddyshop']['website_icon'],
            'upload_type'   =>  config()['paddyshop']['upload_type'],
            'upload_type_aliyunoss_bucket'  =>  config()['paddyshop']['upload_type_aliyunoss_bucket'],
            'upload_type_aliyunoss_endpoint'=>  config()['paddyshop']['upload_type_aliyunoss_endpoint'],
        ];

        return app('JsonOutput')->success($data);
    }
}