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

// 应用公共文件
if (!function_exists('getParams')) {
    /**
     * 获取request参数
     * @Author: Alan Leung
     */
    function getParams($params)
    {
        return request()->param($params);
    }
}

if (!function_exists('getNumberCode')) {
    /**
     * 随机数生成生成
     * @Author: Alan Leung
     */
    function getNumberCode($length = 6)
    {
        $code = '';
        for($i=0; $i<intval($length); $i++) $code .= rand(0, 9);
        return $code;
    }
}

if (!function_exists('loginPwdEncryption')) {
    /**
     * 登录密码加密
     * @Author: Alan Leung
     */
    function loginPwdEncryption($pwd, $salt)
    {
        return md5($salt.trim($pwd));
    }
}

if (!function_exists('createToken')) {
    /**
     * 生成token
     * @$user array $user 用户信息
     * @return bool
     */
    function createToken($user_id)
    {
        return md5('paddyshop'.md5($user_id.time()).rand(100, 1000000));
    }
}

if (!function_exists('treeHandle')) {
    /**
    * 树构造
    * @Author: Alan Leung
    */
	function treeHandle($data)
    {
        $items = [];
        $treeData = [];
        if(!empty($data))
        {
            foreach($data as $v)
            {
                $items[$v['id']] = $v;
            }
            foreach($items as $k=>$v)
            {
                if(isset($items[$v['parent_id']]))
                {
                    $items[$v['parent_id']]['children'][] = &$items[$k];
                }
                else
                {
                    $treeData[] = &$items[$k];
                }
            }
        }        
        return $treeData;
    }
}

if (!function_exists('filePathHandle')) {
    /**
     * 文件路径处理
     * @Author: Alan Leung
     * @param {*} $value
     */
    function filePathHandle($value = '')
    {
        if(!empty($value))
        {
            if(substr($value, 0, 5) == 'https' || substr($value, 0, 4) == 'http')
            {                
                return $value;
            }
            return config('paddyshop.website_url').$value;
        }
        return '';
    }
}

if (!function_exists('attachmentPathHandle')) {
    /**
     * 附件路径处理
     * @Author: Alan Leung
     * @param {*} $value
     */    
    function attachmentPathHandle($value)
    {
        return empty($value) ? '' : str_replace(config('paddyshop.website_url'), '', $value);
    }
}

if (!function_exists('throwException')) {
    /**
     * 抛出异常
     * @Author: Alan Leung
     */
    function throwException($msg = '未知错误', $code = 10000, $data = [] ,$log = false ){
        if(!empty($data))
        {
            $data = '-'.json_encode($data);
            if($log)
            {
                trace($msg.$data, 'error');
            }
        }
        else
        {
            if($log)
            {
                trace($msg, 'error');
            }
        }
        throw new \think\Exception($msg, $code);
    }
}

if (!function_exists('getRealIP')) {
    /**
     * 获取客户端真实ip
     * @Author: Alan Leung
     */
    function getRealIP(){
        $forwarded = request()->header("x-forwarded-for");
        if($forwarded){
            $ip = explode(',',$forwarded)[0];
        }else{
            $ip = request()->ip();
        }
        return $ip;
    }
}

if (!function_exists('getSearchTime')) {
    /**
     * 获取查询数据库用的时间戳，今日，昨日，近一月
     * @Author: Alan Leung
     * @param {*} $date
     */
    function getSearchTime($date)
    {
        switch($date)
        {
            case 'today':
                $start_time = strtotime('today');
                $end_time   = strtotime('tomorrow');
                break;
            
            case 'yesterday':
                $start_time = strtotime('yesterday');
                $end_time   = strtotime('today');
                break;

            case 'week':
                $start_time = mktime(0, 0 , 0,date("m"),date("d")-7,date("Y"));
                $end_time   = time();
                break;

            case 'month':
                $start_time = mktime(0, 0 , 0,date("m")-1,date("d"),date("Y"));
                $end_time   = time();
                break;

            default:

        }

        return ['start_time' => $start_time, 'end_time' => $end_time];
    }
}

if (!function_exists('xmlToArray')) {
    function xmlToArray($xml)
    {
        if(!xmlParser($xml))
        {
            return is_string($xml) ? $xml : '接口返回数据有误';
        }

        return json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
    }
}

if (!function_exists('XmlParser')) {
    function XmlParser($string)
    {
        $xml_parser = xml_parser_create();
        if(!xml_parse($xml_parser, $string, true))
        {
        xml_parser_free($xml_parser);
        return false;
        } else {
        return (json_decode(json_encode(simplexml_load_string($string)),true));
        }
    }
}

if (!function_exists('getClientType')){
    /**
     * 获取用户客户端
     * @Author: Alan Leung
     */    
    function getClientType()
    {
        $clientType = request()->header('PaddyShopUserClient');
        return $clientType;
    }
}