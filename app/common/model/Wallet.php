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

namespace app\common\model;

use think\Exception;

class Wallet extends PaddyShop
{
    /**
     * 添加
     * @Author: Alan Leung
     * @param {*} $data
     */    
    public static function add($userId)
    {
        $data = [
            'user_id'       =>  $userId,
            'status'        =>  0,
            'normal_money'  =>  0,
            'frozen_money'  =>  0,
            'give_money'    =>  0,
            'earnest_money' =>  0,
        ];

        $wallet = Wallet::create($data);
        if($wallet)
        {
            return $wallet;
        }

        return false;
    }

    /**
     * 支付扣款
     * @Author: Alan Leung
     * @param {*} $data
     */    
    public static function payMoney($data)
    {
        return self::transaction(function () use ($data) {
            // 获取钱包信息
            $walletInfo = Wallet::getOne(['where'=>['user_id'=>$data['user']['id']]]);
            // 检查资金余额
            if(!empty($walletInfo) && $walletInfo['normal_money'] < $data['total_price']){
                throwException('余额不足');
            }
            // 扣款
            Wallet::where('id', $walletInfo['id'])->dec('normal_money', $data['total_price'])->update();
            // 写用户钱包日志
            $wallet_log_data = [
                'user_id'       =>  $data['user']['id'],
                'wallet_id'     =>  $walletInfo['id'],
                'serial_no'     =>  date('YmdHis').getNumberCode(6),
                'business_type' =>  3,
                'money_type'    =>  0,
                'operation_type'=>  0,
                'operation_money'=> $data['total_price'],
                'original_money'=>  $walletInfo['normal_money'],
                'latest_money'  =>  $walletInfo['normal_money'] - $data['total_price'],
                'msg'           =>  '订单支付',
            ];
            WalletLog::add($wallet_log_data);

            return true;
        });
    }

    /**
     * 收款
     * @Author: Alan Leung
     * @param {*} $data
     */    
    public static function receiveMoney($data)
    {
        return self::transaction(function () use ($data) {
            // 获取钱包信息
            $walletInfo = Wallet::getOne(['where'=>['user_id'=>$data['user']['id']]]);
            // 收款
            Wallet::where('id', $walletInfo['id'])->inc('normal_money', $data['total_price'])->update();
            // 写用户钱包日志
            $wallet_log_data = [
                'user_id'       =>  $data['user']['id'],
                'wallet_id'     =>  $walletInfo['id'],
                'serial_no'     =>  date('YmdHis').getNumberCode(6),
                'business_type' =>  1,
                'money_type'    =>  0,
                'operation_type'=>  1,
                'operation_money'=> $data['total_price'],
                'original_money'=>  $walletInfo['normal_money'],
                'latest_money'  =>  $walletInfo['normal_money'] + $data['total_price'],
                'msg'           =>  '钱包充值',
            ];
            WalletLog::add($wallet_log_data);

            return true;
        });
    }

    /**
     * 钱包不存在则创建
     * @Author: Alan Leung
     * @param {*} $userId
     */    
    public static function createWalletIfNotExist($userId)
    {
        $walletInfo = self::getOne(['where'=>['user_id'=>$userId]]);
        if(empty($walletInfo)){
            return self::add($userId);
        }
        return $walletInfo;
    }

    /**
     * 管理员修改钱包金额
     * @Author: Alan Leung
     * @param {*} $data
     */    
    public static function adminEditMoney($data)
    {
        return self::transaction(function () use ($data) {
            // 获取钱包信息
            $walletInfo = self::getOne(['where'=>['id'=>$data['id']]]);
            // 修改钱包
            self::edit($data);

            $walletData = [];
            if($data['normal_money'] !== $walletInfo['normal_money']){
                $walletData[] = 'normal_money';
            }
            if($data['frozen_money'] !== $walletInfo['frozen_money']){
                $walletData[] = 'frozen_money';
            }
            if($data['give_money'] !== $walletInfo['give_money']){
                $walletData[] = 'give_money';
            }

            foreach($walletData as $v)
            {
                switch($v){
                    case 'normal_money':
                        // 写用户钱包日志
                        $wallet_log_data = [
                            'user_id'       =>  $walletInfo['user_id'],
                            'wallet_id'     =>  $walletInfo['id'],
                            'serial_no'     =>  date('YmdHis').getNumberCode(6),
                            'business_type' =>  0,
                            'money_type'    =>  0,
                            'operation_type'=>  $data['normal_money'] > $walletInfo['normal_money'] ? 1 : 0,
                            'operation_money'=> $data['normal_money'] > $walletInfo['normal_money'] ? $data['normal_money'] - $walletInfo['normal_money'] : $walletInfo['normal_money'] - $data['normal_money'],
                            'original_money'=>  $walletInfo['normal_money'],
                            'latest_money'  =>  $data['normal_money'],
                            'msg'           =>  '管理员操作',
                        ];
                        WalletLog::add($wallet_log_data);
                        // 发消息
                        $msg = $wallet_log_data['operation_type'] == 1 ? '增加'.$wallet_log_data['operation_money'] : '减少'.$wallet_log_data['operation_money'] ;
                        UserMessage::add([
                            'user_id'       =>  $walletInfo['user_id'],
                            'title'         =>  '钱包余额变动',
                            'detail'        =>  '管理员操作，有效金额金额'. $msg .'元',
                            'business_id'   =>  0,
                            'business_type' =>  0,
                            'type'          =>  0,
                            'is_read'       =>  0,
                        ]);

                        break;

                    case 'frozen_money':
                        // 写用户钱包日志
                        $wallet_log_data = [
                            'user_id'       =>  $walletInfo['user_id'],
                            'wallet_id'     =>  $walletInfo['id'],
                            'serial_no'     =>  date('YmdHis').getNumberCode(6),
                            'business_type' =>  0,
                            'money_type'    =>  1,
                            'operation_type'=>  $data['frozen_money'] > $walletInfo['frozen_money'] ? 1 : 0,
                            'operation_money'=> $data['frozen_money'] > $walletInfo['frozen_money'] ? $data['frozen_money'] - $walletInfo['frozen_money'] : $walletInfo['frozen_money'] - $data['frozen_money'],
                            'original_money'=>  $walletInfo['frozen_money'],
                            'latest_money'  =>  $data['frozen_money'],
                            'msg'           =>  '管理员操作',
                        ];
                        WalletLog::add($wallet_log_data);
                        // 发消息
                        $msg = $wallet_log_data['operation_type'] == 1 ? '增加'.$wallet_log_data['operation_money'] : '减少'.$wallet_log_data['operation_money'];
                        UserMessage::add([
                            'user_id'       =>  $walletInfo['user_id'],
                            'title'         =>  '钱包余额变动',
                            'detail'        =>  '管理员操作，冻结金额金额'. $msg .'元',
                            'business_id'   =>  0,
                            'business_type' =>  0,
                            'type'          =>  0,
                            'is_read'       =>  0,
                        ]);

                        break;

                        case 'give_money':
                            // 写用户钱包日志
                            $wallet_log_data = [
                                'user_id'       =>  $walletInfo['user_id'],
                                'wallet_id'     =>  $walletInfo['id'],
                                'serial_no'     =>  date('YmdHis').getNumberCode(6),
                                'business_type' =>  0,
                                'money_type'    =>  1,
                                'operation_type'=>  $data['give_money'] > $walletInfo['give_money'] ? 1 : 0,
                                'operation_money'=> $data['give_money'] > $walletInfo['give_money'] ? $data['give_money'] - $walletInfo['give_money'] : $walletInfo['give_money'] - $data['give_money'],
                                'original_money'=>  $walletInfo['give_money'],
                                'latest_money'  =>  $data['give_money'],
                                'msg'           =>  '管理员操作',
                            ];
                            WalletLog::add($wallet_log_data);
                            // 发消息
                            $msg = $wallet_log_data['operation_type'] == 1 ? '增加'.$wallet_log_data['operation_money'] : '减少'.$wallet_log_data['operation_money'];
                            UserMessage::add([
                                'user_id'       =>  $walletInfo['user_id'],
                                'title'         =>  '钱包余额变动',
                                'detail'        =>  '管理员操作，赠送金额金额'. $msg .'元',
                                'business_id'   =>  0,
                                'business_type' =>  0,
                                'type'          =>  0,
                                'is_read'       =>  0,
                            ]);
    
                            break;
                        default :
                            break;
                }
            }
            return true;
        });
        return false;
    }
}