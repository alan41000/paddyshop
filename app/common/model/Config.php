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
use think\facade\Cache;

class Config extends PaddyShop
{
    /**
     * 保存配置
     * @Author: Alan Leung
     */
    public static function edit($data)
    {
        return self::transaction(function () use ($data) {
            foreach($data as $k=>$v)
            {
                $configData = Config::getOne(['where'=>['name'=>$k]]);
                if(empty($configData)){
                    Config::create(['name' => $k,'value' => $v]);
                }else{
                    Config::update(['value' => $v],['name' => $k]);
                }                
            }
            return true;
        });

        return false;
    }

    /**
     * 配置初始化
     * @Author: Alan Leung
     */    
    public static function init()
    {
        Cache::remember('siteConfig', function(){
            $data = self::getAll();
            if(!empty($data)){
                foreach($data as $v){
                    cache($v['name'],$v['value']);
                }
            }

            return $data;
        });
    }
}