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
namespace app\api\controller\wallet;

use app\api\controller\PaddyshopApi;
use app\common\model\Wallet as WalletModel;

class Wallet extends PaddyshopApi
{
    /**
     * 构造方法
     * @Author: Alan Leung
     */
    public function __construct()
    {
        // 调用父类前置方法
        parent::__construct();

        if(config()['paddyshop']['wallet_enable'] !== '1'){
            die(json_encode(['msg'=>'钱包功能未开启','code' => 10000]));
        }
    }

    /**
     * 获取一条钱包记录
     * @Author: Alan Leung
     */
    public function getOne()
    {
        try
        {
            $user_id = $this->user['id'];
            $res = WalletModel::createWalletIfNotExist($user_id);
            return app('JsonOutput')->success($res);
        }
        catch(\Exception $e)
        {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }
}