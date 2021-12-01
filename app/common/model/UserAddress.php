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

class UserAddress extends PaddyShop
{
    protected $type = [
        'is_enable'   =>  'boolean',
    ];

    public function province()
    {
        return $this->hasOne('Region', 'id', 'province')->bind(['province_name'=>'name']);
    }

    public function city()
    {
        return $this->hasOne('Region', 'id', 'city')->bind(['city_name'=>'name']);
    }

    public function county()
    {
        return $this->hasOne('Region', 'id', 'county')->bind(['county_name'=>'name']);
    }

    /**
     * 添加
     * @Author: Alan Leung
     * @param {*} $data
     */    
    public static function add($data)
    {
        $user_address = UserAddress::create($data);
        if($user_address)
        {
            if($data['is_default'] == 1)
            {
                self::setDefault($user_address->id,$data['user_id']);
            }
            return $user_address;
        }

        return false;
    }

    /**
     * 设置默认地址
     * @Author: Alan Leung
     * @param {*} $default_id
     * @param {*} $user_id
     */    
    public static function setDefault($default_id,$user_id)
    {
        return self::transaction(function () use ($default_id, $user_id) {
            UserAddress::where(['id'=>$default_id,'user_id'=>$user_id])->failException()->find();
            UserAddress::update(['is_default' => 0],['user_id'=>$user_id]);
            UserAddress::update(['is_default' => 1],['id'=>$default_id]);
            return true;
        });
    }
}