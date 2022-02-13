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
namespace app\common\controller;

/**
 * 上传类
 * @Author: Alan Leung
 */
class Upload
{
    /**
     * 构造方法
     * @Author: Alan Leung
     */
    public function __construct()
    {
        bind('JsonOutput','app\common\controller\JsonOutput');
    }

    /**
     * 保存文件
     * @Author: Alan Leung
     */
    public function save()
    {
        $file = request()->file()['file'];
        $path = getParams('path');
        if(empty($path)){
            $path = 'images/goods';
        }
        $path = 'upload/'.$path;
        $save_name = \think\facade\Filesystem::disk('public')->putFile($path, $file);
        $data = [
            'url'   => config('paddyshop.website_url').$save_name,
            'value' => $save_name,
        ];
        return app('JsonOutput')->success($data);
    }
}