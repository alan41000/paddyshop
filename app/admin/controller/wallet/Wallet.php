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
use app\common\model\Wallet as WalletModel;

class Wallet extends PaddyshopAdmin
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
        $current    = getParams('current');
        $size       = getParams('size');
        $params = [
            'current'       =>  $current,
            'size'          =>  $size,
            'where'         =>  $this->whereBuilder(),
        ];

        $result   = WalletModel::list($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 编辑
     * @Author: Alan Leung
     */    
    public function edit()
    {
        try{
            $id = getParams('id');
            $normal_money = getParams('normal_money');
            $frozen_money = getParams('frozen_money');
            $give_money = getParams('give_money');
    
            $params = [
                'id'                =>  $id,
                'normal_money'      =>  $normal_money,
                'frozen_money'      =>  $frozen_money,
                'give_money'        =>  $give_money,
            ];
    
            $result = WalletModel::adminEditMoney($params);
    
            return app('JsonOutput')->success($result);
        }
        catch(\Exception $e)
        {
            return app('JsonOutput')->fail($e->getMessage());
        }
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