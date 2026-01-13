USE haorong_product;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
INSERT INTO `goods_category` VALUES ('1912861788486148097', '家用电器', '0', 'https://minio.ihuanxing.cn/haorong/file/f65cf2cb-3594-40e3-b720-ea72c9f685ef.png', '家用电器', '0', '2025-04-17 21:32:44', '2025-05-16 10:33:27', '0', 1, '1590229800633634816', 'admin', 'system');
INSERT INTO `goods_category` VALUES ('1912862220591734785', '电视', '1912861788486148097', 'https://minio.ihuanxing.cn/haorong/file/9baf470c-b17e-417e-88f9-38a3b5f2cf8e.png', '电视', '0', '2025-04-17 21:34:27', NULL, '0', 1, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_category` VALUES ('1912862615531593730', '空调', '1912861788486148097', 'https://minio.ihuanxing.cn/haorong/file/16e58200-e455-44aa-9c91-66b9d991b5ef.jpg', '空调', '0', '2025-04-17 21:36:01', NULL, '0', 2, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_category` VALUES ('1912863000879079426', '冰箱', '1912861788486148097', 'https://minio.ihuanxing.cn/haorong/file/1c3abd12-ec0c-4d18-897b-c789203b4f25.jpg', '冰箱', '0', '2025-04-17 21:37:33', NULL, '0', 3, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_category` VALUES ('1912863400222957569', '手机数码', '0', 'https://minio.ihuanxing.cn/haorong/file/9baf470c-b17e-417e-88f9-38a3b5f2cf8e.png', '手机数码', '0', '2025-04-17 21:39:09', NULL, '0', 2, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_category` VALUES ('1912863683464306689', '手机', '1912863400222957569', 'https://minio.ihuanxing.cn/haorong/file/cb7c6390-1602-4f66-a4fc-94bbb9adbf35.jpg', '手机', '0', '2025-04-17 21:40:16', NULL, '0', 1, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_category` VALUES ('1912863991967948801', '智能设备', '1912863400222957569', 'https://minio.ihuanxing.cn/haorong/file/8c25a91d-91b4-4728-8f20-4880fad18677.jpg', '智能设备', '0', '2025-04-17 21:41:30', NULL, '0', 2, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_category` VALUES ('1912864294511484929', '无人机', '1912863400222957569', 'https://minio.ihuanxing.cn/haorong/file/0f4b0f37-0844-4c43-a1d7-231eadc61ddb.jpg', '无人机', '0', '2025-04-17 21:42:42', NULL, '0', 3, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_category` VALUES ('1925541056051564546', '电脑', '1912863400222957569', 'https://minio.ihuanxing.cn/haorong/1590229800633634816/file/e1a4f623-6773-4eea-9f78-c22ca4d4c12b.jpg', NULL, '0', '2025-05-22 21:15:37', NULL, '0', 4, '1590229800633634816', 'system', NULL);

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
INSERT INTO `goods_sku` VALUES ('1912867578517299201', '1912867577569386497', 9499.00, 9499.00, 9499.00, 70, 0.00, 0.00, '2025-04-17 21:55:45', '2025-07-17 00:40:09', '0', 0, '1590229800633634816', 'admin', NULL, NULL, '0');
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
INSERT INTO `goods_sku` VALUES ('1919013944788389889', '1912870113080680449', 9999.00, 9999.00, 9999.00, 9968, 0.00, 0.00, '2025-05-04 20:59:13', '2025-07-17 00:06:18', '0', 0, '1590229800633634816', 'system', NULL, NULL, '0');
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
INSERT INTO `goods_sku_specs_value` VALUES ('1919013951906123777', '1919013944788389889', '1912869461206147074', 0, '2025-05-04 20:59:14', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013952560435201', '1919013944788389889', '1912869653045223426', 1, '2025-05-04 20:59:15', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013953223135234', '1919013945459478529', '1912869461206147074', 0, '2025-05-04 20:59:15', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013953869058049', '1919013945459478529', '1912869723891212289', 1, '2025-05-04 20:59:15', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013954531758081', '1919013946130567170', '1912869494215319554', 0, '2025-05-04 20:59:15', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013955181875201', '1919013946130567170', '1912869653045223426', 1, '2025-05-04 20:59:15', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013955823603713', '1919013946784878594', '1912869494215319554', 0, '2025-05-04 20:59:15', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013956469526529', '1919013946784878594', '1912869723891212289', 1, '2025-05-04 20:59:15', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013957128032257', '1919013947439190017', '1912869535868952578', 0, '2025-05-04 20:59:16', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013957778149377', '1919013947439190017', '1912869653045223426', 1, '2025-05-04 20:59:16', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013958432460802', '1919013948089307138', '1912869535868952578', 0, '2025-05-04 20:59:16', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013959086772226', '1919013948089307138', '1912869723891212289', 1, '2025-05-04 20:59:16', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013959762055169', '1919013948756201474', '1912869571721863169', 0, '2025-05-04 20:59:16', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013960403783681', '1919013948756201474', '1912869653045223426', 1, '2025-05-04 20:59:16', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013961066483713', '1919013949393735681', '1912869571721863169', 0, '2025-05-04 20:59:17', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1919013961704017922', '1919013949393735681', '1912869723891212289', 1, '2025-05-04 20:59:17', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925543041379225602', '1925543037348499457', '1925541940366036993', 0, '2025-05-22 21:23:31', NULL, '0', '1925543036622884866', 'https://minio.ihuanxing.cn/haorong/1590229800633634816/file/f818bd69-14e6-4c24-88f2-dfc9c8687750.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925543042037731330', '1925543037348499457', '1925542130414145538', 1, '2025-05-22 21:23:31', NULL, '0', '1925543036622884866', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925543042742374402', '1925543038044753922', '1925541940366036993', 0, '2025-05-22 21:23:31', NULL, '0', '1925543036622884866', 'https://minio.ihuanxing.cn/haorong/1590229800633634816/file/f818bd69-14e6-4c24-88f2-dfc9c8687750.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925543043421851649', '1925543038044753922', '1925542181177806849', 1, '2025-05-22 21:23:31', NULL, '0', '1925543036622884866', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925543044080357378', '1925543038707453953', '1925542032317763585', 0, '2025-05-22 21:23:31', NULL, '0', '1925543036622884866', 'https://minio.ihuanxing.cn/haorong/1590229800633634816/file/5548b0e1-7982-468a-8740-ff0177aed995.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925543044755640321', '1925543038707453953', '1925542130414145538', 1, '2025-05-22 21:23:31', NULL, '0', '1925543036622884866', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925543045447700481', '1925543039374348290', '1925542032317763585', 0, '2025-05-22 21:23:32', NULL, '0', '1925543036622884866', 'https://minio.ihuanxing.cn/haorong/1590229800633634816/file/5548b0e1-7982-468a-8740-ff0177aed995.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925543046148149249', '1925543039374348290', '1925542181177806849', 1, '2025-05-22 21:23:32', NULL, '0', '1925543036622884866', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545892344123394', '1925545887055106050', '1925545078720450562', 0, '2025-05-22 21:34:50', NULL, '1', '1925545886404988929', 'https://minio.ihuanxing.cn/haorong/1590229800633634816/file/2cf21842-2505-4395-8943-d7d92bcba9ed.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545893040377857', '1925545887055106050', '1912869653045223426', 1, '2025-05-22 21:34:50', NULL, '1', '1925545886404988929', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545893778575362', '1925545887751360514', '1925545078720450562', 0, '2025-05-22 21:34:51', NULL, '1', '1925545886404988929', 'https://minio.ihuanxing.cn/haorong/1590229800633634816/file/2cf21842-2505-4395-8943-d7d92bcba9ed.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545894458052610', '1925545887751360514', '1912869723891212289', 1, '2025-05-22 21:34:51', NULL, '1', '1925545886404988929', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545895112364033', '1925545888388894721', '1925545135712653313', 0, '2025-05-22 21:34:51', NULL, '1', '1925545886404988929', 'https://minio.ihuanxing.cn/haorong/1590229800633634816/file/dcb4b7d0-4293-4c3f-aa00-0068e8216db6.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545895775064065', '1925545888388894721', '1912869653045223426', 1, '2025-05-22 21:34:51', NULL, '1', '1925545886404988929', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545896408403969', '1925545889055789058', '1925545135712653313', 0, '2025-05-22 21:34:51', NULL, '1', '1925545886404988929', 'https://minio.ihuanxing.cn/haorong/1590229800633634816/file/dcb4b7d0-4293-4c3f-aa00-0068e8216db6.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545897066909697', '1925545889055789058', '1912869723891212289', 1, '2025-05-22 21:34:51', NULL, '1', '1925545886404988929', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545897721221121', '1925545889714294786', '1925545170894475265', 0, '2025-05-22 21:34:52', NULL, '1', '1925545886404988929', 'https://minio.ihuanxing.cn/haorong/1590229800633634816/file/4f941d02-cc14-40cc-bb60-29453d2594b3.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545898371338241', '1925545889714294786', '1912869653045223426', 1, '2025-05-22 21:34:52', NULL, '1', '1925545886404988929', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1925545899017261057', '1925545890393772033', '1925545170894475265', 0, '2025-05-22 21:34:52', NULL, '1', '1925545886404988929', 'https://minio.ihuanxing.cn/haorong/1590229800633634816/file/4f941d02-cc14-40cc-bb60-29453d2594b3.jpg', '1590229800633634816', 'system', NULL);
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
INSERT INTO `goods_sku_specs_value` VALUES ('1930904516480229377', '1919013944788389889', '1912869461206147074', 0, '2025-06-06 16:28:06', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904517352644610', '1919013944788389889', '1912869653045223426', 1, '2025-06-06 16:28:06', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904518434775041', '1919013945459478529', '1912869461206147074', 0, '2025-06-06 16:28:06', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904519386882050', '1919013945459478529', '1912869723891212289', 1, '2025-06-06 16:28:07', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904520297046017', '1919013946130567170', '1912869494215319554', 0, '2025-06-06 16:28:07', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904521161072641', '1919013946130567170', '1912869653045223426', 1, '2025-06-06 16:28:07', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904522251591681', '1919013946784878594', '1912869494215319554', 0, '2025-06-06 16:28:07', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904523165949954', '1919013946784878594', '1912869723891212289', 1, '2025-06-06 16:28:07', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904524130639873', '1919013947439190017', '1912869535868952578', 0, '2025-06-06 16:28:08', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904525032415234', '1919013947439190017', '1912869653045223426', 1, '2025-06-06 16:28:08', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904526047436801', '1919013948089307138', '1912869535868952578', 0, '2025-06-06 16:28:08', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904526940823554', '1919013948089307138', '1912869723891212289', 1, '2025-06-06 16:28:08', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904527859376129', '1919013948756201474', '1912869571721863169', 0, '2025-06-06 16:28:09', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904528782123010', '1919013948756201474', '1912869653045223426', 1, '2025-06-06 16:28:09', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904529813921793', '1919013949393735681', '1912869571721863169', 0, '2025-06-06 16:28:09', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1930904530745057281', '1919013949393735681', '1912869723891212289', 1, '2025-06-06 16:28:09', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891146575187969', '1919013944788389889', '1912869461206147074', 0, '2025-06-14 22:15:54', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891147464380417', '1919013944788389889', '1912869653045223426', 1, '2025-06-14 22:15:54', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891148299046914', '1919013945459478529', '1912869461206147074', 0, '2025-06-14 22:15:54', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891149154684929', '1919013945459478529', '1912869723891212289', 1, '2025-06-14 22:15:55', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891150039683073', '1919013946130567170', '1912869494215319554', 0, '2025-06-14 22:15:55', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891150886932482', '1919013946130567170', '1912869653045223426', 1, '2025-06-14 22:15:55', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891151734181889', '1919013946784878594', '1912869494215319554', 0, '2025-06-14 22:15:55', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891152573042690', '1919013946784878594', '1912869723891212289', 1, '2025-06-14 22:15:55', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891153453846530', '1919013947439190017', '1912869535868952578', 0, '2025-06-14 22:15:56', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891154305290242', '1919013947439190017', '1912869653045223426', 1, '2025-06-14 22:15:56', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891155152539650', '1919013948089307138', '1912869535868952578', 0, '2025-06-14 22:15:56', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891155999789058', '1919013948089307138', '1912869723891212289', 1, '2025-06-14 22:15:56', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891156880592898', '1919013948756201474', '1912869571721863169', 0, '2025-06-14 22:15:56', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891157740425218', '1919013948756201474', '1912869653045223426', 1, '2025-06-14 22:15:57', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891158575091714', '1919013949393735681', '1912869571721863169', 0, '2025-06-14 22:15:57', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1933891159413952513', '1919013949393735681', '1912869723891212289', 1, '2025-06-14 22:15:57', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245794181386241', '1919013944788389889', '1912869461206147074', 0, '2025-06-18 15:58:47', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245795213185025', '1919013944788389889', '1912869653045223426', 1, '2025-06-18 15:58:47', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245796295315458', '1919013945459478529', '1912869461206147074', 0, '2025-06-18 15:58:48', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245797188702209', '1919013945459478529', '1912869723891212289', 1, '2025-06-18 15:58:48', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245798149197826', '1919013946130567170', '1912869494215319554', 0, '2025-06-18 15:58:48', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245799126470658', '1919013946130567170', '1912869653045223426', 1, '2025-06-18 15:58:48', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245800124715010', '1919013946784878594', '1912869494215319554', 0, '2025-06-18 15:58:49', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245801013907458', '1919013946784878594', '1912869723891212289', 1, '2025-06-18 15:58:49', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245801982791682', '1919013947439190017', '1912869535868952578', 0, '2025-06-18 15:58:49', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245802955870210', '1919013947439190017', '1912869653045223426', 1, '2025-06-18 15:58:49', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245803924754434', '1919013948089307138', '1912869535868952578', 0, '2025-06-18 15:58:49', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245804897832962', '1919013948089307138', '1912869723891212289', 1, '2025-06-18 15:58:50', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245805917048833', '1919013948756201474', '1912869571721863169', 0, '2025-06-18 15:58:50', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245806898515969', '1919013948756201474', '1912869653045223426', 1, '2025-06-18 15:58:50', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245807884177410', '1919013949393735681', '1912869571721863169', 0, '2025-06-18 15:58:50', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935245808819507201', '1919013949393735681', '1912869723891212289', 1, '2025-06-18 15:58:51', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935254964557336577', '1919013944788389889', '1912869461206147074', 0, '2025-06-18 16:35:14', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935254965740130306', '1919013944788389889', '1912869653045223426', 1, '2025-06-18 16:35:14', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935254967090696193', '1919013945459478529', '1912869461206147074', 0, '2025-06-18 16:35:14', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935254968164438018', '1919013945459478529', '1912869723891212289', 1, '2025-06-18 16:35:14', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935254969359814658', '1919013946130567170', '1912869494215319554', 0, '2025-06-18 16:35:15', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935254970672631809', '1919013946130567170', '1912869653045223426', 1, '2025-06-18 16:35:15', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935254991384104962', '1919013946784878594', '1912869494215319554', 0, '2025-06-18 16:35:20', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935254992743059457', '1919013946784878594', '1912869723891212289', 1, '2025-06-18 16:35:20', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935255013269983233', '1919013947439190017', '1912869535868952578', 0, '2025-06-18 16:35:25', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935255033855627266', '1919013947439190017', '1912869653045223426', 1, '2025-06-18 16:35:30', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935255034790957058', '1919013948089307138', '1912869535868952578', 0, '2025-06-18 16:35:30', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935255035780812801', '1919013948089307138', '1912869723891212289', 1, '2025-06-18 16:35:30', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935255036741308417', '1919013948756201474', '1912869571721863169', 0, '2025-06-18 16:35:31', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935255057519890433', '1919013948756201474', '1912869653045223426', 1, '2025-06-18 16:35:36', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935255058652352513', '1919013949393735681', '1912869571721863169', 0, '2025-06-18 16:35:36', NULL, '1', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1935255059742871553', '1919013949393735681', '1912869723891212289', 1, '2025-06-18 16:35:36', NULL, '1', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1936287295794388994', '1936287290845110273', '1912869653045223426', 0, '2025-06-21 12:57:20', NULL, '1', '1925545886404988929', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1936287296880713729', '1936287291935629314', '1912869723891212289', 0, '2025-06-21 12:57:21', NULL, '1', '1925545886404988929', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1936786843264425985', '1936287290845110273', '1912869653045223426', 0, '2025-06-22 22:02:22', NULL, '0', '1925545886404988929', NULL, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1936786844170395650', '1936287291935629314', '1912869723891212289', 0, '2025-06-22 22:02:22', NULL, '0', '1925545886404988929', NULL, '1590229800633634816', 'admin', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054499800965122', '1919013944788389889', '1912869461206147074', 0, '2025-07-12 23:21:26', NULL, '0', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054500639825922', '1919013944788389889', '1912869653045223426', 1, '2025-07-12 23:21:26', NULL, '0', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054501487075329', '1919013945459478529', '1912869461206147074', 0, '2025-07-12 23:21:27', NULL, '0', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054502330130434', '1919013945459478529', '1912869723891212289', 1, '2025-07-12 23:21:27', NULL, '0', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054503177379841', '1919013946130567170', '1912869494215319554', 0, '2025-07-12 23:21:27', NULL, '0', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054503953326081', '1919013946130567170', '1912869653045223426', 1, '2025-07-12 23:21:27', NULL, '0', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054504792186882', '1919013946784878594', '1912869494215319554', 0, '2025-07-12 23:21:27', NULL, '0', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054505635241985', '1919013946784878594', '1912869723891212289', 1, '2025-07-12 23:21:28', NULL, '0', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054506549600258', '1919013947439190017', '1912869535868952578', 0, '2025-07-12 23:21:28', NULL, '0', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054507401043970', '1919013947439190017', '1912869653045223426', 1, '2025-07-12 23:21:28', NULL, '0', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054508239904770', '1919013948089307138', '1912869535868952578', 0, '2025-07-12 23:21:28', NULL, '0', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/4714dced-02c2-4300-9f57-862033c1f98f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054509087154177', '1919013948089307138', '1912869723891212289', 1, '2025-07-12 23:21:28', NULL, '0', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054509934403585', '1919013948756201474', '1912869571721863169', 0, '2025-07-12 23:21:29', NULL, '0', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054510785847298', '1919013948756201474', '1912869653045223426', 1, '2025-07-12 23:21:29', NULL, '0', '1912870113080680449', NULL, '1590229800633634816', 'system', NULL);
INSERT INTO `goods_sku_specs_value` VALUES ('1944054511565987842', '1919013949393735681', '1912869571721863169', 0, '2025-07-12 23:21:29', NULL, '0', '1912870113080680449', 'https://minio.ihuanxing.cn/haorong/file/29c5fa1e-d2b5-487f-a4fe-ddf72154303f.jpg', '1590229800633634816', 'system', NULL);
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
INSERT INTO `goods_spu` VALUES ('1912867577569386497', 'Apple/苹果 iPhone 16 Pro Max（A3297）', NULL, 'https://minio.ihuanxing.cn/haorong/file/e8e18e94-d352-45d9-acdd-f918a6f77f90.jpg,https://minio.ihuanxing.cn/haorong/file/88e79726-2368-4767-aa60-065b5ea9aabd.jpg,https://minio.ihuanxing.cn/haorong/file/cc5819fb-8f39-45ad-b584-52ff3fbdf642.jpg,https://minio.ihuanxing.cn/haorong/file/f9a3fe3b-22ee-437d-9676-8fe4127e04ec.jpg,https://minio.ihuanxing.cn/haorong/file/f7a85fb7-adde-4635-9738-88709be3b76a.jpg', '1', 1073, '1912863400222957569', '1912863683464306689', '2025-04-17 21:55:45', '2025-07-17 00:40:09', '0', '<p><br></p><p><img src=\"https://minio.ihuanxing.cn/haorong/file/9888cb29-e6b8-4d67-b129-0d3859c3717e.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://minio.ihuanxing.cn/haorong/file/1744aaa5-ed8a-46ca-ba53-3e0038aa5ea6.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p>', '1', '1590229800633634816', 'admin', NULL, 1129, '0', 0.00, 9299.00, 9299.00, 11299.00);
INSERT INTO `goods_spu` VALUES ('1912870113080680449', '小米15 国家补贴 徕卡光学Summilux高速镜头 骁龙8至尊版移动平台', NULL, 'https://minio.ihuanxing.cn/haorong/file/6b5481c8-ee15-41a2-bca8-d08463947208.jpg,https://minio.ihuanxing.cn/haorong/file/22e2fc4e-bc1e-4c42-a57f-af4cb04af847.jpg,https://minio.ihuanxing.cn/haorong/file/9f371b82-9843-4fd2-a206-ebbb0b9ddb9e.jpg,https://minio.ihuanxing.cn/haorong/file/505b78ac-7dfa-4379-a4df-d11e90d34ae0.jpg,https://minio.ihuanxing.cn/haorong/file/3f462f51-a183-465d-94cc-f8bfd1759869.jpg', '1', 245, '1912863400222957569', '1912863683464306689', '2025-04-17 22:05:49', '2025-07-17 00:06:18', '0', '<p><br></p><p><img src=\"https://minio.ihuanxing.cn/haorong/file/292fbf15-33cc-4eee-b1ef-3a4dc71ba4d2.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p>', '1', '1590229800633634816', 'admin', NULL, 69954, '0', 0.00, 9999.00, 9999.00, 9999.00);
INSERT INTO `goods_spu` VALUES ('1912882761411239938', '大疆 DJI Mini 3 优选迷你航拍机 智能高清拍摄无人机 小型遥控飞机 兼容带屏遥控器 大疆无人机', '', 'https://minio.ihuanxing.cn/haorong/file/e38f917c-c4a5-4fd8-9acf-e6a4f40aff60.jpg,https://minio.ihuanxing.cn/haorong/file/ff6de4fc-406e-4f02-8b9a-6269dd9b8ce8.jpg,https://minio.ihuanxing.cn/haorong/file/0f4f5061-3930-4ef8-9352-5307d3689307.jpg,https://minio.ihuanxing.cn/haorong/file/78fa70d0-faff-4440-a9a4-55b4b4ca71f7.jpg', '1', 145, '1912863400222957569', '1912864294511484929', '2025-04-17 22:56:05', '2025-06-21 00:05:10', '0', '<p><br></p><p><img src=\"https://minio.ihuanxing.cn/haorong/file/b775af49-8e44-4ba7-b19c-08b8141af9c5.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p>', '0', '1590229800633634816', 'admin', NULL, 973, '2', 0.00, 5999.00, 5999.00, 5999.00);
INSERT INTO `goods_spu` VALUES ('1925543036622884866', '华为MateBook Fold 非凡大师 笔记本电脑 鸿蒙操作系统 超轻薄折叠电脑双层OLED显示屏', '华为MateBook Fold 非凡大师 笔记本电脑 鸿蒙操作系统 超轻薄折叠电脑双层OLED显示屏', 'https://minio.ihuanxing.cn/haorong/1590229800633634816/file/5548b0e1-7982-468a-8740-ff0177aed995.jpg,https://minio.ihuanxing.cn/haorong/1590229800633634816/file/f818bd69-14e6-4c24-88f2-dfc9c8687750.jpg,https://minio.ihuanxing.cn/haorong/1590229800633634816/file/b116d626-b40b-4c21-ae34-408277623e85.jpg,https://minio.ihuanxing.cn/haorong/1590229800633634816/file/fa5a558d-5962-49b8-9695-a57b9239af3e.jpg,https://minio.ihuanxing.cn/haorong/1590229800633634816/file/646127e7-5462-4d27-9d2e-4ecc324fd19c.jpg', '1', 2003, '1912863400222957569', '1925541056051564546', '2025-05-22 21:23:29', '2025-06-21 00:05:10', '0', '<p>2133333333333333333333123</p>', '1', '1590229800633634816', 'system', NULL, 3997, '0', 0.00, 25999.00, 25999.00, 25999.00);
INSERT INTO `goods_spu` VALUES ('1925545886404988929', 'HUAWEI Mate X6 分布式玄武架构 鸿蒙大屏AI 红枫原色影像折叠旗舰手机 折叠屏', NULL, 'https://minio.ihuanxing.cn/haorong/1590229800633634816/file/dcb4b7d0-4293-4c3f-aa00-0068e8216db6.jpg,https://minio.ihuanxing.cn/haorong/1590229800633634816/file/2590cb12-279c-402d-aacd-ed171ff6189f.jpg,https://minio.ihuanxing.cn/haorong/1590229800633634816/file/64ffdbb4-0bc4-4def-a9eb-e2da1aa25c17.jpg,https://minio.ihuanxing.cn/haorong/1590229800633634816/file/f51a1ac7-d968-4473-ac6e-aad0fed31948.jpg,https://minio.ihuanxing.cn/haorong/1590229800633634816/file/797ef622-bb8d-4b67-b383-2531b46ed48e.jpg', '1', 2000, '1912863400222957569', '1912863683464306689', '2025-05-22 21:34:49', '2025-06-22 22:02:32', '0', '<p><img src=\"\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://minio.ihuanxing.cn/haorong/1590229800633634816/file/64ffdbb4-0bc4-4def-a9eb-e2da1aa25c17.jpg\" alt=\"\" data-href=\"\" style=\"\"/><img src=\"\" alt=\"\" data-href=\"\" style=\"\"/></p><p><img src=\"https://minio.ihuanxing.cn/haorong/1590229800633634816/file/f51a1ac7-d968-4473-ac6e-aad0fed31948.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p>', '1', '1590229800633634816', 'system', 'admin', 0, '0', 0.00, 0.00, 0.00, 0.00);

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

SET FOREIGN_KEY_CHECKS = 1;

