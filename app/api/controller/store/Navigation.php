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
namespace app\api\controller\store;

use app\api\controller\PaddyshopApi;
use app\common\model\Navigation as NavigationModel;

class Navigation extends PaddyshopApi
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
     * 获取导航列表
     * @Author: Alan Leung
     */    
    public static function navList()
    {
        try{
            $position = getParams('position');
    
            if(empty($position)){
                throwException('参数有误');
            }
            $params = [
                'where'     =>  [
                    ['is_enable', '=', 1],
                    ['','EXP',\think\facade\Db::raw("concat(',',platform,',') like '%".getClientType()."%'")],
                    ['position', '=', $position],
                ],
                'order'     =>  ['sort' => 'desc']
            ];
            $result = NavigationModel::list($params);
    
            return app('JsonOutput')->success($result);
        }catch(\Exception $e){
            return app('JsonOutput')->fail($e->getMessage());
        }
    }
}