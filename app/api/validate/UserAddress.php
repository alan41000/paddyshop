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
 * 会员地址验证器
 * @Author: Alan Leung
 */
class UserAddress extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'user_address';
    
    protected $rule = [
        'id'                => 'require|integer',
        'user_id'           => 'require|integer',
        'tag'               => 'chsAlphaNum',
        'name'              => 'require|chsAlphaNum',
        'tel'               => 'require|mobile',
        'province'          => 'require|integer',
        'city'              => 'require|integer',
        'county'            => 'integer',
        'address'           => 'require|chsDash',
        'lng'               => 'float',
        'lat'               => 'float',
        'is_default'        => 'integer',
    ];

    protected $message  =   [
        'id.require'                => '参数有误',
        'id.integer'                => '参数有误',
        'user_id.require'           => '用户参数有误',
        'user_id.integer'           => '用户参数有误',
        'tag.chsAlphaNum'           => '标签仅支持中文、英文、数字',
        'name.require'              => '请输入姓名',
        'name.chsAlphaNum'          => '姓名仅支持中文、英文、数字',
        'tel.require'               => '请输入电话号码',
        'tel.mobile'                => '请输入正确的电话号码',
        'province.require'          => '请选择省',
        'province.integer'          => '省数据有误',
        'city.require'              => '请选择城市',
        'city.integer'              => '城市数据有误',
        'county.integer'            => '区县数据有误',
        'address.require'           => '请输入详细地址',
        'address.chsDash'           => '详细地址仅支持汉字、字母、数字和下划线_及破折号-',
        'lng.decimal'               => '经度数据有误',
        'lat.decimal'               => '纬度数据有误',
        'is_default.integer'        => '是否默认地址数据有误',
    ];

    protected $scene = [
        'add'   =>  ['user_id','tag','name','tel','province','city','county','address','lng','lat','is_default'],
        'edit'  =>  ['id','user_id','tag','name','tel','province','city','county','address','lng','lat','is_default'],
        'del'   =>  ['id'],
        'getOne'=>  ['id'],
    ];
}