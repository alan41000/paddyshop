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
namespace app\admin\controller\goods;

use app\admin\controller\PaddyshopAdmin;
use app\common\model\GoodsComments as GoodsCommentsModel;
use app\admin\validate\GoodsComments as GoodsCommentsValidate;
use think\exception\ValidateException;
use think\Exception;

/**
 * 商品控制器
 * @Author: Alan Leung
 */
class Comments extends PaddyshopAdmin
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
        $where      = self::whereBuilder();
        $params = [
            'current'   =>  $current,
            'size'      =>  $size,
            'where'     =>  $where,
            'with'      =>  ['goodsInfo'],
        ];
        $result = GoodsCommentsModel::list($params);
        return app('JsonOutput')->success($result);
    }

    private static function whereBuilder()
    {
        $where = [];
        $rating = getParams('rating');
        if(isset($rating)){
            $where[] = ['rating','=',$rating];
        }

        return $where;
    }

    /**
     * 编辑
     * @Author: Alan Leung
     */    
    public static function edit()
    {
        $id             = getParams('id');
        $content        = getParams('content');
        $reply          = getParams('reply');
        $is_show        = getParams('is_show');

        $data = [
            'id'            =>  $id,
            'content'       =>  $content,
            'reply'         =>  $reply,
            'is_show'       =>  $is_show == true ? 1: 0,
            'is_reply'      =>  !empty($content)? 1 : 0,
            'reply_time'    =>  time(),
        ];

        try {            
            validate(GoodsCommentsValidate::class)->scene('edit')->check($data);
            if(GoodsCommentsModel::edit($data))
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
     * 更新显示状态
     * @Author: Alan Leung
     */    
    public function show()
    {
        $id         = getParams('id');
        $params     = getParams('params');
        $data       = ['id'=>$id, 'field'=>'is_show','params'=>$params];
        try {
            validate(GoodsCommentsValidate::class)->scene('fieldUpdate')->check($data);
            if(GoodsCommentsModel::fieldUpdate($data))
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