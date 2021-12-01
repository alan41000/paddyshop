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
use app\common\model\WalletLog as WalletLogModel;

class WalletLog extends PaddyshopApi
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
     * 钱包日志记录
     * @Author: Alan Leung
     */
    public function list()
    {
        $current    = getParams('current');
        $size       = getParams('size');
        $type       = getParams('type');

        $where = [];
        $where[] = ['user_id','=',$this->user['id']];

        if(!empty($type))
        {
            switch($type)
            {
                case 'today':
                    $start_time = getSearchTime('today')['start_time'];
                    $end_time = getSearchTime('today')['end_time'];
                    $where[] = ['create_time','>',$start_time];
                    $where[] = ['create_time','<=',$end_time];
                    break;

                case 'yesterday':
                    $start_time = getSearchTime('yesterday')['start_time'];
                    $end_time = getSearchTime('yesterday')['end_time'];
                    $where[] = ['create_time','>',$start_time];
                    $where[] = ['create_time','<=',$end_time];
                    break;

                case 'month':
                    $start_time = getSearchTime('month')['start_time'];
                    $end_time = getSearchTime('month')['end_time'];
                    $where[] = ['create_time','>',$start_time];
                    $where[] = ['create_time','<=',$end_time];
                    break;

                default:
                    break;
            }
        }

        $params = [
            'current'       =>  $current,
            'size'          =>  $size,
            'where'         =>  $where
        ];

        $result   = WalletLogModel::list($params);

        return app('JsonOutput')->success($result);
    }
}