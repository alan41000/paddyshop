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
use app\common\model\WalletRecharge as WalletRechargeModel;
use app\api\validate\WalletRecharge as WalletRechargeValidate;
use think\exception\ValidateException;

class Recharge extends PaddyshopApi
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
     * 创建充值记录
     * @Author: Alan Leung
     */    
    public function createRecharge()
    {
        try{
            $money = getParams('money');
            $payment = getParams('payment');
            $walletInfo = WalletModel::getOne(['where'=>['user_id'=>$this->user['id']]]);
            $data = [
                'user_id'   =>  $this->user['id'],
                'wallet_id' =>  $walletInfo['id'],
                'recharge_no'=> date('YmdHis').getNumberCode(6),
                'status'    =>  0,
                'money'     =>  $money,
                'pay_money' =>  0,
                'payment_id'=>  $payment,
                'pay_time'  =>  0,
            ];
            validate(WalletRechargeValidate::class)->scene('add')->check($data);
            $res = WalletRechargeModel::add($data);
            if($res){
                return app('JsonOutput')->success($res);
            }
            return app('JsonOutput')->fail();
        } catch (ValidateException $e) {
            return app('JsonOutput')->fail($e->getError());
        }
        catch(\Exception $e){
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

    /**
     * 充值支付
     * @Author: Alan Leung
     */    
    public function pay()
    {
        try{
            $rechargeId     = getParams('rechargeId');
            $payment        = getParams('payment');
	        $isH5                = !empty(getParams('isH5'));
            $data = [
                'id'                =>  $rechargeId,
                'user'              =>  $this->user,
                'payment'           =>  $payment,
            ];
            $res = WalletRechargeModel::pay($data,$isH5);
            if($res)
            {
                return app('JsonOutput')->success($res);
            }
            else
            {
                return app('JsonOutput')->fail();
            }
        }
        catch(\Exception $e){
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

    public function wxPayNotify()
    {
        try{
            // $result = empty($GLOBALS['HTTP_RAW_POST_DATA']) ? $this->xmlToArray(file_get_contents('php://input')) : $this->xmlToArray($GLOBALS['HTTP_RAW_POST_DATA']);
            // file_put_contents('test.txt', json_encode($result));
	        $isH5 = getParams('ish5');
	        if(!empty($isH5) && $isH5 == 1){
		        $isH5 = true;
	        }else{
		        $isH5 = false;
	        }

            if(WalletRechargeModel::notify('Weixin',$isH5) === true)
            {
                return xml(['return_code' => 'SUCCESS', 'return_msg' => 'OK']);
            }
            return xml(['return_code' => 'FAIL']);
        }catch(\Exception $e)
        {
            trace($e->getMessage(), 'error');
            return xml(['return_code' => 'FAIL']);
        }
    }

    /**
     * 充值记录列表
     * @Author: Alan Leung
     */    
    public function list()
    {
        try{
            $current    = getParams('current');
            $size       = getParams('size');
            $params = [
                'where'     =>  [
                    ['user_id','=',$this->user['id']]
                ],
                'current'   =>  $current,
                'size'      =>  $size,
            ];
            $res = WalletRechargeModel::list($params);
            if($res)
            {
                return app('JsonOutput')->success($res);
            }
            else
            {
                return app('JsonOutput')->fail();
            }
        }catch(\Exception $e){
            return app('JsonOutput')->fail($e->getMessage());
        }
    }
}