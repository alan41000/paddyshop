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
namespace app\api\controller\user;

use app\api\controller\PaddyshopApi;
use app\common\model\Wallet as WalletModel;
use app\common\model\CouponUser as CouponUserModel;
use app\common\model\User as UserModel;
use app\common\model\UserFavorites as UserFavoritesModel;

/**
 * 用户
 * @author   Alan Leung
 * @version  1.0.0
 */
class User extends PaddyshopApi
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

        public  function  record()
        {
            try {
                $user_id = $this->user['id'];
                $wallet =  WalletModel::getOne(['field'=>'normal_money','where'=>['user_id'=>$user_id]]);
                $res = [
                    'wallet'    => empty($wallet) ? 0 : $wallet['normal_money'],
                    'coupon'    =>  CouponUserModel::count(['where'=>[
                        ['user_id','=',$user_id],
                        ['use_time','=',0],
                        ['end_time','>',time()],
                    ]]),
                    'integral'  =>  UserModel::getOne(['field'=>'integral','where'=>['id'=>$user_id]])['integral'],
                    'favorites' =>  UserFavoritesModel::count(['where'=>['user_id'=>$user_id]]),
                ];
                return app('JsonOutput')->success($res);
            }catch (\Exception $e){
                return app('JsonOutput')->fail($e->getMessage());
            }
        }
}
?>