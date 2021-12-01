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
namespace app\admin\controller\setting;

use app\admin\controller\PaddyshopAdmin;
use app\admin\validate\Delivery as DeliveryValidate;
use think\exception\ValidateException;
use app\common\model\Delivery as DeliveryModel;

class Delivery extends PaddyshopAdmin
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
        ];
        $result = DeliveryModel::list($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 返回所有启用的配送方式
     * @Author: Alan Leung
     */    
    public function getAll()
    {
        $result = DeliveryModel::getAll(['where'=>['is_enable'=>1]]);
        return app('JsonOutput')->success($result);
    }

    /**
     * 添加
     * @Author: Alan Leung
     */
    public function add()
    {
        $icon       = getParams('icon');
        $name       = getParams('name');
        $is_enable  = getParams('is_enable');
        $sort       = getParams('sort');

        $data = [
            'icon'          =>  $icon,
            'name'          =>  $name,
            'is_enable'     =>  $is_enable,
            'sort'          =>  $sort,
        ];
        
        try {            
            validate(DeliveryValidate::class)->scene('add')->check($data);
            if(DeliveryModel::add($data))
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
        $id         = getParams('id');
        $icon       = getParams('icon');
        $name       = getParams('name');
        $is_enable  = getParams('is_enable');
        $sort       = getParams('sort');

        $data = [
            'id'            =>  $id,
            'icon'          =>  $icon,
            'name'          =>  $name,
            'is_enable'     =>  $is_enable,
            'sort'          =>  $sort,
        ];

        try {            
            validate(DeliveryValidate::class)->scene('edit')->check($data);
            if(DeliveryModel::edit($data))
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
            validate(DeliveryValidate::class)->scene('del')->check($data);
            if(DeliveryModel::del($data))
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
}