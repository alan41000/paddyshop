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
 * OSS STS授权类
 * @Author: Alan Leung
 * @Date: 2021-06-16 17:31:12
 */
class OssSTS
{
    protected $url = 'https://sts.aliyuncs.com';
    protected $accessKeySecret;
    protected $accessKeyId;
    protected $roleArn;//指定角色的 ARN ，角色策略权限
    protected $roleSessionName = 'client';//用户自定义参数。此参数用来区分不同的 token，可用于用户级别的访问审计。格式：^[a-zA-Z0-9\.@\-_]+$
    protected $durationSeconds = '900';//指定的过期时间
 
 
    public function __construct()
    {
//        parent::__construct();
        bind('JsonOutput','app\common\controller\JsonOutput');
        $this->accessKeyId = config()['paddyshop']['upload_type_aliyunoss_accessKeyId'];
        $this->accessKeySecret = config()['paddyshop']['upload_type_aliyunoss_accessKeySecret'];
        $this->roleArn = config()['paddyshop']['upload_type_aliyunoss_roleArn'];
    }
 
 
    public function getStsOauth()
    {
 
        require_once root_path().'/extend/base/sts-server/aliyun-php-sdk-core/Config.php';
 
        $iClientProfile = \DefaultProfile::getProfile("cn-hangzhou", $this->accessKeyId, $this->accessKeySecret);
 
        $client = new \DefaultAcsClient($iClientProfile);
 
        $request = new \Sts\Request\V20150401\AssumeRoleRequest();
 
        $request->setRoleSessionName("client_name");
 
        $request->setRoleArn($this->roleArn);
 
//        $request->setPolicy(VENDOR_PATH.'aliyuncs/sts-server/policy/bucket_write_policy.txt');
 
        $request->setDurationSeconds($this->durationSeconds);
 
        $response = $client->doAction($request);
 
        $rows = array();
 
        $body = $response->getBody();
 
        $content = json_decode($body);
 
        if ($response->getStatus() == 200){
            // $rows['statusCode'] = 200;
            $rows['accessKeyId'] = $content->Credentials->AccessKeyId;
            $rows['accessKeySecret'] = $content->Credentials->AccessKeySecret;
            $rows['expiration'] = $content->Credentials->Expiration;
            $rows['securityToken'] = $content->Credentials->SecurityToken;

            return app('JsonOutput')->success($rows);
        }else{
            // $rows['statusCode'] = 500;
            $rows['errorCode'] = $content->Code;
            $rows['errorMessage'] = $content->Message;

            return app('JsonOutput')->fail($rows['errorMessage']);
        }
    }
}