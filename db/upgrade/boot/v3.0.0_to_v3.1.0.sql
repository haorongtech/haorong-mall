ALTER TABLE `pay_config`
    ADD COLUMN `public_key_path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信支付公钥' AFTER `terminal_type`,
ADD COLUMN `public_key_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信支付公钥ID' AFTER `public_key_path`;


-- 代码生成模块sql

INSERT INTO `sys_menu` VALUES ('1986003264361078786', '代码生成', NULL, '/platform/generator', NULL, '1881217134381326338', 'carbon:ibm-cloud-code-engine', NULL, 160, '0', '2025-11-05 17:30:51', NULL, '0', '0', 'sys_key', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1986003505764245505', '数据源管理', NULL, '/datasource', NULL, '1986003264361078786', 'carbon:settings', 'gen/datasource/index', 10, '0', '2025-11-05 17:31:49', '2025-11-05 18:00:40', '0', '0', 'sys_key', 'system', 'system');
INSERT INTO `sys_menu` VALUES ('1986003578032103426', '数据源列表', 'gen:datasource:page', NULL, NULL, '1986003505764245505', NULL, NULL, 1, '1', '2025-11-05 17:32:06', NULL, '0', '0', 'sys_key', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1986003636857217026', '通过id查询数据源', 'gen:datasource:get', NULL, NULL, '1986003505764245505', NULL, NULL, 1, '1', '2025-11-05 17:32:20', NULL, '0', '0', 'sys_key', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1986003694830886913', '数据源新增', 'gen:datasource:add', NULL, NULL, '1986003505764245505', NULL, NULL, 1, '1', '2025-11-05 17:32:34', NULL, '0', '0', 'sys_key', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1986003761939750914', '数据源修改', 'gen:datasource:edit', NULL, NULL, '1986003505764245505', NULL, NULL, 1, '1', '2025-11-05 17:32:50', NULL, '0', '0', 'sys_key', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1986003823453413377', '数据源删除', 'gen:datasource:del', NULL, NULL, '1986003505764245505', NULL, NULL, 1, '1', '2025-11-05 17:33:04', NULL, '0', '0', 'sys_key', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1986010716532064257', '数据表管理', NULL, '/gen-table', NULL, '1986003264361078786', 'carbon:list', 'gen/gen-table/index', 20, '0', '2025-11-05 18:00:28', NULL, '0', '0', 'sys_key', 'system', NULL);
INSERT INTO `sys_menu` VALUES ('1986060144760565762', '数据表列表', 'gen:gen-table:page', NULL, NULL, '1986010716532064257', NULL, NULL, 1, '1', '2025-11-05 21:16:52', NULL, '0', '0', 'sys_key', 'system', NULL);

INSERT INTO `sys_role_menu` VALUES ('1986060209191280725', '1881232177484574722', '1986003264361078786', '2025-11-05 21:17:16', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280726', '1881232177484574722', '1986003505764245505', '2025-11-05 21:17:16', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280727', '1881232177484574722', '1986003578032103426', '2025-11-05 21:17:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280728', '1881232177484574722', '1986003636857217026', '2025-11-05 21:17:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280729', '1881232177484574722', '1986003694830886913', '2025-11-05 21:17:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280730', '1881232177484574722', '1986003761939750914', '2025-11-05 21:17:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280731', '1881232177484574722', '1986003823453413377', '2025-11-05 21:17:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280732', '1881232177484574722', '1986010716532064257', '2025-11-05 21:17:17', '1881232176465358849');
INSERT INTO `sys_role_menu` VALUES ('1986060209191280733', '1881232177484574722', '1986060144760565762', '2025-11-05 21:17:17', '1881232176465358849');


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
