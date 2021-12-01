<?php
// +----------------------------------------------------------------------
// | PaddyShop 全网多平台免费开源电商系统
// +----------------------------------------------------------------------
// | Copyright (c) 2020 https://paddyshop.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Alan Leung
// +----------------------------------------------------------------------

namespace app\common\model;

use think\Model;

class PaddyShop extends Model
{
    /**
    * 是否需要自动写入时间戳
    * @var bool
    */
    protected $autoWriteTimestamp = true;
 
    /**
    * 只读属性
    * @var array
    */
    protected $readonly = [
        'id',
    ];
    
    public static function getAll($params = [])
    {
        $field = empty($params['field']) ? '*' : $params['field'];
        $where = empty($params['where']) ? [] : $params['where'];
        $with = empty($params['with']) ? [] : $params['with'];
        $order = empty($params['order']) ? 'id desc' : $params['order'];
        $group = empty($params['group']) ? '' : $params['group'];
        $result = (new static)->with($with)->where($where)->field($field)->order($order)->group($group)->select();
        return $result;
    }

    public static function getOne($params = [])
    {
        $field = empty($params['field']) ? '*' : $params['field'];
        $where = empty($params['where']) ? [] : $params['where'];
        $with = empty($params['with']) ? [] : $params['with'];
        $result = (new static)->with($with)->where($where)->field($field)->find();
        return $result;
    }

    public static function list($params = [])
    {
        $field = empty($params['field']) ? '*' : $params['field'];
        $where = empty($params['where']) ? [] : $params['where'];
        $size = empty($params['size']) ? 10 : $params['size'];
        $current = empty($params['current']) ? 1 : $params['current'];
        $with = empty($params['with']) ? [] : $params['with'];
        $order = empty($params['order']) ? ['id'=>'desc'] : $params['order'];

        $records = (new static)->where($where)->field($field)->with($with)->page($current,$size)->order($order)->select();
        $total = (new static)->where($where)->field($field)->count();
        return ['records' => $records, 'total' => $total, 'size' => $size, 'current' => $current];
    }

    public static function del($rowId)
    {
        $res = (new static)->find($rowId);
        if(!empty($res)){
            $res_del = (new static)->destroy($rowId);
            if($res_del){
                return true;
            }
        }
        return false;
    }

    public static function add($data)
    {
        $result = (new static)->create($data);
        if($result){
            return $result;
        }
        return false;
    }

    public static function edit($data)
    {
        $result = (new static)->update($data,['id'=>$data['id']]);
        if($result){
            return $result;
        }
        return false;
    }

    public static function count($params = [])
    {
        $field = empty($params['field']) ? '*' : $params['field'];
        $where = empty($params['where']) ? [] : $params['where'];
        $order = empty($params['order']) ? 'id desc' : $params['order'];
        $group = empty($params['group']) ? '' : $params['group'];
        $result = (new static)->where($where)->field($field)->order($order)->group($group)->count();
        return (int)$result;
    }
}