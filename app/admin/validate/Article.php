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

class Article extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'article';

    protected $rule =   [
        'id'                => 'require|integer', 
        'title'             => 'require|max:255',
        'content'           => 'require',
        'category_id'       => 'require',
    ];
    
    protected $message  =   [
        'title.require'             => '请输入标题',
        'content.require'           => '请输入内容',
        'category_id.require'       => '请选择分类', 
    ];

    protected $scene = [
        'add'   =>  ['title','content','category_id'],
        'edit'  =>  ['id','title','content','category_id'],
        'del'   =>  ['id'],
    ];
}