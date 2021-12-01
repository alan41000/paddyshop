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

use think\Exception;

class Goods extends PaddyShop
{
    protected $type = [
        'is_deduction_inventory'    =>  'boolean',
        'is_shelves'                =>  'boolean',
        'is_home_recommended'       =>  'boolean',
        'is_more_sku'               =>  'boolean',
    ];

    public function getContentAttr($value)
    {
        return empty($value) ? '' : str_replace('src="upload/images', 'src="'.config('paddyshop.website_url').'/upload/images', $value);
    }

    public function setContentAttr($value)
    {
        return attachmentPathHandle($value);
    }

    /**
     * 关联规格属性
     * @Author: Alan Leung
     */
    public function goodsCategory()
    {
        return $this->hasMany('GoodsCategoryJoin', 'goods_id', 'id');
    }

    /**
     * 关联主图
     * @Author: Alan Leung
     */
    public function goodsImages()
    {
        return $this->hasMany('GoodsPhoto', 'goods_id', 'id');
    }

    /**
     * 关联规格属性
     * @Author: Alan Leung
     */
    public function skuAttribute()
    {
        return $this->hasMany('GoodsSkuAttribute', 'goods_id', 'id');
    }

    /**
     * 关联规格值
     * @Author: Alan Leung
     */
    public function skuValue()
    {
        return $this->hasMany('GoodsSkuValue', 'goods_id', 'id');
    }

    /**
     * 首页推荐图获取器
     * @Author: Alan Leung
     * @param {*} $value
     */    
    public function getHomeRecommendedImagesAttr($value)
    {
        return filePathHandle($value);
    }

    /**
     * 首页推荐图设置器
     * @Author: Alan Leung
     * @param {*} $value
     */    
    public function setHomeRecommendedImagesAttr($value)
    {
        return attachmentPathHandle($value);
    }

    /**
     * 添加
     * @Author: Alan Leung
     */
    public static function add($data)
    {
        try {
            // 开启事务
            self::startTrans();

            $goods = Goods::create($data);
            if($goods)
            {
                // 分类写入
                if(is_array($data['category_id']) && !empty($data['category_id']))
                {
                    foreach($data['category_id'] as $v)
                    {
                        $category_join_data = [
                            'category_id'   =>  $v,
                            'goods_id'      =>  $goods->id,
                        ];
                        (new GoodsCategoryJoin())->add($category_join_data);
                    }
                }

                // =======规格写入=======
                // 规格属性
                if(is_array($data['attribute']) && !empty($data['attribute']))
                {
                    foreach($data['attribute'] as $va)
                    {
                        $goods_sku_attribute = [];
                        $goods_sku_attribute['goods_id']  = $goods->id;
                        $goods_sku_attribute['name']      = $va['name'];
                        $goods_sku_attribute['item']      = json_encode($va['item']);
                        (new GoodsSkuAttribute())->add($goods_sku_attribute);
                    }
                }

                // 规格值
                if(is_array($data['sku']) && !empty($data['sku']))
                {
                    foreach($data['sku'] as $vs)
                    {
                        $goods_sku_value = [];
                        $goods_sku_value['goods_id']    = $goods->id;
                        $goods_sku_value['sku']         = $vs['sku'];
                        $goods_sku_value['price']       = $vs['price'];
                        $goods_sku_value['inventory']   = $vs['inventory'];
                        $goods_sku_value['code']        = $vs['code'];
                        $goods_sku_value['market_price']= $vs['market_price'];
                        (new GoodsSkuValue())->add($goods_sku_value);
                    }
                }

                // 相册写入
                if(is_array($data['images']) && !empty($data['images']))
                {
                    foreach($data['images'] as $vv)
                    {
                        $images_data = [
                            'goods_id'      =>  $goods->id,
                            'url'           =>  $vv,
                            'is_show'       =>  1,
                            'sort'          =>  0,
                        ];
                        (new GoodsPhoto())->add($images_data);
                    }
                }

                // 提交事务
                self::commit();

                return $goods->id;
            }
        } catch (Exception $e) {
            // 回滚事务
            self::rollback();
            return $e->getMessage();
        }
        return false;
    }

    /**
     * 编辑
     * @Author: Alan Leung
     */
    public static function edit($data)
    {
        try {
            // 开启事务
            self::startTrans();

            $goods = Goods::update($data,['id'=>$data['id']]);
            if($goods)
            {
                // 删除旧分类数据
                (new GoodsCategoryJoin())->del($data['id']);

                // 分类写入
                if(is_array($data['category_id']) && !empty($data['category_id']))
                {
                    foreach($data['category_id'] as $v)
                    {
                        $category_join_data = [
                            'category_id'   =>  $v,
                            'goods_id'      =>  $goods->id,
                        ];
                        (new GoodsCategoryJoin())->add($category_join_data);
                    }
                }

                // =======规格操作=======
                // 删除旧规格数据
                (new GoodsSkuAttribute())->del($data['id']);
                (new GoodsSkuValue())->del($data['id']);

                // 规格属性
                if(is_array($data['attribute']) && !empty($data['attribute']))
                {
                    foreach($data['attribute'] as $va)
                    {
                        $goods_sku_attribute = [];
                        $goods_sku_attribute['goods_id']  = $goods->id;
                        $goods_sku_attribute['name']      = $va['name'];
                        $goods_sku_attribute['item']      = json_encode($va['item']);
                        (new GoodsSkuAttribute())->add($goods_sku_attribute);
                    }
                }
                // 规格值
                if(is_array($data['sku']) && !empty($data['sku']))
                {
                    foreach($data['sku'] as $vs)
                    {
                        $goods_sku_value = [];
                        $goods_sku_value['goods_id']    = $goods->id;
                        $goods_sku_value['sku']         = $vs['sku'];
                        $goods_sku_value['price']       = $vs['price'];
                        $goods_sku_value['inventory']   = $vs['inventory'];
                        $goods_sku_value['code']        = $vs['code'];
                        $goods_sku_value['market_price']= $vs['market_price'];
                        (new GoodsSkuValue())->add($goods_sku_value);
                    }
                }             

                // 删除旧相册数据
                (new GoodsPhoto())->del($data['id']);

                // 相册写入
                if(is_array($data['images']) && !empty($data['images']))
                {
                    foreach($data['images'] as $vv)
                    {
                        $images_data = [
                            'goods_id'      =>  $goods->id,
                            'url'           =>  isset($vv['url']) ? $vv['url'] : $vv,
                            'is_show'       =>  1,
                            'sort'          =>  0,
                        ];
                        (new GoodsPhoto())->add($images_data);
                    }
                }

                // 提交事务
                self::commit();

                return $goods->id;
            }
        } catch (Exception $e) {
            // 回滚事务
            self::rollback();
            return $e->getMessage();
        }

        return false;
    }

    /**
     * 列表
     * @Author: Alan Leung
     */
    public static function list($params = [])
    {
        $field = empty($params['field']) ? '*' : $params['field'];
        $where = empty($params['where']) ? [] : $params['where'];
        $size = empty($params['size']) ? 10 : $params['size'];
        $current = empty($params['current']) ? 1 : $params['current'];

        $records = Goods::where($where)->with(['skuValue','skuAttribute','goodsCategory','goodsImages'])->field($field)->page($current,$size)->order('id','desc')->select();
        $total = Goods::where($where)->field($field)->order('id','desc')->count();
        return ['records' => $records, 'total' => $total, 'size' => $size, 'current' => $current];
    }

    /**
     * 数据元列表
     * @Author: Alan Leung
     * @param {*} $params
     */
    public static function getAll($params = [])
    {
        $field = empty($params['field']) ? '*' : $params['field'];
        $where = empty($params['where']) ? [] : $params['where'];
        $order = empty($params['order']) ? 'id desc' : $params['order'];        

        $goods = Goods::where($where)->with(['skuValue','skuAttribute','goodsCategory','goodsImages'])->field($field)->order($order)->select();
        return $goods;
    }

    /**
     * 删除
     * @Author: Alan Leung
     */
    public static function del($data)
    {
        $goods = Goods::find($data['id']);
        if(!empty($goods))
        {
            try {
                // 开启事务
                self::startTrans();
                $goods_del = Goods::destroy($data['id']);
                if($goods_del)
                {
                    // 删除分类数据
                    (new GoodsCategoryJoin())->del($data['id']);

                    // 删除规格数据
                    (new GoodsSkuAttribute())->del($data['id']);
                    (new GoodsSkuValue())->del($data['id']);

                    // 删除相册数据
                    (new GoodsPhoto())->del($data['id']);
                }

                // 提交事务
                self::commit();
                return true;
            }
            catch (Exception $e) {
                // 回滚事务
                self::rollback();
                return $e->getMessage();
            }
        }

        return false;
    }
    
    /**
     * 字段更新
     * @Author: Alan Leung
     */
    public static function fieldUpdate($data)
    {
        $goods = Goods::find($data['id']);
        if(!empty($goods))
        {
            $data = [
                'id'            =>  $data['id'],
                $data['field']  =>  $data['params']
            ];
            $goods = Goods::update($data,['id'=>$data['id']]);
            if($goods)
            {
                return true;
            }
        }

        return false;
    }

    /**
     * 获取一条数据
     * @Author: Alan Leung
     * @param {*} $params
     */
    public static function getOne($params = [])
    {
        $field = empty($params['field']) ? '*' : $params['field'];
        $where = empty($params['where']) ? [] : $params['where'];

        $goods = Goods::where($where)->with(['skuValue','skuAttribute','goodsCategory','goodsImages'])->field($field)->find();
        return $goods;
    }
  
    /**
     * 库存扣除
     * @Author: Alan Leung
     * @param {*} $order_id
     */    
    public static function inventoryDeduct($order_id)
    {
        // 库存扣除规则

        // 获取订单商品
        $orderInfo = OrderDetail::getAll([
            'where'=>['order_id'=>$order_id],
            'field'=>'id,order_id,goods_id,qty,sku'
        ]);
        if(!empty($orderInfo))
        {
            foreach($orderInfo as $v)
            {
                $goodsInfo = Goods::getOne(['where'=>['id'=>$v['goods_id']]]);

                // 判断商品库存数量
                if($goodsInfo['inventory'] < $v['qty'])
                {
                    throwException('商品库存不足['.$goodsInfo['title'].'('.$goodsInfo['inventory'].'<'.$v['qty'].')]');
                }

                // 扣除总库存
                Goods::where(['id'=>$v['goods_id']])->dec('inventory',$v['qty'])->update();
                
                // 判断商品规格库存
                $goodsSkuValue = GoodsSkuValue::getOne([
                    'where' =>[
                        ['goods_id','=',$v['goods_id']],
                        ['sku','=',$v['sku']]
                    ]
                ]);
                if($goodsSkuValue['inventory'] < $v['qty']){
                    throwException('商品规格库存不足['.$goodsInfo['title'].$v['sku'].'('.$goodsSkuValue['inventory'].'<'.$v['qty'].')]');
                }

                // 扣除规格库存
                GoodsSkuValue::where([['id','=',$v['goods_id']],['sku','=',$v['sku']]])->dec('inventory',$v['qty'])->update();
            }
            return true;
        }
        return false;
    }

    /**
     * 增加商品销量
     * @Author: Alan Leung
     * @param {*} $order_id
     */    
    public static function addSalesCount($order_id)
    {
        // 增加销量规则、默认订单收货
        
        // 订单信息
        $orderInfo = OrderDetail::getAll(['where'=>['order_id'=>$order_id]]);
        if(!empty($orderInfo)){
            foreach($orderInfo as $v)
            {
                Goods::where(['id'=>$v['goods_id']])->inc('sales_count',$v['qty'])->update();
            }
            return true;
        }
        return false;
    }
}