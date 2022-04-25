SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `category_id` int(11) UNSIGNED NOT NULL COMMENT '分类id',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转地址',
  `views_count` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '浏览量',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图片数据',
  `is_enable` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否启用（1.是，0.否）',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for article_category
-- ----------------------------
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) UNSIGNED NOT NULL COMMENT '父id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '分类描述',
  `sort` tinyint(3) UNSIGNED NULL DEFAULT 50 COMMENT '排序',
  `is_navi` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '导航 0=否 1=是',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '文章分类' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `platform` varchar(255) DEFAULT 'H5' COMMENT '所属平台(与uniapp一致，H5 H5，APP-PLUS App,MP-WEIXIN 微信小程序,MP-ALIPAY,支付宝小程序,MP-BAIDU 百度小程序，MP-TOUTIAO 字节跳动小程序,MP-QQ QQ小程序,MP-LARK 飞书小程序,MP-KUAISHOU 快手小程序,MP-360 360小程序）',
  `event_type` tinyint(2) NULL DEFAULT -1 COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '事件值',
  `images_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '图片地址',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '别名',
  `bg_color` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'css背景色值',
  `is_enable` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否启用（0否，1是）',
  `sort` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `is_enable`(`is_enable`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `platform`(`platform`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '轮播图片' ROW_FORMAT = Compact;

INSERT INTO `banner` VALUES (2, '["mp-weixin","h5"]', 1, '/pages/goods/goods?id=1', 'upload/images/banner/20211225/fa8f61b8260d47e02f1fe77b5087cd63.jpg', '防疫物品五折', NULL, 1, 0, 1640420070, 1640423443);
INSERT INTO `banner` VALUES (3, '["mp-weixin","h5"]', 1, '/', 'upload/images/banner/20211225/d4ab560a5683fa0eaeb36a7d7ed6c713.jpg', '水果慢80送20', NULL, 1, 0, 1640421020, 1640423442);
INSERT INTO `banner` VALUES (4, '["mp-weixin","h5"]', 1, '/', 'upload/images/banner/20211225/22f68870c8c61bf432ac4e59335fd742.jpg', '广式风味腊肠', NULL, 1, 0, 1640421049, 1640423440);
INSERT INTO `banner` VALUES (5, '["mp-weixin","h5"]', 1, '/', 'upload/images/banner/20211225/67f272c3029e19dbe48e846af5b08e07.jpg', '国潮面膜', NULL, 1, 0, 1640421121, 1640423438);
INSERT INTO `banner` VALUES (6, '["mp-weixin","h5"]', 1, '/', 'upload/images/banner/20211225/6b58335b62b27c6754d591dc54338da7.jpg', '5折购机', NULL, 1, 0, 1640421169, 1640423436);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '用户id',
  `goods_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '商品id',
  `title` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面图片',
  `original_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '原价',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '销售价格',
  `qty` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买数量',
  `sku` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '规格',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE,
  INDEX `qty`(`qty`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '名称',
  `value` text NOT NULL COMMENT '值',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置';

-- ----------------------------
-- Table structure for delivery
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'icon图标',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `is_enable` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否启用（0否，1是）',
  `sort` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '顺序',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `is_enable`(`is_enable`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递公司' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of delivery
-- ----------------------------
INSERT INTO `delivery` VALUES (1, '', '申通快递', 1, 100, 1607611813, 1607611813);
INSERT INTO `delivery` VALUES (2, '', '韵达快递', 1, 100, 1607611845, 1607611845);
INSERT INTO `delivery` VALUES (3, '', '中通快递', 1, 100, 1607611854, 1607611854);
INSERT INTO `delivery` VALUES (4, '', '圆通快递', 1, 100, 1607611861, 1607611861);
INSERT INTO `delivery` VALUES (5, '', '百世快运', 0, 100, 1607611877, 1608621457);
INSERT INTO `delivery` VALUES (7, '', '买家自提', 0, 100, 1608621465, 1608622087);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `brand_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '品牌id',
  `title` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `title_color` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标题颜色',
  `simple_desc` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '简述',
  `model` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '型号',
  `place_origin` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '产地（地区省id）',
  `inventory` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '库存（所有规格库存总和）',
  `inventory_unit` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '库存单位',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '封面图片',
  `original_price` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '原价（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_original_price` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '最低原价',
  `max_original_price` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '最大原价',
  `price` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '销售价格（单值:10, 区间:10.00-20.00）一般用于展示使用',
  `min_price` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '最低价格',
  `max_price` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '最高价格',
  `give_integral` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '购买赠送积分',
  `buy_min_number` int(11) UNSIGNED NULL DEFAULT 1 COMMENT '最低起购数量 （默认1）',
  `buy_max_number` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '最大购买数量（最大数值 100000000, 小于等于0或空则不限）',
  `is_deduction_inventory` tinyint(2) UNSIGNED NULL DEFAULT 1 COMMENT '是否扣减库存（0否, 1是）',
  `is_shelves` tinyint(2) UNSIGNED NULL DEFAULT 1 COMMENT '是否上架（下架后用户不可见, 0否, 1是）',
  `is_home_recommended` tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '是否首页推荐（0否, 1是）',
  `photo_count` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '相册图片数量',
  `sales_count` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '销量',
  `access_count` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '访问次数',
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '短视频',
  `home_recommended_images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '首页推荐图片',
  `is_more_sku` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否存在多个规格（0否, 1是）',
  `sku_base` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '规格基础数据',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情内容',
  `create_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE,
  INDEX `access_count`(`access_count`) USING BTREE,
  INDEX `photo_count`(`photo_count`) USING BTREE,
  INDEX `is_shelves`(`is_shelves`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品' ROW_FORMAT = Compact;

INSERT INTO `goods` VALUES (1, NULL, '新款X50pro跨境智能手机现货低价批发大屏安卓5G手机', '', '现货低价批发', '', NULL, 1000, '台', '', '', 0.00, 0.00, '589.00', 0.00, 0.00, 0, 1, 0, 1, 1, 1, 0, 0, 0, NULL, 'upload/images/goods/20211123/87136345c0b042b22792250e240fb4ea.jpg', 0, '', '<p>新款X50pro跨境智能手机现货低价批发大屏安卓5G手机</p><p><img src=\"upload/images/goods/20211123/b398a4bf15f4261e3d88125d9351b191.jpg\"></p><p><img src=\"upload/images/goods/20211123/b6dab2a013416bf96246f7b19ed95096.jpg\"></p><p><img src=\"upload/images/goods/20211123/257034b816a9f563ec03a201f11b5e02.jpg\"></p>', 1637636458, 1637652721);
INSERT INTO `goods` VALUES (2, NULL, '跨境电商手机note9安卓3G 智能手机5.8寸512+4G', '', '跨境电商手机note9', 'note9', NULL, 1000, '台', '', '', 0.00, 0.00, '0.11', 0.00, 0.00, 0, 2, 1, 1, 1, 1, 0, 0, 0, NULL, 'upload/images/goods/20211123/dd8e33ee8114c7fb2feece49f9ec4bfc.jpg', 0, '', '<p><img src=\"upload/images/goods/20211123/850b7870a9a49976ceb4c4995b90f711.jpg\"><img src=\"upload/images/goods/20211123/987121725c881106699dc498a42e9aae.jpg\"><img src=\"upload/images/goods/20211123/47ecae2397853b45c3eafa44a1f737be.jpg\"><img src=\"upload/images/goods/20211123/1c639060572fa8633d3fada4d913011e.jpg\"><img src=\"upload/images/goods/20211123/82da4efed76065cba30493e7d15c7d1d.jpg\"><img src=\"upload/images/goods/20211123/27673c0341a07056c92433076cde1454.jpg\"><img src=\"upload/images/goods/20211123/2292f0cf98c9c2c31404d1e14bab7c53.jpg\"><img src=\"upload/images/goods/20211123/2f24199a75b49b09fdc51829a8dcdb5e.jpg\"><img src=\"upload/images/goods/20211123/61dc51aa3d913f2c06998341cfc6f5c1.jpg\"><img src=\"upload/images/goods/20211123/9ce6a87fca6ac31254563f13b7b17c5e.jpg\"></p>', 1637637343, 1637652707);
INSERT INTO `goods` VALUES (3, NULL, '新款专供跨境手机 P33Plus 智能手机5.8英寸 低价批发 512+4G内存', '', '新款跨境专供手机', '', NULL, 9000, '台', '', '', 0.00, 0.00, '899.00-1099.00', 0.00, 0.00, 0, 1, 0, 1, 1, 1, 0, 0, 0, NULL, 'upload/images/goods/20211123/b7be889297d34a8660970033278a2917.jpg', 0, '', '<p><img src=\"upload/images/goods/20211123/457abecbad27d12e50e550eae71e7ff2.jpg\"><img src=\"upload/images/goods/20211123/0f4871131ffd561fa18be322adac5399.jpg\"><img src=\"upload/images/goods/20211123/5c26f3880496a41c0e2beb3fd861d41e.jpg\"><img src=\"upload/images/goods/20211123/a4cbd8564529b58762454fd88b78d1f2.jpg\"><img src=\"upload/images/goods/20211123/07758f40b680dae270adedfeb967ee41.jpg\"><img src=\"upload/images/goods/20211123/76af3b7fd7acb5452a35781ecf807462.jpg\"><img src=\"upload/images/goods/20211123/1eb9aba6e2080edf5ef7ca4af4f44bfe.jpg\"><img src=\"upload/images/goods/20211123/408510cb5ccffccf9aac4c48040f32d0.jpg\"><img src=\"upload/images/goods/20211123/8602ea1bd98c8ad3c1a9f2db9ff1f964.jpg\"><img src=\"upload/images/goods/20211123/44e336d142dde308c11d49502c72a648.jpg\"></p>', 1637638697, 1637652692);
INSERT INTO `goods` VALUES (4, NULL, '跨境电商手机note30 512+4外贸wish虾皮Lazada 5.8寸安卓智能手机', '', 'note30 512', 'note30 512', NULL, 900, '台', '', '', 0.00, 0.00, '899.00-1099.00', 0.00, 0.00, 0, 1, 0, 1, 1, 1, 0, 0, 0, NULL, 'upload/images/goods/20211123/bcb9adae2136c84cdae54687ab73de41.jpg', 0, '', '<p><img src=\"upload/images/goods/20211123/0beba969023764c3b154cd2f28b3b110.jpg\"><img src=\"upload/images/goods/20211123/42219c68fca046e8155373878dc8c56d.jpg\"><img src=\"upload/images/goods/20211123/973155bdd882720fd19f741ff35a17e3.jpg\"><img src=\"upload/images/goods/20211123/f856fea944627ed78a27442084efd441.jpg\"><img src=\"upload/images/goods/20211123/07833c7ade6b4571aaedfe4742127a23.jpg\"></p>', 1637639459, 1637652665);
INSERT INTO `goods` VALUES (5, NULL, '盒装 1:32驰美宝马M8警车仿真合金车模儿童跑车汽车模型男孩玩具', '', '', '', NULL, 100, '台', '', '', 0.00, 0.00, '59.00', 0.00, 0.00, 0, 1, 0, 1, 1, 1, 0, 0, 0, NULL, 'upload/images/goods/20211123/a540a6d25cd69be82950f42a1f62c5a4.jpg', 0, '', '<p><img src=\"upload/images/goods/20211123/b3375a3eca6142716a08d1de4aaabf4d.jpg\"><img src=\"upload/images/goods/20211123/97efeb16781286eb3850cfc06be2e22b.jpg\"><img src=\"upload/images/goods/20211123/f56f2006b986acd6953f6b82d3e50b75.jpg\"><img src=\"upload/images/goods/20211123/dd9f73615c5ed7977b4e4650e79573f8.jpg\"><img src=\"upload/images/goods/20211123/bf54bebf197607dae8baaf45ca8dbe63.jpg\"><img src=\"upload/images/goods/20211123/37de383f93e45dea896a81573d982006.jpg\"><img src=\"upload/images/goods/20211123/9cd241b54a53df9a2fbad713300ca956.jpg\"><img src=\"upload/images/goods/20211123/ae18a64ad4c34663f9d31eac63e7cbb5.jpg\"><img src=\"upload/images/goods/20211123/6d5288864b6f96e08f010000baf70aff.jpg\"><img src=\"upload/images/goods/20211123/f00ea7fb0d3ffe611d0e40875832dbe4.jpg\"></p>', 1637652375, 1637652618);
INSERT INTO `goods` VALUES (6, NULL, '儿童篮球架室内免打孔篮球框宝宝投篮框架男孩宝宝悬挂式家用户外', '', '儿童篮球架', NULL, NULL, 1000, '个', '', '', 0.00, 0.00, '39', 0.00, 0.00, 0, 1, NULL, 1, 1, 1, 0, 0, 0, NULL, 'upload/images/goods/20211123/49f729bc3ef857b6aa82a37a65926dbc.jpg', 0, '', '<p><img src=\"upload/images/goods/20211123/3dbeca46fbadec33a10d46bd3cd3541e.jpg\"><img src=\"upload/images/goods/20211123/05209ad23d84d6da174094baf50a5484.jpg\"><img src=\"upload/images/goods/20211123/6dc12b38404bf0fdad4d8464d5f947af.jpg\"><img src=\"upload/images/goods/20211123/1fd66276bf523636d5d1f6880a3ec3db.jpg\"><img src=\"upload/images/goods/20211123/afb89b1e097d3a78ae9079d8300258a8.jpg\"><img src=\"upload/images/goods/20211123/34423a136abd5d7f9f1c0266a4b258e0.jpg\"><img src=\"upload/images/goods/20211123/598635731a406e328a1b6ea374d814ad.jpg\"><img src=\"upload/images/goods/20211123/172db72ce874e3c17c07dd5a56737931.jpg\"></p>', 1637653595, 1637653595);
INSERT INTO `goods` VALUES (7, NULL, '跨境智能悬浮定高感应手势遥控飞机手表感应飞行器四轴无人机玩具', '', NULL, NULL, NULL, 1000, '个', '', '', 0.00, 0.00, '98', 0.00, 0.00, 0, 1, NULL, 1, 1, 1, 0, 0, 0, NULL, 'upload/images/goods/20211123/f78bf510a6fbeb9df164d89b27ec2bb6.jpg', 0, '', '<p><img src=\"upload/images/goods/20211123/85d762b17fbea27fb92ce662e177bcf5.jpg\"><img src=\"upload/images/goods/20211123/7feeead8411e247390b9e6630de141c0.jpg\"><img src=\"upload/images/goods/20211123/ab9144bd6584b181ca314019dd4f7cd1.jpg\"><img src=\"upload/images/goods/20211123/246f86089ca982ef99abcf7c1be4073d.jpg\"><img src=\"upload/images/goods/20211123/83ce7867838d740f9889dade3cb1abe6.jpg\"><img src=\"upload/images/goods/20211123/df1b2b58f7c10308cd52ff0ed0d4f0fb.jpg\"><img src=\"upload/images/goods/20211123/041fa3dd3ca3effcf31bf417b9cccef8.jpg\"><img src=\"upload/images/goods/20211123/512d0b0300826b241f0eb930090fd88a.jpg\"></p>', 1637654155, 1637654155);
INSERT INTO `goods` VALUES (8, NULL, '兼容樂高滑道大颗粒积木动物滚珠积木桌儿童益智早教拼插装玩具', '', '', '', NULL, 1000, '个', '', '999', 0.00, 0.00, '88.00', 0.00, 0.00, 0, 1, 0, 1, 1, 1, 0, 0, 0, NULL, 'upload/images/goods/20211123/deb2f5e14b8ae69f10b706699a6d8080.jpg', 0, '', '<p><img src=\"upload/images/goods/20211123/f09f1ceb47772607bd8d08fee28ceda2.jpg\"><img src=\"upload/images/goods/20211123/1891ff93013c663b79206ee1120ecc3f.jpg\"><img src=\"upload/images/goods/20211123/f7d85accb67add17c812225469de8b47.jpg\"><img src=\"upload/images/goods/20211123/05e92d0696c47fc529138ff76fd54178.jpg\"><img src=\"upload/images/goods/20211123/7ac648a71e7e19432d918e70d4a734a1.jpg\"><img src=\"upload/images/goods/20211123/2924a5df1b246e112946d61aac3bd799.jpg\"><img src=\"upload/images/goods/20211123/c7ab1c18916695679247772e6b2b92e9.jpg\"><img src=\"upload/images/goods/20211123/d097ab627bb45991366be0481e184ed5.jpg\"><img src=\"upload/images/goods/20211123/46b6d4958b04b00db057975bdf43b3c2.jpg\"><img src=\"upload/images/goods/20211123/07715c41a9c220ee3c7780cb6caf9712.jpg\"><img src=\"upload/images/goods/20211123/ba22d0044d024897527bff8ec90094ae.jpg\"></p>', 1637654599, 1637719199);

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '父id',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'icon图标',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `vice_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '副标题',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `is_home_recommended` tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '是否首页推荐（0否, 1是）',
  `sort` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `is_enable` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否启用（0否，1是）',  
  `create_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`parent_id`) USING BTREE,
  INDEX `is_enable`(`is_enable`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = Compact;

INSERT INTO `goods_category` VALUES (1, 0, '', '数码', '', '', 1, 0, 1, 1637634990, 1638106490);
INSERT INTO `goods_category` VALUES (2, 0, '', '玩具', '', '', 1, 0, 1, 1637635439, 1637654841);
INSERT INTO `goods_category` VALUES (3, 0, '', '户外', '', '', 0, 0, 1, 1637635509, 1637656398);
INSERT INTO `goods_category` VALUES (4, 0, '', '服装', '', '', 0, 0, 1, 1637635598, 1638106725);
INSERT INTO `goods_category` VALUES (5, 0, '', '车品', '', '', 0, 0, 1, 1637635618, 1638172339);
INSERT INTO `goods_category` VALUES (6, 1, 'upload/images/site/20211129/a8510e374d51a6488f15b3ac1a53e24b.jpg', '手机', NULL, NULL, 0, NULL, 1, 1638106514, 1638196702);
INSERT INTO `goods_category` VALUES (7, 1, 'upload/images/site/20211129/5de7a65ee9eca29a734c13328201a4ea.png', '电脑', NULL, NULL, 0, NULL, 1, 1638106551, 1638196698);
INSERT INTO `goods_category` VALUES (8, 1, 'upload/images/site/20211129/3d64fdefab274fda78c0e6c0017066d5.jpg', '摄影', NULL, NULL, 0, NULL, 1, 1638106570, 1638196695);
INSERT INTO `goods_category` VALUES (9, 2, 'upload/images/site/20211129/3ed2aae7a920838f984841de20bb9520.jpg', '娃娃', NULL, NULL, 0, NULL, 1, 1638106614, 1638196690);
INSERT INTO `goods_category` VALUES (10, 2, 'upload/images/site/20211129/69e62bd0b43742091936b2a52b2a1d3b.png', '模型', NULL, NULL, 1, NULL, 1, 1638106632, 1638196686);
INSERT INTO `goods_category` VALUES (11, 2, 'upload/images/site/20211129/80334816e5070bec8e0bcde24ad7b0d0.jpg', '益智', NULL, NULL, 0, NULL, 1, 1638106653, 1638196683);
INSERT INTO `goods_category` VALUES (12, 2, 'upload/images/site/20211129/2ef7cd505105263239504b325bdf5255.jpg', '遥控', NULL, NULL, 0, NULL, 1, 1638106681, 1638196679);
INSERT INTO `goods_category` VALUES (13, 4, 'upload/images/site/20211129/28b8f18710c0021d2b1fa6e554ce768b.jpg', '男装', '', '', 0, 0, 1, 1638106750, 1638196658);
INSERT INTO `goods_category` VALUES (14, 4, 'upload/images/site/20211129/ba08fe42e18cbfacd12d0dac5cc4f4d7.jpg', '女装', NULL, NULL, 0, NULL, 1, 1638106764, 1638196655);
INSERT INTO `goods_category` VALUES (15, 4, 'upload/images/site/20211129/9611b567658651785a98aadc651e8c17.jpg', '内衣', NULL, NULL, 0, NULL, 1, 1638106789, 1638196652);
INSERT INTO `goods_category` VALUES (16, 5, 'upload/images/site/20211129/16870b1a3d7539c8f38e300285f57825.jpg', '美容', NULL, NULL, 0, NULL, 1, 1638106815, 1638196647);
INSERT INTO `goods_category` VALUES (17, 5, 'upload/images/site/20211129/b9e716fd562c5db42ce9a1f1113278a9.jpg', '内饰', NULL, NULL, 0, NULL, 1, 1638106831, 1638196644);
INSERT INTO `goods_category` VALUES (18, 5, 'upload/images/site/20211129/9fde600a283bbb8a0601389961de9b29.jpg', '养护', '', '', 0, 0, 1, 1638106857, 1638196641);
INSERT INTO `goods_category` VALUES (19, 0, NULL, '母婴', NULL, NULL, 0, NULL, 1, 1638106888, 1638106888);
INSERT INTO `goods_category` VALUES (20, 19, 'upload/images/site/20211129/9aee479f6ff7d5530001a98b3c0f664d.jpg', '奶粉', NULL, NULL, 0, NULL, 1, 1638106943, 1638196633);
INSERT INTO `goods_category` VALUES (21, 19, 'upload/images/site/20211129/459d2d36fd9914bd552fc1909bec4c3a.jpg', '尿裤', NULL, NULL, 0, NULL, 1, 1638107012, 1638196629);
INSERT INTO `goods_category` VALUES (22, 19, 'upload/images/site/20211129/e427243ac25356e54c342da7725f1499.jpg', '辅食', NULL, NULL, 0, NULL, 1, 1638107028, 1638196626);
INSERT INTO `goods_category` VALUES (23, 19, 'upload/images/site/20211129/bc9a03b91bbe4778a82c97c5e993c989.jpg', '童车', NULL, NULL, 0, NULL, 1, 1638107052, 1638196624);
INSERT INTO `goods_category` VALUES (24, 3, 'upload/images/site/20211129/7d9934eb02d7901c3dee134a3e24812b.jpg', '冲锋衣', NULL, NULL, 0, NULL, 1, 1638107099, 1638196673);
INSERT INTO `goods_category` VALUES (25, 3, 'upload/images/site/20211129/0c1547f2c1d3995fe43f03855a8f84c9.jpg', '户外鞋', NULL, NULL, 0, NULL, 1, 1638107149, 1638196669);
INSERT INTO `goods_category` VALUES (26, 3, 'upload/images/site/20211129/efab50ea1dead111d795a2b7596f2c27.jpg', '背包', NULL, NULL, 0, NULL, 1, 1638107215, 1638196666);

-- ----------------------------
-- Table structure for goods_category_join
-- ----------------------------
DROP TABLE IF EXISTS `goods_category_join`;
CREATE TABLE `goods_category_join`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类id',
  `create_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类关联' ROW_FORMAT = Compact;

INSERT INTO `goods_category_join` VALUES (7, 5, 2, 1637652618);
INSERT INTO `goods_category_join` VALUES (9, 4, 1, 1637652665);
INSERT INTO `goods_category_join` VALUES (10, 3, 1, 1637652692);
INSERT INTO `goods_category_join` VALUES (11, 2, 1, 1637652707);
INSERT INTO `goods_category_join` VALUES (12, 1, 1, 1637652721);
INSERT INTO `goods_category_join` VALUES (13, 6, 2, 1637653595);
INSERT INTO `goods_category_join` VALUES (14, 7, 2, 1637654155);
INSERT INTO `goods_category_join` VALUES (16, 8, 2, 1637719199);

-- ----------------------------
-- Table structure for goods_comments
-- ----------------------------
DROP TABLE IF EXISTS `goods_comments`;
CREATE TABLE `goods_comments`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `order_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单id',
  `goods_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `business_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '业务类型名称（如订单 order）',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评价内容',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图片数据（一维数组json）',
  `reply` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '回复内容',
  `rating` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评价级别（默认0 1~5）',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否显示（0否, 1是）',
  `is_anonymous` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否匿名（0否，1是）',
  `is_reply` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否回复（0否，1是）',
  `reply_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '回复时间',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品评价' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_photo
-- ----------------------------
DROP TABLE IF EXISTS `goods_photo`;
CREATE TABLE `goods_photo`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `is_show` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '是否显示（0否, 1是）',
  `sort` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '顺序',
  `create_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE,
  INDEX `is_show`(`is_show`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品相册图片' ROW_FORMAT = Compact;

INSERT INTO `goods_photo` VALUES (27, 5, 'upload/images/goods/20211123/a540a6d25cd69be82950f42a1f62c5a4.jpg', 1, 0, 1637652618);
INSERT INTO `goods_photo` VALUES (28, 5, 'upload/images/goods/20211123/5f4fd44679942d70db37efd713a16f8a.jpg', 1, 0, 1637652618);
INSERT INTO `goods_photo` VALUES (29, 5, 'upload/images/goods/20211123/a07f92c8f154b94e16efa615b64bbd0e.jpg', 1, 0, 1637652618);
INSERT INTO `goods_photo` VALUES (30, 5, 'upload/images/goods/20211123/78ae4348ddf7d6f62b5e037094bd2fa4.jpg', 1, 0, 1637652618);
INSERT INTO `goods_photo` VALUES (31, 5, 'upload/images/goods/20211123/40f8ee186656405f0161f0b9bc537ea7.jpg', 1, 0, 1637652618);
INSERT INTO `goods_photo` VALUES (37, 4, 'upload/images/goods/20211123/f1adaa1983e9fec9fb2d906ac0a744b6.jpg', 1, 0, 1637652666);
INSERT INTO `goods_photo` VALUES (38, 4, 'upload/images/goods/20211123/dd3070cd0ee0c7f2ea250da35ab39e7a.jpg', 1, 0, 1637652666);
INSERT INTO `goods_photo` VALUES (39, 4, 'upload/images/goods/20211123/c7e47765d82ca500dca3715c208e18c7.jpg', 1, 0, 1637652666);
INSERT INTO `goods_photo` VALUES (40, 4, 'upload/images/goods/20211123/6f674dea7dcdf390fbf97ebd819cda76.jpg', 1, 0, 1637652666);
INSERT INTO `goods_photo` VALUES (41, 4, 'upload/images/goods/20211123/a030fa277455df0bd625dcf8657a182d.jpg', 1, 0, 1637652666);
INSERT INTO `goods_photo` VALUES (42, 3, 'upload/images/goods/20211123/541e2f3533a73d2dc71be49207ce4406.jpg', 1, 0, 1637652692);
INSERT INTO `goods_photo` VALUES (43, 3, 'upload/images/goods/20211123/00b0e3e01abd62692c1785fbd1d86805.jpg', 1, 0, 1637652692);
INSERT INTO `goods_photo` VALUES (44, 3, 'upload/images/goods/20211123/8a028842e5d189c1f49c406c3f21a4d4.jpg', 1, 0, 1637652692);
INSERT INTO `goods_photo` VALUES (45, 3, 'upload/images/goods/20211123/6a11168c01cc27d0eb95bfcf79e8c019.jpg', 1, 0, 1637652692);
INSERT INTO `goods_photo` VALUES (46, 3, 'upload/images/goods/20211123/e3aca3a2c7ae286162e42b62e59f7952.jpg', 1, 0, 1637652692);
INSERT INTO `goods_photo` VALUES (47, 2, 'upload/images/goods/20211123/dd8e33ee8114c7fb2feece49f9ec4bfc.jpg', 1, 0, 1637652707);
INSERT INTO `goods_photo` VALUES (48, 2, 'upload/images/goods/20211123/f20e3af48cfbefce396592c4ee801a26.jpg', 1, 0, 1637652707);
INSERT INTO `goods_photo` VALUES (49, 2, 'upload/images/goods/20211123/515ab5469c7eb194dd433a3f8516ca6a.jpg', 1, 0, 1637652707);
INSERT INTO `goods_photo` VALUES (50, 2, 'upload/images/goods/20211123/51af08280e63445d85384cade7c5a6cd.jpg', 1, 0, 1637652707);
INSERT INTO `goods_photo` VALUES (51, 2, 'upload/images/goods/20211123/a05e813008a30e7404fe029058da71ec.jpg', 1, 0, 1637652707);
INSERT INTO `goods_photo` VALUES (52, 1, 'upload/images/goods/20211123/87136345c0b042b22792250e240fb4ea.jpg', 1, 0, 1637652721);
INSERT INTO `goods_photo` VALUES (53, 1, 'upload/images/goods/20211123/b8b1e9f29ee4bf10734156732dc40109.jpg', 1, 0, 1637652721);
INSERT INTO `goods_photo` VALUES (54, 1, 'upload/images/goods/20211123/17240e589d2446b08e1cfe435f6cffd9.jpg', 1, 0, 1637652721);
INSERT INTO `goods_photo` VALUES (55, 6, 'upload/images/goods/20211123/49f729bc3ef857b6aa82a37a65926dbc.jpg', 1, 0, 1637653595);
INSERT INTO `goods_photo` VALUES (56, 6, 'upload/images/goods/20211123/c9f601f3cc5e8b02ca156c992a4553d4.jpg', 1, 0, 1637653595);
INSERT INTO `goods_photo` VALUES (57, 6, 'upload/images/goods/20211123/97a8a6312ca586921d1b90ced7b2e3a6.jpg', 1, 0, 1637653595);
INSERT INTO `goods_photo` VALUES (58, 6, 'upload/images/goods/20211123/fc321dd722eb2036df2350298c45e14f.jpg', 1, 0, 1637653595);
INSERT INTO `goods_photo` VALUES (59, 7, 'upload/images/goods/20211123/f78bf510a6fbeb9df164d89b27ec2bb6.jpg', 1, 0, 1637654155);
INSERT INTO `goods_photo` VALUES (60, 7, 'upload/images/goods/20211123/687c0a65683982ff03b7b511a96910f3.jpg', 1, 0, 1637654155);
INSERT INTO `goods_photo` VALUES (61, 7, 'upload/images/goods/20211123/7dc902207126b5146a4d7d24703affb6.jpg', 1, 0, 1637654155);
INSERT INTO `goods_photo` VALUES (62, 7, 'upload/images/goods/20211123/242ab39fd031edc93bdf8a77c9007580.jpg', 1, 0, 1637654155);
INSERT INTO `goods_photo` VALUES (68, 8, 'upload/images/goods/20211123/deb2f5e14b8ae69f10b706699a6d8080.jpg', 1, 0, 1637719199);
INSERT INTO `goods_photo` VALUES (69, 8, 'upload/images/goods/20211123/04966a15d0d7fafd5016e81b8257848e.jpg', 1, 0, 1637719199);
INSERT INTO `goods_photo` VALUES (70, 8, 'upload/images/goods/20211123/ddde147173fee59d88d7ed07f54f5289.jpg', 1, 0, 1637719199);
INSERT INTO `goods_photo` VALUES (71, 8, 'upload/images/goods/20211123/ddd13091aae2c55a8770935ef39867ad.jpg', 1, 0, 1637719199);
INSERT INTO `goods_photo` VALUES (72, 8, 'upload/images/goods/20211123/7ad92741098972a8d8abcdb9f23dcf1c.jpg', 1, 0, 1637719199);

-- ----------------------------
-- Table structure for goods_sku_attribute
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku_attribute`;
CREATE TABLE `goods_sku_attribute`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `item` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格属性值（json字符串存储）',
  `name` varchar(230) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规格名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规格属性' ROW_FORMAT = Compact;

INSERT INTO `goods_sku_attribute` VALUES (7, 4, '[\"128G\",\"64G\",\"256G\"]', '内存');
INSERT INTO `goods_sku_attribute` VALUES (8, 4, '[\"\\u6a59\\u8272\",\"\\u7d2b\\u8272\",\"\\u9ed1\\u8272\"]', '颜色');
INSERT INTO `goods_sku_attribute` VALUES (9, 3, '[\"\\u9ed1\\u8272\",\"\\u7eff\\u8272\",\"\\u7ea2\\u8272\"]', '颜色');
INSERT INTO `goods_sku_attribute` VALUES (10, 3, '[\"128G\",\"64G\",\"256G\"]', '内存');

-- ----------------------------
-- Table structure for goods_sku_value
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku_value`;
CREATE TABLE `goods_sku_value`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `goods_id` int(11) UNSIGNED NOT NULL COMMENT '商品id',
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku规格',
  `price` decimal(10, 2) NOT NULL COMMENT '价格',
  `inventory` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '库存',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货号',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品规格值' ROW_FORMAT = Compact;

INSERT INTO `goods_sku_value` VALUES (23, 5, '', 59.00, 100, '', NULL);
INSERT INTO `goods_sku_value` VALUES (33, 4, '128G-橙色', 999.00, 100, '', NULL);
INSERT INTO `goods_sku_value` VALUES (34, 4, '128G-紫色', 999.00, 100, '', NULL);
INSERT INTO `goods_sku_value` VALUES (35, 4, '128G-黑色', 999.00, 100, '', NULL);
INSERT INTO `goods_sku_value` VALUES (36, 4, '64G-橙色', 899.00, 100, '', NULL);
INSERT INTO `goods_sku_value` VALUES (37, 4, '64G-紫色', 899.00, 100, '', NULL);
INSERT INTO `goods_sku_value` VALUES (38, 4, '64G-黑色', 899.00, 100, '', NULL);
INSERT INTO `goods_sku_value` VALUES (39, 4, '256G-橙色', 1099.00, 100, '', NULL);
INSERT INTO `goods_sku_value` VALUES (40, 4, '256G-紫色', 1099.00, 100, '', NULL);
INSERT INTO `goods_sku_value` VALUES (41, 4, '256G-黑色', 1099.00, 100, '', NULL);
INSERT INTO `goods_sku_value` VALUES (42, 3, '黑色-128G', 999.00, 1000, '', NULL);
INSERT INTO `goods_sku_value` VALUES (43, 3, '黑色-64G', 899.00, 1000, '', NULL);
INSERT INTO `goods_sku_value` VALUES (44, 3, '黑色-256G', 1099.00, 1000, '', NULL);
INSERT INTO `goods_sku_value` VALUES (45, 3, '绿色-128G', 999.00, 1000, '', NULL);
INSERT INTO `goods_sku_value` VALUES (46, 3, '绿色-64G', 899.00, 1000, '', NULL);
INSERT INTO `goods_sku_value` VALUES (47, 3, '绿色-256G', 1099.00, 1000, '', NULL);
INSERT INTO `goods_sku_value` VALUES (48, 3, '红色-128G', 999.00, 1000, '', NULL);
INSERT INTO `goods_sku_value` VALUES (49, 3, '红色-64G', 899.00, 1000, '', NULL);
INSERT INTO `goods_sku_value` VALUES (50, 3, '红色-256G', 1099.00, 1000, '', NULL);
INSERT INTO `goods_sku_value` VALUES (51, 2, '', 0.11, 1000, 'note9', NULL);
INSERT INTO `goods_sku_value` VALUES (52, 1, '', 589.00, 1000, '', NULL);
INSERT INTO `goods_sku_value` VALUES (53, 6, '', 39.00, 1000, '', NULL);
INSERT INTO `goods_sku_value` VALUES (54, 7, '', 98.00, 1000, '', NULL);
INSERT INTO `goods_sku_value` VALUES (56, 8, '', 88.00, 1000, '', NULL);

-- ----------------------------
-- Table structure for navigation
-- ----------------------------
DROP TABLE IF EXISTS `navigation`;
CREATE TABLE `navigation`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `platform` varchar(255) DEFAULT 'H5' COMMENT '所属平台（与uniapp一致，H5 H5，APP-PLUS App,MP-WEIXIN 微信小程序,MP-ALIPAY,支付宝小程序,MP-BAIDU 百度小程序，MP-TOUTIAO 字节跳动小程序,MP-QQ QQ小程序,MP-LARK 飞书小程序,MP-KUAISHOU 快手小程序,MP-360 360小程序）',
  `position` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'h5' COMMENT '位置(index 首页)',
  `event_type` tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '事件类型（0 WEB页面, 1 内部页面(小程序或APP内部地址), 2 外部小程序(同一个主体下的小程序appid), 3 打开地图, 4 拨打电话）',
  `event_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '事件值',
  `images_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '图片地址',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '别名',
  `desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `is_enable` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否启用（0否，1是）',
  `is_need_login` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否需要登录（0否，1是）',
  `sort` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `platform`(`platform`) USING BTREE,
  INDEX `position`(`position`) USING BTREE,
  INDEX `is_enable`(`is_enable`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '导航' ROW_FORMAT = Compact;

INSERT INTO `navigation` VALUES (1, '[\"mp-weixin\",\"mp-alipay\"]', 'index', 1, '/pages/category/category', 'upload/images/site/20211129/18f61667da2c556467efbb6fb22b6574.png', '数码', '描述描述', 1, 0, 0, 1607526816, 1638196568);
INSERT INTO `navigation` VALUES (2, '[\"mp-weixin\",\"h5\",\"app-plus\"]', 'index', 1, '/pages/category/category', 'upload/images/site/20211129/7d9c6e16f470b56fe083079d3a7350b1.png', '户外', '', 1, 0, 0, 1608648270, 1638196565);
INSERT INTO `navigation` VALUES (3, '[\"mp-qq\",\"mp-kuaishou\",\"h5\",\"mp-weixin\"]', 'index', 1, '/pages/goods/goods?id=8', 'upload/images/site/20211129/7c288d246bec2e5575f156662e4dd541.png', '玩具', '描述描述', 1, 1, 0, 1607526816, 1638196560);
INSERT INTO `navigation` VALUES (4, '[\"h5\",\"app-plus\",\"mp-weixin\",\"mp-alipay\",\"mp-baidu\"]', 'index', 1, '/pages/category/category', 'upload/images/site/20211129/760b3e8a74ed8f7f9910d009f0a45eae.png', '车品', '', 1, 0, 7, 1608648270, 1638196558);
INSERT INTO `navigation` VALUES (5, '[\"h5\",\"mp-alipay\",\"mp-weixin\",\"app-plus\"]', 'index', 0, 'https://www.baidu.com', 'upload/images/site/20211129/98f613c2cb1ea56369d9751b28eee666.png', '百度', '', 1, 0, 0, 1608648270, 1638196555);
INSERT INTO `navigation` VALUES (6, '[\"mp-weixin\",\"h5\"]', 'index', 1, '/pages/category/category', 'upload/images/site/20211129/e986c1ab9ea3be8ae6c5f3973d4f95e4.png', '服装', NULL, 1, 0, 0, 1638193447, 1638196551);
INSERT INTO `navigation` VALUES (7, '[\"mp-weixin\",\"h5\"]', 'index', 1, '/pages/category/category', 'upload/images/site/20211129/fe3a59840e97abf95c34ee477d44bbab.png', '母婴', NULL, 1, 0, 7, 1638193497, 1638196549);
INSERT INTO `navigation` VALUES (8, '[\"h5\",\"mp-weixin\"]', 'index', 1, '/pages/search/search?categoryId=1', 'upload/images/site/20211129/5da6bc7640221e492ce014845efdf732.png', '手机', NULL, 1, 0, 8, 1638193814, 1638196546);
INSERT INTO `navigation` VALUES (9, '[\"h5\",\"app-plus\",\"mp-weixin\"]', 'index', 1, '/pages/goods/goods?id=1', 'upload/images/site/20211129/cf41f9b4d58f5431290581490a43d983.png', '背包', NULL, 1, 0, 9, 1638194046, 1638196543);
INSERT INTO `navigation` VALUES (10, '[\"h5\",\"app-plus\",\"mp-weixin\"]', 'index', 1, '/pages/goods/goods?id=2', 'upload/images/site/20211129/382cc21ecb6dd9be5378e6f5c80b068a.png', '手机', NULL, 1, 0, 10, 1638194118, 1638196287);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_no` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `user_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户备注',
  `express_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '快递id',
  `express_number` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '快递单号',
  `payment_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付方式id',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单状态（0待确认, 1已确认/待支付, 2已支付/待发货, 3已发货/待收货, 4已完成, 5已取消, 6已关闭）',
  `pay_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付状态（0未支付, 1已支付, 2已退款, 3部分退款）',
  `qty_total` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买商品总数量',
  `increase_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '增加的金额',
  `preferential_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '优惠金额',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '订单单价',
  `total_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '订单总价(订单最终价格)',
  `pay_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '已支付金额',
  `refund_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退款金额',
  `returned_qty` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '退货数量',
  `client_type` varchar(30) NOT NULL DEFAULT '' COMMENT '客户端类型 (与uniapp一致，H5 H5，APP-PLUS App,MP-WEIXIN 微信小程序,MP-ALIPAY,支付宝小程序,MP-BAIDU 百度小程序，MP-TOUTIAO 字节跳动小程序,MP-QQ QQ小程序,MP-LARK 飞书小程序,MP-KUAISHOU 快手小程序,MP-360 360小程序）',
  `order_model` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单模式（0销售型, 1展示型, 2自提点, 3虚拟销售）',
  `is_under_line` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否线下支付（0否，1是）',
  `pay_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付时间',
  `confirm_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '确认时间',
  `delivery_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发货时间',
  `cancel_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '取消时间',
  `collect_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收货时间',
  `close_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关闭时间',
  `comments_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论时间',
  `is_comments` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家是否已评论（0否, 大于0评论时间）',
  `user_is_comments` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户是否已评论（0否, 大于0评论时间）',
  `is_delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商家是否已删除（0否, 大于0删除时间）',
  `user_is_delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户是否已删除（0否, 大于0删除时间）',
  `extension_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展展示数据',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_no`(`order_no`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `pay_status`(`pay_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_address
-- ----------------------------
DROP TABLE IF EXISTS `order_address`;
CREATE TABLE `order_address`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `address_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收件地址id',
  `tag` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '别名',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收件人-姓名',
  `tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收件人-电话',
  `province` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收件人-省',
  `city` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收件人-市',
  `county` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '收件人-县/区',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收件人-详细地址',
  `province_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收件人-省-名称',
  `city_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收件人-市-名称',
  `county_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收件人-县/区-名称',
  `lng` decimal(13, 10) UNSIGNED NOT NULL DEFAULT 0.0000000000 COMMENT '收货地址-经度',
  `lat` decimal(13, 10) UNSIGNED NOT NULL DEFAULT 0.0000000000 COMMENT '收货地址-维度',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单地址' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `order_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单id',
  `goods_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `title` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '封面图片',
  `original_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '原价',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '订单价格',
  `total_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '当前总价(单价*数量)',
  `sku` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '规格',
  `qty` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买数量',
  `model` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '型号',
  `sku_weight` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '重量（kg）',
  `sku_code` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '编码',
  `sku_barcode` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '条形码',
  `refund_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退款金额',
  `returned_qty` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '退货数量',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单详情' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pay_log
-- ----------------------------
DROP TABLE IF EXISTS `pay_log`;
CREATE TABLE `pay_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '支付日志id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `order_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单id',
  `trade_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付平台交易号',
  `buyer_user` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付平台用户帐号',
  `pay_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '支付金额',
  `total_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '订单实际金额',
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单名称',
  `payment_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付方式标记',
  `business_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '业务类型（0默认, 1订单, 2充值）',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission_admin
-- ----------------------------
DROP TABLE IF EXISTS `permission_admin`;
CREATE TABLE `permission_admin`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '角色id',
  `username` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `nickname` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理员昵称',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别（0保密，1女，2男）',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `salt` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码盐',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'token',
  `token_expire` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'token有效期',
  `last_login` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '最后登录时间',
  `last_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `status` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '状态，1.正常，2.禁止登录',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限：管理员账号' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission_admin
-- ----------------------------
INSERT INTO `permission_admin` VALUES (1, 1, 'paddyshop', 'f27297c925a4d1faa6610e412d3acdc5', 'paddyshop', 0, NULL, '693767', 'ac1fdc6692141e555a2989a8752e05bc', 1635150815, 1635064415, '', 1, 1607006830, 1635064415);
INSERT INTO `permission_admin` VALUES (2, 1, 'goods', '844e22337497a5cb3f635db033315fd7', '商品录入员', 0, NULL, '636883', NULL, NULL, NULL, NULL, 2, 1607006962, 1607011000);
INSERT INTO `permission_admin` VALUES (3, 3, 'order', '6c73c0f29d9e66ca5a2a09b03feac0e5', '订单发货员', 0, '1321@qq.com', '477129', NULL, NULL, NULL, NULL, 1, 1607007015, 1608475066);

-- ----------------------------
-- Table structure for permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `permission_menu`;
CREATE TABLE `permission_menu`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `parent_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '权限父级id',
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限资源名称(菜单名称)',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `permission` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `icon` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图标class',
  `path` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由组件',
  `type` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '菜单类型',
  `platform_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '所属平台id',
  `is_enable` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否启用(0.否，1.是)',
  `create_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限：菜单' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission_menu
-- ----------------------------
INSERT INTO `permission_menu` VALUES (1, 0, '系统', 'system', '', 10, 'wrench', '/system', 'layoutHeaderAside', 1, 1, 1, 1607194588, 1608743660);
INSERT INTO `permission_menu` VALUES (4, 1, '权限管理', 'permission', NULL, 100, 'power-off', '', '', 1, 1, 1, 1607194588, 1607194845);
INSERT INTO `permission_menu` VALUES (5, 4, '菜单管理', 'resource', 'auth.menu:tree', 0, 'magnet', '/permission/resource', '/permission/views/resource', 1, 1, 1, 1607194588, 1637743270);
INSERT INTO `permission_menu` VALUES (6, 5, '查看', 'viewResource', 'auth.menu:list', 0, '', '', '', 2, 1, 1, 1607194588, 1637743278);
INSERT INTO `permission_menu` VALUES (7, 5, '添加', 'addResource', 'auth.menu:add', 0, '', '', '', 2, 1, 1, 1608390988, 1637743284);
INSERT INTO `permission_menu` VALUES (8, 5, '删除', 'delResource', 'auth.menu:del', 0, '', '', '', 2, 1, 1, 1608364398, 1637743290);
INSERT INTO `permission_menu` VALUES (14, 5, '编辑', 'editResource', 'auth.menu:edit', 0, '', '', '', 2, 1, 1, 1608388728, 1637743295);
INSERT INTO `permission_menu` VALUES (15, 4, '管理员管理', 'admin', 'auth.admin:view', 0, 'user', '/permission/admin', '/permission/views/admin', 1, NULL, 1, 1608458228, 1637826325);
INSERT INTO `permission_menu` VALUES (16, 15, '编辑', 'editAdmin', 'auth.admin:edit', NULL, '', NULL, NULL, 2, NULL, 1, 1608467461, 1608467461);
INSERT INTO `permission_menu` VALUES (17, 15, '删除', 'delAdmin', 'auth.admin:del', NULL, '', NULL, NULL, 2, NULL, 1, 1608471201, 1608471201);
INSERT INTO `permission_menu` VALUES (18, 15, '添加', 'addAdmin', 'auth.admin:add', NULL, '', NULL, NULL, 2, NULL, 1, 1608471238, 1608471238);
INSERT INTO `permission_menu` VALUES (19, 4, '角色管理', 'role', 'auth.role:list', 0, 'users', '/permission/role', '/permission/views/role', 1, NULL, 1, 1608474361, 1637826343);
INSERT INTO `permission_menu` VALUES (20, 15, '查看', 'viewAdmin', 'auth.admin:list', 0, '', '', '', 2, NULL, 1, 1608474655, 1637735495);
INSERT INTO `permission_menu` VALUES (21, 19, '查看', 'viewRole', 'auth.role:view', 0, '', '', '', 2, NULL, 1, 1608478155, 1637735505);
INSERT INTO `permission_menu` VALUES (22, 19, '添加', 'addRole', 'auth.role:add', 0, '', '', '', 2, NULL, 1, 1608478230, 1637735512);
INSERT INTO `permission_menu` VALUES (23, 19, '删除', 'delRole', 'auth.role:del', 0, '', '', '', 2, NULL, 1, 1608478317, 1637735526);
INSERT INTO `permission_menu` VALUES (24, 19, '编辑', 'editRole', 'auth.role:edit', 0, '', '', '', 2, NULL, 1, 1608478346, 1637735541);
INSERT INTO `permission_menu` VALUES (25, 19, '授权', 'authzRole', 'auth.role:authz', 0, '', '', '', 2, NULL, 1, 1608478419, 1637735519);
INSERT INTO `permission_menu` VALUES (26, 1, '物流管理', 'logistics', '', 0, 'car', '', '', 1, NULL, 1, 1608618217, 1637826280);
INSERT INTO `permission_menu` VALUES (27, 26, '地区管理', 'region', 'setting.region:list', 0, 'codepen', '/logistics/region', '/logistics/views/region', 1, NULL, 1, 1608618343, 1637826414);
INSERT INTO `permission_menu` VALUES (28, 26, '配送方式', 'delivery', 'setting.delivery:list', 0, 'asl-interpreting', '/logistics/delivery', '/logistics/views/delivery', 1, NULL, 1, 1608618782, 1637826426);
INSERT INTO `permission_menu` VALUES (29, 28, '添加', 'addDelivery', 'setting.delivery:add', 0, '', '', '', 2, NULL, 1, 1608620169, 1637739355);
INSERT INTO `permission_menu` VALUES (30, 28, '编辑', 'editDelivery', 'setting.delivery:edit', 0, '', '', '', 2, NULL, 1, 1608620242, 1637739362);
INSERT INTO `permission_menu` VALUES (31, 28, '删除', 'delDelivery', 'setting.delivery:del', 0, '', '', '', 2, NULL, 1, 1608620280, 1637739368);
INSERT INTO `permission_menu` VALUES (32, 28, '查看', 'viewDelivery', 'setting.delivery:view', 0, '', '', '', 2, NULL, 1, 1608620337, 1637739373);
INSERT INTO `permission_menu` VALUES (33, 27, '添加', 'addRegion', 'setting.region:add', 0, '', '', '', 2, NULL, 1, 1608625210, 1637743525);
INSERT INTO `permission_menu` VALUES (34, 27, '查看', 'viewRegion', 'setting.region:view', 0, '', '', '', 2, NULL, 1, 1608625245, 1637743530);
INSERT INTO `permission_menu` VALUES (35, 27, '删除', 'delRegion', 'setting.region:del', 0, '', '', '', 2, NULL, 1, 1608625274, 1637743535);
INSERT INTO `permission_menu` VALUES (36, 27, '编辑', 'editRegion', 'setting.region:edit', 0, '', '', '', 2, NULL, 1, 1608625300, 1637743540);
INSERT INTO `permission_menu` VALUES (37, 0, '店铺', 'store', '', 20, 'fa', '/store', 'layoutHeaderAside', 1, NULL, 1, 1608628136, 1637723634);
INSERT INTO `permission_menu` VALUES (38, 37, '导航管理', 'navigation', 'store.navigation:list', 0, 'paper-plane-o', '/store/navigation', '/store/views/navigation', 1, NULL, 1, 1608628291, 1637826195);
INSERT INTO `permission_menu` VALUES (39, 37, '文章发布', 'article', '', 0, 'newspaper-o', '', '', 1, NULL, 1, 1608646902, 1637826213);
INSERT INTO `permission_menu` VALUES (40, 38, '添加', 'addNavigation', 'store.navigation:add', 0, '', '', '', 2, NULL, 1, 1608648424, 1637735297);
INSERT INTO `permission_menu` VALUES (41, 38, '查看', 'viewNavigation', 'store.navigation:view', 0, '', '', '', 2, NULL, 1, 1608648473, 1637735304);
INSERT INTO `permission_menu` VALUES (42, 38, '删除', 'deleteNavigation', 'store.navigation:del', 0, '', '', '', 2, NULL, 1, 1608648508, 1637735311);
INSERT INTO `permission_menu` VALUES (43, 38, '编辑', 'editNavigation', 'store.navigation:edit', 0, '', '', '', 2, NULL, 1, 1608648538, 1637735318);
INSERT INTO `permission_menu` VALUES (44, 39, '文章管理', 'article', 'store.article:list', 0, 'file-word-o', '/store/article', '/store/views/article', 1, NULL, 1, 1608648972, 1637826472);
INSERT INTO `permission_menu` VALUES (45, 39, '文章分类', 'articleCategory', 'store.articlecategory:tree', 0, 'file-code-o', '/store/article-category', '/store/views/article-category', 1, NULL, 1, 1608648996, 1637826501);
INSERT INTO `permission_menu` VALUES (46, 45, '添加', 'addArticleCategory', 'store.articlecategory:add', 0, '', '', '', 2, NULL, 1, 1608652888, 1637742894);
INSERT INTO `permission_menu` VALUES (47, 45, '删除', 'delArticleCategory', 'store.articlecategory:del', 0, '', '', '', 2, NULL, 1, 1608652942, 1637742900);
INSERT INTO `permission_menu` VALUES (48, 45, '编辑', 'editArticleCategory', 'store.articlecategory:edit', 0, '', '', '', 2, NULL, 1, 1608652978, 1637742916);
INSERT INTO `permission_menu` VALUES (49, 45, '查看', 'viewArticleCategory', 'store.articlecategory:view', 0, '', '', '', 2, NULL, 1, 1608653017, 1637742923);
INSERT INTO `permission_menu` VALUES (50, 44, '添加', 'addArticle', 'store.article:add', 0, '', '', '', 2, NULL, 1, 1608728993, 1637735355);
INSERT INTO `permission_menu` VALUES (51, 44, '编辑', 'editArticle', 'store.article:edit', 0, '', '', '', 2, NULL, 1, 1608729020, 1637735361);
INSERT INTO `permission_menu` VALUES (52, 44, '查看', 'viewArticle', 'store.article:view', 0, '', '', '', 2, NULL, 1, 1608729053, 1637735369);
INSERT INTO `permission_menu` VALUES (53, 44, '删除', 'delArticle', 'store.article:del', 0, '', '', '', 2, NULL, 1, 1608729090, 1637735375);
INSERT INTO `permission_menu` VALUES (54, 37, '海报管理', 'banner', 'store.banner:list', 0, 'picture-o', '/store/banner', '/store/views/banner', 1, NULL, 1, 1608729371, 1637826233);
INSERT INTO `permission_menu` VALUES (55, 54, '添加', 'addBanner', 'store.banner:add', 0, '', '', '', 2, NULL, 1, 1608729457, 1637735418);
INSERT INTO `permission_menu` VALUES (56, 54, '查看', 'viewBanner', 'store.banner:view', 0, '', '', '', 2, NULL, 1, 1608729494, 1637735427);
INSERT INTO `permission_menu` VALUES (57, 54, '编辑', 'editBanner', 'store.banner:edit', 0, '', '', '', 2, NULL, 1, 1608729534, 1637735442);
INSERT INTO `permission_menu` VALUES (58, 54, '删除', 'delBanner', 'store.banner:del', 0, '', '', '', 2, NULL, 1, 1608729566, 1637735450);
INSERT INTO `permission_menu` VALUES (59, 0, '会员', 'user', '', 80, 'user-circle', '/user', 'layoutHeaderAside', 1, NULL, 1, 1608733888, 1637825928);
INSERT INTO `permission_menu` VALUES (60, 59, '会员管理', 'user', 'user.user:list', 0, 'user-circle-o', '/user/user', '/user/views/user', 1, NULL, 1, 1608733950, 1637826169);
INSERT INTO `permission_menu` VALUES (61, 60, '添加', 'addUser', 'user.user:add', 0, '', '', '', 2, NULL, 1, 1608735787, 1637735250);
INSERT INTO `permission_menu` VALUES (62, 60, '编辑', 'editUser', 'user.user:edit', 0, '', '', '', 2, NULL, 1, 1608735812, 1637735257);
INSERT INTO `permission_menu` VALUES (63, 60, '查看', 'viewUser', 'user.user:view', 0, '', '', '', 2, NULL, 1, 1608735848, 1637735264);
INSERT INTO `permission_menu` VALUES (64, 60, '删除', 'delUser', 'user.user:del', 0, '', '', '', 2, NULL, 1, 1608735872, 1637735272);
INSERT INTO `permission_menu` VALUES (65, 0, '商品', '', '', 100, 'hand-rock-o', '/goods', 'layoutHeaderAside', 1, NULL, 1, 1608737977, 1637825692);
INSERT INTO `permission_menu` VALUES (66, 0, '订单', '', '', 90, 'file-text-o', '/order', 'layoutHeaderAside', 1, NULL, 1, 1608737991, 1637825762);
INSERT INTO `permission_menu` VALUES (67, 65, '商品管理', 'goods', 'goods.goods:list', 0, 'cubes', '/goods/goods', '/goods/views/goods', 1, NULL, 1, 1608738124, 1637826002);
INSERT INTO `permission_menu` VALUES (68, 66, '订单管理', 'order', 'order.order:list', 0, 'reorder', '/order/order', '/order/views/order', 1, NULL, 1, 1608738142, 1637826090);
INSERT INTO `permission_menu` VALUES (69, 0, '营销', '', '', 70, 'automobile', '/marketing', 'layoutHeaderAside', 1, NULL, 1, 1608738241, 1647937707);
INSERT INTO `permission_menu` VALUES (70, 69, '优惠券', 'coupon', 'marketing:coupon:view', 0, 'cubes', '', '', 1, NULL, 1, 1608738262, 1648028804);
INSERT INTO `permission_menu` VALUES (71, 65, '商品分类', 'category', 'goods.category:list', 0, 'calendar', '/goods/category', '/goods/views/category', 1, NULL, 1, 1608824943, 1637826059);
INSERT INTO `permission_menu` VALUES (72, 71, '添加', 'addCategory', 'goods.category:add', 0, '', '', '', 2, NULL, 1, 1608829070, 1637737894);
INSERT INTO `permission_menu` VALUES (73, 71, '编辑', 'editCategory', 'goods.category:edit', 0, '', '', '', 2, NULL, 1, 1608829100, 1637737900);
INSERT INTO `permission_menu` VALUES (74, 71, '删除', 'delCategory', 'goods.category:del', 0, '', '', '', 2, NULL, 1, 1608829126, 1637737907);
INSERT INTO `permission_menu` VALUES (75, 71, '查看', 'viewCategory', 'goods.category:view', 0, '', '', '', 2, NULL, 1, 1608829162, 1637737883);
INSERT INTO `permission_menu` VALUES (76, 67, '查看', 'viewGoods', 'goods.goods:view', 0, '', '', '', 2, NULL, 1, 1609598273, 1637737850);
INSERT INTO `permission_menu` VALUES (77, 67, '添加', 'addGoods', 'goods.goods:add', 0, '', '', '', 2, NULL, 1, 1609598306, 1637737855);
INSERT INTO `permission_menu` VALUES (78, 67, '编辑', 'editGoods', 'goods.goods:edit', 0, '', '', '', 2, NULL, 1, 1609598338, 1637737862);
INSERT INTO `permission_menu` VALUES (79, 67, '删除', 'delGoods', 'goods.goods:del', 0, '', '', '', 2, NULL, 1, 1609598386, 1637737869);
INSERT INTO `permission_menu` VALUES (80, 68, '发货', 'delivery', 'order.order:delivery', 0, '', '', '', 2, NULL, 1, 1633165456, 1637735192);
INSERT INTO `permission_menu` VALUES (81, 68, '查看', 'viewOrder', 'order.order:view', 0, '', '', '', 2, NULL, 1, 1634022164, 1637735202);
INSERT INTO `permission_menu` VALUES (82, 0, '财务', 'finance', '', 85, 'cny', '/finance', 'layoutHeaderAside', 1, NULL, 1, 1634117810, 1637825902);
INSERT INTO `permission_menu` VALUES (83, 82, '钱包管理', 'wallet', 'wallet.wallet:list', 0, 'google-wallet', '/finance/wallet', '/finance/views/wallet', 1, NULL, 1, 1634118000, 1637826106);
INSERT INTO `permission_menu` VALUES (84, 82, '钱包日志', 'walletlog', 'wallet.walletlog:list', 0, 'sliders', '/finance/views/walletlog', '/finance/views/walletlog', 1, NULL, 1, 1634118769, 1637826143);
INSERT INTO `permission_menu` VALUES (85, 82, '支付日志', 'paylog', 'finance.paylog:list', 0, 'file-image-o', '/finance/paylog', '/finance/views/paylog', 1, NULL, 1, 1634119357, 1637826155);
INSERT INTO `permission_menu` VALUES (86, 65, '商品评价', 'comments', 'goods.comments:list', 0, 'commenting-o', '/goods/comments', '/goods/views/comments', 1, NULL, 1, 1634204836, 1637826076);
INSERT INTO `permission_menu` VALUES (87, 86, '编辑', 'editComments', 'goods.comments:edit', 0, '', '', '', 2, NULL, 1, 1634290309, 1637737919);
INSERT INTO `permission_menu` VALUES (88, 86, '删除', 'delComments', 'goods.comments:del', 0, '', '', '', 2, NULL, 1, 1634290348, 1637737924);
INSERT INTO `permission_menu` VALUES (89, 83, '编辑', 'editWallet', 'wallet.wallet:edit', 0, '', '', '', 2, NULL, 1, 1635064647, 1637740624);
INSERT INTO `permission_menu` VALUES (90, 1, '系统设置', 'setting', 'setting.config:getall', 0, 'database', '/setting/system', '/setting/views/system', 1, NULL, 1, 1636420815, 1637826248);
INSERT INTO `permission_menu` VALUES (91, 5, '菜单权限校验', 'getpermissionMenu', '', 0, '', '', '', 2, NULL, 1, 1637726183, 1637726207);
INSERT INTO `permission_menu` VALUES (92, 71, '分类树', 'categoryTree', 'goods.category:tree', NULL, '', NULL, NULL, 2, NULL, 1, 1637737711, 1637737711);
INSERT INTO `permission_menu` VALUES (93, 67, '上下架', 'goodsShelves', 'goods.goods:shelves', NULL, '', NULL, NULL, 2, NULL, 1, 1637738112, 1637738112);
INSERT INTO `permission_menu` VALUES (94, 60, '获取所有会员', 'getAllUser', 'user.user:getall', NULL, '', NULL, NULL, 2, NULL, 1, 1637738346, 1637738346);
INSERT INTO `permission_menu` VALUES (95, 86, '显示隐藏', NULL, 'goods.comments:show', NULL, '', NULL, NULL, 2, NULL, 1, 1637739191, 1637739191);
INSERT INTO `permission_menu` VALUES (96, 28, '所有数据', 'getAllDelivery', 'setting.delivery:getall', 0, '', '', '', 2, NULL, 1, 1637739430, 1637739471);
INSERT INTO `permission_menu` VALUES (97, 90, '保存', NULL, 'setting.config:save', NULL, '', NULL, NULL, 2, NULL, 1, 1637743179, 1637743179);
INSERT INTO `permission_menu` VALUES (98, 19, '获取权限', NULL, 'auth.role:getpermission', NULL, '', NULL, NULL, 2, NULL, 1, 1637743449, 1637743449);
INSERT INTO `permission_menu` VALUES (99, 104, '添加', NULL, 'marketing:coupon:add', NULL, '', NULL, NULL, 2, NULL, 1, 1647509796, 1648028614);
INSERT INTO `permission_menu` VALUES (100, 104, '编辑', NULL, 'marketing:coupon:edit', NULL, '', NULL, NULL, 2, NULL, 1, 1647509817, 1648028625);
INSERT INTO `permission_menu` VALUES (101, 104, '删除', NULL, 'marketing:coupon:del', NULL, '', NULL, NULL, 2, NULL, 1, 1647509840, 1648028634);
INSERT INTO `permission_menu` VALUES (102, 104, '查看', NULL, 'marketing:coupon:view', NULL, '', NULL, NULL, 2, NULL, 1, 1647509877, 1648028647);
INSERT INTO `permission_menu` VALUES (103, 70, '领券记录', 'couponUser', 'marketing:couponuser:view', NULL, 'bar-chart-o', '/marketing/couponuser', '/marketing/views/couponuser', 1, NULL, 1, 1647937687, 1648028706);
INSERT INTO `permission_menu` VALUES (104, 70, '优惠券管理', 'couponList', 'marketing:coupon:view', NULL, 'thumbs-up', '/marketing/coupon', '/marketing/views/coupon', 1, NULL, 1, 1648028575, 1648028857);

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色组id',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `is_enable` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用（0否，1是）',
  `code` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色代码',
  `platform_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属平台',
  `menu_ids` text COMMENT '菜单ids json',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限：角色组' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES (1, '超级管理员', 1, 'superadmin', 1, '[]', 1607181206, 1608567150);
INSERT INTO `permission_role` VALUES (2, '产品录入', 1, 'goods', 1, '[]', 1607181688, 1608567058);
INSERT INTO `permission_role` VALUES (3, '订单管理', 1, 'order', 1, '[1,4,19,25,24,23,22,21,15,20,18,17,16,5,14,8,7,6]', 1607181741, 1608567132);
INSERT INTO `permission_role` VALUES (4, '测试管理', 1, 'test', 1, '', 1607181801, 1607181801);

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `level` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '级别类型（1:一级[所有省], 2：二级[所有市], 3:三级[所有区县], 4:街道[所有街道]）',
  `letters` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '城市首字母',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_enable` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用（0否，1是）',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `is_enable`(`is_enable`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5026 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地区' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES (1, 0, '北京市', 1, '', 0, 1, 0, 1575617128);
INSERT INTO `region` VALUES (2, 0, '天津市', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3, 0, '河北省', 1, '', 0, 1, 0, 1634887464);
INSERT INTO `region` VALUES (4, 0, '山西省', 1, '', 0, 1, 0, 1634886703);
INSERT INTO `region` VALUES (5, 0, '内蒙古自治区', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (6, 0, '辽宁省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (7, 0, '吉林省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (8, 0, '黑龙江省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (9, 0, '上海市', 1, '', 0, 1, 0, 1634889847);
INSERT INTO `region` VALUES (10, 0, '江苏省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (11, 0, '浙江省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (12, 0, '安徽省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (13, 0, '福建省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (14, 0, '江西省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (15, 0, '山东省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (16, 0, '河南省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (17, 0, '湖北省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (18, 0, '湖南省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (19, 0, '广东省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (20, 0, '广西壮族自治区', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (21, 0, '海南省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (22, 0, '重庆市', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (23, 0, '四川省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (24, 0, '贵州省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (25, 0, '云南省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (26, 0, '西藏自治区', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (27, 0, '陕西省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (28, 0, '甘肃省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (29, 0, '青海省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (30, 0, '宁夏回族自治区', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (31, 0, '新疆维吾尔自治区', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (32, 0, '台湾省', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (33, 0, '香港特别行政区', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (34, 0, '澳门特别行政区', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (35, 0, '海外', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (36, 0, '其它', 1, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (37, 1, '东城区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (38, 1, '西城区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (39, 1, '崇文区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (40, 1, '宣武区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (41, 1, '朝阳区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (42, 1, '丰台区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (43, 1, '石景山区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (44, 1, '海淀区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (45, 1, '门头沟区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (46, 1, '房山区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (47, 1, '通州区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (48, 1, '顺义区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (49, 1, '昌平区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (50, 1, '大兴区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (51, 1, '怀柔区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (52, 1, '平谷区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (53, 1, '密云县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (54, 1, '延庆县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (55, 2, '和平区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (56, 2, '河东区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (57, 2, '河西区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (58, 2, '南开区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (59, 2, '河北区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (60, 2, '红桥区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (61, 2, '塘沽区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (62, 2, '汉沽区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (63, 2, '大港区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (64, 2, '东丽区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (65, 2, '西青区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (66, 2, '津南区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (67, 2, '北辰区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (68, 2, '武清区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (69, 2, '宝坻区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (70, 2, '宁河县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (71, 2, '静海县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (72, 2, '蓟县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (73, 3, '石家庄市', 2, '', 0, 1, 0, 1634810012);
INSERT INTO `region` VALUES (74, 3, '唐山市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (75, 3, '秦皇岛市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (76, 3, '邯郸市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (77, 3, '邢台市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (78, 3, '保定市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (79, 3, '张家口市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (80, 3, '承德市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (81, 3, '衡水市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (82, 3, '廊坊市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (83, 3, '沧州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (84, 4, '太原市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (85, 4, '大同市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (86, 4, '阳泉市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (87, 4, '长治市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (88, 4, '晋城市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (89, 4, '朔州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (90, 4, '晋中市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (91, 4, '运城市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (92, 4, '忻州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (93, 4, '临汾市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (94, 4, '吕梁市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (95, 5, '呼和浩特市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (96, 5, '包头市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (97, 5, '乌海市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (98, 5, '赤峰市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (99, 5, '通辽市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (100, 5, '鄂尔多斯市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (101, 5, '呼伦贝尔市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (102, 5, '巴彦淖尔市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (103, 5, '乌兰察布市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (104, 5, '兴安盟', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (105, 5, '锡林郭勒盟', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (106, 5, '阿拉善盟', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (107, 6, '沈阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (108, 6, '大连市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (109, 6, '鞍山市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (110, 6, '抚顺市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (111, 6, '本溪市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (112, 6, '丹东市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (113, 6, '锦州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (114, 6, '营口市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (115, 6, '阜新市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (116, 6, '辽阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (117, 6, '盘锦市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (118, 6, '铁岭市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (119, 6, '朝阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (120, 6, '葫芦岛市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (121, 7, '长春市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (122, 7, '吉林市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (123, 7, '四平市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (124, 7, '辽源市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (125, 7, '通化市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (126, 7, '白山市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (127, 7, '松原市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (128, 7, '白城市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (129, 7, '延边朝鲜族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (130, 8, '哈尔滨市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (131, 8, '齐齐哈尔市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (132, 8, '鸡西市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (133, 8, '鹤岗市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (134, 8, '双鸭山市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (135, 8, '大庆市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (136, 8, '伊春市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (137, 8, '佳木斯市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (138, 8, '七台河市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (139, 8, '牡丹江市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (140, 8, '黑河市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (141, 8, '绥化市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (142, 8, '大兴安岭地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (143, 9, '黄浦区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (144, 9, '卢湾区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (145, 9, '徐汇区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (146, 9, '长宁区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (147, 9, '静安区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (148, 9, '普陀区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (149, 9, '闸北区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (150, 9, '虹口区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (151, 9, '杨浦区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (152, 9, '闵行区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (153, 9, '宝山区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (154, 9, '嘉定区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (155, 9, '浦东新区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (156, 9, '金山区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (157, 9, '松江区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (158, 9, '青浦区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (159, 9, '南汇区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (160, 9, '奉贤区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (161, 9, '崇明县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (162, 10, '南京市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (163, 10, '无锡市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (164, 10, '徐州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (165, 10, '常州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (166, 10, '苏州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (167, 10, '南通市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (168, 10, '连云港市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (169, 10, '淮安市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (170, 10, '盐城市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (171, 10, '扬州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (172, 10, '镇江市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (173, 10, '泰州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (174, 10, '宿迁市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (175, 11, '杭州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (176, 11, '宁波市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (177, 11, '温州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (178, 11, '嘉兴市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (179, 11, '湖州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (180, 11, '绍兴市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (181, 11, '舟山市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (182, 11, '衢州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (183, 11, '金华市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (184, 11, '台州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (185, 11, '丽水市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (186, 12, '合肥市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (187, 12, '芜湖市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (188, 12, '蚌埠市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (189, 12, '淮南市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (190, 12, '马鞍山市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (191, 12, '淮北市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (192, 12, '铜陵市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (193, 12, '安庆市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (194, 12, '黄山市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (195, 12, '滁州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (196, 12, '阜阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (197, 12, '宿州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (198, 12, '巢湖市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (199, 12, '六安市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (200, 12, '亳州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (201, 12, '池州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (202, 12, '宣城市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (203, 13, '福州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (204, 13, '厦门市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (205, 13, '莆田市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (206, 13, '三明市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (207, 13, '泉州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (208, 13, '漳州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (209, 13, '南平市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (210, 13, '龙岩市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (211, 13, '宁德市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (212, 14, '南昌市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (213, 14, '景德镇市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (214, 14, '萍乡市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (215, 14, '九江市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (216, 14, '新余市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (217, 14, '鹰潭市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (218, 14, '赣州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (219, 14, '吉安市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (220, 14, '宜春市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (221, 14, '抚州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (222, 14, '上饶市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (223, 15, '济南市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (224, 15, '青岛市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (225, 15, '淄博市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (226, 15, '枣庄市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (227, 15, '东营市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (228, 15, '烟台市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (229, 15, '潍坊市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (230, 15, '济宁市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (231, 15, '泰安市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (232, 15, '威海市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (233, 15, '日照市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (234, 15, '莱芜市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (235, 15, '临沂市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (236, 15, '德州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (237, 15, '聊城市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (238, 15, '滨州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (239, 15, '菏泽市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (240, 16, '郑州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (241, 16, '开封市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (242, 16, '洛阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (243, 16, '平顶山市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (244, 16, '安阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (245, 16, '鹤壁市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (246, 16, '新乡市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (247, 16, '焦作市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (248, 16, '濮阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (249, 16, '许昌市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (250, 16, '漯河市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (251, 16, '三门峡市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (252, 16, '南阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (253, 16, '商丘市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (254, 16, '信阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (255, 16, '周口市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (256, 16, '驻马店市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (257, 16, '济源市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (258, 17, '武汉市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (259, 17, '黄石市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (260, 17, '十堰市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (261, 17, '宜昌市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (262, 17, '襄樊市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (263, 17, '鄂州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (264, 17, '荆门市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (265, 17, '孝感市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (266, 17, '荆州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (267, 17, '黄冈市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (268, 17, '咸宁市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (269, 17, '随州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (270, 17, '恩施土家族苗族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (271, 17, '仙桃市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (272, 17, '潜江市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (273, 17, '天门市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (274, 17, '神农架林区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (275, 18, '长沙市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (276, 18, '株洲市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (277, 18, '湘潭市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (278, 18, '衡阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (279, 18, '邵阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (280, 18, '岳阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (281, 18, '常德市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (282, 18, '张家界市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (283, 18, '益阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (284, 18, '郴州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (285, 18, '永州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (286, 18, '怀化市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (287, 18, '娄底市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (288, 18, '湘西土家族苗族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (289, 19, '广州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (290, 19, '韶关市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (291, 19, '深圳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (292, 19, '珠海市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (293, 19, '汕头市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (294, 19, '佛山市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (295, 19, '江门市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (296, 19, '湛江市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (297, 19, '茂名市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (298, 19, '肇庆市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (299, 19, '惠州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (300, 19, '梅州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (301, 19, '汕尾市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (302, 19, '河源市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (303, 19, '阳江市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (304, 19, '清远市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (305, 19, '东莞市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (306, 19, '中山市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (307, 19, '潮州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (308, 19, '揭阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (309, 19, '云浮市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (310, 20, '南宁市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (311, 20, '柳州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (312, 20, '桂林市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (313, 20, '梧州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (314, 20, '北海市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (315, 20, '防城港市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (316, 20, '钦州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (317, 20, '贵港市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (318, 20, '玉林市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (319, 20, '百色市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (320, 20, '贺州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (321, 20, '河池市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (322, 20, '来宾市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (323, 20, '崇左市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (324, 21, '海口市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (325, 21, '三亚市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (326, 21, '五指山市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (327, 21, '琼海市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (328, 21, '儋州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (329, 21, '文昌市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (330, 21, '万宁市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (331, 21, '东方市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (332, 21, '定安县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (333, 21, '屯昌县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (334, 21, '澄迈县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (335, 21, '临高县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (336, 21, '白沙黎族自治县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (337, 21, '昌江黎族自治县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (338, 21, '乐东黎族自治县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (339, 21, '陵水黎族自治县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (340, 21, '保亭黎族苗族自治县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (341, 21, '琼中黎族苗族自治县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (342, 21, '西沙群岛', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (343, 21, '南沙群岛', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (344, 21, '中沙群岛的岛礁及其海域', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (345, 22, '万州区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (346, 22, '涪陵区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (347, 22, '渝中区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (348, 22, '大渡口区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (349, 22, '江北区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (350, 22, '沙坪坝区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (351, 22, '九龙坡区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (352, 22, '南岸区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (353, 22, '北碚区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (354, 22, '双桥区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (355, 22, '万盛区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (356, 22, '渝北区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (357, 22, '巴南区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (358, 22, '黔江区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (359, 22, '长寿区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (360, 22, '綦江县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (361, 22, '潼南县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (362, 22, '铜梁县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (363, 22, '大足县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (364, 22, '荣昌县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (365, 22, '璧山县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (366, 22, '梁平县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (367, 22, '城口县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (368, 22, '丰都县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (369, 22, '垫江县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (370, 22, '武隆县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (371, 22, '忠县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (372, 22, '开县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (373, 22, '云阳县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (374, 22, '奉节县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (375, 22, '巫山县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (376, 22, '巫溪县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (377, 22, '石柱土家族自治县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (378, 22, '秀山土家族苗族自治县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (379, 22, '酉阳土家族苗族自治县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (380, 22, '彭水苗族土家族自治县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (381, 22, '江津市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (382, 22, '合川市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (383, 22, '永川市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (384, 22, '南川市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (385, 23, '成都市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (386, 23, '自贡市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (387, 23, '攀枝花市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (388, 23, '泸州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (389, 23, '德阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (390, 23, '绵阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (391, 23, '广元市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (392, 23, '遂宁市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (393, 23, '内江市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (394, 23, '乐山市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (395, 23, '南充市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (396, 23, '眉山市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (397, 23, '宜宾市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (398, 23, '广安市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (399, 23, '达州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (400, 23, '雅安市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (401, 23, '巴中市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (402, 23, '资阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (403, 23, '阿坝藏族羌族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (404, 23, '甘孜藏族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (405, 23, '凉山彝族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (406, 24, '贵阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (407, 24, '六盘水市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (408, 24, '遵义市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (409, 24, '安顺市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (410, 24, '铜仁地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (411, 24, '黔西南布依族苗族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (412, 24, '毕节地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (413, 24, '黔东南苗族侗族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (414, 24, '黔南布依族苗族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (415, 25, '昆明市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (416, 25, '曲靖市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (417, 25, '玉溪市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (418, 25, '保山市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (419, 25, '昭通市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (420, 25, '丽江市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (421, 25, '思茅市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (422, 25, '临沧市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (423, 25, '楚雄彝族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (424, 25, '红河哈尼族彝族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (425, 25, '文山壮族苗族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (426, 25, '西双版纳傣族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (427, 25, '大理白族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (428, 25, '德宏傣族景颇族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (429, 25, '怒江傈僳族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (430, 25, '迪庆藏族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (431, 26, '拉萨市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (432, 26, '昌都地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (433, 26, '山南地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (434, 26, '日喀则地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (435, 26, '那曲地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (436, 26, '阿里地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (437, 26, '林芝地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (438, 27, '西安市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (439, 27, '铜川市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (440, 27, '宝鸡市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (441, 27, '咸阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (442, 27, '渭南市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (443, 27, '延安市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (444, 27, '汉中市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (445, 27, '榆林市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (446, 27, '安康市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (447, 27, '商洛市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (448, 28, '兰州市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (449, 28, '嘉峪关市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (450, 28, '金昌市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (451, 28, '白银市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (452, 28, '天水市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (453, 28, '武威市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (454, 28, '张掖市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (455, 28, '平凉市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (456, 28, '酒泉市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (457, 28, '庆阳市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (458, 28, '定西市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (459, 28, '陇南市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (460, 28, '临夏回族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (461, 28, '甘南藏族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (462, 29, '西宁市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (463, 29, '海东地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (464, 29, '海北藏族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (465, 29, '黄南藏族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (466, 29, '海南藏族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (467, 29, '果洛藏族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (468, 29, '玉树藏族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (469, 29, '海西蒙古族藏族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (470, 30, '银川市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (471, 30, '石嘴山市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (472, 30, '吴忠市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (473, 30, '固原市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (474, 30, '中卫市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (475, 31, '乌鲁木齐市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (476, 31, '克拉玛依市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (477, 31, '吐鲁番地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (478, 31, '哈密地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (479, 31, '昌吉回族自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (480, 31, '博尔塔拉蒙古自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (481, 31, '巴音郭楞蒙古自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (482, 31, '阿克苏地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (483, 31, '克孜勒苏柯尔克孜自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (484, 31, '喀什地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (485, 31, '和田地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (486, 31, '伊犁哈萨克自治州', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (487, 31, '塔城地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (488, 31, '阿勒泰地区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (489, 31, '石河子市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (490, 31, '阿拉尔市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (491, 31, '图木舒克市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (492, 31, '五家渠市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (493, 32, '台北市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (494, 32, '高雄市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (495, 32, '基隆市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (496, 32, '台中市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (497, 32, '台南市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (498, 32, '新竹市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (499, 32, '嘉义市', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (500, 32, '台北县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (501, 32, '宜兰县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (502, 32, '桃园县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (503, 32, '新竹县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (504, 32, '苗栗县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (505, 32, '台中县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (506, 32, '彰化县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (507, 32, '南投县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (508, 32, '云林县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (509, 32, '嘉义县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (510, 32, '台南县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (511, 32, '高雄县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (512, 32, '屏东县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (513, 32, '澎湖县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (514, 32, '台东县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (515, 32, '花莲县', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (516, 33, '中西区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (517, 33, '东区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (518, 33, '九龙城区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (519, 33, '观塘区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (520, 33, '南区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (521, 33, '深水埗区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (522, 33, '黄大仙区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (523, 33, '湾仔区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (524, 33, '油尖旺区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (525, 33, '离岛区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (526, 33, '葵青区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (527, 33, '北区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (528, 33, '西贡区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (529, 33, '沙田区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (530, 33, '屯门区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (531, 33, '大埔区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (532, 33, '荃湾区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (533, 33, '元朗区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (534, 34, '澳门特别行政区', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (535, 35, '美国', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (536, 35, '加拿大', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (537, 35, '澳大利亚', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (538, 35, '新西兰', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (539, 35, '英国', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (540, 35, '法国', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (541, 35, '德国', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (542, 35, '捷克', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (543, 35, '荷兰', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (544, 35, '瑞士', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (545, 35, '希腊', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (546, 35, '挪威', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (547, 35, '瑞典', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (548, 35, '丹麦', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (549, 35, '芬兰', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (550, 35, '爱尔兰', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (551, 35, '奥地利', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (552, 35, '意大利', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (553, 35, '乌克兰', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (554, 35, '俄罗斯', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (555, 35, '西班牙', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (556, 35, '韩国', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (557, 35, '新加坡', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (558, 35, '马来西亚', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (559, 35, '印度', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (560, 35, '泰国', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (561, 35, '日本', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (562, 35, '巴西', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (563, 35, '阿根廷', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (564, 35, '南非', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (565, 35, '埃及', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (566, 36, '其它', 2, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (567, 37, '东华门街道', 3, '', 0, 1, 0, 1634809286);
INSERT INTO `region` VALUES (568, 37, '东四街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (569, 37, '东直门街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (570, 37, '交道口街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (571, 37, '北新桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (572, 37, '和平里街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (573, 37, '安定门街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (574, 37, '建国门街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (575, 37, '景山街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (576, 37, '朝阳门街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (577, 38, '什刹海街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (578, 38, '展览路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (579, 38, '德胜街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (580, 38, '新街口街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (581, 38, '月坛街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (582, 38, '西长安街街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (583, 38, '金融街街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (584, 39, '东花市街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (585, 39, '体育馆路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (586, 39, '前门街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (587, 39, '天坛街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (588, 39, '崇文门外街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (589, 39, '永定门外街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (590, 39, '龙潭街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (591, 40, '大栅栏街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (592, 40, '天桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (593, 40, '广安门内街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (594, 40, '广安门外街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (595, 40, '椿树街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (596, 40, '牛街街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (597, 40, '白纸坊街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (598, 40, '陶然亭街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (599, 41, '三里屯街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (600, 41, '三间房地区（三间房乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (601, 41, '东坝地区（东坝乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (602, 41, '东风地区（东风乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (603, 41, '亚运村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (604, 41, '八里庄街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (605, 41, '六里屯街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (606, 41, '劲松街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (607, 41, '十八里店地区（十八里店乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (608, 41, '南磨房地区（南磨房乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (609, 41, '双井街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (610, 41, '呼家楼街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (611, 41, '和平街街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (612, 41, '团结湖街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (613, 41, '垡头街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (614, 41, '大屯街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (615, 41, '太阳宫地区（太阳宫乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (616, 41, '奥运村地区（奥运村乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (617, 41, '孙河地区（孙河乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (618, 41, '安贞街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (619, 41, '将台地区（将台乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (620, 41, '小关街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (621, 41, '小红门地区（小红门乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (622, 41, '崔各庄地区（崔各庄乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (623, 41, '左家庄街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (624, 41, '常营回族地区（常营回族乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (625, 41, '平房地区（平房乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (626, 41, '建国门外街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (627, 41, '望京开发街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (628, 41, '望京街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (629, 41, '朝阳门外街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (630, 41, '来广营地区（来广营乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (631, 41, '潘家园街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (632, 41, '王四营地区（王四营乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (633, 41, '管庄地区（管庄乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (634, 41, '豆各庄地区（豆各庄乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (635, 41, '酒仙桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (636, 41, '金盏地区（金盏乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (637, 41, '首都机场街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (638, 41, '香河园街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (639, 41, '高碑店地区（高碑店乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (640, 41, '麦子店街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (641, 41, '黑庄户地区（黑庄户乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (642, 42, '东铁匠营街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (643, 42, '东高地街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (644, 42, '丰台街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (645, 42, '云岗街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (646, 42, '南苑乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (647, 42, '南苑街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (648, 42, '卢沟桥乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (649, 42, '卢沟桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (650, 42, '右安门街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (651, 42, '和义街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (652, 42, '大红门街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (653, 42, '太平桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (654, 42, '宛平城地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (655, 42, '新村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (656, 42, '方庄地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (657, 42, '王佐镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (658, 42, '花乡乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (659, 42, '西罗园街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (660, 42, '长辛店街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (661, 42, '长辛店镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (662, 42, '马家堡街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (663, 43, '五里坨街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (664, 43, '八宝山街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (665, 43, '八角街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (666, 43, '北辛安街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (667, 43, '古城街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (668, 43, '广宁街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (669, 43, '老山街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (670, 43, '苹果园街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (671, 43, '金顶街街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (672, 43, '鲁谷街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (673, 44, '万寿路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (674, 44, '万柳地区（海淀乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (675, 44, '上地街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (676, 44, '上庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (677, 44, '东升地区（东升乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (678, 44, '中关村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (679, 44, '八里庄街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (680, 44, '北下关街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (681, 44, '北太平庄街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (682, 44, '四季青镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (683, 44, '学院路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (684, 44, '曙光街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (685, 44, '永定路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (686, 44, '海淀街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (687, 44, '清华园街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (688, 44, '清河街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (689, 44, '温泉镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (690, 44, '燕园街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (691, 44, '甘家口街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (692, 44, '田村路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (693, 44, '紫竹院街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (694, 44, '羊坊店街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (695, 44, '花园路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (696, 44, '苏家坨镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (697, 44, '西三旗街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (698, 44, '西北旺镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (699, 44, '青龙桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (700, 44, '香山街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (701, 44, '马连洼街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (702, 45, '东辛房街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (703, 45, '军庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (704, 45, '城子街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (705, 45, '大台街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (706, 45, '大峪街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (707, 45, '妙峰山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (708, 45, '斋堂镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (709, 45, '永定镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (710, 45, '清水镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (711, 45, '潭柘寺镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (712, 45, '王平地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (713, 45, '雁翅镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (714, 45, '龙泉镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (715, 46, '东风街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (716, 46, '佛子庄乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (717, 46, '十渡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (718, 46, '南窖乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (719, 46, '史家营乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (720, 46, '向阳街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (721, 46, '周口店地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (722, 46, '城关街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (723, 46, '大安山乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (724, 46, '大石窝镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (725, 46, '张坊镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (726, 46, '拱辰街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (727, 46, '新镇街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (728, 46, '星城街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (729, 46, '河北镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (730, 46, '琉璃河地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (731, 46, '石楼镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (732, 46, '窦店镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (733, 46, '良乡地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (734, 46, '蒲洼乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (735, 46, '西潞街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (736, 46, '迎风街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (737, 46, '长沟镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (738, 46, '长阳镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (739, 46, '阎村镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (740, 46, '霞云岭乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (741, 46, '青龙湖镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (742, 46, '韩村河镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (743, 47, '中仓街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (744, 47, '于家务回族乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (745, 47, '北苑街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (746, 47, '台湖镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (747, 47, '宋庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (748, 47, '张家湾镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (749, 47, '新华街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (750, 47, '梨园地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (751, 47, '永乐店镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (752, 47, '永顺地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (753, 47, '漷县镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (754, 47, '潞城镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (755, 47, '玉桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (756, 47, '西集镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (757, 47, '马驹桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (758, 48, '仁和地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (759, 48, '光明街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (760, 48, '北务镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (761, 48, '北小营镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (762, 48, '北石槽镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (763, 48, '南彩镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (764, 48, '南法信地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (765, 48, '后沙峪地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (766, 48, '大孙各庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (767, 48, '天竺地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (768, 48, '张镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (769, 48, '木林镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (770, 48, '李桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (771, 48, '李遂镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (772, 48, '杨镇地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (773, 48, '牛栏山地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (774, 48, '石园街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (775, 48, '胜利街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (776, 48, '赵全营镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (777, 48, '马坡地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (778, 48, '高丽营镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (779, 48, '龙湾屯镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (780, 49, '东小口地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (781, 49, '兴寿镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (782, 49, '北七家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (783, 49, '十三陵镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (784, 49, '南口地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (785, 49, '南邵镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (786, 49, '回龙观地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (787, 49, '城北街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (788, 49, '城南街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (789, 49, '小汤山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (790, 49, '崔村镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (791, 49, '沙河地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (792, 49, '流村镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (793, 49, '百善镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (794, 49, '长陵镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (795, 49, '阳坊镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (796, 49, '马池口地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (797, 50, '亦庄地区（亦庄镇）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (798, 50, '兴丰街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (799, 50, '北臧村镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (800, 50, '安定镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (801, 50, '庞各庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (802, 50, '旧宫地区（旧宫镇）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (803, 50, '林校路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (804, 50, '榆垡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (805, 50, '清源街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (806, 50, '瀛海镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (807, 50, '礼贤镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (808, 50, '西红门地区（西红门镇）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (809, 50, '采育镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (810, 50, '长子营镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (811, 50, '青云店镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (812, 50, '魏善庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (813, 50, '黄村地区（黄村镇）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (814, 51, '九渡河镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (815, 51, '北房镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (816, 51, '喇叭沟门满族乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (817, 51, '宝山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (818, 51, '庙城地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (819, 51, '怀北镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (820, 51, '怀柔地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (821, 51, '杨宋镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (822, 51, '桥梓镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (823, 51, '汤河口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (824, 51, '泉河街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (825, 51, '渤海镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (826, 51, '琉璃庙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (827, 51, '长哨营满族乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (828, 51, '雁栖地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (829, 51, '龙山街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (830, 52, '东高村镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (831, 52, '兴谷街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (832, 52, '刘家店镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (833, 52, '南独乐河镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (834, 52, '夏各庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (835, 52, '大兴庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (836, 52, '大华山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (837, 52, '山东庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (838, 52, '峪口地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (839, 52, '渔阳地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (840, 52, '滨河街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (841, 52, '熊儿寨乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (842, 52, '王辛庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (843, 52, '金海湖地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (844, 52, '镇罗营镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (845, 52, '马坊地区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (846, 52, '马昌营镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (847, 52, '黄松峪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (848, 53, '不老屯镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (849, 53, '东邵渠镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (850, 53, '冯家峪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (851, 53, '北庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (852, 53, '十里堡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (853, 53, '古北口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (854, 53, '大城子镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (855, 53, '太师屯镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (856, 53, '密云镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (857, 53, '巨各庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (858, 53, '新城子镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (859, 53, '果园街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (860, 53, '檀营地区（檀营满族蒙古族乡）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (861, 53, '河南寨镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (862, 53, '溪翁庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (863, 53, '石城镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (864, 53, '穆家峪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (865, 53, '西田各庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (866, 53, '高岭镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (867, 53, '鼓楼街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (868, 54, '井庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (869, 54, '八达岭镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (870, 54, '刘斌堡乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (871, 54, '千家店镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (872, 54, '四海镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (873, 54, '大庄科乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (874, 54, '大榆树镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (875, 54, '康庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (876, 54, '延庆镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (877, 54, '张山营镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (878, 54, '旧县镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (879, 54, '永宁镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (880, 54, '沈家营镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (881, 54, '珍珠泉乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (882, 54, '香营乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (883, 55, '体育馆街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (884, 55, '劝业场街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (885, 55, '南市街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (886, 55, '南营门街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (887, 55, '小白楼街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (888, 55, '新兴街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (889, 56, '上杭路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (890, 56, '东新街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (891, 56, '中山门街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (892, 56, '二号桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (893, 56, '向阳楼街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (894, 56, '唐家口街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (895, 56, '大王庄街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (896, 56, '大直沽街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (897, 56, '天津铁厂街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (898, 56, '富民路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (899, 56, '常州道街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (900, 56, '春华街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (901, 56, '鲁山道街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (902, 57, '下瓦房街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (903, 57, '东海街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (904, 57, '友谊路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (905, 57, '大营门街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (906, 57, '天塔街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (907, 57, '尖山街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (908, 57, '挂甲寺街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (909, 57, '柳林街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (910, 57, '桃园街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (911, 57, '梅江街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (912, 57, '越秀路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (913, 57, '陈塘庄街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (914, 57, '马场街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (915, 58, '万兴街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (916, 58, '体育中心街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (917, 58, '八里台街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (918, 58, '兴南街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (919, 58, '华苑街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (920, 58, '向阳路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (921, 58, '嘉陵道街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (922, 58, '学府街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (923, 58, '广开街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (924, 58, '王顶堤街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (925, 58, '长虹街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (926, 58, '鼓楼街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (927, 59, '光复道街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (928, 59, '宁园街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (929, 59, '建昌道街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (930, 59, '新开河街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (931, 59, '月牙河街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (932, 59, '望海楼街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (933, 59, '江都路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (934, 59, '王串场街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (935, 59, '铁东路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (936, 59, '鸿顺里街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (937, 60, '丁字沽街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (938, 60, '三条石街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (939, 60, '双环村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (940, 60, '咸阳北路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (941, 60, '大胡同街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (942, 60, '芥园道街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (943, 60, '西于庄街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (944, 60, '西沽街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (945, 60, '邵公庄街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (946, 60, '铃铛阁街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (947, 61, '三槐路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (948, 61, '北塘街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (949, 61, '向阳街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (950, 61, '大沽街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (951, 61, '新城镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (952, 61, '新村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (953, 61, '新河街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (954, 61, '新港街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (955, 61, '杭州道街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (956, 61, '渤海石油街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (957, 61, '胡家园街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (958, 61, '解放路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (959, 62, '大田镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (960, 62, '天化街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (961, 62, '寨上街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (962, 62, '杨家泊镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (963, 62, '汉沽街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (964, 62, '河西街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (965, 62, '盐场街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (966, 62, '茶淀镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (967, 62, '营城镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (968, 63, '中塘镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (969, 63, '古林街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (970, 63, '太平镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (971, 63, '小王庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (972, 63, '海滨街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (973, 63, '港西街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (974, 63, '胜利街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (975, 63, '迎宾街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (976, 64, '万新街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (977, 64, '丰年村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (978, 64, '么六桥乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (979, 64, '军粮城镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (980, 64, '华明镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (981, 64, '大毕庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (982, 64, '张贵庄街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (983, 64, '新立街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (984, 64, '无瑕街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (985, 65, '中北镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (986, 65, '南河镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (987, 65, '大寺镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (988, 65, '张家窝镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (989, 65, '李七庄街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (990, 65, '杨柳青镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (991, 65, '王稳庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (992, 65, '西营门街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (993, 65, '辛口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (994, 66, '八里台镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (995, 66, '北闸口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (996, 66, '双桥河镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (997, 66, '双港镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (998, 66, '咸水沽镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (999, 66, '小站镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1000, 66, '葛沽镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1001, 66, '辛庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1002, 66, '长青办事处', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1003, 67, '北仓镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1004, 67, '双口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1005, 67, '双街镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1006, 67, '大张庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1007, 67, '天穆镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1008, 67, '宜兴埠镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1009, 67, '小淀镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1010, 67, '普东街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1011, 67, '果园新村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1012, 67, '西堤头镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1013, 67, '集贤里街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1014, 67, '青光镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1015, 68, '上马台镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1016, 68, '下伍旗镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1017, 68, '下朱庄街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1018, 68, '东蒲洼街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1019, 68, '东马圈镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1020, 68, '南蔡村镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1021, 68, '城关镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1022, 68, '大孟庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1023, 68, '大王古庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1024, 68, '大碱厂镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1025, 68, '大良镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1026, 68, '大黄堡乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1027, 68, '崔黄口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1028, 68, '徐官屯街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1029, 68, '曹子里乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1030, 68, '杨村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1031, 68, '梅厂镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1032, 68, '汊沽港镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1033, 68, '河北屯镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1034, 68, '河西务镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1035, 68, '泗村店镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1036, 68, '王庆坨镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1037, 68, '白古屯乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1038, 68, '石各庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1039, 68, '豆张庄乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1040, 68, '运河西街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1041, 68, '陈咀镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1042, 68, '高村乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1043, 68, '黄庄街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1044, 68, '黄花店镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1045, 69, '八门城镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1046, 69, '口东镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1047, 69, '史各庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1048, 69, '周良庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1049, 69, '城关镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1050, 69, '大口屯镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1051, 69, '大唐庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1052, 69, '大白庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1053, 69, '大钟庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1054, 69, '尔王庄乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1055, 69, '新安镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1056, 69, '新开口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1057, 69, '方家庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1058, 69, '林亭口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1059, 69, '牛家牌乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1060, 69, '牛道口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1061, 69, '王卜庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1062, 69, '郝各庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1063, 69, '霍各庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1064, 69, '马家店镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1065, 69, '高家庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1066, 69, '黄庄乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1067, 70, '七里海镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1068, 70, '东棘坨镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1069, 70, '丰台镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1070, 70, '俵口乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1071, 70, '北淮淀乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1072, 70, '大北涧沽镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1073, 70, '宁河镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1074, 70, '岳龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1075, 70, '廉庄子乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1076, 70, '板桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1077, 70, '潘庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1078, 70, '芦台镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1079, 70, '苗庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1080, 70, '造甲城镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1081, 71, '中旺镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1082, 71, '双塘镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1083, 71, '台头镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1084, 71, '唐官屯镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1085, 71, '团泊镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1086, 71, '大丰堆镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1087, 71, '大邱庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1088, 71, '子牙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1089, 71, '杨成庄乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1090, 71, '梁头镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1091, 71, '沿庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1092, 71, '独流镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1093, 71, '王口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1094, 71, '良王庄乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1095, 71, '蔡公庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1096, 71, '西翟庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1097, 71, '陈官屯镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1098, 71, '静海镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1099, 72, '上仓镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1100, 72, '下仓镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1101, 72, '下窝头镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1102, 72, '下营镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1103, 72, '东二营乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1104, 72, '东施古镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1105, 72, '东赵各庄乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1106, 72, '五百户镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1107, 72, '侯家营镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1108, 72, '出头岭镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1109, 72, '别山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1110, 72, '城关镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1111, 72, '孙各庄满族乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1112, 72, '官庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1113, 72, '尤古庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1114, 72, '文昌街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1115, 72, '杨津庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1116, 72, '桑梓镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1117, 72, '洇溜镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1118, 72, '白涧镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1119, 72, '礼明庄乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1120, 72, '穿芳峪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1121, 72, '罗庄子镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1122, 72, '西龙虎峪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1123, 72, '许家台乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1124, 72, '邦均镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1125, 72, '马伸桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1126, 73, '井陉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1127, 73, '井陉矿区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1128, 73, '元氏县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1129, 73, '平山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1130, 73, '新乐市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1131, 73, '新华区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1132, 73, '无极县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1133, 73, '晋州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1134, 73, '栾城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1135, 73, '桥东区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1136, 73, '桥西区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1137, 73, '正定县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1138, 73, '深泽县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1139, 73, '灵寿县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1140, 73, '藁城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1141, 73, '行唐县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1142, 73, '裕华区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1143, 73, '赞皇县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1144, 73, '赵县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1145, 73, '辛集市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1146, 73, '长安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1147, 73, '高邑县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1148, 73, '鹿泉市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1149, 74, '丰南区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1150, 74, '丰润区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1151, 74, '乐亭县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1152, 74, '古冶区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1153, 74, '唐海县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1154, 74, '开平区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1155, 74, '滦南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1156, 74, '滦县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1157, 74, '玉田县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1158, 74, '路北区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1159, 74, '路南区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1160, 74, '迁安市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1161, 74, '迁西县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1162, 74, '遵化市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1163, 75, '北戴河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1164, 75, '卢龙县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1165, 75, '山海关区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1166, 75, '抚宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1167, 75, '昌黎县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1168, 75, '海港区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1169, 75, '青龙满族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1170, 76, '丛台区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1171, 76, '临漳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1172, 76, '复兴区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1173, 76, '大名县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1174, 76, '峰峰矿区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1175, 76, '广平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1176, 76, '成安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1177, 76, '曲周县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1178, 76, '武安市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1179, 76, '永年县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1180, 76, '涉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1181, 76, '磁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1182, 76, '肥乡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1183, 76, '邯山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1184, 76, '邯郸县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1185, 76, '邱县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1186, 76, '馆陶县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1187, 76, '魏县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1188, 76, '鸡泽县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1189, 77, '临城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1190, 77, '临西县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1191, 77, '任县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1192, 77, '内丘县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1193, 77, '南和县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1194, 77, '南宫市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1195, 77, '威县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1196, 77, '宁晋县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1197, 77, '巨鹿县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1198, 77, '平乡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1199, 77, '广宗县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1200, 77, '新河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1201, 77, '柏乡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1202, 77, '桥东区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1203, 77, '桥西区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1204, 77, '沙河市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1205, 77, '清河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1206, 77, '邢台县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1207, 77, '隆尧县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1208, 78, '北市区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1209, 78, '南市区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1210, 78, '博野县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1211, 78, '唐县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1212, 78, '安国市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1213, 78, '安新县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1214, 78, '定兴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1215, 78, '定州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1216, 78, '容城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1217, 78, '徐水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1218, 78, '新市区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1219, 78, '易县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1220, 78, '曲阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1221, 78, '望都县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1222, 78, '涞水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1223, 78, '涞源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1224, 78, '涿州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1225, 78, '清苑县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1226, 78, '满城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1227, 78, '蠡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1228, 78, '阜平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1229, 78, '雄县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1230, 78, '顺平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1231, 78, '高碑店市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1232, 78, '高阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1233, 79, '万全县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1234, 79, '下花园区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1235, 79, '宣化区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1236, 79, '宣化县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1237, 79, '尚义县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1238, 79, '崇礼县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1239, 79, '康保县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1240, 79, '张北县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1241, 79, '怀安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1242, 79, '怀来县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1243, 79, '桥东区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1244, 79, '桥西区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1245, 79, '沽源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1246, 79, '涿鹿县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1247, 79, '蔚县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1248, 79, '赤城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1249, 79, '阳原县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1250, 80, '丰宁满族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1251, 80, '兴隆县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1252, 80, '双桥区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1253, 80, '双滦区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1254, 80, '围场满族蒙古族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1255, 80, '宽城满族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1256, 80, '平泉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1257, 80, '承德县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1258, 80, '滦平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1259, 80, '隆化县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1260, 80, '鹰手营子矿区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1261, 81, '冀州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1262, 81, '安平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1263, 81, '故城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1264, 81, '景县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1265, 81, '枣强县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1266, 81, '桃城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1267, 81, '武强县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1268, 81, '武邑县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1269, 81, '深州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1270, 81, '阜城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1271, 81, '饶阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1272, 82, '三河市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1273, 82, '固安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1274, 82, '大厂回族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1275, 82, '大城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1276, 82, '安次区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1277, 82, '广阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1278, 82, '文安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1279, 82, '永清县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1280, 82, '霸州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1281, 82, '香河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1282, 83, '东光县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1283, 83, '任丘市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1284, 83, '南皮县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1285, 83, '吴桥县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1286, 83, '孟村回族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1287, 83, '新华区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1288, 83, '沧县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1289, 83, '河间市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1290, 83, '泊头市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1291, 83, '海兴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1292, 83, '献县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1293, 83, '盐山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1294, 83, '肃宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1295, 83, '运河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1296, 83, '青县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1297, 83, '黄骅市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1298, 84, '万柏林区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1299, 84, '古交市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1300, 84, '娄烦县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1301, 84, '小店区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1302, 84, '尖草坪区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1303, 84, '晋源区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1304, 84, '杏花岭区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1305, 84, '清徐县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1306, 84, '迎泽区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1307, 84, '阳曲县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1308, 85, '南郊区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1309, 85, '城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1310, 85, '大同县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1311, 85, '天镇县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1312, 85, '左云县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1313, 85, '广灵县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1314, 85, '新荣区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1315, 85, '浑源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1316, 85, '灵丘县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1317, 85, '矿区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1318, 85, '阳高县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1319, 86, '城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1320, 86, '平定县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1321, 86, '盂县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1322, 86, '矿区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1323, 86, '郊区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1324, 87, '城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1325, 87, '壶关县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1326, 87, '屯留县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1327, 87, '平顺县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1328, 87, '武乡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1329, 87, '沁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1330, 87, '沁源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1331, 87, '潞城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1332, 87, '襄垣县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1333, 87, '郊区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1334, 87, '长子县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1335, 87, '长治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1336, 87, '黎城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1337, 88, '城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1338, 88, '沁水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1339, 88, '泽州县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1340, 88, '阳城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1341, 88, '陵川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1342, 88, '高平市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1343, 89, '右玉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1344, 89, '山阴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1345, 89, '平鲁区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1346, 89, '应县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1347, 89, '怀仁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1348, 89, '朔城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1349, 90, '介休市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1350, 90, '和顺县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1351, 90, '太谷县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1352, 90, '寿阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1353, 90, '左权县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1354, 90, '平遥县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1355, 90, '昔阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1356, 90, '榆次区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1357, 90, '榆社县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1358, 90, '灵石县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1359, 90, '祁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1360, 91, '万荣县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1361, 91, '临猗县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1362, 91, '垣曲县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1363, 91, '夏县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1364, 91, '平陆县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1365, 91, '新绛县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1366, 91, '永济市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1367, 91, '河津市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1368, 91, '盐湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1369, 91, '稷山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1370, 91, '绛县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1371, 91, '芮城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1372, 91, '闻喜县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1373, 92, '五台县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1374, 92, '五寨县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1375, 92, '代县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1376, 92, '保德县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1377, 92, '偏关县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1378, 92, '原平市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1379, 92, '宁武县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1380, 92, '定襄县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1381, 92, '岢岚县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1382, 92, '忻府区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1383, 92, '河曲县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1384, 92, '神池县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1385, 92, '繁峙县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1386, 92, '静乐县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1387, 93, '乡宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1388, 93, '侯马市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1389, 93, '古县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1390, 93, '吉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1391, 93, '大宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1392, 93, '安泽县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1393, 93, '尧都区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1394, 93, '曲沃县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1395, 93, '永和县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1396, 93, '汾西县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1397, 93, '洪洞县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1398, 93, '浮山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1399, 93, '翼城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1400, 93, '蒲县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1401, 93, '襄汾县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1402, 93, '隰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1403, 93, '霍州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1404, 94, '中阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1405, 94, '临县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1406, 94, '交口县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1407, 94, '交城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1408, 94, '兴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1409, 94, '孝义市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1410, 94, '岚县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1411, 94, '文水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1412, 94, '方山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1413, 94, '柳林县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1414, 94, '汾阳市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1415, 94, '石楼县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1416, 94, '离石区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1417, 95, '和林格尔县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1418, 95, '回民区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1419, 95, '土默特左旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1420, 95, '托克托县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1421, 95, '新城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1422, 95, '武川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1423, 95, '清水河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1424, 95, '玉泉区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1425, 95, '赛罕区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1426, 96, '东河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1427, 96, '九原区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1428, 96, '固阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1429, 96, '土默特右旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1430, 96, '昆都仑区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1431, 96, '白云矿区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1432, 96, '石拐区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1433, 96, '达尔罕茂明安联合旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1434, 96, '青山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1435, 97, '乌达区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1436, 97, '海勃湾区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1437, 97, '海南区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1438, 98, '元宝山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1439, 98, '克什克腾旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1440, 98, '喀喇沁旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1441, 98, '宁城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1442, 98, '巴林右旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1443, 98, '巴林左旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1444, 98, '敖汉旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1445, 98, '松山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1446, 98, '林西县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1447, 98, '红山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1448, 98, '翁牛特旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1449, 98, '阿鲁科尔沁旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1450, 99, '奈曼旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1451, 99, '库伦旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1452, 99, '开鲁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1453, 99, '扎鲁特旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1454, 99, '科尔沁区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1455, 99, '科尔沁左翼中旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1456, 99, '科尔沁左翼后旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1457, 99, '霍林郭勒市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1458, 100, '东胜区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1459, 100, '乌审旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1460, 100, '伊金霍洛旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1461, 100, '准格尔旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1462, 100, '杭锦旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1463, 100, '达拉特旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1464, 100, '鄂东胜区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1465, 100, '鄂托克前旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1466, 100, '鄂托克旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1467, 101, '扎兰屯市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1468, 101, '新巴尔虎右旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1469, 101, '新巴尔虎左旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1470, 101, '根河市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1471, 101, '海拉尔区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1472, 101, '满洲里市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1473, 101, '牙克石市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1474, 101, '莫力达瓦达斡尔族自治旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1475, 101, '鄂伦春自治旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1476, 101, '鄂温克族自治旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1477, 101, '阿荣旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1478, 101, '陈巴尔虎旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1479, 101, '额尔古纳市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1480, 102, '临河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1481, 102, '乌拉特中旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1482, 102, '乌拉特前旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1483, 102, '乌拉特后旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1484, 102, '五原县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1485, 102, '杭锦后旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1486, 102, '磴口县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1487, 103, '丰镇市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1488, 103, '兴和县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1489, 103, '凉城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1490, 103, '化德县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1491, 103, '卓资县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1492, 103, '商都县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1493, 103, '四子王旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1494, 103, '察哈尔右翼中旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1495, 103, '察哈尔右翼前旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1496, 103, '察哈尔右翼后旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1497, 103, '集宁区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1498, 104, '乌兰浩特市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1499, 104, '扎赉特旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1500, 104, '科尔沁右翼中旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1501, 104, '科尔沁右翼前旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1502, 104, '突泉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1503, 104, '阿尔山市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1504, 105, '东乌珠穆沁旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1505, 105, '二连浩特市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1506, 105, '多伦县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1507, 105, '太仆寺旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1508, 105, '正蓝旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1509, 105, '正镶白旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1510, 105, '苏尼特右旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1511, 105, '苏尼特左旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1512, 105, '西乌珠穆沁旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1513, 105, '锡林浩特市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1514, 105, '镶黄旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1515, 105, '阿巴嘎旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1516, 106, '阿拉善右旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1517, 106, '阿拉善左旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1518, 106, '额济纳旗', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1519, 107, '东陵区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1520, 107, '于洪区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1521, 107, '和平区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1522, 107, '大东区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1523, 107, '康平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1524, 107, '新民市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1525, 107, '沈北新区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1526, 107, '沈河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1527, 107, '法库县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1528, 107, '皇姑区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1529, 107, '苏家屯区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1530, 107, '辽中县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1531, 107, '铁西区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1532, 108, '中山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1533, 108, '庄河市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1534, 108, '旅顺口区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1535, 108, '普兰店市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1536, 108, '沙河口区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1537, 108, '瓦房店市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1538, 108, '甘井子区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1539, 108, '西岗区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1540, 108, '金州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1541, 108, '长海县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1542, 109, '千山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1543, 109, '台安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1544, 109, '岫岩满族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1545, 109, '海城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1546, 109, '立山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1547, 109, '铁东区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1548, 109, '铁西区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1549, 110, '东洲区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1550, 110, '抚顺县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1551, 110, '新宾满族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1552, 110, '新抚区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1553, 110, '望花区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1554, 110, '清原满族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1555, 110, '顺城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1556, 111, '南芬区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1557, 111, '平山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1558, 111, '明山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1559, 111, '本溪满族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1560, 111, '桓仁满族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1561, 111, '溪湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1562, 112, '东港市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1563, 112, '元宝区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1564, 112, '凤城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1565, 112, '宽甸满族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1566, 112, '振兴区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1567, 112, '振安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1568, 113, '义县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1569, 113, '凌河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1570, 113, '凌海市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1571, 113, '北镇市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1572, 113, '古塔区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1573, 113, '太和区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1574, 113, '黑山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1575, 114, '大石桥市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1576, 114, '盖州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1577, 114, '站前区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1578, 114, '老边区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1579, 114, '西市区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1580, 114, '鲅鱼圈区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1581, 115, '太平区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1582, 115, '彰武县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1583, 115, '新邱区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1584, 115, '海州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1585, 115, '清河门区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1586, 115, '细河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1587, 115, '蒙古族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1588, 116, '太子河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1589, 116, '宏伟区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1590, 116, '弓长岭区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1591, 116, '文圣区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1592, 116, '灯塔市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1593, 116, '白塔区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1594, 116, '辽阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1595, 117, '兴隆台区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1596, 117, '双台子区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1597, 117, '大洼县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1598, 117, '盘山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1599, 118, '开原市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1600, 118, '昌图县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1601, 118, '清河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1602, 118, '西丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1603, 118, '调兵山市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1604, 118, '铁岭县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1605, 118, '银州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1606, 119, '凌源市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1607, 119, '北票市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1608, 119, '双塔区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1609, 119, '喀喇沁左翼蒙古族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1610, 119, '建平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1611, 119, '朝阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1612, 119, '龙城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1613, 120, '兴城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1614, 120, '南票区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1615, 120, '建昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1616, 120, '绥中县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1617, 120, '连山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1618, 120, '龙港区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1619, 121, '九台市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1620, 121, '二道区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1621, 121, '农安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1622, 121, '南关区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1623, 121, '双阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1624, 121, '宽城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1625, 121, '德惠市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1626, 121, '朝阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1627, 121, '榆树市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1628, 121, '绿园区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1629, 122, '丰满区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1630, 122, '昌邑区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1631, 122, '桦甸市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1632, 122, '永吉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1633, 122, '磐石市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1634, 122, '舒兰市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1635, 122, '船营区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1636, 122, '蛟河市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1637, 122, '龙潭区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1638, 123, '伊通满族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1639, 123, '公主岭市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1640, 123, '双辽市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1641, 123, '梨树县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1642, 123, '铁东区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1643, 123, '铁西区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1644, 124, '东丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1645, 124, '东辽县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1646, 124, '西安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1647, 124, '龙山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1648, 125, '东昌区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1649, 125, '二道江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1650, 125, '柳河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1651, 125, '梅河口市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1652, 125, '辉南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1653, 125, '通化县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1654, 125, '集安市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1655, 126, '临江市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1656, 126, '八道江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1657, 126, '抚松县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1658, 126, '江源区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1659, 126, '长白朝鲜族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1660, 126, '靖宇县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1661, 127, '干安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1662, 127, '前郭尔罗斯蒙古族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1663, 127, '宁江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1664, 127, '扶余县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1665, 127, '长岭县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1666, 128, '大安市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1667, 128, '洮北区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1668, 128, '洮南市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1669, 128, '通榆县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1670, 128, '镇赉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1671, 129, '和龙市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1672, 129, '图们市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1673, 129, '安图县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1674, 129, '延吉市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1675, 129, '敦化市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1676, 129, '汪清县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1677, 129, '珲春市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1678, 129, '龙井市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1679, 130, '五常市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1680, 130, '依兰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1681, 130, '南岗区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1682, 130, '双城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1683, 130, '呼兰区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1684, 130, '哈尔滨市道里区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1685, 130, '宾县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1686, 130, '尚志市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1687, 130, '巴彦县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1688, 130, '平房区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1689, 130, '延寿县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1690, 130, '方正县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1691, 130, '木兰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1692, 130, '松北区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1693, 130, '通河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1694, 130, '道外区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1695, 130, '阿城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1696, 130, '香坊区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1697, 131, '依安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1698, 131, '克东县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1699, 131, '克山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1700, 131, '富拉尔基区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1701, 131, '富裕县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1702, 131, '建华区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1703, 131, '拜泉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1704, 131, '昂昂溪区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1705, 131, '梅里斯达斡尔族区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1706, 131, '泰来县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1707, 131, '甘南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1708, 131, '碾子山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1709, 131, '讷河市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1710, 131, '铁锋区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1711, 131, '龙江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1712, 131, '龙沙区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1713, 132, '城子河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1714, 132, '密山市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1715, 132, '恒山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1716, 132, '梨树区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1717, 132, '滴道区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1718, 132, '虎林市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1719, 132, '鸡东县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1720, 132, '鸡冠区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1721, 132, '麻山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1722, 133, '东山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1723, 133, '兴安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1724, 133, '兴山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1725, 133, '南山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1726, 133, '向阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1727, 133, '工农区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1728, 133, '绥滨县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1729, 133, '萝北县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1730, 134, '友谊县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1731, 134, '四方台区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1732, 134, '宝山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1733, 134, '宝清县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1734, 134, '尖山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1735, 134, '岭东区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1736, 134, '集贤县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1737, 134, '饶河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1738, 135, '大同区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1739, 135, '杜尔伯特蒙古族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1740, 135, '林甸县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1741, 135, '红岗区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1742, 135, '肇州县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1743, 135, '肇源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1744, 135, '胡路区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1745, 135, '萨尔图区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1746, 135, '龙凤区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1747, 136, '上甘岭区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1748, 136, '乌伊岭区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1749, 136, '乌马河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1750, 136, '五营区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1751, 136, '伊春区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1752, 136, '南岔区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1753, 136, '友好区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1754, 136, '嘉荫县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1755, 136, '带岭区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1756, 136, '新青区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1757, 136, '汤旺河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1758, 136, '红星区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1759, 136, '美溪区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1760, 136, '翠峦区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1761, 136, '西林区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1762, 136, '金山屯区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1763, 136, '铁力市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1764, 137, '东风区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1765, 137, '前进区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1766, 137, '同江市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1767, 137, '向阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1768, 137, '富锦市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1769, 137, '抚远县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1770, 137, '桦南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1771, 137, '桦川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1772, 137, '汤原县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1773, 137, '郊区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1774, 138, '勃利县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1775, 138, '新兴区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1776, 138, '桃山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1777, 138, '茄子河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1778, 139, '东宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1779, 139, '东安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1780, 139, '宁安市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1781, 139, '林口县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1782, 139, '海林市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1783, 139, '爱民区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1784, 139, '穆棱市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1785, 139, '绥芬河市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1786, 139, '西安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1787, 139, '阳明区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1788, 140, '五大连池市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1789, 140, '北安市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1790, 140, '嫩江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1791, 140, '孙吴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1792, 140, '爱辉区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1793, 140, '车逊克县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1794, 140, '逊克县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1795, 141, '兰西县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1796, 141, '安达市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1797, 141, '庆安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1798, 141, '明水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1799, 141, '望奎县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1800, 141, '海伦市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1801, 141, '绥化市北林区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1802, 141, '绥棱县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1803, 141, '肇东市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1804, 141, '青冈县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1805, 142, '呼玛县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1806, 142, '塔河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1807, 142, '大兴安岭地区加格达奇区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1808, 142, '大兴安岭地区呼中区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1809, 142, '大兴安岭地区新林区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1810, 142, '大兴安岭地区松岭区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1811, 142, '漠河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1812, 143, '半淞园路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1813, 143, '南京东路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1814, 143, '外滩街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1815, 143, '小东门街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1816, 143, '老西门街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1817, 143, '豫园街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1818, 144, '五里桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1819, 144, '打浦桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1820, 144, '淮海中路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1821, 144, '瑞金二路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1822, 145, '凌云路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1823, 145, '华泾镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1824, 145, '天平路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1825, 145, '康健新村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1826, 145, '徐家汇街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1827, 145, '斜土路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1828, 145, '枫林路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1829, 145, '湖南路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1830, 145, '漕河泾街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1831, 145, '田林街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1832, 145, '虹梅路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1833, 145, '长桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1834, 145, '龙华街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1835, 146, '仙霞新村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1836, 146, '北新泾街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1837, 146, '华阳路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1838, 146, '周家桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1839, 146, '天山路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1840, 146, '新华路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1841, 146, '新泾镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1842, 146, '江苏路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1843, 146, '程家桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1844, 146, '虹桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1845, 147, '南京西路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1846, 147, '曹家渡街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1847, 147, '江宁路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1848, 147, '石门二路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1849, 147, '静安寺街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1850, 148, '宜川路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1851, 148, '曹杨新村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1852, 148, '桃浦镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1853, 148, '甘泉路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1854, 148, '真如镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1855, 148, '石泉路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1856, 148, '长寿路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1857, 148, '长征镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1858, 148, '长风新村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1859, 149, '临汾路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1860, 149, '共和新路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1861, 149, '北站街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1862, 149, '大宁路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1863, 149, '天目西路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1864, 149, '宝山路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1865, 149, '彭浦新村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1866, 149, '彭浦镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1867, 149, '芷江西路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1868, 150, '乍浦路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1869, 150, '凉城新村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1870, 150, '嘉兴路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1871, 150, '四川北路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1872, 150, '广中路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1873, 150, '提篮桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1874, 150, '新港路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1875, 150, '曲阳路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1876, 150, '欧阳路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1877, 150, '江湾镇街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1878, 151, '五角场街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1879, 151, '五角场镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1880, 151, '四平路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1881, 151, '大桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1882, 151, '定海路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1883, 151, '平凉路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1884, 151, '延吉新村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1885, 151, '控江路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1886, 151, '新江湾城街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1887, 151, '殷行街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1888, 151, '江浦路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1889, 151, '长白新村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1890, 152, '七宝镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1891, 152, '华漕镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1892, 152, '古美街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1893, 152, '吴泾镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1894, 152, '梅陇镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1895, 152, '江川路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1896, 152, '浦江镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1897, 152, '莘庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1898, 152, '虹桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1899, 152, '颛桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1900, 152, '马桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1901, 152, '龙柏街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1902, 153, '友谊路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1903, 153, '吴淞街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1904, 153, '大场镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1905, 153, '庙行镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1906, 153, '张庙街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1907, 153, '月浦镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1908, 153, '杨行镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1909, 153, '淞南镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1910, 153, '罗店镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1911, 153, '罗泾镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1912, 153, '顾村镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1913, 153, '高境镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1914, 154, '华亭镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1915, 154, '南翔镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1916, 154, '嘉定工业区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1917, 154, '嘉定镇街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1918, 154, '外冈镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1919, 154, '安亭镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1920, 154, '徐行镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1921, 154, '新成路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1922, 154, '江桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1923, 154, '真新新村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1924, 154, '菊园新区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1925, 154, '马陆镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1926, 154, '黄渡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1927, 155, '三林镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1928, 155, '上钢新村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1929, 155, '东明路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1930, 155, '北蔡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1931, 155, '南码头路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1932, 155, '合庆镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1933, 155, '周家渡街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1934, 155, '唐镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1935, 155, '塘桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1936, 155, '川沙新镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1937, 155, '张江镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1938, 155, '曹路镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1939, 155, '沪东新村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1940, 155, '洋泾街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1941, 155, '浦兴路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1942, 155, '潍坊新村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1943, 155, '花木街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1944, 155, '金杨新村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1945, 155, '金桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1946, 155, '陆家嘴街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1947, 155, '高东镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1948, 155, '高桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1949, 155, '高行镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1950, 156, '亭林镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1951, 156, '吕巷镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1952, 156, '山阳镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1953, 156, '廊下镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1954, 156, '张堰镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1955, 156, '朱泾镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1956, 156, '枫泾镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1957, 156, '漕泾镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1958, 156, '石化街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1959, 156, '金山卫镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1960, 157, '上海松江科技园区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1961, 157, '中山街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1962, 157, '九亭镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1963, 157, '五厍农业园区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1964, 157, '佘山度假区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1965, 157, '佘山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1966, 157, '叶榭镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1967, 157, '岳阳街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1968, 157, '新桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1969, 157, '新浜镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1970, 157, '方松街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1971, 157, '松江工业区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1972, 157, '永丰街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1973, 157, '泖港镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1974, 157, '泗泾镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1975, 157, '洞泾镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1976, 157, '石湖荡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1977, 157, '车墩镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1978, 158, '华新镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1979, 158, '夏阳街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1980, 158, '徐泾镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1981, 158, '朱家角镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1982, 158, '白鹤镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1983, 158, '盈浦街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1984, 158, '练塘镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1985, 158, '赵巷镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1986, 158, '重固镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1987, 158, '金泽镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1988, 158, '香花桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1989, 159, '万祥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1990, 159, '书院镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1991, 159, '六灶镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1992, 159, '周浦镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1993, 159, '大团镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1994, 159, '宣桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1995, 159, '康桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1996, 159, '惠南镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1997, 159, '新场镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1998, 159, '泥城镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (1999, 159, '祝桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2000, 159, '老港镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2001, 159, '航头镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2002, 159, '芦潮港镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2003, 160, '南桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2004, 160, '四团镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2005, 160, '奉城镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2006, 160, '庄行镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2007, 160, '柘林镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2008, 160, '海湾镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2009, 160, '金汇镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2010, 160, '青村镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2011, 161, '三星镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2012, 161, '中兴镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2013, 161, '向化镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2014, 161, '城桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2015, 161, '堡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2016, 161, '庙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2017, 161, '建设镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2018, 161, '新村乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2019, 161, '新河镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2020, 161, '横沙乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2021, 161, '港沿镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2022, 161, '港西镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2023, 161, '竖新镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2024, 161, '绿华镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2025, 161, '长兴乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2026, 161, '陈家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2027, 162, '下关区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2028, 162, '六合区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2029, 162, '建邺区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2030, 162, '栖霞区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2031, 162, '江宁区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2032, 162, '浦口区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2033, 162, '溧水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2034, 162, '玄武区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2035, 162, '白下区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2036, 162, '秦淮区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2037, 162, '雨花台区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2038, 162, '高淳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2039, 162, '鼓楼区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2040, 163, '北塘区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2041, 163, '南长区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2042, 163, '宜兴市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2043, 163, '崇安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2044, 163, '惠山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2045, 163, '江阴市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2046, 163, '滨湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2047, 163, '锡山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2048, 164, '丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2049, 164, '九里区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2050, 164, '云龙区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2051, 164, '新沂市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2052, 164, '沛县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2053, 164, '泉山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2054, 164, '睢宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2055, 164, '贾汪区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2056, 164, '邳州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2057, 164, '铜山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2058, 164, '鼓楼区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2059, 165, '天宁区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2060, 165, '戚墅堰区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2061, 165, '新北区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2062, 165, '武进区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2063, 165, '溧阳市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2064, 165, '金坛市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2065, 165, '钟楼区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2066, 166, '吴中区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2067, 166, '吴江市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2068, 166, '太仓市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2069, 166, '常熟市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2070, 166, '平江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2071, 166, '张家港市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2072, 166, '昆山市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2073, 166, '沧浪区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2074, 166, '相城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2075, 166, '苏州工业园区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2076, 166, '虎丘区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2077, 166, '金阊区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2078, 167, '启东市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2079, 167, '如东县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2080, 167, '如皋市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2081, 167, '崇川区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2082, 167, '海安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2083, 167, '海门市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2084, 167, '港闸区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2085, 167, '通州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2086, 168, '东海县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2087, 168, '新浦区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2088, 168, '海州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2089, 168, '灌云县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2090, 168, '灌南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2091, 168, '赣榆县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2092, 168, '连云区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2093, 169, '楚州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2094, 169, '洪泽县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2095, 169, '涟水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2096, 169, '淮阴区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2097, 169, '清河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2098, 169, '清浦区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2099, 169, '盱眙县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2100, 169, '金湖县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2101, 170, '东台市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2102, 170, '亭湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2103, 170, '响水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2104, 170, '大丰市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2105, 170, '射阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2106, 170, '建湖县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2107, 170, '滨海县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2108, 170, '盐都区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2109, 170, '阜宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2110, 171, '仪征市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2111, 171, '宝应县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2112, 171, '广陵区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2113, 171, '江都市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2114, 171, '维扬区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2115, 171, '邗江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2116, 171, '高邮市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2117, 172, '丹徒区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2118, 172, '丹阳市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2119, 172, '京口区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2120, 172, '句容市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2121, 172, '扬中市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2122, 172, '润州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2123, 173, '兴化市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2124, 173, '姜堰市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2125, 173, '泰兴市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2126, 173, '海陵区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2127, 173, '靖江市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2128, 173, '高港区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2129, 174, '宿城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2130, 174, '宿豫区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2131, 174, '沭阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2132, 174, '泗洪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2133, 174, '泗阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2134, 175, '上城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2135, 175, '下城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2136, 175, '临安市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2137, 175, '余杭区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2138, 175, '富阳市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2139, 175, '建德市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2140, 175, '拱墅区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2141, 175, '桐庐县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2142, 175, '江干区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2143, 175, '淳安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2144, 175, '滨江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2145, 175, '萧山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2146, 175, '西湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2147, 176, '余姚市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2148, 176, '北仑区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2149, 176, '奉化市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2150, 176, '宁海县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2151, 176, '慈溪市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2152, 176, '江东区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2153, 176, '江北区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2154, 176, '海曙区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2155, 176, '象山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2156, 176, '鄞州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2157, 176, '镇海区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2158, 177, '乐清市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2159, 177, '平阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2160, 177, '文成县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2161, 177, '永嘉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2162, 177, '泰顺县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2163, 177, '洞头县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2164, 177, '瑞安市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2165, 177, '瓯海区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2166, 177, '苍南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2167, 177, '鹿城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2168, 177, '龙湾区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2169, 178, '南湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2170, 178, '嘉善县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2171, 178, '平湖市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2172, 178, '桐乡市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2173, 178, '海宁市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2174, 178, '海盐县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2175, 178, '秀洲区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2176, 179, '南浔区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2177, 179, '吴兴区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2178, 179, '安吉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2179, 179, '德清县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2180, 179, '长兴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2181, 180, '上虞市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2182, 180, '嵊州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2183, 180, '新昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2184, 180, '绍兴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2185, 180, '诸暨市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2186, 180, '越城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2187, 181, '定海区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2188, 181, '岱山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2189, 181, '嵊泗县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2190, 181, '普陀区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2191, 182, '常山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2192, 182, '开化县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2193, 182, '柯城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2194, 182, '江山市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2195, 182, '衢江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2196, 182, '龙游县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2197, 183, '东阳市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2198, 183, '义乌市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2199, 183, '兰溪市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2200, 183, '婺城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2201, 183, '武义县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2202, 183, '永康市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2203, 183, '浦江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2204, 183, '磐安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2205, 183, '金东区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2206, 184, '三门县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2207, 184, '临海市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2208, 184, '仙居县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2209, 184, '天台县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2210, 184, '椒江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2211, 184, '温岭市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2212, 184, '玉环县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2213, 184, '路桥区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2214, 184, '黄岩区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2215, 185, '云和县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2216, 185, '庆元县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2217, 185, '景宁畲族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2218, 185, '松阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2219, 185, '缙云县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2220, 185, '莲都区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2221, 185, '遂昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2222, 185, '青田县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2223, 185, '龙泉市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2224, 186, '包河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2225, 186, '庐阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2226, 186, '瑶海区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2227, 186, '肥东县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2228, 186, '肥西县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2229, 186, '蜀山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2230, 186, '长丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2231, 187, '三山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2232, 187, '南陵县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2233, 187, '弋江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2234, 187, '繁昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2235, 187, '芜湖县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2236, 187, '镜湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2237, 187, '鸠江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2238, 188, '五河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2239, 188, '固镇县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2240, 188, '怀远县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2241, 188, '淮上区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2242, 188, '禹会区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2243, 188, '蚌山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2244, 188, '龙子湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2245, 189, '八公山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2246, 189, '凤台县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2247, 189, '大通区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2248, 189, '潘集区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2249, 189, '田家庵区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2250, 189, '谢家集区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2251, 190, '当涂县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2252, 190, '花山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2253, 190, '金家庄区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2254, 190, '雨山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2255, 191, '杜集区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2256, 191, '濉溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2257, 191, '烈山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2258, 191, '相山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2259, 192, '狮子山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2260, 192, '郊区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2261, 192, '铜官山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2262, 192, '铜陵县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2263, 193, '大观区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2264, 193, '太湖县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2265, 193, '宜秀区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2266, 193, '宿松县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2267, 193, '岳西县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2268, 193, '怀宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2269, 193, '望江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2270, 193, '枞阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2271, 193, '桐城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2272, 193, '潜山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2273, 193, '迎江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2274, 194, '休宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2275, 194, '屯溪区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2276, 194, '徽州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2277, 194, '歙县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2278, 194, '祁门县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2279, 194, '黄山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2280, 194, '黟县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2281, 195, '全椒县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2282, 195, '凤阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2283, 195, '南谯区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2284, 195, '天长市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2285, 195, '定远县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2286, 195, '明光市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2287, 195, '来安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2288, 195, '琅玡区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2289, 196, '临泉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2290, 196, '太和县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2291, 196, '界首市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2292, 196, '阜南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2293, 196, '颍东区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2294, 196, '颍州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2295, 196, '颍泉区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2296, 196, '颖上县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2297, 197, '埇桥区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2298, 197, '泗县辖', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2299, 197, '灵璧县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2300, 197, '砀山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2301, 197, '萧县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2302, 198, '含山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2303, 198, '和县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2304, 198, '居巢区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2305, 198, '庐江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2306, 198, '无为县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2307, 199, '寿县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2308, 199, '舒城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2309, 199, '裕安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2310, 199, '金安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2311, 199, '金寨县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2312, 199, '霍山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2313, 199, '霍邱县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2314, 200, '利辛县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2315, 200, '涡阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2316, 200, '蒙城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2317, 200, '谯城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2318, 201, '东至县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2319, 201, '石台县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2320, 201, '贵池区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2321, 201, '青阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2322, 202, '宁国市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2323, 202, '宣州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2324, 202, '广德县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2325, 202, '旌德县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2326, 202, '泾县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2327, 202, '绩溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2328, 202, '郎溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2329, 203, '仓山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2330, 203, '台江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2331, 203, '平潭县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2332, 203, '晋安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2333, 203, '永泰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2334, 203, '福清市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2335, 203, '罗源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2336, 203, '连江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2337, 203, '长乐市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2338, 203, '闽侯县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2339, 203, '闽清县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2340, 203, '马尾区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2341, 203, '鼓楼区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2342, 204, '同安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2343, 204, '思明区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2344, 204, '海沧区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2345, 204, '湖里区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2346, 204, '翔安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2347, 204, '集美区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2348, 205, '仙游县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2349, 205, '城厢区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2350, 205, '涵江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2351, 205, '秀屿区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2352, 205, '荔城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2353, 206, '三元区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2354, 206, '大田县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2355, 206, '宁化县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2356, 206, '将乐县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2357, 206, '尤溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2358, 206, '建宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2359, 206, '明溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2360, 206, '梅列区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2361, 206, '永安市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2362, 206, '沙县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2363, 206, '泰宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2364, 206, '清流县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2365, 207, '丰泽区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2366, 207, '南安市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2367, 207, '安溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2368, 207, '德化县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2369, 207, '惠安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2370, 207, '晋江市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2371, 207, '永春县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2372, 207, '泉港区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2373, 207, '洛江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2374, 207, '石狮市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2375, 207, '金门县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2376, 207, '鲤城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2377, 208, '东山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2378, 208, '云霄县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2379, 208, '华安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2380, 208, '南靖县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2381, 208, '平和县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2382, 208, '漳浦县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2383, 208, '芗城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2384, 208, '诏安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2385, 208, '长泰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2386, 208, '龙文区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2387, 208, '龙海市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2388, 209, '光泽县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2389, 209, '延平区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2390, 209, '建瓯市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2391, 209, '建阳市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2392, 209, '政和县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2393, 209, '松溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2394, 209, '武夷山市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2395, 209, '浦城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2396, 209, '邵武市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2397, 209, '顺昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2398, 210, '上杭县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2399, 210, '新罗区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2400, 210, '武平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2401, 210, '永定县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2402, 210, '漳平市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2403, 210, '连城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2404, 210, '长汀县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2405, 211, '古田县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2406, 211, '周宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2407, 211, '寿宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2408, 211, '屏南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2409, 211, '柘荣县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2410, 211, '福安市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2411, 211, '福鼎市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2412, 211, '蕉城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2413, 211, '霞浦县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2414, 212, '东湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2415, 212, '南昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2416, 212, '安义县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2417, 212, '新建县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2418, 212, '湾里区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2419, 212, '西湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2420, 212, '进贤县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2421, 212, '青云谱区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2422, 212, '青山湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2423, 213, '乐平市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2424, 213, '昌江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2425, 213, '浮梁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2426, 213, '珠山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2427, 214, '上栗县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2428, 214, '安源区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2429, 214, '湘东区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2430, 214, '芦溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2431, 214, '莲花县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2432, 215, '九江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2433, 215, '修水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2434, 215, '庐山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2435, 215, '彭泽县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2436, 215, '德安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2437, 215, '星子县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2438, 215, '武宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2439, 215, '永修县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2440, 215, '浔阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2441, 215, '湖口县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2442, 215, '瑞昌市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2443, 215, '都昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2444, 216, '分宜县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2445, 216, '渝水区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2446, 217, '余江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2447, 217, '月湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2448, 217, '贵溪市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2449, 218, '上犹县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2450, 218, '于都县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2451, 218, '会昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2452, 218, '信丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2453, 218, '全南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2454, 218, '兴国县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2455, 218, '南康市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2456, 218, '大余县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2457, 218, '宁都县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2458, 218, '安远县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2459, 218, '定南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2460, 218, '寻乌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2461, 218, '崇义县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2462, 218, '瑞金市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2463, 218, '石城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2464, 218, '章贡区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2465, 218, '赣县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2466, 218, '龙南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2467, 219, '万安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2468, 219, '井冈山市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2469, 219, '吉安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2470, 219, '吉州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2471, 219, '吉水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2472, 219, '安福县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2473, 219, '峡江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2474, 219, '新干县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2475, 219, '永丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2476, 219, '永新县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2477, 219, '泰和县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2478, 219, '遂川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2479, 219, '青原区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2480, 220, '万载县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2481, 220, '上高县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2482, 220, '丰城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2483, 220, '奉新县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2484, 220, '宜丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2485, 220, '樟树市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2486, 220, '袁州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2487, 220, '铜鼓县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2488, 220, '靖安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2489, 220, '高安市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2490, 221, '东乡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2491, 221, '临川区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2492, 221, '乐安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2493, 221, '南丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2494, 221, '南城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2495, 221, '宜黄县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2496, 221, '崇仁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2497, 221, '广昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2498, 221, '资溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2499, 221, '金溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2500, 221, '黎川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2501, 222, '万年县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2502, 222, '上饶县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2503, 222, '余干县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2504, 222, '信州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2505, 222, '婺源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2506, 222, '广丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2507, 222, '弋阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2508, 222, '德兴市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2509, 222, '横峰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2510, 222, '玉山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2511, 222, '鄱阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2512, 222, '铅山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2513, 223, '历下区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2514, 223, '历城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2515, 223, '商河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2516, 223, '天桥区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2517, 223, '市中区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2518, 223, '平阴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2519, 223, '槐荫区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2520, 223, '济阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2521, 223, '章丘市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2522, 223, '长清区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2523, 224, '即墨市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2524, 224, '四方区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2525, 224, '城阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2526, 224, '崂山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2527, 224, '市北区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2528, 224, '市南区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2529, 224, '平度市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2530, 224, '李沧区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2531, 224, '胶南市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2532, 224, '胶州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2533, 224, '莱西市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2534, 224, '黄岛区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2535, 225, '临淄区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2536, 225, '博山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2537, 225, '周村区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2538, 225, '张店区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2539, 225, '桓台县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2540, 225, '沂源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2541, 225, '淄川区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2542, 225, '高青县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2543, 226, '台儿庄区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2544, 226, '山亭区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2545, 226, '峄城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2546, 226, '市中区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2547, 226, '滕州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2548, 226, '薛城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2549, 227, '东营区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2550, 227, '利津县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2551, 227, '垦利县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2552, 227, '广饶县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2553, 227, '河口区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2554, 228, '招远市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2555, 228, '栖霞市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2556, 228, '海阳市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2557, 228, '牟平区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2558, 228, '福山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2559, 228, '芝罘区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2560, 228, '莱山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2561, 228, '莱州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2562, 228, '莱阳市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2563, 228, '蓬莱市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2564, 228, '长岛县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2565, 228, '龙口市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2566, 229, '临朐县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2567, 229, '坊子区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2568, 229, '奎文区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2569, 229, '安丘市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2570, 229, '寒亭区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2571, 229, '寿光市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2572, 229, '昌乐县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2573, 229, '昌邑市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2574, 229, '潍城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2575, 229, '诸城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2576, 229, '青州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2577, 229, '高密市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2578, 230, '任城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2579, 230, '兖州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2580, 230, '嘉祥县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2581, 230, '市中区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2582, 230, '微山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2583, 230, '曲阜市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2584, 230, '梁山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2585, 230, '汶上县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2586, 230, '泗水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2587, 230, '邹城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2588, 230, '金乡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2589, 230, '鱼台县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2590, 231, '东平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2591, 231, '宁阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2592, 231, '岱岳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2593, 231, '新泰市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2594, 231, '泰山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2595, 231, '肥城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2596, 232, '乳山市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2597, 232, '文登市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2598, 232, '环翠区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2599, 232, '荣成市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2600, 233, '东港区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2601, 233, '五莲县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2602, 233, '岚山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2603, 233, '莒县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2604, 234, '莱城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2605, 234, '钢城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2606, 235, '临沭县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2607, 235, '兰山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2608, 235, '平邑县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2609, 235, '沂南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2610, 235, '沂水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2611, 235, '河东区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2612, 235, '罗庄区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2613, 235, '苍山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2614, 235, '莒南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2615, 235, '蒙阴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2616, 235, '费县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2617, 235, '郯城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2618, 236, '临邑县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2619, 236, '乐陵市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2620, 236, '夏津县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2621, 236, '宁津县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2622, 236, '平原县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2623, 236, '庆云县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2624, 236, '德城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2625, 236, '武城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2626, 236, '禹城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2627, 236, '陵县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2628, 236, '齐河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2629, 237, '东昌府区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2630, 237, '东阿县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2631, 237, '临清市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2632, 237, '冠县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2633, 237, '茌平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2634, 237, '莘县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2635, 237, '阳谷县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2636, 237, '高唐县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2637, 238, '博兴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2638, 238, '惠民县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2639, 238, '无棣县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2640, 238, '沾化县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2641, 238, '滨城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2642, 238, '邹平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2643, 238, '阳信县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2644, 239, '东明县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2645, 239, '单县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2646, 239, '定陶县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2647, 239, '巨野县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2648, 239, '成武县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2649, 239, '曹县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2650, 239, '牡丹区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2651, 239, '郓城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2652, 239, '鄄城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2653, 240, '上街区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2654, 240, '中原区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2655, 240, '中牟县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2656, 240, '二七区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2657, 240, '巩义市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2658, 240, '惠济区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2659, 240, '新密市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2660, 240, '新郑市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2661, 240, '登封市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2662, 240, '管城回族区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2663, 240, '荥阳市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2664, 240, '金水区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2665, 241, '兰考县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2666, 241, '尉氏县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2667, 241, '开封县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2668, 241, '杞县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2669, 241, '禹王台区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2670, 241, '通许县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2671, 241, '金明区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2672, 241, '顺河回族区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2673, 241, '鼓楼区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2674, 241, '龙亭区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2675, 242, '伊川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2676, 242, '偃师市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2677, 242, '吉利区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2678, 242, '孟津县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2679, 242, '宜阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2680, 242, '嵩县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2681, 242, '新安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2682, 242, '栾川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2683, 242, '汝阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2684, 242, '洛宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2685, 242, '洛龙区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2686, 242, '涧西区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2687, 242, '瀍河回族区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2688, 242, '老城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2689, 242, '西工区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2690, 243, '卫东区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2691, 243, '叶县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2692, 243, '宝丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2693, 243, '新华区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2694, 243, '汝州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2695, 243, '湛河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2696, 243, '石龙区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2697, 243, '舞钢市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2698, 243, '郏县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2699, 243, '鲁山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2700, 244, '内黄县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2701, 244, '北关区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2702, 244, '安阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2703, 244, '文峰区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2704, 244, '林州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2705, 244, '殷都区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2706, 244, '汤阴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2707, 244, '滑县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2708, 244, '龙安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2709, 245, '山城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2710, 245, '浚县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2711, 245, '淇县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2712, 245, '淇滨区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2713, 245, '鹤山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2714, 246, '凤泉区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2715, 246, '卫滨区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2716, 246, '卫辉市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2717, 246, '原阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2718, 246, '封丘县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2719, 246, '延津县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2720, 246, '新乡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2721, 246, '牧野区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2722, 246, '红旗区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2723, 246, '获嘉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2724, 246, '辉县市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2725, 246, '长垣县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2726, 247, '中站区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2727, 247, '修武县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2728, 247, '博爱县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2729, 247, '孟州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2730, 247, '山阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2731, 247, '武陟县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2732, 247, '沁阳市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2733, 247, '温县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2734, 247, '解放区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2735, 247, '马村区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2736, 248, '华龙区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2737, 248, '南乐县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2738, 248, '台前县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2739, 248, '清丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2740, 248, '濮阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2741, 248, '范县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2742, 249, '禹州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2743, 249, '襄城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2744, 249, '许昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2745, 249, '鄢陵县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2746, 249, '长葛市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2747, 249, '魏都区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2748, 250, '临颍县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2749, 250, '召陵区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2750, 250, '源汇区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2751, 250, '舞阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2752, 250, '郾城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2753, 251, '义马市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2754, 251, '卢氏县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2755, 251, '渑池县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2756, 251, '湖滨区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2757, 251, '灵宝市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2758, 251, '陕县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2759, 252, '内乡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2760, 252, '南召县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2761, 252, '卧龙区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2762, 252, '唐河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2763, 252, '宛城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2764, 252, '新野县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2765, 252, '方城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2766, 252, '桐柏县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2767, 252, '淅川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2768, 252, '社旗县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2769, 252, '西峡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2770, 252, '邓州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2771, 252, '镇平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2772, 253, '夏邑县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2773, 253, '宁陵县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2774, 253, '柘城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2775, 253, '民权县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2776, 253, '永城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2777, 253, '睢县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2778, 253, '睢阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2779, 253, '粱园区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2780, 253, '虞城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2781, 254, '光山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2782, 254, '商城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2783, 254, '固始县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2784, 254, '平桥区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2785, 254, '息县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2786, 254, '新县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2787, 254, '浉河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2788, 254, '淮滨县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2789, 254, '潢川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2790, 254, '罗山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2791, 255, '商水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2792, 255, '太康县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2793, 255, '川汇区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2794, 255, '扶沟县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2795, 255, '沈丘县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2796, 255, '淮阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2797, 255, '西华县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2798, 255, '郸城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2799, 255, '项城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2800, 255, '鹿邑县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2801, 256, '上蔡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2802, 256, '平舆县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2803, 256, '新蔡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2804, 256, '正阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2805, 256, '汝南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2806, 256, '泌阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2807, 256, '确山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2808, 256, '西平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2809, 256, '遂平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2810, 256, '驿城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2811, 257, '济源市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2812, 258, '东西湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2813, 258, '新洲区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2814, 258, '武昌区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2815, 258, '汉南区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2816, 258, '汉阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2817, 258, '江夏区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2818, 258, '江岸区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2819, 258, '江汉区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2820, 258, '洪山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2821, 258, '硚口区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2822, 258, '蔡甸区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2823, 258, '青山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2824, 258, '黄陂区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2825, 259, '下陆区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2826, 259, '大冶市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2827, 259, '西塞山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2828, 259, '铁山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2829, 259, '阳新县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2830, 259, '黄石港区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2831, 260, '丹江口市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2832, 260, '张湾区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2833, 260, '房县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2834, 260, '竹山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2835, 260, '竹溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2836, 260, '茅箭区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2837, 260, '郧县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2838, 260, '郧西县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2839, 261, '五峰土家族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2840, 261, '伍家岗区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2841, 261, '兴山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2842, 261, '夷陵区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2843, 261, '宜都市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2844, 261, '当阳市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2845, 261, '枝江市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2846, 261, '点军区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2847, 261, '秭归县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2848, 261, '虢亭区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2849, 261, '西陵区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2850, 261, '远安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2851, 261, '长阳土家族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2852, 262, '保康县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2853, 262, '南漳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2854, 262, '宜城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2855, 262, '枣阳市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2856, 262, '樊城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2857, 262, '老河口市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2858, 262, '襄城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2859, 262, '襄阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2860, 262, '谷城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2861, 263, '华容区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2862, 263, '粱子湖', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2863, 263, '鄂城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2864, 264, '东宝区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2865, 264, '京山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2866, 264, '掇刀区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2867, 264, '沙洋县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2868, 264, '钟祥市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2869, 265, '云梦县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2870, 265, '大悟县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2871, 265, '孝南区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2872, 265, '孝昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2873, 265, '安陆市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2874, 265, '应城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2875, 265, '汉川市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2876, 266, '公安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2877, 266, '松滋市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2878, 266, '江陵县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2879, 266, '沙市区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2880, 266, '洪湖市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2881, 266, '监利县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2882, 266, '石首市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2883, 266, '荆州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2884, 267, '团风县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2885, 267, '武穴市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2886, 267, '浠水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2887, 267, '红安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2888, 267, '罗田县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2889, 267, '英山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2890, 267, '蕲春县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2891, 267, '麻城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2892, 267, '黄州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2893, 267, '黄梅县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2894, 268, '咸安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2895, 268, '嘉鱼县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2896, 268, '崇阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2897, 268, '赤壁市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2898, 268, '通城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2899, 268, '通山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2900, 269, '广水市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2901, 269, '曾都区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2902, 270, '利川市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2903, 270, '咸丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2904, 270, '宣恩县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2905, 270, '巴东县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2906, 270, '建始县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2907, 270, '恩施市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2908, 270, '来凤县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2909, 270, '鹤峰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2910, 271, '仙桃市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2911, 272, '潜江市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2912, 273, '天门市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2913, 274, '神农架林区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2914, 275, '天心区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2915, 275, '宁乡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2916, 275, '岳麓区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2917, 275, '开福区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2918, 275, '望城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2919, 275, '浏阳市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2920, 275, '芙蓉区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2921, 275, '长沙县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2922, 275, '雨花区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2923, 276, '天元区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2924, 276, '攸县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2925, 276, '株洲县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2926, 276, '炎陵县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2927, 276, '石峰区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2928, 276, '芦淞区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2929, 276, '茶陵县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2930, 276, '荷塘区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2931, 276, '醴陵市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2932, 277, '岳塘区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2933, 277, '湘乡市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2934, 277, '湘潭县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2935, 277, '雨湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2936, 277, '韶山市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2937, 278, '南岳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2938, 278, '常宁市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2939, 278, '珠晖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2940, 278, '石鼓区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2941, 278, '祁东县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2942, 278, '耒阳市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2943, 278, '蒸湘区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2944, 278, '衡东县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2945, 278, '衡南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2946, 278, '衡山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2947, 278, '衡阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2948, 278, '雁峰区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2949, 279, '北塔区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2950, 279, '双清区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2951, 279, '城步苗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2952, 279, '大祥区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2953, 279, '新宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2954, 279, '新邵县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2955, 279, '武冈市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2956, 279, '洞口县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2957, 279, '绥宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2958, 279, '邵东县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2959, 279, '邵阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2960, 279, '隆回县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2961, 280, '临湘市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2962, 280, '云溪区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2963, 280, '华容县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2964, 280, '君山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2965, 280, '岳阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2966, 280, '岳阳楼区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2967, 280, '平江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2968, 280, '汨罗市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2969, 280, '湘阴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2970, 281, '临澧县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2971, 281, '安乡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2972, 281, '桃源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2973, 281, '武陵区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2974, 281, '汉寿县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2975, 281, '津市市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2976, 281, '澧县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2977, 281, '石门县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2978, 281, '鼎城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2979, 282, '慈利县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2980, 282, '桑植县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2981, 282, '武陵源区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2982, 282, '永定区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2983, 283, '南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2984, 283, '安化县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2985, 283, '桃江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2986, 283, '沅江市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2987, 283, '资阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2988, 283, '赫山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2989, 284, '临武县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2990, 284, '北湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2991, 284, '嘉禾县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2992, 284, '安仁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2993, 284, '宜章县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2994, 284, '桂东县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2995, 284, '桂阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2996, 284, '永兴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2997, 284, '汝城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2998, 284, '苏仙区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (2999, 284, '资兴市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3000, 285, '东安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3001, 285, '冷水滩区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3002, 285, '双牌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3003, 285, '宁远县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3004, 285, '新田县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3005, 285, '江华瑶族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3006, 285, '江永县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3007, 285, '祁阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3008, 285, '蓝山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3009, 285, '道县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3010, 285, '零陵区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3011, 286, '中方县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3012, 286, '会同县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3013, 286, '新晃侗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3014, 286, '沅陵县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3015, 286, '洪江市/洪江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3016, 286, '溆浦县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3017, 286, '芷江侗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3018, 286, '辰溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3019, 286, '通道侗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3020, 286, '靖州苗族侗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3021, 286, '鹤城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3022, 286, '麻阳苗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3023, 287, '冷水江市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3024, 287, '双峰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3025, 287, '娄星区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3026, 287, '新化县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3027, 287, '涟源市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3028, 288, '保靖县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3029, 288, '凤凰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3030, 288, '古丈县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3031, 288, '吉首市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3032, 288, '永顺县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3033, 288, '泸溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3034, 288, '花垣县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3035, 288, '龙山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3036, 289, '萝岗区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3037, 289, '南沙区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3038, 289, '从化市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3039, 289, '增城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3040, 289, '天河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3041, 289, '海珠区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3042, 289, '番禺区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3043, 289, '白云区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3044, 289, '花都区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3045, 289, '荔湾区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3046, 289, '越秀区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3047, 289, '黄埔区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3048, 290, '乐昌市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3049, 290, '乳源瑶族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3050, 290, '仁化县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3051, 290, '南雄市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3052, 290, '始兴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3053, 290, '新丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3054, 290, '曲江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3055, 290, '武江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3056, 290, '浈江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3057, 290, '翁源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3058, 291, '南山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3059, 291, '宝安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3060, 291, '盐田区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3061, 291, '福田区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3062, 291, '罗湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3063, 291, '龙岗区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3064, 292, '斗门区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3065, 292, '金湾区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3066, 292, '香洲区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3067, 293, '南澳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3068, 293, '潮南区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3069, 293, '潮阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3070, 293, '澄海区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3071, 293, '濠江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3072, 293, '金平区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3073, 293, '龙湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3074, 294, '三水区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3075, 294, '南海区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3076, 294, '禅城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3077, 294, '顺德区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3078, 294, '高明区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3079, 295, '台山市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3080, 295, '开平市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3081, 295, '恩平市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3082, 295, '新会区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3083, 295, '江海区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3084, 295, '蓬江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3085, 295, '鹤山市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3086, 296, '吴川市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3087, 296, '坡头区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3088, 296, '廉江市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3089, 296, '徐闻县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3090, 296, '赤坎区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3091, 296, '遂溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3092, 296, '雷州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3093, 296, '霞山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3094, 296, '麻章区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3095, 297, '信宜市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3096, 297, '化州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3097, 297, '电白县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3098, 297, '茂南区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3099, 297, '茂港区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3100, 297, '高州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3101, 298, '四会市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3102, 298, '封开县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3103, 298, '广宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3104, 298, '德庆县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3105, 298, '怀集县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3106, 298, '端州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3107, 298, '高要市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3108, 298, '鼎湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3109, 299, '博罗县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3110, 299, '惠东县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3111, 299, '惠城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3112, 299, '惠阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3113, 299, '龙门县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3114, 300, '丰顺县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3115, 300, '五华县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3116, 300, '兴宁市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3117, 300, '大埔县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3118, 300, '平远县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3119, 300, '梅县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3120, 300, '梅江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3121, 300, '蕉岭县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3122, 301, '城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3123, 301, '海丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3124, 301, '陆丰市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3125, 301, '陆河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3126, 302, '东源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3127, 302, '和平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3128, 302, '源城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3129, 302, '紫金县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3130, 302, '连平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3131, 302, '龙川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3132, 303, '江城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3133, 303, '阳东县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3134, 303, '阳春市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3135, 303, '阳西县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3136, 304, '佛冈县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3137, 304, '清城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3138, 304, '清新县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3139, 304, '英德市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3140, 304, '连南瑶族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3141, 304, '连山壮族瑶族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3142, 304, '连州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3143, 304, '阳山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3144, 305, '东莞市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3145, 306, '中山市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3146, 307, '湘桥区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3147, 307, '潮安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3148, 307, '饶平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3149, 308, '惠来县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3150, 308, '揭东县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3151, 308, '揭西县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3152, 308, '普宁市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3153, 308, '榕城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3154, 309, '云城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3155, 309, '云安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3156, 309, '新兴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3157, 309, '罗定市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3158, 309, '郁南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3159, 310, '上林县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3160, 310, '兴宁区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3161, 310, '宾阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3162, 310, '横县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3163, 310, '武鸣县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3164, 310, '江南区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3165, 310, '良庆区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3166, 310, '西乡塘区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3167, 310, '邕宁区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3168, 310, '隆安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3169, 310, '青秀区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3170, 310, '马山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3171, 311, '三江侗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3172, 311, '城中区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3173, 311, '柳北区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3174, 311, '柳南区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3175, 311, '柳城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3176, 311, '柳江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3177, 311, '融安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3178, 311, '融水苗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3179, 311, '鱼峰区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3180, 311, '鹿寨县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3181, 312, '七星区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3182, 312, '临桂县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3183, 312, '全州县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3184, 312, '兴安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3185, 312, '叠彩区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3186, 312, '平乐县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3187, 312, '恭城瑶族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3188, 312, '永福县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3189, 312, '灌阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3190, 312, '灵川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3191, 312, '秀峰区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3192, 312, '荔浦县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3193, 312, '象山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3194, 312, '资源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3195, 312, '阳朔县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3196, 312, '雁山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3197, 312, '龙胜各族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3198, 313, '万秀区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3199, 313, '岑溪市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3200, 313, '苍梧县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3201, 313, '蒙山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3202, 313, '藤县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3203, 313, '蝶山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3204, 313, '长洲区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3205, 314, '合浦县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3206, 314, '海城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3207, 314, '铁山港区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3208, 314, '银海区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3209, 315, '上思县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3210, 315, '东兴市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3211, 315, '港口区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3212, 315, '防城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3213, 316, '浦北县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3214, 316, '灵山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3215, 316, '钦北区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3216, 316, '钦南区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3217, 317, '平南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3218, 317, '桂平市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3219, 317, '港北区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3220, 317, '港南区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3221, 317, '覃塘区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3222, 318, '兴业县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3223, 318, '北流市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3224, 318, '博白县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3225, 318, '容县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3226, 318, '玉州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3227, 318, '陆川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3228, 319, '乐业县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3229, 319, '凌云县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3230, 319, '右江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3231, 319, '平果县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3232, 319, '德保县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3233, 319, '田东县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3234, 319, '田林县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3235, 319, '田阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3236, 319, '西林县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3237, 319, '那坡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3238, 319, '隆林各族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3239, 319, '靖西县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3240, 320, '八步区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3241, 320, '富川瑶族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3242, 320, '昭平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3243, 320, '钟山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3244, 321, '东兰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3245, 321, '凤山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3246, 321, '南丹县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3247, 321, '大化瑶族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3248, 321, '天峨县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3249, 321, '宜州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3250, 321, '巴马瑶族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3251, 321, '环江毛南族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3252, 321, '罗城仫佬族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3253, 321, '都安瑶族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3254, 321, '金城江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3255, 322, '兴宾区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3256, 322, '合山市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3257, 322, '忻城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3258, 322, '武宣县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3259, 322, '象州县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3260, 322, '金秀瑶族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3261, 323, '凭祥市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3262, 323, '大新县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3263, 323, '天等县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3264, 323, '宁明县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3265, 323, '扶绥县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3266, 323, '江州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3267, 323, '龙州县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3268, 324, '琼山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3269, 324, '秀英区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3270, 324, '美兰区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3271, 324, '龙华区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3272, 325, '三亚市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3273, 326, '五指山市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3274, 327, '琼海市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3275, 328, '儋州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3276, 329, '文昌市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3277, 330, '万宁市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3278, 331, '东方市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3279, 332, '定安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3280, 333, '屯昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3281, 334, '澄迈县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3282, 335, '临高县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3283, 336, '白沙黎族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3284, 337, '昌江黎族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3285, 338, '乐东黎族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3286, 339, '陵水黎族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3287, 340, '保亭黎族苗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3288, 341, '琼中黎族苗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3289, 345, '九池乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3290, 345, '五桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3291, 345, '余家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3292, 345, '分水镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3293, 345, '双河口街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3294, 345, '后山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3295, 345, '周家坝街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3296, 345, '响水镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3297, 345, '地宝乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3298, 345, '大周镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3299, 345, '天城镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3300, 345, '太安镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3301, 345, '太白街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3302, 345, '太龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3303, 345, '孙家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3304, 345, '小周镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3305, 345, '弹子镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3306, 345, '恒合土家族乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3307, 345, '新乡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3308, 345, '新田镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3309, 345, '普子乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3310, 345, '李河镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3311, 345, '柱山乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3312, 345, '梨树乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3313, 345, '武陵镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3314, 345, '沙河街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3315, 345, '溪口乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3316, 345, '瀼渡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3317, 345, '熊家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3318, 345, '燕山乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3319, 345, '牌楼街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3320, 345, '甘宁镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3321, 345, '白土镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3322, 345, '白羊镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3323, 345, '百安坝街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3324, 345, '罗田镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3325, 345, '茨竹乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3326, 345, '走马镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3327, 345, '郭村乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3328, 345, '钟鼓楼街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3329, 345, '铁峰乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3330, 345, '长坪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3331, 345, '长岭镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3332, 345, '长滩镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3333, 345, '陈家坝街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3334, 345, '高峰镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3335, 345, '高梁镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3336, 345, '高笋塘街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3337, 345, '黄柏乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3338, 345, '龙沙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3339, 345, '龙都街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3340, 345, '龙驹镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3341, 346, '丛林乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3342, 346, '两汇乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3343, 346, '中峰乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3344, 346, '义和镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3345, 346, '仁义乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3346, 346, '南沱镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3347, 346, '卷洞乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3348, 346, '同乐乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3349, 346, '土地坡乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3350, 346, '堡子镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3351, 346, '增福乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3352, 346, '大木乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3353, 346, '天台乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3354, 346, '太和乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3355, 346, '山窝乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3356, 346, '崇义街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3357, 346, '惠民乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3358, 346, '敦仁街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3359, 346, '新妙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3360, 346, '新村乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3361, 346, '明家乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3362, 346, '李渡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3363, 346, '梓里乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3364, 346, '武陵山乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3365, 346, '江东街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3366, 346, '江北街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3367, 346, '清溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3368, 346, '焦石镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3369, 346, '珍溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3370, 346, '白涛镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3371, 346, '百胜镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3372, 346, '石和乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3373, 346, '石沱镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3374, 346, '石龙乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3375, 346, '罗云乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3376, 346, '聚宝乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3377, 346, '致韩镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3378, 346, '荔枝街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3379, 346, '蔺市镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3380, 346, '酒店乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3381, 346, '镇安镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3382, 346, '青羊镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3383, 346, '马武镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3384, 346, '龙桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3385, 346, '龙潭镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3386, 347, '七星岗街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3387, 347, '上清寺街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3388, 347, '两路口街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3389, 347, '化龙桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3390, 347, '南纪门街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3391, 347, '大坪街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3392, 347, '大溪沟街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3393, 347, '望龙门街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3394, 347, '朝天门街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3395, 347, '石油路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3396, 347, '菜园坝街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3397, 347, '解放碑街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3398, 348, '九宫庙街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3399, 348, '八桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3400, 348, '建胜镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3401, 348, '新山村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3402, 348, '春晖路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3403, 348, '茄子溪街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3404, 348, '跃进村街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3405, 348, '跳磴镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3406, 349, '五宝镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3407, 349, '五里店街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3408, 349, '华新街街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3409, 349, '复盛镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3410, 349, '大石坝街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3411, 349, '寸滩街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3412, 349, '江北城街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3413, 349, '石马河街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3414, 349, '观音桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3415, 349, '郭家沱街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3416, 349, '铁山坪街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3417, 349, '鱼嘴镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3418, 350, '中梁镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3419, 350, '井口街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3420, 350, '井口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3421, 350, '凤凰镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3422, 350, '回龙坝镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3423, 350, '土主镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3424, 350, '土湾街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3425, 350, '天星桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3426, 350, '小龙坎街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3427, 350, '山洞街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3428, 350, '新桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3429, 350, '曾家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3430, 350, '歌乐山街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3431, 350, '歌乐山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3432, 350, '沙坪坝街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3433, 350, '渝碚路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3434, 350, '石井坡街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3435, 350, '磁器口街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3436, 350, '童家桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3437, 350, '虎溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3438, 350, '西永镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3439, 350, '覃家岗镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3440, 350, '詹家溪街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3441, 350, '陈家桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3442, 350, '青木关镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3443, 351, '中梁山街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3444, 351, '九龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3445, 351, '华岩镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3446, 351, '含谷镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3447, 351, '巴福镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3448, 351, '杨家坪街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3449, 351, '渝州路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3450, 351, '白市驿镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3451, 351, '石坪桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3452, 351, '石板镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3453, 351, '石桥铺街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3454, 351, '西彭镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3455, 351, '谢家湾街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3456, 351, '走马镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3457, 351, '金凤镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3458, 351, '铜罐驿镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3459, 351, '陶家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3460, 351, '黄桷坪街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3461, 352, '南坪街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3462, 352, '南坪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3463, 352, '南山街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3464, 352, '峡口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3465, 352, '广阳镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3466, 352, '弹子石街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3467, 352, '海棠溪街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3468, 352, '涂山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3469, 352, '花园路街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3470, 352, '迎龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3471, 352, '铜元局街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3472, 352, '长生桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3473, 352, '鸡冠石镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3474, 352, '龙门浩街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3475, 353, '三圣镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3476, 353, '东阳街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3477, 353, '北温泉街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3478, 353, '复兴镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3479, 353, '天府镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3480, 353, '天生街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3481, 353, '施家梁镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3482, 353, '朝阳街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3483, 353, '柳荫镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3484, 353, '歇马镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3485, 353, '水土镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3486, 353, '澄江镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3487, 353, '童家溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3488, 353, '蔡家岗镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3489, 353, '金刀峡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3490, 353, '静观镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3491, 353, '龙凤桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3492, 354, '双路镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3493, 354, '通桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3494, 354, '龙滩子街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3495, 355, '万东镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3496, 355, '万盛街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3497, 355, '丛林镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3498, 355, '东林街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3499, 355, '关坝镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3500, 355, '南桐镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3501, 355, '石林镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3502, 355, '金桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3503, 355, '青年镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3504, 355, '黑山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3505, 356, '人和街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3506, 356, '兴隆镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3507, 356, '华蓥山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3508, 356, '双凤桥街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3509, 356, '双龙湖街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3510, 356, '古路镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3511, 356, '回兴街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3512, 356, '大塆镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3513, 356, '大盛镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3514, 356, '大竹林街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3515, 356, '天宫殿街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3516, 356, '张关镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3517, 356, '御临镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3518, 356, '悦来镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3519, 356, '明月镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3520, 356, '木耳镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3521, 356, '洛碛镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3522, 356, '玉峰山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3523, 356, '王家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3524, 356, '石坪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3525, 356, '石船镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3526, 356, '礼嘉镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3527, 356, '统景镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3528, 356, '翠云街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3529, 356, '茨竹', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3530, 356, '高嘴镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3531, 356, '鸳鸯街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3532, 356, '麻柳沱镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3533, 356, '龙兴镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3534, 356, '龙塔街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3535, 356, '龙山街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3536, 356, '龙溪街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3537, 357, '一品镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3538, 357, '东泉镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3539, 357, '丰盛镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3540, 357, '二圣镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3541, 357, '南彭镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3542, 357, '南泉镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3543, 357, '双河口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3544, 357, '天星寺镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3545, 357, '姜家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3546, 357, '安澜镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3547, 357, '惠民镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3548, 357, '接龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3549, 357, '木洞镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3550, 357, '李家沱街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3551, 357, '界石镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3552, 357, '石滩镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3553, 357, '石龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3554, 357, '花溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3555, 357, '跳石镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3556, 357, '鱼洞街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3557, 357, '麻柳嘴镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3558, 358, '两河镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3559, 358, '中塘乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3560, 358, '五里乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3561, 358, '冯家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3562, 358, '城东街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3563, 358, '城南街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3564, 358, '城西街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3565, 358, '太极乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3566, 358, '小南海镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3567, 358, '新华乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3568, 358, '杉岭乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3569, 358, '正阳镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3570, 358, '水市乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3571, 358, '水田乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3572, 358, '沙坝乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3573, 358, '濯水镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3574, 358, '白土乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3575, 358, '白石乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3576, 358, '石会镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3577, 358, '石家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3578, 358, '舟白镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3579, 358, '蓬东乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3580, 358, '邻鄂镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3581, 358, '金洞乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3582, 358, '金溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3583, 358, '马喇镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3584, 358, '鹅池镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3585, 358, '黄溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3586, 358, '黎水镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3587, 358, '黑溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3588, 359, '万顺镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3589, 359, '云台镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3590, 359, '云集镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3591, 359, '但渡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3592, 359, '八颗镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3593, 359, '凤城街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3594, 359, '双龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3595, 359, '新市镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3596, 359, '晏家街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3597, 359, '江南镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3598, 359, '洪湖镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3599, 359, '海棠镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3600, 359, '渡舟镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3601, 359, '石堰镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3602, 359, '葛兰镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3603, 359, '邻封镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3604, 359, '长寿湖镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3605, 359, '龙河镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3606, 360, '丁山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3607, 360, '三江镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3608, 360, '三角镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3609, 360, '东溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3610, 360, '中峰镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3611, 360, '古南镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3612, 360, '安稳镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3613, 360, '打通镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3614, 360, '扶欢镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3615, 360, '新盛镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3616, 360, '横山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3617, 360, '永城镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3618, 360, '永新镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3619, 360, '石壕镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3620, 360, '石角镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3621, 360, '篆塘镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3622, 360, '赶水镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3623, 360, '郭扶镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3624, 360, '隆盛镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3625, 361, '上和镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3626, 361, '五桂镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3627, 361, '别口乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3628, 361, '卧佛镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3629, 361, '双江镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3630, 361, '古溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3631, 361, '塘坝镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3632, 361, '太安镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3633, 361, '宝龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3634, 361, '寿桥乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3635, 361, '小渡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3636, 361, '崇龛镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3637, 361, '新胜镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3638, 361, '柏梓镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3639, 361, '桂林街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3640, 361, '梓潼街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3641, 361, '玉溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3642, 361, '田家乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3643, 361, '米心镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3644, 361, '群力镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3645, 361, '花岩镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3646, 361, '龙形镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3647, 362, '东城街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3648, 362, '二坪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3649, 362, '侣俸镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3650, 362, '华兴镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3651, 362, '南城街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3652, 362, '双山乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3653, 362, '围龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3654, 362, '土桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3655, 362, '大庙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3656, 362, '太平镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3657, 362, '安居镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3658, 362, '安溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3659, 362, '小林乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3660, 362, '少云镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3661, 362, '巴川街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3662, 362, '平滩镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3663, 362, '庆隆乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3664, 362, '旧县镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3665, 362, '水口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3666, 362, '永嘉镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3667, 362, '白羊镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3668, 362, '石鱼镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3669, 362, '福果镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3670, 362, '维新镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3671, 362, '蒲吕镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3672, 362, '虎峰镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3673, 362, '西河镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3674, 362, '高楼镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3675, 363, '万古镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3676, 363, '三驱镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3677, 363, '中敖镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3678, 363, '古龙乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3679, 363, '回龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3680, 363, '国梁镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3681, 363, '季家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3682, 363, '宝兴镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3683, 363, '宝顶镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3684, 363, '拾万镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3685, 363, '智凤镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3686, 363, '棠香街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3687, 363, '玉龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3688, 363, '珠溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3689, 363, '石马镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3690, 363, '邮亭镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3691, 363, '金山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3692, 363, '铁山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3693, 363, '雍溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3694, 363, '高升场镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3695, 363, '高坪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3696, 363, '龙岗街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3697, 363, '龙水镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3698, 363, '龙石镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3699, 364, '仁义镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3700, 364, '双河镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3701, 364, '古昌镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3702, 364, '吴家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3703, 364, '安富镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3704, 364, '峰高镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3705, 364, '广顺镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3706, 364, '昌元镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3707, 364, '河包镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3708, 364, '清升镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3709, 364, '清江镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3710, 364, '清流镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3711, 364, '盘龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3712, 364, '直升镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3713, 364, '荣隆镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3714, 364, '观胜镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3715, 364, '路孔镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3716, 364, '远觉镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3717, 364, '铜鼓镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3718, 364, '龙集镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3719, 365, '丁家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3720, 365, '七塘镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3721, 365, '三合镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3722, 365, '健龙乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3723, 365, '八塘镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3724, 365, '大兴镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3725, 365, '大路镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3726, 365, '广普镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3727, 365, '正兴镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3728, 365, '河边镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3729, 365, '璧城街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3730, 365, '福禄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3731, 365, '青杠街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3732, 366, '七星镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3733, 366, '云龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3734, 366, '仁贤镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3735, 366, '合兴镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3736, 366, '和林镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3737, 366, '回龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3738, 366, '城东乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3739, 366, '城北乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3740, 366, '复平乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3741, 366, '大观镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3742, 366, '安胜乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3743, 366, '屏锦镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3744, 366, '文化镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3745, 366, '新盛镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3746, 366, '明达镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3747, 366, '曲水乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3748, 366, '柏家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3749, 366, '梁山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3750, 366, '石安镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3751, 366, '碧山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3752, 366, '礼让镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3753, 366, '福禄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3754, 366, '竹山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3755, 366, '紫照乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3756, 366, '聚奎镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3757, 366, '荫平镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3758, 366, '虎城镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3759, 366, '蟠龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3760, 366, '袁驿镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3761, 366, '金带镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3762, 366, '铁门乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3763, 366, '龙胜乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3764, 366, '龙门镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3765, 367, '东安乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3766, 367, '修齐镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3767, 367, '北屏乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3768, 367, '厚坪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3769, 367, '双河乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3770, 367, '周溪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3771, 367, '咸宜乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3772, 367, '坪坝镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3773, 367, '岚天乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3774, 367, '左岚乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3775, 367, '巴山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3776, 367, '庙坝镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3777, 367, '明中乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3778, 367, '明通镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3779, 367, '河鱼乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3780, 367, '治平乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3781, 367, '沿河乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3782, 367, '葛城镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3783, 367, '蓼子乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3784, 367, '高楠乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3785, 367, '高燕乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3786, 367, '高观镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3787, 367, '鸡鸣乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3788, 367, '龙田乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3789, 368, '三元镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3790, 368, '三合镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3791, 368, '三坝乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3792, 368, '三建乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3793, 368, '仁沙乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3794, 368, '保合乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3795, 368, '兴义镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3796, 368, '包鸾镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3797, 368, '十直镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3798, 368, '南天湖镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3799, 368, '双路镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3800, 368, '双龙场乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3801, 368, '名山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3802, 368, '太平坝乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3803, 368, '崇兴乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3804, 368, '暨龙乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3805, 368, '树人镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3806, 368, '栗子乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3807, 368, '武平镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3808, 368, '江池镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3809, 368, '湛普镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3810, 368, '社坛镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3811, 368, '董家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3812, 368, '虎威镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3813, 368, '许明寺镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3814, 368, '都督乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3815, 368, '镇江镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3816, 368, '青龙乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3817, 368, '高家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3818, 368, '龙孔乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3819, 368, '龙河镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3820, 369, '三溪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3821, 369, '五洞镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3822, 369, '包家乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3823, 369, '周嘉镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3824, 369, '坪山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3825, 369, '大石乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3826, 369, '太平镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3827, 369, '新民镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3828, 369, '普顺镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3829, 369, '曹回乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3830, 369, '杠家乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3831, 369, '桂溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3832, 369, '永安镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3833, 369, '永平乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3834, 369, '沙坪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3835, 369, '沙河乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3836, 369, '澄溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3837, 369, '白家乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3838, 369, '砚台镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3839, 369, '裴兴乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3840, 369, '长龙乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3841, 369, '高安镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3842, 369, '高峰镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3843, 369, '鹤游镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3844, 369, '黄沙乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3845, 370, '仙女山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3846, 370, '凤来乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3847, 370, '双河乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3848, 370, '后坪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3849, 370, '和顺乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3850, 370, '土地乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3851, 370, '土坎镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3852, 370, '巷口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3853, 370, '平桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3854, 370, '庙垭乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3855, 370, '接龙乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3856, 370, '文复乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3857, 370, '桐梓镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3858, 370, '江口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3859, 370, '沧沟乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3860, 370, '浩口乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3861, 370, '火炉镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3862, 370, '白云乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3863, 370, '白马镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3864, 370, '石桥乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3865, 370, '羊角镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3866, 370, '赵家乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3867, 370, '铁矿乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3868, 370, '长坝镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3869, 370, '鸭江镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3870, 370, '黄莺乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3871, 371, '三汇镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3872, 371, '东溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3873, 371, '乌杨镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3874, 371, '任家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3875, 371, '兴峰乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3876, 371, '双桂镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3877, 371, '善广乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3878, 371, '复兴镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3879, 371, '官坝镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3880, 371, '忠州镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3881, 371, '拔山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3882, 371, '新生镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3883, 371, '新立镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3884, 371, '永丰镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3885, 371, '汝溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3886, 371, '洋渡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3887, 371, '涂井乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3888, 371, '白石镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3889, 371, '石子乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3890, 371, '石宝镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3891, 371, '石黄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3892, 371, '磨子土家族乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3893, 371, '花桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3894, 371, '野鹤镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3895, 371, '金声乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3896, 371, '金鸡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3897, 371, '马灌镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3898, 371, '黄金镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3899, 372, '三汇口乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3900, 372, '中和镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3901, 372, '丰乐街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3902, 372, '临江镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3903, 372, '义和镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3904, 372, '九龙山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3905, 372, '五通乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3906, 372, '关面乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3907, 372, '南门镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3908, 372, '南雅镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3909, 372, '厚坝镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3910, 372, '和谦镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3911, 372, '大德乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3912, 372, '大进镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3913, 372, '天和乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3914, 372, '岳溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3915, 372, '巫山乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3916, 372, '敦好镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3917, 372, '汉丰街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3918, 372, '河堰镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3919, 372, '渠口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3920, 372, '温泉镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3921, 372, '满月乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3922, 372, '白桥乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3923, 372, '白泉乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3924, 372, '白鹤街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3925, 372, '竹溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3926, 372, '紫水乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3927, 372, '谭家乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3928, 372, '赵家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3929, 372, '郭家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3930, 372, '金峰乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3931, 372, '铁桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3932, 372, '镇东街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3933, 372, '镇安镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3934, 372, '长沙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3935, 372, '高桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3936, 372, '麻柳乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3937, 373, '上坝乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3938, 373, '云安镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3939, 373, '云硐乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3940, 373, '云阳镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3941, 373, '人和镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3942, 373, '养鹿乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3943, 373, '农坝镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3944, 373, '凤鸣镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3945, 373, '南溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3946, 373, '双土镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3947, 373, '双江街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3948, 373, '双龙乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3949, 373, '后叶乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3950, 373, '堰坪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3951, 373, '外郎乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3952, 373, '大阳乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3953, 373, '宝坪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3954, 373, '巴阳镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3955, 373, '平安镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3956, 373, '故陵镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3957, 373, '新津乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3958, 373, '普安乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3959, 373, '栖霞乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3960, 373, '桑坪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3961, 373, '毛坝乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3962, 373, '水口乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3963, 373, '江口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3964, 373, '沙市镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3965, 373, '泥溪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3966, 373, '洞鹿乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3967, 373, '清水土家族乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3968, 373, '渠马镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3969, 373, '盘龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3970, 373, '石门乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3971, 373, '票草乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3972, 373, '红狮镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3973, 373, '耀灵乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3974, 373, '路阳镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3975, 373, '青龙街道', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3976, 373, '高阳镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3977, 373, '鱼泉镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3978, 373, '黄石镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3979, 373, '龙洞乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3980, 373, '龙角镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3981, 374, '云雾土家族乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3982, 374, '五马乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3983, 374, '公平镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3984, 374, '兴隆镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3985, 374, '冯坪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3986, 374, '吐祥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3987, 374, '大树镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3988, 374, '太和乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3989, 374, '安坪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3990, 374, '岩湾乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3991, 374, '平安乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3992, 374, '康乐镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3993, 374, '康坪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3994, 374, '新政乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3995, 374, '新民镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3996, 374, '朱衣镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3997, 374, '永乐镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3998, 374, '永安镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (3999, 374, '汾河镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4000, 374, '甲高镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4001, 374, '白帝镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4002, 374, '石岗乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4003, 374, '竹园镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4004, 374, '红土乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4005, 374, '羊市镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4006, 374, '草堂镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4007, 374, '长安土家族乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4008, 374, '青龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4009, 374, '鹤峰乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4010, 374, '龙桥土家族乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4011, 375, '三溪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4012, 375, '两坪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4013, 375, '双龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4014, 375, '培石乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4015, 375, '大昌镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4016, 375, '大溪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4017, 375, '官渡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4018, 375, '官阳镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4019, 375, '巫峡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4020, 375, '平河乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4021, 375, '庙堂乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4022, 375, '庙宇镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4023, 375, '建平乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4024, 375, '当阳乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4025, 375, '抱龙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4026, 375, '曲尺乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4027, 375, '福田镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4028, 375, '竹贤乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4029, 375, '笃坪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4030, 375, '红椿土家族乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4031, 375, '邓家土家族乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4032, 375, '金坪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4033, 375, '铜鼓镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4034, 375, '骡坪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4035, 375, '龙井乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4036, 375, '龙溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4037, 376, '上磺镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4038, 376, '下堡镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4039, 376, '中岗乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4040, 376, '中梁乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4041, 376, '乌龙乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4042, 376, '兰英乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4043, 376, '凤凰镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4044, 376, '双阳乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4045, 376, '古路镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4046, 376, '土城乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4047, 376, '城厢镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4048, 376, '塘坊乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4049, 376, '大河乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4050, 376, '天元乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4051, 376, '天星乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4052, 376, '宁厂镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4053, 376, '尖山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4054, 376, '峰灵乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4055, 376, '徐家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4056, 376, '文峰镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4057, 376, '朝阳洞乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4058, 376, '田坝乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4059, 376, '白鹿镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4060, 376, '胜利乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4061, 376, '花台乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4062, 376, '菱角乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4063, 376, '蒲莲乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4064, 376, '通城乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4065, 376, '长桂乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4066, 376, '鱼鳞乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4067, 377, '万朝乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4068, 377, '三星乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4069, 377, '三河乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4070, 377, '三益乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4071, 377, '下路镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4072, 377, '中益乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4073, 377, '临溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4074, 377, '六塘乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4075, 377, '冷水乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4076, 377, '南宾镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4077, 377, '大歇乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4078, 377, '悦崃镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4079, 377, '新乐乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4080, 377, '枫木乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4081, 377, '桥头乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4082, 377, '沙子镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4083, 377, '河嘴乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4084, 377, '沿溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4085, 377, '洗新乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4086, 377, '渔池镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4087, 377, '王场镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4088, 377, '王家乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4089, 377, '石家乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4090, 377, '西沱镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4091, 377, '金竹乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4092, 377, '金铃乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4093, 377, '马武镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4094, 377, '黄水镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4095, 377, '黄鹤乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4096, 377, '黎场乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4097, 377, '龙沙镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4098, 377, '龙潭乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4099, 378, '中和镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4100, 378, '中平乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4101, 378, '保安乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4102, 378, '兰桥镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4103, 378, '塘坳乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4104, 378, '大溪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4105, 378, '妙泉乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4106, 378, '孝溪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4107, 378, '宋农乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4108, 378, '官庄镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4109, 378, '官舟乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4110, 378, '岑溪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4111, 378, '峨溶镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4112, 378, '巴家乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4113, 378, '干川乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4114, 378, '平凯镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4115, 378, '平马乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4116, 378, '梅江镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4117, 378, '洪安镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4118, 378, '海洋乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4119, 378, '涌洞乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4120, 378, '清溪场镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4121, 378, '溪口乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4122, 378, '溶溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4123, 378, '石堤镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4124, 378, '石耶镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4125, 378, '膏田乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4126, 378, '里仁乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4127, 378, '钟灵乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4128, 378, '隘口镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4129, 378, '雅江镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4130, 378, '龙池镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4131, 379, '丁市镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4132, 379, '万木乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4133, 379, '两罾乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4134, 379, '五福乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4135, 379, '偏柏乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4136, 379, '兴隆镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4137, 379, '南腰界乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4138, 379, '双泉乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4139, 379, '可大乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4140, 379, '后坪坝乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4141, 379, '后溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4142, 379, '大溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4143, 379, '天馆乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4144, 379, '官清乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4145, 379, '宜居乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4146, 379, '小河镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4147, 379, '庙溪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4148, 379, '木叶乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4149, 379, '李溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4150, 379, '板桥乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4151, 379, '板溪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4152, 379, '楠木乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4153, 379, '毛坝乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4154, 379, '江丰乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4155, 379, '泔溪镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4156, 379, '浪坪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4157, 379, '涂市乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4158, 379, '清泉乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4159, 379, '腴地乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4160, 379, '花田乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4161, 379, '苍岭镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4162, 379, '车田乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4163, 379, '酉酬镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4164, 379, '钟多镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4165, 379, '铜鼓乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4166, 379, '麻旺镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4167, 379, '黑水镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4168, 379, '龙潭镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4169, 379, '龚滩镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4170, 380, '万足乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4171, 380, '三义乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4172, 380, '乔梓乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4173, 380, '保家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4174, 380, '双龙乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4175, 380, '善感乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4176, 380, '大垭乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4177, 380, '太原乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4178, 380, '小厂乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4179, 380, '岩东乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4180, 380, '平安乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4181, 380, '新田乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4182, 380, '普子镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4183, 380, '朗溪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4184, 380, '桐楼乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4185, 380, '桑柘镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4186, 380, '梅子垭乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4187, 380, '棣棠乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4188, 380, '汉葭镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4189, 380, '润溪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4190, 380, '石柳乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4191, 380, '石盘乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4192, 380, '联合乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4193, 380, '芦塘乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4194, 380, '诸佛乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4195, 380, '走马乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4196, 380, '迁乔乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4197, 380, '连湖镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4198, 380, '郁山镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4199, 380, '长滩乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4200, 380, '靛水乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4201, 380, '鞍子乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4202, 380, '高谷镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4203, 380, '鹿角镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4204, 380, '鹿鸣乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4205, 380, '黄家镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4206, 380, '龙塘乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4207, 380, '龙射镇', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4208, 380, '龙溪乡', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4209, 385, '双流县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4210, 385, '大邑县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4211, 385, '崇州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4212, 385, '彭州市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4213, 385, '成华区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4214, 385, '新津县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4215, 385, '新都区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4216, 385, '武侯区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4217, 385, '温江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4218, 385, '蒲江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4219, 385, '邛崃市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4220, 385, '郫县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4221, 385, '都江堰市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4222, 385, '金堂县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4223, 385, '金牛区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4224, 385, '锦江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4225, 385, '青白江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4226, 385, '青羊区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4227, 385, '龙泉驿区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4228, 386, '大安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4229, 386, '富顺县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4230, 386, '沿滩区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4231, 386, '自流井区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4232, 386, '荣县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4233, 386, '贡井区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4234, 387, '东区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4235, 387, '仁和区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4236, 387, '盐边县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4237, 387, '米易县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4238, 387, '西区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4239, 388, '叙永县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4240, 388, '古蔺县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4241, 388, '合江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4242, 388, '江阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4243, 388, '泸县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4244, 388, '纳溪区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4245, 388, '龙马潭区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4246, 389, '中江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4247, 389, '什邡市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4248, 389, '广汉市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4249, 389, '旌阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4250, 389, '绵竹市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4251, 389, '罗江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4252, 390, '三台县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4253, 390, '北川羌族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4254, 390, '安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4255, 390, '平武县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4256, 390, '梓潼县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4257, 390, '江油市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4258, 390, '涪城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4259, 390, '游仙区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4260, 390, '盐亭县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4261, 391, '元坝区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4262, 391, '利州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4263, 391, '剑阁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4264, 391, '旺苍县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4265, 391, '朝天区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4266, 391, '苍溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4267, 391, '青川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4268, 392, '大英县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4269, 392, '安居区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4270, 392, '射洪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4271, 392, '船山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4272, 392, '蓬溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4273, 393, '东兴区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4274, 393, '威远县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4275, 393, '市中区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4276, 393, '资中县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4277, 393, '隆昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4278, 394, '五通桥区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4279, 394, '井研县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4280, 394, '夹江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4281, 394, '峨眉山市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4282, 394, '峨边彝族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4283, 394, '市中区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4284, 394, '沐川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4285, 394, '沙湾区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4286, 394, '犍为县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4287, 394, '金口河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4288, 394, '马边彝族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4289, 395, '仪陇县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4290, 395, '南充市嘉陵区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4291, 395, '南部县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4292, 395, '嘉陵区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4293, 395, '营山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4294, 395, '蓬安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4295, 395, '西充县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4296, 395, '阆中市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4297, 395, '顺庆区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4298, 395, '高坪区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4299, 396, '东坡区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4300, 396, '丹棱县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4301, 396, '仁寿县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4302, 396, '彭山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4303, 396, '洪雅县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4304, 396, '青神县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4305, 397, '兴文县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4306, 397, '南溪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4307, 397, '宜宾县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4308, 397, '屏山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4309, 397, '江安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4310, 397, '珙县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4311, 397, '筠连县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4312, 397, '翠屏区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4313, 397, '长宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4314, 397, '高县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4315, 398, '华蓥市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4316, 398, '岳池县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4317, 398, '广安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4318, 398, '武胜县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4319, 398, '邻水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4320, 399, '万源市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4321, 399, '大竹县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4322, 399, '宣汉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4323, 399, '开江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4324, 399, '渠县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4325, 399, '达县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4326, 399, '通川区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4327, 400, '名山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4328, 400, '天全县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4329, 400, '宝兴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4330, 400, '汉源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4331, 400, '石棉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4332, 400, '芦山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4333, 400, '荥经县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4334, 400, '雨城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4335, 401, '南江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4336, 401, '巴州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4337, 401, '平昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4338, 401, '通江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4339, 402, '乐至县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4340, 402, '安岳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4341, 402, '简阳市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4342, 402, '雁江区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4343, 403, '九寨沟县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4344, 403, '壤塘县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4345, 403, '小金县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4346, 403, '松潘县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4347, 403, '汶川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4348, 403, '理县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4349, 403, '红原县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4350, 403, '若尔盖县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4351, 403, '茂县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4352, 403, '金川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4353, 403, '阿坝县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4354, 403, '马尔康县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4355, 403, '黑水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4356, 404, '丹巴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4357, 404, '乡城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4358, 404, '巴塘县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4359, 404, '康定县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4360, 404, '得荣县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4361, 404, '德格县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4362, 404, '新龙县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4363, 404, '泸定县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4364, 404, '炉霍县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4365, 404, '理塘县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4366, 404, '甘孜县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4367, 404, '白玉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4368, 404, '石渠县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4369, 404, '稻城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4370, 404, '色达县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4371, 404, '道孚县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4372, 404, '雅江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4373, 405, '会东县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4374, 405, '会理县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4375, 405, '冕宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4376, 405, '喜德县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4377, 405, '宁南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4378, 405, '布拖县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4379, 405, '德昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4380, 405, '昭觉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4381, 405, '普格县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4382, 405, '木里藏族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4383, 405, '甘洛县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4384, 405, '盐源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4385, 405, '美姑县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4386, 405, '西昌', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4387, 405, '越西县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4388, 405, '金阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4389, 405, '雷波县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4390, 406, '乌当区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4391, 406, '云岩区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4392, 406, '修文县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4393, 406, '南明区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4394, 406, '小河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4395, 406, '开阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4396, 406, '息烽县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4397, 406, '清镇市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4398, 406, '白云区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4399, 406, '花溪区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4400, 407, '六枝特区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4401, 407, '水城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4402, 407, '盘县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4403, 407, '钟山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4404, 408, '习水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4405, 408, '仁怀市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4406, 408, '余庆县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4407, 408, '凤冈县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4408, 408, '务川仡佬族苗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4409, 408, '桐梓县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4410, 408, '正安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4411, 408, '汇川区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4412, 408, '湄潭县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4413, 408, '红花岗区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4414, 408, '绥阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4415, 408, '赤水市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4416, 408, '道真仡佬族苗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4417, 408, '遵义县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4418, 409, '关岭布依族苗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4419, 409, '平坝县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4420, 409, '普定县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4421, 409, '紫云苗族布依族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4422, 409, '西秀区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4423, 409, '镇宁布依族苗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4424, 410, '万山特区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4425, 410, '印江土家族苗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4426, 410, '德江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4427, 410, '思南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4428, 410, '松桃苗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4429, 410, '江口县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4430, 410, '沿河土家族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4431, 410, '玉屏侗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4432, 410, '石阡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4433, 410, '铜仁市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4434, 411, '兴义市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4435, 411, '兴仁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4436, 411, '册亨县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4437, 411, '安龙县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4438, 411, '普安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4439, 411, '晴隆县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4440, 411, '望谟县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4441, 411, '贞丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4442, 412, '大方县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4443, 412, '威宁彝族回族苗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4444, 412, '毕节市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4445, 412, '纳雍县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4446, 412, '织金县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4447, 412, '赫章县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4448, 412, '金沙县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4449, 412, '黔西县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4450, 413, '三穗县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4451, 413, '丹寨县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4452, 413, '从江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4453, 413, '凯里市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4454, 413, '剑河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4455, 413, '台江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4456, 413, '天柱县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4457, 413, '岑巩县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4458, 413, '施秉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4459, 413, '榕江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4460, 413, '锦屏县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4461, 413, '镇远县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4462, 413, '雷山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4463, 413, '麻江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4464, 413, '黄平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4465, 413, '黎平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4466, 414, '三都水族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4467, 414, '平塘县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4468, 414, '惠水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4469, 414, '独山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4470, 414, '瓮安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4471, 414, '福泉市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4472, 414, '罗甸县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4473, 414, '荔波县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4474, 414, '贵定县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4475, 414, '都匀市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4476, 414, '长顺县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4477, 414, '龙里县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4478, 415, '东川区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4479, 415, '五华区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4480, 415, '呈贡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4481, 415, '安宁市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4482, 415, '官渡区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4483, 415, '宜良县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4484, 415, '富民县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4485, 415, '寻甸回族彝族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4486, 415, '嵩明县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4487, 415, '晋宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4488, 415, '盘龙区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4489, 415, '石林彝族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4490, 415, '禄劝彝族苗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4491, 415, '西山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4492, 416, '会泽县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4493, 416, '宣威市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4494, 416, '富源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4495, 416, '师宗县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4496, 416, '沾益县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4497, 416, '罗平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4498, 416, '陆良县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4499, 416, '马龙县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4500, 416, '麒麟区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4501, 417, '元江哈尼族彝族傣族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4502, 417, '华宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4503, 417, '峨山彝族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4504, 417, '新平彝族傣族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4505, 417, '易门县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4506, 417, '江川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4507, 417, '澄江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4508, 417, '红塔区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4509, 417, '通海县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4510, 418, '施甸县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4511, 418, '昌宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4512, 418, '腾冲县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4513, 418, '隆阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4514, 418, '龙陵县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4515, 419, '大关县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4516, 419, '威信县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4517, 419, '巧家县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4518, 419, '彝良县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4519, 419, '昭阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4520, 419, '水富县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4521, 419, '永善县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4522, 419, '盐津县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4523, 419, '绥江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4524, 419, '镇雄县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4525, 419, '鲁甸县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4526, 420, '华坪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4527, 420, '古城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4528, 420, '宁蒗彝族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4529, 420, '永胜县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4530, 420, '玉龙纳西族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4531, 422, '临翔区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4532, 422, '云县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4533, 422, '凤庆县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4534, 422, '双江拉祜族佤族布朗族傣族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4535, 422, '永德县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4536, 422, '沧源佤族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4537, 422, '耿马傣族佤族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4538, 422, '镇康县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4539, 423, '元谋县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4540, 423, '南华县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4541, 423, '双柏县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4542, 423, '大姚县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4543, 423, '姚安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4544, 423, '楚雄市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4545, 423, '武定县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4546, 423, '永仁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4547, 423, '牟定县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4548, 423, '禄丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4549, 424, '个旧市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4550, 424, '元阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4551, 424, '屏边苗族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4552, 424, '建水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4553, 424, '开远市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4554, 424, '弥勒县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4555, 424, '河口瑶族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4556, 424, '泸西县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4557, 424, '石屏县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4558, 424, '红河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4559, 424, '绿春县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4560, 424, '蒙自县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4561, 424, '金平苗族瑶族傣族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4562, 425, '丘北县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4563, 425, '富宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4564, 425, '广南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4565, 425, '文山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4566, 425, '砚山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4567, 425, '西畴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4568, 425, '马关县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4569, 425, '麻栗坡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4570, 426, '勐海县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4571, 426, '勐腊县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4572, 426, '景洪市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4573, 427, '云龙县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4574, 427, '剑川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4575, 427, '南涧彝族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4576, 427, '大理市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4577, 427, '宾川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4578, 427, '巍山彝族回族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4579, 427, '弥渡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4580, 427, '永平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4581, 427, '洱源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4582, 427, '漾濞彝族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4583, 427, '祥云县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4584, 427, '鹤庆县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4585, 428, '梁河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4586, 428, '潞西市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4587, 428, '瑞丽市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4588, 428, '盈江县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4589, 428, '陇川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4590, 430, '德钦县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4591, 430, '维西傈僳族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4592, 430, '香格里拉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4593, 431, '城关区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4594, 431, '堆龙德庆县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4595, 431, '墨竹工卡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4596, 431, '尼木县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4597, 431, '当雄县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4598, 431, '曲水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4599, 431, '林周县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4600, 431, '达孜县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4601, 432, '丁青县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4602, 432, '八宿县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4603, 432, '察雅县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4604, 432, '左贡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4605, 432, '昌都县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4606, 432, '江达县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4607, 432, '洛隆县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4608, 432, '类乌齐县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4609, 432, '芒康县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4610, 432, '贡觉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4611, 432, '边坝县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4612, 433, '乃东县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4613, 433, '加查县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4614, 433, '扎囊县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4615, 433, '措美县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4616, 433, '曲松县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4617, 433, '桑日县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4618, 433, '洛扎县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4619, 433, '浪卡子县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4620, 433, '琼结县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4621, 433, '贡嘎县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4622, 433, '错那县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4623, 433, '隆子县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4624, 434, '亚东县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4625, 434, '仁布县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4626, 434, '仲巴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4627, 434, '南木林县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4628, 434, '吉隆县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4629, 434, '定日县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4630, 434, '定结县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4631, 434, '岗巴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4632, 434, '康马县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4633, 434, '拉孜县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4634, 434, '日喀则市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4635, 434, '昂仁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4636, 434, '江孜县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4637, 434, '白朗县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4638, 434, '聂拉木县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4639, 434, '萨嘎县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4640, 434, '萨迦县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4641, 434, '谢通门县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4642, 435, '嘉黎县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4643, 435, '安多县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4644, 435, '尼玛县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4645, 435, '巴青县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4646, 435, '比如县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4647, 435, '班戈县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4648, 435, '申扎县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4649, 435, '索县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4650, 435, '聂荣县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4651, 435, '那曲县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4652, 436, '噶尔县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4653, 436, '措勤县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4654, 436, '改则县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4655, 436, '日土县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4656, 436, '普兰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4657, 436, '札达县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4658, 436, '革吉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4659, 437, '墨脱县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4660, 437, '察隅县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4661, 437, '工布江达县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4662, 437, '朗县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4663, 437, '林芝县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4664, 437, '波密县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4665, 437, '米林县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4666, 438, '临潼区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4667, 438, '周至县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4668, 438, '户县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4669, 438, '新城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4670, 438, '未央区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4671, 438, '灞桥区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4672, 438, '碑林区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4673, 438, '莲湖区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4674, 438, '蓝田县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4675, 438, '长安区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4676, 438, '阎良区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4677, 438, '雁塔区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4678, 438, '高陵县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4679, 439, '印台区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4680, 439, '宜君县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4681, 439, '王益区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4682, 439, '耀州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4683, 440, '凤县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4684, 440, '凤翔县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4685, 440, '千阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4686, 440, '太白县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4687, 440, '岐山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4688, 440, '扶风县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4689, 440, '渭滨区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4690, 440, '眉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4691, 440, '金台区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4692, 440, '陇县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4693, 440, '陈仓区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4694, 440, '麟游县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4695, 441, '三原县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4696, 441, '干县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4697, 441, '兴平市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4698, 441, '彬县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4699, 441, '旬邑县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4700, 441, '杨陵区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4701, 441, '武功县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4702, 441, '永寿县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4703, 441, '泾阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4704, 441, '淳化县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4705, 441, '渭城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4706, 441, '礼泉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4707, 441, '秦都区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4708, 441, '长武县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4709, 442, '临渭区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4710, 442, '华县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4711, 442, '华阴市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4712, 442, '合阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4713, 442, '大荔县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4714, 442, '富平县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4715, 442, '潼关县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4716, 442, '澄城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4717, 442, '白水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4718, 442, '蒲城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4719, 442, '韩城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4720, 443, '吴起县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4721, 443, '子长县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4722, 443, '安塞县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4723, 443, '宜川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4724, 443, '宝塔区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4725, 443, '富县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4726, 443, '延川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4727, 443, '延长县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4728, 443, '志丹县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4729, 443, '洛川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4730, 443, '甘泉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4731, 443, '黄陵县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4732, 443, '黄龙县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4733, 444, '佛坪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4734, 444, '勉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4735, 444, '南郑县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4736, 444, '城固县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4737, 444, '宁强县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4738, 444, '汉台区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4739, 444, '洋县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4740, 444, '留坝县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4741, 444, '略阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4742, 444, '西乡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4743, 444, '镇巴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4744, 445, '佳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4745, 445, '吴堡县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4746, 445, '子洲县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4747, 445, '定边县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4748, 445, '府谷县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4749, 445, '榆林市榆阳区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4750, 445, '横山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4751, 445, '清涧县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4752, 445, '神木县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4753, 445, '米脂县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4754, 445, '绥德县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4755, 445, '靖边县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4756, 446, '宁陕县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4757, 446, '岚皋县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4758, 446, '平利县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4759, 446, '旬阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4760, 446, '汉滨区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4761, 446, '汉阴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4762, 446, '白河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4763, 446, '石泉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4764, 446, '紫阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4765, 446, '镇坪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4766, 447, '丹凤县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4767, 447, '商南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4768, 447, '商州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4769, 447, '山阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4770, 447, '柞水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4771, 447, '洛南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4772, 447, '镇安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4773, 448, '七里河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4774, 448, '城关区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4775, 448, '安宁区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4776, 448, '榆中县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4777, 448, '永登县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4778, 448, '皋兰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4779, 448, '红古区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4780, 448, '西固区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4781, 449, '嘉峪关市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4782, 450, '永昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4783, 450, '金川区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4784, 451, '会宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4785, 451, '平川区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4786, 451, '景泰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4787, 451, '白银区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4788, 451, '靖远县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4789, 452, '张家川回族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4790, 452, '武山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4791, 452, '清水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4792, 452, '甘谷县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4793, 452, '秦安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4794, 452, '秦州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4795, 452, '麦积区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4796, 453, '凉州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4797, 453, '古浪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4798, 453, '天祝藏族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4799, 453, '民勤县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4800, 454, '临泽县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4801, 454, '山丹县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4802, 454, '民乐县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4803, 454, '甘州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4804, 454, '肃南裕固族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4805, 454, '高台县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4806, 455, '华亭县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4807, 455, '崆峒区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4808, 455, '崇信县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4809, 455, '庄浪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4810, 455, '泾川县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4811, 455, '灵台县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4812, 455, '静宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4813, 456, '敦煌市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4814, 456, '玉门市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4815, 456, '瓜州县（原安西县）', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4816, 456, '肃北蒙古族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4817, 456, '肃州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4818, 456, '金塔县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4819, 456, '阿克塞哈萨克族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4820, 457, '华池县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4821, 457, '合水县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4822, 457, '宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4823, 457, '庆城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4824, 457, '正宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4825, 457, '环县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4826, 457, '西峰区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4827, 457, '镇原县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4828, 458, '临洮县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4829, 458, '安定区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4830, 458, '岷县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4831, 458, '渭源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4832, 458, '漳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4833, 458, '通渭县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4834, 458, '陇西县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4835, 459, '两当县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4836, 459, '宕昌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4837, 459, '康县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4838, 459, '徽县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4839, 459, '成县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4840, 459, '文县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4841, 459, '武都区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4842, 459, '礼县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4843, 459, '西和县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4844, 460, '东乡族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4845, 460, '临夏县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4846, 460, '临夏市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4847, 460, '和政县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4848, 460, '广河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4849, 460, '康乐县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4850, 460, '永靖县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4851, 460, '积石山保安族东乡族撒拉族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4852, 461, '临潭县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4853, 461, '卓尼县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4854, 461, '合作市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4855, 461, '夏河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4856, 461, '玛曲县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4857, 461, '碌曲县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4858, 461, '舟曲县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4859, 461, '迭部县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4860, 462, '城东区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4861, 462, '城中区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4862, 462, '城北区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4863, 462, '城西区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4864, 462, '大通回族土族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4865, 462, '湟中县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4866, 462, '湟源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4867, 463, '乐都县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4868, 463, '互助土族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4869, 463, '化隆回族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4870, 463, '平安县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4871, 463, '循化撒拉族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4872, 463, '民和回族土族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4873, 464, '刚察县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4874, 464, '海晏县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4875, 464, '祁连县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4876, 464, '门源回族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4877, 465, '同仁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4878, 465, '尖扎县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4879, 465, '河南蒙古族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4880, 465, '泽库县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4881, 466, '共和县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4882, 466, '兴海县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4883, 466, '同德县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4884, 466, '贵南县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4885, 466, '贵德县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4886, 467, '久治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4887, 467, '玛多县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4888, 467, '玛沁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4889, 467, '班玛县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4890, 467, '甘德县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4891, 467, '达日县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4892, 468, '囊谦县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4893, 468, '曲麻莱县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4894, 468, '杂多县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4895, 468, '治多县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4896, 468, '玉树县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4897, 468, '称多县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4898, 469, '乌兰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4899, 469, '冷湖行委', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4900, 469, '大柴旦行委', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4901, 469, '天峻县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4902, 469, '德令哈市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4903, 469, '格尔木市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4904, 469, '茫崖行委', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4905, 469, '都兰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4906, 470, '兴庆区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4907, 470, '永宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4908, 470, '灵武市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4909, 470, '西夏区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4910, 470, '贺兰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4911, 470, '金凤区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4912, 471, '大武口区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4913, 471, '平罗县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4914, 471, '惠农区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4915, 472, '利通区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4916, 472, '同心县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4917, 472, '盐池县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4918, 472, '青铜峡市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4919, 473, '原州区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4920, 473, '彭阳县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4921, 473, '泾源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4922, 473, '西吉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4923, 473, '隆德县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4924, 474, '中宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4925, 474, '沙坡头区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4926, 474, '海原县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4927, 475, '东山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4928, 475, '乌鲁木齐县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4929, 475, '天山区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4930, 475, '头屯河区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4931, 475, '新市区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4932, 475, '水磨沟区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4933, 475, '沙依巴克区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4934, 475, '达坂城区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4935, 476, '乌尔禾区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4936, 476, '克拉玛依区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4937, 476, '独山子区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4938, 476, '白碱滩区', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4939, 477, '吐鲁番市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4940, 477, '托克逊县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4941, 477, '鄯善县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4942, 478, '伊吾县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4943, 478, '哈密市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4944, 478, '巴里坤哈萨克自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4945, 479, '吉木萨尔县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4946, 479, '呼图壁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4947, 479, '奇台县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4948, 479, '昌吉市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4949, 479, '木垒哈萨克自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4950, 479, '玛纳斯县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4951, 479, '米泉市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4952, 479, '阜康市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4953, 480, '博乐市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4954, 480, '温泉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4955, 480, '精河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4956, 481, '博湖县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4957, 481, '和硕县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4958, 481, '和静县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4959, 481, '尉犁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4960, 481, '库尔勒市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4961, 481, '焉耆回族自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4962, 481, '若羌县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4963, 481, '轮台县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4964, 482, '乌什县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4965, 482, '库车县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4966, 482, '拜城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4967, 482, '新和县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4968, 482, '柯坪县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4969, 482, '沙雅县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4970, 482, '温宿县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4971, 482, '阿克苏市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4972, 482, '阿瓦提县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4973, 483, '乌恰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4974, 483, '阿克陶县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4975, 483, '阿合奇县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4976, 483, '阿图什市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4977, 484, '伽师县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4978, 484, '叶城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4979, 484, '喀什市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4980, 484, '塔什库尔干塔吉克自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4981, 484, '岳普湖县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4982, 484, '巴楚县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4983, 484, '泽普县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4984, 484, '疏勒县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4985, 484, '疏附县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4986, 484, '英吉沙县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4987, 484, '莎车县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4988, 484, '麦盖提县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4989, 485, '于田县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4990, 485, '和田县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4991, 485, '和田市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4992, 485, '墨玉县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4993, 485, '民丰县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4994, 485, '洛浦县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4995, 485, '皮山县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4996, 485, '策勒县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4997, 486, '伊宁县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4998, 486, '伊宁市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (4999, 486, '奎屯市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5000, 486, '察布查尔锡伯自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5001, 486, '尼勒克县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5002, 486, '巩留县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5003, 486, '新源县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5004, 486, '昭苏县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5005, 486, '特克斯县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5006, 486, '霍城县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5007, 487, '乌苏市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5008, 487, '和布克赛尔蒙古自治县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5009, 487, '塔城市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5010, 487, '托里县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5011, 487, '沙湾县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5012, 487, '裕民县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5013, 487, '额敏县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5014, 488, '吉木乃县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5015, 488, '哈巴河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5016, 488, '富蕴县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5017, 488, '布尔津县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5018, 488, '福海县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5019, 488, '阿勒泰市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5020, 488, '青河县', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5021, 489, '石河子市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5022, 490, '阿拉尔市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5023, 491, '图木舒克市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5024, 492, '五家渠市', 3, '', 0, 1, 0, 0);
INSERT INTO `region` VALUES (5025, 566, '其它', 3, '', 0, 1, 0, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `openid_alipay` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '支付宝openid',
  `openid_weixin` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '微信openid',
  `unionid_weixin` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '微信unionid',
  `openid_weixin_web` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '微信web用户openid',
  `openid_baidu` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '百度openid',
  `openid_toutiao` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '百度openid',
  `openid_qq` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'QQopenid',
  `unionid_qq` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'QQunionid',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态（0正常, 1禁止登录）',
  `salt` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '配合密码加密串',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录密码',
  `token` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'token',
  `token_expire` int(11) NULL DEFAULT NULL COMMENT 'token有效时间',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '电子邮箱（最大长度60个字符）',
  `gender` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '性别（0保密，1男，2女）',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户头像地址',
  `province` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '所在省',
  `city` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '所在市',
  `birthday` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '生日',
  `address` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '详细地址',
  `integral` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '积分',
  `locking_integral` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '锁定积分',
  `referrer` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '推荐人用户id',
  `is_delete_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '是否已删除（0否, 大于0删除时间）',
  `last_login` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '最后登录时间',
  `last_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录ip',
  `create_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `token`(`token`) USING BTREE,
  INDEX `nickname`(`nickname`) USING BTREE,
  INDEX `openid_weixin`(`openid_weixin`) USING BTREE,
  INDEX `openid_weixin_web`(`openid_weixin_web`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `tag` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `tel` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电话',
  `province` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所在省',
  `city` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所在市',
  `county` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所在县/区',
  `address` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `lng` decimal(13, 10) UNSIGNED NOT NULL DEFAULT 0.0000000000 COMMENT '经度',
  `lat` decimal(13, 10) UNSIGNED NOT NULL DEFAULT 0.0000000000 COMMENT '纬度',
  `is_default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否默认地址（0否, 1是）',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_favorites
-- ----------------------------
DROP TABLE IF EXISTS `user_favorites`;
CREATE TABLE `user_favorites`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goods_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户商品收藏' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详情',
  `business_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '业务id',
  `business_type` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '业务类型（0默认, 1订单, 2充值, 3提现,  ...）',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消息类型（0普通通知, ...）',
  `is_read` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否已读（0否, 1是）',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_search
-- ----------------------------
DROP TABLE IF EXISTS `user_search`;
CREATE TABLE `user_search` (
                               `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
                               `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
                               `keyword` varchar(255) DEFAULT NULL COMMENT '关键词',
                               `create_time` int(11) unsigned DEFAULT '0' COMMENT '添加时间',
                               `update_time` int(11) unsigned DEFAULT NULL COMMENT '编辑时间',
                               PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='用户搜索记录';

-- ----------------------------
-- Table structure for wallet
-- ----------------------------
DROP TABLE IF EXISTS `wallet`;
CREATE TABLE `wallet`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态（0正常, 1异常, 2已注销）',
  `normal_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '有效金额（包含赠送金额）',
  `frozen_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '冻结金额',
  `give_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '赠送金额（所有赠送金额总计）',
  `earnest_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '保证金',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id_unique`(`user_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '钱包' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wallet_log
-- ----------------------------
DROP TABLE IF EXISTS `wallet_log`;
CREATE TABLE `wallet_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `wallet_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '钱包id',
  `serial_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '流水号',
  `business_type` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '业务类型（0系统, 1充值, 2提现, 3消费）',
  `money_type` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '金额类型（0正常, 1冻结, 2赠送）',
  `operation_type` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作类型（ 0减少, 1增加）',
  `operation_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '操作金额',
  `original_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '原始金额',
  `latest_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '最新金额',
  `msg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变更说明',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `serial_no_unique`(`serial_no`) USING BTREE,
  INDEX `wallet_id`(`wallet_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '钱包日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wallet_recharge
-- ----------------------------
DROP TABLE IF EXISTS `wallet_recharge`;
CREATE TABLE `wallet_recharge`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `wallet_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '钱包id',
  `recharge_no` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '充值单号',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态（0未支付, 1已支付）',
  `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '金额',
  `pay_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '支付金额',
  `payment_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付方式(1微信)',
  `pay_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付时间',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `recharge_no`(`recharge_no`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '钱包充值' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wallet_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `wallet_withdraw`;
CREATE TABLE `wallet_withdraw`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `wallet_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '钱包id',
  `withdraw_no` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '提现单号',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态（0未打款, 1已打款, 2已拒绝）',
  `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '提现金额',
  `pay_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '打款金额',
  `channel_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收款银行',
  `channel_accounts` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收款账号',
  `channel_username` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '开户人姓名',
  `msg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述（用户可见）',
  `pay_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '打款时间',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cash_no`(`withdraw_no`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `wallet_id`(`wallet_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '钱包提现' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wallet_withdraw_channel
-- ----------------------------
DROP TABLE IF EXISTS `wallet_withdraw_channel`;
CREATE TABLE `wallet_withdraw_channel`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `wallet_id` int(11) UNSIGNED NOT NULL COMMENT '钱包id',
  `channel_type` tinyint(1) NOT NULL COMMENT '提现方式类型',
  `channel_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开户行',
  `channel_accounts` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收款账号',
  `channel_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收款人姓名',
  `create_time` int(11) UNSIGNED NOT NULL COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '提现方式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_history
-- ----------------------------
DROP TABLE IF EXISTS `goods_history`;
CREATE TABLE `goods_history` (
                                 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
                                 `goods_id` int(11) unsigned NOT NULL COMMENT '商品id',
                                 `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
                                 `create_time` int(11) unsigned NOT NULL COMMENT '添加时间',
                                 `update_time` int(11) unsigned NOT NULL COMMENT '编辑时间',
                                 PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT = 1 DEFAULT CHARSET=utf8mb4 COMMENT='商品足迹';

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
                          `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
                          `name` varchar(30) NOT NULL DEFAULT '' COMMENT '名称',
                          `desc` varchar(60) NOT NULL DEFAULT '' COMMENT '描述',
                          `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券类型（0满减劵, 1折扣劵）',
                          `value` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '减免金额 | 折扣系数 0-10，9.5代表9.5折',
                          `expire_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '到期类型（0领取生效, 1固定日期）',
                          `expire_hour` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '有效小时（单位 时）',
                          `start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '限时开始时间',
                          `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '限时结束时间',
                          `min_order_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单最低金额',
                          `apply_range` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '适用范围(0全部商品 1商品分类 2指定商品)',
                          `apply_range_config` text COMMENT '关联商品分类id 或 关联商品id（以json存储）',
                          `total_qty` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '限制发放总数量（0则不限）',
                          `receive_qty` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已发放总数量',
                          `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
                          `is_enable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否启用（0否，1是）',
                          `is_user_receive` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开放用户领取（0否, 1是）',
                          `is_reg_send` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否注册即发放（0否, 1是）',
                          `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
                          `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
                          PRIMARY KEY (`id`),
                          KEY `type` (`type`),
                          KEY `is_enable` (`is_enable`),
                          KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='优惠券';

-- ----------------------------
-- Table structure for coupon_user
-- ----------------------------
CREATE TABLE `coupon_user` (
                               `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
                               `coupon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券id',
                               `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
                               `start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '有效开始时间',
                               `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '有效结束时间',
                               `order_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '使用关联的订单id',
                               `use_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '使用时间',
                               `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
                               `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
                               PRIMARY KEY (`id`),
                               KEY `coupon_id` (`coupon_id`),
                               KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户优惠券';

SET FOREIGN_KEY_CHECKS = 1;