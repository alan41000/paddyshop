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

namespace app\admin\validate;

use think\Validate;

class GoodsComments extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'goods_comments';

    protected $rule =   [
        'id'                => 'require|integer', 
        'content'           => 'require',
        'reply'             => 'require',
        'is_show'           => 'require|integer',
    ];
    
    protected $message  =   [
        'id.require'            => '参数有误',
        'id.integer'            => '参数有误',
        'content.require'       => '请输入评价内容',
        'reply.require'         => '请输入回复内容',
        'is_show.require'       => '请选择是否显示',
        'is_show.integer'       => '是否显示数据有误',
    ];

    protected $scene = [
        'add'   =>  [],
        'edit'  =>  ['id','content','reply','is_show','is_reply'],
        'del'   =>  ['id'],
        'fieldUpdate'   =>  ['id'],
    ];
}