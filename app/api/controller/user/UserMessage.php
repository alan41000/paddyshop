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
use app\api\validate\UserMessage as UserMessageValidate;
use app\common\model\UserMessage as UserMessageModel;
use think\exception\ValidateException;

class UserMessage extends PaddyshopApi
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
        try{
            $where      = ['user_id'=>$this->user['id']];
            $current    = getParams('current');
            $size       = getParams('size');
            
            UserMessageModel::read($this->user['id']);
            $params     = [
                'current'   =>  $current,
                'size'      =>  $size,
                'where'     =>  $where,
            ];
            $result   = UserMessageModel::list($params);    
            return app('JsonOutput')->success($result);
        }catch(\Exception $e)
        {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }


    /**
     * 删除
     * @Author: Alan Leung
     */    
    public function del()
    {
        $user_id        = $this->user['id'];
        $message_id     = getParams('message_id');

        $data = [
            'user_id'   =>  $user_id,
            'id'        =>  $message_id,
        ];

        try {            
            validate(UserMessageValidate::class)->scene('del')->check($data);
            if(UserMessageModel::del($data))
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