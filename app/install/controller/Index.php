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

namespace app\install\controller;

use app\BaseController;

/**
 * 安装系统
 * @Author: Alan Leung
 */
class Index extends BaseController
{
    /**
     * 构造方法
     * @Author: Alan Leung
     */    
    public function __construct()
    {
        // 绑定公共类
        bind('JsonOutput','app\common\controller\JsonOutput');

        // 设置系统路径        
        define('APP_PATH', app_path());
        define('ROOT_PATH', root_path());
        define('PUBLIC_PATH',public_path());

        set_time_limit(0);
    }

    /**
     * 检查是否安装
     * @Author: Alan Leung
     */    
    private function isInstall()
    {
        // 是否已安装
        if(file_exists(root_path().'install.lock'))
        {            
            throwException('你已经安装过该系统，重新安装需要先删除根目录下install.lock文件');
        }
    }

    /**
     * 检查环境
     * @Author: Alan Leung
     */    
    public function check()
    {
        try{
            $this->isInstall();
            $php_version = explode('.', PHP_VERSION);
            $res = [
                'env'   =>  [
                    [
                        'name'      =>  '操作系统',
                        'need'      =>  '无限制',
                        'current'   =>  function_exists('php_uname') ? php_uname('s') : '未知（php_uname函数未启用）',
                        'check'     =>  function_exists('php_uname') ,
                    ],
                    [
                        'name'      =>  'PHP版本',
                        'need'      =>  '>=7.4',
                        'current'   =>  PHP_VERSION,
                        'check'     =>  (($php_version[0] >=8) || ($php_version[0] >=7 && $php_version[1] >=4)) ? true : false ,
                    ],
                    [
                        'name'      =>  'GD库',
                        'need'      =>  '2.0',
                        'current'   =>  preg_match("/[\d.]+/", gd_info()['GD Version'], $match),
                        'check'     =>  function_exists('gd_info') ,
                    ],                
                ],
                'permission'    =>  [
                    [
                        'name'      =>  './',
                        'need'      =>  '可写',
                        'check'     =>  is_writable(ROOT_PATH),
                    ],
                    [
                        'name'      =>  './runtime',
                        'need'      =>  '可写',
                        'check'     =>  is_writable(ROOT_PATH.'runtime'),
                    ],
                    [
                        'name'      =>  './public',
                        'need'      =>  '可写',
                        'check'     =>  is_writable(ROOT_PATH.'public'),
                    ],
                ],
                'fun'           =>  [
                    [
                        'name'      =>  'curl_init',
                        'need'      =>  '支持',
                        'check'     =>  function_exists('curl_init'),
                    ],
                    [
                        'name'      =>  'fsockopen',
                        'need'      =>  '支持',
                        'check'     =>  function_exists('fsockopen'),
                    ],
                    [
                        'name'      =>  'file_get_contents',
                        'need'      =>  '支持',
                        'check'     =>  function_exists('file_get_contents'),
                    ],
                    [
                        'name'      =>  'mb_convert_encoding',
                        'need'      =>  '支持',
                        'check'     =>  function_exists('mb_convert_encoding'),
                    ],                
                    [
                        'name'      =>  'json_encode',
                        'need'      =>  '支持',
                        'check'     =>  function_exists('json_encode'),
                    ],                
                    [
                        'name'      =>  'json_decode',
                        'need'      =>  '支持',
                        'check'     =>  function_exists('json_decode'),
                    ],
                    [
                        'name'      =>  'simplexml_load_string',
                        'need'      =>  '支持',
                        'check'     =>  function_exists('simplexml_load_string'),
                    ],                
                    [
                        'name'      =>  'mb_substr',
                        'need'      =>  '支持',
                        'check'     =>  function_exists('mb_substr'),
                    ],                
                    [
                        'name'      =>  'mb_strlen',
                        'need'      =>  '支持',
                        'check'     =>  function_exists('mb_strlen'),
                    ],
                    [
                        'name'      =>  'mysqli',
                        'need'      =>  '支持',
                        'check'     =>  class_exists('mysqli'),
                    ],                
                    [
                        'name'      =>  'pdo',
                        'need'      =>  '支持',
                        'check'     =>  class_exists('pdo'),
                    ],
                ]
            ];
            return app('JsonOutput')->success($res);
        }catch(\Exception $e){
            return app('JsonOutput')->fail($e->getMessage());
        }
        
    }

    /**
     * 安装
     * @Author: Alan Leung
     */    
    public function install()
    {
        try{
            $this->isInstall();

            // 参数
            $dbhost = getParams('dbhost');
            $dbport = getParams('dbport');
            $dbname = getParams('dbname');
            $dbuser = getParams('dbuser');
            $dbpwd  = getParams('dbpwd');

            $data = [
                'dbhost'    =>  $dbhost,
                'dbport'    =>  $dbport,
                'dbname'    =>  $dbname,
                'dbuser'    =>  $dbuser,
                'dbpwd'     =>  $dbpwd,
            ];

            // 创建数据表
            $this->createTable($data);

            // 生成数据库配置文件
            $this->createDbConfig($data);

            return app('JsonOutput')->success();
        } catch(\Exception $e) {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

    /**
     * 生成配置文件
     * @Author: Alan Leung
     * @param {*} $params
     */    
    private function createDbConfig($params = [])
    {
        // 取出.env模板内容
        $config_str = file_get_contents(PUBLIC_PATH . 'install/data/.env.tpl');

        // 进行替换
        $config_str = str_replace('%db_host%', $params['dbhost'], $config_str);
        $config_str = str_replace('%db_name%', $params['dbname'], $config_str);
        $config_str = str_replace('%db_user%', $params['dbuser'], $config_str);
        $config_str = str_replace('%db_pwd%', $params['dbpwd'], $config_str);
        $config_str = str_replace('%db_port%', $params['dbport'], $config_str);
        $config_str = str_replace('%db_charset%', 'utf8mb4', $config_str);

        // 将替换后的内容写入.env文件
        $fp = fopen(ROOT_PATH . '/.env', 'w');
        fwrite($fp, $config_str);
        fclose($fp);
        
        $fp = fopen(ROOT_PATH . '/install.lock', 'w');
        fwrite($fp, '程序已正确安装，重新安装请删除本文件');
        fclose($fp);
    }

    /**
     * 创建数据表
     * @Author: Alan Leung
     * @param {*} $params
     */    
    private function createTable($params)
    {
        //数据库连接
        $conn = @mysqli_connect($params['dbhost'], $params['dbuser'], $params['dbpwd'], "", $params['dbport']);
        if (!$conn) {
            throwException('连接数据库失败！请检查连接参数!');
        }

        $version = mysqli_get_server_info($conn);
        if ($version < 5.7) {
            throwException('mysql版本太低! 必须5.7以上');
        }
        
        //数据库可写和是否存在测试
        $dbname = $params['dbname'];
        $empty_db = mysqli_select_db($conn, $dbname);
        if ($empty_db) {            
            $sql = "DROP DATABASE `$dbname`";
            $retval = mysqli_query($conn, $sql);
            if (!$retval) {
                throwException('删除数据库失败: ' . mysqli_error($conn));
            }
        }

        //创建数据库
        $dbsql = "CREATE DATABASE `$dbname`";
        $db_create = mysqli_query($conn, $dbsql);
        if (!$db_create) {
            throwException('创建数据库失败，请确认是否有足够的权限!');
        }

        //链接数据库
        @mysqli_select_db($conn, $dbname);
        $sql = file_get_contents(PUBLIC_PATH . 'install/data/paddyshop.sql');

        // 转为数组
        $sql_all = preg_split("/;[\r\n]+/", $sql);
        foreach($sql_all as $v)
        {
            if (!empty($v))
            {
                @mysqli_query($conn, $v);
            }
        }
    }
}
?>