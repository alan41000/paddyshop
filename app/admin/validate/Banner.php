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

/**
 * 海报验证器
 * @Author: Alan Leung
 */
class Banner extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'banner';
    
    protected $rule = [
        'id'                =>  'require|integer',    
        'platform'          =>  'require',
        'event_type'        =>  'integer',
        'images_url'        =>  'require',
        'name'              =>  'require',
        'is_enable'         =>  'boolean',
        'sort'              =>  'integer',
    ];
    
    protected $message  =   [
        'name.require'          => '请输入名称',
        'platform.require'      => '请选择平台',
        'images_url.require'    => '请上传图片',
    ];

    protected $scene = [
        'add'   =>  ['platform','event_type','images_url','images_url','name','is_enable','sort'],
        'edit'  =>  ['id','platform','event_type','images_url','images_url','name','is_enable','sort'],
        'del'   =>  ['id'],
    ];    
}