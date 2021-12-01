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

class System extends PaddyshopAdmin
{
    /**
     * 构造方法
     * @Author: Alan Leung
     * @Date: 2021-10-18 16:51:20
     */    
    public function __construct()
    {
        // 调用父类前置方法
        parent::__construct();
    }

    /**
     * 清除缓存
     * @Author: Alan Leung
     */    
    public function clearCache()
    {
        cache()->clear();
        return app('JsonOutput')->success();
    }
}