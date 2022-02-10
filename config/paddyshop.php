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

return [
    // 系统版本
    'APPLICATION_VERSION'       => 'v0.1.0',

    // 网站名称
    'website_name'              => cache('common_website_name'),

    // 网站地址
    'website_url'               => cache('common_website_url'),

    // 网站Logo
    'website_logo'              => cache('common_website_url').cache('common_website_logo'),

    // 网站图标
    'website_icon'              => cache('common_website_url').cache('common_website_icon'),

    // 网站关闭
    'website_enable'            => cache('common_website_enable'),

    // 库存扣减规则
    'goods_inventory_rules'     => cache('common_goods_inventory_rules'),
    
    // 文件上传类型
    'upload_type'               => cache('upload_type'),

    // 阿里云OssBucket
    'upload_type_aliyunoss_bucket'          => cache('upload_type_aliyunoss_bucket'),

    // endpoint
    'upload_type_aliyunoss_endpoint'        => cache('upload_type_aliyunoss_endpoint'),

    // accessKeyId
    'upload_type_aliyunoss_accessKeyId'     => cache('upload_type_aliyunoss_accessKeyId'),

    // accessKeySecret
    'upload_type_aliyunoss_accessKeySecret' => cache('upload_type_aliyunoss_accessKeySecret'),

    // roleArn
    'upload_type_aliyunoss_roleArn'         => cache('upload_type_aliyunoss_roleArn'),

    // 微信公众号AppID
    'weixinh5_appid'            => cache('app_weixinh5_appid'),

    // 微信公众号AppSecret
    'weixinh5_appsecret'        => cache('app_weixinh5_appsecret'),

    // 微信公众号AuthType
    'weixinh5_auth_type'        => cache('app_weixinh5_auth_type'),
    
    // 微信小程序AppID
    'weixinminiapp_appid'       => cache('app_weixinminiapp_appid'),

    // 微信小程序AppSecret
    'weixinminiapp_appsecret'   => cache('app_weixinminiapp_appsecret'),
    
    // 微信支付启用
    'weixinpay_enable'          => cache('payment_weixin_enable'),   

    // 微信支付mch_id
    'weixinpay_mch_id'          => cache('payment_weixin_mchid'),
    
    // 微信支付key
    'weixinpay_key'             => cache('payment_weixin_key'),
    
    // 微信支付证书cert
    'weixinpay_apiclient_cert'  => cache('payment_weixin_apiclient_cert'),

    // 微信支付证书key
    'weixinpay_apiclient_key'   => cache('payment_weixin_apiclient_key'),

    // 钱包支付启用
    'wallet_enable'             => cache('payment_wallet_enable'),
];