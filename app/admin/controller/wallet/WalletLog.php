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
namespace app\admin\controller\wallet;

use app\admin\controller\PaddyshopAdmin;
use app\common\model\WalletLog as WalletLogModel;

class WalletLog extends PaddyshopAdmin
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
     * 钱包日志记录
     * @Author: Alan Leung
     */
    public function list()
    {
        $current    = getParams('current');
        $size       = getParams('size');
        $params = [
            'current'       =>  $current,
            'size'          =>  $size,
            'where'         =>  $this->whereBuilder(),
        ];

        $result   = WalletLogModel::list($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 条件构造器
     * @Author: Alan Leung
     */    
    private function whereBuilder()
    {
        $user_id = getParams('user_id');
        $where = [];
        if(!empty($user_id)){
            $where[] = ['user_id','=',$user_id];
        }
        return $where;
    }
}