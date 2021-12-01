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
namespace app\admin\controller\store;

use app\admin\controller\PaddyshopAdmin;
use app\admin\validate\Navigation as NavigationValidate;
use think\exception\ValidateException;
use app\common\model\Navigation as NavigationModel;

class Navigation extends PaddyshopAdmin
{
    /**
     * 构造方法
     * @Author: Alan Leung
     */
    public function __construct()
    {
        // 调用父类前置方法
        parent::__construct();

    }

    /**
     * 列表
     * @Author: Alan Leung
     */
    public function list()
    {
        $current    = getParams('current');
        $size       = getParams('size');
        $params = [
            'current'   =>  $current,
            'size'      =>  $size,
            'where'     =>  $this->whereBuilder(),
        ];
        $result   = NavigationModel::list($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 添加
     * @Author: Alan Leung
     */
    public function add()
    {
        $platform       = getParams('platform');
        $position       = getParams('position');
        $event_type     = getParams('event_type');
        $event_value    = getParams('event_value');
        $images_url     = getParams('images_url');
        $name           = getParams('name');
        $desc           = getParams('desc');
        $is_enable      = getParams('is_enable');
        $is_need_login  = getParams('is_need_login');
        $sort           = getParams('sort');

        $data = [
            'platform'      =>  $platform,
            'position'      =>  $position,
            'event_type'    =>  $event_type,
            'event_value'   =>  $event_value,
            'images_url'    =>  $images_url,
            'name'          =>  $name,
            'desc'          =>  $desc,
            'is_enable'     =>  $is_enable,
            'is_need_login' =>  $is_need_login,
            'sort'          =>  $sort,
        ];
        
        try {            
            validate(NavigationValidate::class)->scene('add')->check($data);
            if(NavigationModel::add($data))
            {
                return app('JsonOutput')->success();
            }
            else
            {
                return app('JsonOutput')->fail();
            }
        } catch (ValidateException $e) {
            return app('JsonOutput')->fail($e->getError());
        }
    }

    /**
     * 编辑
     * @Author: Alan Leung
     */
    public function edit()
    {
        $id             = getParams('id');
        $platform       = getParams('platform');
        $position       = getParams('position');
        $event_type     = getParams('event_type');
        $event_value    = getParams('event_value');
        $images_url     = getParams('images_url');
        $name           = getParams('name');
        $desc           = getParams('desc');
        $is_enable      = getParams('is_enable');
        $is_need_login  = getParams('is_need_login');
        $sort           = getParams('sort');

        $data = [
            'id'            =>  $id,
            'platform'      =>  $platform,
            'position'      =>  $position,
            'event_type'    =>  $event_type,
            'event_value'   =>  $event_value,
            'images_url'    =>  $images_url,
            'name'          =>  $name,
            'desc'          =>  $desc,
            'is_enable'     =>  $is_enable,
            'is_need_login' =>  $is_need_login,
            'sort'          =>  $sort,
        ];

        try {            
            validate(NavigationValidate::class)->scene('edit')->check($data);
            if(NavigationModel::edit($data))
            {
                return app('JsonOutput')->success();
            }
            else
            {
                return app('JsonOutput')->fail();
            }
        } catch (ValidateException $e) {
            return app('JsonOutput')->fail($e->getError());
        }
    }

    /**
     * 删除
     * @Author: Alan Leung
     */
    public function del()
    {
        $id = getParams('id');
        $data = ['id'=>$id];

        try {            
            validate(NavigationValidate::class)->scene('del')->check($data);
            if(NavigationModel::del($data))
            {
                return app('JsonOutput')->success();
            }
            else
            {
                return app('JsonOutput')->fail();
            }
        } catch (ValidateException $e) {
            return app('JsonOutput')->fail($e->getError());
        }
    }

    /**
     * 条件构造器
     * @Author: Alan Leung
     */    
    private function whereBuilder()
    {
        $name = getParams('name');
        $platform = getParams('platform');
        $event_type = getParams('event_type');
        $where = [];
        if(!empty($name)){
            $where[] = ['name','like','%'.$name.'%'];
        }
        if(!empty($platform)){
            foreach($platform as $v){
                $where[] = ['','EXP',\think\facade\Db::raw("concat(',',platform,',') like '%".$v."%'")];
            }
        }
        if(!empty($event_type) && is_numeric($event_type)){
            $where[] = ['event_type','=',$event_type];
        }
        return $where;
    }
}