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
 * 会员收藏夹验证器
 * @Author: Alan Leung
 */
class UserFavorites extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'user_favorites';
    
    protected $rule = [
        'id'                => 'require|integer',
        'user_id'           => 'require|integer',
        'goods_id'          => 'require|integer',
    ];

    protected $message  =   [
        'id.require'                => '参数有误',
        'id.integer'                => '参数有误',
        'user_id.require'           => '用户参数有误',
        'user_id.integer'           => '用户参数有误',
        'goods_id.require'          => '商品参数有误',
        'goods_id.integer'          => '商品参数有误',
    ];

    protected $scene = [
        'add'   =>  ['user_id','goods_id'],
        'del'   =>  ['id','user_id'],
        'checkHasFavorites'=>  ['user_id','goods_id'],
    ];
}