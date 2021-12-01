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

class GoodsCategory extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'goods_category';

    protected $rule =   [
        'id'                => 'require|integer', 
        'parent_id'         => 'require|integer',
        // 'icon'         => 'string',
        'name'              => 'require|chsDash',
        'vice_name'         => 'chsDash',
        'describe'          => 'chsDash',
        'is_home_recommended' => 'bool',
        'sort'              => 'integer',
        'is_enable'         => 'bool',
        'seo_title'         => 'chsDash',
        'seo_keywords'      => 'chsDash',
        'seo_desc'          => 'chsDash',
    ];
    
    protected $message  =   [
        'id.require'            => '分类数据有误',
        'parent_id.require'     => '请选择上级分类',
        'name.require'          => '请输入分类名称', 
    ];

    protected $scene = [
        'add'   =>  ['parent_id','name','vice_name','describe','is_home_recommended','sort','is_enable','seo_title','seo_keywords','seo_desc'],
        'edit'  =>  ['id','parent_id','name','vice_name','describe','is_home_recommended','sort','is_enable','seo_title','seo_keywords','seo_desc'],
        'del'   =>  ['id'],
    ];
}