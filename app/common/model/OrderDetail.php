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

class OrderDetail extends PaddyShop
{
    public function getImagesAttr($value)
    {
        return filePathHandle($value);
    }

    public function setImagesAttr($value)
    {
        return attachmentPathHandle($value);
    }

	/**
	 * 关联会员详情
	 * @Author: Alan Leung
	 */
	public function userInfo()
	{
		return $this->hasOne('user', 'id', 'user_id')->bind(['nickname', 'avatar']);
	}

    /**
     * 关联商品详情
     * @Author: Alan Leung
     */
    public function goodsInfo()
    {
        return $this->hasOne('goods', 'id', 'goods_id');
    }

	/**
	 * 商品购买记录弹幕
	 * @Author: Alan Leung
	 */
	public static function  orderRecordBarrage($params)
	{
		$field = $params['field'];
		$where = $params['where'];
		$with = $params['with'];
		$order = 'id desc';
		$group = $params['group'];
		$result = (new static)->with($with)->where($where)->field($field)->order($order)->limit(10)->group($group)->select();
		return $result;
	}
}