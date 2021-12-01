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

class UserMessage extends PaddyShop
{
    protected $type = [
        'is_read'   =>  'boolean',
    ];

    /**
     * 删除
     * @Author: Alan Leung
     * @param {*} $data
     */    
    public static function del($data)
    {
        $user_message = UserMessage::where([
            ['id','=',$data['id']],
            ['user_id','=',$data['user_id']],
        ])->find();

        if(!empty($user_message))
        {
            $user_message_del = UserMessage::destroy($data['id']);
            if($user_message_del)
            {
                return true;
            }
        }
        return false;
    }

    /**
     * 标记消息为已读
     * @Author: Alan Leung
     * @param {*} $params
     */    
    public static function read($user_id)
    {
        // 更新用户未读消息为已读
        $where = [
            ['user_id','=',$user_id], 
            ['is_read','=',0]
        ];
        UserMessage::where($where)->update(['is_read'=>1]);
        return true;
    }
}