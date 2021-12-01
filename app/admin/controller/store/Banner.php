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
use app\admin\validate\Banner as BannerValidate;
use think\exception\ValidateException;
use app\common\model\Banner as BannerModel;

class Banner extends PaddyshopAdmin
{
    protected $autoWriteTimestamp = true;

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
     * 获取海报列表
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
        $result = BannerModel::list($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 添加一篇海报
     * @Author: Alan Leung
     */
    public function add()
    {
        $platform           = getParams('platform');
        $event_type         = getParams('event_type');
        $event_value        = getParams('event_value');
        $images_url         = getParams('images_url');
        $name               = getParams('name');
        $bg_color           = getParams('bg_color');
        $is_enable          = getParams('is_enable');
        $sort               = getParams('sort');

        $data = [
            'platform'          =>  $platform,
            'event_type'        =>  $event_type,
            'event_value'       =>  $event_value,
            'images_url'        =>  $images_url,
            'name'              =>  $name,
            'bg_color'          =>  $bg_color,
            'is_enable'         =>  $is_enable,
            'sort'              =>  $sort,
        ];
        
        try {            
            validate(BannerValidate::class)->scene('add')->check($data);
            if(BannerModel::add($data))
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
     * 编辑海报
     * @Author: Alan Leung
     */
    public function edit()
    {
        $id                 = getParams('id');
        $platform           = getParams('platform');
        $event_type         = getParams('event_type');
        $event_value        = getParams('event_value');
        $images_url         = getParams('images_url');
        $name               = getParams('name');
        $bg_color           = getParams('bg_color');
        $is_enable          = getParams('is_enable');
        $sort               = getParams('sort');

        $data = [
            'id'                =>  $id,
            'platform'          =>  $platform,
            'event_type'        =>  $event_type,
            'event_value'       =>  $event_value,
            'images_url'        =>  $images_url,
            'name'              =>  $name,
            'bg_color'          =>  $bg_color,
            'is_enable'         =>  $is_enable,
            'sort'              =>  $sort,
        ];

        try {            
            validate(BannerValidate::class)->scene('edit')->check($data);
            if(BannerModel::edit($data))
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
     * 删除海报
     * @Author: Alan Leung
     */
    public function del()
    {
        $id = getParams('id');
        $data = ['id'=>$id];

        try {            
            validate(BannerValidate::class)->scene('del')->check($data);
            if(BannerModel::del($data))
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
        $where = [];
        if(!empty($name)){
            $where[] = ['name','like','%'.$name.'%'];
        }
        if(!empty($platform)){
            foreach($platform as $v){
                $where[] = ['','EXP',\think\facade\Db::raw("concat(',',platform,',') like '%".$v."%'")];
            }
        }
        return $where;
    }
}