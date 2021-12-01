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
namespace app\api\controller\user;

use app\api\controller\PaddyshopApi;
use app\api\validate\UserAddress as UserAddressValidate;
use app\common\model\UserAddress as UserAddressModel;
use think\exception\ValidateException;

class UserAddress extends PaddyshopApi
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

    public function list()
    {
        $where      = ['user_id'=>$this->user['id']];
        $current    = getParams('current');
        $size       = getParams('size');
        
        $params     = [
            'current'   =>  $current,
            'size'      =>  $size,
            'where'     =>  $where,
            'with'      =>  ['province','city','county'],
        ];
        $result   = UserAddressModel::list($params);

        return app('JsonOutput')->success($result);
    }

    /**
     * 添加地址
     * @Author: Alan Leung
     */    
    public function add()
    {
        $user_id        = $this->user['id'];
        $tag            = getParams('tag');
        $name           = getParams('name');
        $tel            = getParams('tel');
        $province       = getParams('province');
        $city           = getParams('city');
        $county         = getParams('county');
        $address        = getParams('address');
        $lng            = getParams('lng');
        $lat            = getParams('lat');
        $is_default     = getParams('is_default');

        $data = [
            'user_id'       =>  $user_id,
            'tag'           =>  $tag,
            'name'          =>  $name,
            'tel'           =>  $tel,
            'province'      =>  $province,
            'city'          =>  $city,
            'county'        =>  $county,
            'address'       =>  $address,
            'lng'           =>  0,
            'lat'           =>  0,
            'is_default'    =>  $is_default,
        ];

        try {            
            validate(UserAddressValidate::class)->scene('add')->check($data);
            if(UserAddressModel::add($data))
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
     * 修改地址
     * @Author: Alan Leung
     */    
    public function edit()
    {
        $id             = getParams('id');
        $user_id        = $this->user['id'];
        $tag            = getParams('tag');
        $name           = getParams('name');
        $tel            = getParams('tel');
        $province       = getParams('province');
        $city           = getParams('city');
        $county         = getParams('county');
        $address        = getParams('address');
        $lng            = getParams('lng');
        $lat            = getParams('lat');
        $is_default     = getParams('is_default');

        $data = [
            'id'            =>  $id,
            'user_id'       =>  $user_id,
            'tag'           =>  $tag,
            'name'          =>  $name,
            'tel'           =>  $tel,
            'province'      =>  $province,
            'city'          =>  $city,
            'county'        =>  $county,
            'address'       =>  $address,
            'lng'           =>  0,
            'lat'           =>  0,
            'is_default'    =>  $is_default,
        ];

        try {            
            validate(UserAddressValidate::class)->scene('edit')->check($data);
            if(UserAddressModel::edit($data))
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
     * 删除地址
     * @Author: Alan Leung
     */    
    public function del()
    {
        $id = getParams('id');
        $data = ['id'=>$id];

        try {            
            validate(UserAddressValidate::class)->scene('del')->check($data);
            if(UserAddressModel::del($data))
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
     * 地址详情
     * @Author: Alan Leung
     */    
    public function getOne()
    {
        $id = getParams('id');
        $data = ['id'=>$id];

        try {            
            validate(UserAddressValidate::class)->scene('getOne')->check($data);
            $data = UserAddressModel::getOne([
                'where' => ['id'=>$id],
                'with'  => ['province','city','county']
            ]);

            return app('JsonOutput')->success($data);
        } catch (ValidateException $e) {
            return app('JsonOutput')->fail($e->getError());
        } catch (\Exception $ee){
            return app('JsonOutput')->fail($ee->getMessage());
        }
    }

    /**
     * 获取用户默认地址
     * @Author: Alan Leung
     */    
    public function getUserDefaultAddress()
    {
        $data = UserAddressModel::getOne([
            'where' => [
                ['user_id','=',$this->user['id']],
                ['is_default','=',1],
            ],
            'with'  => ['province','city','county']
        ]);

        return app('JsonOutput')->success($data);
    }

    /**
     * 设定用户默认地址
     * @Author: Alan Leung
     */    
    public function setUserDefaultAddress()
    {
        try
        {
            $default_id = getParams('address_id');
            $user_id    = $this->user['id'];
    
            if(empty($default_id) || !is_numeric($default_id)) throwException('参数有误');

            if(UserAddressModel::setDefault($default_id,$user_id))
            {
                return app('JsonOutput')->success();
            }
        }
        catch(\Exception $e)
        {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }
}