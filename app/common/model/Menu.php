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

class Menu extends PaddyShop
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'permission_menu';

    protected $type = [
        'is_enable'   =>  'boolean',
    ];

    /**
     * 权限菜单列表
     * @Author: Alan Leung
     */
    public static function permissionList($params = [])
    {
        $field = empty($params['field']) ? '*' : $params['field'];
        $where = empty($params['where']) ? [] : $params['where'];

        $items = Menu::where($where)->field($field)->order('sort','desc')->select();
        return $items;
    }
}