/*
 Navicat Premium Data Transfer

 Source Server         : 个人
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : bt.weihuazhou.top:3306
 Source Schema         : security-test

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 12/07/2023 19:02:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint NOT NULL,
  `parent_id` bigint NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `enabled` bit(1) NULL DEFAULT b'1',
  `sort` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `create_by` bigint NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `update_by` bigint NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1658729760682242049, 0, '默认部门', b'1', 1, '2023-05-17 15:02:47', 1658729760682242049, '2023-05-17 15:02:47', 1658729760682242049, b'0');
INSERT INTO `sys_dept` VALUES (1658842909723631617, 0, '研发部', b'1', 2, '2023-05-17 22:32:24', 1658729760682242049, '2023-05-17 22:32:24', 1658729760682242049, b'0');
INSERT INTO `sys_dept` VALUES (1658844394368802817, 0, '运维部', b'1', 3, '2023-05-17 22:38:18', 1658729760682242049, '2023-07-09 15:45:00', 1658729760682242049, b'0');
INSERT INTO `sys_dept` VALUES (1677667851445518337, 1658729760682242049, '测试部门1-1', b'0', 1, '2023-07-08 21:16:00', 1658729760682242049, '2023-07-08 21:16:00', 1658729760682242049, b'0');
INSERT INTO `sys_dept` VALUES (1677667851445518338, 1658729760682242049, '测试部门1-2', b'1', 1, NULL, 1658729760682242049, '2023-07-09 15:12:37', 1658729760682242049, b'0');
INSERT INTO `sys_dept` VALUES (1677667851445518339, 1658842909723631617, '测试部门2-1', b'1', 3, NULL, 1658729760682242049, '2023-07-09 15:20:32', 1658729760682242049, b'0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `dict_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `dict_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '字典类型',
  `is_disabled` int NULL DEFAULT 0 COMMENT '是否禁用，0-否，1-是',
  `sort` int NULL DEFAULT 999 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `operator` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `del` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `dict_id` int NOT NULL COMMENT '字典id-dict_id',
  `sort` int NULL DEFAULT 999 COMMENT '排序',
  `dict_label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '字典标签',
  `dict_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '字典值',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_default` int NULL DEFAULT 0 COMMENT '是否默认，0-否，1-是',
  `is_disabled` int NOT NULL DEFAULT 0 COMMENT '是否禁用，0-否，1-是',
  `operator` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `del` bit(1) NULL DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL,
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父权限',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int NULL DEFAULT 999 COMMENT '排序',
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '路径',
  `enabled` bit(1) NULL DEFAULT b'1' COMMENT '是否禁用',
  `component` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `permission` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `menu_type` int NULL DEFAULT NULL COMMENT '菜单类型，1-目录，2-菜单，3-按钮',
  `description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL,
  `create_by` bigint NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `update_by` bigint NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1658729760682242047, 0, '首页', 'el-icon-s-home', 1, '/home', b'1', 'home/index', 'sys:index:index', 2, NULL, NULL, NULL, '2023-07-11 20:31:56', 1658729760682242049, b'0');
INSERT INTO `sys_menu` VALUES (1660815857409163265, 0, '系统管理', 'el-icon-s-tools', 2, '', b'1', '', '', 1, '', '2023-05-23 09:12:12', 1658729760682242049, '2023-05-23 09:12:12', 1658729760682242049, b'0');
INSERT INTO `sys_menu` VALUES (1660816306296160258, 1660815857409163265, '用户管理', 'el-icon-user-solid', 1, '/system/user', b'1', 'system/user/index', '', 2, '', '2023-05-23 09:13:59', 1658729760682242049, '2023-05-23 09:13:59', 1658729760682242049, b'0');
INSERT INTO `sys_menu` VALUES (1660816306296160259, 1660816306296160258, '查看用户', NULL, 999, NULL, b'1', NULL, 'sys:user:view', 3, NULL, '2023-05-23 09:12:12', 1658729760682242049, '2023-05-23 09:13:59', 1658729760682242049, b'0');
INSERT INTO `sys_menu` VALUES (1660816306296160260, 1660816306296160258, '新增用户', NULL, 999, NULL, b'1', NULL, 'sys:user:add', 3, NULL, '2023-05-23 09:12:12', 1658729760682242049, '2023-05-23 09:13:59', 1658729760682242049, b'0');
INSERT INTO `sys_menu` VALUES (1660816306296160261, 1660816306296160258, '编辑用户', NULL, 999, NULL, b'1', NULL, 'sys:user:edit', 3, NULL, '2023-05-23 09:12:12', 1658729760682242049, '2023-05-23 09:13:59', 1658729760682242049, b'0');
INSERT INTO `sys_menu` VALUES (1660816306296160262, 1660816306296160258, '删除用户', NULL, 999, NULL, b'1', NULL, 'sys:user:del', 3, NULL, '2023-05-23 09:12:12', 1658729760682242049, '2023-05-23 09:13:59', 1658729760682242049, b'0');
INSERT INTO `sys_menu` VALUES (1660816306296160263, 1660815857409163265, '角色管理', 'el-icon-s-platform', 2, '/system/role', b'1', 'system/role/index', NULL, 2, NULL, '2023-05-23 09:12:12', 1658729760682242049, '2023-05-23 09:13:59', 1658729760682242049, b'0');
INSERT INTO `sys_menu` VALUES (1660816306296160264, 1660816306296160263, '查看角色', NULL, 999, NULL, b'1', NULL, 'sys:role:view', 3, NULL, '2023-05-23 09:12:12', 1658729760682242049, '2023-05-23 09:13:59', 1658729760682242049, b'0');
INSERT INTO `sys_menu` VALUES (1660816306296160265, 1660816306296160263, '编辑角色', NULL, 999, NULL, b'1', NULL, 'sys:role:edit', 3, NULL, '2023-05-23 09:12:12', 1658729760682242049, '2023-05-23 09:13:59', 1658729760682242049, b'0');
INSERT INTO `sys_menu` VALUES (1660816306296160266, 1660816306296160263, '新增角色', NULL, 999, NULL, b'1', NULL, 'sys:role:add', 3, NULL, '2023-05-23 09:12:12', 1658729760682242049, '2023-05-23 09:13:59', 1658729760682242049, b'0');
INSERT INTO `sys_menu` VALUES (1660816306296160267, 1660816306296160263, '删除角色', NULL, 999, NULL, b'1', NULL, 'sys:role:del', 3, NULL, '2023-05-23 09:12:12', 1658729760682242049, '2023-05-23 09:13:59', 1658729760682242049, b'0');
INSERT INTO `sys_menu` VALUES (1660816306296160268, 1660815857409163265, '菜单管理', 'el-icon-menu', 3, '/system/menu', b'1', 'system/menu/index', NULL, 2, NULL, '2023-05-23 09:12:12', 1658729760682242049, '2023-05-23 09:13:59', 1658729760682242049, b'0');
INSERT INTO `sys_menu` VALUES (1660816306296160269, 1660816306296160268, '新增菜单', NULL, 999, NULL, b'1', NULL, 'sys:menu:add', 3, NULL, '2023-05-23 09:12:12', 1658729760682242049, '2023-05-23 09:13:59', 1658729760682242049, b'0');
INSERT INTO `sys_menu` VALUES (1660816306296160270, 1660815857409163265, '部门管理', 'el-icon-info', 999, '/system/dept', b'1', 'system/dept/index', NULL, 2, NULL, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_menu` VALUES (1678751018675167233, 1658729760682242047, '测试按钮1', NULL, 2, NULL, b'1', NULL, 'test:1', 3, NULL, '2023-07-11 21:00:07', 1658729760682242049, '2023-07-12 15:17:51', 1658729760682242049, b'1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL,
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父角色',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `enabled` bit(1) NULL DEFAULT b'1' COMMENT '是否禁用',
  `description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL,
  `create_by` bigint NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `update_by` bigint NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1658729760682242048, 0, '超级管理员', 'admin', b'1', '这是超级管理员', '2023-05-23 09:26:19', 1658729760682242049, '2023-05-23 09:26:19', 1658729760682242049, b'0');
INSERT INTO `sys_role` VALUES (1660819620651950082, NULL, '普通角色', 'user', b'1', '普通角色', '2023-05-23 09:27:09', 1658729760682242049, '2023-05-23 09:27:09', 1658729760682242049, b'0');
INSERT INTO `sys_role` VALUES (1678413185528426498, NULL, '工人', 'worker', b'1', '工人', '2023-07-10 22:37:42', 1658729760682242049, '2023-07-10 22:37:42', 1658729760682242049, b'0');
INSERT INTO `sys_role` VALUES (1678414801870622721, NULL, 'ceshi', 'ceshi 1', b'0', '', '2023-07-10 22:44:07', 1658729760682242049, '2023-07-11 12:42:32', 1658729760682242049, b'0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL,
  `role_id` bigint NOT NULL COMMENT '角色 ID',
  `menu_id` bigint NOT NULL COMMENT '权限 ID',
  `create_time` datetime NULL DEFAULT NULL,
  `create_by` bigint NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `update_by` bigint NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1658729760682242045, 1658729760682242048, 1658729760682242047, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `sys_role_menu` VALUES (1660833127124520962, 1658729760682242048, 1658729760682242047, '2023-05-23 10:20:49', 1658729760682242049, '2023-05-23 10:20:49', 1658729760682242049, b'1');
INSERT INTO `sys_role_menu` VALUES (1660833127124520963, 1658729760682242048, 1660815857409163265, '2023-05-23 10:20:49', 1658729760682242049, '2023-05-23 10:20:49', 1658729760682242049, b'1');
INSERT INTO `sys_role_menu` VALUES (1660833127124520964, 1658729760682242048, 1660816306296160258, '2023-05-23 10:20:49', 1658729760682242049, '2023-05-23 10:20:49', 1658729760682242049, b'1');
INSERT INTO `sys_role_menu` VALUES (1660842711759257601, 1658729760682242048, 1658729760682242047, '2023-05-23 10:58:54', 1658729760682242049, '2023-05-23 10:58:54', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1660842711767646209, 1658729760682242048, 1660815857409163265, '2023-05-23 10:58:54', 1658729760682242049, '2023-05-23 10:58:54', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1660842711767646210, 1658729760682242048, 1660816306296160258, '2023-05-23 10:58:54', 1658729760682242049, '2023-05-23 10:58:54', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1660842711767646211, 1658729760682242048, 1660816306296160259, '2023-05-23 10:58:54', 1658729760682242049, '2023-05-23 10:58:54', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1660842711767646212, 1658729760682242048, 1660816306296160260, '2023-05-23 10:58:54', 1658729760682242049, '2023-05-23 10:58:54', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1660842711767646213, 1658729760682242048, 1660816306296160261, '2023-05-23 10:58:54', 1658729760682242049, '2023-05-23 10:58:54', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1660842711767646214, 1658729760682242048, 1660816306296160262, '2023-05-23 10:58:54', 1658729760682242049, '2023-05-23 10:58:54', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1660842711767646215, 1658729760682242048, 1660816306296160263, '2023-05-23 10:58:54', 1658729760682242049, '2023-05-23 10:58:54', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1660842711767646216, 1658729760682242048, 1660816306296160264, '2023-05-23 10:58:54', 1658729760682242049, '2023-05-23 10:58:54', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1660842711767646217, 1658729760682242048, 1660816306296160265, '2023-05-23 10:58:54', 1658729760682242049, '2023-05-23 10:58:54', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1660842711767646218, 1658729760682242048, 1660816306296160266, '2023-05-23 10:58:54', 1658729760682242049, '2023-05-23 10:58:54', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1660842711767646219, 1658729760682242048, 1660816306296160267, '2023-05-23 10:58:54', 1658729760682242049, '2023-05-23 10:58:54', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1660842711767646220, 1658729760682242048, 1660816306296160268, '2023-05-23 10:58:54', 1658729760682242049, '2023-05-23 10:58:54', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1660842711767646221, 1658729760682242048, 1660816306296160269, '2023-05-23 10:58:54', 1658729760682242049, '2023-05-23 10:58:54', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1660842711767646222, 1658729760682242048, 1660816306296160270, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_role_menu` VALUES (1678412985388822530, 1660819620651950082, 1658729760682242047, '2023-07-10 22:36:54', 1658729760682242049, '2023-07-10 22:36:54', 1658729760682242049, b'1');
INSERT INTO `sys_role_menu` VALUES (1678414154899189762, 1678413185528426498, 1658729760682242047, '2023-07-10 22:41:33', 1658729760682242049, '2023-07-10 22:41:33', 1658729760682242049, b'1');
INSERT INTO `sys_role_menu` VALUES (1678414802462019585, 1678414801870622721, 1658729760682242047, '2023-07-10 22:44:07', 1658729760682242049, '2023-07-10 22:44:07', 1658729760682242049, b'1');
INSERT INTO `sys_role_menu` VALUES (1678415186618322946, 1678413185528426498, 1658729760682242047, '2023-07-10 22:45:39', 1658729760682242049, '2023-07-10 22:45:39', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1678624607738048513, 1678414801870622721, 1658729760682242047, '2023-07-11 12:37:48', 1658729760682242049, '2023-07-11 12:37:48', 1658729760682242049, b'1');
INSERT INTO `sys_role_menu` VALUES (1678624607738048514, 1678414801870622721, 1660815857409163265, '2023-07-11 12:37:48', 1658729760682242049, '2023-07-11 12:37:48', 1658729760682242049, b'1');
INSERT INTO `sys_role_menu` VALUES (1678624607750631426, 1678414801870622721, 1660816306296160270, '2023-07-11 12:37:48', 1658729760682242049, '2023-07-11 12:37:48', 1658729760682242049, b'1');
INSERT INTO `sys_role_menu` VALUES (1678624980540370946, 1678414801870622721, 1658729760682242047, '2023-07-11 12:39:17', 1658729760682242049, '2023-07-11 12:39:17', 1658729760682242049, b'1');
INSERT INTO `sys_role_menu` VALUES (1678625341128880130, 1678414801870622721, 1658729760682242047, '2023-07-11 12:40:43', 1658729760682242049, '2023-07-11 12:40:43', 1658729760682242049, b'1');
INSERT INTO `sys_role_menu` VALUES (1678625463468339202, 1678414801870622721, 1658729760682242047, '2023-07-11 12:41:13', 1658729760682242049, '2023-07-11 12:41:13', 1658729760682242049, b'1');
INSERT INTO `sys_role_menu` VALUES (1678625463468339203, 1678414801870622721, 1660815857409163265, '2023-07-11 12:41:13', 1658729760682242049, '2023-07-11 12:41:13', 1658729760682242049, b'1');
INSERT INTO `sys_role_menu` VALUES (1678784770043056129, 1678414801870622721, 1658729760682242047, '2023-07-11 23:14:14', 1658729760682242049, '2023-07-11 23:14:14', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1678784770043056130, 1678414801870622721, 1660815857409163265, '2023-07-11 23:14:14', 1658729760682242049, '2023-07-11 23:14:14', 1658729760682242049, b'0');
INSERT INTO `sys_role_menu` VALUES (1679038143354159105, 1660819620651950082, 1658729760682242047, '2023-07-12 16:01:03', 1658729760682242049, '2023-07-12 16:01:03', 1658729760682242049, b'1');
INSERT INTO `sys_role_menu` VALUES (1679038449525768193, 1660819620651950082, 1658729760682242047, '2023-07-12 16:02:16', 1658729760682242049, '2023-07-12 16:02:16', 1658729760682242049, b'1');
INSERT INTO `sys_role_menu` VALUES (1679039467630149634, 1660819620651950082, 1658729760682242047, '2023-07-12 16:06:19', 1658729760682242049, '2023-07-12 16:06:19', 1658729760682242049, b'0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码，加密存储',
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '注册手机号',
  `open_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `union_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '注册邮箱',
  `enabled` bit(1) NULL DEFAULT b'1',
  `create_time` datetime NULL DEFAULT NULL,
  `create_by` bigint NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `update_by` bigint NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1658729760682242049, 'admin', '超级管理员', '$2a$10$M.cAsmqLLmMwG/.K.Dtr4en9XkE1c/7VFZpgtgRyk6EcrwYoHFqx.', '18276904847', 'oXNOh4jjNCN7SnhfnhsdUlNB_bGw', NULL, 'wh@live.com', b'1', '2023-05-17 15:02:47', NULL, '2023-05-17 15:02:47', NULL, b'0');
INSERT INTO `sys_user` VALUES (1658842909723631617, 'user1', '普通用户1', '$2a$10$mTtXxlfpHXCfYkI3fE.Z2uFyPPv46NG1fNN.xmZ1xduAvoXrsVoWm', '15578701918', NULL, NULL, '2625219048@qq.com', b'1', '2023-05-17 22:32:24', 1658729760682242049, '2023-05-17 22:32:24', 1658729760682242049, b'0');
INSERT INTO `sys_user` VALUES (1658844394368802817, 'user2', '普通用户2', '$2a$10$.FUEa0YGbkS4BC7Tq8dlWuWOv3pATyT2hE6nPJclbYjbJ2pPBDroS', '13222222222', NULL, NULL, '1721675433@qq.com', b'1', '2023-05-17 22:38:18', 1658729760682242049, '2023-05-22 19:21:11', 1658729760682242049, b'0');
INSERT INTO `sys_user` VALUES (1678326654519500801, 'user04', 'user04', '$2a$10$9cA68ty8svlAaciZ3TBgYewZzb3qyanpPudF77rJKcAJx9vpmsJMO', '13566666666', NULL, NULL, '', b'1', '2023-07-10 16:53:51', 1658729760682242049, '2023-07-10 16:53:51', 1658729760682242049, b'0');
INSERT INTO `sys_user` VALUES (1678626652960370690, 'worker', 'worker3', '$2a$10$.N6rY3bEDoNqLLSwLrg6Geqqhecx/OU4IzBGhNGprpzWiCq1J5Elm', '13600000000', NULL, NULL, '', b'1', '2023-07-11 12:45:56', 1658729760682242049, '2023-07-11 12:45:56', 1658729760682242049, b'0');
INSERT INTO `sys_user` VALUES (1678972627461726210, 'work01', 'work01', '$2a$10$/BhynhfZX.LzlmlU3HCHC.NWtRF.RUwhm9U4pCIAjws9PphftTVKi', '13500001234', NULL, NULL, '', b'1', '2023-07-12 11:40:43', 1658729760682242049, '2023-07-12 15:39:23', 1658729760682242049, b'1');

-- ----------------------------
-- Table structure for sys_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_dept`;
CREATE TABLE `sys_user_dept`  (
  `id` bigint NOT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `dept_id` bigint NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `create_by` bigint NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `update_by` bigint NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_dept
-- ----------------------------
INSERT INTO `sys_user_dept` VALUES (1658729760682242040, 1658729760682242049, 1658729760682242049, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_user_dept` VALUES (1658729760682242041, 1658842909723631617, 1658842909723631617, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `sys_user_dept` VALUES (1658729760682242042, 1658844394368802817, 1658842909723631617, NULL, NULL, NULL, NULL, b'1');
INSERT INTO `sys_user_dept` VALUES (1678317647687888897, 1658844394368802817, 1658842909723631617, '2023-07-10 16:18:04', 1658729760682242049, '2023-07-10 16:18:04', 1658729760682242049, b'1');
INSERT INTO `sys_user_dept` VALUES (1678318452516106241, 1658844394368802817, 1658842909723631617, '2023-07-10 16:21:15', 1658729760682242049, '2023-07-10 16:21:15', 1658729760682242049, b'0');
INSERT INTO `sys_user_dept` VALUES (1678319304169553921, 1658842909723631617, 1658842909723631617, '2023-07-10 16:24:38', 1658729760682242049, '2023-07-10 16:24:38', 1658729760682242049, b'1');
INSERT INTO `sys_user_dept` VALUES (1678326655601631233, 1678326654519500801, 1658844394368802817, '2023-07-10 16:53:51', 1658729760682242049, '2023-07-10 16:53:51', 1658729760682242049, b'1');
INSERT INTO `sys_user_dept` VALUES (1678327282599747586, 1678326654519500801, 1658844394368802817, '2023-07-10 16:56:21', 1658729760682242049, '2023-07-10 16:56:21', 1658729760682242049, b'1');
INSERT INTO `sys_user_dept` VALUES (1678327542818562050, 1678326654519500801, 1658844394368802817, '2023-07-10 16:57:23', 1658729760682242049, '2023-07-10 16:57:23', 1658729760682242049, b'1');
INSERT INTO `sys_user_dept` VALUES (1678327576461074434, 1678326654519500801, 1658844394368802817, '2023-07-10 16:57:31', 1658729760682242049, '2023-07-10 16:57:31', 1658729760682242049, b'1');
INSERT INTO `sys_user_dept` VALUES (1678327828698128386, 1678326654519500801, 1658844394368802817, '2023-07-10 16:58:31', 1658729760682242049, '2023-07-10 16:58:31', 1658729760682242049, b'1');
INSERT INTO `sys_user_dept` VALUES (1678327901087621122, 1678326654519500801, 1658844394368802817, '2023-07-10 16:58:48', 1658729760682242049, '2023-07-10 16:58:48', 1658729760682242049, b'0');
INSERT INTO `sys_user_dept` VALUES (1678626654227050497, 1678626652960370690, 1658844394368802817, '2023-07-11 12:45:56', 1658729760682242049, '2023-07-11 12:45:56', 1658729760682242049, b'1');
INSERT INTO `sys_user_dept` VALUES (1678968895709671425, 1678626652960370690, 1658844394368802817, '2023-07-12 11:25:53', 1658729760682242049, '2023-07-12 11:25:53', 1658729760682242049, b'1');
INSERT INTO `sys_user_dept` VALUES (1678969386023809025, 1678626652960370690, 1658844394368802817, '2023-07-12 11:27:50', 1658729760682242049, '2023-07-12 11:27:50', 1658729760682242049, b'1');
INSERT INTO `sys_user_dept` VALUES (1678969532576985089, 1678626652960370690, 1658844394368802817, '2023-07-12 11:28:25', 1658729760682242049, '2023-07-12 11:28:25', 1658729760682242049, b'1');
INSERT INTO `sys_user_dept` VALUES (1678969581075722242, 1678626652960370690, 1658844394368802817, '2023-07-12 11:28:37', 1658729760682242049, '2023-07-12 11:28:37', 1658729760682242049, b'1');
INSERT INTO `sys_user_dept` VALUES (1678969873523568641, 1678626652960370690, 1658844394368802817, '2023-07-12 11:29:46', 1658729760682242049, '2023-07-12 11:29:46', 1658729760682242049, b'1');
INSERT INTO `sys_user_dept` VALUES (1678970297999716354, 1678626652960370690, 1658844394368802817, '2023-07-12 11:31:27', 1658729760682242049, '2023-07-12 11:31:27', 1658729760682242049, b'0');
INSERT INTO `sys_user_dept` VALUES (1678970337644277762, 1658842909723631617, 1658842909723631617, '2023-07-12 11:31:37', 1658729760682242049, '2023-07-12 11:31:37', 1658729760682242049, b'0');
INSERT INTO `sys_user_dept` VALUES (1678972628921344001, 1678972627461726210, 1658844394368802817, '2023-07-12 11:40:43', 1658729760682242049, '2023-07-12 11:40:43', 1658729760682242049, b'0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint NOT NULL,
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户 ID',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色 ID',
  `create_time` datetime NULL DEFAULT NULL,
  `create_by` bigint NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `update_by` bigint NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1658729760682242046, 1658729760682242049, 1658729760682242048, NULL, NULL, NULL, NULL, b'0');
INSERT INTO `sys_user_role` VALUES (1678317647092297729, 1658844394368802817, 1660819620651950082, '2023-07-10 16:18:03', 1658729760682242049, '2023-07-10 16:18:03', 1658729760682242049, b'1');
INSERT INTO `sys_user_role` VALUES (1678318395003809794, 1658844394368802817, 1660819620651950082, '2023-07-10 16:21:02', 1658729760682242049, '2023-07-10 16:21:02', 1658729760682242049, b'0');
INSERT INTO `sys_user_role` VALUES (1678319303511048194, 1658842909723631617, 1660819620651950082, '2023-07-10 16:24:38', 1658729760682242049, '2023-07-10 16:24:38', 1658729760682242049, b'1');
INSERT INTO `sys_user_role` VALUES (1678326655094120450, 1678326654519500801, 1660819620651950082, '2023-07-10 16:53:51', 1658729760682242049, '2023-07-10 16:53:51', 1658729760682242049, b'1');
INSERT INTO `sys_user_role` VALUES (1678327282012545025, 1678326654519500801, 1660819620651950082, '2023-07-10 16:56:21', 1658729760682242049, '2023-07-10 16:56:21', 1658729760682242049, b'1');
INSERT INTO `sys_user_role` VALUES (1678327542214582274, 1678326654519500801, 1660819620651950082, '2023-07-10 16:57:23', 1658729760682242049, '2023-07-10 16:57:23', 1658729760682242049, b'1');
INSERT INTO `sys_user_role` VALUES (1678327575936786434, 1678326654519500801, 1660819620651950082, '2023-07-10 16:57:31', 1658729760682242049, '2023-07-10 16:57:31', 1658729760682242049, b'1');
INSERT INTO `sys_user_role` VALUES (1678327828173840385, 1678326654519500801, 1660819620651950082, '2023-07-10 16:58:31', 1658729760682242049, '2023-07-10 16:58:31', 1658729760682242049, b'1');
INSERT INTO `sys_user_role` VALUES (1678327900500418561, 1678326654519500801, 1660819620651950082, '2023-07-10 16:58:48', 1658729760682242049, '2023-07-10 16:58:48', 1658729760682242049, b'0');
INSERT INTO `sys_user_role` VALUES (1678626653560156162, 1678626652960370690, 1678413185528426498, '2023-07-11 12:45:56', 1658729760682242049, '2023-07-11 12:45:56', 1658729760682242049, b'1');
INSERT INTO `sys_user_role` VALUES (1678968895164411906, 1678626652960370690, 1678413185528426498, '2023-07-12 11:25:53', 1658729760682242049, '2023-07-12 11:25:53', 1658729760682242049, b'1');
INSERT INTO `sys_user_role` VALUES (1678969385407246337, 1678626652960370690, 1678413185528426498, '2023-07-12 11:27:50', 1658729760682242049, '2023-07-12 11:27:50', 1658729760682242049, b'1');
INSERT INTO `sys_user_role` VALUES (1678969531910090754, 1678626652960370690, 1678413185528426498, '2023-07-12 11:28:25', 1658729760682242049, '2023-07-12 11:28:25', 1658729760682242049, b'1');
INSERT INTO `sys_user_role` VALUES (1678969580484325378, 1678626652960370690, 1678413185528426498, '2023-07-12 11:28:36', 1658729760682242049, '2023-07-12 11:28:36', 1658729760682242049, b'1');
INSERT INTO `sys_user_role` VALUES (1678969872995086337, 1678626652960370690, 1678413185528426498, '2023-07-12 11:29:46', 1658729760682242049, '2023-07-12 11:29:46', 1658729760682242049, b'1');
INSERT INTO `sys_user_role` VALUES (1678970297467039745, 1678626652960370690, 1678413185528426498, '2023-07-12 11:31:27', 1658729760682242049, '2023-07-12 11:31:27', 1658729760682242049, b'0');
INSERT INTO `sys_user_role` VALUES (1678970337115795457, 1658842909723631617, 1660819620651950082, '2023-07-12 11:31:37', 1658729760682242049, '2023-07-12 11:31:37', 1658729760682242049, b'0');
INSERT INTO `sys_user_role` VALUES (1678972628057317378, 1678972627461726210, 1678413185528426498, '2023-07-12 11:40:43', 1658729760682242049, '2023-07-12 11:40:43', 1658729760682242049, b'0');

SET FOREIGN_KEY_CHECKS = 1;
