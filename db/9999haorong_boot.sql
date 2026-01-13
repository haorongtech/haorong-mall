create database `haorong_boot` default character set utf8mb4 collate utf8mb4_general_ci;

USE haorong_boot;

-- ----------------------------
-- Table structure for coupon_goods
-- ----------------------------
DROP TABLE IF EXISTS `coupon_goods`;
CREATE TABLE `coupon_goods`  (
                                 `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                 `coupon_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '优惠券id',
                                 `spu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品id',
                                 `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                 `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                 `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                 `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                 `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                 `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠券关联商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupon_goods
-- ----------------------------

-- ----------------------------
-- Table structure for coupon_info
-- ----------------------------
DROP TABLE IF EXISTS `coupon_info`;
CREATE TABLE `coupon_info`  (
                                `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                `coupon_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '优惠券名称',
                                `coupon_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '优惠券类型：1.满减券；2.折扣券；',
                                `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠金额（元）',
                                `discount` decimal(2, 1) NULL DEFAULT NULL COMMENT '折扣',
                                `threshold` decimal(10, 2) NOT NULL COMMENT '使用门槛  0元表示无门槛',
                                `total_num` int NOT NULL COMMENT '发行数量',
                                `remain_num` int NOT NULL COMMENT '剩余数量',
                                `assign_count` int NOT NULL DEFAULT 0 COMMENT '已发放券数量',
                                `used_count` int NOT NULL DEFAULT 0 COMMENT '已使用数量',
                                `receive_count` int NULL DEFAULT 0 COMMENT '领取限制 0表示无限制',
                                `receive_started_at` datetime NOT NULL COMMENT '有效开始时间',
                                `receive_ended_at` datetime NOT NULL COMMENT '有效结束时间',
                                `use_range` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '可用范围：1.全部商品；2.指定商品；',
                                `spu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品id',
                                `use_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用说明',
                                `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '状态：0.正常；1.关闭；',
                                `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                `version` int NULL DEFAULT 0 COMMENT '版本号',
                                `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠券表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupon_info
-- ----------------------------

-- ----------------------------
-- Table structure for coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `coupon_user`;
CREATE TABLE `coupon_user`  (
                                `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                `coupon_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '优惠券id',
                                `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
                                `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态：0.未使用；1.已使用；2.已过期；3.冻结；',
                                `order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单id',
                                `received_time` datetime NULL DEFAULT NULL COMMENT '领取时间',
                                `validat_time` datetime NULL DEFAULT NULL COMMENT '有效日期',
                                `used_time` datetime NULL DEFAULT NULL COMMENT '使用时间',
                                `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户领券记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupon_user
-- ----------------------------

-- ----------------------------
-- Table structure for goods_appraise
-- ----------------------------
DROP TABLE IF EXISTS `goods_appraise`;
CREATE TABLE `goods_appraise`  (
                                   `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                   `spu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'spu主键',
                                   `order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '订单主键',
                                   `order_item_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单主键',
                                   `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
                                   `avatar_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
                                   `nick_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
                                   `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                   `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                   `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                   `pic_urls` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
                                   `goods_score` int NULL DEFAULT NULL COMMENT '商品评分',
                                   `logistics_score` int NULL DEFAULT NULL COMMENT '物流评分',
                                   `service_score` int NULL DEFAULT NULL COMMENT '服务评分',
                                   `business_reply` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家回复',
                                   `reply_time` datetime NULL DEFAULT NULL COMMENT '回复时间',
                                   `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
                                   `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                   `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                   `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品评价' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_appraise
-- ----------------------------

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category`  (
                                   `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                   `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类目名称',
                                   `parent_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级类目（0.顶级类目）',
                                   `category_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类目图片',
                                   `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类目描述',
                                   `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '状态：0.正常；1.停用；',
                                   `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                   `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                   `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                   `sort` int NULL DEFAULT NULL COMMENT '排序序号',
                                   `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                   `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                   `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品类目' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_category
-- ----------------------------
INSERT INTO `goods_category` VALUES ('1912861788486148097', '家用电器', '0', 'https://minio.ihuanxing.cn/huanxing/file/f65cf2cb-3594-40e3-b720-ea72c9f685ef.png', '家用电器', '0', '2025-04-17 21:32:44', '2025-05-16 10:33:27', '0', 1, '1590229800633634816', 'admin', 'system');
INSERT INTO `goods_category` VALUES ('1912862220591734785', '电视', '1912861788486148097', 'https://minio.ihuanxing.cn/huanxing/file/9baf470c-b17e-417e-88f9-38a3b5f2cf8e.png', '电视', '0', '2025-04-17 21:34:27', NULL, '0', 1, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_category` VALUES ('1912862615531593730', '空调', '1912861788486148097', 'https://minio.ihuanxing.cn/huanxing/file/16e58200-e455-44aa-9c91-66b9d991b5ef.jpg', '空调', '0', '2025-04-17 21:36:01', NULL, '0', 2, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_category` VALUES ('1912863000879079426', '冰箱', '1912861788486148097', 'https://minio.ihuanxing.cn/huanxing/file/1c3abd12-ec0c-4d18-897b-c789203b4f25.jpg', '冰箱', '0', '2025-04-17 21:37:33', NULL, '0', 3, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_category` VALUES ('1912863400222957569', '手机数码', '0', 'https://minio.ihuanxing.cn/huanxing/file/9baf470c-b17e-417e-88f9-38a3b5f2cf8e.png', '手机数码', '0', '2025-04-17 21:39:09', NULL, '0', 2, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_category` VALUES ('1912863683464306689', '手机', '1912863400222957569', 'https://minio.ihuanxing.cn/huanxing/file/cb7c6390-1602-4f66-a4fc-94bbb9adbf35.jpg', '手机', '0', '2025-04-17 21:40:16', NULL, '0', 1, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_category` VALUES ('1912863991967948801', '智能设备', '1912863400222957569', 'https://minio.ihuanxing.cn/huanxing/file/8c25a91d-91b4-4728-8f20-4880fad18677.jpg', '智能设备', '0', '2025-04-17 21:41:30', NULL, '0', 2, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_category` VALUES ('1912864294511484929', '无人机', '1912863400222957569', 'https://minio.ihuanxing.cn/huanxing/file/0f4b0f37-0844-4c43-a1d7-231eadc61ddb.jpg', '无人机', '0', '2025-04-17 21:42:42', NULL, '0', 3, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_category` VALUES ('1925541056051564546', '电脑', '1912863400222957569', 'https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/e1a4f623-6773-4eea-9f78-c22ca4d4c12b.jpg', NULL, '0', '2025-05-22 21:15:37', NULL, '0', 4, '1590229800633634816', 'system', NULL);

-- ----------------------------
-- Table structure for goods_collect
-- ----------------------------
DROP TABLE IF EXISTS `goods_collect`;
CREATE TABLE `goods_collect`  (
                                  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
                                  `spu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品id',
                                  `sales_price` decimal(10, 2) NOT NULL COMMENT '加入时销售价格（元）',
                                  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                  `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0、显示；1、隐藏',
                                  `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                  `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                  `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                  PRIMARY KEY (`id`) USING BTREE,
                                  UNIQUE INDEX `uc_user_spu_id`(`user_id` ASC, `spu_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品收藏' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_collect
-- ----------------------------

-- ----------------------------
-- Table structure for goods_footprint
-- ----------------------------
DROP TABLE IF EXISTS `goods_footprint`;
CREATE TABLE `goods_footprint`  (
                                    `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                    `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户主键',
                                    `spu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品主键',
                                    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                    `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                    `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                    `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                    `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品足迹' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_footprint
-- ----------------------------

-- ----------------------------
-- Table structure for goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku`;
CREATE TABLE `goods_sku`  (
                              `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                              `spu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'spuId',
                              `sales_price` decimal(10, 2) NOT NULL COMMENT '销售价格（元）',
                              `original_price` decimal(10, 2) NOT NULL COMMENT '原价（元）',
                              `cost_price` decimal(10, 2) NOT NULL COMMENT '成本价（元）',
                              `stock` int NOT NULL DEFAULT 0 COMMENT '库存',
                              `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '重量',
                              `volume` decimal(10, 2) NULL DEFAULT NULL COMMENT '体积',
                              `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                              `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                              `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                              `version` int NULL DEFAULT 0 COMMENT '版本号',
                              `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                              `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                              `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                              `specs_json` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SKU规格信息',
                              `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品SKU' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_sku
-- ----------------------------
INSERT INTO `goods_sku` VALUES ('1912867578517299201', '1912867577569386497', 9499.00, 9499.00, 9499.00, 71, 0.00, 0.00, '2025-04-17 21:55:45', '2025-07-15 23:34:04', '0', 0, '1590229800633634816', 'admin', NULL, NULL, '0');
INSERT INTO `goods_sku` VALUES ('1912867579440046081', '1912867577569386497', 11299.00, 11299.00, 9299.00, 99, 0.00, 0.00, '2025-04-17 21:55:45', '2025-05-29 23:24:55', '0', 0, '1590229800633634816', 'admin', 'system', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1912867580371181569', '1912867577569386497', 13299.00, 13299.00, 9299.00, 100, 0.00, 0.00, '2025-04-17 21:55:45', '2025-05-29 23:24:55', '0', 0, '1590229800633634816', 'admin', 'system', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1912867581298122754', '1912867577569386497', 9299.00, 9299.00, 9299.00, 99, 0.00, 0.00, '2025-04-17 21:55:45', '2025-05-29 23:24:55', '0', 0, '1590229800633634816', 'admin', 'system', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1912867582258618370', '1912867577569386497', 11299.00, 11299.00, 9299.00, 98, 0.00, 0.00, '2025-04-17 21:55:46', '2025-06-10 10:34:06', '0', 0, '1590229800633634816', 'admin', NULL, NULL, '0');
INSERT INTO `goods_sku` VALUES ('1912867583248474114', '1912867577569386497', 13299.00, 13299.00, 9299.00, 100, 0.00, 0.00, '2025-04-17 21:55:46', '2025-06-17 22:18:20', '0', 0, '1590229800633634816', 'admin', NULL, NULL, '0');
INSERT INTO `goods_sku` VALUES ('1912867584276078593', '1912867577569386497', 9299.00, 9299.00, 9299.00, 93, 0.00, 0.00, '2025-04-17 21:55:46', '2025-07-15 23:34:04', '0', 0, '1590229800633634816', 'admin', NULL, NULL, '0');
INSERT INTO `goods_sku` VALUES ('1912867585219796994', '1912867577569386497', 11299.00, 11299.00, 9299.00, 74, 0.00, 0.00, '2025-04-17 21:55:46', '2025-05-29 23:24:56', '0', 0, '1590229800633634816', 'admin', 'system', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1912867586150932481', '1912867577569386497', 13299.00, 13299.00, 9299.00, 98, 0.00, 0.00, '2025-04-17 21:55:47', '2025-05-29 23:24:56', '0', 0, '1590229800633634816', 'admin', 'system', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1912867587086262274', '1912867577569386497', 9299.00, 9299.00, 9299.00, 98, 0.00, 0.00, '2025-04-17 21:55:47', '2025-06-21 00:05:04', '0', 0, '1590229800633634816', 'admin', '176****3397', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1912867588017397761', '1912867577569386497', 11299.00, 11299.00, 9299.00, 100, 0.00, 0.00, '2025-04-17 21:55:47', '2025-05-29 23:24:56', '0', 0, '1590229800633634816', 'admin', 'system', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1912867588935950337', '1912867577569386497', 9299.00, 9299.00, 9299.00, 100, 0.00, 0.00, '2025-04-17 21:55:47', '2025-05-29 23:24:56', '0', 0, '1590229800633634816', 'admin', 'system', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1912882762380124162', '1912882761411239938', 5999.00, 5999.00, 5999.00, 973, 12.00, NULL, '2025-04-17 22:56:05', '2025-06-21 00:05:05', '0', 0, '1590229800633634816', 'admin', '176****3397', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1913460546643709954', '1913460322839842818', 10.00, 10.00, 10.00, 1110, 0.00, NULL, '2025-04-19 13:11:59', '2025-04-19 13:42:46', '0', 0, '1590229800633634816', 'admin', NULL, NULL, '0');
INSERT INTO `goods_sku` VALUES ('1919013944788389889', '1912870113080680449', 9999.00, 9999.00, 9999.00, 9969, 0.00, 0.00, '2025-05-04 20:59:13', '2025-07-15 23:34:04', '0', 0, '1590229800633634816', 'system', NULL, NULL, '0');
INSERT INTO `goods_sku` VALUES ('1919013945459478529', '1912870113080680449', 9999.00, 9999.00, 9999.00, 9999, 0.00, 0.00, '2025-05-04 20:59:13', '2025-07-12 23:21:25', '0', 0, '1590229800633634816', 'system', 'system', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1919013946130567170', '1912870113080680449', 9999.00, 9999.00, 9999.00, 9996, 0.00, 0.00, '2025-05-04 20:59:13', '2025-07-12 23:21:25', '0', 0, '1590229800633634816', 'system', 'system', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1919013946784878594', '1912870113080680449', 9999.00, 9999.00, 9999.00, 9999, 0.00, 0.00, '2025-05-04 20:59:13', '2025-07-12 23:21:25', '0', 0, '1590229800633634816', 'system', 'system', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1919013947439190017', '1912870113080680449', 9999.00, 9999.00, 9999.00, 0, 0.00, 0.00, '2025-05-04 20:59:13', '2025-07-12 23:21:25', '0', 0, '1590229800633634816', 'system', 'system', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1919013948089307138', '1912870113080680449', 9999.00, 9999.00, 9999.00, 9998, 0.00, 0.00, '2025-05-04 20:59:13', '2025-07-12 23:21:25', '0', 0, '1590229800633634816', 'system', 'system', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1919013948756201474', '1912870113080680449', 9999.00, 9999.00, 9999.00, 9998, 0.00, 0.00, '2025-05-04 20:59:14', '2025-07-12 23:21:25', '0', 0, '1590229800633634816', 'system', 'system', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1919013949393735681', '1912870113080680449', 9999.00, 9999.00, 9999.00, 9996, 0.00, 0.00, '2025-05-04 20:59:14', '2025-07-12 23:21:25', '0', 0, '1590229800633634816', 'system', 'system', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1925543037348499457', '1925543036622884866', 25999.00, 25999.00, 25999.00, 997, 1.16, NULL, '2025-05-22 21:23:30', '2025-06-21 00:05:06', '0', 0, '1590229800633634816', 'system', '176****3397', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1925543038044753922', '1925543036622884866', 25999.00, 25999.00, 25999.00, 1000, 1.16, NULL, '2025-05-22 21:23:30', NULL, '0', 0, '1590229800633634816', 'system', NULL, NULL, '0');
INSERT INTO `goods_sku` VALUES ('1925543038707453953', '1925543036622884866', 25999.00, 25999.00, 25999.00, 1000, 1.16, NULL, '2025-05-22 21:23:30', NULL, '0', 0, '1590229800633634816', 'system', NULL, NULL, '0');
INSERT INTO `goods_sku` VALUES ('1925543039374348290', '1925543036622884866', 25999.00, 25999.00, 25999.00, 1000, 1.16, NULL, '2025-05-22 21:23:30', NULL, '0', 0, '1590229800633634816', 'system', NULL, NULL, '0');
INSERT INTO `goods_sku` VALUES ('1925545887055106050', '1925545886404988929', 13999.00, 13999.00, 13999.00, 999, 1.21, NULL, '2025-05-22 21:34:49', '2025-05-22 22:21:59', '1', 0, '1590229800633634816', 'system', '176****3397', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1925545887751360514', '1925545886404988929', 14999.00, 14999.00, 14999.00, 1000, 1.21, NULL, '2025-05-22 21:34:49', NULL, '1', 0, '1590229800633634816', 'system', NULL, NULL, '0');
INSERT INTO `goods_sku` VALUES ('1925545888388894721', '1925545886404988929', 13999.00, 13999.00, 13999.00, 1000, 1.21, NULL, '2025-05-22 21:34:49', '2025-06-05 14:49:47', '1', 0, '1590229800633634816', 'system', NULL, NULL, '0');
INSERT INTO `goods_sku` VALUES ('1925545889055789058', '1925545886404988929', 14999.00, 14999.00, 14999.00, 1000, 1.21, NULL, '2025-05-22 21:34:50', NULL, '1', 0, '1590229800633634816', 'system', NULL, NULL, '0');
INSERT INTO `goods_sku` VALUES ('1925545889714294786', '1925545886404988929', 13999.00, 13999.00, 13996.00, 1000, 1.21, NULL, '2025-05-22 21:34:50', NULL, '1', 0, '1590229800633634816', 'system', NULL, NULL, '0');
INSERT INTO `goods_sku` VALUES ('1925545890393772033', '1925545886404988929', 14999.00, 14999.00, 14999.00, 1000, 1.21, NULL, '2025-05-22 21:34:50', NULL, '1', 0, '1590229800633634816', 'system', NULL, NULL, '0');
INSERT INTO `goods_sku` VALUES ('1936287290845110273', '1925545886404988929', 0.00, 0.00, 0.00, 0, 0.00, 0.00, '2025-06-21 12:57:19', '2025-06-22 22:02:21', '0', 0, '1590229800633634816', 'system', 'admin', NULL, '0');
INSERT INTO `goods_sku` VALUES ('1936287291935629314', '1925545886404988929', 0.00, 0.00, 0.00, 0, 0.00, 0.00, '2025-06-21 12:57:20', '2025-06-22 22:02:21', '0', 0, '1590229800633634816', 'system', 'admin', NULL, '0');

-- ----------------------------
-- Table structure for goods_sku_specs_value
-- ----------------------------
DROP TABLE IF EXISTS `goods_sku_specs_value`;
CREATE TABLE `goods_sku_specs_value`  (
                                          `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                          `sku_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'skuId',
                                          `specs_value_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格值主键',
                                          `sort` int NOT NULL COMMENT '排序字段',
                                          `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                          `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                          `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                          `spu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spuId',
                                          `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
                                          `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                          `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                          `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品sku关联规格值' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_sku_specs_value
-- ----------------------------
INSERT INTO `goods_sku_specs_value` VALUES ('1918685814869635073', '1912867578517299201', '1912866747504041986', 0, '2025-05-03 23:15:20', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685815544918017', '1912867578517299201', '1912866886893346818', 1, '2025-05-03 23:15:21', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685816228589570', '1912867579440046081', '1912866747504041986', 0, '2025-05-03 23:15:21', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685816882900993', '1912867579440046081', '1912866927229968386', 1, '2025-05-03 23:15:21', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685817537212417', '1912867580371181569', '1912866747504041986', 0, '2025-05-03 23:15:21', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685818279604225', '1912867580371181569', '1912866949661106178', 1, '2025-05-03 23:15:21', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685818933915649', '1912867581298122754', '1912866787874217985', 0, '2025-05-03 23:15:21', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685819676307457', '1912867581298122754', '1912866886893346818', 1, '2025-05-03 23:15:22', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685820343201794', '1912867582258618370', '1912866787874217985', 0, '2025-05-03 23:15:22', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685821052039169', '1912867582258618370', '1912866927229968386', 1, '2025-05-03 23:15:22', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685821727322114', '1912867583248474114', '1912866787874217985', 0, '2025-05-03 23:15:22', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685822440353793', '1912867583248474114', '1912866949661106178', 1, '2025-05-03 23:15:22', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685823249854466', '1912867584276078593', '1912866817397923842', 0, '2025-05-03 23:15:22', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685823925137409', '1912867584276078593', '1912866886893346818', 1, '2025-05-03 23:15:23', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685824596226049', '1912867585219796994', '1912866817397923842', 0, '2025-05-03 23:15:23', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685825267314689', '1912867585219796994', '1912866927229968386', 1, '2025-05-03 23:15:23', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685825976152065', '1912867586150932481', '1912866817397923842', 0, '2025-05-03 23:15:23', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685826626269185', '1912867586150932481', '1912866949661106178', 1, '2025-05-03 23:15:23', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685827272192001', '1912867587086262274', '1912866843499077633', 0, '2025-05-03 23:15:23', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685827972640770', '1912867587086262274', '1912866886893346818', 1, '2025-05-03 23:15:24', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685828635340801', '1912867588017397761', '1912866843499077633', 0, '2025-05-03 23:15:24', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685829277069313', '1912867588017397761', '1912866927229968386', 1, '2025-05-03 23:15:24', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685829931380737', '1912867588935950337', '1912866843499077633', 0, '2025-05-03 23:15:24', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1918685830623440897', '1912867588935950337', '1912866949661106178', 1, '2025-05-03 23:15:24', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013951906123777', '1919013944788389889', '1912869461206147074', 0, '2025-05-04 20:59:14', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013952560435201', '1919013944788389889', '1912869653045223426', 1, '2025-05-04 20:59:15', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013953223135234', '1919013945459478529', '1912869461206147074', 0, '2025-05-04 20:59:15', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013953869058049', '1919013945459478529', '1912869723891212289', 1, '2025-05-04 20:59:15', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013954531758081', '1919013946130567170', '1912869494215319554', 0, '2025-05-04 20:59:15', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013955181875201', '1919013946130567170', '1912869653045223426', 1, '2025-05-04 20:59:15', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013955823603713', '1919013946784878594', '1912869494215319554', 0, '2025-05-04 20:59:15', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013956469526529', '1919013946784878594', '1912869723891212289', 1, '2025-05-04 20:59:15', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013957128032257', '1919013947439190017', '1912869535868952578', 0, '2025-05-04 20:59:16', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013957778149377', '1919013947439190017', '1912869653045223426', 1, '2025-05-04 20:59:16', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013958432460802', '1919013948089307138', '1912869535868952578', 0, '2025-05-04 20:59:16', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013959086772226', '1919013948089307138', '1912869723891212289', 1, '2025-05-04 20:59:16', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013959762055169', '1919013948756201474', '1912869571721863169', 0, '2025-05-04 20:59:16', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013960403783681', '1919013948756201474', '1912869653045223426', 1, '2025-05-04 20:59:16', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013961066483713', '1919013949393735681', '1912869571721863169', 0, '2025-05-04 20:59:17', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013961704017922', '1919013949393735681', '1912869723891212289', 1, '2025-05-04 20:59:17', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925543041379225602', '1925543037348499457', '1925541940366036993', 0, '2025-05-22 21:23:31', NULL, '0', '1925543036622884866', 'https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/f818bd69-14e6-4c24-88f2-dfc9c8687750.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925543042037731330', '1925543037348499457', '1925542130414145538', 1, '2025-05-22 21:23:31', NULL, '0', '1925543036622884866', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925543042742374402', '1925543038044753922', '1925541940366036993', 0, '2025-05-22 21:23:31', NULL, '0', '1925543036622884866', 'https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/f818bd69-14e6-4c24-88f2-dfc9c8687750.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925543043421851649', '1925543038044753922', '1925542181177806849', 1, '2025-05-22 21:23:31', NULL, '0', '1925543036622884866', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925543044080357378', '1925543038707453953', '1925542032317763585', 0, '2025-05-22 21:23:31', NULL, '0', '1925543036622884866', 'https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/5548b0e1-7982-468a-8740-ff0177aed995.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925543044755640321', '1925543038707453953', '1925542130414145538', 1, '2025-05-22 21:23:31', NULL, '0', '1925543036622884866', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925543045447700481', '1925543039374348290', '1925542032317763585', 0, '2025-05-22 21:23:32', NULL, '0', '1925543036622884866', 'https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/5548b0e1-7982-468a-8740-ff0177aed995.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925543046148149249', '1925543039374348290', '1925542181177806849', 1, '2025-05-22 21:23:32', NULL, '0', '1925543036622884866', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545892344123394', '1925545887055106050', '1925545078720450562', 0, '2025-05-22 21:34:50', NULL, '1', '1925545886404988929', 'https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/2cf21842-2505-4395-8943-d7d92bcba9ed.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545893040377857', '1925545887055106050', '1912869653045223426', 1, '2025-05-22 21:34:50', NULL, '1', '1925545886404988929', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545893778575362', '1925545887751360514', '1925545078720450562', 0, '2025-05-22 21:34:51', NULL, '1', '1925545886404988929', 'https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/2cf21842-2505-4395-8943-d7d92bcba9ed.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545894458052610', '1925545887751360514', '1912869723891212289', 1, '2025-05-22 21:34:51', NULL, '1', '1925545886404988929', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545895112364033', '1925545888388894721', '1925545135712653313', 0, '2025-05-22 21:34:51', NULL, '1', '1925545886404988929', 'https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/dcb4b7d0-4293-4c3f-aa00-0068e8216db6.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545895775064065', '1925545888388894721', '1912869653045223426', 1, '2025-05-22 21:34:51', NULL, '1', '1925545886404988929', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545896408403969', '1925545889055789058', '1925545135712653313', 0, '2025-05-22 21:34:51', NULL, '1', '1925545886404988929', 'https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/dcb4b7d0-4293-4c3f-aa00-0068e8216db6.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545897066909697', '1925545889055789058', '1912869723891212289', 1, '2025-05-22 21:34:51', NULL, '1', '1925545886404988929', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545897721221121', '1925545889714294786', '1925545170894475265', 0, '2025-05-22 21:34:52', NULL, '1', '1925545886404988929', 'https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/4f941d02-cc14-40cc-bb60-29453d2594b3.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545898371338241', '1925545889714294786', '1912869653045223426', 1, '2025-05-22 21:34:52', NULL, '1', '1925545886404988929', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545899017261057', '1925545890393772033', '1925545170894475265', 0, '2025-05-22 21:34:52', NULL, '1', '1925545886404988929', 'https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/4f941d02-cc14-40cc-bb60-29453d2594b3.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545899654795266', '1925545890393772033', '1912869723891212289', 1, '2025-05-22 21:34:52', NULL, '1', '1925545886404988929', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099829504987137', '1912867578517299201', '1912866747504041986', 0, '2025-05-29 22:43:16', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099831304343554', '1912867578517299201', '1912866886893346818', 1, '2025-05-29 22:43:17', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099832256450562', '1912867579440046081', '1912866747504041986', 0, '2025-05-29 22:43:17', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099833095311361', '1912867579440046081', '1912866927229968386', 1, '2025-05-29 22:43:17', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099833955143682', '1912867580371181569', '1912866747504041986', 0, '2025-05-29 22:43:17', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099834840141826', '1912867580371181569', '1912866949661106178', 1, '2025-05-29 22:43:18', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099835708362753', '1912867581298122754', '1912866787874217985', 0, '2025-05-29 22:43:18', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099846621941762', '1912867581298122754', '1912866886893346818', 1, '2025-05-29 22:43:20', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099847511134210', '1912867582258618370', '1912866787874217985', 0, '2025-05-29 22:43:21', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099848404520962', '1912867582258618370', '1912866927229968386', 1, '2025-05-29 22:43:21', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099849251770370', '1912867583248474114', '1912866787874217985', 0, '2025-05-29 22:43:21', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099850086436865', '1912867583248474114', '1912866949661106178', 1, '2025-05-29 22:43:21', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099850921103361', '1912867584276078593', '1912866817397923842', 0, '2025-05-29 22:43:21', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099851759964161', '1912867584276078593', '1912866886893346818', 1, '2025-05-29 22:43:22', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099852603019266', '1912867585219796994', '1912866817397923842', 0, '2025-05-29 22:43:22', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099853429297154', '1912867585219796994', '1912866927229968386', 1, '2025-05-29 22:43:22', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099854259769345', '1912867586150932481', '1912866817397923842', 0, '2025-05-29 22:43:22', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099855144767489', '1912867586150932481', '1912866949661106178', 1, '2025-05-29 22:43:22', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099855983628290', '1912867587086262274', '1912866843499077633', 0, '2025-05-29 22:43:23', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099856814100482', '1912867587086262274', '1912866886893346818', 1, '2025-05-29 22:43:23', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099857665544193', '1912867588017397761', '1912866843499077633', 0, '2025-05-29 22:43:23', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099866301616129', '1912867588017397761', '1912866927229968386', 1, '2025-05-29 22:43:25', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099867144671234', '1912867588935950337', '1912866843499077633', 0, '2025-05-29 22:43:25', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928099867949977602', '1912867588935950337', '1912866949661106178', 1, '2025-05-29 22:43:26', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110167105384450', '1912867578517299201', '1912866747504041986', 0, '2025-05-29 23:24:21', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110167910690818', '1912867578517299201', '1912866886893346818', 1, '2025-05-29 23:24:21', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110168783106050', '1912867579440046081', '1912866747504041986', 0, '2025-05-29 23:24:21', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110169596801025', '1912867579440046081', '1912866927229968386', 1, '2025-05-29 23:24:22', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110170389524482', '1912867580371181569', '1912866747504041986', 0, '2025-05-29 23:24:22', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110171215802370', '1912867580371181569', '1912866949661106178', 1, '2025-05-29 23:24:22', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110172079828993', '1912867581298122754', '1912866787874217985', 0, '2025-05-29 23:24:22', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110172885135362', '1912867581298122754', '1912866886893346818', 1, '2025-05-29 23:24:22', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110173682053122', '1912867582258618370', '1912866787874217985', 0, '2025-05-29 23:24:23', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110174512525313', '1912867582258618370', '1912866927229968386', 1, '2025-05-29 23:24:23', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110175326220290', '1912867583248474114', '1912866787874217985', 0, '2025-05-29 23:24:23', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110176177664001', '1912867583248474114', '1912866949661106178', 1, '2025-05-29 23:24:23', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110177016524802', '1912867584276078593', '1912866817397923842', 0, '2025-05-29 23:24:23', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110177872162818', '1912867584276078593', '1912866886893346818', 1, '2025-05-29 23:24:24', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110178690052098', '1912867585219796994', '1912866817397923842', 0, '2025-05-29 23:24:24', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110179503747074', '1912867585219796994', '1912866927229968386', 1, '2025-05-29 23:24:24', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110180309053441', '1912867586150932481', '1912866817397923842', 0, '2025-05-29 23:24:24', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110181101776897', '1912867586150932481', '1912866949661106178', 1, '2025-05-29 23:24:24', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110181936443394', '1912867587086262274', '1912866843499077633', 0, '2025-05-29 23:24:25', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110182787887106', '1912867587086262274', '1912866886893346818', 1, '2025-05-29 23:24:25', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110183597387778', '1912867588017397761', '1912866843499077633', 0, '2025-05-29 23:24:25', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110184390111234', '1912867588017397761', '1912866927229968386', 1, '2025-05-29 23:24:25', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110185224777730', '1912867588935950337', '1912866843499077633', 0, '2025-05-29 23:24:25', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110186038472706', '1912867588935950337', '1912866949661106178', 1, '2025-05-29 23:24:26', NULL, '1', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110317089501186', '1912867578517299201', '1912866747504041986', 0, '2025-05-29 23:24:57', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110317982887938', '1912867578517299201', '1912866886893346818', 1, '2025-05-29 23:24:57', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110318800777217', '1912867579440046081', '1912866747504041986', 0, '2025-05-29 23:24:57', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110319631249410', '1912867579440046081', '1912866927229968386', 1, '2025-05-29 23:24:57', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110320449138690', '1912867580371181569', '1912866747504041986', 0, '2025-05-29 23:24:58', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110321292193793', '1912867580371181569', '1912866949661106178', 1, '2025-05-29 23:24:58', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110322131054593', '1912867581298122754', '1912866787874217985', 0, '2025-05-29 23:24:58', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110322940555265', '1912867581298122754', '1912866886893346818', 1, '2025-05-29 23:24:58', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110323766833153', '1912867582258618370', '1912866787874217985', 0, '2025-05-29 23:24:58', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110324588916738', '1912867582258618370', '1912866927229968386', 1, '2025-05-29 23:24:59', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110325402611714', '1912867583248474114', '1912866787874217985', 0, '2025-05-29 23:24:59', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110326199529473', '1912867583248474114', '1912866949661106178', 1, '2025-05-29 23:24:59', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110327034195970', '1912867584276078593', '1912866817397923842', 0, '2025-05-29 23:24:59', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110327894028290', '1912867584276078593', '1912866886893346818', 1, '2025-05-29 23:24:59', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110328711917569', '1912867585219796994', '1912866817397923842', 0, '2025-05-29 23:25:00', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110329525612545', '1912867585219796994', '1912866927229968386', 1, '2025-05-29 23:25:00', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110330368667649', '1912867586150932481', '1912866817397923842', 0, '2025-05-29 23:25:00', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110331224305665', '1912867586150932481', '1912866949661106178', 1, '2025-05-29 23:25:00', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110332054777858', '1912867587086262274', '1912866843499077633', 0, '2025-05-29 23:25:00', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110332872667138', '1912867587086262274', '1912866886893346818', 1, '2025-05-29 23:25:01', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110333698945026', '1912867588017397761', '1912866843499077633', 0, '2025-05-29 23:25:01', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110334575554561', '1912867588017397761', '1912866927229968386', 1, '2025-05-29 23:25:01', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110335406026753', '1912867588935950337', '1912866843499077633', 0, '2025-05-29 23:25:01', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1928110336240693249', '1912867588935950337', '1912866949661106178', 1, '2025-05-29 23:25:01', NULL, '0', '1912867577569386497', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904516480229377', '1919013944788389889', '1912869461206147074', 0, '2025-06-06 16:28:06', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904517352644610', '1919013944788389889', '1912869653045223426', 1, '2025-06-06 16:28:06', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904518434775041', '1919013945459478529', '1912869461206147074', 0, '2025-06-06 16:28:06', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904519386882050', '1919013945459478529', '1912869723891212289', 1, '2025-06-06 16:28:07', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904520297046017', '1919013946130567170', '1912869494215319554', 0, '2025-06-06 16:28:07', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904521161072641', '1919013946130567170', '1912869653045223426', 1, '2025-06-06 16:28:07', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904522251591681', '1919013946784878594', '1912869494215319554', 0, '2025-06-06 16:28:07', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904523165949954', '1919013946784878594', '1912869723891212289', 1, '2025-06-06 16:28:07', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904524130639873', '1919013947439190017', '1912869535868952578', 0, '2025-06-06 16:28:08', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904525032415234', '1919013947439190017', '1912869653045223426', 1, '2025-06-06 16:28:08', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904526047436801', '1919013948089307138', '1912869535868952578', 0, '2025-06-06 16:28:08', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904526940823554', '1919013948089307138', '1912869723891212289', 1, '2025-06-06 16:28:08', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904527859376129', '1919013948756201474', '1912869571721863169', 0, '2025-06-06 16:28:09', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904528782123010', '1919013948756201474', '1912869653045223426', 1, '2025-06-06 16:28:09', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904529813921793', '1919013949393735681', '1912869571721863169', 0, '2025-06-06 16:28:09', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904530745057281', '1919013949393735681', '1912869723891212289', 1, '2025-06-06 16:28:09', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891146575187969', '1919013944788389889', '1912869461206147074', 0, '2025-06-14 22:15:54', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891147464380417', '1919013944788389889', '1912869653045223426', 1, '2025-06-14 22:15:54', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891148299046914', '1919013945459478529', '1912869461206147074', 0, '2025-06-14 22:15:54', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891149154684929', '1919013945459478529', '1912869723891212289', 1, '2025-06-14 22:15:55', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891150039683073', '1919013946130567170', '1912869494215319554', 0, '2025-06-14 22:15:55', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891150886932482', '1919013946130567170', '1912869653045223426', 1, '2025-06-14 22:15:55', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891151734181889', '1919013946784878594', '1912869494215319554', 0, '2025-06-14 22:15:55', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891152573042690', '1919013946784878594', '1912869723891212289', 1, '2025-06-14 22:15:55', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891153453846530', '1919013947439190017', '1912869535868952578', 0, '2025-06-14 22:15:56', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891154305290242', '1919013947439190017', '1912869653045223426', 1, '2025-06-14 22:15:56', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891155152539650', '1919013948089307138', '1912869535868952578', 0, '2025-06-14 22:15:56', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891155999789058', '1919013948089307138', '1912869723891212289', 1, '2025-06-14 22:15:56', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891156880592898', '1919013948756201474', '1912869571721863169', 0, '2025-06-14 22:15:56', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891157740425218', '1919013948756201474', '1912869653045223426', 1, '2025-06-14 22:15:57', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891158575091714', '1919013949393735681', '1912869571721863169', 0, '2025-06-14 22:15:57', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891159413952513', '1919013949393735681', '1912869723891212289', 1, '2025-06-14 22:15:57', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245794181386241', '1919013944788389889', '1912869461206147074', 0, '2025-06-18 15:58:47', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245795213185025', '1919013944788389889', '1912869653045223426', 1, '2025-06-18 15:58:47', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245796295315458', '1919013945459478529', '1912869461206147074', 0, '2025-06-18 15:58:48', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245797188702209', '1919013945459478529', '1912869723891212289', 1, '2025-06-18 15:58:48', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245798149197826', '1919013946130567170', '1912869494215319554', 0, '2025-06-18 15:58:48', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245799126470658', '1919013946130567170', '1912869653045223426', 1, '2025-06-18 15:58:48', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245800124715010', '1919013946784878594', '1912869494215319554', 0, '2025-06-18 15:58:49', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245801013907458', '1919013946784878594', '1912869723891212289', 1, '2025-06-18 15:58:49', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245801982791682', '1919013947439190017', '1912869535868952578', 0, '2025-06-18 15:58:49', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245802955870210', '1919013947439190017', '1912869653045223426', 1, '2025-06-18 15:58:49', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245803924754434', '1919013948089307138', '1912869535868952578', 0, '2025-06-18 15:58:49', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245804897832962', '1919013948089307138', '1912869723891212289', 1, '2025-06-18 15:58:50', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245805917048833', '1919013948756201474', '1912869571721863169', 0, '2025-06-18 15:58:50', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245806898515969', '1919013948756201474', '1912869653045223426', 1, '2025-06-18 15:58:50', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245807884177410', '1919013949393735681', '1912869571721863169', 0, '2025-06-18 15:58:50', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245808819507201', '1919013949393735681', '1912869723891212289', 1, '2025-06-18 15:58:51', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935254964557336577', '1919013944788389889', '1912869461206147074', 0, '2025-06-18 16:35:14', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935254965740130306', '1919013944788389889', '1912869653045223426', 1, '2025-06-18 16:35:14', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935254967090696193', '1919013945459478529', '1912869461206147074', 0, '2025-06-18 16:35:14', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935254968164438018', '1919013945459478529', '1912869723891212289', 1, '2025-06-18 16:35:14', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935254969359814658', '1919013946130567170', '1912869494215319554', 0, '2025-06-18 16:35:15', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935254970672631809', '1919013946130567170', '1912869653045223426', 1, '2025-06-18 16:35:15', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935254991384104962', '1919013946784878594', '1912869494215319554', 0, '2025-06-18 16:35:20', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935254992743059457', '1919013946784878594', '1912869723891212289', 1, '2025-06-18 16:35:20', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935255013269983233', '1919013947439190017', '1912869535868952578', 0, '2025-06-18 16:35:25', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935255033855627266', '1919013947439190017', '1912869653045223426', 1, '2025-06-18 16:35:30', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935255034790957058', '1919013948089307138', '1912869535868952578', 0, '2025-06-18 16:35:30', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935255035780812801', '1919013948089307138', '1912869723891212289', 1, '2025-06-18 16:35:30', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935255036741308417', '1919013948756201474', '1912869571721863169', 0, '2025-06-18 16:35:31', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935255057519890433', '1919013948756201474', '1912869653045223426', 1, '2025-06-18 16:35:36', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935255058652352513', '1919013949393735681', '1912869571721863169', 0, '2025-06-18 16:35:36', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935255059742871553', '1919013949393735681', '1912869723891212289', 1, '2025-06-18 16:35:36', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1936287295794388994', '1936287290845110273', '1912869653045223426', 0, '2025-06-21 12:57:20', NULL, '1', '1925545886404988929', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1936287296880713729', '1936287291935629314', '1912869723891212289', 0, '2025-06-21 12:57:21', NULL, '1', '1925545886404988929', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1936786843264425985', '1936287290845110273', '1912869653045223426', 0, '2025-06-22 22:02:22', NULL, '0', '1925545886404988929', NULL, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1936786844170395650', '1936287291935629314', '1912869723891212289', 0, '2025-06-22 22:02:22', NULL, '0', '1925545886404988929', NULL, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054499800965122', '1919013944788389889', '1912869461206147074', 0, '2025-07-12 23:21:26', NULL, '0', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054500639825922', '1919013944788389889', '1912869653045223426', 1, '2025-07-12 23:21:26', NULL, '0', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054501487075329', '1919013945459478529', '1912869461206147074', 0, '2025-07-12 23:21:27', NULL, '0', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054502330130434', '1919013945459478529', '1912869723891212289', 1, '2025-07-12 23:21:27', NULL, '0', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054503177379841', '1919013946130567170', '1912869494215319554', 0, '2025-07-12 23:21:27', NULL, '0', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054503953326081', '1919013946130567170', '1912869653045223426', 1, '2025-07-12 23:21:27', NULL, '0', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054504792186882', '1919013946784878594', '1912869494215319554', 0, '2025-07-12 23:21:27', NULL, '0', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054505635241985', '1919013946784878594', '1912869723891212289', 1, '2025-07-12 23:21:28', NULL, '0', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054506549600258', '1919013947439190017', '1912869535868952578', 0, '2025-07-12 23:21:28', NULL, '0', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054507401043970', '1919013947439190017', '1912869653045223426', 1, '2025-07-12 23:21:28', NULL, '0', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054508239904770', '1919013948089307138', '1912869535868952578', 0, '2025-07-12 23:21:28', NULL, '0', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054509087154177', '1919013948089307138', '1912869723891212289', 1, '2025-07-12 23:21:28', NULL, '0', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054509934403585', '1919013948756201474', '1912869571721863169', 0, '2025-07-12 23:21:29', NULL, '0', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054510785847298', '1919013948756201474', '1912869653045223426', 1, '2025-07-12 23:21:29', NULL, '0', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054511565987842', '1919013949393735681', '1912869571721863169', 0, '2025-07-12 23:21:29', NULL, '0', '1912870113080680449', 'https://minio.ihuanxing.cn/huanxing/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054512409042946', '1919013949393735681', '1912869723891212289', 1, '2025-07-12 23:21:29', NULL, '0', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);

-- ----------------------------
-- Table structure for goods_specs
-- ----------------------------
DROP TABLE IF EXISTS `goods_specs`;
CREATE TABLE `goods_specs`  (
                                `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格名',
                                `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
                                `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品规格' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_specs
-- ----------------------------
INSERT INTO `goods_specs` VALUES ('1912866651538366466', '外观', '2025-04-17 21:52:04', NULL, 'admin', NULL, '0', '1590229800633634816');
INSERT INTO `goods_specs` VALUES ('1912866862587355137', '版本', '2025-04-17 21:52:54', NULL, 'admin', NULL, '0', '1590229800633634816');
INSERT INTO `goods_specs` VALUES ('1919391795383545858', '选择屏幕尺寸', '2025-05-05 22:00:39', NULL, 'admin', NULL, '0', '1590229800633634816');
INSERT INTO `goods_specs` VALUES ('1925541900914413570', '颜色', '2025-05-22 21:18:59', NULL, 'system', NULL, '0', '1590229800633634816');
INSERT INTO `goods_specs` VALUES ('1935979409943912449', '测试', '2025-06-20 16:33:55', NULL, 'system', NULL, '0', '1881232176465358849');

-- ----------------------------
-- Table structure for goods_specs_value
-- ----------------------------
DROP TABLE IF EXISTS `goods_specs_value`;
CREATE TABLE `goods_specs_value`  (
                                      `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                      `specs_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规格ID',
                                      `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格值',
                                      `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                      `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                      `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                      `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                      `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                      `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品规格值' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_specs_value
-- ----------------------------
INSERT INTO `goods_specs_value` VALUES ('1912866747504041986', '1912866651538366466', '沙漠色钛金属', '2025-04-17 21:52:27', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_specs_value` VALUES ('1912866787874217985', '1912866651538366466', '原色钛金属', '2025-04-17 21:52:36', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_specs_value` VALUES ('1912866817397923842', '1912866651538366466', '白色钛金属', '2025-04-17 21:52:43', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_specs_value` VALUES ('1912866843499077633', '1912866651538366466', '黑色钛金属', '2025-04-17 21:52:49', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_specs_value` VALUES ('1912866886893346818', '1912866862587355137', '256GB', '2025-04-17 21:53:00', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_specs_value` VALUES ('1912866927229968386', '1912866862587355137', '512GB', '2025-04-17 21:53:09', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_specs_value` VALUES ('1912866949661106178', '1912866862587355137', '1TB', '2025-04-17 21:53:15', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_specs_value` VALUES ('1912869461206147074', '1912866651538366466', '黑色', '2025-04-17 22:03:14', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_specs_value` VALUES ('1912869494215319554', '1912866651538366466', '白色', '2025-04-17 22:03:21', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_specs_value` VALUES ('1912869535868952578', '1912866651538366466', '浅草色', '2025-04-17 22:03:31', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_specs_value` VALUES ('1912869571721863169', '1912866651538366466', '丁香紫', '2025-04-17 22:03:40', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_specs_value` VALUES ('1912869653045223426', '1912866862587355137', '12GB+256GB', '2025-04-17 22:03:59', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_specs_value` VALUES ('1912869723891212289', '1912866862587355137', '12GB+512GB', '2025-04-17 22:04:16', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_specs_value` VALUES ('1919391860428812289', '1919391795383545858', '85英寸', '2025-05-05 22:00:55', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_specs_value` VALUES ('1919391892674621441', '1919391795383545858', '75英寸', '2025-05-05 22:01:02', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_specs_value` VALUES ('1925541940366036993', '1925541900914413570', '云水蓝', '2025-05-22 21:19:08', NULL, '0', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_specs_value` VALUES ('1925542032317763585', '1925541900914413570', '天际白', '2025-05-22 21:19:30', NULL, '0', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_specs_value` VALUES ('1925542130414145538', '1912866862587355137', '32GB+1TB', '2025-05-22 21:19:53', NULL, '0', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_specs_value` VALUES ('1925542181177806849', '1912866862587355137', '32GB+2TB', '2025-05-22 21:20:05', NULL, '0', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_specs_value` VALUES ('1925545078720450562', '1912866651538366466', '曜石黑', '2025-05-22 21:31:36', NULL, '0', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_specs_value` VALUES ('1925545135712653313', '1912866651538366466', '星云白', '2025-05-22 21:31:50', NULL, '0', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_specs_value` VALUES ('1925545170894475265', '1912866651538366466', '深海蓝', '2025-05-22 21:31:58', NULL, '0', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_specs_value` VALUES ('1935979460262977538', '1935979409943912449', '测试1', '2025-06-20 16:34:07', NULL, '0', '1881232176465358849', 'system', NULL);

-- ----------------------------
-- Table structure for goods_spu
-- ----------------------------
DROP TABLE IF EXISTS `goods_spu`;
CREATE TABLE `goods_spu`  (
                              `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                              `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
                              `sub_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子标题',
                              `spu_urls` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品图地址',
                              `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '状态：0.下架；1.上架',
                              `sales_volume` int NOT NULL DEFAULT 0 COMMENT '销量',
                              `category_first_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一级类目id',
                              `category_second_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二级类目id',
                              `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                              `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                              `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                              `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
                              `enable_specs` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '多规格：0.否；1.是',
                              `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                              `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                              `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                              `stock` int NOT NULL DEFAULT 0 COMMENT '库存',
                              `freight_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运费类型：0.包邮；1.固定运费',
                              `fixed_freight_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '固定运费金额，仅当运费类型为1时生效',
                              `sales_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格（元）',
                              `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品原价（元）',
                              `cost_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '成本价（元）',
                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品spu' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_spu
-- ----------------------------
INSERT INTO `goods_spu` VALUES ('1912867577569386497', 'Apple/苹果 iPhone 16 Pro Max（A3297）', NULL, 'https://minio.ihuanxing.cn/huanxing/file/e8e18e94-d352-45d9-acdd-f918a6f77f90.jpg,https://minio.ihuanxing.cn/huanxing/file/88e79726-2368-4767-aa60-065b5ea9aabd.jpg,https://minio.ihuanxing.cn/huanxing/file/cc5819fb-8f39-45ad-b584-52ff3fbdf642.jpg,https://minio.ihuanxing.cn/huanxing/file/f9a3fe3b-22ee-437d-9676-8fe4127e04ec.jpg,https://minio.ihuanxing.cn/huanxing/file/f7a85fb7-adde-4635-9738-88709be3b76a.jpg', '1', 1073, '1912863400222957569', '1912863683464306689', '2025-04-17 21:55:45', '2025-07-15 23:34:04', '0', '<p><br></p><p><img src=\"https://minio.ihuanxing.cn/huanxing/file/9888cb29-e6b8-4d67-b129-0d3859c3717e.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://minio.ihuanxing.cn/huanxing/file/1744aaa5-ed8a-46ca-ba53-3e0038aa5ea6.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p>', '1', '1590229800633634816', 'admin', NULL, 1130, '0', 0.00, 9299.00, 9299.00, 11299.00);
INSERT INTO `goods_spu` VALUES ('1912870113080680449', '小米15 国家补贴 徕卡光学Summilux高速镜头 骁龙8至尊版移动平台', NULL, 'https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg,https://minio.ihuanxing.cn/huanxing/file/22e2fc4e-bc1e-4c42-a57f-af4cb04af847.jpg,https://minio.ihuanxing.cn/huanxing/file/9f371b82-9843-4fd2-a206-ebbb0b9ddb9e.jpg,https://minio.ihuanxing.cn/huanxing/file/505b78ac-7dfa-4379-a4df-d11e90d34ae0.jpg,https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1', 245, '1912863400222957569', '1912863683464306689', '2025-04-17 22:05:49', '2025-07-15 23:34:04', '0', '<p><br></p><p><img src=\"https://minio.ihuanxing.cn/huanxing/file/292fbf15-33cc-4eee-b1ef-3a4dc71ba4d2.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p>', '1', '1590229800633634816', 'admin', NULL, 69955, '0', 0.00, 9999.00, 9999.00, 9999.00);
INSERT INTO `goods_spu` VALUES ('1912882761411239938', '大疆 DJI Mini 3 优选迷你航拍机 智能高清拍摄无人机 小型遥控飞机 兼容带屏遥控器 大疆无人机', '', 'https://minio.ihuanxing.cn/huanxing/file/e38f917c-c4a5-4fd8-9acf-e6a4f40aff60.jpg,https://minio.ihuanxing.cn/huanxing/file/ff6de4fc-406e-4f02-8b9a-6269dd9b8ce8.jpg,https://minio.ihuanxing.cn/huanxing/file/0f4f5061-3930-4ef8-9352-5307d3689307.jpg,https://minio.ihuanxing.cn/huanxing/file/78fa70d0-faff-4440-a9a4-55b4b4ca71f7.jpg', '1', 145, '1912863400222957569', '1912864294511484929', '2025-04-17 22:56:05', '2025-06-21 00:05:10', '0', '<p><br></p><p><img src=\"https://minio.ihuanxing.cn/huanxing/file/b775af49-8e44-4ba7-b19c-08b8141af9c5.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p>', '0', '1590229800633634816', 'admin', NULL, 973, '2', 0.00, 5999.00, 5999.00, 5999.00);
INSERT INTO `goods_spu` VALUES ('1925543036622884866', '华为MateBook Fold 非凡大师 笔记本电脑 鸿蒙操作系统 超轻薄折叠电脑双层OLED显示屏', '华为MateBook Fold 非凡大师 笔记本电脑 鸿蒙操作系统 超轻薄折叠电脑双层OLED显示屏', 'https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/5548b0e1-7982-468a-8740-ff0177aed995.jpg,https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/f818bd69-14e6-4c24-88f2-dfc9c8687750.jpg,https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/b116d626-b40b-4c21-ae34-408277623e85.jpg,https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/fa5a558d-5962-49b8-9695-a57b9239af3e.jpg,https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/646127e7-5462-4d27-9d2e-4ecc324fd19c.jpg', '1', 2003, '1912863400222957569', '1925541056051564546', '2025-05-22 21:23:29', '2025-06-21 00:05:10', '0', '<p>2133333333333333333333123</p>', '1', '1590229800633634816', 'system', NULL, 3997, '0', 0.00, 25999.00, 25999.00, 25999.00);
INSERT INTO `goods_spu` VALUES ('1925545886404988929', 'HUAWEI Mate X6 分布式玄武架构 鸿蒙大屏AI 红枫原色影像折叠旗舰手机 折叠屏', NULL, 'https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/dcb4b7d0-4293-4c3f-aa00-0068e8216db6.jpg,https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/2590cb12-279c-402d-aacd-ed171ff6189f.jpg,https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/64ffdbb4-0bc4-4def-a9eb-e2da1aa25c17.jpg,https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/f51a1ac7-d968-4473-ac6e-aad0fed31948.jpg,https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/797ef622-bb8d-4b67-b383-2531b46ed48e.jpg', '1', 2000, '1912863400222957569', '1912863683464306689', '2025-05-22 21:34:49', '2025-06-22 22:02:32', '0', '<p><img src=\"\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/64ffdbb4-0bc4-4def-a9eb-e2da1aa25c17.jpg\" alt=\"\" data-href=\"\" style=\"\"/><img src=\"\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/f51a1ac7-d968-4473-ac6e-aad0fed31948.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p>', '1', '1590229800633634816', 'system', 'admin', 0, '0', 0.00, 0.00, 0.00, 0.00);

-- ----------------------------
-- Table structure for goods_spu_specs
-- ----------------------------
DROP TABLE IF EXISTS `goods_spu_specs`;
CREATE TABLE `goods_spu_specs`  (
                                    `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                    `spu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品ID',
                                    `specs_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规格ID',
                                    `sort` int NOT NULL COMMENT '排序字段',
                                    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                    `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                    `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                    `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                    `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品关联规格' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_spu_specs
-- ----------------------------
INSERT INTO `goods_spu_specs` VALUES ('1913460550984814594', '1913460322839842818', '1912866651538366466', 0, '2025-04-19 13:12:00', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1918685813540040706', '1912867577569386497', '1912866651538366466', 0, '2025-05-03 23:15:20', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1918685814206935041', '1912867577569386497', '1912866862587355137', 1, '2025-05-03 23:15:20', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1919013950601695233', '1912870113080680449', '1912866651538366466', 0, '2025-05-04 20:59:14', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1919013951243423745', '1912870113080680449', '1912866862587355137', 1, '2025-05-04 20:59:14', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1925543040045436930', '1925543036622884866', '1925541900914413570', 0, '2025-05-22 21:23:30', NULL, '0', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1925543040720719874', '1925543036622884866', '1912866862587355137', 1, '2025-05-22 21:23:30', NULL, '0', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1925545891035500545', '1925545886404988929', '1912866651538366466', 0, '2025-05-22 21:34:50', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1925545891689811970', '1925545886404988929', '1912866862587355137', 1, '2025-05-22 21:34:50', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1928099827802099713', '1912867577569386497', '1912866651538366466', 0, '2025-05-29 22:43:16', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1928099828657737730', '1912867577569386497', '1912866862587355137', 1, '2025-05-29 22:43:16', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1928110165461217281', '1912867577569386497', '1912866651538366466', 0, '2025-05-29 23:24:21', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1928110166291689473', '1912867577569386497', '1912866862587355137', 1, '2025-05-29 23:24:21', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1928110315462111234', '1912867577569386497', '1912866651538366466', 0, '2025-05-29 23:24:56', NULL, '0', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1928110316275806209', '1912867577569386497', '1912866862587355137', 1, '2025-05-29 23:24:57', NULL, '0', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1930904514588598274', '1912870113080680449', '1912866651538366466', 0, '2025-06-06 16:28:05', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1930904515502956545', '1912870113080680449', '1912866862587355137', 1, '2025-06-06 16:28:06', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1933891144796803074', '1912870113080680449', '1912866651538366466', 0, '2025-06-14 22:15:54', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1933891145681801217', '1912870113080680449', '1912866862587355137', 1, '2025-06-14 22:15:54', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1935245792293949442', '1912870113080680449', '1912866651538366466', 0, '2025-06-18 15:58:47', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1935245793220890625', '1912870113080680449', '1912866862587355137', 1, '2025-06-18 15:58:47', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1935254962346938370', '1912870113080680449', '1912866651538366466', 0, '2025-06-18 16:35:13', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1935254963416485890', '1912870113080680449', '1912866862587355137', 1, '2025-06-18 16:35:13', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1936287293646905346', '1925545886404988929', '1919391795383545858', 0, '2025-06-21 12:57:20', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1936287294754201601', '1925545886404988929', '1912866862587355137', 1, '2025-06-21 12:57:20', NULL, '1', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1936786839690878977', '1925545886404988929', '1912866651538366466', 0, '2025-06-22 22:02:21', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1936786840588460034', '1925545886404988929', '1919391795383545858', 1, '2025-06-22 22:02:21', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1936786841527984129', '1925545886404988929', '1912866862587355137', 2, '2025-06-22 22:02:21', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1936786842425565185', '1925545886404988929', '1912866862587355137', 3, '2025-06-22 22:02:22', NULL, '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1944054498106466306', '1912870113080680449', '1912866651538366466', 0, '2025-07-12 23:21:26', NULL, '0', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_spu_specs` VALUES ('1944054498949521410', '1912870113080680449', '1912866862587355137', 1, '2025-07-12 23:21:26', NULL, '0', '1590229800633634816', 'system', NULL);

-- ----------------------------
-- Table structure for order_config
-- ----------------------------
DROP TABLE IF EXISTS `order_config`;
CREATE TABLE `order_config`  (
                                 `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
                                 `notify_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通知地址',
                                 `order_cancel_timeout` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单超时取消时间级别',
                                 `order_auto_confirm_days` int NOT NULL COMMENT '订单确认收货时间（天）',
                                 `order_auto_comment_days` int NOT NULL COMMENT '订单评价时间（天）',
                                 `kuaidi100_app_key` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递100AppKey',
                                 `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注说明',
                                 `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
                                 `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                 `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                 `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '逻辑删除：0正常；1删除',
                                 `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                 `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                 `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                 `wx_delivery_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '微信发货状态',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_config
-- ----------------------------
INSERT INTO `order_config` VALUES ('1927385204186599425', 'https://xxx.ihuanxing.cn/api', '15', 7, 7, '12312312312', NULL, '1', '2025-05-27 23:23:36', '2025-06-02 00:02:01', '0', 'system', 'system', '1590229800633634816', '0');
INSERT INTO `order_config` VALUES ('1927386954763333634', 'https://xxxx.ihuanxing.cn', '15', 2, 2, '12321123', NULL, '0', '2025-05-27 23:30:34', '2025-06-02 00:06:49', '0', 'system', 'system', '1590229800633634816', '0');

-- ----------------------------
-- Table structure for order_delivery
-- ----------------------------
DROP TABLE IF EXISTS `order_delivery`;
CREATE TABLE `order_delivery`  (
                                   `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
                                   `order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单ID',
                                   `delivery_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货单号（系统生成）',
                                   `logistics_company_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司编码',
                                   `logistics_company_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司名称',
                                   `logistics_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流单号',
                                   `delivery_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '发货状态',
                                   `deliver_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
                                   `receiver_time` datetime NULL DEFAULT NULL COMMENT '收货时间',
                                   `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注说明',
                                   `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                   `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                   `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '逻辑删除：0正常；1删除',
                                   `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                   `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                   `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                   `is_check` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否签收标记：0.未签收；1.已签收；',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发货单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_delivery
-- ----------------------------

-- ----------------------------
-- Table structure for order_delivery_logistics
-- ----------------------------
DROP TABLE IF EXISTS `order_delivery_logistics`;
CREATE TABLE `order_delivery_logistics`  (
                                             `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
                                             `delivery_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联发货单ID',
                                             `logistics_company_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司编码（冗余）',
                                             `logistics_company_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司名称（冗余）',
                                             `logistics_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流单号（冗余）',
                                             `logistics_status` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流状态',
                                             `logistics_context` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '轨迹描述',
                                             `logistics_time` datetime NOT NULL COMMENT '轨迹发生时间',
                                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                             `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '逻辑删除：0正常；1删除',
                                             `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                             `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                             `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发货单物流轨迹表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_delivery_logistics
-- ----------------------------

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
                               `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                               `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户主键',
                               `delivery_way` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配送方式：1.普通快递；2.上门自提',
                               `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单单号',
                               `payment_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付类型：1.微信支付；2.支付宝支付',
                               `trade_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易类型：（预留）',
                               `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                               `pay_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '支付状态：0.未支付；1.已支付;',
                               `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态',
                               `appraise_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价状态：0.待评价；1.已平价;',
                               `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额（元）',
                               `freight_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费（元）',
                               `coupon_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠金额（元）',
                               `payment_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '支付金额（总金额-优惠券优惠金额+运费）',
                               `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                               `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                               `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                               `payment_time` datetime NULL DEFAULT NULL COMMENT '付款时间',
                               `deliver_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
                               `cancel_time` datetime NULL DEFAULT NULL COMMENT '取消时间',
                               `receiver_time` datetime NULL DEFAULT NULL COMMENT '收货时间',
                               `transaction_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信支付单号',
                               `coupon_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户优惠券id',
                               `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                               `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                               `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                               `recipient_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
                               `recipient_phone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
                               `recipient_province` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
                               `recipient_city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
                               `recipient_area` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县',
                               `recipient_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
                               `recipient_province_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省编码',
                               `recipient_city_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市编码',
                               `recipient_area_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区/县编码',
                               `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用ID',
                               `open_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'openId',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_info
-- ----------------------------

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
                               `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                               `order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单主键',
                               `spu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'spuId',
                               `sku_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'skuId',
                               `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spu名称',
                               `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图',
                               `sales_price` decimal(10, 2) NOT NULL COMMENT '销售价格（元）',
                               `buy_quantity` int NULL DEFAULT NULL COMMENT '购买数量',
                               `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单金额（元）',
                               `freight_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费（元）',
                               `coupon_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠金额（元）',
                               `payment_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '支付金额（总金额-优惠券优惠金额+运费= 支付金额）',
                               `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                               `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                               `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                               `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态',
                               `specs_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格信息',
                               `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                               `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                               `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '子订单信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_item
-- ----------------------------

-- ----------------------------
-- Table structure for order_refund
-- ----------------------------
DROP TABLE IF EXISTS `order_refund`;
CREATE TABLE `order_refund`  (
                                 `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                 `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户主键',
                                 `order_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单ID',
                                 `order_item_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '子订单ID',
                                 `refund_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '退款类型',
                                 `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款状态',
                                 `arrival_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款到账状态：0.未退款；1.退款中；2.已到账；',
                                 `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                 `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                 `refund_amount` decimal(10, 2) NOT NULL COMMENT '退款金额',
                                 `refund_trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款流水号',
                                 `refund_reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款原因',
                                 `refuse_reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拒绝退款原因',
                                 `user_received_account` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款入账账户',
                                 `refund_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款单号',
                                 `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                 `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                 `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商城退款单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_refund
-- ----------------------------

-- ----------------------------
-- Table structure for page_design
-- ----------------------------
DROP TABLE IF EXISTS `page_design`;
CREATE TABLE `page_design`  (
                                `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                `page_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '页面名称',
                                `page_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '页面内容',
                                `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '状态：0.正常；1.停用；',
                                `home_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '首页页面：0.否；1.是；',
                                `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '页面设计表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of page_design
-- ----------------------------
INSERT INTO `page_design` VALUES ('1912871334512336898', '首页', '{\"components\":[{\"title\":\"图片广告\",\"id\":\"DdqIzXHxWfqzy47oOOGSp\",\"type\":\"image-ad\",\"formData\":{\"type\":\"2\",\"interval\":5,\"swiperType\":\"1\",\"height\":140,\"imgRadius\":10,\"indicatorDots\":true,\"indicatorColor\":\"rgba(249, 223, 237, 1)\",\"indicatorActiveColor\":\"rgba(198, 222, 236, 1)\",\"commonImageStyle\":{\"styleTopMargin\":0,\"styleBottomMargin\":0,\"styleLeftMargin\":0,\"styleRightMargin\":0,\"styleTopPadding\":0,\"styleBottomPadding\":0,\"styleLeftPadding\":0,\"styleRightPadding\":0,\"styleLtRadius\":0,\"styleRtRadius\":0,\"styleLbRadius\":0,\"styleRbRadius\":0,\"bgColorDirection\":\"to right\",\"bgStartColor\":\"\",\"bgEndColor\":\"\",\"bgPicUrl\":\"\"},\"commonStyle\":{\"styleTopMargin\":10,\"styleBottomMargin\":10,\"styleLeftMargin\":10,\"styleRightMargin\":10,\"styleTopPadding\":0,\"styleBottomPadding\":0,\"styleLeftPadding\":0,\"styleRightPadding\":0,\"styleLtRadius\":100,\"styleRtRadius\":100,\"styleLbRadius\":100,\"styleRbRadius\":100,\"bgColorDirection\":\"to right\",\"bgStartColor\":\"\",\"bgEndColor\":\"\",\"bgPicUrl\":\"\"},\"imageList\":[{\"url\":\"https://minio.ihuanxing.cn/huanxing/file/545972b8-53d5-41d3-8847-d9a623daa161.jpg\"},{\"url\":\"https://minio.ihuanxing.cn/huanxing/file/9ccf25ba-bc08-4c67-9a51-913e22b1dad2.jpg\"}]}},{\"title\":\"图文导航\",\"id\":\"E_5fdneuFjO2HZujfFtE9\",\"type\":\"tab-nav\",\"formData\":{\"type\":\"3\",\"fontColor\":\"rgba(0, 0, 0, 1)\",\"showNum\":4,\"imgSize\":30,\"imgRadius\":0,\"scrollShow\":false,\"commonStyle\":{\"styleTopMargin\":10,\"styleBottomMargin\":10,\"styleLeftMargin\":10,\"styleRightMargin\":10,\"styleTopPadding\":10,\"styleBottomPadding\":10,\"styleLeftPadding\":10,\"styleRightPadding\":10,\"styleLtRadius\":10,\"styleRtRadius\":10,\"styleLbRadius\":10,\"styleRbRadius\":10,\"bgColorDirection\":\"to right\",\"bgStartColor\":\"rgba(255, 255, 255, 1)\",\"bgEndColor\":\"\",\"bgPicUrl\":\"\"},\"navList\":[{\"url\":\"https://minio.ihuanxing.cn/huanxing/file/41130969-2c09-48ae-8ae9-b3ac70baf3be.png\",\"title\":\"全部商品\",\"link\":{\"name\":\"商品列表\",\"url\":\"/pages/product/goods-list/index\"}},{\"url\":\"https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/fef3de8f-4cc2-46da-8ad4-490d584e6b84.svg\",\"title\":\"浏览记录\",\"link\":{\"name\":\"足迹列表\",\"url\":\"/pages/user/footprint/index\"}},{\"url\":\"https://minio.ihuanxing.cn/huanxing/1590229800633634816/file/fef3de8f-4cc2-46da-8ad4-490d584e6b84.svg\",\"title\":\"浏览记录\",\"link\":{\"name\":\"足迹列表\",\"url\":\"/pages/user/footprint/index\"}},{\"url\":\"https://minio.ihuanxing.cn/huanxing/file/b676ed92-17f1-4035-ba31-406d15baabe1.png\",\"title\":\"领券中心\",\"link\":{\"name\":\"优惠券列表\",\"url\":\"/pages/promotion/coupon/coupon-list/index\"}}],\"scrollShw\":true}},{\"title\":\"商品\",\"id\":\"016z_FTuG3Tofz2AfUQkc\",\"type\":\"goods\",\"formData\":{\"showType\":\"3\",\"showDesc\":false,\"descSize\":14,\"descColor\":\"rgba(0, 0, 0, 1)\",\"descStyle\":\"0\",\"showName\":true,\"nameSize\":14,\"nameColor\":\"rgba(0, 0, 0, 1)\",\"nameStyle\":\"0\",\"showTag\":false,\"showSalesPrice\":true,\"salesPriceSize\":14,\"salesPriceColor\":\"rgba(255, 0, 0, 1)\",\"salesPriceStyle\":\"0\",\"showOriginalPrice\":false,\"showSalesVolume\":false,\"salesVolumeSize\":14,\"salesVolumeColor\":\"rgba(0, 0, 0, 1)\",\"salesVolumeStyle\":\"0\",\"showStock\":false,\"stockSize\":14,\"stockColor\":\"rgba(0, 0, 0, 1)\",\"stockStyle\":\"0\",\"buyBtnColor\":\"rgba(255, 0, 0, 1)\",\"buyBtnSize\":14,\"buyBtnStyle\":\"1\",\"showBuyBtn\":true,\"buyBtnText\":\"购买\",\"goodsList\":[{\"id\":\"1912867577569386497\",\"name\":\"Apple/苹果 iPhone 16 Pro Max（A3297）\",\"subTitle\":null,\"spuUrls\":[\"https://minio.ihuanxing.cn/huanxing/file/e8e18e94-d352-45d9-acdd-f918a6f77f90.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/88e79726-2368-4767-aa60-065b5ea9aabd.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/cc5819fb-8f39-45ad-b584-52ff3fbdf642.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/f9a3fe3b-22ee-437d-9676-8fe4127e04ec.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/f7a85fb7-adde-4635-9738-88709be3b76a.jpg\"],\"status\":\"1\",\"salesVolume\":1000,\"freightTemplateId\":null,\"placeShipmentId\":null,\"categoryFirstId\":\"1912863400222957569\",\"categorySecondId\":\"1912863683464306689\",\"description\":\"<p><br></p><p><img src=\\\"https://minio.ihuanxing.cn/huanxing/file/9888cb29-e6b8-4d67-b129-0d3859c3717e.jpg\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p><p><img src=\\\"https://minio.ihuanxing.cn/huanxing/file/1744aaa5-ed8a-46ca-ba53-3e0038aa5ea6.jpg\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"enableSpecs\":\"1\",\"tenantId\":null,\"shopId\":\"1\",\"shopName\":\"环兴商城自营旗舰店\",\"shopType\":\"1\",\"shopCategoryFirstId\":\"1912864433649131522\",\"shopCategorySecondId\":\"1912864638087897089\",\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:45\",\"updateTime\":\"2025-04-18 22:44:17\",\"delFlag\":\"0\",\"verifyStatus\":\"1\",\"verifyDesc\":\"\",\"categoryName\":\"手机\",\"shopCategoryName\":null,\"freightTemplate\":null,\"goodsSkus\":[{\"id\":\"1912867578517299201\",\"spuId\":\"1912867577569386497\",\"salesPrice\":9299,\"originalPrice\":9299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:45\",\"updateTime\":\"2025-04-18 22:43:59\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242117281624066\",\"skuId\":\"1912867578517299201\",\"spuId\":null,\"specsValueId\":\"1912866747504041986\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:02\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"沙漠色钛金属\",\"specsId\":null},{\"id\":\"1913242118242119682\",\"skuId\":\"1912867578517299201\",\"spuId\":null,\"specsValueId\":\"1912866886893346818\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:02\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"256GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867579440046081\",\"spuId\":\"1912867577569386497\",\"salesPrice\":11299,\"originalPrice\":11299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:45\",\"updateTime\":\"2025-04-18 22:44:00\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242119148089346\",\"skuId\":\"1912867579440046081\",\"spuId\":null,\"specsValueId\":\"1912866747504041986\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:02\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"沙漠色钛金属\",\"specsId\":null},{\"id\":\"1913242120075030530\",\"skuId\":\"1912867579440046081\",\"spuId\":null,\"specsValueId\":\"1912866927229968386\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:02\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"512GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867580371181569\",\"spuId\":\"1912867577569386497\",\"salesPrice\":13299,\"originalPrice\":13299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:45\",\"updateTime\":\"2025-04-18 22:44:00\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242120997777410\",\"skuId\":\"1912867580371181569\",\"spuId\":null,\"specsValueId\":\"1912866747504041986\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:03\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"沙漠色钛金属\",\"specsId\":null},{\"id\":\"1913242121920524290\",\"skuId\":\"1912867580371181569\",\"spuId\":null,\"specsValueId\":\"1912866949661106178\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:03\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"1TB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867581298122754\",\"spuId\":\"1912867577569386497\",\"salesPrice\":9299,\"originalPrice\":9299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:45\",\"updateTime\":\"2025-04-18 22:44:00\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242122826493954\",\"skuId\":\"1912867581298122754\",\"spuId\":null,\"specsValueId\":\"1912866787874217985\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:03\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"原色钛金属\",\"specsId\":null},{\"id\":\"1913242123782795265\",\"skuId\":\"1912867581298122754\",\"spuId\":null,\"specsValueId\":\"1912866886893346818\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:03\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"256GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867582258618370\",\"spuId\":\"1912867577569386497\",\"salesPrice\":11299,\"originalPrice\":11299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:46\",\"updateTime\":\"2025-04-18 22:44:00\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242124734902274\",\"skuId\":\"1912867582258618370\",\"spuId\":null,\"specsValueId\":\"1912866787874217985\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:04\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"原色钛金属\",\"specsId\":null},{\"id\":\"1913242125649260545\",\"skuId\":\"1912867582258618370\",\"spuId\":null,\"specsValueId\":\"1912866927229968386\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:04\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"512GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867583248474114\",\"spuId\":\"1912867577569386497\",\"salesPrice\":13299,\"originalPrice\":13299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:46\",\"updateTime\":\"2025-04-18 22:44:00\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242126576201729\",\"skuId\":\"1912867583248474114\",\"spuId\":null,\"specsValueId\":\"1912866787874217985\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:04\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"原色钛金属\",\"specsId\":null},{\"id\":\"1913242127503142913\",\"skuId\":\"1912867583248474114\",\"spuId\":null,\"specsValueId\":\"1912866949661106178\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:04\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"1TB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867584276078593\",\"spuId\":\"1912867577569386497\",\"salesPrice\":9299,\"originalPrice\":9299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:46\",\"updateTime\":\"2025-04-18 22:44:00\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242128434278402\",\"skuId\":\"1912867584276078593\",\"spuId\":null,\"specsValueId\":\"1912866817397923842\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:04\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"白色钛金属\",\"specsId\":null},{\"id\":\"1913242129377996801\",\"skuId\":\"1912867584276078593\",\"spuId\":null,\"specsValueId\":\"1912866886893346818\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:05\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"256GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867585219796994\",\"spuId\":\"1912867577569386497\",\"salesPrice\":11299,\"originalPrice\":11299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:46\",\"updateTime\":\"2025-04-18 22:44:00\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242130271383553\",\"skuId\":\"1912867585219796994\",\"spuId\":null,\"specsValueId\":\"1912866817397923842\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:05\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"白色钛金属\",\"specsId\":null},{\"id\":\"1913242131202519041\",\"skuId\":\"1912867585219796994\",\"spuId\":null,\"specsValueId\":\"1912866927229968386\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:05\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"512GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867586150932481\",\"spuId\":\"1912867577569386497\",\"salesPrice\":13299,\"originalPrice\":13299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:47\",\"updateTime\":\"2025-04-18 22:44:01\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242132121071617\",\"skuId\":\"1912867586150932481\",\"spuId\":null,\"specsValueId\":\"1912866817397923842\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:05\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"白色钛金属\",\"specsId\":null},{\"id\":\"1913242133064790018\",\"skuId\":\"1912867586150932481\",\"spuId\":null,\"specsValueId\":\"1912866949661106178\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:06\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"1TB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867587086262274\",\"spuId\":\"1912867577569386497\",\"salesPrice\":9299,\"originalPrice\":9299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:47\",\"updateTime\":\"2025-04-18 22:44:01\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242133979148290\",\"skuId\":\"1912867587086262274\",\"spuId\":null,\"specsValueId\":\"1912866843499077633\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:06\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"黑色钛金属\",\"specsId\":null},{\"id\":\"1913242134901895169\",\"skuId\":\"1912867587086262274\",\"spuId\":null,\"specsValueId\":\"1912866886893346818\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:06\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"256GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867588017397761\",\"spuId\":\"1912867577569386497\",\"salesPrice\":11299,\"originalPrice\":11299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:47\",\"updateTime\":\"2025-04-18 22:44:01\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242135820447745\",\"skuId\":\"1912867588017397761\",\"spuId\":null,\"specsValueId\":\"1912866843499077633\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:06\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"黑色钛金属\",\"specsId\":null},{\"id\":\"1913242136739000321\",\"skuId\":\"1912867588017397761\",\"spuId\":null,\"specsValueId\":\"1912866927229968386\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:06\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"512GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867588935950337\",\"spuId\":\"1912867577569386497\",\"salesPrice\":9299,\"originalPrice\":9299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:47\",\"updateTime\":\"2025-04-18 22:44:01\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242137665941505\",\"skuId\":\"1912867588935950337\",\"spuId\":null,\"specsValueId\":\"1912866843499077633\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:07\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"黑色钛金属\",\"specsId\":null},{\"id\":\"1913242138651602946\",\"skuId\":\"1912867588935950337\",\"spuId\":null,\"specsValueId\":\"1912866949661106178\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:07\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"1TB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0}],\"goodsSpuSpecs\":[{\"id\":\"1912867589871280130\",\"spuId\":\"1912867577569386497\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:47\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912888755335921665\",\"spuId\":\"1912867577569386497\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 23:19:54\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912934226058850306\",\"spuId\":\"1912867577569386497\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 02:20:35\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913242115398381569\",\"spuId\":\"1912867577569386497\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:01\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912867590802415617\",\"spuId\":\"1912867577569386497\",\"specsId\":\"1912866862587355137\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:48\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912888756262862850\",\"spuId\":\"1912867577569386497\",\"specsId\":\"1912866862587355137\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 23:19:54\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912934227099037698\",\"spuId\":\"1912867577569386497\",\"specsId\":\"1912866862587355137\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 02:20:35\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913242116350488578\",\"spuId\":\"1912867577569386497\",\"specsId\":\"1912866862587355137\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:02\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null}],\"collectId\":null,\"stock\":1200,\"enableMemberPrice\":\"1\",\"enableGivePoints\":\"1\",\"pointsAmount\":100,\"enablePointDeduction\":\"1\",\"pointDeductionRatio\":10,\"freightType\":\"0\",\"fixedFreightPrice\":0,\"salesPrice\":9299,\"originalPrice\":9299,\"costPrice\":9299,\"distributionCalcType\":\"0\",\"distributionType\":\"0\"},{\"id\":\"1912870113080680449\",\"name\":\"小米15 国家补贴 徕卡光学Summilux高速镜头 骁龙8至尊版移动平台\",\"subTitle\":null,\"spuUrls\":[\"https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/22e2fc4e-bc1e-4c42-a57f-af4cb04af847.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/9f371b82-9843-4fd2-a206-ebbb0b9ddb9e.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/505b78ac-7dfa-4379-a4df-d11e90d34ae0.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg\"],\"status\":\"1\",\"salesVolume\":100,\"freightTemplateId\":null,\"placeShipmentId\":null,\"categoryFirstId\":\"1912863400222957569\",\"categorySecondId\":\"1912863683464306689\",\"description\":\"<p><br></p><p><img src=\\\"https://minio.ihuanxing.cn/huanxing/file/292fbf15-33cc-4eee-b1ef-3a4dc71ba4d2.jpg\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"enableSpecs\":\"1\",\"tenantId\":null,\"shopId\":\"1\",\"shopName\":\"环兴商城自营旗舰店\",\"shopType\":\"1\",\"shopCategoryFirstId\":\"1912864433649131522\",\"shopCategorySecondId\":\"1912864567430651906\",\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:49\",\"updateTime\":\"2025-04-18 22:44:17\",\"delFlag\":\"0\",\"verifyStatus\":\"1\",\"verifyDesc\":\"\",\"categoryName\":\"手机\",\"shopCategoryName\":null,\"freightTemplate\":null,\"goodsSkus\":[{\"id\":\"1912870113982455809\",\"spuId\":\"1912870113080680449\",\"salesPrice\":4199,\"originalPrice\":4199,\"costPrice\":4199,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:49\",\"updateTime\":\"2025-04-18 22:43:26\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913241979834281985\",\"skuId\":\"1912870113982455809\",\"spuId\":null,\"specsValueId\":\"1912869461206147074\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:29\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":\"https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg\",\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"黑色\",\"specsId\":null},{\"id\":\"1913241980786388994\",\"skuId\":\"1912870113982455809\",\"spuId\":null,\"specsValueId\":\"1912869653045223426\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:29\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"12GB+256GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912870114942951425\",\"spuId\":\"1912870113080680449\",\"salesPrice\":4499,\"originalPrice\":4499,\"costPrice\":4199,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:49\",\"updateTime\":\"2025-04-18 22:43:26\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913241981717524481\",\"skuId\":\"1912870114942951425\",\"spuId\":null,\"specsValueId\":\"1912869461206147074\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:29\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":\"https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg\",\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"黑色\",\"specsId\":null},{\"id\":\"1913241982698991618\",\"skuId\":\"1912870114942951425\",\"spuId\":null,\"specsValueId\":\"1912869723891212289\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:30\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"12GB+512GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912870115911835649\",\"spuId\":\"1912870113080680449\",\"salesPrice\":4199,\"originalPrice\":4199,\"costPrice\":4199,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:50\",\"updateTime\":\"2025-04-18 22:43:26\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913241983638515713\",\"skuId\":\"1912870115911835649\",\"spuId\":null,\"specsValueId\":\"1912869494215319554\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:30\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":\"https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg\",\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"白色\",\"specsId\":null},{\"id\":\"1913241984603205634\",\"skuId\":\"1912870115911835649\",\"spuId\":null,\"specsValueId\":\"1912869653045223426\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:30\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"12GB+256GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912870116868136962\",\"spuId\":\"1912870113080680449\",\"salesPrice\":4499,\"originalPrice\":4499,\"costPrice\":4199,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:50\",\"updateTime\":\"2025-04-18 22:43:26\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913241985538535425\",\"skuId\":\"1912870116868136962\",\"spuId\":null,\"specsValueId\":\"1912869494215319554\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:30\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":\"https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg\",\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"白色\",\"specsId\":null},{\"id\":\"1913241986532585473\",\"skuId\":\"1912870116868136962\",\"spuId\":null,\"specsValueId\":\"1912869723891212289\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:31\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"12GB+512GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912870117761523714\",\"spuId\":\"1912870113080680449\",\"salesPrice\":4199,\"originalPrice\":4199,\"costPrice\":4199,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:50\",\"updateTime\":\"2025-04-18 22:43:26\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913241987484692481\",\"skuId\":\"1912870117761523714\",\"spuId\":null,\"specsValueId\":\"1912869535868952578\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:31\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":\"https://minio.ihuanxing.cn/huanxing/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg\",\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"浅草色\",\"specsId\":null},{\"id\":\"1913241988457771010\",\"skuId\":\"1912870117761523714\",\"spuId\":null,\"specsValueId\":\"1912869653045223426\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:31\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"12GB+256GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912870118663299074\",\"spuId\":\"1912870113080680449\",\"salesPrice\":4499,\"originalPrice\":4499,\"costPrice\":4199,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:50\",\"updateTime\":\"2025-04-18 22:43:27\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913241989363740674\",\"skuId\":\"1912870118663299074\",\"spuId\":null,\"specsValueId\":\"1912869535868952578\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:31\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":\"https://minio.ihuanxing.cn/huanxing/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg\",\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"浅草色\",\"specsId\":null},{\"id\":\"1913241990324236290\",\"skuId\":\"1912870118663299074\",\"spuId\":null,\"specsValueId\":\"1912869723891212289\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:31\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"12GB+512GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912870119623794689\",\"spuId\":\"1912870113080680449\",\"salesPrice\":4199,\"originalPrice\":4199,\"costPrice\":4199,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:51\",\"updateTime\":\"2025-04-18 22:43:27\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913241991255371777\",\"skuId\":\"1912870119623794689\",\"spuId\":null,\"specsValueId\":\"1912869571721863169\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:32\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":\"https://minio.ihuanxing.cn/huanxing/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg\",\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"丁香紫\",\"specsId\":null},{\"id\":\"1913241992203284482\",\"skuId\":\"1912870119623794689\",\"spuId\":null,\"specsValueId\":\"1912869653045223426\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:32\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"12GB+256GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912870120580096002\",\"spuId\":\"1912870113080680449\",\"salesPrice\":4499,\"originalPrice\":4499,\"costPrice\":4199,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:51\",\"updateTime\":\"2025-04-18 22:43:27\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913241993117642753\",\"skuId\":\"1912870120580096002\",\"spuId\":null,\"specsValueId\":\"1912869571721863169\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:32\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":\"https://minio.ihuanxing.cn/huanxing/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg\",\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"丁香紫\",\"specsId\":null},{\"id\":\"1913241994073944065\",\"skuId\":\"1912870120580096002\",\"spuId\":null,\"specsValueId\":\"1912869723891212289\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:32\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"12GB+512GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0}],\"goodsSpuSpecs\":[{\"id\":\"1912870121486065666\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:51\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912880928009658370\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:48:48\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912888587442126850\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 23:19:14\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912934769850363905\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 02:22:44\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913241972276146177\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:27\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912870122438172674\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866862587355137\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:51\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912880928936599554\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866862587355137\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:48:48\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912888588406816770\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866862587355137\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 23:19:14\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912934770953465857\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866862587355137\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 02:22:45\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913241973224058881\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866651538366466\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:27\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913241974138417154\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866651538366466\",\"sort\":2,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:28\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913241975115689986\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866651538366466\",\"sort\":3,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:28\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913241976080379906\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866862587355137\",\"sort\":4,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:28\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913241977019904002\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866862587355137\",\"sort\":5,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:28\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913241977934262273\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866862587355137\",\"sort\":6,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:29\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913241978894757889\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866862587355137\",\"sort\":7,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:29\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null}],\"collectId\":null,\"stock\":800,\"enableMemberPrice\":\"1\",\"enableGivePoints\":\"1\",\"pointsAmount\":120,\"enablePointDeduction\":\"1\",\"pointDeductionRatio\":10,\"freightType\":\"0\",\"fixedFreightPrice\":0,\"salesPrice\":4199,\"originalPrice\":4199,\"costPrice\":4199,\"distributionCalcType\":\"0\",\"distributionType\":\"0\"},{\"id\":\"1912882761411239938\",\"name\":\"大疆 DJI Mini 3 优选迷你航拍机 智能高清拍摄无人机 小型遥控飞机 兼容带屏遥控器 大疆无人机\",\"subTitle\":null,\"spuUrls\":[\"https://minio.ihuanxing.cn/huanxing/file/e38f917c-c4a5-4fd8-9acf-e6a4f40aff60.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/ff6de4fc-406e-4f02-8b9a-6269dd9b8ce8.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/0f4f5061-3930-4ef8-9352-5307d3689307.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/78fa70d0-faff-4440-a9a4-55b4b4ca71f7.jpg\"],\"status\":\"1\",\"salesVolume\":111,\"freightTemplateId\":null,\"placeShipmentId\":null,\"categoryFirstId\":\"1912863400222957569\",\"categorySecondId\":\"1912864294511484929\",\"description\":\"<p><br></p><p><img src=\\\"https://minio.ihuanxing.cn/huanxing/file/b775af49-8e44-4ba7-b19c-08b8141af9c5.jpg\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"enableSpecs\":\"0\",\"tenantId\":null,\"shopId\":\"1\",\"shopName\":\"环兴商城自营旗舰店\",\"shopType\":\"1\",\"shopCategoryFirstId\":\"1912882883218022401\",\"shopCategorySecondId\":\"1912864567430651906\",\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:56:05\",\"updateTime\":\"2025-04-18 02:23:33\",\"delFlag\":\"0\",\"verifyStatus\":\"1\",\"verifyDesc\":\"\",\"categoryName\":\"无人机\",\"shopCategoryName\":null,\"freightTemplate\":null,\"goodsSkus\":[{\"id\":\"1912882762380124162\",\"spuId\":\"1912882761411239938\",\"salesPrice\":5999,\"originalPrice\":5999,\"costPrice\":5999,\"stock\":1000,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:56:05\",\"updateTime\":\"2025-04-17 23:18:31\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":null,\"distributionFirstValue\":0,\"distributionSecondValue\":0}],\"goodsSpuSpecs\":[],\"collectId\":null,\"stock\":1000,\"enableMemberPrice\":\"0\",\"enableGivePoints\":\"1\",\"pointsAmount\":24,\"enablePointDeduction\":\"1\",\"pointDeductionRatio\":10,\"freightType\":\"0\",\"fixedFreightPrice\":0,\"salesPrice\":5999,\"originalPrice\":5999,\"costPrice\":5999,\"distributionCalcType\":\"0\",\"distributionType\":\"0\"}],\"goodsCommonStyle\":{\"styleTopMargin\":5,\"styleBottomMargin\":5,\"styleLeftMargin\":5,\"styleRightMargin\":5,\"styleTopPadding\":4,\"styleBottomPadding\":4,\"styleLeftPadding\":4,\"styleRightPadding\":4,\"styleLtRadius\":10,\"styleRtRadius\":10,\"styleLbRadius\":10,\"styleRbRadius\":10,\"bgColorDirection\":\"to right\",\"bgStartColor\":\"rgba(255, 255, 255, 1)\",\"bgEndColor\":\"\",\"bgPicUrl\":\"\"},\"commonStyle\":{\"styleTopMargin\":10,\"styleBottomMargin\":10,\"styleLeftMargin\":10,\"styleRightMargin\":10,\"styleTopPadding\":0,\"styleBottomPadding\":0,\"styleLeftPadding\":0,\"styleRightPadding\":0,\"styleLtRadius\":10,\"styleRtRadius\":10,\"styleLbRadius\":10,\"styleRbRadius\":10,\"bgColorDirection\":\"to right\",\"bgStartColor\":\"rgba(255, 255, 255, 1)\",\"bgEndColor\":\"\",\"bgPicUrl\":\"\"},\"showSalePrice\":true,\"salePriceSize\":14,\"salePriceColor\":\"rgba(255, 0, 0, 1)\",\"salePriceStyle\":\"0\"}},{\"title\":\"图片广告\",\"id\":\"obN44DXHcWUp8plYAam0s\",\"type\":\"imageAd\",\"formData\":{\"type\":\"2\",\"interval\":5,\"swiperType\":\"1\",\"height\":100,\"imgRadius\":10,\"indicatorDots\":true,\"indicatorColor\":\"rgba(249, 223, 237, 1)\",\"indicatorActiveColor\":\"rgba(138, 218, 240, 1)\",\"commonStyle\":{\"styleTopMargin\":10,\"styleBottomMargin\":10,\"styleLeftMargin\":10,\"styleRightMargin\":10,\"styleTopPadding\":0,\"styleBottomPadding\":0,\"styleLeftPadding\":0,\"styleRightPadding\":0,\"styleLtRadius\":0,\"styleRtRadius\":0,\"styleLbRadius\":0,\"styleRbRadius\":0,\"bgColorDirection\":\"to right\",\"bgStartColor\":\"\",\"bgEndColor\":\"\",\"bgPicUrl\":\"\"},\"imageList\":[{\"url\":\"https://minio.ihuanxing.cn/huanxing/file/3ed6a47b-eb96-40d0-a9a9-1faba067ea9b.png\",\"link\":{\"name\":\"优惠券列表\",\"url\":\"/pages/promotion/coupon/coupon-list/index\"}},{\"url\":\"https://minio.ihuanxing.cn/huanxing/file/23293bbc-dba7-4159-9609-fd2a8d75daa3.png\",\"link\":null}]}},{\"title\":\"商品\",\"id\":\"J3RnU3Mjc_kbQKuPFRJJS\",\"type\":\"goods\",\"formData\":{\"showType\":\"2\",\"showDesc\":true,\"descSize\":14,\"descColor\":\"rgba(0, 0, 0, 1)\",\"descStyle\":\"0\",\"showName\":true,\"nameSize\":14,\"nameColor\":\"rgba(0, 0, 0, 1)\",\"nameStyle\":\"0\",\"showTag\":true,\"showSalesPrice\":true,\"salesPriceSize\":14,\"salesPriceColor\":\"rgba(255, 0, 0, 1)\",\"salesPriceStyle\":\"0\",\"showOriginalPrice\":false,\"showSalesVolume\":false,\"salesVolumeSize\":14,\"salesVolumeColor\":\"rgba(0, 0, 0, 1)\",\"salesVolumeStyle\":\"0\",\"showStock\":false,\"stockSize\":14,\"stockColor\":\"rgba(0, 0, 0, 1)\",\"stockStyle\":\"0\",\"buyBtnColor\":\"rgba(255, 0, 0, 1)\",\"buyBtnSize\":14,\"buyBtnStyle\":\"2\",\"showBuyBtn\":true,\"buyBtnText\":\"购买\",\"goodsList\":[{\"id\":\"1912867577569386497\",\"name\":\"Apple/苹果 iPhone 16 Pro Max（A3297）\",\"subTitle\":null,\"spuUrls\":[\"https://minio.ihuanxing.cn/huanxing/file/e8e18e94-d352-45d9-acdd-f918a6f77f90.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/88e79726-2368-4767-aa60-065b5ea9aabd.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/cc5819fb-8f39-45ad-b584-52ff3fbdf642.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/f9a3fe3b-22ee-437d-9676-8fe4127e04ec.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/f7a85fb7-adde-4635-9738-88709be3b76a.jpg\"],\"status\":\"1\",\"salesVolume\":1000,\"freightTemplateId\":null,\"placeShipmentId\":null,\"categoryFirstId\":\"1912863400222957569\",\"categorySecondId\":\"1912863683464306689\",\"description\":\"<p><br></p><p><img src=\\\"https://minio.ihuanxing.cn/huanxing/file/9888cb29-e6b8-4d67-b129-0d3859c3717e.jpg\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p><p><img src=\\\"https://minio.ihuanxing.cn/huanxing/file/1744aaa5-ed8a-46ca-ba53-3e0038aa5ea6.jpg\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"enableSpecs\":\"1\",\"tenantId\":null,\"shopId\":\"1\",\"shopName\":\"环兴商城自营旗舰店\",\"shopType\":\"1\",\"shopCategoryFirstId\":\"1912864433649131522\",\"shopCategorySecondId\":\"1912864638087897089\",\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:45\",\"updateTime\":\"2025-04-18 22:44:17\",\"delFlag\":\"0\",\"verifyStatus\":\"1\",\"verifyDesc\":\"\",\"categoryName\":\"手机\",\"shopCategoryName\":null,\"freightTemplate\":null,\"goodsSkus\":[{\"id\":\"1912867578517299201\",\"spuId\":\"1912867577569386497\",\"salesPrice\":9299,\"originalPrice\":9299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:45\",\"updateTime\":\"2025-04-18 22:43:59\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242117281624066\",\"skuId\":\"1912867578517299201\",\"spuId\":null,\"specsValueId\":\"1912866747504041986\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:02\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"沙漠色钛金属\",\"specsId\":null},{\"id\":\"1913242118242119682\",\"skuId\":\"1912867578517299201\",\"spuId\":null,\"specsValueId\":\"1912866886893346818\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:02\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"256GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867579440046081\",\"spuId\":\"1912867577569386497\",\"salesPrice\":11299,\"originalPrice\":11299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:45\",\"updateTime\":\"2025-04-18 22:44:00\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242119148089346\",\"skuId\":\"1912867579440046081\",\"spuId\":null,\"specsValueId\":\"1912866747504041986\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:02\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"沙漠色钛金属\",\"specsId\":null},{\"id\":\"1913242120075030530\",\"skuId\":\"1912867579440046081\",\"spuId\":null,\"specsValueId\":\"1912866927229968386\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:02\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"512GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867580371181569\",\"spuId\":\"1912867577569386497\",\"salesPrice\":13299,\"originalPrice\":13299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:45\",\"updateTime\":\"2025-04-18 22:44:00\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242120997777410\",\"skuId\":\"1912867580371181569\",\"spuId\":null,\"specsValueId\":\"1912866747504041986\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:03\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"沙漠色钛金属\",\"specsId\":null},{\"id\":\"1913242121920524290\",\"skuId\":\"1912867580371181569\",\"spuId\":null,\"specsValueId\":\"1912866949661106178\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:03\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"1TB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867581298122754\",\"spuId\":\"1912867577569386497\",\"salesPrice\":9299,\"originalPrice\":9299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:45\",\"updateTime\":\"2025-04-18 22:44:00\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242122826493954\",\"skuId\":\"1912867581298122754\",\"spuId\":null,\"specsValueId\":\"1912866787874217985\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:03\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"原色钛金属\",\"specsId\":null},{\"id\":\"1913242123782795265\",\"skuId\":\"1912867581298122754\",\"spuId\":null,\"specsValueId\":\"1912866886893346818\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:03\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"256GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867582258618370\",\"spuId\":\"1912867577569386497\",\"salesPrice\":11299,\"originalPrice\":11299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:46\",\"updateTime\":\"2025-04-18 22:44:00\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242124734902274\",\"skuId\":\"1912867582258618370\",\"spuId\":null,\"specsValueId\":\"1912866787874217985\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:04\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"原色钛金属\",\"specsId\":null},{\"id\":\"1913242125649260545\",\"skuId\":\"1912867582258618370\",\"spuId\":null,\"specsValueId\":\"1912866927229968386\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:04\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"512GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867583248474114\",\"spuId\":\"1912867577569386497\",\"salesPrice\":13299,\"originalPrice\":13299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:46\",\"updateTime\":\"2025-04-18 22:44:00\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242126576201729\",\"skuId\":\"1912867583248474114\",\"spuId\":null,\"specsValueId\":\"1912866787874217985\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:04\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"原色钛金属\",\"specsId\":null},{\"id\":\"1913242127503142913\",\"skuId\":\"1912867583248474114\",\"spuId\":null,\"specsValueId\":\"1912866949661106178\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:04\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"1TB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867584276078593\",\"spuId\":\"1912867577569386497\",\"salesPrice\":9299,\"originalPrice\":9299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:46\",\"updateTime\":\"2025-04-18 22:44:00\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242128434278402\",\"skuId\":\"1912867584276078593\",\"spuId\":null,\"specsValueId\":\"1912866817397923842\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:04\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"白色钛金属\",\"specsId\":null},{\"id\":\"1913242129377996801\",\"skuId\":\"1912867584276078593\",\"spuId\":null,\"specsValueId\":\"1912866886893346818\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:05\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"256GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867585219796994\",\"spuId\":\"1912867577569386497\",\"salesPrice\":11299,\"originalPrice\":11299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:46\",\"updateTime\":\"2025-04-18 22:44:00\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242130271383553\",\"skuId\":\"1912867585219796994\",\"spuId\":null,\"specsValueId\":\"1912866817397923842\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:05\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"白色钛金属\",\"specsId\":null},{\"id\":\"1913242131202519041\",\"skuId\":\"1912867585219796994\",\"spuId\":null,\"specsValueId\":\"1912866927229968386\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:05\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"512GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867586150932481\",\"spuId\":\"1912867577569386497\",\"salesPrice\":13299,\"originalPrice\":13299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:47\",\"updateTime\":\"2025-04-18 22:44:01\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242132121071617\",\"skuId\":\"1912867586150932481\",\"spuId\":null,\"specsValueId\":\"1912866817397923842\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:05\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"白色钛金属\",\"specsId\":null},{\"id\":\"1913242133064790018\",\"skuId\":\"1912867586150932481\",\"spuId\":null,\"specsValueId\":\"1912866949661106178\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:06\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"1TB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867587086262274\",\"spuId\":\"1912867577569386497\",\"salesPrice\":9299,\"originalPrice\":9299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:47\",\"updateTime\":\"2025-04-18 22:44:01\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242133979148290\",\"skuId\":\"1912867587086262274\",\"spuId\":null,\"specsValueId\":\"1912866843499077633\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:06\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"黑色钛金属\",\"specsId\":null},{\"id\":\"1913242134901895169\",\"skuId\":\"1912867587086262274\",\"spuId\":null,\"specsValueId\":\"1912866886893346818\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:06\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"256GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867588017397761\",\"spuId\":\"1912867577569386497\",\"salesPrice\":11299,\"originalPrice\":11299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:47\",\"updateTime\":\"2025-04-18 22:44:01\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242135820447745\",\"skuId\":\"1912867588017397761\",\"spuId\":null,\"specsValueId\":\"1912866843499077633\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:06\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"黑色钛金属\",\"specsId\":null},{\"id\":\"1913242136739000321\",\"skuId\":\"1912867588017397761\",\"spuId\":null,\"specsValueId\":\"1912866927229968386\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:06\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"512GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912867588935950337\",\"spuId\":\"1912867577569386497\",\"salesPrice\":9299,\"originalPrice\":9299,\"costPrice\":9299,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:47\",\"updateTime\":\"2025-04-18 22:44:01\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913242137665941505\",\"skuId\":\"1912867588935950337\",\"spuId\":null,\"specsValueId\":\"1912866843499077633\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:07\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"黑色钛金属\",\"specsId\":null},{\"id\":\"1913242138651602946\",\"skuId\":\"1912867588935950337\",\"spuId\":null,\"specsValueId\":\"1912866949661106178\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:07\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"1TB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0}],\"goodsSpuSpecs\":[{\"id\":\"1912867589871280130\",\"spuId\":\"1912867577569386497\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:47\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912888755335921665\",\"spuId\":\"1912867577569386497\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 23:19:54\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912934226058850306\",\"spuId\":\"1912867577569386497\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 02:20:35\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913242115398381569\",\"spuId\":\"1912867577569386497\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:01\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912867590802415617\",\"spuId\":\"1912867577569386497\",\"specsId\":\"1912866862587355137\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 21:55:48\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912888756262862850\",\"spuId\":\"1912867577569386497\",\"specsId\":\"1912866862587355137\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 23:19:54\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912934227099037698\",\"spuId\":\"1912867577569386497\",\"specsId\":\"1912866862587355137\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 02:20:35\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913242116350488578\",\"spuId\":\"1912867577569386497\",\"specsId\":\"1912866862587355137\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:44:02\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null}],\"collectId\":null,\"stock\":1200,\"enableMemberPrice\":\"1\",\"enableGivePoints\":\"1\",\"pointsAmount\":100,\"enablePointDeduction\":\"1\",\"pointDeductionRatio\":10,\"freightType\":\"0\",\"fixedFreightPrice\":0,\"salesPrice\":9299,\"originalPrice\":9299,\"costPrice\":9299,\"distributionCalcType\":\"0\",\"distributionType\":\"0\"},{\"id\":\"1912870113080680449\",\"name\":\"小米15 国家补贴 徕卡光学Summilux高速镜头 骁龙8至尊版移动平台\",\"subTitle\":null,\"spuUrls\":[\"https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/22e2fc4e-bc1e-4c42-a57f-af4cb04af847.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/9f371b82-9843-4fd2-a206-ebbb0b9ddb9e.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/505b78ac-7dfa-4379-a4df-d11e90d34ae0.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg\"],\"status\":\"1\",\"salesVolume\":100,\"freightTemplateId\":null,\"placeShipmentId\":null,\"categoryFirstId\":\"1912863400222957569\",\"categorySecondId\":\"1912863683464306689\",\"description\":\"<p><br></p><p><img src=\\\"https://minio.ihuanxing.cn/huanxing/file/292fbf15-33cc-4eee-b1ef-3a4dc71ba4d2.jpg\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"enableSpecs\":\"1\",\"tenantId\":null,\"shopId\":\"1\",\"shopName\":\"环兴商城自营旗舰店\",\"shopType\":\"1\",\"shopCategoryFirstId\":\"1912864433649131522\",\"shopCategorySecondId\":\"1912864567430651906\",\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:49\",\"updateTime\":\"2025-04-18 22:44:17\",\"delFlag\":\"0\",\"verifyStatus\":\"1\",\"verifyDesc\":\"\",\"categoryName\":\"手机\",\"shopCategoryName\":null,\"freightTemplate\":null,\"goodsSkus\":[{\"id\":\"1912870113982455809\",\"spuId\":\"1912870113080680449\",\"salesPrice\":4199,\"originalPrice\":4199,\"costPrice\":4199,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:49\",\"updateTime\":\"2025-04-18 22:43:26\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913241979834281985\",\"skuId\":\"1912870113982455809\",\"spuId\":null,\"specsValueId\":\"1912869461206147074\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:29\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":\"https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg\",\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"黑色\",\"specsId\":null},{\"id\":\"1913241980786388994\",\"skuId\":\"1912870113982455809\",\"spuId\":null,\"specsValueId\":\"1912869653045223426\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:29\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"12GB+256GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912870114942951425\",\"spuId\":\"1912870113080680449\",\"salesPrice\":4499,\"originalPrice\":4499,\"costPrice\":4199,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:49\",\"updateTime\":\"2025-04-18 22:43:26\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913241981717524481\",\"skuId\":\"1912870114942951425\",\"spuId\":null,\"specsValueId\":\"1912869461206147074\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:29\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":\"https://minio.ihuanxing.cn/huanxing/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg\",\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"黑色\",\"specsId\":null},{\"id\":\"1913241982698991618\",\"skuId\":\"1912870114942951425\",\"spuId\":null,\"specsValueId\":\"1912869723891212289\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:30\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"12GB+512GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912870115911835649\",\"spuId\":\"1912870113080680449\",\"salesPrice\":4199,\"originalPrice\":4199,\"costPrice\":4199,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:50\",\"updateTime\":\"2025-04-18 22:43:26\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913241983638515713\",\"skuId\":\"1912870115911835649\",\"spuId\":null,\"specsValueId\":\"1912869494215319554\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:30\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":\"https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg\",\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"白色\",\"specsId\":null},{\"id\":\"1913241984603205634\",\"skuId\":\"1912870115911835649\",\"spuId\":null,\"specsValueId\":\"1912869653045223426\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:30\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"12GB+256GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912870116868136962\",\"spuId\":\"1912870113080680449\",\"salesPrice\":4499,\"originalPrice\":4499,\"costPrice\":4199,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:50\",\"updateTime\":\"2025-04-18 22:43:26\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913241985538535425\",\"skuId\":\"1912870116868136962\",\"spuId\":null,\"specsValueId\":\"1912869494215319554\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:30\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":\"https://minio.ihuanxing.cn/huanxing/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg\",\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"白色\",\"specsId\":null},{\"id\":\"1913241986532585473\",\"skuId\":\"1912870116868136962\",\"spuId\":null,\"specsValueId\":\"1912869723891212289\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:31\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"12GB+512GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912870117761523714\",\"spuId\":\"1912870113080680449\",\"salesPrice\":4199,\"originalPrice\":4199,\"costPrice\":4199,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:50\",\"updateTime\":\"2025-04-18 22:43:26\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913241987484692481\",\"skuId\":\"1912870117761523714\",\"spuId\":null,\"specsValueId\":\"1912869535868952578\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:31\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":\"https://minio.ihuanxing.cn/huanxing/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg\",\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"浅草色\",\"specsId\":null},{\"id\":\"1913241988457771010\",\"skuId\":\"1912870117761523714\",\"spuId\":null,\"specsValueId\":\"1912869653045223426\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:31\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"12GB+256GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912870118663299074\",\"spuId\":\"1912870113080680449\",\"salesPrice\":4499,\"originalPrice\":4499,\"costPrice\":4199,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:50\",\"updateTime\":\"2025-04-18 22:43:27\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913241989363740674\",\"skuId\":\"1912870118663299074\",\"spuId\":null,\"specsValueId\":\"1912869535868952578\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:31\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":\"https://minio.ihuanxing.cn/huanxing/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg\",\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"浅草色\",\"specsId\":null},{\"id\":\"1913241990324236290\",\"skuId\":\"1912870118663299074\",\"spuId\":null,\"specsValueId\":\"1912869723891212289\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:31\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"12GB+512GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912870119623794689\",\"spuId\":\"1912870113080680449\",\"salesPrice\":4199,\"originalPrice\":4199,\"costPrice\":4199,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:51\",\"updateTime\":\"2025-04-18 22:43:27\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913241991255371777\",\"skuId\":\"1912870119623794689\",\"spuId\":null,\"specsValueId\":\"1912869571721863169\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:32\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":\"https://minio.ihuanxing.cn/huanxing/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg\",\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"丁香紫\",\"specsId\":null},{\"id\":\"1913241992203284482\",\"skuId\":\"1912870119623794689\",\"spuId\":null,\"specsValueId\":\"1912869653045223426\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:32\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"12GB+256GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0},{\"id\":\"1912870120580096002\",\"spuId\":\"1912870113080680449\",\"salesPrice\":4499,\"originalPrice\":4499,\"costPrice\":4199,\"stock\":100,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:51\",\"updateTime\":\"2025-04-18 22:43:27\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[{\"id\":\"1913241993117642753\",\"skuId\":\"1912870120580096002\",\"spuId\":null,\"specsValueId\":\"1912869571721863169\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:32\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":\"https://minio.ihuanxing.cn/huanxing/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg\",\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"丁香紫\",\"specsId\":null},{\"id\":\"1913241994073944065\",\"skuId\":\"1912870120580096002\",\"spuId\":null,\"specsValueId\":\"1912869723891212289\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:32\",\"updateTime\":null,\"delFlag\":\"0\",\"picUrl\":null,\"tenantId\":null,\"shopId\":null,\"specsValueName\":\"12GB+512GB\",\"specsId\":null}],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":\"0\",\"distributionFirstValue\":0,\"distributionSecondValue\":0}],\"goodsSpuSpecs\":[{\"id\":\"1912870121486065666\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:51\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912880928009658370\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:48:48\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912888587442126850\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 23:19:14\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912934769850363905\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 02:22:44\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913241972276146177\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866651538366466\",\"sort\":0,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:27\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912870122438172674\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866862587355137\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:05:51\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912880928936599554\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866862587355137\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:48:48\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912888588406816770\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866862587355137\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 23:19:14\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1912934770953465857\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866862587355137\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 02:22:45\",\"updateTime\":null,\"delFlag\":\"1\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913241973224058881\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866651538366466\",\"sort\":1,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:27\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913241974138417154\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866651538366466\",\"sort\":2,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:28\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913241975115689986\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866651538366466\",\"sort\":3,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:28\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913241976080379906\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866862587355137\",\"sort\":4,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:28\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913241977019904002\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866862587355137\",\"sort\":5,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:28\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913241977934262273\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866862587355137\",\"sort\":6,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:29\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null},{\"id\":\"1913241978894757889\",\"spuId\":\"1912870113080680449\",\"specsId\":\"1912866862587355137\",\"sort\":7,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-18 22:43:29\",\"updateTime\":null,\"delFlag\":\"0\",\"tenantId\":null,\"shopId\":null,\"specsName\":null,\"goodsSkuSpecsValues\":null}],\"collectId\":null,\"stock\":800,\"enableMemberPrice\":\"1\",\"enableGivePoints\":\"1\",\"pointsAmount\":120,\"enablePointDeduction\":\"1\",\"pointDeductionRatio\":10,\"freightType\":\"0\",\"fixedFreightPrice\":0,\"salesPrice\":4199,\"originalPrice\":4199,\"costPrice\":4199,\"distributionCalcType\":\"0\",\"distributionType\":\"0\"},{\"id\":\"1912882761411239938\",\"name\":\"大疆 DJI Mini 3 优选迷你航拍机 智能高清拍摄无人机 小型遥控飞机 兼容带屏遥控器 大疆无人机\",\"subTitle\":null,\"spuUrls\":[\"https://minio.ihuanxing.cn/huanxing/file/e38f917c-c4a5-4fd8-9acf-e6a4f40aff60.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/ff6de4fc-406e-4f02-8b9a-6269dd9b8ce8.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/0f4f5061-3930-4ef8-9352-5307d3689307.jpg\",\"https://minio.ihuanxing.cn/huanxing/file/78fa70d0-faff-4440-a9a4-55b4b4ca71f7.jpg\"],\"status\":\"1\",\"salesVolume\":111,\"freightTemplateId\":null,\"placeShipmentId\":null,\"categoryFirstId\":\"1912863400222957569\",\"categorySecondId\":\"1912864294511484929\",\"description\":\"<p><br></p><p><img src=\\\"https://minio.ihuanxing.cn/huanxing/file/b775af49-8e44-4ba7-b19c-08b8141af9c5.jpg\\\" alt=\\\"\\\" data-href=\\\"\\\" style=\\\"\\\"/></p>\",\"enableSpecs\":\"0\",\"tenantId\":null,\"shopId\":\"1\",\"shopName\":\"环兴商城自营旗舰店\",\"shopType\":\"1\",\"shopCategoryFirstId\":\"1912882883218022401\",\"shopCategorySecondId\":\"1912864567430651906\",\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:56:05\",\"updateTime\":\"2025-04-18 02:23:33\",\"delFlag\":\"0\",\"verifyStatus\":\"1\",\"verifyDesc\":\"\",\"categoryName\":\"无人机\",\"shopCategoryName\":null,\"freightTemplate\":null,\"goodsSkus\":[{\"id\":\"1912882762380124162\",\"spuId\":\"1912882761411239938\",\"salesPrice\":5999,\"originalPrice\":5999,\"costPrice\":5999,\"stock\":1000,\"weight\":null,\"volume\":null,\"createBy\":null,\"updateBy\":null,\"createTime\":\"2025-04-17 22:56:05\",\"updateTime\":\"2025-04-17 23:18:31\",\"delFlag\":\"0\",\"firstRate\":null,\"secondRate\":null,\"version\":null,\"goodsSkuSpecsValues\":[],\"goodsSpu\":null,\"tenantId\":null,\"shopId\":null,\"status\":null,\"distributionFirstValue\":0,\"distributionSecondValue\":0}],\"goodsSpuSpecs\":[],\"collectId\":null,\"stock\":1000,\"enableMemberPrice\":\"0\",\"enableGivePoints\":\"1\",\"pointsAmount\":24,\"enablePointDeduction\":\"1\",\"pointDeductionRatio\":10,\"freightType\":\"0\",\"fixedFreightPrice\":0,\"salesPrice\":5999,\"originalPrice\":5999,\"costPrice\":5999,\"distributionCalcType\":\"0\",\"distributionType\":\"0\"}],\"goodsCommonStyle\":{\"styleTopMargin\":10,\"styleBottomMargin\":10,\"styleLeftMargin\":10,\"styleRightMargin\":10,\"styleTopPadding\":0,\"styleBottomPadding\":0,\"styleLeftPadding\":0,\"styleRightPadding\":0,\"styleLtRadius\":33,\"styleRtRadius\":33,\"styleLbRadius\":33,\"styleRbRadius\":33,\"bgColorDirection\":\"to right\",\"bgStartColor\":\"rgba(255, 255, 255, 1)\",\"bgEndColor\":\"\"},\"commonStyle\":{\"styleTopMargin\":10,\"styleBottomMargin\":10,\"styleLeftMargin\":10,\"styleRightMargin\":10,\"styleTopPadding\":0,\"styleBottomPadding\":0,\"styleLeftPadding\":0,\"styleRightPadding\":0,\"styleLtRadius\":10,\"styleRtRadius\":10,\"styleLbRadius\":10,\"styleRbRadius\":10,\"bgColorDirection\":\"to right\",\"bgStartColor\":\"rgba(255, 255, 255, 1)\",\"bgEndColor\":\"\",\"bgPicUrl\":\"\"},\"showSalePrice\":true,\"salePriceSize\":14,\"salePriceColor\":\"rgba(255, 0, 0, 1)\",\"salePriceStyle\":\"0\"}}]}', '0', '1', '2025-04-17 22:10:40', '2025-07-16 22:18:16', '0', '1590229800633634816', 'admin', 'system');

-- ----------------------------
-- Table structure for pay_config
-- ----------------------------
DROP TABLE IF EXISTS `pay_config`;
CREATE TABLE `pay_config`  (
                               `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                               `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付类型：1.微信；2.支付宝；',
                               `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用Id',
                               `mch_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户号',
                               `mch_key` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户密钥',
                               `key_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'apiclient_cert.p12文件的绝对路径，或者如果放在项目中，请以classpath:开头指定.',
                               `cert_serial_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证书序列号',
                               `apiv3_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'apiV3秘钥',
                               `private_key_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'apiv3 商户apiclient_key.pem',
                               `private_cert_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'apiv3 商户apiclient_cert.pem',
                               `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                               `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                               `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                               `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                               `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                               `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                               `terminal_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付端类型',
                               `public_key_path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信支付公钥',
                               `public_key_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信支付公钥ID',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pay_config
-- ----------------------------
INSERT INTO `pay_config` VALUES ('1995858129627648002', '1', 'wx337f86e8f83c8575', '1730012632', NULL, '1', '66B832045864575002FF387F98DD03650603102B', '7kF9xQ3bZ8tP2sC5vM1nR4dY6gH7jK9l', '1', '1', '2025-12-02 22:10:34', NULL, '0', '1590229800633634816', 'system', NULL, '0', '1', 'PUB_KEY_ID_0117300126322025101900292098001800');

-- ----------------------------
-- Table structure for pay_notify_record
-- ----------------------------
DROP TABLE IF EXISTS `pay_notify_record`;
CREATE TABLE `pay_notify_record`  (
                                      `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                      `out_trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商户订单号',
                                      `channel_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道订单号',
                                      `request` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求报文',
                                      `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '响应报文',
                                      `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                      `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                      `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                      `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回调类型：1.支付回调；2.退款回调',
                                      `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '回调通知记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pay_notify_record
-- ----------------------------

-- ----------------------------
-- Table structure for pay_refund_order
-- ----------------------------
DROP TABLE IF EXISTS `pay_refund_order`;
CREATE TABLE `pay_refund_order`  (
                                     `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                     `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                     `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                     `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                     `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                     `notify_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通知地址',
                                     `channel_mch_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
                                     `channel_refund_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道退款单号',
                                     `refund_trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商户退款单号',
                                     `refund_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '退款状态：0.待退款；1.退款中；2.已退款；3.退款失败；',
                                     `extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '额外参数',
                                     `err_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道退款错误码',
                                     `err_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道退款错误描述',
                                     `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '支付总金额（元）',
                                     `refund_amount` decimal(10, 2) NOT NULL COMMENT '退款金额（元）',
                                     `out_trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商户支付订单号',
                                     `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                     `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                     `refund_success_time` datetime NULL DEFAULT NULL COMMENT '退款成功时间',
                                     `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '退款订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pay_refund_order
-- ----------------------------

-- ----------------------------
-- Table structure for pay_trade_order
-- ----------------------------
DROP TABLE IF EXISTS `pay_trade_order`;
CREATE TABLE `pay_trade_order`  (
                                    `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                    `channel_mch_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道号',
                                    `out_trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商户订单号',
                                    `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单描述',
                                    `trade_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易类型',
                                    `open_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id（openid、支付宝buyerId）',
                                    `pay_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付状态：0.待支付；1.已支付；',
                                    `channel_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道订单号',
                                    `extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '额外参数',
                                    `err_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道支付错误码',
                                    `err_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道支付错误描述',
                                    `pay_success_time` datetime NULL DEFAULT NULL COMMENT '支付成功时间',
                                    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                    `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                    `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                    `notify_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通知地址',
                                    `amount` decimal(10, 2) NOT NULL COMMENT '金额',
                                    `return_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                    `quit_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                    `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                    `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                    `terminal_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付端类型',
                                    `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pay_trade_order
-- ----------------------------

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
                                  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
                                  `spu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID',
                                  `sku_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'skuId',
                                  `quantity` int NULL DEFAULT NULL COMMENT '加入数量',
                                  `spu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
                                  `sales_price` decimal(10, 2) NOT NULL COMMENT '销售价格（元）',
                                  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图',
                                  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                  `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0、显示；1、隐藏',
                                  `specs_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格信息',
                                  `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                  `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                  `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购物车' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
                             `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                             `parent_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级id',
                             `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门名称',
                             `leader` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
                             `leader_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人联系电话',
                             `sort` int NULL DEFAULT NULL COMMENT '排序序号',
                             `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
                             `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                             `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：0.正常；1.停用；',
                             `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                             `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '环兴科技有限公司', 'lijx', '17615123397', 1, '0', '2022-02-18 17:46:40', '2024-11-08 16:25:23', '1590229800633634816', '0', NULL, 'admin');
INSERT INTO `sys_dept` VALUES ('1881232178197606401', '0', '系统租户', NULL, NULL, 1, '0', '2025-01-20 14:47:58', NULL, '1881232176465358849', NULL, 'lijx', NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
                             `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                             `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
                             `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
                             `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：0.正常；1.停用；',
                             `remarks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                             `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
                             `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                             `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1583357541572108290', 'sys_storage_type', '文件存储类型', '0', '文件存储配置类型', '0', '2022-10-21 15:20:31', '2022-10-21 15:55:51', NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1585639342383202305', 'status', '状态', '0', '状态', '0', '2022-10-27 22:27:33', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1590901687026937857', 'application_key', '应用key', '0', '应用key用于租户授权', '0', '2022-11-11 10:58:14', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1597072635358756866', 'log_status', '日志状态', '0', NULL, '0', '2022-11-28 11:39:23', NULL, NULL, NULL);
INSERT INTO `sys_dict` VALUES ('1825786096614240258', 'pay_type', '支付类型', '0', '支付类型', '0', '2024-08-20 14:45:02', '2024-08-20 14:46:05', 'admin', 'admin');
INSERT INTO `sys_dict` VALUES ('1825786632403021826', 'pay_status', '支付状态', '0', '支付状态：0.未支付；1.已支付;', '0', '2024-08-20 14:47:09', '2024-08-20 14:47:09', 'admin', 'admin');
INSERT INTO `sys_dict` VALUES ('1825787265549987842', 'delivery_way', '配送方式', '0', '配送方式', '0', '2024-08-20 14:49:40', '2024-08-20 14:49:40', 'admin', 'admin');
INSERT INTO `sys_dict` VALUES ('1845468560374734850', 'user_source', '用户来源', '0', '用户来源', '0', '2024-10-13 22:16:07', NULL, 'admin', NULL);
INSERT INTO `sys_dict` VALUES ('1855529374229479425', 'menu_type', '菜单类型', '0', '菜单类型', '0', '2024-11-10 16:34:12', NULL, 'admin', NULL);
INSERT INTO `sys_dict` VALUES ('1869292192170770434', 'user_sex', '用户性别', '0', '用户性别', '0', '2024-12-18 16:02:43', NULL, 'lijx', NULL);
INSERT INTO `sys_dict` VALUES ('1871032754213273601', 'goods_status', '商品状态', '0', '商品状态', '0', '2024-12-23 11:19:05', NULL, 'admin', NULL);
INSERT INTO `sys_dict` VALUES ('1871032929883308033', 'goods_specs', '商品规格类型', '0', '商品规格类型', '0', '2024-12-23 11:19:47', NULL, 'admin', NULL);
INSERT INTO `sys_dict` VALUES ('1871381190397775873', 'refund_status', '退款状态', '0', '退款状态', '0', '2024-12-24 10:23:39', '2024-12-24 10:23:44', 'lijx', 'lijx');
INSERT INTO `sys_dict` VALUES ('1905998662952812546', 'freight_type', '运费类型', '0', '运费类型：0.包邮；1.固定运费；', '0', '2025-03-29 23:01:08', '2025-03-29 23:01:14', 'system', 'system');
INSERT INTO `sys_dict` VALUES ('1911974209927307266', 'order_status', '订单状态', '0', '订单状态', '0', '2025-04-15 10:45:49', NULL, 'system', NULL);
INSERT INTO `sys_dict` VALUES ('1915049899597111298', 'order_item_status', '订单项状态', '0', '订单项状态', '0', '2025-04-23 22:27:31', NULL, 'system', NULL);
INSERT INTO `sys_dict` VALUES ('1915429675147091970', 'refund_type', '退款类型', '0', '退款类型', '0', '2025-04-24 23:36:36', NULL, 'system', NULL);
INSERT INTO `sys_dict` VALUES ('1917043550726402050', 'order_delivery_status', '发货状态', '0', NULL, '0', '2025-04-29 10:29:34', NULL, 'system', NULL);
INSERT INTO `sys_dict` VALUES ('1927953218776702978', 'pay_terminal_type', '支付端类型', '0', '支付端类型：0-小程序，1-App，2-H5，3-PC，4-公众号', '0', '2025-05-29 13:00:42', NULL, 'system', NULL);
INSERT INTO `sys_dict` VALUES ('1929205944271659009', 'mq_delay_time_level', 'MQ延迟时间级别', '0', 'MQ延迟时间级别', '0', '2025-06-01 23:58:35', NULL, 'system', NULL);

-- ----------------------------
-- Table structure for sys_dict_value
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_value`;
CREATE TABLE `sys_dict_value`  (
                                   `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                   `dict_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典主键',
                                   `dict_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典标签',
                                   `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典键值',
                                   `dict_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型',
                                   `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：0.正常；1.停用；',
                                   `remarks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                                   `sort` int NULL DEFAULT NULL COMMENT '排序序号',
                                   `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                   `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                   `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
                                   `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                   `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                   `show_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回显样式',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典键值表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_value
-- ----------------------------
INSERT INTO `sys_dict_value` VALUES ('1583358198555303938', '1583357541572108290', '阿里OSS', '1', 'sys_storage_type', '0', '阿里OSS', 1, '0', '2022-10-21 15:23:07', NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1583358231816134658', '1583357541572108290', '七牛云', '3', 'sys_storage_type', '0', '七牛云', 2, '0', '2022-10-21 15:23:15', '2022-10-21 15:25:30', NULL, NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1583364488060952577', '1583357541572108290', '腾讯云', '2', 'sys_storage_type', '0', '腾讯云', 3, '0', '2022-10-21 15:48:06', NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1585639417511575553', '1585639342383202305', '正常', '0', 'status', '0', '正常', 1, '0', '2022-10-27 22:27:51', NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1585639464043184129', '1585639342383202305', '停用', '1', 'status', '0', '停用', 2, '0', '2022-10-27 22:28:02', '2024-11-08 15:10:50', NULL, 'admin', NULL);
INSERT INTO `sys_dict_value` VALUES ('1590901958058668034', '1590901687026937857', '基础应用', 'app_base', 'application_key', '0', '商城基础功能', 1, '0', '2022-11-11 10:59:19', '2022-11-11 16:05:37', NULL, NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1590902082256203777', '1590901687026937857', '营销应用', 'app_market', 'application_key', '0', '营销应用包括（优惠券/多人拼团）', 2, '0', '2022-11-11 10:59:48', '2022-11-11 16:05:38', NULL, NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1590902629520601090', '1590901687026937857', '微信小程序', 'app_wechat', 'application_key', '0', '微信小程序', 4, '0', '2022-11-11 11:01:59', '2022-11-11 16:05:40', NULL, NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1592543489640525826', '1590901687026937857', '平台应用', 'sys_key', 'application_key', '0', '平台应用', 5, '0', '2022-11-15 23:42:11', '2022-11-15 23:44:14', NULL, NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1597072888086544385', '1597072635358756866', '成功', '1', 'log_status', '0', '成功', 1, '0', '2022-11-28 11:40:23', NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1597072943552020482', '1597072635358756866', '失败', '0', 'log_status', '0', '失败', 2, '0', '2022-11-28 11:40:36', NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1825786144924233730', '1825786096614240258', '微信支付', '1', 'pay_type', '0', '微信支付', 1, '0', '2024-08-20 14:45:13', '2024-12-24 10:04:11', 'admin', 'lijx', 'success');
INSERT INTO `sys_dict_value` VALUES ('1825786177023242241', '1825786096614240258', '支付宝支付', '2', 'pay_type', '0', '支付宝支付', 2, '0', '2024-08-20 14:45:21', '2024-12-24 10:04:08', 'admin', 'lijx', 'primary');
INSERT INTO `sys_dict_value` VALUES ('1825786695783149569', '1825786632403021826', '未支付', '0', 'pay_status', '0', '未支付', 0, '0', '2024-08-20 14:47:24', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1825786736451121153', '1825786632403021826', '已支付', '1', 'pay_status', '0', '已支付', 1, '0', '2024-08-20 14:47:34', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1825787338904170497', '1825787265549987842', '普通快递', '1', 'delivery_way', '0', '普通快递', 1, '0', '2024-08-20 14:49:58', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1825787372362133505', '1825787265549987842', '上门自提', '2', 'delivery_way', '0', '上门自提', 2, '0', '2024-08-20 14:50:06', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1845468623192825858', '1845468560374734850', '微信小程序', 'WX_MA', 'user_source', '0', '微信小程序', 1, '0', '2024-10-13 22:16:22', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1845468655694487554', '1845468560374734850', 'APP', 'APP', 'user_source', '0', 'APP', 2, '0', '2024-10-13 22:16:29', '2025-05-22 21:49:47', 'admin', 'system', NULL);
INSERT INTO `sys_dict_value` VALUES ('1845468737055596546', '1845468560374734850', '普通H5', 'H5', 'user_source', '0', '普通H5', 3, '0', '2024-10-13 22:16:49', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1855529435244019713', '1855529374229479425', '菜单', '0', 'menu_type', '0', '菜单', 0, '0', '2024-11-10 16:34:26', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1855529480534114306', '1855529374229479425', '按钮', '1', 'menu_type', '0', '按钮', 1, '0', '2024-11-10 16:34:37', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1869292244662484994', '1869292192170770434', '男', '1', 'user_sex', '0', '男', 1, '0', '2024-12-18 16:02:56', NULL, 'lijx', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1869292302673903618', '1869292192170770434', '女', '2', 'user_sex', '0', '女', 2, '0', '2024-12-18 16:03:09', NULL, 'lijx', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1871032820101595138', '1871032754213273601', '已下架', '0', 'goods_status', '0', '已下架', 0, '0', '2024-12-23 11:19:21', '2024-12-23 11:31:45', 'admin', 'admin', 'danger');
INSERT INTO `sys_dict_value` VALUES ('1871032850510299138', '1871032754213273601', '已上架', '1', 'goods_status', '0', '已上架', 1, '0', '2024-12-23 11:19:28', '2024-12-23 11:31:49', 'admin', 'admin', 'success');
INSERT INTO `sys_dict_value` VALUES ('1871033002629316609', '1871032929883308033', '单规格', '0', 'goods_specs', '0', '单规格', 0, '0', '2024-12-23 11:20:05', '2024-12-23 11:31:19', 'admin', 'admin', 'primary');
INSERT INTO `sys_dict_value` VALUES ('1871033035990810626', '1871032929883308033', '多规格', '1', 'goods_specs', '0', '多规格', 1, '0', '2024-12-23 11:20:13', '2024-12-23 11:31:25', 'admin', 'admin', 'success');
INSERT INTO `sys_dict_value` VALUES ('1871381497785733121', '1871381190397775873', '待审核', '1', 'refund_status', '0', '待审核', 1, '0', '2024-12-24 10:24:52', '2025-04-23 22:56:30', 'lijx', 'system', 'primary');
INSERT INTO `sys_dict_value` VALUES ('1871381692225277953', '1871381190397775873', '退款中', '5', 'refund_status', '0', '退款中', 5, '0', '2024-12-24 10:25:39', '2025-04-23 22:57:34', 'lijx', 'system', 'warning');
INSERT INTO `sys_dict_value` VALUES ('1905998759681851393', '1905998662952812546', '包邮', '0', 'freight_type', '0', '包邮', 0, '0', '2025-03-29 23:01:31', NULL, 'system', NULL, 'primary');
INSERT INTO `sys_dict_value` VALUES ('1905998803931758593', '1905998662952812546', '固定运费', '1', 'freight_type', '0', '固定运费', 1, '0', '2025-03-29 23:01:41', NULL, 'system', NULL, 'success');
INSERT INTO `sys_dict_value` VALUES ('1911974266093232129', '1911974209927307266', '已完成', '4', 'order_status', '0', '已完成', 4, '0', '2025-04-15 10:46:02', '2025-04-15 10:46:41', 'system', 'system', 'success');
INSERT INTO `sys_dict_value` VALUES ('1911974503704748033', '1911974209927307266', '待付款', '1', 'order_status', '0', '待付款', 1, '0', '2025-04-15 10:46:59', NULL, 'system', NULL, 'danger');
INSERT INTO `sys_dict_value` VALUES ('1911974545500987393', '1911974209927307266', '待发货', '2', 'order_status', '0', '待发货', 2, '0', '2025-04-15 10:47:09', NULL, 'system', NULL, 'info');
INSERT INTO `sys_dict_value` VALUES ('1911974577667104769', '1911974209927307266', '待收货', '3', 'order_status', '0', '待收货', 3, '0', '2025-04-15 10:47:17', NULL, 'system', NULL, 'warning');
INSERT INTO `sys_dict_value` VALUES ('1911974706469986306', '1911974209927307266', '退款中', '5', 'order_status', '0', '退款中', 5, '0', '2025-04-15 10:47:47', NULL, 'system', NULL, 'primary');
INSERT INTO `sys_dict_value` VALUES ('1911974804155326466', '1911974209927307266', '已取消', '11', 'order_status', '0', '已取消', 11, '0', '2025-04-15 10:48:11', NULL, 'system', NULL, 'danger');
INSERT INTO `sys_dict_value` VALUES ('1915055950136483842', '1915049899597111298', '待发货', '1', 'order_item_status', '0', '待发货', 1, '0', '2025-04-23 22:51:33', '2025-04-27 22:01:15', 'system', 'system', 'primary');
INSERT INTO `sys_dict_value` VALUES ('1915056021531926530', '1915049899597111298', '已发货', '2', 'order_item_status', '0', '已发货', 2, '0', '2025-04-23 22:51:50', NULL, 'system', NULL, 'success');
INSERT INTO `sys_dict_value` VALUES ('1915056057670049794', '1915049899597111298', '售后处理中', '3', 'order_item_status', '0', '售后处理中', 3, '0', '2025-04-23 22:51:59', NULL, 'system', NULL, 'warning');
INSERT INTO `sys_dict_value` VALUES ('1915056181846614018', '1915049899597111298', '退款完成', '6', 'order_item_status', '0', '退款完成', 6, '0', '2025-04-23 22:52:28', NULL, 'system', NULL, 'success');
INSERT INTO `sys_dict_value` VALUES ('1915059719180001281', '1871381190397775873', '退款完成', '6', 'refund_status', '0', '退款完成', 6, '0', '2025-04-23 23:06:32', NULL, 'system', NULL, 'success');
INSERT INTO `sys_dict_value` VALUES ('1915059788511846402', '1871381190397775873', '退款失败', '8', 'refund_status', '0', '退款失败', 8, '0', '2025-04-23 23:06:48', '2025-04-23 23:06:56', 'system', 'system', 'danger');
INSERT INTO `sys_dict_value` VALUES ('1915429758689239042', '1915429675147091970', '仅退款', '1', 'refund_type', '0', '仅退款', 1, '0', '2025-04-24 23:36:56', NULL, 'system', NULL, 'primary');
INSERT INTO `sys_dict_value` VALUES ('1915429822904033282', '1915429675147091970', '退货', '2', 'refund_type', '0', '退货', 2, '0', '2025-04-24 23:37:11', '2025-05-04 20:02:10', 'system', 'system', 'danger');
INSERT INTO `sys_dict_value` VALUES ('1916502673673310210', '1871381190397775873', '审核拒绝', '9', 'refund_status', '0', '审核拒绝', 9, '0', '2025-04-27 22:40:19', NULL, 'system', NULL, 'danger');
INSERT INTO `sys_dict_value` VALUES ('1917043781987741698', '1917043550726402050', '在途', '0', 'order_delivery_status', '0', '在途', 0, '0', '2025-04-29 10:30:29', NULL, 'system', NULL, 'primary');
INSERT INTO `sys_dict_value` VALUES ('1917043829500817409', '1917043550726402050', '揽收', '1', 'order_delivery_status', '0', '揽收', 1, '0', '2025-04-29 10:30:41', NULL, 'system', NULL, 'primary');
INSERT INTO `sys_dict_value` VALUES ('1917043861100703745', '1917043550726402050', '疑难', '2', 'order_delivery_status', '0', '疑难', 2, '0', '2025-04-29 10:30:48', NULL, 'system', NULL, 'primary');
INSERT INTO `sys_dict_value` VALUES ('1917043894059544578', '1917043550726402050', '签收', '3', 'order_delivery_status', '0', '签收', 3, '0', '2025-04-29 10:30:56', NULL, 'system', NULL, 'success');
INSERT INTO `sys_dict_value` VALUES ('1917043937143435265', '1917043550726402050', '退签', '4', 'order_delivery_status', '0', '退签', 4, '0', '2025-04-29 10:31:06', NULL, 'system', NULL, 'info');
INSERT INTO `sys_dict_value` VALUES ('1917043975538094081', '1917043550726402050', '派件', '5', 'order_delivery_status', '0', '派件', 5, '0', '2025-04-29 10:31:15', NULL, 'system', NULL, 'success');
INSERT INTO `sys_dict_value` VALUES ('1917044010703138818', '1917043550726402050', '清关', '8', 'order_delivery_status', '0', '清关', 8, '0', '2025-04-29 10:31:24', NULL, 'system', NULL, 'primary');
INSERT INTO `sys_dict_value` VALUES ('1917044170027970561', '1917043550726402050', '退回', '6', 'order_delivery_status', '0', '退回', 6, '0', '2025-04-29 10:32:02', NULL, 'system', NULL, 'info');
INSERT INTO `sys_dict_value` VALUES ('1917044210259734529', '1917043550726402050', '转投', '7', 'order_delivery_status', '0', '转投', 7, '0', '2025-04-29 10:32:11', NULL, 'system', NULL, 'primary');
INSERT INTO `sys_dict_value` VALUES ('1927953289186484225', '1927953218776702978', '小程序', '0', 'pay_terminal_type', '0', '小程序', 0, '0', '2025-05-29 13:00:58', NULL, 'system', NULL, 'primary');
INSERT INTO `sys_dict_value` VALUES ('1927953320081727490', '1927953218776702978', 'App', '1', 'pay_terminal_type', '0', 'App', 1, '0', '2025-05-29 13:01:06', NULL, 'system', NULL, 'primary');
INSERT INTO `sys_dict_value` VALUES ('1928119897173438466', '1825786096614240258', '0元支付', '0', 'pay_type', '0', '0元支付', 0, '0', '2025-05-30 00:03:01', '2025-05-30 00:03:06', 'system', 'system', 'danger');
INSERT INTO `sys_dict_value` VALUES ('1928797196747186177', '1583357541572108290', 'MinIO', '4', 'sys_storage_type', '0', 'MinIO', 4, '0', '2025-05-31 20:54:22', NULL, 'system', NULL, 'primary');
INSERT INTO `sys_dict_value` VALUES ('1929205321706921986', '1915049899597111298', '已完成', '8', 'order_item_status', '0', '已完成', 8, '0', '2025-06-01 23:56:06', NULL, 'system', NULL, 'success');
INSERT INTO `sys_dict_value` VALUES ('1929206209452335106', '1929205944271659009', '5分钟', '9', 'mq_delay_time_level', '0', '5分钟', 9, '0', '2025-06-01 23:59:38', '2025-06-02 00:00:04', 'system', 'system', 'primary');
INSERT INTO `sys_dict_value` VALUES ('1929206253555441666', '1929205944271659009', '10分钟', '14', 'mq_delay_time_level', '0', '10分钟', 14, '0', '2025-06-01 23:59:48', NULL, 'system', NULL, 'primary');
INSERT INTO `sys_dict_value` VALUES ('1929206298094755842', '1929205944271659009', '20分钟', '15', 'mq_delay_time_level', '0', '20分钟', 15, '0', '2025-06-01 23:59:59', NULL, 'system', NULL, 'primary');
INSERT INTO `sys_dict_value` VALUES ('1929206364058574849', '1929205944271659009', '30分钟', '16', 'mq_delay_time_level', '0', '30分钟', 16, '0', '2025-06-02 00:00:15', NULL, 'system', NULL, 'primary');
INSERT INTO `sys_dict_value` VALUES ('1929206407276683265', '1929205944271659009', '1小时', '17', 'mq_delay_time_level', '0', '1小时', 17, '0', '2025-06-02 00:00:25', NULL, 'system', NULL, 'primary');
INSERT INTO `sys_dict_value` VALUES ('1929206449693679617', '1929205944271659009', '2小时', '18', 'mq_delay_time_level', '0', '2小时', 18, '0', '2025-06-02 00:00:35', NULL, 'system', NULL, 'primary');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
                            `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                            `ip_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
                            `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：0.失败；1.成功；',
                            `create_time` datetime NULL DEFAULT NULL COMMENT '新增时间',
                            `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录地点',
                            `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录用户',
                            `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '日志标题',
                            `request_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式',
                            `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求URI',
                            `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求数据',
                            `request_time` bigint NULL DEFAULT NULL COMMENT '请求时长',
                            `ex_msg` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异常信息',
                            `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作方法',
                            `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                            `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                            `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
                                  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                  `ip_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
                                  `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：0.失败；1.成功；',
                                  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录用户',
                                  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录地点',
                                  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '信息',
                                  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器',
                                  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
                                  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                  `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                  `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logistics_company
-- ----------------------------
DROP TABLE IF EXISTS `sys_logistics_company`;
CREATE TABLE `sys_logistics_company`  (
                                          `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                          `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流编码',
                                          `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物流名称',
                                          `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '状态：0.正常；1.停用；',
                                          `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                          `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                          `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                          `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                          `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                          `wx_delivery_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信运力公司ID',
                                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物流公司表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logistics_company
-- ----------------------------
INSERT INTO `sys_logistics_company` VALUES ('1612686422580277249', 'yuantong', '圆通速递', '0', '2023-01-10 13:43:01', '2025-06-01 21:36:04', '0', NULL, 'system', 'YTO');
INSERT INTO `sys_logistics_company` VALUES ('1612686819944443905', 'yunda', '韵达快递', '0', '2023-01-10 13:44:35', '2025-06-01 21:36:04', '0', NULL, 'system', 'YUNDA');
INSERT INTO `sys_logistics_company` VALUES ('1612689015016665090', 'zhongtong', '中通快递', '0', '2023-01-10 13:53:18', '2025-06-01 21:36:05', '0', NULL, 'system', 'ZTO');
INSERT INTO `sys_logistics_company` VALUES ('1612689189508100098', 'jtexpress', '极兔速递', '0', '2023-01-10 13:54:00', '2023-01-10 13:54:00', '0', NULL, NULL, NULL);
INSERT INTO `sys_logistics_company` VALUES ('1612689250992402433', 'shunfeng', '顺丰速运', '0', '2023-01-10 13:54:14', '2025-06-01 21:36:04', '0', NULL, 'system', 'SF');
INSERT INTO `sys_logistics_company` VALUES ('1612689310660571137', 'ems', 'EMS', '0', '2023-01-10 13:54:29', '2023-01-10 13:54:29', '0', NULL, NULL, NULL);
INSERT INTO `sys_logistics_company` VALUES ('1612689351961882626', 'jd', '京东物流', '0', '2023-01-10 13:54:38', '2023-01-10 13:54:38', '0', NULL, NULL, NULL);
INSERT INTO `sys_logistics_company` VALUES ('1612689394026557441', 'debangkuaidi', '德邦快递', '0', '2023-01-10 13:54:48', '2025-06-01 21:36:02', '0', NULL, 'system', 'DB');
INSERT INTO `sys_logistics_company` VALUES ('1612689470857818113', 'huitongkuaidi', '百世快递', '0', '2023-01-10 13:55:07', '2025-06-01 21:36:02', '0', NULL, 'system', 'BEST');
INSERT INTO `sys_logistics_company` VALUES ('1612699111595687938', 'rrs', '日日顺物流', '0', '2023-01-10 14:33:25', '2023-01-10 14:33:25', '0', NULL, NULL, NULL);
INSERT INTO `sys_logistics_company` VALUES ('1929170070968348674', NULL, '安能物流', '0', '2025-06-01 21:36:02', NULL, '0', 'system', NULL, 'ANE');
INSERT INTO `sys_logistics_company` VALUES ('1929170073375879169', NULL, '中国邮政速递物流', '0', '2025-06-01 21:36:02', NULL, '0', 'system', NULL, 'EMS');
INSERT INTO `sys_logistics_company` VALUES ('1929170074353152002', NULL, '天天快递', '0', '2025-06-01 21:36:03', NULL, '0', 'system', NULL, 'HHTT');
INSERT INTO `sys_logistics_company` VALUES ('1929170075351396354', NULL, '京东快递', '0', '2025-06-01 21:36:03', NULL, '0', 'system', NULL, 'JDL');
INSERT INTO `sys_logistics_company` VALUES ('1929170076353835010', NULL, '极兔快递', '0', '2025-06-01 21:36:03', NULL, '0', 'system', NULL, 'JTSD');
INSERT INTO `sys_logistics_company` VALUES ('1929170077549211650', NULL, '品骏快递', '0', '2025-06-01 21:36:03', NULL, '0', 'system', NULL, 'PJ');
INSERT INTO `sys_logistics_company` VALUES ('1929170079189184513', NULL, '申通快递', '0', '2025-06-01 21:36:04', NULL, '0', 'system', NULL, 'STO');
INSERT INTO `sys_logistics_company` VALUES ('1929170080149680129', NULL, '优速快递', '0', '2025-06-01 21:36:04', NULL, '0', 'system', NULL, 'UCE');

-- ----------------------------
-- Table structure for sys_material
-- ----------------------------
DROP TABLE IF EXISTS `sys_material`;
CREATE TABLE `sys_material`  (
                                 `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'PK',
                                 `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型1、图片；2、视频',
                                 `group_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '-1' COMMENT '分组ID  -1.未分组',
                                 `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '素材名',
                                 `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '素材链接',
                                 `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                 `update_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
                                 `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                 `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                 `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                 `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                 `file_size` int NULL DEFAULT NULL COMMENT '素材大小'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '素材' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_material
-- ----------------------------

-- ----------------------------
-- Table structure for sys_material_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_material_group`;
CREATE TABLE `sys_material_group`  (
                                       `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                       `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分组名称',
                                       `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                       `update_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
                                       `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
                                       `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '分组类型：1.图片；2.视频',
                                       `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                       `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                       `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                       `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '素材分组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_material_group
-- ----------------------------
INSERT INTO `sys_material_group` VALUES ('1923732594174885889', '华为', '2025-05-17 21:29:26', NULL, 0, '1', '1590229800633634816', 'system', NULL, '0');
INSERT INTO `sys_material_group` VALUES ('1925780687978283010', '微信二维码', '2025-05-23 13:07:50', '2025-05-26 10:30:15', 0, '1', '1590229800633634816', 'system', 'system', '0');
INSERT INTO `sys_material_group` VALUES ('1932710590376075266', '123132', '2025-06-11 16:04:47', '2025-06-11 16:04:55', 0, '1', '1590229800633634816', 'system', 'system', '1');
INSERT INTO `sys_material_group` VALUES ('1936377069242032129', '1', '2025-06-21 18:54:04', NULL, 0, '1', '1590229800633634816', 'system', NULL, '0');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
                             `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                             `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
                             `permission` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单权限',
                             `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL',
                             `redirect` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重定向url',
                             `parent_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父菜单ID',
                             `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
                             `component` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '页面地址',
                             `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
                             `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型: 0.菜单; 1.按钮;',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                             `outer_status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '外链状态：0.否；1.是；',
                             `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                             `application_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用id',
                             `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                             `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('100001', '菜单管理新增', 'upms:sysmenu:add', NULL, NULL, '10002', NULL, '', 0, '1', '2021-12-01 09:44:37', '2022-11-11 17:34:43', '0', '0', 'sys_key', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('10001', '系统设置', NULL, '/system', '/system/user', '0', 'carbon:settings', '', 80, '0', '2021-11-26 11:38:57', '2025-05-13 21:58:52', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('10002', '菜单管理', NULL, '/platform/menu', NULL, '1881217134381326338', 'carbon:menu', 'upms/menu/index', 3, '0', '2021-11-26 11:37:40', '2025-05-13 22:03:11', '0', '0', 'sys_key', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1491684226094198786', '角色管理', NULL, '/system/role', NULL, '10001', 'carbon:user-role', 'upms/role/index', 2, '0', '2022-02-10 16:03:27', '2025-05-20 22:54:06', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1491690996678021121', '角色管理列表', 'upms:sysrole:page', NULL, NULL, '1491684226094198786', '', NULL, 1, '1', '2022-02-10 16:30:21', '2022-11-11 17:34:48', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1491752531735490561', '用户管理', NULL, '/system/user', NULL, '10001', 'carbon:user', 'upms/user/index', 1, '0', '2022-02-10 20:34:54', '2025-05-20 22:53:58', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1491756888363307009', '用户列表', 'upms:sysuser:page', NULL, NULL, '1491752531735490561', '', NULL, 1, '1', '2022-02-10 20:52:13', '2022-11-10 17:04:12', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1491757020773289986', '用户查询', 'upms:sysuser:get', NULL, NULL, '1491752531735490561', '', NULL, 1, '1', '2022-02-10 20:52:44', '2022-11-10 17:04:12', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1491757382771085313', '用户新增', 'upms:sysuser:add', NULL, NULL, '1491752531735490561', '', NULL, 1, '1', '2022-02-10 20:54:11', '2022-11-10 17:04:13', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1491948958826921986', '文件存储配置', NULL, '/system/storage-config', NULL, '10001', 'carbon:settings-edit', 'upms/storage-config/index', 15, '0', '2022-02-11 09:35:25', '2025-05-20 22:56:21', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1491949315883827201', '文件存储配置查询', 'upms:storageconfig:get', NULL, NULL, '1491948958826921986', '', NULL, 1, '1', '2022-02-11 09:36:50', '2022-11-11 17:34:51', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1491969633293729794', '文件存储配置修改', 'upms:storageconfig:edit', NULL, NULL, '1491948958826921986', '', NULL, 1, '1', '2022-02-11 10:57:34', '2022-11-11 17:34:53', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1491973212968632322', '素材中心', NULL, '/system/material', NULL, '10001', 'carbon:image', 'upms/material/index', 50, '0', '2022-02-11 11:11:47', '2025-05-20 22:56:38', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1493578977630121986', '素材中心列表', 'upms:material:page', NULL, NULL, '1491973212968632322', NULL, NULL, 1, '1', '2022-02-15 21:32:38', '2024-08-21 21:23:37', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1493578977978249218', '素材中心查询', 'upms:material:get', NULL, NULL, '1491973212968632322', NULL, NULL, 1, '1', '2022-02-15 21:32:38', '2024-08-21 21:24:11', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1493578978313793537', '素材中心添加', 'upms:material:add', NULL, NULL, '1491973212968632322', NULL, NULL, 1, '1', '2022-02-15 21:32:38', '2024-08-21 21:33:54', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1493578978649337858', '素材中心修改', 'upms:material:edit', NULL, NULL, '1491973212968632322', NULL, NULL, 1, '1', '2022-02-15 21:32:38', '2024-08-21 21:34:23', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1493587910381957121', '商品管理查询', 'product:goodsspu:get', NULL, NULL, '1532620395988029442', NULL, NULL, 1, '1', '2022-02-15 22:08:02', '2024-10-15 10:38:17', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1493587910721695745', '商品管理添加', 'product:goodsspu:add', NULL, NULL, '1532620395988029442', NULL, NULL, 1, '1', '2022-02-15 22:08:02', '2024-10-15 10:38:24', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1493587911057240066', '商品管理修改', 'product:goodsspu:edit', NULL, NULL, '1532620395988029442', NULL, NULL, 1, '1', '2022-02-15 22:08:02', '2024-10-15 10:38:30', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1493596733666652162', '素材分组查询', 'upms:materialgroup:get', NULL, NULL, '1491973212968632322', '', NULL, 2, '1', '2022-02-15 22:43:05', '2024-08-21 21:36:48', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1493766204259942401', '素材分组新增', 'upms:materialgroup:add', NULL, NULL, '1491973212968632322', '', NULL, 2, '1', '2022-02-16 09:56:27', '2024-08-21 21:36:55', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1493836091183411202', '角色管理查询', 'upms:sysrole:get', NULL, NULL, '1491684226094198786', '', NULL, 1, '1', '2022-02-16 14:34:10', '2022-11-11 17:34:56', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1493836209106268161', '角色管理新增', 'upms:sysrole:add', NULL, NULL, '1491684226094198786', '', NULL, 1, '1', '2022-02-16 14:34:38', '2022-11-11 17:34:57', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1493836280589791233', '角色管理修改', 'upms:sysrole:edit', NULL, NULL, '1491684226094198786', '', NULL, 1, '1', '2022-02-16 14:34:55', '2022-11-11 17:34:58', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1493841029473042434', '角色管理删除', 'upms:sysrole:del', NULL, NULL, '1491684226094198786', '', NULL, 1, '1', '2022-02-16 14:53:47', '2022-11-11 17:35:00', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1493884088730529793', '日志管理', NULL, '/system/log', '/system/log/loginlog', '10001', 'carbon:catalog', '', 10, '0', '2022-02-16 17:44:53', '2025-05-15 11:34:34', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1493884379760701442', '登录日志', NULL, '/system/log/login', NULL, '1493884088730529793', 'carbon:catalog', 'upms/login-log/index', 1, '0', '2022-02-16 17:46:02', '2025-05-19 17:08:14', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1494151991157673985', '操作日志', NULL, '/system/log/log', NULL, '1493884088730529793', 'carbon:catalog', 'upms/log/index', 20, '0', '2022-02-17 11:29:28', '2025-05-15 11:35:18', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1494153372996255746', '操作日志列表', 'upms:syslog:page', NULL, NULL, '1494151991157673985', NULL, NULL, 1, '1', '2022-02-17 11:34:57', '2022-11-11 17:35:07', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1494153373352771586', '操作日志查询', 'upms:syslog:get', NULL, NULL, '1494151991157673985', NULL, NULL, 1, '1', '2022-02-17 11:34:58', '2022-11-11 17:35:07', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1494153373696704514', '操作日志新增', 'upms:syslog:add', NULL, NULL, '1494151991157673985', NULL, NULL, 1, '1', '2022-02-17 11:34:58', '2022-11-11 17:35:07', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1494153374053220354', '操作日志修改', 'upms:syslog:edit', NULL, NULL, '1494151991157673985', NULL, NULL, 1, '1', '2022-02-17 11:34:58', '2022-11-11 17:35:07', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1494153374401347585', '操作日志删除', 'upms:syslog:del', NULL, NULL, '1494151991157673985', NULL, NULL, 1, '1', '2022-02-17 11:34:58', '2022-11-11 17:35:07', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1494192758630694913', '登录日志列表', 'upms:sysloginlog:page', NULL, NULL, '1493884379760701442', NULL, NULL, 1, '1', '2022-02-17 14:11:28', '2022-11-11 17:35:07', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1494192758974627842', '登录日志查询', 'upms:sysloginlog:get', NULL, NULL, '1493884379760701442', NULL, NULL, 1, '1', '2022-02-17 14:11:28', '2022-11-11 17:35:07', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1494192759318560770', '登录日志新增', 'upms:sysloginlog:add', NULL, NULL, '1493884379760701442', NULL, NULL, 1, '1', '2022-02-17 14:11:28', '2022-11-11 17:35:07', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1494192759662493698', '登录日志修改', 'upms:sysloginlog:edit', NULL, NULL, '1493884379760701442', NULL, NULL, 1, '1', '2022-02-17 14:11:28', '2022-11-11 17:35:07', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1494192760010620930', '登录日志删除', 'upms:sysloginlog:del', NULL, NULL, '1493884379760701442', NULL, NULL, 1, '1', '2022-02-17 14:11:28', '2022-11-11 17:35:08', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1494216988311183361', '部门管理', NULL, '/system/dept', NULL, '10001', 'carbon:model-builder', 'upms/dept/index', 4, '0', '2022-02-17 15:47:45', '2025-05-20 22:55:40', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1494217080162246658', '部门管理列表', 'upms:sysdept:page', NULL, NULL, '1494216988311183361', NULL, NULL, 1, '1', '2022-02-17 15:48:06', '2022-11-11 17:35:08', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1494217080510373890', '部门管理查询', 'upms:sysdept:get', NULL, NULL, '1494216988311183361', NULL, NULL, 1, '1', '2022-02-17 15:48:06', '2022-11-11 17:35:08', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1494217080858501121', '部门管理新增', 'upms:sysdept:add', NULL, NULL, '1494216988311183361', NULL, NULL, 1, '1', '2022-02-17 15:48:06', '2022-11-11 17:35:08', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1494217081206628354', '部门管理修改', 'upms:sysdept:edit', NULL, NULL, '1494216988311183361', NULL, NULL, 1, '1', '2022-02-17 15:48:06', '2022-11-11 17:35:08', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1494217081558949890', '部门管理删除', 'upms:sysdept:del', NULL, NULL, '1494216988311183361', NULL, NULL, 1, '1', '2022-02-17 15:48:07', '2022-11-11 17:35:08', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1494514119857180674', '用户修改', 'upms:sysuser:edit', NULL, NULL, '1491752531735490561', '', NULL, 1, '1', '2022-02-18 11:28:25', '2022-11-10 17:04:16', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1495687621054353410', '菜单管理修改', 'upms:sysmenu:edit', NULL, NULL, '10002', '', NULL, 1, '1', '2022-02-21 17:11:31', '2022-11-11 17:35:10', '0', '0', 'sys_key', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1495687858816864257', '菜单管理删除', 'upms:sysmenu:del', NULL, NULL, '10002', '', NULL, 1, '1', '2022-02-21 17:12:28', '2022-11-11 17:35:11', '0', '0', 'sys_key', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1496012487833960450', '商品管理删除', 'product:goodsspu:del', NULL, NULL, '1532620395988029442', '', NULL, 1, '1', '2022-02-22 14:42:24', '2024-10-15 10:38:38', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1496327483721789441', '商品类目', NULL, '/product/goods-category', NULL, '1779386487675092994', 'carbon:category', 'product/goods-category/index', 5, '0', '2022-02-23 11:34:04', '2025-06-23 22:19:08', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1496327552973942785', '商品类目列表', 'product:goodscategory:page', NULL, NULL, '1496327483721789441', NULL, NULL, 1, '1', '2022-02-23 11:34:20', '2024-10-15 10:41:07', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1496327553334652930', '商品类目查询', 'product:goodscategory:get', NULL, NULL, '1496327483721789441', NULL, NULL, 1, '1', '2022-02-23 11:34:21', '2024-10-15 10:41:21', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1496327553699557377', '商品类目新增', 'product:goodscategory:add', NULL, NULL, '1496327483721789441', NULL, NULL, 1, '1', '2022-02-23 11:34:21', '2024-10-15 10:41:28', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1496327554068656130', '商品类目修改', 'product:goodscategory:edit', NULL, NULL, '1496327483721789441', NULL, NULL, 1, '1', '2022-02-23 11:34:21', '2024-10-15 10:42:06', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1496327554433560577', '商品类目删除', 'product:goodscategory:del', NULL, NULL, '1496327483721789441', NULL, NULL, 1, '1', '2022-02-23 11:34:21', '2024-10-15 10:42:12', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1497468294740176898', '商品管理列表', 'product:goodsspu:page', NULL, NULL, '1532620395988029442', '', NULL, 1, '1', '2022-02-26 15:07:17', '2024-10-15 10:38:44', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1521469373525716994', '菜单管理列表', 'upms:sysmenu:page', NULL, NULL, '10002', '', NULL, 1, '1', '2022-05-03 20:39:03', '2022-11-11 17:35:14', '0', '0', 'sys_key', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1521496866882236418', '订单管理', NULL, '/order', '/order/orderinfo', '0', 'carbon:border-full', '', 40, '0', '2022-05-03 22:28:18', '2025-05-13 21:54:33', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1526179827628048385', '素材中心删除', 'upms:material:del', NULL, NULL, '1491973212968632322', 'icon-m-fuwenben', NULL, 1, '1', '2022-05-16 20:36:42', '2024-08-21 21:36:41', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1527471479688798209', '会员列表', NULL, '/user/user-list', NULL, '1779386898750439425', 'carbon:user-avatar', 'user/user-info/index', 1, '0', '2022-05-20 10:09:14', '2025-05-19 16:12:16', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1527471918001954818', '商城用户列表', 'user:userinfo:page', NULL, NULL, '1527471479688798209', NULL, NULL, 1, '1', '2022-05-20 10:10:58', '2024-10-13 22:23:17', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1527471918337499138', '商城用户查询', 'user:userinfo:get', NULL, NULL, '1527471479688798209', NULL, NULL, 1, '1', '2022-05-20 10:10:58', '2024-10-13 22:23:23', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1527471918694014977', '商城用户新增', 'user:userinfo:add', NULL, NULL, '1527471479688798209', NULL, NULL, 1, '1', '2022-05-20 10:10:58', '2024-10-13 22:23:28', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1527471919042142209', '商城用户修改', 'user:userinfo:edit', NULL, NULL, '1527471479688798209', NULL, NULL, 1, '1', '2022-05-20 10:10:58', '2024-10-13 22:23:35', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1527471919386075137', '商城用户删除', 'user:userinfo:del', NULL, NULL, '1527471479688798209', NULL, NULL, 1, '1', '2022-05-20 10:10:58', '2024-10-13 22:23:40', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1527835787455164418', '商城装修', NULL, '/page-design', '/theme/home', '0', 'carbon:color-palette', '', 25, '0', '2022-05-21 10:16:50', '2025-07-16 22:08:16', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1527928859455168514', '服务监控', NULL, '/platform/server', NULL, '1881217134381326338', 'carbon:manage-protection', 'upms/sys-server/index', 25, '0', '2022-05-21 16:26:40', '2025-05-19 16:21:13', '0', '0', 'sys_key', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1527947365856878593', '服务监控查询', 'upms:sysserver:get', '', NULL, '1527928859455168514', '', NULL, 1, '1', '2022-05-21 17:40:14', '2025-06-15 23:20:54', '0', '0', 'sys_key', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1531445896986435585', '支付配置', NULL, '/pay/config', NULL, '1670722611195203586', 'carbon:settings-edit', 'pay/config/index', 5, '0', '2022-05-31 09:22:09', '2025-05-19 16:16:59', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1531446009649635329', '支付配置列表', 'pay:payconfig:page', NULL, NULL, '1531445896986435585', NULL, NULL, 1, '1', '2022-05-31 09:22:36', '2024-10-15 10:59:58', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1531446009779658754', '支付配置查询', 'pay:payconfig:get', NULL, NULL, '1531445896986435585', NULL, NULL, 1, '1', '2022-05-31 09:22:36', '2024-10-15 11:00:04', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1531446009913876482', '支付配置新增', 'pay:payconfig:add', NULL, NULL, '1531445896986435585', NULL, NULL, 1, '1', '2022-05-31 09:22:36', '2024-10-15 11:00:11', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1531446010039705602', '支付配置修改', 'pay:payconfig:edit', NULL, NULL, '1531445896986435585', NULL, NULL, 1, '1', '2022-05-31 09:22:36', '2024-10-15 11:00:17', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1531446010169729026', '支付配置删除', 'pay:payconfig:del', NULL, NULL, '1531445896986435585', NULL, NULL, 1, '1', '2022-05-31 09:22:36', '2024-10-15 11:00:23', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1531528760525074434', '商城订单', NULL, '/order/order-info', NULL, '1521496866882236418', 'carbon:order-details', 'order/order-info/index', 10, '0', '2022-05-31 14:51:23', '2025-05-19 16:15:41', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1531529196871102466', '商城退单', NULL, '/order/order-refund', NULL, '1521496866882236418', 'carbon:return', 'order/order-refund/index', 20, '0', '2022-05-31 14:53:07', '2025-05-19 16:16:15', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1531536449854517250', '商城订单列表', 'order:orderinfo:page', NULL, NULL, '1531528760525074434', '', NULL, 1, '1', '2022-05-31 15:21:57', '2024-10-15 10:49:27', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1531536545572728833', '商城订单查询', 'order:orderinfo:get', NULL, NULL, '1531528760525074434', '', NULL, 1, '1', '2022-05-31 15:22:19', '2024-10-15 10:49:33', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1531536746446336001', '商城订单删除', 'order:orderinfo:del', NULL, NULL, '1531528760525074434', '', NULL, 1, '1', '2022-05-31 15:23:07', '2024-10-15 10:49:39', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1531536866638311426', '商城订单发货', 'order:orderinfo:deliver', NULL, NULL, '1531528760525074434', '', NULL, 1, '1', '2022-05-31 15:23:36', '2024-10-15 10:49:56', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1531537172243689474', '商城退单列表', 'order:orderrefund:page', NULL, NULL, '1531529196871102466', '', NULL, 1, '1', '2022-05-31 15:24:49', '2024-10-15 10:59:31', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1531537289042472961', '商城退单查询', 'order:orderrefund:get', NULL, NULL, '1531529196871102466', '', NULL, 1, '1', '2022-05-31 15:25:17', '2024-10-15 10:59:36', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1531846893999169537', '微信小程序', NULL, '/miniapp/wxapp', NULL, '1539129183310196738', 'carbon:settings', 'miniapp/wxapp/index', 5, '0', '2022-06-01 11:55:34', '2025-05-14 16:01:00', '0', '0', 'app_wechat', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1531882841361915906', '微信应用列表', 'weixin:wxapp:page', NULL, NULL, '1531846893999169537', '', NULL, 1, '1', '2022-06-01 14:18:22', '2022-11-10 17:04:22', '0', '0', 'app_wechat', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1532620101065543681', '商品规格', NULL, '/product/goods-specs', NULL, '1779386487675092994', 'carbon:settings', 'product/goods-specs/index', 15, '0', '2022-06-03 15:08:01', '2025-05-19 16:15:58', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1532620395988029442', '全部商品', NULL, '/product/goods/spu', '', '1779386487675092994', 'carbon:product', 'product/goods-spu/index', 10, '0', '2022-06-03 15:09:11', '2025-05-19 16:14:40', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1532620840659750914', '商品规格列表', 'product:goodsspecs:page', NULL, NULL, '1532620101065543681', '', NULL, 1, '1', '2022-06-03 15:10:57', '2024-10-15 10:38:53', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1532620931885862913', '商品规格查询', 'product:goodsspecs:get', '', NULL, '1532620101065543681', '', NULL, 1, '1', '2022-06-03 15:11:19', '2024-10-15 10:39:00', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1532621007333003266', '商品规格新增', 'product:goodsspecs:add', NULL, NULL, '1532620101065543681', '', NULL, 1, '1', '2022-06-03 15:11:37', '2024-10-15 10:39:07', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1532621107589451778', '商品规格修改', 'product:goodsspecs:edit', NULL, NULL, '1532620101065543681', '', NULL, 1, '1', '2022-06-03 15:12:01', '2024-10-15 10:39:14', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1532621196013768706', '商品规格删除', 'product:goodsspecs:del', NULL, NULL, '1532620101065543681', '', NULL, 1, '1', '2022-06-03 15:12:22', '2024-10-15 10:39:23', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1532634358100430850', '商品规格值列表', 'product:goodsspecsvalue:page', NULL, NULL, '1532620101065543681', '', NULL, 2, '1', '2022-06-03 16:04:40', '2024-10-15 10:39:30', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1532634435510505473', '商品规格值查询', 'product:goodsspecsvalue:get', NULL, NULL, '1532620101065543681', '', NULL, 2, '1', '2022-06-03 16:04:59', '2024-10-15 10:40:20', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1532634517374930946', '商品规格值新增', 'product:goodsspecsvalue:add', NULL, NULL, '1532620101065543681', '', NULL, 2, '1', '2022-06-03 16:05:18', '2024-10-15 10:40:26', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1532634586568364034', '商品规格值修改', 'product:goodsspecsvalue:edit', NULL, NULL, '1532620101065543681', '', NULL, 2, '1', '2022-06-03 16:05:35', '2024-10-15 10:40:32', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1532634687902748674', '商品规格值删除', 'product:goodsspecsvalue:del', NULL, NULL, '1532620101065543681', 'icon-ziti', NULL, 2, '1', '2022-06-03 16:05:59', '2025-04-23 22:17:05', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1535633963410956289', '物流信息查询', 'order:orderLogistics:get', NULL, NULL, '1531528760525074434', '', NULL, 1, '1', '2022-06-11 22:44:03', '2024-10-15 10:50:02', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1536174316656533505', '物流公司', NULL, '/platform/logistics-company', NULL, '1881217134381326338', 'carbon:settings-edit', 'upms/logistics-company/index', 100, '0', '2022-06-13 10:31:10', '2025-07-16 22:09:01', '0', '0', 'sys_key', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1536174413406543874', '物流公司查询', 'upms:logisticscompany:get', '', NULL, '1536174316656533505', '', NULL, 1, '1', '2022-06-13 10:31:33', '2025-07-16 22:09:10', '0', '0', 'sys_key', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1537048076783616001', '素材分组列表', 'upms:materialgroup:page', NULL, NULL, '1491973212968632322', '', NULL, 2, '1', '2022-06-15 20:23:13', '2024-08-21 21:37:01', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1537066492991012865', '素材分组修改', 'upms:materialgroup:edit', NULL, NULL, '1491973212968632322', '', NULL, 2, '1', '2022-06-15 21:36:23', '2024-08-21 21:37:07', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1537066557067395074', '素材分组删除', 'upms:materialgroup:del', NULL, NULL, '1491973212968632322', '', NULL, 2, '1', '2022-06-15 21:36:39', '2024-08-21 22:07:04', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1539129183310196738', '小程序管理', NULL, '/miniapp', '/miniapp/wxapp', '0', 'carbon:settings', '', 70, '0', '2022-06-21 14:12:46', '2025-05-13 21:59:01', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1543116535774879745', '商城退单退款', 'order:orderrefund:refund', NULL, NULL, '1531529196871102466', '', NULL, 1, '1', '2022-07-02 14:17:06', '2024-10-15 10:59:43', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1547110946242326529', '用户修改密码', 'upms:sysuser:password', NULL, NULL, '1491752531735490561', '', NULL, 1, '1', '2022-07-13 14:49:27', '2022-11-10 17:04:26', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1547111164111253505', '用户删除', 'upms:sysuser:del', NULL, NULL, '1491752531735490561', '', NULL, 1, '1', '2022-07-13 14:50:19', '2022-11-10 17:04:26', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1583296344638287874', '字典管理', NULL, '/platform/dict', NULL, '1881217134381326338', 'carbon:ibm-cloud-sysdig-secure', 'upms/dict/index', 5, '0', '2022-10-21 11:17:20', '2025-06-15 23:20:06', '0', '0', 'sys_key', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1583296419947016193', '字典列表', 'upms:sysdict:page', NULL, NULL, '1583296344638287874', '', NULL, 1, '1', '2022-10-21 11:17:38', '2022-11-10 17:04:30', '0', '0', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1583296499370356738', '字典键值列表', 'upms:sysdictvalue:page', NULL, NULL, '1583296344638287874', '', NULL, 2, '1', '2022-10-21 11:17:57', '2022-11-10 17:04:30', '0', '0', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1583346865315131394', '字典新增', 'upms:sysdict:add', NULL, NULL, '1583296344638287874', '', NULL, 1, '1', '2022-10-21 14:38:05', '2022-11-10 17:04:30', '0', '0', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1583346942263832578', '字典修改', 'upms:sysdict:edit', NULL, NULL, '1583296344638287874', '', NULL, 1, '1', '2022-10-21 14:38:23', '2022-11-10 17:04:30', '0', '0', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1583347000673710082', '字典删除', 'upms:sysdict:del', NULL, NULL, '1583296344638287874', '', NULL, 1, '1', '2022-10-21 14:38:37', '2022-11-10 17:04:31', '0', '0', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1583351948518031361', '字典查询', 'upms:sysdict:get', NULL, NULL, '1583296344638287874', '', NULL, 1, '1', '2022-10-21 14:58:17', '2022-11-10 17:04:31', '0', '0', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1583355071571648514', '字典键值查询', 'upms:sysdictvalue:get', NULL, NULL, '1583296344638287874', '', NULL, 2, '1', '2022-10-21 15:10:41', '2022-11-10 17:04:31', '0', '0', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1583355125187436546', '字典键值新增', 'upms:sysdictvalue:add', NULL, NULL, '1583296344638287874', '', NULL, 2, '1', '2022-10-21 15:10:54', '2022-11-10 17:04:31', '0', '0', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1583355179121991681', '字典键值修改', 'upms:sysdictvalue:edit', NULL, NULL, '1583296344638287874', '', NULL, 2, '1', '2022-10-21 15:11:07', '2022-11-10 17:04:31', '0', '0', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1583355228157599745', '字典键值删除', 'upms:sysdictvalue:del', NULL, NULL, '1583296344638287874', '', NULL, 2, '1', '2022-10-21 15:11:19', '2022-11-10 17:04:31', '0', '0', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1585191363078467586', '优惠券', NULL, '/promotion/coupon', '/promotion/coupon/info', '1779386604402573314', 'carbon:settings', '', 1, '0', '2022-10-26 16:47:27', '2025-05-13 22:19:19', '0', '0', 'app_market', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1585191589231144962', '优惠券管理', NULL, '/promotion/coupon/info', NULL, '1585191363078467586', 'carbon:settings-edit', 'promotion/coupon-info/index', 1, '0', '2022-10-26 16:48:21', '2025-05-19 16:17:53', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1585192004932808706', '优惠券列表', 'promotion:couponinfo:page', NULL, NULL, '1585191589231144962', '', NULL, 1, '1', '2022-10-26 16:50:00', '2024-10-15 11:04:26', '0', '0', 'app_market', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1585192140589182977', '优惠券查询', 'promotion:couponinfo:get', NULL, NULL, '1585191589231144962', '', NULL, 1, '1', '2022-10-26 16:50:32', '2024-10-15 11:04:34', '0', '0', 'app_market', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1585192296575348738', '优惠券新增', 'promotion:couponinfo:add', NULL, NULL, '1585191589231144962', '', NULL, 1, '1', '2022-10-26 16:51:09', '2024-10-15 11:04:40', '0', '0', 'app_market', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1585192489970511873', '优惠券修改', 'promotion:couponinfo:edit', NULL, NULL, '1585191589231144962', '', NULL, 1, '1', '2022-10-26 16:51:55', '2024-10-15 11:04:47', '0', '0', 'app_market', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1585192568882147330', '优惠券删除', 'promotion:couponinfo:del', NULL, NULL, '1585191589231144962', '', NULL, 1, '1', '2022-10-26 16:52:14', '2024-10-15 11:04:59', '0', '0', 'app_market', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1585916026725281793', '用户领券记录', NULL, '/promotion/coupon/user', NULL, '1585191363078467586', 'carbon:list', 'promotion/coupon-user/index', 10, '0', '2022-10-28 16:47:00', '2025-05-19 16:18:04', '0', '0', 'app_market', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1585916172586397697', '用户领券记录列表', 'promotion:couponuser:page', NULL, NULL, '1585916026725281793', '', NULL, 1, '1', '2022-10-28 16:47:35', '2024-10-15 11:05:07', '0', '0', 'app_market', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1590265776187023362', '租户管理', NULL, '/platform/tenant', NULL, '1881217134381326338', 'carbon:home', 'upms/tenant/index', 6, '0', '2022-11-09 16:51:21', '2025-05-13 22:05:01', '0', '0', 'sys_key', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1590265951848669185', '租户列表', 'upms:systenant:page', NULL, NULL, '1590265776187023362', '', NULL, 1, '1', '2022-11-09 16:52:03', '2022-11-10 17:04:32', '0', '0', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1590266107100831746', '租户新增', 'upms:systenant:add', NULL, NULL, '1590265776187023362', '', NULL, 1, '1', '2022-11-09 16:52:40', '2022-11-10 17:04:32', '0', '0', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1590700851537625090', '更新角色菜单', 'upms:sysrole:update', NULL, NULL, '1491684226094198786', '', NULL, 1, '1', '2022-11-10 21:40:11', '2022-11-11 17:36:07', '0', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1590704386824192002', '租户查询', 'upms:systenant:get', NULL, NULL, '1590265776187023362', '', NULL, 1, '1', '2022-11-10 21:54:14', '2022-11-10 21:54:14', '0', '0', '', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1590704512468762626', '租户修改', 'upms:systenant:edit', NULL, NULL, '1590265776187023362', '', NULL, 1, '1', '2022-11-10 21:54:44', '2022-11-10 21:54:44', '0', '0', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1590972046640115713', '租户套餐', NULL, '/platform/tenant-package', NULL, '1881217134381326338', 'carbon:settings', 'upms/tenant-package/index', 8, '0', '2022-11-11 15:37:49', '2025-05-19 16:11:12', '0', '0', 'sys_key', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1590972187874914305', '租户套餐列表', 'upms:tenantpackage:page', NULL, NULL, '1590972046640115713', '', NULL, 1, '1', '2022-11-11 15:38:23', '2022-11-11 15:38:23', '0', '0', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1590972258943201281', '租户套餐查询', 'upms:tenantpackage:get', NULL, NULL, '1590972046640115713', '', NULL, 1, '1', '2022-11-11 15:38:40', '2022-11-11 15:38:40', '0', '0', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1590972321283141633', '租户套餐新增', 'upms:tenantpackage:add', NULL, NULL, '1590972046640115713', '', NULL, 1, '1', '2022-11-11 15:38:54', '2022-11-11 15:38:54', '0', '0', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1590972375171559426', '租户套餐修改', 'upms:tenantpackage:edit', NULL, NULL, '1590972046640115713', '', NULL, 1, '1', '2022-11-11 15:39:07', '2022-11-11 15:39:07', '0', '0', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1590972439457656833', '租户删除套餐', 'upms:tenantpackage:del', NULL, NULL, '1590972046640115713', '', NULL, 1, '1', '2022-11-11 15:39:23', '2022-11-11 15:39:23', '0', '0', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1600477837933047810', '微页面', '', '/promotion/page-design', '', '1527835787455164418', 'carbon:page-number', 'promotion/page-design/index', 10, '0', '2022-12-07 21:10:26', '2025-07-16 22:08:39', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1600478029277196290', '页面设计列表', 'promotion:pagedesign:page', '', NULL, '1600477837933047810', '', '', 1, '1', '2022-12-07 21:10:26', '2024-10-15 11:55:01', '', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1600478336006647809', '页面设计新增', 'promotion:pagedesign:add', '', NULL, '1600477837933047810', '', '', 1, '1', '2022-12-07 21:12:25', '2024-10-15 11:55:08', '', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1600478397226708994', '页面设计修改', 'promotion:pagedesign:edit', '', NULL, '1600477837933047810', '', '', 1, '1', '2022-12-07 21:12:39', '2024-10-15 11:55:15', '', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1600478467569381377', '页面设计删除', 'promotion:pagedesign:del', '', NULL, '1600477837933047810', '', '', 1, '1', '2022-12-07 21:12:56', '2024-10-15 11:55:22', '', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1600785452746854401', '页面设计查询', 'promotion:pagedesign:get', '', NULL, '1600477837933047810', '', '', 1, '1', '2022-12-08 17:32:48', '2024-10-15 11:55:28', '', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1605129651156598786', '在线用户', '', '/system/online-user', NULL, '10001', 'carbon:user', 'upms/online-user/index', 9, '0', '2022-12-20 17:15:05', '2025-05-20 22:56:08', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1605129783281369089', '在线用户查询', 'upms:onlineuser:get', '', NULL, '1605129651156598786', '', '', 1, '1', '2022-12-20 17:15:36', '2022-12-20 17:15:36', '', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1605130091042619393', '在线用户强退', 'upms:onlineuser:forced', '', NULL, '1605129651156598786', '', '', 1, '1', '2022-12-20 17:15:05', '2022-12-20 17:15:05', '', '0', 'app_base', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1612481861469302786', '物流公司修改', 'upms:logisticscompany:edit', '', NULL, '1536174316656533505', '', '', 1, '1', '2023-01-10 00:10:09', '2025-07-16 22:09:15', '', '0', 'sys_key', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1612683975455657985', '物流公司列表', 'upms:logisticscompany:page', '', NULL, '1536174316656533505', '', NULL, 1, '1', '2022-06-13 10:31:33', '2025-07-16 22:09:19', '0', '0', 'sys_key', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1612684125251031042', '物流公司新增', 'upms:logisticscompany:add', '', NULL, '1536174316656533505', '', '', 1, '1', '2023-01-10 00:10:09', '2025-07-16 22:09:26', '', '0', 'sys_key', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1612684389953556481', '物流公司删除', 'upms:logisticscompany:del', '', NULL, '1536174316656533505', '', '', 1, '1', '2023-01-10 13:34:55', '2025-07-16 22:09:30', '', '0', 'sys_key', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1615718593878704130', '微信应用查询', 'weixin:wxapp:get', '', NULL, '1531846893999169537', '', '', 1, '1', '2023-01-18 22:31:48', '2023-01-18 22:31:48', '', '0', 'app_wechat', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1615718665584525314', '微信应用新增', 'weixin:wxapp:add', '', NULL, '1531846893999169537', '', '', 1, '1', '2023-01-18 22:32:05', '2023-01-18 22:32:05', '', '0', 'app_wechat', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1615718738766741505', '微信应用修改', 'weixin:wxapp:edit', '', NULL, '1531846893999169537', '', '', 1, '1', '2023-01-18 22:32:22', '2023-01-18 22:32:22', '', '0', 'app_wechat', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1615718811491778562', '微信应用删除', 'weixin:wxapp:del', '', NULL, '1531846893999169537', '', '', 1, '1', '2023-01-18 22:32:40', '2023-01-18 22:32:40', '', '0', 'app_wechat', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1670722611195203586', '支付管理', '', '/pay', '/pay/payconfig', '0', 'carbon:settings', '', 50, '0', '2023-06-19 17:18:05', '2025-05-13 22:17:47', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1670722888228982785', '支付订单', '', '/pay/trade-order', NULL, '1670722611195203586', 'carbon:order-details', 'pay/trade-order/index', 10, '0', '2023-06-19 17:19:11', '2025-05-19 16:16:51', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1670723480636674049', '支付退单', '', '/pay/refund-order', NULL, '1670722611195203586', 'carbon:order-details', 'pay/refund-order/index', 15, '0', '2023-06-19 17:19:11', '2025-05-19 16:17:19', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1670724676428550146', '支付订单列表', 'pay:paytradeorder:page', '', NULL, '1670722888228982785', '', '', 1, '1', '2023-06-19 17:19:11', '2024-10-15 11:01:02', '', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1670725150502342658', '支付订单详情', 'pay:paytradeorder:get', '', NULL, '1670722888228982785', '', '', 1, '1', '2023-06-19 17:19:11', '2024-10-15 11:01:10', '', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1670725580288479233', '支付退单列表', 'pay:payrefundorder:page', '', NULL, '1670723480636674049', '', '', 1, '1', '2023-06-19 17:19:11', '2024-10-15 11:02:06', '', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1670725673255227394', '支付退单详情', 'pay:payrefundorder:get', '', NULL, '1670723480636674049', '', '', 1, '1', '2023-06-19 17:19:11', '2024-10-15 11:02:13', '', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1670732624412332034', '回调记录', '', '/pay/notify-record', NULL, '1670722611195203586', 'carbon:list', 'pay/notify-record/index', 20, '0', '2023-06-19 17:57:53', '2025-05-19 16:17:33', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1670732985965531137', '回调记录列表', 'pay:paynotifyrecord:page', '', NULL, '1670732624412332034', '', '', 1, '1', '2023-06-19 17:57:53', '2024-10-15 11:03:08', '', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1671121808444674049', '回调记录查询', 'pay:paynotifyrecord:get', '', NULL, '1670732624412332034', '', '', 1, '1', '2023-06-19 17:57:53', '2024-10-15 11:03:14', '', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1681556362827534338', '商城订单取消', 'order:orderinfo:cancel', '', NULL, '1531528760525074434', '', '', 1, '1', '2023-07-19 14:47:33', '2024-10-15 10:50:11', '0', '0', 'app_base', NULL, 'admin');
INSERT INTO `sys_menu` VALUES ('1779386487675092994', '商品管理', '', '/product', '/product/goods/spu', '0', 'carbon:shopping-bag', '', 30, '0', '2024-04-14 13:49:32', '2025-05-13 21:54:21', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1779386604402573314', '营销管理', '', '/promotion', '/promotion/coupon/info', '0', 'carbon:bookmark', '', 60, '0', '2024-04-14 13:50:00', '2025-05-13 21:55:49', '0', '0', 'app_market', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1779386898750439425', '会员管理', '', '/user', '/user/userinfo', '0', 'carbon:user', '', 10, '0', '2024-04-14 13:51:10', '2025-05-13 21:53:04', '0', '0', 'app_base', NULL, 'system');
INSERT INTO `sys_menu` VALUES ('1881217134381326338', '平台管理', NULL, '/platform', '/platform/menu', '0', 'carbon:platforms', '', 5, '0', '2025-01-20 13:48:11', '2025-05-13 21:52:24', '0', '0', 'sys_key', 'lijx', 'system');
INSERT INTO `sys_menu` VALUES ('1925807685068963841', '商品评价', NULL, '/product/appraise', NULL, '1779386487675092994', 'carbon:add-comment', '/product/appraise/index', 70, '0', '2025-05-23 14:55:07', '2025-05-23 15:10:16', '0', '0', 'app_base', 'system', 'system');
INSERT INTO `sys_menu` VALUES ('1925809318075088898', '商品评价分页查询', 'product:appraise:page', NULL, NULL, '1925807685068963841', NULL, NULL, 1, '1', '2025-05-23 15:01:36', NULL, '0', '0', 'app_base', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1925914794987241473', '通过id查询商品评价', 'product:appraise:get', NULL, NULL, '1925807685068963841', NULL, NULL, 1, '1', '2025-05-23 22:00:44', NULL, '0', '0', 'app_base', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1925914842571620353', '商品评价新增', 'product:appraise:add', NULL, NULL, '1925807685068963841', NULL, NULL, 1, '1', '2025-05-23 22:00:55', NULL, '0', '0', 'app_base', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1925914891900829698', '商品评价修改', 'product:appraise:edit', NULL, NULL, '1925807685068963841', NULL, NULL, 1, '1', '2025-05-23 22:01:07', NULL, '0', '0', 'app_base', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1925914979066855425', '商品评价删除', 'product:appraise:del', NULL, NULL, '1925807685068963841', NULL, NULL, 1, '1', '2025-05-23 22:01:27', NULL, '0', '0', 'app_base', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1925925897117028353', '回复商品评价', 'product:appraise:reply', NULL, NULL, '1925807685068963841', NULL, NULL, 1, '1', '2025-05-23 22:44:51', NULL, '0', '0', 'app_base', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1927376759282610177', '订单配置', NULL, '/order/config', NULL, '1521496866882236418', 'carbon:settings-edit', '/order/config/index', 5, '0', '2025-05-27 22:50:03', NULL, '0', '0', 'app_base', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1927383125309149185', '订单配置列表', 'order:config:page', NULL, NULL, '1927376759282610177', NULL, NULL, 1, '1', '2025-05-27 23:15:21', NULL, '0', '0', 'app_base', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1927383173250043906', '订单配置查询', 'order:config:get', NULL, NULL, '1927376759282610177', NULL, NULL, 1, '1', '2025-05-27 23:15:32', NULL, '0', '0', 'app_base', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1927383226031165442', '订单配置新增', 'order:config:add', NULL, NULL, '1927376759282610177', NULL, NULL, 1, '1', '2025-05-27 23:15:45', NULL, '0', '0', 'app_base', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1927383271732301826', '订单配置修改', 'order:config:edit', NULL, NULL, '1927376759282610177', NULL, NULL, 1, '1', '2025-05-27 23:15:56', NULL, '0', '0', 'app_base', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1927383317672513537', '订单配置删除', 'order:config:del', NULL, NULL, '1927376759282610177', NULL, NULL, 1, '1', '2025-05-27 23:16:07', NULL, '0', '0', 'app_base', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1928789844748812290', '文件存储配置列表', 'upms:storageconfig:page', NULL, NULL, '1491948958826921986', NULL, NULL, 1, '1', '2025-05-31 20:25:09', NULL, '0', '0', 'app_base', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1928789932476874754', '文件存储配置新增', 'upms:storageconfig:add', NULL, NULL, '1491948958826921986', NULL, NULL, 1, '1', '2025-05-31 20:25:30', NULL, '0', '0', 'app_base', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1928790012067987457', '文件存储配置删除', 'upms:storageconfig:del', NULL, NULL, '1491948958826921986', NULL, NULL, 1, '1', '2025-05-31 20:25:49', NULL, '0', '0', 'app_base', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1986003264361078786', '代码生成', NULL, '/platform/generator', NULL, '1881217134381326338', 'carbon:ibm-cloud-code-engine', NULL, 160, '0', '2025-11-05 17:30:51', NULL, '0', '0', 'sys_key', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1986003505764245505', '数据源管理', NULL, '/datasource', NULL, '1986003264361078786', 'carbon:settings', 'gen/datasource/index', 10, '0', '2025-11-05 17:31:49', '2025-11-05 18:00:40', '0', '0', 'sys_key', 'system', 'system');
INSERT INTO `sys_menu` VALUES ('1986003578032103426', '数据源列表', 'gen:datasource:page', NULL, NULL, '1986003505764245505', NULL, NULL, 1, '1', '2025-11-05 17:32:06', NULL, '0', '0', 'sys_key', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1986003636857217026', '通过id查询数据源', 'gen:datasource:get', NULL, NULL, '1986003505764245505', NULL, NULL, 1, '1', '2025-11-05 17:32:20', NULL, '0', '0', 'sys_key', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1986003694830886913', '数据源新增', 'gen:datasource:add', NULL, NULL, '1986003505764245505', NULL, NULL, 1, '1', '2025-11-05 17:32:34', NULL, '0', '0', 'sys_key', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1986003761939750914', '数据源修改', 'gen:datasource:edit', NULL, NULL, '1986003505764245505', NULL, NULL, 1, '1', '2025-11-05 17:32:50', NULL, '0', '0', 'sys_key', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1986003823453413377', '数据源删除', 'gen:datasource:del', NULL, NULL, '1986003505764245505', NULL, NULL, 1, '1', '2025-11-05 17:33:04', NULL, '0', '0', 'sys_key', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1986010716532064257', '数据表管理', NULL, '/gen-table', NULL, '1986003264361078786', 'carbon:list', 'gen/gen-table/index', 20, '0', '2025-11-05 18:00:28', NULL, '0', '0', 'sys_key', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1986060144760565762', '数据表列表', 'gen:gen-table:page', NULL, NULL, '1986010716532064257', NULL, NULL, 1, '1', '2025-11-05 21:16:52', NULL, '0', '0', 'sys_key', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('999999999999', '菜单管理查询', 'upms:sysmenu:get', '', NULL, '10002', NULL, NULL, 1, '1', '2022-02-21 16:11:30', '2025-06-15 23:12:33', '0', '0', 'sys_key', NULL, 'system');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
                             `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                             `role_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
                             `role_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色编码',
                             `role_desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
                             `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                             `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                             `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                             `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'ROLE_ADMIN', '系统管理员拥有全部权限', '2021-11-26 11:34:48', '2022-11-09 14:29:09', '0', '1590229800633634816', 'admin', NULL);
INSERT INTO `sys_role` VALUES ('1881232177484574722', '系统管理员', 'ROLE_ADMIN', NULL, '2025-01-20 14:47:57', NULL, '0', '1881232176465358849', 'lijx', NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
                                  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
                                  `menu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单ID',
                                  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                  `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色关联菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1881269776009961474', '1881232177484574722', '1536174316656533505', '2025-01-20 17:17:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269776630718466', '1881232177484574722', '10001', '2025-01-20 17:17:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269777142423554', '1881232177484574722', '1539129183310196738', '2025-01-20 17:17:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269777645740034', '1881232177484574722', '1779386604402573314', '2025-01-20 17:17:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269778157445121', '1881232177484574722', '1496327802522447873', '2025-01-20 17:17:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269778719481857', '1881232177484574722', '1491973212968632322', '2025-01-20 17:17:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269779260547073', '1881232177484574722', '1670722611195203586', '2025-01-20 17:17:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269779784835074', '1881232177484574722', '1521496866882236418', '2025-01-20 17:17:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269780317511681', '1881232177484574722', '1779386487675092994', '2025-01-20 17:17:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269780845993986', '1881232177484574722', '1531846396944785409', '2025-01-20 17:17:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269781349310465', '1881232177484574722', '1531529196871102466', '2025-01-20 17:17:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269781840044034', '1881232177484574722', '1532620101065543681', '2025-01-20 17:17:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269782351749122', '1881232177484574722', '1779386782480138242', '2025-01-20 17:17:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269782901202945', '1881232177484574722', '1788375299184926722', '2025-01-20 17:17:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269783467433985', '1881232177484574722', '1670732624412332034', '2025-01-20 17:17:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269783995916289', '1881232177484574722', '1494151991157673985', '2025-01-20 17:17:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269784524398593', '1881232177484574722', '1670723480636674049', '2025-01-20 17:17:24', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269785442951170', '1881232177484574722', '1491948958826921986', '2025-01-20 17:17:24', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269786097262593', '1881232177484574722', '1532620395988029442', '2025-01-20 17:17:24', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269786738991106', '1881232177484574722', '1496327483721789441', '2025-01-20 17:17:24', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269787380719618', '1881232177484574722', '1531528760525074434', '2025-01-20 17:17:24', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269788056002561', '1881232177484574722', '1585916026725281793', '2025-01-20 17:17:24', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269788563513345', '1881232177484574722', '1670722888228982785', '2025-01-20 17:17:25', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269789201047553', '1881232177484574722', '1527835787455164418', '2025-01-20 17:17:25', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269789746307074', '1881232177484574722', '1779386898750439425', '2025-01-20 17:17:25', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269790299955201', '1881232177484574722', '1531846725585281025', '2025-01-20 17:17:25', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269791012986882', '1881232177484574722', '1493884088730529793', '2025-01-20 17:17:25', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269792099311617', '1881232177484574722', '1605129651156598786', '2025-01-20 17:17:25', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269792904617985', '1881232177484574722', '1864964797636804609', '2025-01-20 17:17:26', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269793827364865', '1881232177484574722', '1867574302526791682', '2025-01-20 17:17:26', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269794620088321', '1881232177484574722', '1868158971727056897', '2025-01-20 17:17:26', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269795266011137', '1881232177484574722', '1583296344638287874', '2025-01-20 17:17:26', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269796037763074', '1881232177484574722', '1792432863812636673', '2025-01-20 17:17:26', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269796729823233', '1881232177484574722', '1531846893999169537', '2025-01-20 17:17:27', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269797442854913', '1881232177484574722', '1531445896986435585', '2025-01-20 17:17:27', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269798000697345', '1881232177484574722', '1494216988311183361', '2025-01-20 17:17:27', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269798747283457', '1881232177484574722', '1532634687902748674', '2025-01-20 17:17:27', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269799456120833', '1881232177484574722', '1579402420152627202', '2025-01-20 17:17:27', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269799967825922', '1881232177484574722', '1491684226094198786', '2025-01-20 17:17:27', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269800500502529', '1881232177484574722', '1532634435510505473', '2025-01-20 17:17:27', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269801012207617', '1881232177484574722', '1537066492991012865', '2025-01-20 17:17:28', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269801536495617', '1881232177484574722', '1537048076783616001', '2025-01-20 17:17:28', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269802148864001', '1881232177484574722', '1493766204259942401', '2025-01-20 17:17:28', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269802647986178', '1881232177484574722', '1532634586568364034', '2025-01-20 17:17:28', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269803189051394', '1881232177484574722', '1493596733666652162', '2025-01-20 17:17:28', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269803788836866', '1881232177484574722', '1532634517374930946', '2025-01-20 17:17:28', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269804359262209', '1881232177484574722', '1532634358100430850', '2025-01-20 17:17:28', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269804992602114', '1881232177484574722', '1537066557067395074', '2025-01-20 17:17:28', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269805638524930', '1881232177484574722', '1871099260888489985', '2025-01-20 17:17:29', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269806376722434', '1881232177484574722', '1615718811491778562', '2025-01-20 17:17:29', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269806913593346', '1881232177484574722', '1494153373696704514', '2025-01-20 17:17:29', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269807463047169', '1881232177484574722', '1788375651716177922', '2025-01-20 17:17:29', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269808096387073', '1881232177484574722', '1527471919042142209', '2025-01-20 17:17:29', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269808654229506', '1881232177484574722', '1491757020773289986', '2025-01-20 17:17:29', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269809199489026', '1881232177484574722', '1543116535774879745', '2025-01-20 17:17:29', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269809790885889', '1881232177484574722', '1788196733688225793', '2025-01-20 17:17:30', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269810701049858', '1881232177484574722', '1585191589231144962', '2025-01-20 17:17:30', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269811598630913', '1881232177484574722', '1864965476786896897', '2025-01-20 17:17:30', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269812206804994', '1881232177484574722', '1527836010248204290', '2025-01-20 17:17:30', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269812835950593', '1881232177484574722', '1585192296575348738', '2025-01-20 17:17:30', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269813590925314', '1881232177484574722', '1494192760010620930', '2025-01-20 17:17:31', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269814178127874', '1881232177484574722', '1788375917437919234', '2025-01-20 17:17:31', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269814836633602', '1881232177484574722', '1788375826039840770', '2025-01-20 17:17:31', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269815436419073', '1881232177484574722', '999999999999', '2025-01-20 17:17:31', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269815948124161', '1881232177484574722', '1670725580288479233', '2025-01-20 17:17:31', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269816501772289', '1881232177484574722', '1494192758630694913', '2025-01-20 17:17:31', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269816996700161', '1881232177484574722', '1585192140589182977', '2025-01-20 17:17:31', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269817483239425', '1881232177484574722', '1496327552973942785', '2025-01-20 17:17:31', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269817973972993', '1881232177484574722', '1600785452746854401', '2025-01-20 17:17:32', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269818510843906', '1881232177484574722', '1867574970650058754', '2025-01-20 17:17:32', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269819060297729', '1881232177484574722', '1491969633293729794', '2025-01-20 17:17:32', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269819572002818', '1881232177484574722', '1864965419459149826', '2025-01-20 17:17:32', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269820087902210', '1881232177484574722', '1497468294740176898', '2025-01-20 17:17:32', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269820599607297', '1881232177484574722', '1792433334379991041', '2025-01-20 17:17:32', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269821115506690', '1881232177484574722', '1494192759318560770', '2025-01-20 17:17:32', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269821618823170', '1881232177484574722', '1681556362827534338', '2025-01-20 17:17:32', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269822201831426', '1881232177484574722', '1493587910721695745', '2025-01-20 17:17:33', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269822751285250', '1881232177484574722', '1536174413406543874', '2025-01-20 17:17:33', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269823271378946', '1881232177484574722', '1496327862068981762', '2025-01-20 17:17:33', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269823862775809', '1881232177484574722', '1527836010944458754', '2025-01-20 17:17:33', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269824378675201', '1881232177484574722', '1864965367609163777', '2025-01-20 17:17:33', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269824928129026', '1881232177484574722', '1527836010596331522', '2025-01-20 17:17:33', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269825477582850', '1881232177484574722', '1547111164111253505', '2025-01-20 17:17:33', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269826022842370', '1881232177484574722', '1792433080825925634', '2025-01-20 17:17:33', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269826559713282', '1881232177484574722', '1792433157640409089', '2025-01-20 17:17:34', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269827482460162', '1881232177484574722', '1864965206908600322', '2025-01-20 17:17:34', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269828140965890', '1881232177484574722', '1600478467569381377', '2025-01-20 17:17:34', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269828711391234', '1881232177484574722', '1493836209106268161', '2025-01-20 17:17:34', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269829361508354', '1881232177484574722', '1615718665584525314', '2025-01-20 17:17:34', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269829894184961', '1881232177484574722', '1494217080510373890', '2025-01-20 17:17:34', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269830414278657', '1881232177484574722', '1491949315883827201', '2025-01-20 17:17:35', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269830921789441', '1881232177484574722', '1612684125251031042', '2025-01-20 17:17:35', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269831496409089', '1881232177484574722', '1496327554433560577', '2025-01-20 17:17:35', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269832066834433', '1881232177484574722', '1494153374401347585', '2025-01-20 17:17:35', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269832654036993', '1881232177484574722', '1788196790093225986', '2025-01-20 17:17:35', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269833278988290', '1881232177484574722', '1531882841361915906', '2025-01-20 17:17:35', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269833790693378', '1881232177484574722', '1496327553699557377', '2025-01-20 17:17:35', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269834344341505', '1881232177484574722', '1493884379760701442', '2025-01-20 17:17:35', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269834847657985', '1881232177484574722', '1527471918001954818', '2025-01-20 17:17:36', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269835493580801', '1881232177484574722', '1496327553334652930', '2025-01-20 17:17:36', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269836089171969', '1881232177484574722', '1585191363078467586', '2025-01-20 17:17:36', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269836609265665', '1881232177484574722', '1670732985965531137', '2025-01-20 17:17:36', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269837175496705', '1881232177484574722', '1867575019589197825', '2025-01-20 17:17:36', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269837716561921', '1881232177484574722', '1605130091042619393', '2025-01-20 17:17:36', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269838211489794', '1881232177484574722', '1788196662338920449', '2025-01-20 17:17:36', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269838702223361', '1881232177484574722', '1527471918694014977', '2025-01-20 17:17:37', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269839306203138', '1881232177484574722', '1600478397226708994', '2025-01-20 17:17:37', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269839843074050', '1881232177484574722', '1585192004932808706', '2025-01-20 17:17:37', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269840371556354', '1881232177484574722', '1493578977630121986', '2025-01-20 17:17:37', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269840929398785', '1881232177484574722', '1494514119857180674', '2025-01-20 17:17:37', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269841504018434', '1881232177484574722', '1670724676428550146', '2025-01-20 17:17:37', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269842015723522', '1881232177484574722', '1493578978649337858', '2025-01-20 17:17:37', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269842502262786', '1881232177484574722', '1531882726605758465', '2025-01-20 17:17:37', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269843026550786', '1881232177484574722', '1494217081206628354', '2025-01-20 17:17:38', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269843668279298', '1881232177484574722', '1792433410624049154', '2025-01-20 17:17:38', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269844192567298', '1881232177484574722', '1792433241006395393', '2025-01-20 17:17:38', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269844716855298', '1881232177484574722', '1531446009649635329', '2025-01-20 17:17:38', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269845316640769', '1881232177484574722', '1615718738766741505', '2025-01-20 17:17:38', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269845853511682', '1881232177484574722', '1867574920268079105', '2025-01-20 17:17:38', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269846348439554', '1881232177484574722', '1494192759662493698', '2025-01-20 17:17:38', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269846939836417', '1881232177484574722', '1491690996678021121', '2025-01-20 17:17:38', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269847485095938', '1881232177484574722', '1792433529037639682', '2025-01-20 17:17:39', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269848068104194', '1881232177484574722', '1527947365856878593', '2025-01-20 17:17:39', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269848613363713', '1881232177484574722', '1600478029277196290', '2025-01-20 17:17:39', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269849120874498', '1881232177484574722', '1600478336006647809', '2025-01-20 17:17:39', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269849716465666', '1881232177484574722', '1585916172586397697', '2025-01-20 17:17:39', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269850391748610', '1881232177484574722', '1494153374053220354', '2025-01-20 17:17:39', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269850949591042', '1881232177484574722', '1788375557960900610', '2025-01-20 17:17:39', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269851511627777', '1881232177484574722', '1493587911057240066', '2025-01-20 17:17:40', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269852056887297', '1881232177484574722', '1605129783281369089', '2025-01-20 17:17:40', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269852610535425', '1881232177484574722', '1493836280589791233', '2025-01-20 17:17:40', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269853130629122', '1881232177484574722', '1494217081558949890', '2025-01-20 17:17:40', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269853734608898', '1881232177484574722', '1527471919386075137', '2025-01-20 17:17:40', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269854342782977', '1881232177484574722', '1532621196013768706', '2025-01-20 17:17:40', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269854879653889', '1881232177484574722', '1864965305650905090', '2025-01-20 17:17:40', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269855403941889', '1881232177484574722', '1531446009913876482', '2025-01-20 17:17:40', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269855919841282', '1881232177484574722', '1670725150502342658', '2025-01-20 17:17:41', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269856507043842', '1881232177484574722', '1867575179505426433', '2025-01-20 17:17:41', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269857006166017', '1881232177484574722', '1496327861712465921', '2025-01-20 17:17:41', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269857538842625', '1881232177484574722', '1493836091183411202', '2025-01-20 17:17:41', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269858088296449', '1881232177484574722', '1496327554068656130', '2025-01-20 17:17:41', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269858654527490', '1881232177484574722', '1491752531735490561', '2025-01-20 17:17:41', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269859275284482', '1881232177484574722', '1494153372996255746', '2025-01-20 17:17:41', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269859766018049', '1881232177484574722', '1494192758974627842', '2025-01-20 17:17:42', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269860273528833', '1881232177484574722', '1612481861469302786', '2025-01-20 17:17:42', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269860873314306', '1881232177484574722', '1496327860647112706', '2025-01-20 17:17:42', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269861435351041', '1881232177484574722', '1526179827628048385', '2025-01-20 17:17:42', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269862009970689', '1881232177484574722', '1531537289042472961', '2025-01-20 17:17:42', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269862546841602', '1881232177484574722', '1532621007333003266', '2025-01-20 17:17:42', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269863092101121', '1881232177484574722', '1531536545572728833', '2025-01-20 17:17:42', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269863717052418', '1881232177484574722', '1532621107589451778', '2025-01-20 17:17:42', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269864249729026', '1881232177484574722', '1531537172243689474', '2025-01-20 17:17:43', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269864828542977', '1881232177484574722', '1532620840659750914', '2025-01-20 17:17:43', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269865440911361', '1881232177484574722', '1671121808444674049', '2025-01-20 17:17:43', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269865961005057', '1881232177484574722', '1867574701077946369', '2025-01-20 17:17:43', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269866489487361', '1881232177484574722', '1615718593878704130', '2025-01-20 17:17:43', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269867034746881', '1881232177484574722', '1493578977978249218', '2025-01-20 17:17:43', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269867554840578', '1881232177484574722', '1585192568882147330', '2025-01-20 17:17:43', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269868066545665', '1881232177484574722', '1535633963410956289', '2025-01-20 17:17:44', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269868615999489', '1881232177484574722', '1788196840919801858', '2025-01-20 17:17:44', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269869496803329', '1881232177484574722', '1531446009779658754', '2025-01-20 17:17:44', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269870067228674', '1881232177484574722', '1527836009900077057', '2025-01-20 17:17:44', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269870721540097', '1881232177484574722', '1532620931885862913', '2025-01-20 17:17:44', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269871807864834', '1881232177484574722', '1527835963171336193', '2025-01-20 17:17:44', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269872365707265', '1881232177484574722', '1867575119333941250', '2025-01-20 17:17:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269872944521218', '1881232177484574722', '1531536449854517250', '2025-01-20 17:17:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269873464614913', '1881232177484574722', '1527471479688798209', '2025-01-20 17:17:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269874064400386', '1881232177484574722', '1585192489970511873', '2025-01-20 17:17:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269874618048514', '1881232177484574722', '1493841029473042434', '2025-01-20 17:17:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269875159113730', '1881232177484574722', '1788196890592944129', '2025-01-20 17:17:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269875675013122', '1881232177484574722', '1527471918337499138', '2025-01-20 17:17:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269876228661250', '1881232177484574722', '1547110946242326529', '2025-01-20 17:17:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269876752949249', '1881232177484574722', '1612683975455657985', '2025-01-20 17:17:46', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269877314985985', '1881232177484574722', '1491756888363307009', '2025-01-20 17:17:46', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269877897994242', '1881232177484574722', '1531446010039705602', '2025-01-20 17:17:46', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269878376144898', '1881232177484574722', '1493587910381957121', '2025-01-20 17:17:46', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269878904627201', '1881232177484574722', '1493578978313793537', '2025-01-20 17:17:46', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269879454081026', '1881232177484574722', '1590700851537625090', '2025-01-20 17:17:46', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269879961591809', '1881232177484574722', '1531536866638311426', '2025-01-20 17:17:46', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269880477491202', '1881232177484574722', '1494217080858501121', '2025-01-20 17:17:46', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269881148579842', '1881232177484574722', '1531536746446336001', '2025-01-20 17:17:47', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269881672867842', '1881232177484574722', '1496012487833960450', '2025-01-20 17:17:47', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269882201350145', '1881232177484574722', '1670725673255227394', '2025-01-20 17:17:47', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269882788552705', '1881232177484574722', '1496327861003628545', '2025-01-20 17:17:47', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269883317035009', '1881232177484574722', '1494217080162246658', '2025-01-20 17:17:47', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269883862294529', '1881232177484574722', '1612684389953556481', '2025-01-20 17:17:47', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269884428525569', '1881232177484574722', '1496327861351755778', '2025-01-20 17:17:47', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269884931842050', '1881232177484574722', '1531446010169729026', '2025-01-20 17:17:48', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269885493878786', '1881232177484574722', '1491757382771085313', '2025-01-20 17:17:48', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269886043332610', '1881232177484574722', '1788375752018763778', '2025-01-20 17:17:48', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269886596980737', '1881232177484574722', '1494153373352771586', '2025-01-20 17:17:48', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269887083520001', '1881232177484574722', '1788196420663123969', '2025-01-20 17:17:48', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269887616196610', '1881232177484574722', '1527836011300974593', '2025-01-20 17:17:48', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1881269888136290305', '1881232177484574722', '1600477837933047810', '2025-01-20 17:17:48', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446586850332673', '1914444876555767809', '1527471918001954818', '2025-04-22 06:30:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446587651444738', '1914444876555767809', '1527471918337499138', '2025-04-22 06:30:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446588536442882', '1914444876555767809', '1579402420152627202', '2025-04-22 06:30:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446589400469506', '1914444876555767809', '1906363079829749762', '2025-04-22 06:30:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446590243524610', '1914444876555767809', '1788196733688225793', '2025-04-22 06:30:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446591044636674', '1914444876555767809', '1788196662338920449', '2025-04-22 06:30:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446591925440513', '1914444876555767809', '1792433157640409089', '2025-04-22 06:30:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446592785272833', '1914444876555767809', '1792433080825925634', '2025-04-22 06:30:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446593636716545', '1914444876555767809', '1871099260888489985', '2025-04-22 06:30:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446594433634305', '1914444876555767809', '1493587910381957121', '2025-04-22 06:30:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446595314438146', '1914444876555767809', '1497468294740176898', '2025-04-22 06:30:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446596178464770', '1914444876555767809', '1532621107589451778', '2025-04-22 06:30:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446597025714177', '1914444876555767809', '1532621007333003266', '2025-04-22 06:30:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446597822631938', '1914444876555767809', '1532620840659750914', '2025-04-22 06:30:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446598707630081', '1914444876555767809', '1532620931885862913', '2025-04-22 06:30:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446599567462401', '1914444876555767809', '1532634435510505473', '2025-04-22 06:30:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446600414711809', '1914444876555767809', '1532634358100430850', '2025-04-22 06:30:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446601211629569', '1914444876555767809', '1496327552973942785', '2025-04-22 06:30:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446602092433409', '1914444876555767809', '1496327553334652930', '2025-04-22 06:30:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446602956460033', '1914444876555767809', '1788375299184926722', '2025-04-22 06:30:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446603803709441', '1914444876555767809', '1788375651716177922', '2025-04-22 06:30:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446604604821506', '1914444876555767809', '1788375917437919234', '2025-04-22 06:30:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446605481431041', '1914444876555767809', '1788375826039840770', '2025-04-22 06:30:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446606345457666', '1914444876555767809', '1788375752018763778', '2025-04-22 06:30:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446607192707073', '1914444876555767809', '1788375557960900610', '2025-04-22 06:30:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446607989624834', '1914444876555767809', '1535633963410956289', '2025-04-22 06:30:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446608870428673', '1914444876555767809', '1531536545572728833', '2025-04-22 06:30:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446609734455297', '1914444876555767809', '1531536449854517250', '2025-04-22 06:30:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446610585899010', '1914444876555767809', '1531537289042472961', '2025-04-22 06:30:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446611382816770', '1914444876555767809', '1531537172243689474', '2025-04-22 06:30:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446612263620609', '1914444876555767809', '1670722888228982785', '2025-04-22 06:30:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446613131841538', '1914444876555767809', '1670724676428550146', '2025-04-22 06:30:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446613979090946', '1914444876555767809', '1670725150502342658', '2025-04-22 06:30:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446614776008706', '1914444876555767809', '1670723480636674049', '2025-04-22 06:30:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446615652618242', '1914444876555767809', '1670725673255227394', '2025-04-22 06:30:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446616516644865', '1914444876555767809', '1670725580288479233', '2025-04-22 06:30:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446617363894273', '1914444876555767809', '1585192004932808706', '2025-04-22 06:30:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446618160812034', '1914444876555767809', '1585192140589182977', '2025-04-22 06:30:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446619041615874', '1914444876555767809', '1585916026725281793', '2025-04-22 06:30:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446619905642498', '1914444876555767809', '1585916172586397697', '2025-04-22 06:30:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446620757086210', '1914444876555767809', '1867574920268079105', '2025-04-22 06:30:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446621554003969', '1914444876555767809', '1867574970650058754', '2025-04-22 06:30:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446622434807809', '1914444876555767809', '1899100147609116674', '2025-04-22 06:30:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446623298834434', '1914444876555767809', '1899101135661309954', '2025-04-22 06:30:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446624150278146', '1914444876555767809', '1899101198156439554', '2025-04-22 06:30:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446624947195905', '1914444876555767809', '1779386898750439425', '2025-04-22 06:30:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446625827999745', '1914444876555767809', '1527471479688798209', '2025-04-22 06:30:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446626692026370', '1914444876555767809', '1779386782480138242', '2025-04-22 06:30:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446627539275777', '1914444876555767809', '1788196420663123969', '2025-04-22 06:30:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446628336193538', '1914444876555767809', '1792432863812636673', '2025-04-22 06:30:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446629216997378', '1914444876555767809', '1779386487675092994', '2025-04-22 06:30:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446630932467714', '1914444876555767809', '1532620395988029442', '2025-04-22 06:30:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446631729385473', '1914444876555767809', '1532620101065543681', '2025-04-22 06:30:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446632610189314', '1914444876555767809', '1496327483721789441', '2025-04-22 06:30:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446633478410241', '1914444876555767809', '1521496866882236418', '2025-04-22 06:30:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446634325659650', '1914444876555767809', '1531528760525074434', '2025-04-22 06:30:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446635122577410', '1914444876555767809', '1531529196871102466', '2025-04-22 06:30:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446636003381249', '1914444876555767809', '1670722611195203586', '2025-04-22 06:30:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446636867407874', '1914444876555767809', '1779386604402573314', '2025-04-22 06:30:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446637714657282', '1914444876555767809', '1585191363078467586', '2025-04-22 06:30:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446638511575042', '1914444876555767809', '1585191589231144962', '2025-04-22 06:30:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446639392378882', '1914444876555767809', '1867574302526791682', '2025-04-22 06:30:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446640256405506', '1914444876555767809', '1867574701077946369', '2025-04-22 06:30:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446641103654913', '1914444876555767809', '1899099320962129922', '2025-04-22 06:30:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446641900572673', '1914444876555767809', '1899099806679310337', '2025-04-22 06:30:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1914446642781376514', '1914444876555767809', '1899100759243497474', '2025-04-22 06:30:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332145702342657', '1789672842141433858', '1788196420663123969', '2025-04-27 11:22:42', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332146545397762', '1789672842141433858', '1779386487675092994', '2025-04-27 11:22:42', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332147778523137', '1789672842141433858', '1532620395988029442', '2025-04-27 11:22:42', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332148483166209', '1789672842141433858', '1532620101065543681', '2025-04-27 11:22:43', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332149263306754', '1789672842141433858', '1496327483721789441', '2025-04-27 11:22:43', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332150051835905', '1789672842141433858', '1788375299184926722', '2025-04-27 11:22:43', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332150634844162', '1789672842141433858', '1496327802522447873', '2025-04-27 11:22:43', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332151347875841', '1789672842141433858', '1531528760525074434', '2025-04-27 11:22:43', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332152123822081', '1789672842141433858', '1531529196871102466', '2025-04-27 11:22:43', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332152648110081', '1789672842141433858', '1585191363078467586', '2025-04-27 11:22:44', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332153302421505', '1789672842141433858', '1585191589231144962', '2025-04-27 11:22:44', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332153948344322', '1789672842141433858', '1585916026725281793', '2025-04-27 11:22:44', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332154736873473', '1789672842141433858', '1491752531735490561', '2025-04-27 11:22:44', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332155319881730', '1789672842141433858', '1491973212968632322', '2025-04-27 11:22:44', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332155902889985', '1789672842141433858', '1779386782480138242', '2025-04-27 11:22:44', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332156603338754', '1789672842141433858', '1521496866882236418', '2025-04-27 11:22:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332157375090690', '1789672842141433858', '1779386604402573314', '2025-04-27 11:22:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1916332157962293250', '1789672842141433858', '10001', '2025-04-27 11:22:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142592', '1919318422565613569', '1788196420663123969', '2025-05-05 21:02:09', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142593', '1919318422565613569', '1788196662338920449', '2025-05-05 21:02:09', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142594', '1919318422565613569', '1788196733688225793', '2025-05-05 21:02:09', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142595', '1919318422565613569', '1912035971633811458', '2025-05-05 21:02:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142596', '1919318422565613569', '1919330303376265217', '2025-05-05 21:02:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142597', '1919318422565613569', '1919376575265148930', '2025-05-05 21:02:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142598', '1919318422565613569', '1919376628151128065', '2025-05-05 21:02:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142599', '1919318422565613569', '1915420286516379649', '2025-05-05 21:02:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142600', '1919318422565613569', '1919330498851803138', '2025-05-05 21:02:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142601', '1919318422565613569', '1919330561216909314', '2025-05-05 21:02:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142602', '1919318422565613569', '1496327552973942785', '2025-05-05 21:02:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142603', '1919318422565613569', '1496327553334652930', '2025-05-05 21:02:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142604', '1919318422565613569', '1493587910381957121', '2025-05-05 21:02:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142605', '1919318422565613569', '1493587910721695745', '2025-05-05 21:02:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142606', '1919318422565613569', '1493587911057240066', '2025-05-05 21:02:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142607', '1919318422565613569', '1497468294740176898', '2025-05-05 21:02:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142608', '1919318422565613569', '1532620101065543681', '2025-05-05 21:02:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142609', '1919318422565613569', '1532620840659750914', '2025-05-05 21:02:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142610', '1919318422565613569', '1532620931885862913', '2025-05-05 21:02:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142611', '1919318422565613569', '1532621007333003266', '2025-05-05 21:02:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142612', '1919318422565613569', '1532621107589451778', '2025-05-05 21:02:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142613', '1919318422565613569', '1532621196013768706', '2025-05-05 21:02:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142614', '1919318422565613569', '1532634358100430850', '2025-05-05 21:02:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142615', '1919318422565613569', '1532634435510505473', '2025-05-05 21:02:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142616', '1919318422565613569', '1532634517374930946', '2025-05-05 21:02:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142617', '1919318422565613569', '1532634586568364034', '2025-05-05 21:02:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142618', '1919318422565613569', '1532634687902748674', '2025-05-05 21:02:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142619', '1919318422565613569', '1788375299184926722', '2025-05-05 21:02:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142620', '1919318422565613569', '1788375557960900610', '2025-05-05 21:02:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142621', '1919318422565613569', '1788375651716177922', '2025-05-05 21:02:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142622', '1919318422565613569', '1788375752018763778', '2025-05-05 21:02:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142623', '1919318422565613569', '1788375826039840770', '2025-05-05 21:02:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142624', '1919318422565613569', '1788375917437919234', '2025-05-05 21:02:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142625', '1919318422565613569', '1496327802522447873', '2025-05-05 21:02:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142626', '1919318422565613569', '1496327860647112706', '2025-05-05 21:02:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142627', '1919318422565613569', '1496327861003628545', '2025-05-05 21:02:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142628', '1919318422565613569', '1496327861351755778', '2025-05-05 21:02:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142629', '1919318422565613569', '1496327861712465921', '2025-05-05 21:02:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142630', '1919318422565613569', '1496327862068981762', '2025-05-05 21:02:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142631', '1919318422565613569', '1531528760525074434', '2025-05-05 21:02:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142632', '1919318422565613569', '1531536449854517250', '2025-05-05 21:02:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142633', '1919318422565613569', '1531536545572728833', '2025-05-05 21:02:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142634', '1919318422565613569', '1531536746446336001', '2025-05-05 21:02:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142635', '1919318422565613569', '1531536866638311426', '2025-05-05 21:02:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142636', '1919318422565613569', '1535633963410956289', '2025-05-05 21:02:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142637', '1919318422565613569', '1681556362827534338', '2025-05-05 21:02:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142638', '1919318422565613569', '1531529196871102466', '2025-05-05 21:02:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142639', '1919318422565613569', '1531537172243689474', '2025-05-05 21:02:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142640', '1919318422565613569', '1531537289042472961', '2025-05-05 21:02:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142641', '1919318422565613569', '1543116535774879745', '2025-05-05 21:02:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142642', '1919318422565613569', '1915402317111463938', '2025-05-05 21:02:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142643', '1919318422565613569', '1915402364934918145', '2025-05-05 21:02:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142644', '1919318422565613569', '1915402440830849026', '2025-05-05 21:02:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142645', '1919318422565613569', '1915402499827929090', '2025-05-05 21:02:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142646', '1919318422565613569', '1779386604402573314', '2025-05-05 21:02:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142647', '1919318422565613569', '1585191363078467586', '2025-05-05 21:02:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142648', '1919318422565613569', '1585191589231144962', '2025-05-05 21:02:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142649', '1919318422565613569', '1585192004932808706', '2025-05-05 21:02:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142650', '1919318422565613569', '1585192140589182977', '2025-05-05 21:02:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142651', '1919318422565613569', '1585192296575348738', '2025-05-05 21:02:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142652', '1919318422565613569', '1585192489970511873', '2025-05-05 21:02:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142653', '1919318422565613569', '1585192568882147330', '2025-05-05 21:02:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142654', '1919318422565613569', '1585916026725281793', '2025-05-05 21:02:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142655', '1919318422565613569', '1585916172586397697', '2025-05-05 21:02:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142656', '1919318422565613569', '1867574302526791682', '2025-05-05 21:02:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142657', '1919318422565613569', '1867574701077946369', '2025-05-05 21:02:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142658', '1919318422565613569', '1867574920268079105', '2025-05-05 21:02:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142659', '1919318422565613569', '1867574970650058754', '2025-05-05 21:02:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142660', '1919318422565613569', '1867575019589197825', '2025-05-05 21:02:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142661', '1919318422565613569', '1867575119333941250', '2025-05-05 21:02:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142662', '1919318422565613569', '1867575179505426433', '2025-05-05 21:02:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142663', '1919318422565613569', '1868158971727056897', '2025-05-05 21:02:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142664', '1919318422565613569', '1899099320962129922', '2025-05-05 21:02:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142665', '1919318422565613569', '1899099806679310337', '2025-05-05 21:02:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142666', '1919318422565613569', '1899100147609116674', '2025-05-05 21:02:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142667', '1919318422565613569', '1899100200448958466', '2025-05-05 21:02:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142668', '1919318422565613569', '1899100257789288450', '2025-05-05 21:02:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142669', '1919318422565613569', '1899100333685219330', '2025-05-05 21:02:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142670', '1919318422565613569', '1899100516183580674', '2025-05-05 21:02:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142671', '1919318422565613569', '1899100759243497474', '2025-05-05 21:02:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142672', '1919318422565613569', '1899101135661309954', '2025-05-05 21:02:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142673', '1919318422565613569', '1899101198156439554', '2025-05-05 21:02:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142674', '1919318422565613569', '1899101251365380098', '2025-05-05 21:02:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142675', '1919318422565613569', '1899101326753800193', '2025-05-05 21:02:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142676', '1919318422565613569', '1899101388426846210', '2025-05-05 21:02:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142677', '1919318422565613569', '1491973212968632322', '2025-05-05 21:02:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142678', '1919318422565613569', '1493578977630121986', '2025-05-05 21:02:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142679', '1919318422565613569', '1493578977978249218', '2025-05-05 21:02:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142680', '1919318422565613569', '1493578978313793537', '2025-05-05 21:02:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142681', '1919318422565613569', '1493578978649337858', '2025-05-05 21:02:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142682', '1919318422565613569', '1526179827628048385', '2025-05-05 21:02:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142683', '1919318422565613569', '1493596733666652162', '2025-05-05 21:02:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142684', '1919318422565613569', '1493766204259942401', '2025-05-05 21:02:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142685', '1919318422565613569', '1537048076783616001', '2025-05-05 21:02:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142686', '1919318422565613569', '1537066492991012865', '2025-05-05 21:02:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142687', '1919318422565613569', '1537066557067395074', '2025-05-05 21:02:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142688', '1919318422565613569', '1917466901169065986', '2025-05-05 21:02:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142689', '1919318422565613569', '1917466958165463041', '2025-05-05 21:02:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142690', '1919318422565613569', '1917467140303114241', '2025-05-05 21:02:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142691', '1919318422565613569', '1779386782480138242', '2025-05-05 21:02:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142692', '1919318422565613569', '1915418500774674433', '2025-05-05 21:02:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142693', '1919318422565613569', '1919320902775070721', '2025-05-05 21:02:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142694', '1919318422565613569', '1779386487675092994', '2025-05-05 21:02:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142695', '1919318422565613569', '1496327483721789441', '2025-05-05 21:02:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142696', '1919318422565613569', '1532620395988029442', '2025-05-05 21:02:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142697', '1919318422565613569', '1521496866882236418', '2025-05-05 21:02:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142698', '1919318422565613569', '1915402225524641793', '2025-05-05 21:02:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142699', '1919318422565613569', '10001', '2025-05-05 21:02:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142700', '1919318422565613569', '1917432922911051778', '2025-05-05 21:02:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1919377073196142701', '1919318422565613569', '1917461111616065537', '2025-05-05 21:02:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655552', '1', '1779386898750439425', '2025-06-14 00:35:44', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655553', '1', '1527471479688798209', '2025-06-14 00:35:44', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655554', '1', '1527471918001954818', '2025-06-14 00:35:44', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655555', '1', '1527471918337499138', '2025-06-14 00:35:44', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655556', '1', '1527471918694014977', '2025-06-14 00:35:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655557', '1', '1527471919042142209', '2025-06-14 00:35:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655558', '1', '1527471919386075137', '2025-06-14 00:35:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655559', '1', '1920115698355605506', '2025-06-14 00:35:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655560', '1', '1920115822607667201', '2025-06-14 00:35:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655561', '1', '1908430136292806657', '2025-06-14 00:35:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655562', '1', '1908432094680498178', '2025-06-14 00:35:45', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655563', '1', '1908432156768780290', '2025-06-14 00:35:46', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655564', '1', '1908432250347896833', '2025-06-14 00:35:46', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655565', '1', '1908432326675841025', '2025-06-14 00:35:46', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655566', '1', '1908432418606596098', '2025-06-14 00:35:46', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655567', '1', '1908497193025859585', '2025-06-14 00:35:46', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655568', '1', '1908497473855483906', '2025-06-14 00:35:46', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655569', '1', '1908497530839298049', '2025-06-14 00:35:46', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655570', '1', '1908497587646951425', '2025-06-14 00:35:47', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655571', '1', '1908497640419684354', '2025-06-14 00:35:47', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655572', '1', '1864964797636804609', '2025-06-14 00:35:47', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655573', '1', '1864965206908600322', '2025-06-14 00:35:47', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655574', '1', '1864965305650905090', '2025-06-14 00:35:47', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655575', '1', '1864965367609163777', '2025-06-14 00:35:47', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655576', '1', '1864965419459149826', '2025-06-14 00:35:48', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655577', '1', '1864965476786896897', '2025-06-14 00:35:48', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655578', '1', '1904181618258649090', '2025-06-14 00:35:48', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655579', '1', '1904182116281917442', '2025-06-14 00:35:48', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655580', '1', '1904182180618346498', '2025-06-14 00:35:48', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655581', '1', '1904182650648829953', '2025-06-14 00:35:48', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655582', '1', '1904182708047880193', '2025-06-14 00:35:48', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655583', '1', '1904182762854850562', '2025-06-14 00:35:49', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655584', '1', '1904183774843936770', '2025-06-14 00:35:49', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655585', '1', '1904183950442668034', '2025-06-14 00:35:49', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655586', '1', '1904183545772023810', '2025-06-14 00:35:49', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655587', '1', '1904183663623577602', '2025-06-14 00:35:49', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655588', '1', '1904183832930852866', '2025-06-14 00:35:49', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655589', '1', '1904182493270155265', '2025-06-14 00:35:49', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655590', '1', '1904182844975128577', '2025-06-14 00:35:50', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655591', '1', '1904182907902271489', '2025-06-14 00:35:50', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655592', '1', '1904182961836826626', '2025-06-14 00:35:50', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655593', '1', '1904183013204467714', '2025-06-14 00:35:50', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655594', '1', '1904183083324841986', '2025-06-14 00:35:50', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655595', '1', '1906362572637732866', '2025-06-14 00:35:50', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655596', '1', '1906362786735980545', '2025-06-14 00:35:50', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655597', '1', '1906362904411373570', '2025-06-14 00:35:51', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655598', '1', '1906363079829749762', '2025-06-14 00:35:51', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655599', '1', '1915034838212198402', '2025-06-14 00:35:51', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655600', '1', '1779386782480138242', '2025-06-14 00:35:51', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655601', '1', '1788196420663123969', '2025-06-14 00:35:51', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655602', '1', '1788196662338920449', '2025-06-14 00:35:51', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655603', '1', '1788196733688225793', '2025-06-14 00:35:52', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655604', '1', '1788196790093225986', '2025-06-14 00:35:52', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655605', '1', '1788196840919801858', '2025-06-14 00:35:52', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655606', '1', '1788196890592944129', '2025-06-14 00:35:52', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655607', '1', '1792432863812636673', '2025-06-14 00:35:52', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655608', '1', '1792433080825925634', '2025-06-14 00:35:52', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655609', '1', '1792433157640409089', '2025-06-14 00:35:53', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655610', '1', '1792433241006395393', '2025-06-14 00:35:53', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655611', '1', '1792433334379991041', '2025-06-14 00:35:53', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655612', '1', '1792433410624049154', '2025-06-14 00:35:53', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655613', '1', '1792433529037639682', '2025-06-14 00:35:53', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655614', '1', '1912035971633811458', '2025-06-14 00:35:53', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655615', '1', '1919330303376265217', '2025-06-14 00:35:53', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655616', '1', '1919376575265148930', '2025-06-14 00:35:54', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655617', '1', '1919376628151128065', '2025-06-14 00:35:54', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655618', '1', '1914609394323050498', '2025-06-14 00:35:54', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655619', '1', '1914609547306094594', '2025-06-14 00:35:54', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655620', '1', '1914609608735870978', '2025-06-14 00:35:54', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655621', '1', '1914609663005970434', '2025-06-14 00:35:54', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655622', '1', '1914609715984224257', '2025-06-14 00:35:55', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655623', '1', '1914609770107523073', '2025-06-14 00:35:55', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655624', '1', '1915418500774674433', '2025-06-14 00:35:55', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655625', '1', '1915420286516379649', '2025-06-14 00:35:55', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655626', '1', '1915420350722785281', '2025-06-14 00:35:55', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655627', '1', '1915420405852717058', '2025-06-14 00:35:55', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655628', '1', '1915420456041758721', '2025-06-14 00:35:55', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655629', '1', '1915420507648475137', '2025-06-14 00:35:56', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655630', '1', '1919320902775070721', '2025-06-14 00:35:56', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655631', '1', '1919330498851803138', '2025-06-14 00:35:56', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655632', '1', '1919330561216909314', '2025-06-14 00:35:56', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655633', '1', '1919330723704246273', '2025-06-14 00:35:56', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655634', '1', '1919330791362564097', '2025-06-14 00:35:56', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655635', '1', '1919330860673437697', '2025-06-14 00:35:56', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655636', '1', '1919330975211491329', '2025-06-14 00:35:57', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655637', '1', '1527835787455164418', '2025-06-14 00:35:57', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655638', '1', '1908877054320013313', '2025-06-14 00:35:57', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655639', '1', '1929219051333292034', '2025-06-14 00:35:57', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655640', '1', '1527835963171336193', '2025-06-14 00:35:57', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655641', '1', '1527836010248204290', '2025-06-14 00:35:57', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655642', '1', '1527836010944458754', '2025-06-14 00:35:57', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655643', '1', '1600477837933047810', '2025-06-14 00:35:58', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655644', '1', '1600478029277196290', '2025-06-14 00:35:58', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655645', '1', '1600478336006647809', '2025-06-14 00:35:58', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655646', '1', '1600478397226708994', '2025-06-14 00:35:58', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655647', '1', '1600478467569381377', '2025-06-14 00:35:58', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655648', '1', '1600785452746854401', '2025-06-14 00:35:58', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655649', '1', '1779386487675092994', '2025-06-14 00:35:59', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655650', '1', '1496327483721789441', '2025-06-14 00:35:59', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655651', '1', '1496327552973942785', '2025-06-14 00:35:59', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655652', '1', '1496327553334652930', '2025-06-14 00:35:59', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655653', '1', '1496327553699557377', '2025-06-14 00:35:59', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655654', '1', '1496327554068656130', '2025-06-14 00:35:59', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655655', '1', '1496327554433560577', '2025-06-14 00:35:59', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655656', '1', '1532620395988029442', '2025-06-14 00:36:00', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655657', '1', '1493587910381957121', '2025-06-14 00:36:00', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655658', '1', '1493587910721695745', '2025-06-14 00:36:00', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655659', '1', '1493587911057240066', '2025-06-14 00:36:00', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655660', '1', '1496012487833960450', '2025-06-14 00:36:00', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655661', '1', '1497468294740176898', '2025-06-14 00:36:00', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655662', '1', '1871099260888489985', '2025-06-14 00:36:00', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655663', '1', '1532620101065543681', '2025-06-14 00:36:01', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655664', '1', '1532620840659750914', '2025-06-14 00:36:01', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655665', '1', '1532620931885862913', '2025-06-14 00:36:01', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655666', '1', '1532621007333003266', '2025-06-14 00:36:01', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655667', '1', '1532621107589451778', '2025-06-14 00:36:01', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655668', '1', '1532621196013768706', '2025-06-14 00:36:01', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655669', '1', '1532634358100430850', '2025-06-14 00:36:02', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655670', '1', '1532634435510505473', '2025-06-14 00:36:02', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655671', '1', '1532634517374930946', '2025-06-14 00:36:02', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655672', '1', '1532634586568364034', '2025-06-14 00:36:02', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655673', '1', '1532634687902748674', '2025-06-14 00:36:02', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655674', '1', '1788375299184926722', '2025-06-14 00:36:02', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655675', '1', '1788375557960900610', '2025-06-14 00:36:02', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655676', '1', '1788375651716177922', '2025-06-14 00:36:03', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655677', '1', '1788375752018763778', '2025-06-14 00:36:03', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655678', '1', '1788375826039840770', '2025-06-14 00:36:03', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655679', '1', '1788375917437919234', '2025-06-14 00:36:03', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655680', '1', '1496327802522447873', '2025-06-14 00:36:03', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655681', '1', '1496327860647112706', '2025-06-14 00:36:03', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655682', '1', '1496327861003628545', '2025-06-14 00:36:04', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655683', '1', '1496327861351755778', '2025-06-14 00:36:04', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655684', '1', '1496327861712465921', '2025-06-14 00:36:04', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655685', '1', '1496327862068981762', '2025-06-14 00:36:04', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655686', '1', '1925807685068963841', '2025-06-14 00:36:04', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655687', '1', '1925809318075088898', '2025-06-14 00:36:04', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655688', '1', '1925914794987241473', '2025-06-14 00:36:04', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655689', '1', '1925914842571620353', '2025-06-14 00:36:05', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655690', '1', '1925914891900829698', '2025-06-14 00:36:05', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655691', '1', '1925914979066855425', '2025-06-14 00:36:05', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655692', '1', '1925925897117028353', '2025-06-14 00:36:05', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655693', '1', '1521496866882236418', '2025-06-14 00:36:05', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655694', '1', '1927376759282610177', '2025-06-14 00:36:05', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655695', '1', '1927383125309149185', '2025-06-14 00:36:06', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655696', '1', '1927383173250043906', '2025-06-14 00:36:06', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655697', '1', '1927383226031165442', '2025-06-14 00:36:06', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655698', '1', '1927383271732301826', '2025-06-14 00:36:06', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655699', '1', '1927383317672513537', '2025-06-14 00:36:06', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655700', '1', '1531528760525074434', '2025-06-14 00:36:06', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655701', '1', '1531536449854517250', '2025-06-14 00:36:06', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655702', '1', '1531536545572728833', '2025-06-14 00:36:07', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655703', '1', '1531536746446336001', '2025-06-14 00:36:07', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655704', '1', '1531536866638311426', '2025-06-14 00:36:07', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655705', '1', '1535633963410956289', '2025-06-14 00:36:07', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655706', '1', '1681556362827534338', '2025-06-14 00:36:07', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655707', '1', '1531529196871102466', '2025-06-14 00:36:07', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655708', '1', '1531537172243689474', '2025-06-14 00:36:08', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655709', '1', '1531537289042472961', '2025-06-14 00:36:08', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655710', '1', '1543116535774879745', '2025-06-14 00:36:08', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655711', '1', '1925795369212493826', '2025-06-14 00:36:08', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655712', '1', '1928460262355152898', '2025-06-14 00:36:08', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655713', '1', '1928629828444127233', '2025-06-14 00:36:08', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655714', '1', '1928630130509512705', '2025-06-14 00:36:08', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655715', '1', '1928630268875407361', '2025-06-14 00:36:09', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655716', '1', '1928630353386438658', '2025-06-14 00:36:09', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655717', '1', '1915402225524641793', '2025-06-14 00:36:09', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655718', '1', '1915402317111463938', '2025-06-14 00:36:09', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655719', '1', '1915402364934918145', '2025-06-14 00:36:09', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655720', '1', '1915402440830849026', '2025-06-14 00:36:09', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655721', '1', '1915402499827929090', '2025-06-14 00:36:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655722', '1', '1915402558879535105', '2025-06-14 00:36:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655723', '1', '1670722611195203586', '2025-06-14 00:36:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655724', '1', '1531445896986435585', '2025-06-14 00:36:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655725', '1', '1531446009649635329', '2025-06-14 00:36:10', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655726', '1', '1531446009779658754', '2025-06-14 00:36:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655727', '1', '1531446009913876482', '2025-06-14 00:36:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655728', '1', '1531446010039705602', '2025-06-14 00:36:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655729', '1', '1531446010169729026', '2025-06-14 00:36:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655730', '1', '1670722888228982785', '2025-06-14 00:36:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655731', '1', '1670724676428550146', '2025-06-14 00:36:11', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655732', '1', '1670725150502342658', '2025-06-14 00:36:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655733', '1', '1670723480636674049', '2025-06-14 00:36:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655734', '1', '1670725580288479233', '2025-06-14 00:36:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655735', '1', '1670725673255227394', '2025-06-14 00:36:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655736', '1', '1670732624412332034', '2025-06-14 00:36:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655737', '1', '1670732985965531137', '2025-06-14 00:36:12', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655738', '1', '1671121808444674049', '2025-06-14 00:36:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655739', '1', '1779386604402573314', '2025-06-14 00:36:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655740', '1', '1585191363078467586', '2025-06-14 00:36:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655741', '1', '1585191589231144962', '2025-06-14 00:36:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655742', '1', '1585192004932808706', '2025-06-14 00:36:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655743', '1', '1585192140589182977', '2025-06-14 00:36:13', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655744', '1', '1585192296575348738', '2025-06-14 00:36:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655745', '1', '1585192489970511873', '2025-06-14 00:36:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655746', '1', '1585192568882147330', '2025-06-14 00:36:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655747', '1', '1585916026725281793', '2025-06-14 00:36:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655748', '1', '1585916172586397697', '2025-06-14 00:36:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655749', '1', '1867574302526791682', '2025-06-14 00:36:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655750', '1', '1867574701077946369', '2025-06-14 00:36:14', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655751', '1', '1867574920268079105', '2025-06-14 00:36:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655752', '1', '1867574970650058754', '2025-06-14 00:36:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655753', '1', '1867575019589197825', '2025-06-14 00:36:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655754', '1', '1867575119333941250', '2025-06-14 00:36:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655755', '1', '1867575179505426433', '2025-06-14 00:36:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655756', '1', '1868158971727056897', '2025-06-14 00:36:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655757', '1', '1919729610357121026', '2025-06-14 00:36:15', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655758', '1', '1899099320962129922', '2025-06-14 00:36:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655759', '1', '1899099806679310337', '2025-06-14 00:36:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655760', '1', '1899100147609116674', '2025-06-14 00:36:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655761', '1', '1899100200448958466', '2025-06-14 00:36:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655762', '1', '1899100257789288450', '2025-06-14 00:36:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655763', '1', '1899100333685219330', '2025-06-14 00:36:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655764', '1', '1899100516183580674', '2025-06-14 00:36:16', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655765', '1', '1899100759243497474', '2025-06-14 00:36:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655766', '1', '1899101135661309954', '2025-06-14 00:36:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655767', '1', '1899101198156439554', '2025-06-14 00:36:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655768', '1', '1899101251365380098', '2025-06-14 00:36:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655769', '1', '1899101326753800193', '2025-06-14 00:36:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655770', '1', '1899101388426846210', '2025-06-14 00:36:17', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655771', '1', '1915291965440675841', '2025-06-14 00:36:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655772', '1', '1915292387572207618', '2025-06-14 00:36:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655773', '1', '1915292689620815874', '2025-06-14 00:36:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655774', '1', '1915292768339513345', '2025-06-14 00:36:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655775', '1', '1915292607194353666', '2025-06-14 00:36:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655776', '1', '1915292895489839106', '2025-06-14 00:36:18', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655777', '1', '1915292947947999234', '2025-06-14 00:36:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655778', '1', '1915292996463513601', '2025-06-14 00:36:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948693655779', '1', '1915293051547308033', '2025-06-14 00:36:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849856', '1', '1917098137059606530', '2025-06-14 00:36:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849857', '1', '1917098249194323969', '2025-06-14 00:36:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849858', '1', '1917098323634831361', '2025-06-14 00:36:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849859', '1', '1539129183310196738', '2025-06-14 00:36:19', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849860', '1', '1531846893999169537', '2025-06-14 00:36:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849861', '1', '1531882841361915906', '2025-06-14 00:36:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849862', '1', '1615718593878704130', '2025-06-14 00:36:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849863', '1', '1615718665584525314', '2025-06-14 00:36:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849864', '1', '1615718738766741505', '2025-06-14 00:36:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849865', '1', '1615718811491778562', '2025-06-14 00:36:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849866', '1', '10001', '2025-06-14 00:36:20', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849867', '1', '1491752531735490561', '2025-06-14 00:36:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849868', '1', '1491756888363307009', '2025-06-14 00:36:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849869', '1', '1491757020773289986', '2025-06-14 00:36:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849870', '1', '1491757382771085313', '2025-06-14 00:36:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849871', '1', '1494514119857180674', '2025-06-14 00:36:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849872', '1', '1547110946242326529', '2025-06-14 00:36:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849873', '1', '1547111164111253505', '2025-06-14 00:36:21', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849874', '1', '1491684226094198786', '2025-06-14 00:36:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849875', '1', '1491690996678021121', '2025-06-14 00:36:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849876', '1', '1493836091183411202', '2025-06-14 00:36:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849877', '1', '1493836209106268161', '2025-06-14 00:36:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849878', '1', '1493836280589791233', '2025-06-14 00:36:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849879', '1', '1493841029473042434', '2025-06-14 00:36:22', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849880', '1', '1590700851537625090', '2025-06-14 00:36:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849881', '1', '1494216988311183361', '2025-06-14 00:36:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849882', '1', '1494217080162246658', '2025-06-14 00:36:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849883', '1', '1494217080510373890', '2025-06-14 00:36:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849884', '1', '1494217080858501121', '2025-06-14 00:36:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849885', '1', '1494217081206628354', '2025-06-14 00:36:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849886', '1', '1494217081558949890', '2025-06-14 00:36:23', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849887', '1', '1605129651156598786', '2025-06-14 00:36:24', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849888', '1', '1605129783281369089', '2025-06-14 00:36:24', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849889', '1', '1605130091042619393', '2025-06-14 00:36:24', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849890', '1', '1493884088730529793', '2025-06-14 00:36:24', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849891', '1', '1493884379760701442', '2025-06-14 00:36:24', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849892', '1', '1494192758630694913', '2025-06-14 00:36:24', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849893', '1', '1494192758974627842', '2025-06-14 00:36:24', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849894', '1', '1494192759318560770', '2025-06-14 00:36:25', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849895', '1', '1494192759662493698', '2025-06-14 00:36:25', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849896', '1', '1494192760010620930', '2025-06-14 00:36:25', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849897', '1', '1494151991157673985', '2025-06-14 00:36:25', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849898', '1', '1494153372996255746', '2025-06-14 00:36:25', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849899', '1', '1494153373352771586', '2025-06-14 00:36:25', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849900', '1', '1494153373696704514', '2025-06-14 00:36:25', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849901', '1', '1494153374053220354', '2025-06-14 00:36:26', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849902', '1', '1494153374401347585', '2025-06-14 00:36:26', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849903', '1', '1491948958826921986', '2025-06-14 00:36:26', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849904', '1', '1491949315883827201', '2025-06-14 00:36:26', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849905', '1', '1491969633293729794', '2025-06-14 00:36:26', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849906', '1', '1928789844748812290', '2025-06-14 00:36:26', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849907', '1', '1928789932476874754', '2025-06-14 00:36:27', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849908', '1', '1928790012067987457', '2025-06-14 00:36:27', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849909', '1', '1491973212968632322', '2025-06-14 00:36:27', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849910', '1', '1493578977630121986', '2025-06-14 00:36:27', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849911', '1', '1493578977978249218', '2025-06-14 00:36:27', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849912', '1', '1493578978313793537', '2025-06-14 00:36:27', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849913', '1', '1493578978649337858', '2025-06-14 00:36:27', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849914', '1', '1526179827628048385', '2025-06-14 00:36:28', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849915', '1', '1493596733666652162', '2025-06-14 00:36:28', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849916', '1', '1493766204259942401', '2025-06-14 00:36:28', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849917', '1', '1537048076783616001', '2025-06-14 00:36:28', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849918', '1', '1537066492991012865', '2025-06-14 00:36:28', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849919', '1', '1537066557067395074', '2025-06-14 00:36:28', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849920', '1', '1927019068022489089', '2025-06-14 00:36:28', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849921', '1', '1927019358259937281', '2025-06-14 00:36:29', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849922', '1', '1927019806207410177', '2025-06-14 00:36:29', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849923', '1', '1927019859089195010', '2025-06-14 00:36:29', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849924', '1', '1927019907625680898', '2025-06-14 00:36:29', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849925', '1', '1927019952529899521', '2025-06-14 00:36:29', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849926', '1', '1927019998386225153', '2025-06-14 00:36:29', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849927', '1', '1927021148942532609', '2025-06-14 00:36:30', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849928', '1', '1927021215334170626', '2025-06-14 00:36:30', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849929', '1', '1927021260133531650', '2025-06-14 00:36:30', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849930', '1', '1927021317796823041', '2025-06-14 00:36:30', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849931', '1', '1927021366836625410', '2025-06-14 00:36:30', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849932', '1', '1927021411304636418', '2025-06-14 00:36:30', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849933', '1', '1928822847139115009', '2025-06-14 00:36:30', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849934', '1', '1928823260638769153', '2025-06-14 00:36:31', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849935', '1', '1928823312304205825', '2025-06-14 00:36:31', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849936', '1', '1928823358349275138', '2025-06-14 00:36:31', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849937', '1', '1928823403488374786', '2025-06-14 00:36:31', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849938', '1', '1928823461483016193', '2025-06-14 00:36:31', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849939', '1', '1928823102488342529', '2025-06-14 00:36:31', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849940', '1', '1928823538368802817', '2025-06-14 00:36:31', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849941', '1', '1928823581008097281', '2025-06-14 00:36:32', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849942', '1', '1928823624427532289', '2025-06-14 00:36:32', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849943', '1', '1928823667876327426', '2025-06-14 00:36:32', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849944', '1', '1928823711622918145', '2025-06-14 00:36:32', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849945', '1', '1933563583067787265', '2025-06-14 00:36:32', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849946', '1', '1933563693336039426', '2025-06-14 00:36:32', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849947', '1', '1933563747207680002', '2025-06-14 00:36:32', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849948', '1', '1933563803264552961', '2025-06-14 00:36:33', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849949', '1', '1933563850534359042', '2025-06-14 00:36:33', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849950', '1', '1933563897820942337', '2025-06-14 00:36:33', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849951', '1', '1917432922911051778', '2025-06-14 00:36:33', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849952', '1', '1917461111616065537', '2025-06-14 00:36:33', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849953', '1', '1917466901169065986', '2025-06-14 00:36:33', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849954', '1', '1917466958165463041', '2025-06-14 00:36:34', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849955', '1', '1917467140303114241', '2025-06-14 00:36:34', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849956', '1', '1917467189217087489', '2025-06-14 00:36:34', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849957', '1', '1917461425765240834', '2025-06-14 00:36:34', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849958', '1', '1918277965781831682', '2025-06-14 00:36:34', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849959', '1', '1918278021725458433', '2025-06-14 00:36:34', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933563948697849960', '1', '1918278074695323650', '2025-06-14 00:36:34', '1590229800633634816');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678848', '1881232177484574722', '1881217134381326338', '2025-06-14 00:44:45', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678849', '1881232177484574722', '10002', '2025-06-14 00:44:45', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678850', '1881232177484574722', '100001', '2025-06-14 00:44:45', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678851', '1881232177484574722', '1495687621054353410', '2025-06-14 00:44:45', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678852', '1881232177484574722', '1495687858816864257', '2025-06-14 00:44:46', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678853', '1881232177484574722', '1521469373525716994', '2025-06-14 00:44:46', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678854', '1881232177484574722', '999999999999', '2025-06-14 00:44:46', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678855', '1881232177484574722', '1583296344638287874', '2025-06-14 00:44:46', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678856', '1881232177484574722', '1583296419947016193', '2025-06-14 00:44:46', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678857', '1881232177484574722', '1583346865315131394', '2025-06-14 00:44:46', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678858', '1881232177484574722', '1583346942263832578', '2025-06-14 00:44:46', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678859', '1881232177484574722', '1583347000673710082', '2025-06-14 00:44:47', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678860', '1881232177484574722', '1583351948518031361', '2025-06-14 00:44:47', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678861', '1881232177484574722', '1583296499370356738', '2025-06-14 00:44:47', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678862', '1881232177484574722', '1583355071571648514', '2025-06-14 00:44:47', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678863', '1881232177484574722', '1583355125187436546', '2025-06-14 00:44:47', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678864', '1881232177484574722', '1583355179121991681', '2025-06-14 00:44:47', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678865', '1881232177484574722', '1583355228157599745', '2025-06-14 00:44:47', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678866', '1881232177484574722', '1590265776187023362', '2025-06-14 00:44:48', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678867', '1881232177484574722', '1590265951848669185', '2025-06-14 00:44:48', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678868', '1881232177484574722', '1590266107100831746', '2025-06-14 00:44:48', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678869', '1881232177484574722', '1590704386824192002', '2025-06-14 00:44:48', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678870', '1881232177484574722', '1590704512468762626', '2025-06-14 00:44:48', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678871', '1881232177484574722', '1590972046640115713', '2025-06-14 00:44:48', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678872', '1881232177484574722', '1590972187874914305', '2025-06-14 00:44:48', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678873', '1881232177484574722', '1590972258943201281', '2025-06-14 00:44:49', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678874', '1881232177484574722', '1590972321283141633', '2025-06-14 00:44:49', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678875', '1881232177484574722', '1590972375171559426', '2025-06-14 00:44:49', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678876', '1881232177484574722', '1590972439457656833', '2025-06-14 00:44:49', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678877', '1881232177484574722', '1527928859455168514', '2025-06-14 00:44:49', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678878', '1881232177484574722', '1527947365856878593', '2025-06-14 00:44:49', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678879', '1881232177484574722', '1536174316656533505', '2025-06-14 00:44:50', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678880', '1881232177484574722', '1536174413406543874', '2025-06-14 00:44:50', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678881', '1881232177484574722', '1612481861469302786', '2025-06-14 00:44:50', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678882', '1881232177484574722', '1612683975455657985', '2025-06-14 00:44:50', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678883', '1881232177484574722', '1612684125251031042', '2025-06-14 00:44:50', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678884', '1881232177484574722', '1612684389953556481', '2025-06-14 00:44:50', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678885', '1881232177484574722', '1918546492761763842', '2025-06-14 00:44:50', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678886', '1881232177484574722', '1918548363786252289', '2025-06-14 00:44:51', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678887', '1881232177484574722', '1918548422007386114', '2025-06-14 00:44:51', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678888', '1881232177484574722', '1918548522972672002', '2025-06-14 00:44:51', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678889', '1881232177484574722', '1918548573316902914', '2025-06-14 00:44:51', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678890', '1881232177484574722', '1918548645416988673', '2025-06-14 00:44:51', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678891', '1881232177484574722', '1779386898750439425', '2025-06-14 00:44:51', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678892', '1881232177484574722', '1527471479688798209', '2025-06-14 00:44:51', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678893', '1881232177484574722', '1527471918001954818', '2025-06-14 00:44:52', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678894', '1881232177484574722', '1527471918337499138', '2025-06-14 00:44:52', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678895', '1881232177484574722', '1527471918694014977', '2025-06-14 00:44:52', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678896', '1881232177484574722', '1527471919042142209', '2025-06-14 00:44:52', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678897', '1881232177484574722', '1527471919386075137', '2025-06-14 00:44:52', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678898', '1881232177484574722', '1920115698355605506', '2025-06-14 00:44:52', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678899', '1881232177484574722', '1920115822607667201', '2025-06-14 00:44:53', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678900', '1881232177484574722', '1908430136292806657', '2025-06-14 00:44:53', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678901', '1881232177484574722', '1908432094680498178', '2025-06-14 00:44:53', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678902', '1881232177484574722', '1908432156768780290', '2025-06-14 00:44:53', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678903', '1881232177484574722', '1908432250347896833', '2025-06-14 00:44:53', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678904', '1881232177484574722', '1908432326675841025', '2025-06-14 00:44:53', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678905', '1881232177484574722', '1908432418606596098', '2025-06-14 00:44:53', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678906', '1881232177484574722', '1908497193025859585', '2025-06-14 00:44:54', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678907', '1881232177484574722', '1908497473855483906', '2025-06-14 00:44:54', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678908', '1881232177484574722', '1908497530839298049', '2025-06-14 00:44:54', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678909', '1881232177484574722', '1908497587646951425', '2025-06-14 00:44:54', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678910', '1881232177484574722', '1908497640419684354', '2025-06-14 00:44:54', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678911', '1881232177484574722', '1864964797636804609', '2025-06-14 00:44:54', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678912', '1881232177484574722', '1864965206908600322', '2025-06-14 00:44:54', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678913', '1881232177484574722', '1864965305650905090', '2025-06-14 00:44:55', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678914', '1881232177484574722', '1864965367609163777', '2025-06-14 00:44:55', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678915', '1881232177484574722', '1864965419459149826', '2025-06-14 00:44:55', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678916', '1881232177484574722', '1864965476786896897', '2025-06-14 00:44:55', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678917', '1881232177484574722', '1904181618258649090', '2025-06-14 00:44:55', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678918', '1881232177484574722', '1904182116281917442', '2025-06-14 00:44:55', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678919', '1881232177484574722', '1904182180618346498', '2025-06-14 00:44:56', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678920', '1881232177484574722', '1904182650648829953', '2025-06-14 00:44:56', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678921', '1881232177484574722', '1904182708047880193', '2025-06-14 00:44:56', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678922', '1881232177484574722', '1904182762854850562', '2025-06-14 00:44:56', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678923', '1881232177484574722', '1904183774843936770', '2025-06-14 00:44:56', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678924', '1881232177484574722', '1904183950442668034', '2025-06-14 00:44:56', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678925', '1881232177484574722', '1904183545772023810', '2025-06-14 00:44:56', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678926', '1881232177484574722', '1904183663623577602', '2025-06-14 00:44:57', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678927', '1881232177484574722', '1904183832930852866', '2025-06-14 00:44:57', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678928', '1881232177484574722', '1904182493270155265', '2025-06-14 00:44:57', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678929', '1881232177484574722', '1904182844975128577', '2025-06-14 00:44:57', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678930', '1881232177484574722', '1904182907902271489', '2025-06-14 00:44:57', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678931', '1881232177484574722', '1904182961836826626', '2025-06-14 00:44:57', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678932', '1881232177484574722', '1904183013204467714', '2025-06-14 00:44:58', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678933', '1881232177484574722', '1904183083324841986', '2025-06-14 00:44:58', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678934', '1881232177484574722', '1906362572637732866', '2025-06-14 00:44:58', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678935', '1881232177484574722', '1906362786735980545', '2025-06-14 00:44:58', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678936', '1881232177484574722', '1906362904411373570', '2025-06-14 00:44:58', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678937', '1881232177484574722', '1906363079829749762', '2025-06-14 00:44:58', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678938', '1881232177484574722', '1915034838212198402', '2025-06-14 00:44:58', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678939', '1881232177484574722', '1779386782480138242', '2025-06-14 00:44:59', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678940', '1881232177484574722', '1788196420663123969', '2025-06-14 00:44:59', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678941', '1881232177484574722', '1788196662338920449', '2025-06-14 00:44:59', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678942', '1881232177484574722', '1788196733688225793', '2025-06-14 00:44:59', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678943', '1881232177484574722', '1788196790093225986', '2025-06-14 00:44:59', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678944', '1881232177484574722', '1788196840919801858', '2025-06-14 00:44:59', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678945', '1881232177484574722', '1788196890592944129', '2025-06-14 00:44:59', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678946', '1881232177484574722', '1792432863812636673', '2025-06-14 00:45:00', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678947', '1881232177484574722', '1792433080825925634', '2025-06-14 00:45:00', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678948', '1881232177484574722', '1792433157640409089', '2025-06-14 00:45:00', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678949', '1881232177484574722', '1792433241006395393', '2025-06-14 00:45:00', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678950', '1881232177484574722', '1792433334379991041', '2025-06-14 00:45:00', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678951', '1881232177484574722', '1792433410624049154', '2025-06-14 00:45:00', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678952', '1881232177484574722', '1792433529037639682', '2025-06-14 00:45:00', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678953', '1881232177484574722', '1912035971633811458', '2025-06-14 00:45:01', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678954', '1881232177484574722', '1919330303376265217', '2025-06-14 00:45:01', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678955', '1881232177484574722', '1919376575265148930', '2025-06-14 00:45:01', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678956', '1881232177484574722', '1919376628151128065', '2025-06-14 00:45:01', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678957', '1881232177484574722', '1914609394323050498', '2025-06-14 00:45:01', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678958', '1881232177484574722', '1914609547306094594', '2025-06-14 00:45:01', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678959', '1881232177484574722', '1914609608735870978', '2025-06-14 00:45:01', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678960', '1881232177484574722', '1914609663005970434', '2025-06-14 00:45:02', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678961', '1881232177484574722', '1914609715984224257', '2025-06-14 00:45:02', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678962', '1881232177484574722', '1914609770107523073', '2025-06-14 00:45:02', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678963', '1881232177484574722', '1915418500774674433', '2025-06-14 00:45:02', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678964', '1881232177484574722', '1915420286516379649', '2025-06-14 00:45:02', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678965', '1881232177484574722', '1915420350722785281', '2025-06-14 00:45:02', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678966', '1881232177484574722', '1915420405852717058', '2025-06-14 00:45:03', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678967', '1881232177484574722', '1915420456041758721', '2025-06-14 00:45:03', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678968', '1881232177484574722', '1915420507648475137', '2025-06-14 00:45:03', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678969', '1881232177484574722', '1919320902775070721', '2025-06-14 00:45:03', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678970', '1881232177484574722', '1527835787455164418', '2025-06-14 00:45:03', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678971', '1881232177484574722', '1908877054320013313', '2025-06-14 00:45:03', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678972', '1881232177484574722', '1929219051333292034', '2025-06-14 00:45:03', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678973', '1881232177484574722', '1527835963171336193', '2025-06-14 00:45:04', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217673678974', '1881232177484574722', '1527836010248204290', '2025-06-14 00:45:04', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873152', '1881232177484574722', '1527836010944458754', '2025-06-14 00:45:04', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873153', '1881232177484574722', '1600477837933047810', '2025-06-14 00:45:04', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873154', '1881232177484574722', '1600478029277196290', '2025-06-14 00:45:04', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873155', '1881232177484574722', '1600478336006647809', '2025-06-14 00:45:04', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873156', '1881232177484574722', '1600478397226708994', '2025-06-14 00:45:04', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873157', '1881232177484574722', '1600478467569381377', '2025-06-14 00:45:05', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873158', '1881232177484574722', '1600785452746854401', '2025-06-14 00:45:05', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873159', '1881232177484574722', '1779386487675092994', '2025-06-14 00:45:05', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873160', '1881232177484574722', '1496327483721789441', '2025-06-14 00:45:05', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873161', '1881232177484574722', '1496327552973942785', '2025-06-14 00:45:05', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873162', '1881232177484574722', '1496327553334652930', '2025-06-14 00:45:05', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873163', '1881232177484574722', '1496327553699557377', '2025-06-14 00:45:05', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873164', '1881232177484574722', '1496327554068656130', '2025-06-14 00:45:06', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873165', '1881232177484574722', '1496327554433560577', '2025-06-14 00:45:06', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873166', '1881232177484574722', '1532620395988029442', '2025-06-14 00:45:06', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873167', '1881232177484574722', '1493587910381957121', '2025-06-14 00:45:06', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873168', '1881232177484574722', '1493587910721695745', '2025-06-14 00:45:06', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873169', '1881232177484574722', '1493587911057240066', '2025-06-14 00:45:06', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873170', '1881232177484574722', '1496012487833960450', '2025-06-14 00:45:07', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873171', '1881232177484574722', '1497468294740176898', '2025-06-14 00:45:07', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873172', '1881232177484574722', '1871099260888489985', '2025-06-14 00:45:07', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873173', '1881232177484574722', '1532620101065543681', '2025-06-14 00:45:07', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873174', '1881232177484574722', '1532620840659750914', '2025-06-14 00:45:07', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873175', '1881232177484574722', '1532620931885862913', '2025-06-14 00:45:07', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873176', '1881232177484574722', '1532621007333003266', '2025-06-14 00:45:07', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873177', '1881232177484574722', '1532621107589451778', '2025-06-14 00:45:08', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873178', '1881232177484574722', '1532621196013768706', '2025-06-14 00:45:08', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873179', '1881232177484574722', '1532634358100430850', '2025-06-14 00:45:08', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873180', '1881232177484574722', '1532634435510505473', '2025-06-14 00:45:08', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873181', '1881232177484574722', '1532634517374930946', '2025-06-14 00:45:08', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873182', '1881232177484574722', '1532634586568364034', '2025-06-14 00:45:08', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873183', '1881232177484574722', '1532634687902748674', '2025-06-14 00:45:08', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873184', '1881232177484574722', '1788375299184926722', '2025-06-14 00:45:09', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873185', '1881232177484574722', '1788375557960900610', '2025-06-14 00:45:09', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873186', '1881232177484574722', '1788375651716177922', '2025-06-14 00:45:09', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873187', '1881232177484574722', '1788375752018763778', '2025-06-14 00:45:09', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873188', '1881232177484574722', '1788375826039840770', '2025-06-14 00:45:09', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873189', '1881232177484574722', '1788375917437919234', '2025-06-14 00:45:09', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873190', '1881232177484574722', '1496327802522447873', '2025-06-14 00:45:09', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873191', '1881232177484574722', '1496327860647112706', '2025-06-14 00:45:10', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873192', '1881232177484574722', '1496327861003628545', '2025-06-14 00:45:10', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873193', '1881232177484574722', '1496327861351755778', '2025-06-14 00:45:10', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873194', '1881232177484574722', '1496327861712465921', '2025-06-14 00:45:10', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873195', '1881232177484574722', '1496327862068981762', '2025-06-14 00:45:10', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873196', '1881232177484574722', '1925807685068963841', '2025-06-14 00:45:10', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873197', '1881232177484574722', '1925809318075088898', '2025-06-14 00:45:10', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873198', '1881232177484574722', '1925914794987241473', '2025-06-14 00:45:11', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873199', '1881232177484574722', '1925914842571620353', '2025-06-14 00:45:11', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873200', '1881232177484574722', '1925914891900829698', '2025-06-14 00:45:11', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873201', '1881232177484574722', '1925914979066855425', '2025-06-14 00:45:11', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873202', '1881232177484574722', '1925925897117028353', '2025-06-14 00:45:11', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873203', '1881232177484574722', '1521496866882236418', '2025-06-14 00:45:11', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873204', '1881232177484574722', '1927376759282610177', '2025-06-14 00:45:12', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873205', '1881232177484574722', '1927383125309149185', '2025-06-14 00:45:12', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873206', '1881232177484574722', '1927383173250043906', '2025-06-14 00:45:12', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873207', '1881232177484574722', '1927383226031165442', '2025-06-14 00:45:12', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873208', '1881232177484574722', '1927383271732301826', '2025-06-14 00:45:12', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873209', '1881232177484574722', '1927383317672513537', '2025-06-14 00:45:12', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873210', '1881232177484574722', '1531528760525074434', '2025-06-14 00:45:12', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873211', '1881232177484574722', '1531536449854517250', '2025-06-14 00:45:13', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873212', '1881232177484574722', '1531536545572728833', '2025-06-14 00:45:13', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873213', '1881232177484574722', '1531536746446336001', '2025-06-14 00:45:13', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873214', '1881232177484574722', '1531536866638311426', '2025-06-14 00:45:13', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873215', '1881232177484574722', '1535633963410956289', '2025-06-14 00:45:13', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873216', '1881232177484574722', '1681556362827534338', '2025-06-14 00:45:13', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873217', '1881232177484574722', '1531529196871102466', '2025-06-14 00:45:13', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873218', '1881232177484574722', '1531537172243689474', '2025-06-14 00:45:14', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873219', '1881232177484574722', '1531537289042472961', '2025-06-14 00:45:14', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873220', '1881232177484574722', '1543116535774879745', '2025-06-14 00:45:14', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873221', '1881232177484574722', '1925795369212493826', '2025-06-14 00:45:14', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873222', '1881232177484574722', '1928460262355152898', '2025-06-14 00:45:14', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873223', '1881232177484574722', '1928629828444127233', '2025-06-14 00:45:14', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873224', '1881232177484574722', '1928630130509512705', '2025-06-14 00:45:14', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873225', '1881232177484574722', '1928630268875407361', '2025-06-14 00:45:15', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873226', '1881232177484574722', '1928630353386438658', '2025-06-14 00:45:15', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873227', '1881232177484574722', '1915402225524641793', '2025-06-14 00:45:15', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873228', '1881232177484574722', '1915402317111463938', '2025-06-14 00:45:15', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873229', '1881232177484574722', '1915402364934918145', '2025-06-14 00:45:15', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873230', '1881232177484574722', '1915402440830849026', '2025-06-14 00:45:15', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873231', '1881232177484574722', '1915402499827929090', '2025-06-14 00:45:16', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873232', '1881232177484574722', '1915402558879535105', '2025-06-14 00:45:16', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873233', '1881232177484574722', '1670722611195203586', '2025-06-14 00:45:16', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873234', '1881232177484574722', '1531445896986435585', '2025-06-14 00:45:16', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873235', '1881232177484574722', '1531446009649635329', '2025-06-14 00:45:16', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873236', '1881232177484574722', '1531446009779658754', '2025-06-14 00:45:16', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873237', '1881232177484574722', '1531446009913876482', '2025-06-14 00:45:16', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873238', '1881232177484574722', '1531446010039705602', '2025-06-14 00:45:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873239', '1881232177484574722', '1531446010169729026', '2025-06-14 00:45:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873240', '1881232177484574722', '1670722888228982785', '2025-06-14 00:45:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873241', '1881232177484574722', '1670724676428550146', '2025-06-14 00:45:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873242', '1881232177484574722', '1670725150502342658', '2025-06-14 00:45:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873243', '1881232177484574722', '1670723480636674049', '2025-06-14 00:45:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873244', '1881232177484574722', '1670725580288479233', '2025-06-14 00:45:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873245', '1881232177484574722', '1670725673255227394', '2025-06-14 00:45:18', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873246', '1881232177484574722', '1670732624412332034', '2025-06-14 00:45:18', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873247', '1881232177484574722', '1670732985965531137', '2025-06-14 00:45:18', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873248', '1881232177484574722', '1671121808444674049', '2025-06-14 00:45:18', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873249', '1881232177484574722', '1779386604402573314', '2025-06-14 00:45:18', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873250', '1881232177484574722', '1585191363078467586', '2025-06-14 00:45:18', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873251', '1881232177484574722', '1585191589231144962', '2025-06-14 00:45:18', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873252', '1881232177484574722', '1585192004932808706', '2025-06-14 00:45:19', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873253', '1881232177484574722', '1585192140589182977', '2025-06-14 00:45:19', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873254', '1881232177484574722', '1585192296575348738', '2025-06-14 00:45:19', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873255', '1881232177484574722', '1585192489970511873', '2025-06-14 00:45:19', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873256', '1881232177484574722', '1585192568882147330', '2025-06-14 00:45:19', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873257', '1881232177484574722', '1585916026725281793', '2025-06-14 00:45:19', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873258', '1881232177484574722', '1585916172586397697', '2025-06-14 00:45:19', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873259', '1881232177484574722', '1867574302526791682', '2025-06-14 00:45:20', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873260', '1881232177484574722', '1867574701077946369', '2025-06-14 00:45:20', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873261', '1881232177484574722', '1867574920268079105', '2025-06-14 00:45:20', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873262', '1881232177484574722', '1867574970650058754', '2025-06-14 00:45:20', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873263', '1881232177484574722', '1867575019589197825', '2025-06-14 00:45:20', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873264', '1881232177484574722', '1867575119333941250', '2025-06-14 00:45:20', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873265', '1881232177484574722', '1867575179505426433', '2025-06-14 00:45:20', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873266', '1881232177484574722', '1868158971727056897', '2025-06-14 00:45:21', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873267', '1881232177484574722', '1919729610357121026', '2025-06-14 00:45:21', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873268', '1881232177484574722', '1899099320962129922', '2025-06-14 00:45:21', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873269', '1881232177484574722', '1899099806679310337', '2025-06-14 00:45:21', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873270', '1881232177484574722', '1899100147609116674', '2025-06-14 00:45:21', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873271', '1881232177484574722', '1899100200448958466', '2025-06-14 00:45:21', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873272', '1881232177484574722', '1899100257789288450', '2025-06-14 00:45:22', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873273', '1881232177484574722', '1899100333685219330', '2025-06-14 00:45:22', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873274', '1881232177484574722', '1899100516183580674', '2025-06-14 00:45:22', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873275', '1881232177484574722', '1899100759243497474', '2025-06-14 00:45:22', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873276', '1881232177484574722', '1899101135661309954', '2025-06-14 00:45:22', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873277', '1881232177484574722', '1899101198156439554', '2025-06-14 00:45:22', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873278', '1881232177484574722', '1899101251365380098', '2025-06-14 00:45:22', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873279', '1881232177484574722', '1899101326753800193', '2025-06-14 00:45:23', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873280', '1881232177484574722', '1899101388426846210', '2025-06-14 00:45:23', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873281', '1881232177484574722', '1915291965440675841', '2025-06-14 00:45:23', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873282', '1881232177484574722', '1915292387572207618', '2025-06-14 00:45:23', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873283', '1881232177484574722', '1915292689620815874', '2025-06-14 00:45:23', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873284', '1881232177484574722', '1915292768339513345', '2025-06-14 00:45:23', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873285', '1881232177484574722', '1915292607194353666', '2025-06-14 00:45:23', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873286', '1881232177484574722', '1915292895489839106', '2025-06-14 00:45:24', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873287', '1881232177484574722', '1915292947947999234', '2025-06-14 00:45:24', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873288', '1881232177484574722', '1915292996463513601', '2025-06-14 00:45:24', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873289', '1881232177484574722', '1915293051547308033', '2025-06-14 00:45:24', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873290', '1881232177484574722', '1917098137059606530', '2025-06-14 00:45:24', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873291', '1881232177484574722', '1917098249194323969', '2025-06-14 00:45:24', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873292', '1881232177484574722', '1917098323634831361', '2025-06-14 00:45:24', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873293', '1881232177484574722', '1539129183310196738', '2025-06-14 00:45:25', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873294', '1881232177484574722', '1531846893999169537', '2025-06-14 00:45:25', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873295', '1881232177484574722', '1531882841361915906', '2025-06-14 00:45:25', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873296', '1881232177484574722', '1615718593878704130', '2025-06-14 00:45:25', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873297', '1881232177484574722', '1615718665584525314', '2025-06-14 00:45:25', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873298', '1881232177484574722', '1615718738766741505', '2025-06-14 00:45:25', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873299', '1881232177484574722', '1615718811491778562', '2025-06-14 00:45:26', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873300', '1881232177484574722', '10001', '2025-06-14 00:45:26', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873301', '1881232177484574722', '1491752531735490561', '2025-06-14 00:45:26', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873302', '1881232177484574722', '1491756888363307009', '2025-06-14 00:45:26', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873303', '1881232177484574722', '1491757020773289986', '2025-06-14 00:45:26', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873304', '1881232177484574722', '1491757382771085313', '2025-06-14 00:45:26', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873305', '1881232177484574722', '1494514119857180674', '2025-06-14 00:45:26', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873306', '1881232177484574722', '1547110946242326529', '2025-06-14 00:45:27', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873307', '1881232177484574722', '1547111164111253505', '2025-06-14 00:45:27', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873308', '1881232177484574722', '1491684226094198786', '2025-06-14 00:45:27', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873309', '1881232177484574722', '1491690996678021121', '2025-06-14 00:45:27', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873310', '1881232177484574722', '1493836091183411202', '2025-06-14 00:45:27', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873311', '1881232177484574722', '1493836209106268161', '2025-06-14 00:45:27', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873312', '1881232177484574722', '1493836280589791233', '2025-06-14 00:45:27', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873313', '1881232177484574722', '1493841029473042434', '2025-06-14 00:45:28', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873314', '1881232177484574722', '1590700851537625090', '2025-06-14 00:45:28', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873315', '1881232177484574722', '1494216988311183361', '2025-06-14 00:45:28', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873316', '1881232177484574722', '1494217080162246658', '2025-06-14 00:45:28', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873317', '1881232177484574722', '1494217080510373890', '2025-06-14 00:45:28', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873318', '1881232177484574722', '1494217080858501121', '2025-06-14 00:45:28', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873319', '1881232177484574722', '1494217081206628354', '2025-06-14 00:45:28', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873320', '1881232177484574722', '1494217081558949890', '2025-06-14 00:45:29', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873321', '1881232177484574722', '1605129651156598786', '2025-06-14 00:45:29', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873322', '1881232177484574722', '1605129783281369089', '2025-06-14 00:45:29', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873323', '1881232177484574722', '1605130091042619393', '2025-06-14 00:45:29', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873324', '1881232177484574722', '1493884088730529793', '2025-06-14 00:45:29', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873325', '1881232177484574722', '1493884379760701442', '2025-06-14 00:45:29', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873326', '1881232177484574722', '1494192758630694913', '2025-06-14 00:45:29', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873327', '1881232177484574722', '1494192758974627842', '2025-06-14 00:45:30', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873328', '1881232177484574722', '1494192759318560770', '2025-06-14 00:45:30', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873329', '1881232177484574722', '1494192759662493698', '2025-06-14 00:45:30', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873330', '1881232177484574722', '1494192760010620930', '2025-06-14 00:45:30', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873331', '1881232177484574722', '1494151991157673985', '2025-06-14 00:45:30', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873332', '1881232177484574722', '1494153372996255746', '2025-06-14 00:45:30', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873333', '1881232177484574722', '1494153373352771586', '2025-06-14 00:45:31', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873334', '1881232177484574722', '1494153373696704514', '2025-06-14 00:45:31', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873335', '1881232177484574722', '1494153374053220354', '2025-06-14 00:45:31', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873336', '1881232177484574722', '1494153374401347585', '2025-06-14 00:45:31', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873337', '1881232177484574722', '1491948958826921986', '2025-06-14 00:45:31', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873338', '1881232177484574722', '1491949315883827201', '2025-06-14 00:45:31', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873339', '1881232177484574722', '1491969633293729794', '2025-06-14 00:45:31', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873340', '1881232177484574722', '1928789844748812290', '2025-06-14 00:45:32', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873341', '1881232177484574722', '1928789932476874754', '2025-06-14 00:45:32', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873342', '1881232177484574722', '1928790012067987457', '2025-06-14 00:45:32', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873343', '1881232177484574722', '1491973212968632322', '2025-06-14 00:45:32', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873344', '1881232177484574722', '1493578977630121986', '2025-06-14 00:45:32', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873345', '1881232177484574722', '1493578977978249218', '2025-06-14 00:45:32', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873346', '1881232177484574722', '1493578978313793537', '2025-06-14 00:45:32', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873347', '1881232177484574722', '1493578978649337858', '2025-06-14 00:45:33', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873348', '1881232177484574722', '1526179827628048385', '2025-06-14 00:45:33', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873349', '1881232177484574722', '1493596733666652162', '2025-06-14 00:45:33', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873350', '1881232177484574722', '1493766204259942401', '2025-06-14 00:45:33', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873351', '1881232177484574722', '1537048076783616001', '2025-06-14 00:45:33', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873352', '1881232177484574722', '1537066492991012865', '2025-06-14 00:45:33', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873353', '1881232177484574722', '1537066557067395074', '2025-06-14 00:45:34', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873354', '1881232177484574722', '1927019068022489089', '2025-06-14 00:45:34', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873355', '1881232177484574722', '1927019358259937281', '2025-06-14 00:45:34', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873356', '1881232177484574722', '1927019806207410177', '2025-06-14 00:45:34', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873357', '1881232177484574722', '1927019859089195010', '2025-06-14 00:45:34', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873358', '1881232177484574722', '1927019907625680898', '2025-06-14 00:45:34', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873359', '1881232177484574722', '1927019952529899521', '2025-06-14 00:45:34', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873360', '1881232177484574722', '1927019998386225153', '2025-06-14 00:45:35', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873361', '1881232177484574722', '1927021148942532609', '2025-06-14 00:45:35', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873362', '1881232177484574722', '1927021215334170626', '2025-06-14 00:45:35', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873363', '1881232177484574722', '1927021260133531650', '2025-06-14 00:45:35', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873364', '1881232177484574722', '1927021317796823041', '2025-06-14 00:45:35', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873365', '1881232177484574722', '1927021366836625410', '2025-06-14 00:45:35', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873366', '1881232177484574722', '1927021411304636418', '2025-06-14 00:45:35', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873367', '1881232177484574722', '1928822847139115009', '2025-06-14 00:45:36', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873368', '1881232177484574722', '1928823260638769153', '2025-06-14 00:45:36', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873369', '1881232177484574722', '1928823312304205825', '2025-06-14 00:45:36', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873370', '1881232177484574722', '1928823358349275138', '2025-06-14 00:45:36', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873371', '1881232177484574722', '1928823403488374786', '2025-06-14 00:45:36', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873372', '1881232177484574722', '1928823461483016193', '2025-06-14 00:45:36', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873373', '1881232177484574722', '1928823102488342529', '2025-06-14 00:45:37', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873374', '1881232177484574722', '1928823538368802817', '2025-06-14 00:45:37', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873375', '1881232177484574722', '1928823581008097281', '2025-06-14 00:45:37', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873376', '1881232177484574722', '1928823624427532289', '2025-06-14 00:45:37', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873377', '1881232177484574722', '1928823667876327426', '2025-06-14 00:45:37', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873378', '1881232177484574722', '1928823711622918145', '2025-06-14 00:45:37', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873379', '1881232177484574722', '1933563583067787265', '2025-06-14 00:45:37', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873380', '1881232177484574722', '1933563693336039426', '2025-06-14 00:45:38', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873381', '1881232177484574722', '1933563747207680002', '2025-06-14 00:45:38', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873382', '1881232177484574722', '1933563803264552961', '2025-06-14 00:45:38', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873383', '1881232177484574722', '1933563850534359042', '2025-06-14 00:45:38', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873384', '1881232177484574722', '1933563897820942337', '2025-06-14 00:45:38', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873385', '1881232177484574722', '1917432922911051778', '2025-06-14 00:45:38', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873386', '1881232177484574722', '1917461111616065537', '2025-06-14 00:45:38', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873387', '1881232177484574722', '1917466901169065986', '2025-06-14 00:45:39', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873388', '1881232177484574722', '1917466958165463041', '2025-06-14 00:45:39', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873389', '1881232177484574722', '1917467140303114241', '2025-06-14 00:45:39', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873390', '1881232177484574722', '1917467189217087489', '2025-06-14 00:45:39', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873391', '1881232177484574722', '1917461425765240834', '2025-06-14 00:45:39', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873392', '1881232177484574722', '1918277965781831682', '2025-06-14 00:45:39', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873393', '1881232177484574722', '1918278021725458433', '2025-06-14 00:45:39', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1933566217677873394', '1881232177484574722', '1918278074695323650', '2025-06-14 00:45:40', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280725', '1881232177484574722', '1986003264361078786', '2025-11-05 21:17:16', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280726', '1881232177484574722', '1986003505764245505', '2025-11-05 21:17:16', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280727', '1881232177484574722', '1986003578032103426', '2025-11-05 21:17:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280728', '1881232177484574722', '1986003636857217026', '2025-11-05 21:17:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280729', '1881232177484574722', '1986003694830886913', '2025-11-05 21:17:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280730', '1881232177484574722', '1986003761939750914', '2025-11-05 21:17:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280731', '1881232177484574722', '1986003823453413377', '2025-11-05 21:17:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280732', '1881232177484574722', '1986010716532064257', '2025-11-05 21:17:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280733', '1881232177484574722', '1986060144760565762', '2025-11-05 21:17:17', '1881232176465358849');

-- ----------------------------
-- Table structure for sys_storage_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_storage_config`;
CREATE TABLE `sys_storage_config`  (
                                       `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                       `access_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'access_key',
                                       `access_secret` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'access_secret',
                                       `endpoint` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地域节点',
                                       `bucket` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
                                       `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '存储类型1、阿里OSS；2、七牛云；3、腾讯云',
                                       `create_time` datetime NULL DEFAULT NULL COMMENT '新增时间',
                                       `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                                       `dir` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'material' COMMENT '指定文件夹',
                                       `is_https` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                       `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                       `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                       `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                       `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                       `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态：0.正常；1.禁用；',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件存储配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_storage_config
-- ----------------------------
INSERT INTO `sys_storage_config` VALUES ('1491967331820404738', 'xxxxxx', 'xxxxxxxxxxxxxxxxx', 'https://xxxxxxx.ihuanxing.cn', 'haorong', '4', '2022-02-11 10:48:25', '2025-05-31 21:15:07', 'file', NULL, '0', '1590229800633634816', NULL, 'system', '0');

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
                               `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                               `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户名称',
                               `logo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户logo',
                               `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户地址',
                               `site_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '官网地址',
                               `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态：0.正常；1.停用；',
                               `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
                               `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
                               `auth_begin_time` datetime NOT NULL COMMENT '授权开始时间',
                               `auth_end_time` datetime NOT NULL COMMENT '授权结束时间',
                               `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                               `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                               `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                               `package_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户套餐id',
                               `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                               `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES ('1590229800633634816', '环兴商城', NULL, '辽宁省沈阳市浑南区软件园', 'www.ihuanxing.cn', '0', NULL, '17615123397', '2024-11-01 00:00:00', '2025-12-31 00:00:00', '0', '2022-11-09 17:43:41', '2024-12-19 15:36:10', '1639458123460681730', NULL, 'lijx');
INSERT INTO `sys_tenant` VALUES ('1881232176465358849', '系统租户', NULL, '辽宁省沈阳市浑南区', 'https://www.ihuanxing.cn', '0', NULL, '17640212321', '2025-01-20 00:00:00', '2025-02-28 00:00:00', '0', '2025-01-20 14:47:57', '2025-04-23 21:29:30', '1639458123460681730', 'lijx', 'system');

-- ----------------------------
-- Table structure for sys_tenant_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant_menu`;
CREATE TABLE `sys_tenant_menu`  (
                                    `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
                                    `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户ID',
                                    `menu_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单ID',
                                    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                    `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户分配菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_tenant_menu
-- ----------------------------
INSERT INTO `sys_tenant_menu` VALUES ('1931893893318578177', '1931893888604180482', '1915420456041758721', '2025-06-09 09:59:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893894035804162', '1931893888604180482', '1928823312304205825', '2025-06-09 09:59:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893894740447234', '1931893888604180482', '1928823711622918145', '2025-06-09 09:59:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893895520587778', '1931893888604180482', '1531446010039705602', '2025-06-09 09:59:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893896237813762', '1931893888604180482', '1539129183310196738', '2025-06-09 09:59:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893896938262530', '1931893888604180482', '1547111164111253505', '2025-06-09 09:59:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893897726791681', '1931893888604180482', '1915420405852717058', '2025-06-09 09:59:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893898435629057', '1931893888604180482', '1670725580288479233', '2025-06-09 09:59:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893899148660737', '1931893888604180482', '1908877054320013313', '2025-06-09 09:59:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893899861692418', '1931893888604180482', '1925925897117028353', '2025-06-09 09:59:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893900578918401', '1931893888604180482', '1908430136292806657', '2025-06-09 09:59:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893901359058946', '1931893888604180482', '1908432326675841025', '2025-06-09 09:59:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893902013370370', '1931893888604180482', '1605129783281369089', '2025-06-09 09:59:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893902726402049', '1931893888604180482', '1899101326753800193', '2025-06-09 09:59:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893903498153985', '1931893888604180482', '1792432863812636673', '2025-06-09 09:59:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893904219574274', '1931893888604180482', '1915402364934918145', '2025-06-09 09:59:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893904940994562', '1931893888604180482', '1899100257789288450', '2025-06-09 09:59:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893905586917377', '1931893888604180482', '1531528760525074434', '2025-06-09 09:59:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893906362863618', '1931893888604180482', '1788375917437919234', '2025-06-09 09:59:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893907084283905', '1931893888604180482', '1899100516183580674', '2025-06-09 09:59:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893907797315586', '1931893888604180482', '1493587910721695745', '2025-06-09 09:59:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893908501958657', '1931893888604180482', '1527836010248204290', '2025-06-09 09:59:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893909210796034', '1931893888604180482', '1899100147609116674', '2025-06-09 09:59:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893929540587521', '1931893888604180482', '1537048076783616001', '2025-06-09 09:59:40', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893930127790081', '1931893888604180482', '1590700851537625090', '2025-06-09 09:59:40', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893930840821762', '1931893888604180482', '1531846893999169537', '2025-06-09 09:59:41', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893931688071170', '1931893888604180482', '1527471918694014977', '2025-06-09 09:59:41', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893951913005058', '1931893888604180482', '1600478467569381377', '2025-06-09 09:59:46', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893952579899394', '1931893888604180482', '1527471918337499138', '2025-06-09 09:59:46', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893953271959553', '1931893888604180482', '1927383271732301826', '2025-06-09 09:59:46', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893954022739970', '1931893888604180482', '1531529196871102466', '2025-06-09 09:59:46', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893974209925122', '1931893888604180482', '1788196420663123969', '2025-06-09 09:59:51', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893974901985282', '1931893888604180482', '1491969633293729794', '2025-06-09 09:59:51', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893975623405570', '1931893888604180482', '1493587911057240066', '2025-06-09 09:59:51', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893995802202113', '1931893888604180482', '1928460262355152898', '2025-06-09 09:59:56', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893996569759745', '1931893888604180482', '1927019068022489089', '2025-06-09 09:59:56', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893997211488257', '1931893888604180482', '1917467189217087489', '2025-06-09 09:59:56', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893997924519938', '1931893888604180482', '1919376575265148930', '2025-06-09 09:59:57', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893998675300353', '1931893888604180482', '1925914979066855425', '2025-06-09 09:59:57', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931893999438663682', '1931893888604180482', '1928823461483016193', '2025-06-09 09:59:57', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894000101363714', '1931893888604180482', '1496327861712465921', '2025-06-09 09:59:57', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894000818589697', '1931893888604180482', '1788375557960900610', '2025-06-09 09:59:57', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894001531621377', '1931893888604180482', '1532620931885862913', '2025-06-09 09:59:57', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894002294984705', '1931893888604180482', '1915420350722785281', '2025-06-09 09:59:58', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894002940907521', '1931893888604180482', '999999999999', '2025-06-09 09:59:58', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894003683299329', '1931893888604180482', '1532634358100430850', '2025-06-09 09:59:58', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894004429885442', '1931893888604180482', '1496327553334652930', '2025-06-09 09:59:58', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894005189054465', '1931893888604180482', '1914609715984224257', '2025-06-09 09:59:58', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894005834977281', '1931893888604180482', '1585192140589182977', '2025-06-09 09:59:59', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894006556397570', '1931893888604180482', '1494216988311183361', '2025-06-09 09:59:59', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894007269429249', '1931893888604180482', '1927376759282610177', '2025-06-09 09:59:59', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894008024403969', '1931893888604180482', '1904183663623577602', '2025-06-09 09:59:59', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894008678715393', '1931893888604180482', '1792433334379991041', '2025-06-09 09:59:59', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894009391747073', '1931893888604180482', '1871099260888489985', '2025-06-09 09:59:59', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894010121555969', '1931893888604180482', '1928823260638769153', '2025-06-09 10:00:00', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894010868142081', '1931893888604180482', '1531446009779658754', '2025-06-09 10:00:00', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894011518259201', '1931893888604180482', '1908497473855483906', '2025-06-09 10:00:00', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894012252262401', '1931893888604180482', '1494192758974627842', '2025-06-09 10:00:00', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894012973682689', '1931893888604180482', '1788196662338920449', '2025-06-09 10:00:00', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894013724463106', '1931893888604180482', '1928823667876327426', '2025-06-09 10:00:00', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894014370385922', '1931893888604180482', '1867574701077946369', '2025-06-09 10:00:01', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894015083417601', '1931893888604180482', '1670725673255227394', '2025-06-09 10:00:01', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894015809032193', '1931893888604180482', '1864964797636804609', '2025-06-09 10:00:01', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894016572395521', '1931893888604180482', '1496327554433560577', '2025-06-09 10:00:01', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894017214124034', '1931893888604180482', '1867574920268079105', '2025-06-09 10:00:01', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894017935544321', '1931893888604180482', '1904183013204467714', '2025-06-09 10:00:01', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894018652770305', '1931893888604180482', '1532620395988029442', '2025-06-09 10:00:02', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894019428716546', '1931893888604180482', '1493587910381957121', '2025-06-09 10:00:02', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894020078833666', '1931893888604180482', '1919729610357121026', '2025-06-09 10:00:02', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894020800253953', '1931893888604180482', '1493766204259942401', '2025-06-09 10:00:02', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894021517479938', '1931893888604180482', '1927021366836625410', '2025-06-09 10:00:02', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894022276648961', '1931893888604180482', '1925914794987241473', '2025-06-09 10:00:02', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894022935154690', '1931893888604180482', '1494514119857180674', '2025-06-09 10:00:03', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894023677546497', '1931893888604180482', '1904181618258649090', '2025-06-09 10:00:03', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894024394772482', '1931893888604180482', '1906362786735980545', '2025-06-09 10:00:03', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894025158135809', '1931893888604180482', '1915420507648475137', '2025-06-09 10:00:03', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894025799864322', '1931893888604180482', '1928630353386438658', '2025-06-09 10:00:03', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894026575810561', '1931893888604180482', '1532634435510505473', '2025-06-09 10:00:03', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894027427254274', '1931893888604180482', '1493884379760701442', '2025-06-09 10:00:04', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894028337418241', '1931893888604180482', '1920115698355605506', '2025-06-09 10:00:04', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894029042061314', '1931893888604180482', '1532621007333003266', '2025-06-09 10:00:04', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894029813813249', '1931893888604180482', '1612684125251031042', '2025-06-09 10:00:04', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894030568787969', '1931893888604180482', '1521496866882236418', '2025-06-09 10:00:04', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894031369900033', '1931893888604180482', '1494192760010620930', '2025-06-09 10:00:05', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894032087126018', '1931893888604180482', '1927383173250043906', '2025-06-09 10:00:05', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894032816934914', '1931893888604180482', '1496327552973942785', '2025-06-09 10:00:05', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894033555132418', '1931893888604180482', '1928789844748812290', '2025-06-09 10:00:05', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894034322690049', '1931893888604180482', '1919376628151128065', '2025-06-09 10:00:05', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894034997972994', '1931893888604180482', '1914609608735870978', '2025-06-09 10:00:05', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894035786502145', '1931893888604180482', '1928823403488374786', '2025-06-09 10:00:06', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894036520505346', '1931893888604180482', '1491756888363307009', '2025-06-09 10:00:06', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894037434863617', '1931893888604180482', '1493578977978249218', '2025-06-09 10:00:06', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894038194032642', '1931893888604180482', '1494192759318560770', '2025-06-09 10:00:06', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894039024504833', '1931893888604180482', '1919330860673437697', '2025-06-09 10:00:06', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894039766896641', '1931893888604180482', '1899100200448958466', '2025-06-09 10:00:07', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894040563814402', '1931893888604180482', '1864965367609163777', '2025-06-09 10:00:07', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894041276846082', '1931893888604180482', '1904182180618346498', '2025-06-09 10:00:07', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894042023432194', '1931893888604180482', '1527835787455164418', '2025-06-09 10:00:07', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894042782601218', '1931893888604180482', '1496012487833960450', '2025-06-09 10:00:07', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894043537575937', '1931893888604180482', '1532621196013768706', '2025-06-09 10:00:07', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894044217053185', '1931893888604180482', '1927383317672513537', '2025-06-09 10:00:08', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894044946862082', '1931893888604180482', '1788196733688225793', '2025-06-09 10:00:08', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894045668282369', '1931893888604180482', '1927021317796823041', '2025-06-09 10:00:08', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894046456811521', '1931893888604180482', '1532621107589451778', '2025-06-09 10:00:08', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894047106928642', '1931893888604180482', '1914609770107523073', '2025-06-09 10:00:08', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894047849320450', '1931893888604180482', '1914609547306094594', '2025-06-09 10:00:09', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894048574935041', '1931893888604180482', '1899099320962129922', '2025-06-09 10:00:09', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894049334104065', '1931893888604180482', '1788375651716177922', '2025-06-09 10:00:09', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894049984221185', '1931893888604180482', '1671121808444674049', '2025-06-09 10:00:09', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894050697252866', '1931893888604180482', '1788196790093225986', '2025-06-09 10:00:09', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894051410284545', '1931893888604180482', '1928630268875407361', '2025-06-09 10:00:09', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894052165259265', '1931893888604180482', '1535633963410956289', '2025-06-09 10:00:10', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894052815376386', '1931893888604180482', '1491973212968632322', '2025-06-09 10:00:10', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894053524213761', '1931893888604180482', '1915402440830849026', '2025-06-09 10:00:10', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894054241439746', '1931893888604180482', '1670725150502342658', '2025-06-09 10:00:10', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894054996414465', '1931893888604180482', '1906362572637732866', '2025-06-09 10:00:10', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894055654920194', '1931893888604180482', '1915402558879535105', '2025-06-09 10:00:10', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894056367951874', '1931893888604180482', '1792433241006395393', '2025-06-09 10:00:11', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894057089372161', '1931893888604180482', '1908497530839298049', '2025-06-09 10:00:11', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894057844346881', '1931893888604180482', '1899099806679310337', '2025-06-09 10:00:11', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894058498658306', '1931893888604180482', '1494192759662493698', '2025-06-09 10:00:11', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894059215884290', '1931893888604180482', '1493578978313793537', '2025-06-09 10:00:11', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894059928915969', '1931893888604180482', '1779386604402573314', '2025-06-09 10:00:11', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894060683890689', '1931893888604180482', '1867575179505426433', '2025-06-09 10:00:12', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894061325619202', '1931893888604180482', '1531882841361915906', '2025-06-09 10:00:12', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894062047039489', '1931893888604180482', '1904182493270155265', '2025-06-09 10:00:12', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894062755876866', '1931893888604180482', '1497468294740176898', '2025-06-09 10:00:12', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894063519240194', '1931893888604180482', '1527471919386075137', '2025-06-09 10:00:12', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894064165163010', '1931893888604180482', '1531536866638311426', '2025-06-09 10:00:12', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894064878194690', '1931893888604180482', '1600785452746854401', '2025-06-09 10:00:13', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894065587032066', '1931893888604180482', '1612481861469302786', '2025-06-09 10:00:13', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894066337812482', '1931893888604180482', '1927021148942532609', '2025-06-09 10:00:13', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894066992123905', '1931893888604180482', '1494153373696704514', '2025-06-09 10:00:13', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894067696766978', '1931893888604180482', '1491690996678021121', '2025-06-09 10:00:13', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894068409798657', '1931893888604180482', '1925809318075088898', '2025-06-09 10:00:13', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894069168967681', '1931893888604180482', '1928823358349275138', '2025-06-09 10:00:14', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894069827473410', '1931893888604180482', '1494153374053220354', '2025-06-09 10:00:14', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894070527922178', '1931893888604180482', '1600478029277196290', '2025-06-09 10:00:14', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894071236759554', '1931893888604180482', '1929219051333292034', '2025-06-09 10:00:14', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894072004317185', '1931893888604180482', '1543116535774879745', '2025-06-09 10:00:14', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894072658628609', '1931893888604180482', '1527947365856878593', '2025-06-09 10:00:14', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894073384243201', '1931893888604180482', '1927019859089195010', '2025-06-09 10:00:15', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894074093080577', '1931893888604180482', '1494153374401347585', '2025-06-09 10:00:15', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894074873221121', '1931893888604180482', '1494192758630694913', '2025-06-09 10:00:15', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894075586252802', '1931893888604180482', '1919330303376265217', '2025-06-09 10:00:15', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894076362199042', '1931893888604180482', '1493596733666652162', '2025-06-09 10:00:15', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894077071036417', '1931893888604180482', '1494217081558949890', '2025-06-09 10:00:15', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894077851176962', '1931893888604180482', '1927021215334170626', '2025-06-09 10:00:16', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894078522265602', '1931893888604180482', '1906363079829749762', '2025-06-09 10:00:16', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894079273046018', '1931893888604180482', '1792433410624049154', '2025-06-09 10:00:16', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894080011243521', '1931893888604180482', '1600478336006647809', '2025-06-09 10:00:16', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894080766218242', '1931893888604180482', '1908432156768780290', '2025-06-09 10:00:16', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894081458278402', '1931893888604180482', '1496327861351755778', '2025-06-09 10:00:17', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894082200670210', '1931893888604180482', '1788375299184926722', '2025-06-09 10:00:17', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894082922090498', '1931893888604180482', '1496327861003628545', '2025-06-09 10:00:17', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894083702231041', '1931893888604180482', '1788375752018763778', '2025-06-09 10:00:17', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894084348153857', '1931893888604180482', '1867575019589197825', '2025-06-09 10:00:17', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894085082157057', '1931893888604180482', '1496327802522447873', '2025-06-09 10:00:17', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894085790994434', '1931893888604180482', '1779386487675092994', '2025-06-09 10:00:18', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894086562746370', '1931893888604180482', '1494217081206628354', '2025-06-09 10:00:18', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894087229640706', '1931893888604180482', '1547110946242326529', '2025-06-09 10:00:18', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894087951060993', '1931893888604180482', '1494217080162246658', '2025-06-09 10:00:18', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894088701841410', '1931893888604180482', '1908432418606596098', '2025-06-09 10:00:18', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894089477787650', '1931893888604180482', '1915402225524641793', '2025-06-09 10:00:18', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894090140487682', '1931893888604180482', '1917461111616065537', '2025-06-09 10:00:19', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894090857713666', '1931893888604180482', '1899100333685219330', '2025-06-09 10:00:19', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894091558162433', '1931893888604180482', '1904182907902271489', '2025-06-09 10:00:19', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894092329914369', '1931893888604180482', '1928790012067987457', '2025-06-09 10:00:19', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894092963254274', '1931893888604180482', '1527836010944458754', '2025-06-09 10:00:19', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894093714034689', '1931893888604180482', '1792433080825925634', '2025-06-09 10:00:19', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894094435454978', '1931893888604180482', '1908432094680498178', '2025-06-09 10:00:20', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894095198818305', '1931893888604180482', '1494217080858501121', '2025-06-09 10:00:20', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894095878295554', '1931893888604180482', '1670732985965531137', '2025-06-09 10:00:20', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894096612298754', '1931893888604180482', '1585192004932808706', '2025-06-09 10:00:20', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894097337913346', '1931893888604180482', '1904183083324841986', '2025-06-09 10:00:20', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894098105470978', '1931893888604180482', '1919330561216909314', '2025-06-09 10:00:21', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894098789142530', '1931893888604180482', '1532634687902748674', '2025-06-09 10:00:21', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894099527340034', '1931893888604180482', '10001', '2025-06-09 10:00:21', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894100257148930', '1931893888604180482', '1788196890592944129', '2025-06-09 10:00:21', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894101049872386', '1931893888604180482', '1915402317111463938', '2025-06-09 10:00:21', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894101716766721', '1931893888604180482', '1915420286516379649', '2025-06-09 10:00:21', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894102454964225', '1931893888604180482', '1531536545572728833', '2025-06-09 10:00:22', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894103167995905', '1931893888604180482', '1605130091042619393', '2025-06-09 10:00:22', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894103931359234', '1931893888604180482', '1904182708047880193', '2025-06-09 10:00:22', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894104636002306', '1931893888604180482', '1915034838212198402', '2025-06-09 10:00:22', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894105365811201', '1931893888604180482', '1927383226031165442', '2025-06-09 10:00:22', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894106095620098', '1931893888604180482', '1494153373352771586', '2025-06-09 10:00:22', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894106875760642', '1931893888604180482', '1537066557067395074', '2025-06-09 10:00:23', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894107530072065', '1931893888604180482', '1531537172243689474', '2025-06-09 10:00:23', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894108310212610', '1931893888604180482', '1491684226094198786', '2025-06-09 10:00:23', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894109040021506', '1931893888604180482', '1537066492991012865', '2025-06-09 10:00:23', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894109799190530', '1931893888604180482', '1925914842571620353', '2025-06-09 10:00:23', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894110440919042', '1931893888604180482', '1904183950442668034', '2025-06-09 10:00:23', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894111158145025', '1931893888604180482', '1864965305650905090', '2025-06-09 10:00:24', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894111883759617', '1931893888604180482', '1532634517374930946', '2025-06-09 10:00:24', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894112668094465', '1931893888604180482', '1615718738766741505', '2025-06-09 10:00:24', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894113309822977', '1931893888604180482', '1928823581008097281', '2025-06-09 10:00:24', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894114027048962', '1931893888604180482', '1912035971633811458', '2025-06-09 10:00:24', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894114744274946', '1931893888604180482', '1928823538368802817', '2025-06-09 10:00:24', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894115503443970', '1931893888604180482', '1491948958826921986', '2025-06-09 10:00:25', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894116153561090', '1931893888604180482', '1531446009913876482', '2025-06-09 10:00:25', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894116879175681', '1931893888604180482', '1670722888228982785', '2025-06-09 10:00:25', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894117600595969', '1931893888604180482', '1531537289042472961', '2025-06-09 10:00:25', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894118355570690', '1931893888604180482', '1925795369212493826', '2025-06-09 10:00:25', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894119001493505', '1931893888604180482', '1585192489970511873', '2025-06-09 10:00:25', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894119731302402', '1931893888604180482', '1928789932476874754', '2025-06-09 10:00:26', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894120452722690', '1931893888604180482', '1615718811491778562', '2025-06-09 10:00:26', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894121220280321', '1931893888604180482', '1927019806207410177', '2025-06-09 10:00:26', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894121870397442', '1931893888604180482', '1919320902775070721', '2025-06-09 10:00:26', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894122591817730', '1931893888604180482', '1904182961836826626', '2025-06-09 10:00:26', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894123296460802', '1931893888604180482', '1493884088730529793', '2025-06-09 10:00:27', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894124055629826', '1931893888604180482', '1917467140303114241', '2025-06-09 10:00:27', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894124705746945', '1931893888604180482', '1908497640419684354', '2025-06-09 10:00:27', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894125422972930', '1931893888604180482', '1670732624412332034', '2025-06-09 10:00:27', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894126127616001', '1931893888604180482', '1792433529037639682', '2025-06-09 10:00:27', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894126886785025', '1931893888604180482', '1612683975455657985', '2025-06-09 10:00:27', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894127532707841', '1931893888604180482', '1496327483721789441', '2025-06-09 10:00:28', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894128254128130', '1931893888604180482', '1919330498851803138', '2025-06-09 10:00:28', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894128962965506', '1931893888604180482', '1670724676428550146', '2025-06-09 10:00:28', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894129751494657', '1931893888604180482', '1927019998386225153', '2025-06-09 10:00:28', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894130393223170', '1931893888604180482', '1867574970650058754', '2025-06-09 10:00:28', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894131123032065', '1931893888604180482', '1527471479688798209', '2025-06-09 10:00:28', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894131840258050', '1931893888604180482', '1779386898750439425', '2025-06-09 10:00:29', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894132599427073', '1931893888604180482', '1925914891900829698', '2025-06-09 10:00:29', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894133270515713', '1931893888604180482', '1585916172586397697', '2025-06-09 10:00:29', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894134046461954', '1931893888604180482', '1927019907625680898', '2025-06-09 10:00:29', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894134822408194', '1931893888604180482', '1899100759243497474', '2025-06-09 10:00:29', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894135598354434', '1931893888604180482', '1899101135661309954', '2025-06-09 10:00:29', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894136240082946', '1931893888604180482', '1496327862068981762', '2025-06-09 10:00:30', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894136999251970', '1931893888604180482', '1536174316656533505', '2025-06-09 10:00:30', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894137733255170', '1931893888604180482', '1906362904411373570', '2025-06-09 10:00:30', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894138505007106', '1931893888604180482', '1491949315883827201', '2025-06-09 10:00:30', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894139155124226', '1931893888604180482', '1779386782480138242', '2025-06-09 10:00:30', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894139884933122', '1931893888604180482', '1927019358259937281', '2025-06-09 10:00:30', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894140589576194', '1931893888604180482', '1899101388426846210', '2025-06-09 10:00:31', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894141344550913', '1931893888604180482', '1494151991157673985', '2025-06-09 10:00:31', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894142003056642', '1931893888604180482', '1908497193025859585', '2025-06-09 10:00:31', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894142762225666', '1931893888604180482', '1927019952529899521', '2025-06-09 10:00:31', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894143517200385', '1931893888604180482', '1868158971727056897', '2025-06-09 10:00:31', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894144280563713', '1931893888604180482', '1904182844975128577', '2025-06-09 10:00:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894144934875137', '1931893888604180482', '1917466901169065986', '2025-06-09 10:00:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894145685655553', '1931893888604180482', '1494153372996255746', '2025-06-09 10:00:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894146411270145', '1931893888604180482', '1904182650648829953', '2025-06-09 10:00:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894147170439170', '1931893888604180482', '1670722611195203586', '2025-06-09 10:00:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894147837333505', '1931893888604180482', '1904183545772023810', '2025-06-09 10:00:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894148571336705', '1931893888604180482', '1494217080510373890', '2025-06-09 10:00:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894149317922818', '1931893888604180482', '1918278074695323650', '2025-06-09 10:00:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894150102257665', '1931893888604180482', '1928823624427532289', '2025-06-09 10:00:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894150756569089', '1931893888604180482', '1927383125309149185', '2025-06-09 10:00:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894151498960897', '1931893888604180482', '1532620101065543681', '2025-06-09 10:00:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894152211992578', '1931893888604180482', '1681556362827534338', '2025-06-09 10:00:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894153008910337', '1931893888604180482', '1531446010169729026', '2025-06-09 10:00:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894153659027458', '1931893888604180482', '1532620840659750914', '2025-06-09 10:00:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894154367864833', '1931893888604180482', '1615718665584525314', '2025-06-09 10:00:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894155093479426', '1931893888604180482', '1904182116281917442', '2025-06-09 10:00:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894155898785793', '1931893888604180482', '1927021411304636418', '2025-06-09 10:00:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894156595040257', '1931893888604180482', '1908497587646951425', '2025-06-09 10:00:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894157362597890', '1931893888604180482', '1915418500774674433', '2025-06-09 10:00:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894158084018178', '1931893888604180482', '1904182762854850562', '2025-06-09 10:00:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894158859964418', '1931893888604180482', '1526179827628048385', '2025-06-09 10:00:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894159510081538', '1931893888604180482', '1605129651156598786', '2025-06-09 10:00:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894160227307522', '1931893888604180482', '1864965419459149826', '2025-06-09 10:00:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894160952922114', '1931893888604180482', '1914609394323050498', '2025-06-09 10:00:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894161720479746', '1931893888604180482', '1925807685068963841', '2025-06-09 10:00:36', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894162395762689', '1931893888604180482', '1788375826039840770', '2025-06-09 10:00:36', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894163125571586', '1931893888604180482', '1928823102488342529', '2025-06-09 10:00:36', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894163880546306', '1931893888604180482', '1867574302526791682', '2025-06-09 10:00:36', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894164660686849', '1931893888604180482', '1908432250347896833', '2025-06-09 10:00:36', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894165319192578', '1931893888604180482', '1920115822607667201', '2025-06-09 10:00:37', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894166065778690', '1931893888604180482', '1928630130509512705', '2025-06-09 10:00:37', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894166812364801', '1931893888604180482', '1531446009649635329', '2025-06-09 10:00:37', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894167600893953', '1931893888604180482', '1928822847139115009', '2025-06-09 10:00:37', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894168238428162', '1931893888604180482', '1914609663005970434', '2025-06-09 10:00:37', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894169140203522', '1931893888604180482', '1496327860647112706', '2025-06-09 10:00:37', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894169857429505', '1931893888604180482', '1527471919042142209', '2025-06-09 10:00:38', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894170612404225', '1931893888604180482', '1615718593878704130', '2025-06-09 10:00:38', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894171300270081', '1931893888604180482', '1600477837933047810', '2025-06-09 10:00:38', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894172013301762', '1931893888604180482', '1919330723704246273', '2025-06-09 10:00:38', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894172730527746', '1931893888604180482', '1585192568882147330', '2025-06-09 10:00:38', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894173493891074', '1931893888604180482', '1917466958165463041', '2025-06-09 10:00:38', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894174139813890', '1931893888604180482', '1927021260133531650', '2025-06-09 10:00:39', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894174861234177', '1931893888604180482', '1496327553699557377', '2025-06-09 10:00:39', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894175574265857', '1931893888604180482', '1864965206908600322', '2025-06-09 10:00:39', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894176325046274', '1931893888604180482', '1612684389953556481', '2025-06-09 10:00:39', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894176975163394', '1931893888604180482', '1915402499827929090', '2025-06-09 10:00:39', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894177704972290', '1931893888604180482', '1899101198156439554', '2025-06-09 10:00:39', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894178413809665', '1931893888604180482', '1904183774843936770', '2025-06-09 10:00:40', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894179168784386', '1931893888604180482', '1867575119333941250', '2025-06-09 10:00:40', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894179831484418', '1931893888604180482', '1917432922911051778', '2025-06-09 10:00:40', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894180544516097', '1931893888604180482', '1493578977630121986', '2025-06-09 10:00:40', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894181257547777', '1931893888604180482', '1493836209106268161', '2025-06-09 10:00:40', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894182008328194', '1931893888604180482', '1919330791362564097', '2025-06-09 10:00:41', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894182658445314', '1931893888604180482', '1585191589231144962', '2025-06-09 10:00:41', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894183371476994', '1931893888604180482', '1496327554068656130', '2025-06-09 10:00:41', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894184101285890', '1931893888604180482', '1670723480636674049', '2025-06-09 10:00:41', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894184935952385', '1931893888604180482', '1600478397226708994', '2025-06-09 10:00:41', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894185690927105', '1931893888604180482', '1527471918001954818', '2025-06-09 10:00:41', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894186437513217', '1931893888604180482', '1928629828444127233', '2025-06-09 10:00:42', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894187150544897', '1931893888604180482', '1531536449854517250', '2025-06-09 10:00:42', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894187913908225', '1931893888604180482', '1532634586568364034', '2025-06-09 10:00:42', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894188559831042', '1931893888604180482', '1585192296575348738', '2025-06-09 10:00:42', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894189281251330', '1931893888604180482', '1491757020773289986', '2025-06-09 10:00:42', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894190061391873', '1931893888604180482', '1493578978649337858', '2025-06-09 10:00:42', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894190824755202', '1931893888604180482', '1792433157640409089', '2025-06-09 10:00:43', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894191483260929', '1931893888604180482', '1919330975211491329', '2025-06-09 10:00:43', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894192196292609', '1931893888604180482', '1493836280589791233', '2025-06-09 10:00:43', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894192963850242', '1931893888604180482', '1493841029473042434', '2025-06-09 10:00:43', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894193773350914', '1931893888604180482', '1493836091183411202', '2025-06-09 10:00:43', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894194448633858', '1931893888604180482', '1491752531735490561', '2025-06-09 10:00:43', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894195174248450', '1931893888604180482', '1585191363078467586', '2025-06-09 10:00:44', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894195895668737', '1931893888604180482', '1899101251365380098', '2025-06-09 10:00:44', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894196646449154', '1931893888604180482', '1536174413406543874', '2025-06-09 10:00:44', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894197317537793', '1931893888604180482', '1788196840919801858', '2025-06-09 10:00:44', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894198047346689', '1931893888604180482', '1904183832930852866', '2025-06-09 10:00:44', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894198772961282', '1931893888604180482', '1491757382771085313', '2025-06-09 10:00:45', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894199532130305', '1931893888604180482', '1585916026725281793', '2025-06-09 10:00:45', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894200194830338', '1931893888604180482', '1531536746446336001', '2025-06-09 10:00:45', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894200928833537', '1931893888604180482', '1864965476786896897', '2025-06-09 10:00:45', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894201637670914', '1931893888604180482', '1527835963171336193', '2025-06-09 10:00:45', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894202413617154', '1931893888604180482', '1531445896986435585', '2025-06-09 10:00:45', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1931894203046957058', '1931893888604180482', '1583296344638287874', '2025-06-09 10:00:46', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570360425488386', '1590229800633634816', '1779386898750439425', '2025-06-14 01:01:13', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570361117548546', '1590229800633634816', '1527471479688798209', '2025-06-14 01:01:13', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570361717334018', '1590229800633634816', '1527471918001954818', '2025-06-14 01:01:13', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570362455531522', '1590229800633634816', '1527471918337499138', '2025-06-14 01:01:13', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570363063705601', '1590229800633634816', '1527471918694014977', '2025-06-14 01:01:13', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570363697045506', '1590229800633634816', '1527471919042142209', '2025-06-14 01:01:13', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570364305219586', '1590229800633634816', '1527471919386075137', '2025-06-14 01:01:14', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570365026639874', '1590229800633634816', '1920115698355605506', '2025-06-14 01:01:14', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570365987135489', '1590229800633634816', '1920115822607667201', '2025-06-14 01:01:14', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570366599503874', '1590229800633634816', '1908430136292806657', '2025-06-14 01:01:14', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570367203483650', '1590229800633634816', '1908432094680498178', '2025-06-14 01:01:14', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570367916515330', '1590229800633634816', '1908432156768780290', '2025-06-14 01:01:14', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570368533078017', '1590229800633634816', '1908432250347896833', '2025-06-14 01:01:15', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570369153835010', '1590229800633634816', '1908432326675841025', '2025-06-14 01:01:15', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570369757814785', '1590229800633634816', '1908432418606596098', '2025-06-14 01:01:15', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570370475040769', '1590229800633634816', '1908497193025859585', '2025-06-14 01:01:15', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570371104186370', '1590229800633634816', '1908497473855483906', '2025-06-14 01:01:15', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570371729137666', '1590229800633634816', '1908497530839298049', '2025-06-14 01:01:15', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570372337311745', '1590229800633634816', '1908497587646951425', '2025-06-14 01:01:15', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570372945485826', '1590229800633634816', '1908497640419684354', '2025-06-14 01:01:16', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570373553659906', '1590229800633634816', '1864964797636804609', '2025-06-14 01:01:16', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570374170222594', '1590229800633634816', '1864965206908600322', '2025-06-14 01:01:16', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570374761619458', '1590229800633634816', '1864965305650905090', '2025-06-14 01:01:16', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570375378182146', '1590229800633634816', '1864965367609163777', '2025-06-14 01:01:16', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570375986356226', '1590229800633634816', '1864965419459149826', '2025-06-14 01:01:16', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570376619696130', '1590229800633634816', '1864965476786896897', '2025-06-14 01:01:16', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570377219481602', '1590229800633634816', '1904181618258649090', '2025-06-14 01:01:17', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570377840238594', '1590229800633634816', '1904182116281917442', '2025-06-14 01:01:17', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570378440024065', '1590229800633634816', '1904182180618346498', '2025-06-14 01:01:17', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570379064975362', '1590229800633634816', '1904182650648829953', '2025-06-14 01:01:17', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570379660566529', '1590229800633634816', '1904182708047880193', '2025-06-14 01:01:17', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570380285517826', '1590229800633634816', '1904182762854850562', '2025-06-14 01:01:17', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570380889497601', '1590229800633634816', '1904183774843936770', '2025-06-14 01:01:17', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570381501865986', '1590229800633634816', '1904183950442668034', '2025-06-14 01:01:18', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570382097457154', '1590229800633634816', '1904183545772023810', '2025-06-14 01:01:18', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570382701436930', '1590229800633634816', '1904183663623577602', '2025-06-14 01:01:18', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570383305416706', '1590229800633634816', '1904183832930852866', '2025-06-14 01:01:18', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570383934562305', '1590229800633634816', '1904182493270155265', '2025-06-14 01:01:18', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570384521764866', '1590229800633634816', '1904182844975128577', '2025-06-14 01:01:18', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570385138327553', '1590229800633634816', '1904182907902271489', '2025-06-14 01:01:18', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570385738113025', '1590229800633634816', '1904182961836826626', '2025-06-14 01:01:19', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570386358870017', '1590229800633634816', '1904183013204467714', '2025-06-14 01:01:19', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570386946072577', '1590229800633634816', '1904183083324841986', '2025-06-14 01:01:19', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570387562635265', '1590229800633634816', '1906362572637732866', '2025-06-14 01:01:19', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570388162420738', '1590229800633634816', '1906362786735980545', '2025-06-14 01:01:19', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570388783177729', '1590229800633634816', '1906362904411373570', '2025-06-14 01:01:19', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570389378768898', '1590229800633634816', '1906363079829749762', '2025-06-14 01:01:19', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570389995331585', '1590229800633634816', '1915034838212198402', '2025-06-14 01:01:20', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570390599311362', '1590229800633634816', '1779386782480138242', '2025-06-14 01:01:20', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570391211679746', '1590229800633634816', '1788196420663123969', '2025-06-14 01:01:20', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570391836631042', '1590229800633634816', '1788196662338920449', '2025-06-14 01:01:20', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570392444805122', '1590229800633634816', '1788196733688225793', '2025-06-14 01:01:20', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570393069756418', '1590229800633634816', '1788196790093225986', '2025-06-14 01:01:20', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570393703096321', '1590229800633634816', '1788196840919801858', '2025-06-14 01:01:21', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570394302881793', '1590229800633634816', '1788196890592944129', '2025-06-14 01:01:21', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570394923638785', '1590229800633634816', '1792432863812636673', '2025-06-14 01:01:21', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570395527618562', '1590229800633634816', '1792433080825925634', '2025-06-14 01:01:21', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570396152569857', '1590229800633634816', '1792433157640409089', '2025-06-14 01:01:21', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570396756549634', '1590229800633634816', '1792433241006395393', '2025-06-14 01:01:21', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570397364723714', '1590229800633634816', '1792433334379991041', '2025-06-14 01:01:21', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570397981286402', '1590229800633634816', '1792433410624049154', '2025-06-14 01:01:22', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570398610432002', '1590229800633634816', '1792433529037639682', '2025-06-14 01:01:22', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570399214411778', '1590229800633634816', '1912035971633811458', '2025-06-14 01:01:22', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570399814197249', '1590229800633634816', '1919330303376265217', '2025-06-14 01:01:22', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570400434954242', '1590229800633634816', '1919376575265148930', '2025-06-14 01:01:22', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570401051516929', '1590229800633634816', '1919376628151128065', '2025-06-14 01:01:22', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570401655496706', '1590229800633634816', '1914609394323050498', '2025-06-14 01:01:22', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570402267865090', '1590229800633634816', '1914609547306094594', '2025-06-14 01:01:23', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570402871844865', '1590229800633634816', '1914609608735870978', '2025-06-14 01:01:23', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570403500990466', '1590229800633634816', '1914609663005970434', '2025-06-14 01:01:23', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570404125941762', '1590229800633634816', '1914609715984224257', '2025-06-14 01:01:23', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570404742504450', '1590229800633634816', '1914609770107523073', '2025-06-14 01:01:23', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570405350678529', '1590229800633634816', '1915418500774674433', '2025-06-14 01:01:23', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570406000795649', '1590229800633634816', '1915420286516379649', '2025-06-14 01:01:23', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570406625746946', '1590229800633634816', '1915420350722785281', '2025-06-14 01:01:24', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570407250698242', '1590229800633634816', '1915420405852717058', '2025-06-14 01:01:24', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570407871455233', '1590229800633634816', '1915420456041758721', '2025-06-14 01:01:24', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570408488017922', '1590229800633634816', '1915420507648475137', '2025-06-14 01:01:24', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570409091997698', '1590229800633634816', '1919320902775070721', '2025-06-14 01:01:24', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570409716948994', '1590229800633634816', '1919330498851803138', '2025-06-14 01:01:24', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570410325123074', '1590229800633634816', '1919330561216909314', '2025-06-14 01:01:24', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570410945880065', '1590229800633634816', '1919330723704246273', '2025-06-14 01:01:25', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570411541471233', '1590229800633634816', '1919330791362564097', '2025-06-14 01:01:25', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570412158033921', '1590229800633634816', '1919330860673437697', '2025-06-14 01:01:25', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570412736847874', '1590229800633634816', '1919330975211491329', '2025-06-14 01:01:25', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570413382770690', '1590229800633634816', '1527835787455164418', '2025-06-14 01:01:25', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570413999333377', '1590229800633634816', '1908877054320013313', '2025-06-14 01:01:25', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570414615896066', '1590229800633634816', '1929219051333292034', '2025-06-14 01:01:26', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570415228264450', '1590229800633634816', '1527835963171336193', '2025-06-14 01:01:26', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570415844827138', '1590229800633634816', '1527836010248204290', '2025-06-14 01:01:26', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570416440418305', '1590229800633634816', '1527836010944458754', '2025-06-14 01:01:26', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570417061175297', '1590229800633634816', '1600477837933047810', '2025-06-14 01:01:26', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570417660960769', '1590229800633634816', '1600478029277196290', '2025-06-14 01:01:26', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570418273329153', '1590229800633634816', '1600478336006647809', '2025-06-14 01:01:26', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570418885697538', '1590229800633634816', '1600478397226708994', '2025-06-14 01:01:27', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570419514843138', '1590229800633634816', '1600478467569381377', '2025-06-14 01:01:27', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570420118822913', '1590229800633634816', '1600785452746854401', '2025-06-14 01:01:27', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570420743774210', '1590229800633634816', '1779386487675092994', '2025-06-14 01:01:27', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570421356142593', '1590229800633634816', '1496327483721789441', '2025-06-14 01:01:27', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570421993676802', '1590229800633634816', '1496327552973942785', '2025-06-14 01:01:27', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570422601850882', '1590229800633634816', '1496327553334652930', '2025-06-14 01:01:27', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570423222607873', '1590229800633634816', '1496327553699557377', '2025-06-14 01:01:28', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570423822393346', '1590229800633634816', '1496327554068656130', '2025-06-14 01:01:28', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570424472510466', '1590229800633634816', '1496327554433560577', '2025-06-14 01:01:28', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570425076490241', '1590229800633634816', '1532620395988029442', '2025-06-14 01:01:28', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570425693052930', '1590229800633634816', '1493587910381957121', '2025-06-14 01:01:28', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570426284449794', '1590229800633634816', '1493587910721695745', '2025-06-14 01:01:28', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570426905206785', '1590229800633634816', '1493587911057240066', '2025-06-14 01:01:28', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570427504992257', '1590229800633634816', '1496012487833960450', '2025-06-14 01:01:29', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570428129943553', '1590229800633634816', '1497468294740176898', '2025-06-14 01:01:29', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570428721340417', '1590229800633634816', '1871099260888489985', '2025-06-14 01:01:29', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570429333708802', '1590229800633634816', '1532620101065543681', '2025-06-14 01:01:29', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570429937688578', '1590229800633634816', '1532620840659750914', '2025-06-14 01:01:29', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570430550056961', '1590229800633634816', '1532620931885862913', '2025-06-14 01:01:29', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570431145648129', '1590229800633634816', '1532621007333003266', '2025-06-14 01:01:29', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570431749627906', '1590229800633634816', '1532621107589451778', '2025-06-14 01:01:30', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570432370384898', '1590229800633634816', '1532621196013768706', '2025-06-14 01:01:30', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570432995336193', '1590229800633634816', '1532634358100430850', '2025-06-14 01:01:30', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570433595121665', '1590229800633634816', '1532634435510505473', '2025-06-14 01:01:30', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570434207490049', '1590229800633634816', '1532634517374930946', '2025-06-14 01:01:30', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570434811469826', '1590229800633634816', '1532634586568364034', '2025-06-14 01:01:30', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570435449004034', '1590229800633634816', '1532634687902748674', '2025-06-14 01:01:30', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570436044595202', '1590229800633634816', '1788375299184926722', '2025-06-14 01:01:31', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570436665352193', '1590229800633634816', '1788375557960900610', '2025-06-14 01:01:31', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570437277720577', '1590229800633634816', '1788375651716177922', '2025-06-14 01:01:31', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570437902671873', '1590229800633634816', '1788375752018763778', '2025-06-14 01:01:31', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570438498263042', '1590229800633634816', '1788375826039840770', '2025-06-14 01:01:31', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570439110631425', '1590229800633634816', '1788375917437919234', '2025-06-14 01:01:31', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570439739777026', '1590229800633634816', '1496327802522447873', '2025-06-14 01:01:31', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570440360534018', '1590229800633634816', '1496327860647112706', '2025-06-14 01:01:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570440977096706', '1590229800633634816', '1496327861003628545', '2025-06-14 01:01:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570441618825217', '1590229800633634816', '1496327861351755778', '2025-06-14 01:01:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570442226999297', '1590229800633634816', '1496327861712465921', '2025-06-14 01:01:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570442839367681', '1590229800633634816', '1496327862068981762', '2025-06-14 01:01:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570443434958850', '1590229800633634816', '1925807685068963841', '2025-06-14 01:01:32', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570444043132930', '1590229800633634816', '1925809318075088898', '2025-06-14 01:01:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570444642918402', '1590229800633634816', '1925914794987241473', '2025-06-14 01:01:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570445263675393', '1590229800633634816', '1925914842571620353', '2025-06-14 01:01:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570445876043777', '1590229800633634816', '1925914891900829698', '2025-06-14 01:01:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570446484217857', '1590229800633634816', '1925914979066855425', '2025-06-14 01:01:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570447104974849', '1590229800633634816', '1925925897117028353', '2025-06-14 01:01:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570447729926145', '1590229800633634816', '1521496866882236418', '2025-06-14 01:01:33', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570448321323010', '1590229800633634816', '1927376759282610177', '2025-06-14 01:01:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570448937885698', '1590229800633634816', '1927383125309149185', '2025-06-14 01:01:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570449562836993', '1590229800633634816', '1927383173250043906', '2025-06-14 01:01:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570450187788290', '1590229800633634816', '1927383226031165442', '2025-06-14 01:01:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570450821128194', '1590229800633634816', '1927383271732301826', '2025-06-14 01:01:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570451441885186', '1590229800633634816', '1927383317672513537', '2025-06-14 01:01:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570452033282049', '1590229800633634816', '1531528760525074434', '2025-06-14 01:01:34', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570452691787778', '1590229800633634816', '1531536449854517250', '2025-06-14 01:01:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570453295767554', '1590229800633634816', '1531536545572728833', '2025-06-14 01:01:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570453908135937', '1590229800633634816', '1531536746446336001', '2025-06-14 01:01:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570454507921410', '1590229800633634816', '1531536866638311426', '2025-06-14 01:01:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570455120289794', '1590229800633634816', '1535633963410956289', '2025-06-14 01:01:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570455715880962', '1590229800633634816', '1681556362827534338', '2025-06-14 01:01:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570456328249346', '1590229800633634816', '1531529196871102466', '2025-06-14 01:01:35', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570456936423426', '1590229800633634816', '1531537172243689474', '2025-06-14 01:01:36', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570457548791809', '1590229800633634816', '1531537289042472961', '2025-06-14 01:01:36', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570458135994370', '1590229800633634816', '1543116535774879745', '2025-06-14 01:01:36', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570458744168450', '1590229800633634816', '1925795369212493826', '2025-06-14 01:01:36', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570459352342530', '1590229800633634816', '1928460262355152898', '2025-06-14 01:01:36', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570459968905217', '1590229800633634816', '1928629828444127233', '2025-06-14 01:01:36', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570460593856514', '1590229800633634816', '1928630130509512705', '2025-06-14 01:01:36', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570461202030594', '1590229800633634816', '1928630268875407361', '2025-06-14 01:01:37', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570461797621761', '1590229800633634816', '1928630353386438658', '2025-06-14 01:01:37', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570462430961665', '1590229800633634816', '1915402225524641793', '2025-06-14 01:01:37', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570463026552834', '1590229800633634816', '1915402317111463938', '2025-06-14 01:01:37', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570463647309825', '1590229800633634816', '1915402364934918145', '2025-06-14 01:01:37', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570464242900994', '1590229800633634816', '1915402440830849026', '2025-06-14 01:01:37', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570464880435202', '1590229800633634816', '1915402499827929090', '2025-06-14 01:01:37', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570465463443457', '1590229800633634816', '1915402558879535105', '2025-06-14 01:01:38', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570466080006145', '1590229800633634816', '1670722611195203586', '2025-06-14 01:01:38', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570466675597314', '1590229800633634816', '1531445896986435585', '2025-06-14 01:01:38', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570467287965698', '1590229800633634816', '1531446009649635329', '2025-06-14 01:01:38', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570467891945474', '1590229800633634816', '1531446009779658754', '2025-06-14 01:01:38', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570468504313858', '1590229800633634816', '1531446009913876482', '2025-06-14 01:01:38', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570469104099330', '1590229800633634816', '1531446010039705602', '2025-06-14 01:01:38', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570469729050626', '1590229800633634816', '1531446010169729026', '2025-06-14 01:01:39', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570470337224705', '1590229800633634816', '1670722888228982785', '2025-06-14 01:01:39', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570470941204481', '1590229800633634816', '1670724676428550146', '2025-06-14 01:01:39', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570471545184257', '1590229800633634816', '1670725150502342658', '2025-06-14 01:01:39', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570472161746945', '1590229800633634816', '1670723480636674049', '2025-06-14 01:01:39', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570472790892546', '1590229800633634816', '1670725580288479233', '2025-06-14 01:01:39', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570473407455233', '1590229800633634816', '1670725673255227394', '2025-06-14 01:01:40', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570474015629313', '1590229800633634816', '1670732624412332034', '2025-06-14 01:01:40', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570474627997698', '1590229800633634816', '1670732985965531137', '2025-06-14 01:01:40', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570475231977473', '1590229800633634816', '1671121808444674049', '2025-06-14 01:01:40', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570475852734465', '1590229800633634816', '1779386604402573314', '2025-06-14 01:01:40', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570476452519938', '1590229800633634816', '1585191363078467586', '2025-06-14 01:01:40', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570477064888322', '1590229800633634816', '1585191589231144962', '2025-06-14 01:01:40', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570477656285185', '1590229800633634816', '1585192004932808706', '2025-06-14 01:01:41', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570478277042178', '1590229800633634816', '1585192140589182977', '2025-06-14 01:01:41', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570478885216258', '1590229800633634816', '1585192296575348738', '2025-06-14 01:01:41', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570479518556162', '1590229800633634816', '1585192489970511873', '2025-06-14 01:01:41', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570480105758722', '1590229800633634816', '1585192568882147330', '2025-06-14 01:01:41', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570480718127105', '1590229800633634816', '1585916026725281793', '2025-06-14 01:01:41', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570481322106881', '1590229800633634816', '1585916172586397697', '2025-06-14 01:01:41', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570481934475265', '1590229800633634816', '1867574302526791682', '2025-06-14 01:01:42', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570482718810113', '1590229800633634816', '1867574701077946369', '2025-06-14 01:01:42', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570483444424705', '1590229800633634816', '1867574920268079105', '2025-06-14 01:01:42', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570484098736129', '1590229800633634816', '1867574970650058754', '2025-06-14 01:01:42', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570484711104513', '1590229800633634816', '1867575019589197825', '2025-06-14 01:01:42', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570485302501378', '1590229800633634816', '1867575119333941250', '2025-06-14 01:01:42', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570485923258369', '1590229800633634816', '1867575179505426433', '2025-06-14 01:01:43', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570486527238146', '1590229800633634816', '1868158971727056897', '2025-06-14 01:01:43', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570487143800834', '1590229800633634816', '1919729610357121026', '2025-06-14 01:01:43', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570487731003394', '1590229800633634816', '1899099320962129922', '2025-06-14 01:01:43', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570488339177473', '1590229800633634816', '1899099806679310337', '2025-06-14 01:01:43', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570488934768642', '1590229800633634816', '1899100147609116674', '2025-06-14 01:01:43', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570489547137025', '1590229800633634816', '1899100200448958466', '2025-06-14 01:01:43', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570490138533890', '1590229800633634816', '1899100257789288450', '2025-06-14 01:01:44', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570490750902273', '1590229800633634816', '1899100333685219330', '2025-06-14 01:01:44', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570491367464961', '1590229800633634816', '1899100516183580674', '2025-06-14 01:01:44', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570491971444737', '1590229800633634816', '1899100759243497474', '2025-06-14 01:01:44', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570492579618818', '1590229800633634816', '1899101135661309954', '2025-06-14 01:01:44', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570493179404290', '1590229800633634816', '1899101198156439554', '2025-06-14 01:01:44', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570493787578369', '1590229800633634816', '1899101251365380098', '2025-06-14 01:01:44', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570494420918274', '1590229800633634816', '1899101326753800193', '2025-06-14 01:01:45', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570495163310082', '1590229800633634816', '1899101388426846210', '2025-06-14 01:01:45', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570496157360129', '1590229800633634816', '1915291965440675841', '2025-06-14 01:01:45', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570496778117122', '1590229800633634816', '1915292387572207618', '2025-06-14 01:01:45', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570497440817153', '1590229800633634816', '1915292689620815874', '2025-06-14 01:01:45', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570498044796929', '1590229800633634816', '1915292768339513345', '2025-06-14 01:01:45', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570498778800130', '1590229800633634816', '1915292607194353666', '2025-06-14 01:01:46', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570499399557122', '1590229800633634816', '1915292895489839106', '2025-06-14 01:01:46', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570500011925505', '1590229800633634816', '1915292947947999234', '2025-06-14 01:01:46', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570500662042625', '1590229800633634816', '1915292996463513601', '2025-06-14 01:01:46', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570501286993922', '1590229800633634816', '1915293051547308033', '2025-06-14 01:01:46', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570501895168002', '1590229800633634816', '1917098137059606530', '2025-06-14 01:01:46', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570502499147778', '1590229800633634816', '1917098249194323969', '2025-06-14 01:01:46', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570503094738946', '1590229800633634816', '1917098323634831361', '2025-06-14 01:01:47', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570503698718721', '1590229800633634816', '1539129183310196738', '2025-06-14 01:01:47', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570504302698497', '1590229800633634816', '1531846893999169537', '2025-06-14 01:01:47', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570504923455490', '1590229800633634816', '1531882841361915906', '2025-06-14 01:01:47', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570505523240962', '1590229800633634816', '1615718593878704130', '2025-06-14 01:01:47', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570506135609346', '1590229800633634816', '1615718665584525314', '2025-06-14 01:01:47', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570506743783425', '1590229800633634816', '1615718738766741505', '2025-06-14 01:01:47', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570507356151810', '1590229800633634816', '1615718811491778562', '2025-06-14 01:01:48', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570507947548674', '1590229800633634816', '10001', '2025-06-14 01:01:48', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570508559917057', '1590229800633634816', '1491752531735490561', '2025-06-14 01:01:48', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570509163896834', '1590229800633634816', '1491756888363307009', '2025-06-14 01:01:48', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570509788848129', '1590229800633634816', '1491757020773289986', '2025-06-14 01:01:48', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570510371856386', '1590229800633634816', '1491757382771085313', '2025-06-14 01:01:48', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570510992613378', '1590229800633634816', '1494514119857180674', '2025-06-14 01:01:48', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570511584010242', '1590229800633634816', '1547110946242326529', '2025-06-14 01:01:49', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570512208961537', '1590229800633634816', '1547111164111253505', '2025-06-14 01:01:49', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570512800358401', '1590229800633634816', '1491684226094198786', '2025-06-14 01:01:49', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570513437892609', '1590229800633634816', '1491690996678021121', '2025-06-14 01:01:49', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570514050260993', '1590229800633634816', '1493836091183411202', '2025-06-14 01:01:49', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570514662629377', '1590229800633634816', '1493836209106268161', '2025-06-14 01:01:49', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570515258220546', '1590229800633634816', '1493836280589791233', '2025-06-14 01:01:49', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570515866394626', '1590229800633634816', '1493841029473042434', '2025-06-14 01:01:50', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570516470374401', '1590229800633634816', '1590700851537625090', '2025-06-14 01:01:50', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570517078548481', '1590229800633634816', '1494216988311183361', '2025-06-14 01:01:50', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570517661556738', '1590229800633634816', '1494217080162246658', '2025-06-14 01:01:50', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570518273925122', '1590229800633634816', '1494217080510373890', '2025-06-14 01:01:50', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570518869516290', '1590229800633634816', '1494217080858501121', '2025-06-14 01:01:50', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570519490273282', '1590229800633634816', '1494217081206628354', '2025-06-14 01:01:51', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570520077475842', '1590229800633634816', '1494217081558949890', '2025-06-14 01:01:51', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570520689844225', '1590229800633634816', '1605129651156598786', '2025-06-14 01:01:51', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570521323184130', '1590229800633634816', '1605129783281369089', '2025-06-14 01:01:51', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570521939746818', '1590229800633634816', '1605130091042619393', '2025-06-14 01:01:51', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570522526949377', '1590229800633634816', '1493884088730529793', '2025-06-14 01:01:51', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570523135123458', '1590229800633634816', '1493884379760701442', '2025-06-14 01:01:51', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570523734908930', '1590229800633634816', '1494192758630694913', '2025-06-14 01:01:52', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570524347277314', '1590229800633634816', '1494192758974627842', '2025-06-14 01:01:52', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570524930285569', '1590229800633634816', '1494192759318560770', '2025-06-14 01:01:52', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570525542653953', '1590229800633634816', '1494192759662493698', '2025-06-14 01:01:52', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570526155022338', '1590229800633634816', '1494192760010620930', '2025-06-14 01:01:52', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570526796750849', '1590229800633634816', '1494151991157673985', '2025-06-14 01:01:52', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570527379759105', '1590229800633634816', '1494153372996255746', '2025-06-14 01:01:52', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570527992127490', '1590229800633634816', '1494153373352771586', '2025-06-14 01:01:53', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570528600301569', '1590229800633634816', '1494153373696704514', '2025-06-14 01:01:53', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570529208475650', '1590229800633634816', '1494153374053220354', '2025-06-14 01:01:53', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570529799872514', '1590229800633634816', '1494153374401347585', '2025-06-14 01:01:53', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570530408046593', '1590229800633634816', '1491948958826921986', '2025-06-14 01:01:53', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570531012026369', '1590229800633634816', '1491949315883827201', '2025-06-14 01:01:53', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570531632783362', '1590229800633634816', '1491969633293729794', '2025-06-14 01:01:53', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570532211597313', '1590229800633634816', '1928789844748812290', '2025-06-14 01:01:54', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570532840742914', '1590229800633634816', '1928789932476874754', '2025-06-14 01:01:54', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570533440528385', '1590229800633634816', '1928790012067987457', '2025-06-14 01:01:54', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570534048702466', '1590229800633634816', '1491973212968632322', '2025-06-14 01:01:54', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570534631710721', '1590229800633634816', '1493578977630121986', '2025-06-14 01:01:54', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570535244079105', '1590229800633634816', '1493578977978249218', '2025-06-14 01:01:54', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570535843864577', '1590229800633634816', '1493578978313793537', '2025-06-14 01:01:54', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570536452038658', '1590229800633634816', '1493578978649337858', '2025-06-14 01:01:55', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570537039241218', '1590229800633634816', '1526179827628048385', '2025-06-14 01:01:55', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570537655803905', '1590229800633634816', '1493596733666652162', '2025-06-14 01:01:55', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570538255589378', '1590229800633634816', '1493766204259942401', '2025-06-14 01:01:55', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570538876346369', '1590229800633634816', '1537048076783616001', '2025-06-14 01:01:55', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570539463548929', '1590229800633634816', '1537066492991012865', '2025-06-14 01:01:55', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570540054945793', '1590229800633634816', '1537066557067395074', '2025-06-14 01:01:55', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570540700868610', '1590229800633634816', '1927019068022489089', '2025-06-14 01:01:56', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570541321625601', '1590229800633634816', '1927019358259937281', '2025-06-14 01:01:56', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570541908828161', '1590229800633634816', '1927019806207410177', '2025-06-14 01:01:56', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570542521196546', '1590229800633634816', '1927019859089195010', '2025-06-14 01:01:56', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570543112593410', '1590229800633634816', '1927019907625680898', '2025-06-14 01:01:56', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570543792070658', '1590229800633634816', '1927019952529899521', '2025-06-14 01:01:56', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570544370884609', '1590229800633634816', '1927019998386225153', '2025-06-14 01:01:56', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570545008418817', '1590229800633634816', '1927021148942532609', '2025-06-14 01:01:57', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570545599815682', '1590229800633634816', '1927021215334170626', '2025-06-14 01:01:57', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570546212184066', '1590229800633634816', '1927021260133531650', '2025-06-14 01:01:57', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570546803580930', '1590229800633634816', '1927021317796823041', '2025-06-14 01:01:57', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570547415949313', '1590229800633634816', '1927021366836625410', '2025-06-14 01:01:57', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570548024123393', '1590229800633634816', '1927021411304636418', '2025-06-14 01:01:57', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570548644880385', '1590229800633634816', '1928822847139115009', '2025-06-14 01:01:57', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570549227888642', '1590229800633634816', '1928823260638769153', '2025-06-14 01:01:58', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570549836062722', '1590229800633634816', '1928823312304205825', '2025-06-14 01:01:58', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570550435848194', '1590229800633634816', '1928823358349275138', '2025-06-14 01:01:58', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570551048216577', '1590229800633634816', '1928823403488374786', '2025-06-14 01:01:58', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570551635419138', '1590229800633634816', '1928823461483016193', '2025-06-14 01:01:58', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570552247787522', '1590229800633634816', '1928823102488342529', '2025-06-14 01:01:58', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570552864350209', '1590229800633634816', '1928823538368802817', '2025-06-14 01:01:58', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570553472524290', '1590229800633634816', '1928823581008097281', '2025-06-14 01:01:59', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570554080698370', '1590229800633634816', '1928823624427532289', '2025-06-14 01:01:59', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570554688872450', '1590229800633634816', '1928823667876327426', '2025-06-14 01:01:59', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570555292852226', '1590229800633634816', '1928823711622918145', '2025-06-14 01:01:59', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570555905220609', '1590229800633634816', '1933563583067787265', '2025-06-14 01:01:59', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570556484034562', '1590229800633634816', '1933563693336039426', '2025-06-14 01:01:59', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570557100597250', '1590229800633634816', '1933563747207680002', '2025-06-14 01:01:59', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570557717159937', '1590229800633634816', '1933563803264552961', '2025-06-14 01:02:00', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570558337916930', '1590229800633634816', '1933563850534359042', '2025-06-14 01:02:00', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570558925119489', '1590229800633634816', '1933563897820942337', '2025-06-14 01:02:00', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570559550070786', '1590229800633634816', '1917432922911051778', '2025-06-14 01:02:00', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570560145661954', '1590229800633634816', '1917461111616065537', '2025-06-14 01:02:00', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570560758030337', '1590229800633634816', '1917466901169065986', '2025-06-14 01:02:00', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570561349427201', '1590229800633634816', '1917466958165463041', '2025-06-14 01:02:00', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570561965989890', '1590229800633634816', '1917467140303114241', '2025-06-14 01:02:01', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570562565775362', '1590229800633634816', '1917467189217087489', '2025-06-14 01:02:01', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570563173949441', '1590229800633634816', '1917461425765240834', '2025-06-14 01:02:01', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570563765346305', '1590229800633634816', '1918277965781831682', '2025-06-14 01:02:01', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570564373520386', '1590229800633634816', '1918278021725458433', '2025-06-14 01:02:01', 'system');
INSERT INTO `sys_tenant_menu` VALUES ('1933570564973305858', '1590229800633634816', '1918278074695323650', '2025-06-14 01:02:01', 'system');

-- ----------------------------
-- Table structure for sys_tenant_package
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant_package`;
CREATE TABLE `sys_tenant_package`  (
                                       `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                       `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '套餐名称',
                                       `sub_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子标题',
                                       `sales_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格（元）',
                                       `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价（元）',
                                       `status` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '状态：0.正常；1.停用；',
                                       `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
                                       `app_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用key',
                                       `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                       `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                       `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                       `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                       `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户套餐' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_tenant_package
-- ----------------------------
INSERT INTO `sys_tenant_package` VALUES ('1590981945990287361', '环兴商城专业版', '商城基础版/营销功能/微信小程序', 1299.00, 2000.00, '1', '<p><br></p><p><img src=\"https://haorong.oss-cn-beijing.aliyuncs.com/lijx/ea86c408-21eb-47af-81df-6367cb398075.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p>', 'app_base,app_market,app_wechat', '2022-11-11 16:17:10', '2024-11-07 19:39:40', '0', NULL, 'admin');
INSERT INTO `sys_tenant_package` VALUES ('1591735271929356289', '环兴商城基础版', '商城基础功能', 888.00, 999.00, '1', '<p>阿达打撒 阿斯顿撒打算</p>', 'app_base,app_wechat', '2022-11-13 18:10:36', '2022-11-13 18:10:36', '0', NULL, NULL);
INSERT INTO `sys_tenant_package` VALUES ('1639458123460681730', '环兴商城旗舰版', '环兴商城旗舰版', 0.01, 0.01, '1', '<p><br></p><p><img src=\"https://haorong.oss-cn-beijing.aliyuncs.com/lijx/72ca917c-9cc3-4452-9aa7-93d99196782e.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p>', 'app_base,app_market,app_alipay,app_wechat', '2022-11-11 16:17:10', '2022-11-13 18:11:39', '0', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
                             `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                             `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
                             `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
                             `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
                             `nike_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
                             `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
                             `dept_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门ID',
                             `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
                             `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                             `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                             `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                             `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                             `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：0.正常；1.停用；',
                             `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                             `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                             `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号类型：0.系统主账户；',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '806@163.com', '环兴', 'https://haorong.oss-cn-beijing.aliyuncs.com/lijx/278a943b-52ac-4f6b-a6b6-506cc67f8d0a.jpg', '2', '17615123399', '0', '2022-05-20 17:33:24', '2025-04-09 22:18:24', '1590229800633634816', '0', NULL, 'admin', '0');
INSERT INTO `sys_user` VALUES ('1881232178902249473', 'system', 'e10adc3949ba59abbe56e057f20f883e', NULL, '111', 'https://minio.ihuanxing.cn/huanxing/file/eece8d88-c9a5-4d7f-b6b8-cf7c82d3c34a.png', '1881232178197606401', '17640212321', '0', '2025-01-20 14:47:58', '2025-04-13 05:01:21', '1881232176465358849', '0', 'lijx', 'system', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
                                  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
                                  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID',
                                  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户关联角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1909974176524726274', '1', '1', '2025-04-09 22:18:24', '1590229800633634816');
INSERT INTO `sys_user_role` VALUES ('1911162746203594754', '1881232178902249473', '1881232177484574722', '2025-04-13 05:01:21', '1881232176465358849');

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
                             `id` bigint NOT NULL AUTO_INCREMENT,
                             `branch_id` bigint NOT NULL,
                             `xid` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
                             `context` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
                             `rollback_info` longblob NOT NULL,
                             `log_status` int NOT NULL,
                             `log_created` datetime NOT NULL,
                             `log_modified` datetime NOT NULL,
                             `ext` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
                             PRIMARY KEY (`id`) USING BTREE,
                             UNIQUE INDEX `ux_undo_log`(`xid` ASC, `branch_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
                                 `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                                 `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户主键',
                                 `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                 `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                 `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                 `recipient_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
                                 `telephone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
                                 `postal_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
                                 `province_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '省名称（冗余字段）',
                                 `city_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市名称（冗余字段）',
                                 `area_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区名称（冗余字段）',
                                 `province_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '省编码',
                                 `city_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市编码',
                                 `area_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区编码',
                                 `is_default` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '默认地址 0.否；1.是；',
                                 `detail_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
                                 `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                                 `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                 `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户收货地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_address
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
                              `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                              `nick_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
                              `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
                              `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
                              `sex` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别：1、男；2、女；0、未知；',
                              `avatar_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
                              `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在城市',
                              `province` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在省份',
                              `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                              `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                              `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                              `user_source` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户来源',
                              `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                              `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                              `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                              PRIMARY KEY (`id`) USING BTREE,
                              UNIQUE INDEX `uk_phone`(`tenant_id` ASC, `phone` ASC) USING BTREE COMMENT '用户手机号'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商城用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------

-- ----------------------------
-- Table structure for wx_app
-- ----------------------------
DROP TABLE IF EXISTS `wx_app`;
CREATE TABLE `wx_app`  (
                           `app_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'appId',
                           `app_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用名称',
                           `app_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '秘钥',
                           `mini_code_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小程序码',
                           `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                           `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                           `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                           `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'token',
                           `aes_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'AESKey',
                           `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                           `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                           `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                           PRIMARY KEY (`app_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信应用' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wx_app
-- ----------------------------

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user`  (
                            `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PK',
                            `app_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用主键',
                            `openid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'openid',
                            `session_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会话密钥',
                            `unionid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户在开放平台的唯一标识符，若当前小程序已绑定到微信开放平台帐号下会返回',
                            `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                            `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                            `create_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
                            `update_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者ID',
                            `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                            `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
                            `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
                            `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
                            `mall_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商城用户主键',
                            `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '租户id',
                            `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                            `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                            PRIMARY KEY (`id`) USING BTREE,
                            UNIQUE INDEX `uk_app_openid`(`app_id` ASC, `openid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wx_user
-- ----------------------------

DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
                              `table_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
                              `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表名称',
                              `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表描述',
                              `sub_table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联父表的表名',
                              `sub_table_fk_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '本表关联父表的外键名',
                              `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实体类名称(首字母大写)',
                              `tpl_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
                              `tpl_web_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前端类型（element-ui模版 element-plus模版）',
                              `package_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '生成包路径',
                              `module_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '生成模块名',
                              `business_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '生成业务名',
                              `function_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '生成功能名',
                              `function_author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '生成作者',
                              `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
                              `gen_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成路径（不填默认项目路径）',
                              `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '其它生成选项',
                              `tree_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '树编码字段',
                              `tree_parent_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '树父编码字段',
                              `tree_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '树名称字段',
                              `parent_menu_id` bigint NULL DEFAULT NULL COMMENT '上级菜单ID字段',
                              `parent_menu_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级菜单名称字段',
                              `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                              `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                              `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                              `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
                              `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                              `ds_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源名称',
                              PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成表' ROW_FORMAT = DYNAMIC;


DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
                                     `column_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
                                     `table_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表ID',
                                     `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
                                     `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
                                     `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
                                     `java_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
                                     `java_field` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'JAVA字段名',
                                     `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否主键（1是）',
                                     `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否自增（1是）',
                                     `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否必填（1是）',
                                     `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否为插入字段（1是）',
                                     `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否编辑字段（1是）',
                                     `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否列表字段（1是）',
                                     `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否查询字段（1是）',
                                     `query_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '查询方式（EQ等于、NE不等于、GT大于、LT小于、LIKE模糊、BETWEEN范围）',
                                     `html_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（input、textarea、select、checkbox、radio、datetime、image、upload、editor）',
                                     `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型',
                                     `sort` int NULL DEFAULT NULL COMMENT '排序',
                                     `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                     `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                     `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                     `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
                                     `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                     PRIMARY KEY (`column_id`) USING BTREE,
                                     INDEX `idx_table_id`(`table_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务字段表' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for gen_data_source
-- ----------------------------
DROP TABLE IF EXISTS `gen_data_source`;
CREATE TABLE `gen_data_source`  (
                                    `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
                                    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
                                    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
                                    `del_flag` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除：0.显示；1.隐藏；',
                                    `create_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                    `update_by` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
                                    `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
                                    `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'jdbc url',
                                    `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
                                    `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
                                    `db_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
                                    `port` int NULL DEFAULT NULL COMMENT '端口',
                                    `host` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主机',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据源表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
