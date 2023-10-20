/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : gx_day16

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 20/10/2023 18:11:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app01_admin
-- ----------------------------
DROP TABLE IF EXISTS `app01_admin`;
CREATE TABLE `app01_admin`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_admin
-- ----------------------------
INSERT INTO `app01_admin` VALUES (1, '派力派', '28eb517ea4252aa7776af7eea9a381aa');
INSERT INTO `app01_admin` VALUES (2, '一幺一幺', 'fce0498a4160d4a3cd7d621d9217d048');

-- ----------------------------
-- Table structure for app01_boss
-- ----------------------------
DROP TABLE IF EXISTS `app01_boss`;
CREATE TABLE `app01_boss`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int(0) NOT NULL,
  `img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_boss
-- ----------------------------
INSERT INTO `app01_boss` VALUES (1, '李小珍', 23, 'app01\\static\\img\\头像5.jpeg');
INSERT INTO `app01_boss` VALUES (2, '11213', 12, 'media\\头像5.jpeg');

-- ----------------------------
-- Table structure for app01_city
-- ----------------------------
DROP TABLE IF EXISTS `app01_city`;
CREATE TABLE `app01_city`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `count` int(0) NOT NULL,
  `img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_city
-- ----------------------------
INSERT INTO `app01_city` VALUES (2, '北京', 45112, 'city/3202002.jpg');
INSERT INTO `app01_city` VALUES (3, '湖南', 156, 'city/头像5.jpeg');
INSERT INTO `app01_city` VALUES (4, '南宁', 156, 'city/3202002_MbfyP2l.jpg');

-- ----------------------------
-- Table structure for app01_department
-- ----------------------------
DROP TABLE IF EXISTS `app01_department`;
CREATE TABLE `app01_department`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_department
-- ----------------------------
INSERT INTO `app01_department` VALUES (1, 'IT运维部');
INSERT INTO `app01_department` VALUES (2, '销售部');
INSERT INTO `app01_department` VALUES (3, '财政部');
INSERT INTO `app01_department` VALUES (4, '人力资源部');
INSERT INTO `app01_department` VALUES (9, '新互动');
INSERT INTO `app01_department` VALUES (10, '技术部');
INSERT INTO `app01_department` VALUES (11, '推广部');
INSERT INTO `app01_department` VALUES (12, '品牌部');

-- ----------------------------
-- Table structure for app01_order
-- ----------------------------
DROP TABLE IF EXISTS `app01_order`;
CREATE TABLE `app01_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `oid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `status` smallint(0) NOT NULL,
  `admin_id` bigint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app01_order_admin_id_06590413_fk_app01_admin_id`(`admin_id`) USING BTREE,
  CONSTRAINT `app01_order_admin_id_06590413_fk_app01_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `app01_admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_order
-- ----------------------------
INSERT INTO `app01_order` VALUES (1, '202310052205527985', '华硕电脑', 5600.00, 1, 1);
INSERT INTO `app01_order` VALUES (2, '202310052210093610', '飞行堡垒9', 6000.00, 1, 1);
INSERT INTO `app01_order` VALUES (3, '202310052212228601', '计算机网络（第七版）', 34.00, 2, 1);
INSERT INTO `app01_order` VALUES (4, '202310052213392587', '天玄2', 23.00, 1, 1);
INSERT INTO `app01_order` VALUES (5, '202310052225267135', '电脑主机', 2020.00, 1, 1);
INSERT INTO `app01_order` VALUES (6, '202310052226006261', '烤冷面', 35.00, 1, 1);
INSERT INTO `app01_order` VALUES (7, '202310052239206662', '笔记本', 2300.00, 1, 2);
INSERT INTO `app01_order` VALUES (8, '202310060903251002', '键盘', 200.00, 1, 1);
INSERT INTO `app01_order` VALUES (9, '202310060903504475', '麻辣香锅', 78.00, 1, 1);
INSERT INTO `app01_order` VALUES (10, '202310060904264717', '青椒肉丝', 34.00, 1, 1);
INSERT INTO `app01_order` VALUES (11, '202310060904393930', '红烧排骨', 33.00, 1, 1);
INSERT INTO `app01_order` VALUES (13, '202310061022372817', '红烧排骨111', 33.00, 2, 1);

-- ----------------------------
-- Table structure for app01_prettynum
-- ----------------------------
DROP TABLE IF EXISTS `app01_prettynum`;
CREATE TABLE `app01_prettynum`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `level` smallint(0) NOT NULL,
  `status` smallint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_prettynum
-- ----------------------------
INSERT INTO `app01_prettynum` VALUES (1, '18899991314', 200.00, 1, 2);
INSERT INTO `app01_prettynum` VALUES (2, '13899998898', 120.00, 3, 2);
INSERT INTO `app01_prettynum` VALUES (3, '13466888686', 210.00, 4, 1);

-- ----------------------------
-- Table structure for app01_task
-- ----------------------------
DROP TABLE IF EXISTS `app01_task`;
CREATE TABLE `app01_task`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `level` smallint(0) NOT NULL,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` bigint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app01_task_user_id_93daa16a_fk_app01_admin_id`(`user_id`) USING BTREE,
  CONSTRAINT `app01_task_user_id_93daa16a_fk_app01_admin_id` FOREIGN KEY (`user_id`) REFERENCES `app01_admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_task
-- ----------------------------
INSERT INTO `app01_task` VALUES (1, 1, '喝咖啡', '下楼喝咖啡', 1);

-- ----------------------------
-- Table structure for app01_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `app01_userinfo`;
CREATE TABLE `app01_userinfo`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int(0) NOT NULL,
  `account` decimal(10, 2) NOT NULL,
  `create_time` date NOT NULL,
  `gender` smallint(0) NOT NULL,
  `depart_id` bigint(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app01_userinfo_depart_id_e22e0907_fk_app01_department_id`(`depart_id`) USING BTREE,
  CONSTRAINT `app01_userinfo_depart_id_e22e0907_fk_app01_department_id` FOREIGN KEY (`depart_id`) REFERENCES `app01_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app01_userinfo
-- ----------------------------
INSERT INTO `app01_userinfo` VALUES (1, '李小兰', '123456', 23, 1200.00, '2023-10-13', 0, 3);
INSERT INTO `app01_userinfo` VALUES (2, '莫晓峰', '111111', 33, 34520.00, '2023-10-05', 1, 1);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `group_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int(0) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add department', 7, 'add_department');
INSERT INTO `auth_permission` VALUES (26, 'Can change department', 7, 'change_department');
INSERT INTO `auth_permission` VALUES (27, 'Can delete department', 7, 'delete_department');
INSERT INTO `auth_permission` VALUES (28, 'Can view department', 7, 'view_department');
INSERT INTO `auth_permission` VALUES (29, 'Can add user info', 8, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (30, 'Can change user info', 8, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (31, 'Can delete user info', 8, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (32, 'Can view user info', 8, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (33, 'Can add pretty num', 9, 'add_prettynum');
INSERT INTO `auth_permission` VALUES (34, 'Can change pretty num', 9, 'change_prettynum');
INSERT INTO `auth_permission` VALUES (35, 'Can delete pretty num', 9, 'delete_prettynum');
INSERT INTO `auth_permission` VALUES (36, 'Can view pretty num', 9, 'view_prettynum');
INSERT INTO `auth_permission` VALUES (37, 'Can add admin', 10, 'add_admin');
INSERT INTO `auth_permission` VALUES (38, 'Can change admin', 10, 'change_admin');
INSERT INTO `auth_permission` VALUES (39, 'Can delete admin', 10, 'delete_admin');
INSERT INTO `auth_permission` VALUES (40, 'Can view admin', 10, 'view_admin');
INSERT INTO `auth_permission` VALUES (41, 'Can add task', 11, 'add_task');
INSERT INTO `auth_permission` VALUES (42, 'Can change task', 11, 'change_task');
INSERT INTO `auth_permission` VALUES (43, 'Can delete task', 11, 'delete_task');
INSERT INTO `auth_permission` VALUES (44, 'Can view task', 11, 'view_task');
INSERT INTO `auth_permission` VALUES (45, 'Can add order', 12, 'add_order');
INSERT INTO `auth_permission` VALUES (46, 'Can change order', 12, 'change_order');
INSERT INTO `auth_permission` VALUES (47, 'Can delete order', 12, 'delete_order');
INSERT INTO `auth_permission` VALUES (48, 'Can view order', 12, 'view_order');
INSERT INTO `auth_permission` VALUES (49, 'Can add boss', 13, 'add_boss');
INSERT INTO `auth_permission` VALUES (50, 'Can change boss', 13, 'change_boss');
INSERT INTO `auth_permission` VALUES (51, 'Can delete boss', 13, 'delete_boss');
INSERT INTO `auth_permission` VALUES (52, 'Can view boss', 13, 'view_boss');
INSERT INTO `auth_permission` VALUES (53, 'Can add city', 14, 'add_city');
INSERT INTO `auth_permission` VALUES (54, 'Can change city', 14, 'change_city');
INSERT INTO `auth_permission` VALUES (55, 'Can delete city', 14, 'delete_city');
INSERT INTO `auth_permission` VALUES (56, 'Can view city', 14, 'view_city');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint(0) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (10, 'app01', 'admin');
INSERT INTO `django_content_type` VALUES (13, 'app01', 'boss');
INSERT INTO `django_content_type` VALUES (14, 'app01', 'city');
INSERT INTO `django_content_type` VALUES (7, 'app01', 'department');
INSERT INTO `django_content_type` VALUES (12, 'app01', 'order');
INSERT INTO `django_content_type` VALUES (9, 'app01', 'prettynum');
INSERT INTO `django_content_type` VALUES (11, 'app01', 'task');
INSERT INTO `django_content_type` VALUES (8, 'app01', 'userinfo');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2023-10-05 13:58:02.557292');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2023-10-05 13:58:02.943592');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2023-10-05 13:58:03.039997');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-10-05 13:58:03.048010');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-05 13:58:03.057012');
INSERT INTO `django_migrations` VALUES (6, 'app01', '0001_initial', '2023-10-05 13:58:03.145748');
INSERT INTO `django_migrations` VALUES (7, 'app01', '0002_alter_userinfo_create_time_alter_userinfo_depart', '2023-10-05 13:58:03.187736');
INSERT INTO `django_migrations` VALUES (8, 'app01', '0003_prettynum', '2023-10-05 13:58:03.208767');
INSERT INTO `django_migrations` VALUES (9, 'app01', '0004_alter_prettynum_price', '2023-10-05 13:58:03.244379');
INSERT INTO `django_migrations` VALUES (10, 'app01', '0005_admin', '2023-10-05 13:58:03.262038');
INSERT INTO `django_migrations` VALUES (11, 'app01', '0006_task', '2023-10-05 13:58:03.313862');
INSERT INTO `django_migrations` VALUES (12, 'app01', '0007_order', '2023-10-05 13:58:03.367652');
INSERT INTO `django_migrations` VALUES (13, 'app01', '0008_alter_order_price_alter_order_user', '2023-10-05 13:58:03.409765');
INSERT INTO `django_migrations` VALUES (14, 'app01', '0009_remove_order_user_order_admin', '2023-10-05 13:58:03.498882');
INSERT INTO `django_migrations` VALUES (15, 'contenttypes', '0002_remove_content_type_name', '2023-10-05 13:58:03.558751');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0002_alter_permission_name_max_length', '2023-10-05 13:58:03.608594');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0003_alter_user_email_max_length', '2023-10-05 13:58:03.628348');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0004_alter_user_username_opts', '2023-10-05 13:58:03.635348');
INSERT INTO `django_migrations` VALUES (19, 'auth', '0005_alter_user_last_login_null', '2023-10-05 13:58:03.677841');
INSERT INTO `django_migrations` VALUES (20, 'auth', '0006_require_contenttypes_0002', '2023-10-05 13:58:03.680836');
INSERT INTO `django_migrations` VALUES (21, 'auth', '0007_alter_validators_add_error_messages', '2023-10-05 13:58:03.689839');
INSERT INTO `django_migrations` VALUES (22, 'auth', '0008_alter_user_username_max_length', '2023-10-05 13:58:03.737194');
INSERT INTO `django_migrations` VALUES (23, 'auth', '0009_alter_user_last_name_max_length', '2023-10-05 13:58:03.785966');
INSERT INTO `django_migrations` VALUES (24, 'auth', '0010_alter_group_name_max_length', '2023-10-05 13:58:03.804972');
INSERT INTO `django_migrations` VALUES (25, 'auth', '0011_update_proxy_permissions', '2023-10-05 13:58:03.812966');
INSERT INTO `django_migrations` VALUES (26, 'auth', '0012_alter_user_first_name_max_length', '2023-10-05 13:58:03.860990');
INSERT INTO `django_migrations` VALUES (27, 'sessions', '0001_initial', '2023-10-05 13:58:03.893001');
INSERT INTO `django_migrations` VALUES (28, 'app01', '0010_boss', '2023-10-06 07:47:08.536959');
INSERT INTO `django_migrations` VALUES (29, 'app01', '0011_city', '2023-10-06 08:51:57.285906');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0yc0q2qtl2ebk907580zorf8r6sof9gn', 'eyJpbWFnZV9jb2RlIjoiVU5UQVMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qtl5I:vJ01GtzN0kWoysHHcy1ssCSiiDhh80_XQeH-dvcyFN0', '2023-10-20 08:43:20.818360');
INSERT INTO `django_session` VALUES ('aihyhlgrerwc1fhjl8dbiay5bb6a1ymg', 'eyJpbWFnZV9jb2RlIjoiSlpSWkMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwNDgwMCwiaW5mbyI6eyJpZCI6MSwibmFtZSI6Ilx1NmQzZVx1NTI5Ylx1NmQzZSJ9fQ:1qoZEg:U8obntxhhXsyM40aFxEYtQM9ccMiV-JErlcyBjco3ZE', '2023-10-13 01:02:34.973754');
INSERT INTO `django_session` VALUES ('e7167hcjp9lxwazge2gcmtt2evn19rae', 'eyJpbWFnZV9jb2RlIjoiUk5NVlciLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qog11:6dvfSCx_y8yQatB89fcno4HxeCCDYc0XwMQUloDieZA', '2023-10-06 08:17:55.194476');
INSERT INTO `django_session` VALUES ('igybtwn4a0djnaw3k5j14ovf9wp8d902', 'eyJpbWFnZV9jb2RlIjoiU1ZaTk8iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qoQdA:2Bg6umxObFqaBmDzNE3dEILQPQRpbVxog4bEoneTgJk', '2023-10-05 15:52:16.420265');
INSERT INTO `django_session` VALUES ('lgk6xo2n56mdhxnej4663a3phxq1tsas', 'eyJpbWFnZV9jb2RlIjoiUFhRRVUiLCJfc2Vzc2lvbl9leHBpcnkiOjYwNDgwMCwiaW5mbyI6eyJpZCI6MSwibmFtZSI6Ilx1NmQzZVx1NTI5Ylx1NmQzZSJ9fQ:1qoQUZ:d97JrH1MrNF_uN1a_PyeSW1rCmhSr9jRnUqEcMRj5eI', '2023-10-12 15:42:23.611425');
INSERT INTO `django_session` VALUES ('r28enfdvqu5oaf52l8ziovp85pr9yrln', 'eyJpbWFnZV9jb2RlIjoiQU9NQ0ciLCJfc2Vzc2lvbl9leHBpcnkiOjYwNDgwMCwiaW5mbyI6eyJpZCI6MSwibmFtZSI6Ilx1NmQzZVx1NTI5Ylx1NmQzZSJ9fQ:1qtlWd:wOHVsmY2mBd1ohCg5qPEKYOZCFY20QhA61Tkxrwh7R0', '2023-10-27 09:10:35.532838');
INSERT INTO `django_session` VALUES ('tp8ko360kdne4tq2crakgax6qlageooz', 'eyJpbWFnZV9jb2RlIjoiU0NKQ0MiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qtlV8:CkHGTJ5y0Ac0Cv5xyo9OyB-3wTYXcexY0O-KzMuiQGQ', '2023-10-20 09:10:02.398454');
INSERT INTO `django_session` VALUES ('ujx6ojw5xcvqfd2xe3wt5jrjijw27fps', 'eyJpbWFnZV9jb2RlIjoiWkRCV1MiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1qoOs2:w96OSRJg0evnWiinXB7yU86MRLWOvby6CkWlhgz3hQQ', '2023-10-05 13:59:30.768305');
INSERT INTO `django_session` VALUES ('xm1nrxy5p4om16t3hwfi4at504tyxlcm', 'eyJpbWFnZV9jb2RlIjoiTU9aRVMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwNDgwMCwiaW5mbyI6eyJpZCI6MSwibmFtZSI6Ilx1NmQzZVx1NTI5Ylx1NmQzZSJ9fQ:1qoQVz:1jP0hCnWTj4zCvHgKnH1sab3RtA5UYJ_nUNRpJC-gL0', '2023-10-12 15:43:51.809699');

SET FOREIGN_KEY_CHECKS = 1;
