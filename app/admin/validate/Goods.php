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

namespace app\admin\validate;

use think\Validate;

/**
 * 商品验证器
 * @Author: Alan Leung
 */
class Goods extends Validate
{
    /**
     * 设置表名
     * @var bool
     */
    protected $name = 'goods';
    
    protected $rule = [
        'id'                        => 'require|integer',
        'brand_id'                  => 'integer',
        'title'                     => 'require',
        // 'title_color'               => 'string',
        // 'simple_desc'               => 'chsDash',
        // 'model'                     => 'string',
        'place_origin'              => 'float',
        'inventory'                 => 'integer',
        // 'inventory_unit'            => 'chsDash',
        // 'images'                    => 'string',
        // 'original_price'            => 'string',
        'min_original_price'        => 'float',
        'max_original_price'        => 'float',
        // 'price'                     => 'string',
        'min_price'                 => 'float',
        'max_price'                 => 'float',
        'give_integral'             => 'integer|>=:0',
        'buy_min_number'            => 'integer',
        'buy_max_number'            => 'integer',
        'is_deduction_inventory'    => 'integer',
        'is_shelves'                => 'integer',
        'is_home_recommended'       => 'integer',
        'photo_count'               => 'integer',
        'sales_count'               => 'integer',
        'access_count'              => 'integer',
        // 'video'                     => 'string',
        // 'home_recommended_images'   => 'string',
        'is_more_sku'               => 'integer',
        // 'sku_base'                  => 'string',
        'is_delete_time'            => 'integer',
        // 'content'                   => 'string',
		'max_buy_integral' => 'integer|egt:0',
    ];
    
    protected $message  =   [
        'id.require'          => '商品id有误',
        'title.require'       => '请输入标题',
    ];

    protected $scene = [
        'add'   =>  [
            'brand_id',
            'title',
            // 'simple_desc',
            'place_origin',
            'inventory',
            // 'inventory_unit',
            'min_original_price',
            'max_original_price',
            'min_price',
            'max_price',
            'give_integral',
            'buy_min_number',
            'buy_max_number',
            'is_deduction_inventory',
            'is_shelves',
            'is_home_recommended',
            'photo_count',
            'sales_count',
            'access_count',
            'is_more_sku',
            // 'seo_title',
            // 'seo_keywords',
            // 'seo_desc',
            'is_delete_time',
			'max_buy_integral',
        ],
        'edit'  =>  [
            'id',
            'brand_id',
            'title',
            // 'simple_desc',
            'place_origin',
            'inventory',
            // 'inventory_unit',
            'min_original_price',
            'max_original_price',
            'min_price',
            'max_price',
            'give_integral',
            'buy_min_number',
            'buy_max_number',
            'is_deduction_inventory',
            'is_shelves',
            'is_home_recommended',
            'photo_count',
            'sales_count',
            'access_count',
            'is_more_sku',
            // 'seo_title',
            // 'seo_keywords',
            // 'seo_desc',
            'is_delete_time',
			'max_buy_integral',
        ],
        'del'   =>  ['id'],
        'fieldUpdate'   =>  ['id'],
    ];    
}