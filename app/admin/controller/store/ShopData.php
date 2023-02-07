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
namespace app\admin\controller\store;

use app\admin\controller\PaddyshopAdmin;
use app\common\model\Goods as GoodsModel;
use app\common\model\Order as OrderModel;
use app\common\model\OrderAftersale as OrderAftersaleModel;
use app\common\model\UserFavorites as UserFavoritesModel;
use app\common\model\User as UserModel;
use app\common\model\GoodsComments as GoodsCommentsModel;

class ShopData extends PaddyshopAdmin
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

    public function shopData()
    {
        $res = [
            'hotGoods'  =>  GoodsModel::getAll([
                'order' =>  'sales_count desc',
                'limit' =>  10,
            ]),
            'orders'    =>  [
                'notPay'        =>  OrderModel::count([
                    'where' =>  [
                        ['status','=',1]
                    ]
                ]),
                'toBeDelivered' =>  OrderModel::count([
                    'where' =>  [
                        ['status','=',2]
                    ]
                ]),
                'delivered'     =>  OrderModel::count([
                    'where' =>  [
                        ['status','=',3]
                    ]
                ]),
                'finish'        =>  OrderModel::count([
                    'where' =>  [
                        ['status','=',4]
                    ]
                ]),
            ],
            'todayInfo' =>  [
                'orderCount'    =>  OrderModel::count([
                    'where' =>  [
                        ['create_time','>',getSearchTime('today')['start_time']],
                        ['create_time','<=',getSearchTime('today')['end_time']],
                    ]
                ]),
                'faveCount'     =>  UserFavoritesModel::count([
                    'where' =>  [
                        ['create_time','>',getSearchTime('today')['start_time']],
                        ['create_time','<=',getSearchTime('today')['end_time']],
                    ]
                ]),
                'newUser'       =>  UserModel::count([
                    'where' =>  [
                        ['create_time','>',getSearchTime('today')['start_time']],
                        ['create_time','<=',getSearchTime('today')['end_time']],
                    ]
                ]),
                'afterSale'     =>  OrderAftersaleModel::count([
					'where' =>  [
						['create_time','>',getSearchTime('today')['start_time']],
						['create_time','<=',getSearchTime('today')['end_time']],
					]
				]),
                'withdraw'      =>  0,
                'comments'      =>  GoodsCommentsModel::count([
                    'where' =>  [
                        ['create_time','>',getSearchTime('today')['start_time']],
                        ['create_time','<=',getSearchTime('today')['end_time']],
                    ]
                ]),
            ],
            'sales'     =>  [
                'yesterday'     =>  [
                    'count' =>  OrderModel::count([
                        'where' =>  [
                            ['create_time','>',getSearchTime('yesterday')['start_time']],
                            ['create_time','<=',getSearchTime('yesterday')['end_time']],
                        ]
                    ]),
                    'sales' =>  OrderModel::sum([
                        'where' =>  [
                            ['create_time','>',getSearchTime('yesterday')['start_time']],
                            ['create_time','<=',getSearchTime('yesterday')['end_time']],
                            ['status','>',1],
                            ['status','<',5],
                        ],
                        'field' =>  'id,create_time,total_price',
                        'sumField' => 'total_price'
                    ]),
                ],
                'week'     =>  [
                    'count' =>  OrderModel::count([
                        'where' =>  [
                            ['create_time','>',getSearchTime('week')['start_time']],
                            ['create_time','<=',getSearchTime('week')['end_time']],
                        ]
                    ]),
                    'sales' =>  OrderModel::sum([
                        'where' =>  [
                            ['create_time','>',getSearchTime('week')['start_time']],
                            ['create_time','<=',getSearchTime('week')['end_time']],
                            ['status','>',1],
                            ['status','<',5],
                        ],
                        'field' =>  'id,create_time,total_price',
                        'sumField' => 'total_price'
                    ]),
                ],
                'month'     =>  [
                    'count' =>  OrderModel::count([
                        'where' =>  [
                            ['create_time','>',getSearchTime('month')['start_time']],
                            ['create_time','<=',getSearchTime('month')['end_time']],
                        ]
                    ]),
                    'sales' =>  OrderModel::sum([
                        'where' =>  [
                            ['create_time','>',getSearchTime('month')['start_time']],
                            ['create_time','<=',getSearchTime('month')['end_time']],
                            ['status','>',1],
                            ['status','<',5],
                        ],
                        'field' =>  'id,create_time,total_price',
                        'sumField' => 'total_price'
                    ]),
                ],
            ],
        ];
        return app('JsonOutput')->success($res);
    }
}