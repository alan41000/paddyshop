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
namespace app\api\controller\store;

use app\api\controller\PaddyshopApi;

class Payment extends PaddyshopApi
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
    
    public function list()
    {
        $data = [];
        if(config()['paddyshop']['weixinpay_enable'] == '1'){
            $data[] = [
                'id'    =>  1,
                'name'  =>  '微信支付',
                'icon'  =>  'weixin-fill',
                'iconColor'    =>  '#07c160',
            ];
        }

        if(config()['paddyshop']['wallet_enable'] == '1'){
            $data[] = [
                'id'    =>  2,
                'name'  =>  '钱包支付',
                'icon'  =>  'rmb-circle-fill',
                'iconColor'    =>  '#c71d24',
            ];
        }

        return app('JsonOutput')->success($data);
    }
}