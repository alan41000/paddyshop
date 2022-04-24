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
use app\admin\validate\Goods as GoodsValidate;
use app\common\model\Goods as GoodsModel;
use app\common\model\GoodsCategoryJoin as GoodsCategoryJoinModel;
use think\exception\ValidateException;
use think\Exception;

/**
 * 商品控制器
 * @Author: Alan Leung
 */
class Goods extends PaddyshopAdmin
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

        $params = [
            'current'   =>  $current,
            'size'      =>  $size,
            'where'     =>  $this->whereBuilder(),
        ];
        $result             = GoodsModel::list($params);
        $data               = $this->goodsDataHandle($result['records']);
        $result['records']  = $data;

        return app('JsonOutput')->success($result);
    }

    /**
     * 添加
     * @Author: Alan Leung
     */
    public function add()
    {
        $brand_id                   = getParams('brand_id');
        $title                      = getParams('title');
        $category_id                = getParams('category_id');
        $simple_desc                = getParams('simple_desc');
        $model                      = getParams('model');
        $place_origin               = getParams('place_origin');
        $inventory                  = getParams('inventory');
        $inventory_unit             = getParams('inventory_unit');
        $images                     = getParams('images');
        $give_integral              = empty(getParams('give_integral'))? 0 : getParams('give_integral');
        $buy_min_number             = empty(getParams('buy_min_number'))? 1 : getParams('buy_min_number');
        $buy_max_number             = getParams('buy_max_number');
        $is_shelves                 = getParams('is_shelves');
        $is_home_recommended        = getParams('is_home_recommended');
        $video                      = getParams('video');
        $home_recommended_images    = getParams('home_recommended_images');
        $content                    = getParams('content');
        $sku                        = getParams('sku');
        $attribute                  = getParams('attribute');

        if(empty($sku[0]['price']))
        {
            return app('JsonOutput')->fail('请输入商品价格');
        }
        else if(empty($sku[0]['inventory']))
        {
            return app('JsonOutput')->fail('请输入商品库存');
        }
        else if(count($sku) == 1)
        {
            $price          = $sku[0]['price'];
            $market_price   = $sku[0]['market_price'];
            $inventory      = $sku[0]['inventory'];
        }
        else
        {
            $min_price = min(array_column($sku,'price'));
            $max_price = max(array_column($sku,'price'));
            $min_market_price = min(array_column($sku,'market_price'));
            $max_market_price = max(array_column($sku,'market_price'));
            if($min_price !== $max_price)
            {
                $price = $min_price.'-'.$max_price;
            }
            else
            {
                $price = $min_price;
            }
            if($min_market_price !== $max_market_price)
            {
                $market_price = $min_market_price.'-'.$max_market_price;
            }
            else
            {
                $market_price = $min_market_price;
            }
            $inventory      = array_sum(array_column($sku,'inventory'));
        }
        
        $data = [
            'brand_id'                      =>  $brand_id,
            'title'                         =>  $title,
            'category_id'                   =>  $category_id,
            'simple_desc'                   =>  $simple_desc,
            'model'                         =>  $model,
            'place_origin'                  =>  $place_origin,
            'inventory'                     =>  $inventory,
            'inventory_unit'                =>  $inventory_unit,
            'images'                        =>  $images,
            'original_price'                =>  $market_price,
            // 'min_original_price'            =>  $min_original_price,
            // 'max_original_price'            =>  $max_original_price,
            'price'                         =>  $price,
            // 'min_price'                     =>  $min_price,
            // 'max_price'                     =>  $max_price,
            'give_integral'                 =>  $give_integral,
            'buy_min_number'                =>  $buy_min_number,
            'buy_max_number'                =>  $buy_max_number,
            'is_deduction_inventory'        =>  1,
            'is_shelves'                    =>  $is_shelves == true ? 1 : 0,
            'is_home_recommended'           =>  $is_home_recommended == true ? 1 : 0,
            // 'photo_count'                   =>  $photo_count,
            // 'sales_count'                   =>  $sales_count,
            // 'access_count'                  =>  $access_count,
            'video'                         =>  $video,
            'home_recommended_images'       =>  empty($home_recommended_images)? $images[0]: $home_recommended_images,
            'is_more_sku'                   =>  0,
            'sku_base'                      =>  '',
            'content'                       => $content,
            'sku'                           => $sku,
            'attribute'                     => $attribute,
        ];
        try {
            validate(GoodsValidate::class)->scene('add')->check($data);
            $ret = GoodsModel::add($data);
            if($ret > 0)
            {
                return app('JsonOutput')->success();
            }
            else
            {
                return app('JsonOutput')->fail('商品添加失败：'.$ret);
            }
        } catch (ValidateException $e) {
            return app('JsonOutput')->fail($e->getError());
        } catch (Exception $ee) {
            return app('JsonOutput')->fail($ee->getMessage());
        }
    }

    /**
     * 编辑
     * @Author: Alan Leung
     */
    public function edit()
    {
        $id                         = getParams('id');
        $brand_id                   = getParams('brand_id');
        $title                      = getParams('title');
        $category_id                = getParams('category_id');
        $simple_desc                = getParams('simple_desc');
        $model                      = getParams('model');
        $place_origin               = getParams('place_origin');
        $inventory                  = getParams('inventory');
        $inventory_unit             = getParams('inventory_unit');
        $images                     = getParams('images');
        // $original_price             = getParams('original_price');
        // $price                      = getParams('price');
        $give_integral              = empty(getParams('give_integral'))? 0 : getParams('give_integral');
        $buy_min_number             = empty(getParams('buy_min_number'))? 1 : getParams('buy_min_number');
        $buy_max_number             = getParams('buy_max_number');
        $is_shelves                 = getParams('is_shelves');
        $is_home_recommended        = getParams('is_home_recommended');
        $video                      = getParams('video');
        $home_recommended_images    = getParams('home_recommended_images');
        $content                    = getParams('content');        
        $sku                        = getParams('sku');
        $attribute                  = getParams('attribute');

        if(count($sku) == 1)
        {
            $price          = $sku[0]['price'];
            $market_price   = $sku[0]['market_price'];
            $inventory      = $sku[0]['inventory'];
        }
        else
        {
            $min_price = min(array_column($sku,'price'));
            $max_price = max(array_column($sku,'price'));
            $min_market_price = min(array_column($sku,'market_price'));
            $max_market_price = max(array_column($sku,'market_price'));
            if($min_price !== $max_price)
            {
                $price = $min_price.'-'.$max_price;
            }
            else
            {
                $price = $min_price;
            }
            if($min_market_price !== $max_market_price)
            {
                $market_price = $min_market_price.'-'.$max_market_price;
            }
            else
            {
                $market_price = $min_market_price;
            }
            $inventory      = array_sum(array_column($sku,'inventory'));
        }

        $data = [
            'id'                            =>  $id,
            'brand_id'                      =>  $brand_id,
            'title'                         =>  $title,
            'category_id'                   =>  $category_id,
            'simple_desc'                   =>  $simple_desc,
            'model'                         =>  $model,
            'place_origin'                  =>  $place_origin,
            'inventory'                     =>  $inventory,
            'inventory_unit'                =>  $inventory_unit,
            'images'                        =>  $images,
            'original_price'                =>  $market_price,
            // 'min_original_price'            =>  $min_original_price,
            // 'max_original_price'            =>  $max_original_price,
            'price'                         =>  $price,
            // 'min_price'                     =>  $min_price,
            // 'max_price'                     =>  $max_price,
            'give_integral'                 =>  $give_integral,
            'buy_min_number'                =>  $buy_min_number,
            'buy_max_number'                =>  $buy_max_number,
            'is_deduction_inventory'        =>  1,
            'is_shelves'                    =>  $is_shelves == true ? 1 : 0,
            'is_home_recommended'           =>  $is_home_recommended == true ? 1 : 0,
            // 'photo_count'                   =>  $photo_count,
            // 'sales_count'                   =>  $sales_count,
            // 'access_count'                  =>  $access_count,
            'video'                         =>  $video,
            'home_recommended_images'       =>  empty($home_recommended_images)? $images[0]: $home_recommended_images,
            'is_more_sku'                   =>  0,
            'sku_base'                      =>  '',
            'content'                       => $content,
            'sku'                           => $sku,
            'attribute'                     => $attribute,
        ];

        try {            
            validate(GoodsValidate::class)->scene('edit')->check($data);
            $ret = GoodsModel::edit($data);
            if($ret > 0)
            {
                return app('JsonOutput')->success();
            }
            else
            {
                return app('JsonOutput')->fail('商品编辑失败：'.$ret);
            }
        } catch (ValidateException $e) {
            return app('JsonOutput')->fail($e->getError());
        }
    }

    /**
     * 删除
     * @Author: Alan Leung
     */
    public function del()
    {
        $id = getParams('id');
        $data = ['id'=>$id];

        try {            
            validate(GoodsValidate::class)->scene('del')->check($data);
            $ret = GoodsModel::del($data);
            if($ret === true)
            {
                return app('JsonOutput')->success();
            }
            else
            {
                return app('JsonOutput')->fail($ret);
            }
        } catch (ValidateException $e) {
            return app('JsonOutput')->fail($e->getError());
        }
    }

    /**
    * 上下架状态更新
    * @Author: Alan Leung
    */   
	public function shelves()
	{
        $id         = getParams('id');
        $params     = getParams('params');
        $data       = ['id'=>$id, 'field'=>'is_shelves','params'=>$params];
        try {
            validate(GoodsValidate::class)->scene('fieldUpdate')->check($data);
            if(GoodsModel::fieldUpdate($data))
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
    * 首页推荐状态更新
    * @Author: Alan Leung
    */   
	public function recommended()
	{
        $id         = getParams('id');
        $params     = getParams('params');
        $data       = ['id'=>$id, 'field'=>'is_home_recommended','params'=>$params];
        try {
            validate(GoodsValidate::class)->scene('fieldUpdate')->check($data);
            if(GoodsModel::fieldUpdate($data))
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
     * 商品数据处理
     * @Author: Alan Leung
     * @param {array} $data
     */
    private function goodsDataHandle($data)
    {
        if(!empty($data))
        {
            // 开始处理数据
            foreach($data as &$v)
            {
                // 分类处理                
                $v['category_id'] = array_column($v['goodsCategory']->toarray(),'category_id');
                unset($v['goodsCategory']);

                // 主图处理
                $v['images'] = $v['goodsImages'];
                unset($v['goodsImages']);
            }

            return $data;
        }
        return [];
    }

    /**
     * 条件构造器
     * @Author: Alan Leung
     */    
    private function whereBuilder()
    {
        $categoryId = getParams('category_id');
        $title = getParams('title');        
        $where = [];
        if(is_array($categoryId) && !empty($categoryId[0])){
            $categoryInfo = GoodsCategoryJoinModel::getAll(['where'=>[['category_id','in',$categoryId]]]);
            $where[] = ['id','in',array_column($categoryInfo->toArray(),'goods_id')];
        }
        if(!empty($title)){
            $where[] = ['title','like','%'.$title.'%'];
        }
        return $where;
    }
}