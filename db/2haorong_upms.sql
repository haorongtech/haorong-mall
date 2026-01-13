USE haorong_upms;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
INSERT INTO `sys_dept` VALUES ('1', '0', '环兴科技有限公司', 'haorong', '17615123397', 1, '0', '2022-02-18 17:46:40', '2024-11-08 16:25:23', '1590229800633634816', '0', NULL, 'admin');
INSERT INTO `sys_dept` VALUES ('1881232178197606401', '0', '系统租户', NULL, NULL, 1, '0', '2025-01-20 14:47:58', NULL, '1881232176465358849', NULL, 'haorong', NULL);

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
INSERT INTO `sys_dict` VALUES ('1869292192170770434', 'user_sex', '用户性别', '0', '用户性别', '0', '2024-12-18 16:02:43', NULL, 'haorong', NULL);
INSERT INTO `sys_dict` VALUES ('1871032754213273601', 'goods_status', '商品状态', '0', '商品状态', '0', '2024-12-23 11:19:05', NULL, 'admin', NULL);
INSERT INTO `sys_dict` VALUES ('1871032929883308033', 'goods_specs', '商品规格类型', '0', '商品规格类型', '0', '2024-12-23 11:19:47', NULL, 'admin', NULL);
INSERT INTO `sys_dict` VALUES ('1871381190397775873', 'refund_status', '退款状态', '0', '退款状态', '0', '2024-12-24 10:23:39', '2024-12-24 10:23:44', 'haorong', 'haorong');
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
INSERT INTO `sys_dict_value` VALUES ('1825786144924233730', '1825786096614240258', '微信支付', '1', 'pay_type', '0', '微信支付', 1, '0', '2024-08-20 14:45:13', '2024-12-24 10:04:11', 'admin', 'haorong', 'success');
INSERT INTO `sys_dict_value` VALUES ('1825786177023242241', '1825786096614240258', '支付宝支付', '2', 'pay_type', '0', '支付宝支付', 2, '0', '2024-08-20 14:45:21', '2024-12-24 10:04:08', 'admin', 'haorong', 'primary');
INSERT INTO `sys_dict_value` VALUES ('1825786695783149569', '1825786632403021826', '未支付', '0', 'pay_status', '0', '未支付', 0, '0', '2024-08-20 14:47:24', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1825786736451121153', '1825786632403021826', '已支付', '1', 'pay_status', '0', '已支付', 1, '0', '2024-08-20 14:47:34', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1825787338904170497', '1825787265549987842', '普通快递', '1', 'delivery_way', '0', '普通快递', 1, '0', '2024-08-20 14:49:58', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1825787372362133505', '1825787265549987842', '上门自提', '2', 'delivery_way', '0', '上门自提', 2, '0', '2024-08-20 14:50:06', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1845468623192825858', '1845468560374734850', '微信小程序', 'WX_MA', 'user_source', '0', '微信小程序', 1, '0', '2024-10-13 22:16:22', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1845468655694487554', '1845468560374734850', 'APP', 'APP', 'user_source', '0', 'APP', 2, '0', '2024-10-13 22:16:29', '2025-05-22 21:49:47', 'admin', 'system', NULL);
INSERT INTO `sys_dict_value` VALUES ('1845468737055596546', '1845468560374734850', '普通H5', 'H5', 'user_source', '0', '普通H5', 3, '0', '2024-10-13 22:16:49', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1855529435244019713', '1855529374229479425', '菜单', '0', 'menu_type', '0', '菜单', 0, '0', '2024-11-10 16:34:26', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1855529480534114306', '1855529374229479425', '按钮', '1', 'menu_type', '0', '按钮', 1, '0', '2024-11-10 16:34:37', NULL, 'admin', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1869292244662484994', '1869292192170770434', '男', '1', 'user_sex', '0', '男', 1, '0', '2024-12-18 16:02:56', NULL, 'haorong', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1869292302673903618', '1869292192170770434', '女', '2', 'user_sex', '0', '女', 2, '0', '2024-12-18 16:03:09', NULL, 'haorong', NULL, NULL);
INSERT INTO `sys_dict_value` VALUES ('1871032820101595138', '1871032754213273601', '已下架', '0', 'goods_status', '0', '已下架', 0, '0', '2024-12-23 11:19:21', '2024-12-23 11:31:45', 'admin', 'admin', 'danger');
INSERT INTO `sys_dict_value` VALUES ('1871032850510299138', '1871032754213273601', '已上架', '1', 'goods_status', '0', '已上架', 1, '0', '2024-12-23 11:19:28', '2024-12-23 11:31:49', 'admin', 'admin', 'success');
INSERT INTO `sys_dict_value` VALUES ('1871033002629316609', '1871032929883308033', '单规格', '0', 'goods_specs', '0', '单规格', 0, '0', '2024-12-23 11:20:05', '2024-12-23 11:31:19', 'admin', 'admin', 'primary');
INSERT INTO `sys_dict_value` VALUES ('1871033035990810626', '1871032929883308033', '多规格', '1', 'goods_specs', '0', '多规格', 1, '0', '2024-12-23 11:20:13', '2024-12-23 11:31:25', 'admin', 'admin', 'success');
INSERT INTO `sys_dict_value` VALUES ('1871381497785733121', '1871381190397775873', '待审核', '1', 'refund_status', '0', '待审核', 1, '0', '2024-12-24 10:24:52', '2025-04-23 22:56:30', 'haorong', 'system', 'primary');
INSERT INTO `sys_dict_value` VALUES ('1871381692225277953', '1871381190397775873', '退款中', '5', 'refund_status', '0', '退款中', 5, '0', '2024-12-24 10:25:39', '2025-04-23 22:57:34', 'haorong', 'system', 'warning');
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
                            `request_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求数据',
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
INSERT INTO `sys_menu` VALUES ('1881217134381326338', '平台管理', NULL, '/platform', '/platform/menu', '0', 'carbon:platforms', '', 5, '0', '2025-01-20 13:48:11', '2025-05-13 21:52:24', '0', '0', 'sys_key', 'haorong', 'system');
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
INSERT INTO `sys_role` VALUES ('1881232177484574722', '系统管理员', 'ROLE_ADMIN', NULL, '2025-01-20 14:47:57', NULL, '0', '1881232176465358849', 'haorong', NULL);

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
INSERT INTO `sys_storage_config` VALUES ('1491967331820404738', 'xxxxx', 'xxxxxx', 'https://xxxxx.ihuanxing.cn', 'haorong', '4', '2022-02-11 10:48:25', '2025-05-31 21:15:07', 'file', NULL, '0', '1590229800633634816', NULL, 'system', '0');

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
INSERT INTO `sys_tenant` VALUES ('1590229800633634816', '环兴商城', NULL, '辽宁省沈阳市浑南区软件园', 'www.ihuanxing.cn', '0', NULL, '17615123397', '2024-11-01 00:00:00', '2025-12-31 00:00:00', '0', '2022-11-09 17:43:41', '2024-12-19 15:36:10', '1639458123460681730', NULL, 'haorong');
INSERT INTO `sys_tenant` VALUES ('1881232176465358849', '系统租户', NULL, '辽宁省沈阳市浑南区', 'https://www.ihuanxing.cn', '0', NULL, '17640212321', '2025-01-20 00:00:00', '2025-02-28 00:00:00', '0', '2025-01-20 14:47:57', '2025-04-23 21:29:30', '1639458123460681730', 'haorong', 'system');

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
INSERT INTO `sys_tenant_package` VALUES ('1590981945990287361', '环兴商城专业版', '商城基础版/营销功能/微信小程序', 1299.00, 2000.00, '1', '<p><br></p><p><img src=\"https://haorong.oss-cn-beijing.aliyuncs.com/haorong/ea86c408-21eb-47af-81df-6367cb398075.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p>', 'app_base,app_market,app_wechat', '2022-11-11 16:17:10', '2024-11-07 19:39:40', '0', NULL, 'admin');
INSERT INTO `sys_tenant_package` VALUES ('1591735271929356289', '环兴商城基础版', '商城基础功能', 888.00, 999.00, '1', '<p>阿达打撒 阿斯顿撒打算</p>', 'app_base,app_wechat', '2022-11-13 18:10:36', '2022-11-13 18:10:36', '0', NULL, NULL);
INSERT INTO `sys_tenant_package` VALUES ('1639458123460681730', '环兴商城旗舰版', '环兴商城旗舰版', 0.01, 0.01, '1', '<p><br></p><p><img src=\"https://haorong.oss-cn-beijing.aliyuncs.com/haorong/72ca917c-9cc3-4452-9aa7-93d99196782e.jpg\" alt=\"\" data-href=\"\" style=\"\"/></p>', 'app_base,app_market,app_alipay,app_wechat', '2022-11-11 16:17:10', '2022-11-13 18:11:39', '0', NULL, NULL);

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
                             `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号类型：0.系统主账户（管理全部店铺）；',
                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '806@163.com', '环兴', 'https://haorong.oss-cn-beijing.aliyuncs.com/haorong/278a943b-52ac-4f6b-a6b6-506cc67f8d0a.jpg', '2', '17615123399', '0', '2022-05-20 17:33:24', '2025-04-09 22:18:24', '1590229800633634816', '0', NULL, 'admin', '0');
INSERT INTO `sys_user` VALUES ('1881232178902249473', 'system', 'e10adc3949ba59abbe56e057f20f883e', NULL, '111', 'https://minio.ihuanxing.cn/haorong/file/eece8d88-c9a5-4d7f-b6b8-cf7c82d3c34a.png', '1881232178197606401', '17640212321', '0', '2025-01-20 14:47:58', '2025-04-13 05:01:21', '1881232176465358849', '0', 'haorong', 'system', '0');

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

SET FOREIGN_KEY_CHECKS = 1;
