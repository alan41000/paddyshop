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
namespace app\api\controller\goods;

use app\api\controller\PaddyshopApi;
use app\common\model\Goods as GoodsModel;
use app\common\model\GoodsCategory as GoodsCategoryModel;
use app\common\model\GoodsCategoryJoin as GoodsCategoryJoinModel;
use app\common\model\GoodsComments as GoodsCommentsModel;
use app\common\model\OrderDetail as OrderDetailModel;

class Goods extends PaddyshopApi
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
     * 商品详情页
     * @Author: Alan Leung
     */
    public function detail()
    {
        try
        {
            $id = getParams('id');
            if(empty($id) || !is_numeric($id)) throwException('参数有误');
            $data = GoodsModel::getOne(['where'=>['id'=>$id]]);

            if(!empty($data) && !empty($data['skuValue']))
            {
                $data['comments_count'] = GoodsCommentsModel::count(['where'=>[
	                ['goods_id' ,'=', $id],
	                ['is_show','=',1],
                ]]);
                foreach($data['skuValue'] as &$vv)
                {
                    $vv['image'] = $data['home_recommended_images'];
                }
            }

            return app('JsonOutput')->success($data);
        }
        catch(\Exception $e)
        {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

    /**
     * 首页商品
     * @Author: Alan Leung
     */    
    public function indexList()
    {
        // 商品大分类
        $params = [
            'where' => [
                ['parent_id','=',0],
                ['is_home_recommended','=',1],
                ['is_enable','=',1],
            ],
            'with'  => ['GoodsList']
        ];
        $data = GoodsCategoryModel::getAll($params);
        return app('JsonOutput')->success($data);
    }

    /**
     * 商品搜索
     * @Author: Alan Leung
     */    
    public function search()
    {
        try
        {
            $categoryId = getParams('categoryId');
            $keyword    = getParams('keyword');
            $priceSort  = getParams('priceSort');
            $saleSort   = getParams('saleSort');

            $where = [];
            $data = [];
            $order = '';

            switch($priceSort)
            {
                case 'asc':
                    $order = empty($order) ? 'min_price asc' : $order.',min_price asc';
                    break;

                case 'desc':
                    $order = empty($order) ? 'min_price desc' : $order.',min_price desc';
                    break;

                default:
                    break;
            }

            switch($saleSort)
            {
                case 'asc':
                    $order = empty($order) ? 'sales_count asc' : $order.',sales_count asc';
                    break;

                case 'desc':
                    $order = empty($order) ? 'sales_count desc' : $order.',sales_count desc';
                    break;

                default:
                    break;
            }

            if(!empty($keyword)){
                $where[] = ['title','LIKE','%'.$keyword.'%'];
                $where[] = ['is_shelves','=',1];
                $data = GoodsModel::getAll(
                    [
                        'where' => $where,
                        'order' => $order,
                    ]
                );
                return app('JsonOutput')->success($data);
            }

            if(!empty($categoryId)){
                $where[] = ['category_id','=',$categoryId];
                $data = GoodsCategoryJoinModel::getAll(
                    [
                        'where' => $where,
                        'with'  =>  ['goodsInfo'],
                    ]
                );
                return app('JsonOutput')->success($data);
            }

            return app('JsonOutput')->fail();
        }
        catch(\Exception $e)
        {
            return app('JsonOutput')->fail($e->getMessage());
        }
    }

	/**
	 * 商品购买记录弹幕
	 * @Author: Alan Leung
	 */
	public function  orderRecordBarrage(int $id)
	{
		try{
			$params = [
				'where' => ['goods_id'=>$id],
				'field' => 'user_id,goods_id,create_time',
				'group' => 'user_id',
				'with'  => ['UserInfo']
			];
			$res  = OrderDetailModel::getAll($params);

			return app('JsonOutput')->success($res);
		}catch (\Exception $e){
			return app('JsonOutput')->fail($e->getMessage());
		}
	}
}