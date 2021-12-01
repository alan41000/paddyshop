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

namespace app\api\validate;

use think\Validate;

/**
 * 钱包充值验证器
 * @Author: Alan Leung
 */
class WalletRecharge extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'wallet_recharge';
    
    protected $rule = [
        'id'            => 'require|integer|gt:0',
        'user_id'       => 'require|integer|gt:0',
        'wallet_id'     => 'require|integer|gt:0',
        'money'         => 'require|float|gt:0',
        'payment_id'    => 'require|integer|gt:0',
    ];
    
    protected $message  =   [
        'id.require'            => '参数有误',
        'id.integer'            => '参数有误',
        'user_id.require'       => '用户数据有误',
        'user_id.integer'       => '用户数据有误',
        'user_id.gt'            => '用户数据有误',
        'wallet_id.require'     => '钱包数据有误',
        'wallet_id.integer'     => '钱包数据有误',
        'wallet_id.gt'          => '钱包数据有误',
        'money.require'         => '请输入充值金额',
        'money.float'           => '请输入正确的充值金额',
        'payment_id.require'    => '请选择支付方式',
        'payment_id.integer'    => '支付方式有误',
        'payment_id.gt'         => '请选择支付方式',
    ];

    protected $scene = [
        'add'           =>  ['user_id','wallet_id','money','payment_id'],
    ];
}