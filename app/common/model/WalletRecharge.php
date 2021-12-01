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
use EasyWeChat\Factory as EasyWeChat;

class WalletRecharge extends PaddyShop
{
    /**
     * 支付请求
     * @Author: Alan Leung
     * @param {*} $params
     */    
    public static function pay($params = [])
    {       
        // 获取订单信息
        $where = ['id'=>intval($params['id']), 'user_id' => $params['user']['id']];
        $rechargeOrder = self::getOne(['where' => $where]);
        if(empty($rechargeOrder))
        {
            throwException('资源不存在或已被删除');
        }
        if($rechargeOrder['status'] != 0)
        {
            throwException('订单状态不可操作');
        }

        // 支付处理
        $payment = 0;
        if(!empty($params['payment'])){
            $payment = $params['payment'];
        }
        else{
            $payment = $rechargeOrder['payment_id'];
        }
        switch($payment)
        {
            // 微信支付
            case 1:
                $app = self::wxPayConfig();
                $result = $app->order->unify([
                    'body'          => '钱包充值支付-'.$rechargeOrder['recharge_no'],
                    'out_trade_no'  => $rechargeOrder['recharge_no'],
                    'total_fee'     => $rechargeOrder['money'] * 100,
                    // 'spbill_create_ip' => '123.12.12.123', // 可选，如不传该参数，SDK 将会自动获取相应 IP 地址
                    'notify_url'    => config()['paddyshop']['website_url'].'api/wallet.Recharge/wxPayNotify',
                    'trade_type'    => 'JSAPI',
                    'openid'        => $params['user']['openid_weixin'],
                ]);

                $appId = config()['paddyshop']['weixinminiapp_appid'];
                $nonceStr = $result['nonce_str'];
                $prepay_id = $result['prepay_id'];
                $timeStamp = time();
                $key = config()['paddyshop']['weixinpay_key'];
                $paySign = md5("appId=$appId&nonceStr=$nonceStr&package=prepay_id=$prepay_id&signType=MD5&timeStamp=$timeStamp&key=$key");
                $res = [
                    'nonceStr'  =>  $nonceStr,
                    'prepay_id' =>  $prepay_id,
                    'timeStamp' =>  strval($timeStamp),
                    'paySign'   =>  $paySign,
                    'signType'  =>  'MD5',
                ];
                
                return $res;
                break;

            default:
                throwException('请选择支付方式');
                break;
        }    
    }

    public static function notify($type)
    {
        switch($type)
        {
            case 'Weixin':
                $app = self::wxPayConfig();
                $response = $app->handlePaidNotify(function($message, $fail){  
                    $rechargeOrder = self::getOne(['where'=>['recharge_no'=>$message['out_trade_no']]]);
                    // 订单信息
                    if(empty($rechargeOrder) || $rechargeOrder['status'] == 1){
                        return true;
                    }       
                
                    if ($message['return_code'] === 'SUCCESS') { // return_code 表示通信状态，不代表支付状态
                        if ($message['result_code'] === 'SUCCESS') {
                            $payData = [
                                'trade_no'      =>  $message['transaction_id'] ?? '',
                                'buyer_user'    =>  $message['openid'] ?? '',
                                'pay_price'     =>  isset($message['total_fee']) ? ($message['total_fee'] / 100) : 0,
                            ];
                            $data = [
                                'order' =>  $rechargeOrder,
                                'pay'   =>  $payData,
                            ];
                            self::rechargeHandle($data);
                        }
                    } else {
                        return $fail('通信失败，请稍后再通知我');
                    }
                
                    return true; // 返回处理完成                    
                });
                // $response->send();
                return $response;
                break;

            default:
                return false;
                break;
        }
    }

    private static function rechargeHandle($params = [])
    {
        if(empty($params['order']))
        {
            throwException('资源不存在或已被删除');
        }
        if($params['order']['status'] > 0)
        {            
            throwException('订单状态不可操作');
        }

        if(empty($params['order']['payment_id']))
        {
            throwException('支付方式有误');
        }

        return self::transaction(function () use ($params) {
            // $result = empty($GLOBALS['HTTP_RAW_POST_DATA']) ? $this->xmlToArray(file_get_contents('php://input')) : $this->xmlToArray($GLOBALS['HTTP_RAW_POST_DATA']);
            file_put_contents('test.txt', json_encode($params['pay']));

            // 写入支付日志
            $pay_log_data = [
                'user_id'       => $params['order']['user_id'],
                'order_id'      => $params['order']['id'],
                'total_price'   => $params['order']['money'],
                'trade_no'      => $params['pay']['trade_no'] ?? '',
                'buyer_user'    => $params['pay']['buyer_user'] ?? '',
                'pay_price'     => $params['pay']['pay_price'] ?? 0,
                'subject'       => $params['pay']['subject'] ?? '钱包充值',
                'payment_id'    => $params['order']['payment_id'],
                'business_type' => 2,
            ];
            (new PayLog())->add($pay_log_data);

            // 钱包加钱
            Wallet::receiveMoney([
                'user'          =>  ['id'=>$params['order']['user_id']],
                'total_price'   =>  $params['order']['money'],
            ]);

            // 订单标记支付成功
            $upd_data = array(
                'id'            => $params['order']['id'],
                'status'        => 1,
                'pay_money'     => $params['pay']['pay_price'] ?? 0,
                'payment_id'    => $params['order']['payment_id'],
                'pay_time'      => time(),
            );
            WalletRecharge::edit($upd_data);
            
            // 消息通知
            UserMessage::add([
                'user_id'       =>  $params['order']['user_id'],
                'title'         =>  '钱包充值',
                'detail'        =>  '钱包充值成功，金额'.$params['order']['money'].'元',
                'business_id'   =>  $params['order']['id'],
                'business_type' =>  2,
                'type'          =>  0,
                'is_read'       =>  0,
            ]);

            return true;
        });
    }

    /**
     * 微信支付配置
     * @Author: Alan Leung
     */    
    private static function wxPayConfig()
    {
        $config = [
            // 必要配置
            'app_id'             => config()['paddyshop']['weixinminiapp_appid'],
            'mch_id'             => config()['paddyshop']['weixinpay_mch_id'],
            'key'                => config()['paddyshop']['weixinpay_key'],

            // 如需使用敏感接口（如退款、发送红包等）需要配置 API 证书路径(登录商户平台下载 API 证书)
            'cert_path'          => '', // XXX: 绝对路径！！！！
            'key_path'           => '',      // XXX: 绝对路径！！！！

            'notify_url'         => config()['paddyshop']['website_url'].'api/wallet.Recharge/wxPayNotify',
        ];
        return EasyWeChat::payment($config);
    }
}