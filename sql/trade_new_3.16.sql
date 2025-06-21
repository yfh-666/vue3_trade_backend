/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : localhost:3306
 Source Schema         : trade

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : 65001

 Date: 16/03/2025 14:25:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for barrage
-- ----------------------------
DROP TABLE IF EXISTS `barrage`;
CREATE TABLE `barrage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '弹幕文本',
  `userAvatar` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户头像',
  `userId` bigint(20) NOT NULL COMMENT '用户id',
  `isSelected` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否精选（默认0，精选为1）',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1890696292486328323 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of barrage
-- ----------------------------
INSERT INTO `barrage` VALUES (1884833990411280386, '愿你在蛇年里，事业顺利，家庭幸福，心想事成！', 'https://www.code-nav.cn/logo.png', 6, 0, '2025-01-30 13:20:16', '2025-01-30 13:20:16', 0);
INSERT INTO `barrage` VALUES (1884834015627436033, '愿蛇年为你带来无尽的财富和好运，生活如蛇般灵动顺遂！', 'https://www.code-nav.cn/logo.png', 6, 0, '2025-01-30 13:20:22', '2025-01-30 13:20:22', 0);
INSERT INTO `barrage` VALUES (1884834041141387266, '愿你在新的一年里，财运亨通，事业蒸蒸日上！', 'https://www.code-nav.cn/logo.png', 6, 0, '2025-01-30 13:20:28', '2025-01-30 13:20:28', 0);
INSERT INTO `barrage` VALUES (1884834078550384641, '愿你在新的一年里，事业有成，生活美满，步步高升！', 'https://www.code-nav.cn/logo.png', 6, 0, '2025-01-30 13:20:37', '2025-01-30 13:20:37', 0);
INSERT INTO `barrage` VALUES (1884834107914706945, '愿幸福如蛇般紧紧缠绕你，生活充满甜蜜与温馨！', 'https://www.code-nav.cn/logo.png', 6, 0, '2025-01-30 13:20:44', '2025-01-30 13:20:44', 0);
INSERT INTO `barrage` VALUES (1884834137237086210, '愿你在新的一年里，生活充满灵动与美好，幸福常伴左右！', 'https://www.code-nav.cn/logo.png', 6, 0, '2025-01-30 13:20:51', '2025-01-30 13:20:51', 0);
INSERT INTO `barrage` VALUES (1890696292486328322, '愿你在新的一年里，生活充满灵动与美好，', 'https://www.code-nav.cn/logo.png', 6, 0, '2025-02-15 17:34:58', '2025-02-15 17:34:58', 0);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论 ID',
  `postId` bigint(20) NOT NULL COMMENT '面经帖子 ID',
  `userId` bigint(20) NOT NULL COMMENT '用户 ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `parentId` bigint(20) NULL DEFAULT NULL COMMENT '父评论 ID，支持多级嵌套回复',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `ancestorId` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_questionId`(`postId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1890696721316163587 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1887035269837451265, 1885946066089156610, 6, '你好', NULL, '2025-02-05 15:07:22', '2025-02-05 17:03:22', 1, NULL);
INSERT INTO `comment` VALUES (1887035498150195202, 1885946066089156610, 6, '我是程序员小白条', NULL, '2025-02-05 15:08:16', '2025-02-05 15:33:10', 0, NULL);
INSERT INTO `comment` VALUES (1887039525038551041, 1885946066089156610, 6, '我是', NULL, '2025-02-05 15:24:16', '2025-02-05 15:33:12', 0, NULL);
INSERT INTO `comment` VALUES (1887049977609023490, 1885946066089156610, 6, '的', 1887039525038551041, '2025-02-05 16:05:49', '2025-02-05 16:05:49', 0, 1887039525038551041);
INSERT INTO `comment` VALUES (1887050056956866561, 1885946066089156610, 6, '你好', 1887039525038551041, '2025-02-05 16:06:07', '2025-02-05 16:06:07', 0, 1887039525038551041);
INSERT INTO `comment` VALUES (1887050896794939394, 1885946066089156610, 6, '狗屎', 1887039525038551041, '2025-02-05 16:09:28', '2025-02-05 16:09:28', 0, 1887039525038551041);
INSERT INTO `comment` VALUES (1887052235272843265, 1885946066089156610, 6, '23', 1887039525038551041, '2025-02-05 16:14:47', '2025-02-05 16:14:47', 0, 1887039525038551041);
INSERT INTO `comment` VALUES (1887063382281646081, 1885946066089156610, 6, '阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就阿斯加德按季度就', NULL, '2025-02-05 16:59:04', '2025-02-05 16:59:04', 0, NULL);
INSERT INTO `comment` VALUES (1887064425367302146, 1885946066089156610, 6, '我是测试', 1887035269837451265, '2025-02-05 17:03:13', '2025-02-05 17:03:13', 0, 1887035269837451265);
INSERT INTO `comment` VALUES (1887064859033169921, 1885946066089156610, 6, ' 是我是', NULL, '2025-02-05 17:04:57', '2025-02-05 17:04:57', 0, NULL);
INSERT INTO `comment` VALUES (1887064863223279617, 1885946066089156610, 6, '我是', NULL, '2025-02-05 17:04:58', '2025-02-05 17:05:19', 1, NULL);
INSERT INTO `comment` VALUES (1887064866536779777, 1885946066089156610, 6, '我是', NULL, '2025-02-05 17:04:58', '2025-02-05 17:05:20', 1, NULL);
INSERT INTO `comment` VALUES (1887064875789414402, 1885946066089156610, 6, '我', NULL, '2025-02-05 17:05:01', '2025-02-05 17:05:17', 1, NULL);
INSERT INTO `comment` VALUES (1887064879367155714, 1885946066089156610, 6, '我', NULL, '2025-02-05 17:05:01', '2025-02-05 17:05:18', 1, NULL);
INSERT INTO `comment` VALUES (1887064882496106498, 1885946066089156610, 6, '我', NULL, '2025-02-05 17:05:02', '2025-02-05 17:05:15', 1, NULL);
INSERT INTO `comment` VALUES (1887066944608890881, 1885946066089156610, 1, '你好，小白条', 1887064859033169921, '2025-02-05 17:13:14', '2025-02-05 17:13:14', 0, 1887064859033169921);
INSERT INTO `comment` VALUES (1887068408165134337, 1885946066089156610, 6, '32', 1887064859033169921, '2025-02-05 17:19:03', '2025-02-05 17:19:03', 0, 1887064859033169921);
INSERT INTO `comment` VALUES (1887070915905941506, 1885946066089156610, 1, '我是测试用户1', NULL, '2025-02-05 17:29:01', '2025-02-05 17:29:01', 0, NULL);
INSERT INTO `comment` VALUES (1890696721316163586, 1885946066089156610, 6, '测试', NULL, '2025-02-15 17:36:40', '2025-02-15 17:37:04', 1, NULL);

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品 ID',
  `commodityName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `commodityDescription` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品简介',
  `commodityAvatar` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品封面图',
  `degree` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品新旧程度（例如 9成新）',
  `commodityTypeId` bigint(20) NULL DEFAULT NULL COMMENT '商品分类 ID',
  `adminId` bigint(20) NOT NULL COMMENT '管理员 ID （某人创建该商品）',
  `isListed` tinyint(4) NULL DEFAULT 0 COMMENT '是否上架（默认0未上架，1已上架）',
  `commodityInventory` int(10) NULL DEFAULT 0 COMMENT '商品数量（默认0）',
  `price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `viewNum` int(11) NULL DEFAULT 0 COMMENT '商品浏览量',
  `favourNum` int(11) NULL DEFAULT 0 COMMENT '商品收藏量',
  `createTime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_index`(`commodityTypeId`) USING BTREE,
  INDEX `name_index`(`commodityName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1900439195794169858 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES (1899338652573212673, '方便面', '袋装方便面，未拆封，还剩一个月过期', 'https://pic.yupi.icu/5563/202503111351130.webp', '九九新', 1900420859211513857, 5, 1, 8, 1.90, 32, 0, '2025-03-11 13:56:37', '2025-03-16 14:15:14', 0);
INSERT INTO `commodity` VALUES (1899354293518704641, '苹果蓝牙耳机', '苹果蓝牙耳机，一只耳机有电流声', 'https://pic.yupi.icu/5563/202503111449740.webp', '八五新', 1900420755679313922, 5, 1, 1, 69.90, 6, 0, '2025-03-11 14:58:46', '2025-03-15 13:28:05', 0);
INSERT INTO `commodity` VALUES (1899354610842968065, '雷蛇键盘', '雷蛇键盘，小键盘的数字有几个失效', 'https://pic.yupi.icu/5563/202503111449741.jpg', '八成新', 1900420755679313922, 5, 1, 0, 159.00, 4, 0, '2025-03-11 15:00:02', '2025-03-15 13:27:36', 0);
INSERT INTO `commodity` VALUES (1899354818712674306, '小米笔记本电脑', '小米笔记本电脑，想换其他电脑，所以出掉，刚拆封2天', 'https://pic.yupi.icu/5563/202503111449742.jpg', '九五新', 1900420755679313922, 5, 1, 1, 3599.00, 0, 0, '2025-03-11 15:00:51', '2025-03-14 14:24:36', 0);
INSERT INTO `commodity` VALUES (1899355409304231938, '蝰蛇鼠标', '蝰蛇鼠标，鼠标滚轮偶尔会失灵', 'https://pic.yupi.icu/5563/202503111449743.webp', '八五新', 1900420755679313922, 5, 1, 0, 49.90, 5, 0, '2025-03-11 15:03:12', '2025-03-14 14:24:40', 0);
INSERT INTO `commodity` VALUES (1899357577943949313, '徕芬吹风机', '徕芬吹风机，九五新，便宜卖', 'https://pic.yupi.icu/5563/202503111511083.jpeg', '九五新', 1900420942338424834, 5, 1, 1, 99.90, 3, 0, '2025-03-11 15:11:49', '2025-03-14 14:24:42', 0);
INSERT INTO `commodity` VALUES (1900435059749052418, '枕头套', '枕头套，全新，两个', 'https://pic.yupi.icu/5563/202503141432610.jpg', '全新', 1900420942338424834, 5, 0, 2, 9.90, 0, 0, '2025-03-14 14:33:21', '2025-03-14 14:33:21', 0);
INSERT INTO `commodity` VALUES (1900435228624314369, '红米手机', '红米手机，手机电池健康度81%', 'https://pic.yupi.icu/5563/202503141432606.webp', '8成新', 1900420755679313922, 5, 0, 1, 899.00, 0, 0, '2025-03-14 14:34:01', '2025-03-14 14:34:01', 0);
INSERT INTO `commodity` VALUES (1900435410577416193, '阿迪达斯 T 恤', '阿迪达斯 T 恤', 'https://pic.yupi.icu/5563/202503141432607.webp', '九成新', 1900420901032919041, 5, 1, 1, 49.90, 0, 0, '2025-03-14 14:34:44', '2025-03-14 14:34:44', 0);
INSERT INTO `commodity` VALUES (1900436183562477569, '牙刷', '儿童牙刷四只，略有破损', 'https://pic.yupi.icu/5563/202503141432609.webp', '九成新', 1900420942338424834, 5, 1, 4, 29.90, 0, 0, '2025-03-14 14:37:49', '2025-03-14 14:37:49', 0);
INSERT INTO `commodity` VALUES (1900439195794169857, '黄金手链', '黄金手链，略有瑕疵', 'https://pic.yupi.icu/5563/202503141432608.webp', '九五新', 1900438197696618497, 5, 1, 1, 2399.00, 0, 0, '2025-03-14 14:49:47', '2025-03-14 14:49:47', 0);

-- ----------------------------
-- Table structure for commodity_order
-- ----------------------------
DROP TABLE IF EXISTS `commodity_order`;
CREATE TABLE `commodity_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单 ID',
  `userId` bigint(20) NOT NULL COMMENT '用户 ID',
  `commodityId` bigint(20) NOT NULL COMMENT '商品 ID',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `buyNumber` int(10) NULL DEFAULT NULL COMMENT '购买数量',
  `paymentAmount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总支付金额',
  `payStatus` tinyint(4) NULL DEFAULT 0 COMMENT '0-未支付 1-已支付',
  `createTime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `payId`(`userId`, `commodityId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1900058394921512962 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity_order
-- ----------------------------
INSERT INTO `commodity_order` VALUES (1899710614612967425, 6, 1899338652573212673, '两包方便面', 2, 3.80, 1, '2025-03-12 14:34:40', '2025-03-12 14:34:40', 0);
INSERT INTO `commodity_order` VALUES (1899723231129653249, 6, 1899354610842968065, '雷蛇键盘', 1, 159.00, 1, '2025-03-12 15:24:48', '2025-03-13 13:11:51', 0);
INSERT INTO `commodity_order` VALUES (1899731396202201090, 6, 1899355409304231938, '一个蝰蛇鼠标', 1, 49.90, 1, '2025-03-12 15:57:14', '2025-03-12 15:57:14', 0);
INSERT INTO `commodity_order` VALUES (1900058394921512961, 6, 1899357577943949313, '', 1, 99.90, 0, '2025-03-13 13:36:37', '2025-03-13 14:16:44', 1);

-- ----------------------------
-- Table structure for commodity_score
-- ----------------------------
DROP TABLE IF EXISTS `commodity_score`;
CREATE TABLE `commodity_score`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品评分 ID',
  `commodityId` bigint(20) NOT NULL COMMENT '商品 ID',
  `userId` bigint(20) NOT NULL COMMENT '用户 ID',
  `score` int(10) NOT NULL COMMENT '评分（0-5，星级评分）',
  `createTime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间\r\n',
  `updateTime` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `scoreId`(`commodityId`, `userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1900781056169742339 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity_score
-- ----------------------------
INSERT INTO `commodity_score` VALUES (1900068840785305602, 1899338652573212673, 6, 4, '2025-03-13 14:18:07', '2025-03-13 14:18:43', 0);
INSERT INTO `commodity_score` VALUES (1900079699242676226, 1899354293518704641, 6, 5, '2025-03-13 15:01:16', '2025-03-13 15:01:16', 0);
INSERT INTO `commodity_score` VALUES (1900780909805309954, 1899354610842968065, 6, 3, '2025-03-15 13:27:38', '2025-03-15 13:27:38', 0);
INSERT INTO `commodity_score` VALUES (1900781033004601346, 1899354293518704641, 1888851998200721410, 3, '2025-03-15 13:28:07', '2025-03-15 13:28:07', 0);
INSERT INTO `commodity_score` VALUES (1900781056169742338, 1899338652573212673, 1888851998200721410, 4, '2025-03-15 13:28:13', '2025-03-15 13:28:13', 0);

-- ----------------------------
-- Table structure for commodity_type
-- ----------------------------
DROP TABLE IF EXISTS `commodity_type`;
CREATE TABLE `commodity_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品分类 ID',
  `typeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品类别名称',
  `createTime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1900438197696618498 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity_type
-- ----------------------------
INSERT INTO `commodity_type` VALUES (1900420755679313922, '数码产品', '2025-03-14 13:36:30', '2025-03-14 13:38:00', 0);
INSERT INTO `commodity_type` VALUES (1900420859211513857, '食物', '2025-03-14 13:36:55', '2025-03-14 13:36:55', 0);
INSERT INTO `commodity_type` VALUES (1900420901032919041, '服装', '2025-03-14 13:37:05', '2025-03-14 13:37:05', 0);
INSERT INTO `commodity_type` VALUES (1900420942338424834, '生活用品', '2025-03-14 13:37:15', '2025-03-14 14:08:46', 0);
INSERT INTO `commodity_type` VALUES (1900438197696618497, '珠宝首饰', '2025-03-14 14:45:49', '2025-03-14 14:45:49', 0);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `noticeTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `noticeContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告内容',
  `noticeAdminId` bigint(20) NOT NULL COMMENT '创建人id（管理员）',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '23232322323', '233232323', 5, '2025-01-28 18:35:43', '2025-02-15 17:43:13', 0);
INSERT INTO `notice` VALUES (2, '测试内容23', '测试内容2323', 5, '2025-01-28 18:35:52', '2025-01-28 18:35:52', 0);
INSERT INTO `notice` VALUES (3, '23', '232', 5, '2025-02-15 17:43:07', '2025-02-15 17:43:16', 1);

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `tags` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签列表（json 数组）',
  `thumbNum` int(11) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `favourNum` int(11) NOT NULL DEFAULT 0 COMMENT '收藏数',
  `userId` bigint(20) NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1900447702241120258 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '帖子' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1885946066089156610, '个啊', '测试赛23测试赛23测试赛23测试赛23测试赛23测试赛23测试赛23测试赛23测试赛23测试赛23测试赛23测试赛23测试赛23123', '[\"Python\",\"Java\",\"Go\"]', 1, 1, 6, '2025-02-02 14:59:16', '2025-02-15 17:46:37', 0);
INSERT INTO `post` VALUES (1885961164446900226, '测试内容1', '2323', '[\"Python\",\"Java\"]', 0, 1, 6, '2025-02-02 15:59:15', '2025-02-15 16:55:13', 0);
INSERT INTO `post` VALUES (1885965652691918849, '测', '啊大阿达', '[\"Go\"]', 0, 1, 5, '2025-02-02 16:17:05', '2025-02-06 15:32:47', 0);
INSERT INTO `post` VALUES (1885965697017323521, '23', '123213', '[\"213213\"]', 0, 1, 5, '2025-02-02 16:17:16', '2025-02-06 15:32:49', 0);
INSERT INTO `post` VALUES (1885965717217091586, '21312', '32132132132', '[\"312312312321\"]', 0, 0, 5, '2025-02-02 16:17:21', '2025-02-02 16:37:45', 1);
INSERT INTO `post` VALUES (1885965741871210498, '测定啊', '瓦瓦', '[\"啊问饿啊\"]', 0, 1, 5, '2025-02-02 16:17:27', '2025-02-06 15:32:52', 0);
INSERT INTO `post` VALUES (1887404118676049921, '你好', '23 ', '[\"测试\"]', 0, 1, 6, '2025-02-06 15:33:02', '2025-02-15 17:36:10', 0);
INSERT INTO `post` VALUES (1890696577141157890, '测试内容', '## 1213\n``13``', '[\"测试内容\"]', 0, 0, 6, '2025-02-15 17:36:06', '2025-02-15 17:36:06', 0);
INSERT INTO `post` VALUES (1890699195636756482, '231', '213213', '[\"213\"]', 0, 0, 5, '2025-02-15 17:46:30', '2025-02-15 17:46:34', 1);
INSERT INTO `post` VALUES (1900446788394553346, '如何在二手市场上成功交易你的物品', '在二手市场上交易物品是一项需要一定技巧的任务。首先，确保你的物品描述清晰准确，包括物品的品牌、型号、颜色等信息。其次，定价要合理，可以参考市场上类似物品的价格进行比较。另外，及时回复买家的消息，保持良好的沟通和信任。最后，选择安全可靠的交易方式，如面交或支付宝担保交易，确保交易的安全顺利进行。', '[\"二手市场\",\"交易\",\"商品\"]', 0, 0, 6, '2025-03-14 15:19:57', '2025-03-14 15:19:57', 0);
INSERT INTO `post` VALUES (1900446861329305602, '二手手机交易攻略：如何选择最适合你的手机', '在二手手机交易中，选择一款适合自己的手机非常重要。首先，要确定自己的需求，包括使用频率、功能需求等。其次，要对手机的品牌、型号有一定了解，确保选择的手机性能稳定、质量可靠。另外，要注意手机的外观和功能是否完好，避免购买到有质量问题的手机。最后，可以在多个二手平台上比较价格和条件，选择最适合自己的手机进行交易。', '[\"手机\",\"攻略\",\"选择技巧\"]', 0, 0, 6, '2025-03-14 15:20:14', '2025-03-14 15:20:14', 0);
INSERT INTO `post` VALUES (1900446936772251650, '二手车交易攻略：如何避免购买到问题车', '购买二手车是一项需要谨慎的任务，为了避免购买到问题车，可以采取一些策略。首先，要对车辆的历史记录进行核实，包括车辆年限、事故记录等。其次，要对车辆的外观和内部情况进行仔细检查，确保车辆没有明显的损坏或磨损。另外，可以请专业人士进行检测和评估，确保车辆的性能和质量符合标准。最后，选择信誉好的二手车交易平台或经销商进行交易，确保交易的安全和合法性。', '[\"二手车\",\"交易攻略\",\"性价比\"]', 0, 0, 6, '2025-03-14 15:20:32', '2025-03-14 15:20:32', 0);
INSERT INTO `post` VALUES (1900447702241120257, '珠宝首饰交易攻略：如何购买和出售珠宝首饰', '确认珠宝首饰的真实性：在购买或出售珠宝首饰之前，务必确保其真实性。可以要求卖家提供相关证书或鉴定报告，验证珠宝的材质、切工、重量等信息。如果是购买二手珠宝首饰，最好选择信誉好的珠宝店或平台进行交易，避免购买到假货或劣质产品。\n\n了解市场行情和价格走势：在进行珠宝首饰交易时，要了解市场行情和价格走势，以便合理定价和评估珠宝的价值。可以参考珠宝市场的行情报告或价格指导，也可以咨询专业珠宝评估师的意见，确保自己的交易得以公正和合理进行。\n\n注意珠宝首饰的保存和保养：在购买珠宝首饰后，要注意其保存和保养，以保持其光泽和价值。珠宝首饰应避免接触化学物质、高温和湿度，定期清洁和保养，可以延长其使用寿命和保持其外观美观。\n\n选择合适的交易方式：珠宝首饰交易可以选择线上或线下的方式进行。线上交易可以选择信誉好的珠宝交易平台或电商平台，提供安全的支付和物流服务；线下交易可以选择专业的珠宝店或珠宝展会进行交易，可以实地查看和比较珠宝首饰的质量和款式。\n\n注意交易细节和条款：在进行珠宝首饰交易时，务必注意交易细节和条款，包括退换货政策、保修期限、交易方式等。在签订交易合同前，仔细阅读合同条款，确保自己的权益得到保障，避免发生纠纷或误会。', '[\"珠宝首饰\",\"交易攻略\",\"二手\"]', 0, 0, 6, '2025-03-14 15:23:35', '2025-03-14 15:23:35', 0);

-- ----------------------------
-- Table structure for post_favour
-- ----------------------------
DROP TABLE IF EXISTS `post_favour`;
CREATE TABLE `post_favour`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `postId` bigint(20) NOT NULL COMMENT '帖子 id',
  `userId` bigint(20) NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_postId`(`postId`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 184 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帖子收藏' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of post_favour
-- ----------------------------
INSERT INTO `post_favour` VALUES (166, 1885965652691918849, 6, '2025-02-06 15:32:47', '2025-02-06 15:32:47');
INSERT INTO `post_favour` VALUES (168, 1885965697017323521, 6, '2025-02-06 15:32:49', '2025-02-06 15:32:49');
INSERT INTO `post_favour` VALUES (170, 1885965741871210498, 6, '2025-02-06 15:32:52', '2025-02-06 15:32:52');
INSERT INTO `post_favour` VALUES (179, 1885961164446900226, 6, '2025-02-15 16:55:13', '2025-02-15 16:55:13');
INSERT INTO `post_favour` VALUES (180, 1887404118676049921, 6, '2025-02-15 17:36:10', '2025-02-15 17:36:10');
INSERT INTO `post_favour` VALUES (183, 1885946066089156610, 6, '2025-02-15 17:42:06', '2025-02-15 17:42:06');

-- ----------------------------
-- Table structure for post_thumb
-- ----------------------------
DROP TABLE IF EXISTS `post_thumb`;
CREATE TABLE `post_thumb`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `postId` bigint(20) NOT NULL COMMENT '帖子 id',
  `userId` bigint(20) NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_postId`(`postId`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 178 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帖子点赞' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of post_thumb
-- ----------------------------
INSERT INTO `post_thumb` VALUES (177, 1885946066089156610, 6, '2025-02-15 17:42:06', '2025-02-15 17:42:06');

-- ----------------------------
-- Table structure for private_message
-- ----------------------------
DROP TABLE IF EXISTS `private_message`;
CREATE TABLE `private_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '消息 ID',
  `senderId` bigint(20) NOT NULL COMMENT '发送者 ID',
  `recipientId` bigint(20) NOT NULL COMMENT '接收者 ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '消息内容(UTF8MB4 支持Emoji表情)',
  `alreadyRead` tinyint(4) NULL DEFAULT 0 COMMENT '0-未阅读 1-已阅读',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息发送类型（用户发送还是管理员发送,user Or admin)枚举',
  `isRecalled` tinyint(4) NULL DEFAULT 0 COMMENT '是否撤回  0-未撤回 1-已撤回',
  `createTime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1901154100096696323 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of private_message
-- ----------------------------
INSERT INTO `private_message` VALUES (1900788397283868674, 6, 5, '你好1', 0, 'user', 0, '2025-03-15 13:57:23', '2025-03-15 13:58:30', 0);
INSERT INTO `private_message` VALUES (1901152801011695617, 5, 6, '你好2', 0, 'admin', 0, '2025-03-16 14:05:24', '2025-03-16 14:05:24', 0);
INSERT INTO `private_message` VALUES (1901153055748554754, 6, 5, '你上架的方便面商品能便宜一点吗\n', 0, 'user', 0, '2025-03-16 14:06:24', '2025-03-16 14:06:24', 0);
INSERT INTO `private_message` VALUES (1901154100096696322, 5, 6, '抱歉，已经是最低价了哦，亲😀', 0, 'admin', 0, '2025-03-16 14:10:33', '2025-03-16 14:10:33', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `unionId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信开放平台id',
  `mpOpenId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号openId',
  `userName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `userProfile` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户简介',
  `userRole` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `userPhone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `aiRemainNumber` int(11) NULL DEFAULT 0 COMMENT '用户 AI 剩余可使用次数',
  `balance` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '用户余额（仅AI接口调用）',
  `editTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '编辑时间',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unionId`(`unionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1890695308817182723 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user1', '01059c753223cd004dd34f0e5e140ba2', 'unionId1', 'mpOpenId1', 'user1', 'https://www.code-nav.cn/logo.png', '喜欢编程的小白', 'user', NULL, 0, 0.00, '2025-01-28 18:31:53', '2025-01-28 18:31:53', '2025-02-08 15:41:28', 0);
INSERT INTO `user` VALUES (2, 'user2', '01059c753223cd004dd34f0e5e140ba2', 'unionId2', 'mpOpenId2', 'user2', 'https://www.code-nav.cn/logo.png', '全栈开发工程师', 'user', NULL, 0, 0.00, '2025-01-28 18:31:53', '2025-01-28 18:31:53', '2025-01-28 18:31:53', 0);
INSERT INTO `user` VALUES (3, 'user3', '01059c753223cd004dd34f0e5e140ba2', 'unionId3', 'mpOpenId3', 'user3', 'https://www.code-nav.cn/logo.png', '前端爱好者', 'user', NULL, 0, 0.00, '2025-01-28 18:31:53', '2025-01-28 18:31:53', '2025-01-28 18:31:53', 0);
INSERT INTO `user` VALUES (4, 'user4', '01059c753223cd004dd34f0e5e140ba2', 'unionId4', 'mpOpenId4', '程序员小美', 'https://www.code-nav.cn/logo.png', '后端开发工程师', 'admin', NULL, 0, 0.00, '2025-01-28 18:31:53', '2025-01-28 18:31:53', '2025-03-16 13:46:53', 0);
INSERT INTO `user` VALUES (5, 'xiaobai', '01059c753223cd004dd34f0e5e140ba2', NULL, NULL, '程序员小白', 'https://www.code-nav.cn/logo.png', '系统管理员', 'admin', '13812345678', 0, 0.00, '2025-01-28 18:31:53', '2025-01-28 18:31:53', '2025-02-27 15:07:53', 0);
INSERT INTO `user` VALUES (6, 'xiaobaitiao', '01059c753223cd004dd34f0e5e140ba2', NULL, NULL, '程序员小白条1', 'https://img1.baidu.com/it/u=3598104138,3632108415&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=800', 'Java开发工程师2', 'user', '13812345678', 8, 41.00, '2025-01-28 18:31:53', '2025-01-28 18:31:53', '2025-03-15 13:03:38', 0);
INSERT INTO `user` VALUES (1888851998200721410, 'xiaobaitiao123', '01059c753223cd004dd34f0e5e140ba2', NULL, NULL, '小白条的小助手', 'https://www.code-nav.cn/logo.png', '我是小助手', 'user', '13812345678', 0, 0.00, '2025-02-10 15:26:24', '2025-02-10 15:26:24', '2025-02-21 16:25:52', 0);
INSERT INTO `user` VALUES (1890695308817182722, 'xiaobaitiao1234', '01059c753223cd004dd34f0e5e140ba2', NULL, NULL, NULL, NULL, NULL, 'user', NULL, 0, 0.00, '2025-02-15 17:31:03', '2025-02-15 17:31:03', '2025-02-15 17:42:52', 1);

-- ----------------------------
-- Table structure for user_ai_message
-- ----------------------------
DROP TABLE IF EXISTS `user_ai_message`;
CREATE TABLE `user_ai_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userInputText` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户输入',
  `aiGenerateText` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'AI 生成结果',
  `userId` bigint(20) NOT NULL COMMENT '用户ID',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1901156016193175555 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_ai_message
-- ----------------------------
INSERT INTO `user_ai_message` VALUES (1887795958008999937, 'Java 怎么学习', '2323133', 5, '2025-02-07 17:30:04', '2025-02-08 15:58:48', 0);
INSERT INTO `user_ai_message` VALUES (1887806705665454082, 'Java 怎么学习，简短介绍即可', '', 6, '2025-02-07 18:12:47', '2025-02-07 18:12:47', 0);
INSERT INTO `user_ai_message` VALUES (1887806865468436481, 'Java 怎么学习，简短介绍即可', '', 6, '2025-02-07 18:13:25', '2025-02-07 18:13:25', 0);
INSERT INTO `user_ai_message` VALUES (1887808007292317697, 'Java 怎么学习，简短介绍即可', '学习', 6, '2025-02-07 18:17:57', '2025-02-07 18:17:57', 0);
INSERT INTO `user_ai_message` VALUES (1887808105250287618, 'Java 怎么学习', '学习', 6, '2025-02-07 18:18:20', '2025-02-07 18:18:20', 0);
INSERT INTO `user_ai_message` VALUES (1888114368764936193, 'Java 怎么学习', '学习Java是一个循序渐进的过程，需要掌握基础知识、进行实践练习、深入学习高级特性，并参与项目开发以积累经验。以下是一些建议：\n\n### 一、扎实基础\n\n1. **选择优质学习资源**：可以选择权威的教材，如《Java核心技术卷I》等；也可以观看在线课程，像尚硅谷宋红康老师的Java零基础入门教程，讲解细致，适合初学者。\n\n2. **掌握基本语法**：包括数据类型、变量、运算符、控制流语句（如if-else、for循环、while循环等）、数组和字符串等。\n\n3. **理解面向对象编程**：这是Java的核心概念，需深入理解类和对象的关系，掌握封装、继承和多态三大特性，以及接口、抽象类等相关知识。\n\n4. **熟悉常用类库**：如集合框架（List、Set、Map等）、输入输出流（用于文件操作和网络通信）、日期时间处理类等。\n\n### 二、实践练习\n\n1. **完成基础练习题**：巩固所学的语法知识，加深对知识点的理解和记忆。\n\n2. **进行小项目实践**：从简单的项目入手，如图书管理系统、学生成绩管理系统等，将所学知识综合运用，提高解决实际问题的能力。\n\n3. **参与开源项目**：在技术平台上搜索感兴趣的开源项目参与其中，学习他人的优秀代码和设计思路，提升自己的编程水平。\n\n### 三、深入学习\n\n1. **学习数据库知识**：掌握至少一种关系型数据库，如MySQL，了解数据库的设计、创建表、增删改查操作，以及如何使用JDBC与Java程序进行交互。\n\n2. **研究Java高级特性**：如泛型、反射、注解、动态代理、并发编程等，这些特性在大型项目中经常使用，能够提升程序的性能和可扩展性。\n\n3. **学习框架**：如Spring、Spring MVC、MyBatis等，这些框架可以帮助开发者快速构建企业级应用，提高开发效率。\n\n### 四、持续提升\n\n1. **阅读源码**：阅读优秀的Java源码，如开源框架的源代码，学习其设计模式、代码结构和编程技巧，提升自己的编程能力。\n\n2. **关注行业动态**：关注Java的最新发展动态和技术趋势，学习新的技术和工具，不断更新自己的知识体系。\n\n3. **参加技术交流活动**：加入Java技术社区，参加线上线下的技术交流活动、研讨会等，与其他开发者交流经验，分享心得，拓宽视野。\n\n总之，通过以上步骤和方法，你可以系统地学习Java编程，逐步提升自己的编程能力。记住，持续学习和实践是成为优秀Java开发者的关键。', 6, '2025-02-08 14:35:19', '2025-02-08 14:35:19', 0);
INSERT INTO `user_ai_message` VALUES (1888119440571863041, '力扣的两数之和该怎么做？给我 Java 代码', '力扣（LeetCode）上的“两数之和”问题要求你在一个整数数组中找到两个数，使它们的和等于一个特定的目标值，并返回这两个数的索引。\n\n下面是一个用 Java 实现的解决方案：\n\n```java\nimport java.util.HashMap;\nimport java.util.Map;\n\npublic class TwoSum {\n    public int[] twoSum(int[] nums, int target) {\n        // 创建一个哈希表来存储数组中的数值及其对应的索引\n        Map<Integer, Integer> map = new HashMap<>();\n        \n        // 遍历数组\n        for (int i = 0; i < nums.length; i++) {\n            // 计算当前数值与目标值之间的差值\n            int complement = target - nums[i];\n            \n            // 如果哈希表中存在这个差值，说明找到了两个数\n            if (map.containsKey(complement)) {\n                return new int[] { map.get(complement), i };\n            }\n            \n            // 将当前数值及其索引存入哈希表\n            map.put(nums[i], i);\n        }\n        \n        // 如果没有找到符合条件的两个数，抛出异常\n        throw new IllegalArgumentException(\"No two sum solution\");\n    }\n\n    public static void main(String[] args) {\n        TwoSum solution = new TwoSum();\n        int[] nums = {2, 7, 11, 15};\n        int target = 9;\n        int[] result = solution.twoSum(nums, target);\n        System.out.println(\"Indices: \" + result[0] + \", \" + result[1]);\n    }\n}\n```\n\n### 代码解释：\n1. **导入必要的包**：`import java.util.HashMap; import java.util.Map;`\n   - `HashMap` 用于存储数组中的数值及其对应的索引。\n   - `Map` 是 `HashMap` 的接口。\n\n2. **定义类和方法**：`public class TwoSum` 和 `public int[] twoSum(int[] nums, int target)`\n   - `TwoSum` 类包含解决问题的方法。\n   - `twoSum` 方法接受一个整数数组 `nums` 和一个目标值 `target`，返回两个整数的索引。\n\n3. **创建哈希表**：`Map<Integer, Integer> map = new HashMap<>();`\n   - 用于存储数组中的数值及其对应的索引。\n\n4. **遍历数组**：`for (int i = 0; i < nums.length; i++)`\n   - 使用循环遍历数组中的每一个元素。\n\n5. **计算差值**：`int complement = target - nums[i];`\n   - 计算当前数值与目标值之间的差值。\n\n6. **检查哈希表**：`if (map.containsKey(complement))`\n   - 如果哈希表中存在这个差值，说明找到了两个数，返回它们的索引。\n\n7. **更新哈希表**：`map.put(nums[i], i);`\n   - 将当前数值及其索引存入哈希表。\n\n8. **处理未找到的情况**：`throw new IllegalArgumentException(\"No two sum solution\");`\n   - 如果遍历完数组后没有找到符合条件的两个数，抛出异常。\n\n9. **主方法测试**：`public static void main(String[] args)`\n   - 创建一个 `TwoSum` 对象并调用 `twoSum` 方法进行测试。\n\n希望这段代码能帮助你理解如何解决这个问题！', 6, '2025-02-08 14:55:28', '2025-02-08 14:55:28', 0);
INSERT INTO `user_ai_message` VALUES (1888121302951890945, '1+1=？', '$1+1$ $=2$', 6, '2025-02-08 15:02:52', '2025-02-08 15:02:52', 0);
INSERT INTO `user_ai_message` VALUES (1888122068517228546, '请简要描述线程与进程的关系,区别及优缺点？', '线程与进程是操作系统中两个重要的概念，它们之间既有联系又有区别。以下是对线程与进程的关系、区别及优缺点的简要描述：\n\n### 关系\n\n1. **包含关系**：一个进程可以包含多个线程，这些线程共享进程的资源。\n\n2. **执行环境**：线程在进程内执行任务并共享进程的上下文和资源。\n\n### 区别\n\n1. **资源占用**：进程拥有独立的内存空间和系统资源，而线程则共享其所属进程的资源。\n\n2. **执行方式**：进程在操作系统中独立执行，而线程则是在进程内部由操作系统统一调度。\n\n3. **开销**：创建和销毁进程的开销较大，因为需要分配独立的内存空间和系统资源；而线程的创建和销毁开销相对较小，因为它们共享进程的资源。\n\n4. **并发性**：进程是独立的执行单元，不受其他进程影响，安全性较高；线程共享进程的资源，因此在并发执行时需要考虑同步和互斥问题，安全性较低。\n\n### 优点\n\n1. **进程的优点**：\n   - 独立性：进程之间相互隔离，一个进程的崩溃通常不会影响其他进程的正常运行。\n   - 资源管理：进程提供了更高级别的隔离和资源管理，使得不同进程可以独立运行，互不干扰。\n\n2. **线程的优点**：\n   - 轻量级：线程是轻量级的执行单位，创建和销毁线程的开销相对较小。\n   - 并发性：通过多线程可以实现任务的并发处理，提高系统的效率和响应速度。\n   - 资源共享：线程共享进程的内存空间和资源，方便数据共享和通信。\n\n### 缺点\n\n1. **进程的缺点**：\n   - 资源占用：每个进程都有自己的独立内存空间和系统资源，因此资源占用相对较大。\n   - 切换开销：进程切换时需要保存和恢复较多的上下文信息，开销较大。\n\n2. **线程的缺点**：\n   - 同步与互斥：由于线程共享进程的资源，因此在并发执行时需要考虑同步和互斥问题，以避免数据竞争和死锁。\n   - 编程复杂性：多线程编程相对复杂，需要考虑线程间的协作和同步问题。\n   - 健壮性降低：一个线程的异常可能会导致整个进程的崩溃。\n\n综上所述，线程与进程各有其优缺点，适用于不同的应用场景。在选择使用线程还是进程时，需要根据具体需求进行权衡和选择。', 6, '2025-02-08 15:05:55', '2025-02-08 15:05:55', 0);
INSERT INTO `user_ai_message` VALUES (1888124716830134273, '给我两行诗句\n', '当然可以，以下是两行诗句：\n\n月下独酌花影碎，风中浅唱梦初回。', 6, '2025-02-08 15:16:26', '2025-02-08 15:16:26', 0);
INSERT INTO `user_ai_message` VALUES (1888124905250852866, '给我李白的三首诗歌\n', '李白的诗歌风格豪放、浪漫，充满了丰富的想象力和深刻的情感表达。以下为你推荐三首李白的著名诗歌：\n\n1. **《将进酒》**\n   - **全文**：君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。岑夫子，丹丘生，将进酒，杯莫停。与君歌一曲，请君为我倾耳听。钟鼓馔玉不足贵，但愿长醉不愿醒。古来圣贤皆寂寞，惟有饮者留其名。陈王昔时宴平乐，斗酒十千恣欢谑。主人何为言少钱，径须沽取对君酌。五花马，千金裘，呼儿将出换美酒，与尔同销万古愁。\n   - **赏析**：这首诗是李白怀才不遇，与友人岑勋、元丹丘相会时所作。诗中表达了诗人对时光流逝、人生短暂的感慨，同时也流露出他豪放不羁的性格和对自由生活的向往。全诗情感饱满，语言豪放，充分展现了李白的浪漫主义风格。\n\n2. **《望庐山瀑布》**\n   - **全文**：日照香炉生紫烟，遥看瀑布挂前川。飞流直下三千尺，疑是银河落九天。\n   - **赏析**：这首诗形象地描绘了庐山瀑布雄奇壮丽的景色，反映了诗人对祖国大好河山的无限热爱。诗中运用了丰富的想象力和夸张的手法，将瀑布比作银河从天而降，生动地表现了瀑布的雄伟壮观。\n\n3. **《早发白帝城》**\n   - **全文**：朝辞白帝彩云间，千里江陵一日还。两岸猿声啼不住，轻舟已过万重山。\n   - **赏析**：此诗创作于乾元二年（759）诗人流放途中遇赦返回之时。全诗给人一种锋棱挺拔、空灵飞动之感，洋溢着诗人经过艰难岁月之后突然迸发的一种激情，故雄峻迅疾中又带有豪情欢悦。\n\n总的来说，这些诗歌都展现了李白独特的艺术风格和卓越的才华，是中国古典文学中的瑰宝。', 6, '2025-02-08 15:17:11', '2025-02-08 15:17:11', 0);
INSERT INTO `user_ai_message` VALUES (1888125326132482050, '唐宋八大家分别是谁？\n', '唐宋八大家分别是**韩愈、柳宗元、欧阳修、苏洵、苏轼、苏辙、王安石、曾巩**。以下是他们的具体介绍：\n\n1. **韩愈**：字退之，河南河阳人。唐代文学家、思想家、哲学家、政治家。他是唐宋古文运动的倡导者，主张学习先秦两汉的散文语言，破骈为散，扩大文言文的表达功能。其文章众多，现存的诗文有1200余篇，其中散文近400篇，类型涵盖赋、诗、赞、书、说、传、记、序、哀辞、祭文、碑志、表、杂文等多种体裁。\n\n2. **柳宗元**：字子厚，河东（今山西运城永济一带）人。唐代文学家、哲学家、散文家和思想家，与韩愈并称为“韩柳”，共同倡导了唐代的古文运动。\n\n3. **欧阳修**：字永叔，号醉翁，晚号六一居士，吉州永丰（今江西永丰）人。北宋政治家、文学家，是宋代古文运动的领袖之一，对后世文学影响深远。\n\n4. **苏洵**：字明允，自号老泉，眉州眉山（今四川眉山）人。北宋文学家，与其子苏轼、苏辙并以文学著称于世，世称“三苏”。\n\n5. **苏轼**：字子瞻，又字和仲，号东坡居士，世称苏东坡、苏仙。汉族，北宋著名文学家、书法家、画家。他是豪放派词人的代表，与黄庭坚并称“苏黄”，与辛弃疾并称“苏辛”。\n\n6. **苏辙**：字子由，一字同叔，晚号颍滨遗老。眉州眉山（今属四川省眉山市）人。北宋文学家、宰相，与父亲苏洵、兄长苏轼齐名，合称“三苏”。\n\n7. **王安石**：字介甫，号半山，临江（今江西樟树）人。北宋著名的思想家、政治家、文学家、改革家，唐宋八大家之一。\n\n8. **曾巩**：字子固，世称“南丰先生”，建昌南丰（今属江西）人。北宋文学家、史学家、政治家，为“唐宋八大家”之一。', 6, '2025-02-08 15:18:52', '2025-02-08 15:18:52', 0);
INSERT INTO `user_ai_message` VALUES (1888131116046139393, '程序员小白条是谁？\n', '程序员小白条是一位活跃在技术分享领域的博主，以下是关于他的一些信息：\n\n1. **技术分享内容**：他会分享面试必备的八股文知识，涵盖Java基础、Java框架、Git命令、JVM、多线程、消息队列、微服务、Linux、数据库、Redis缓存、算法等众多技术领域。还会介绍一些技术概念和原理，如渐进式rehash、缓存击穿、缓存穿透、缓存雪崩、MVCC、回表、最左匹配原则、循环依赖、IOC、DI以及用户态和内核态等。\n\n2. **项目经验分享**：他曾分享过自己使用SpringBoot2+Vue2开发的智能GPT图书管理系统，包括全局异常拦截器、登录校验拦截器、Echarts展示借阅量等功能，以及可添加爬虫等扩展功能。\n\n总的来说，程序员小白条通过其丰富的技术分享和实战经验展示，为广大程序员提供了宝贵的学习资源和参考。', 6, '2025-02-08 15:41:52', '2025-02-08 15:41:52', 0);
INSERT INTO `user_ai_message` VALUES (1888131623997325314, '答案说明所有是谁？\n', '您的问题似乎缺乏具体的背景信息和上下文，无法明确指出“答案说明所有”指的是哪些人或事物。能否请您提供更多的详细内容或者情境描述？这样我才能准确地回答您的问题，比如：\n\n1. 您是在询问某个特定问题的答案，还是想了解某类问题的解答方式？\n2. “说明所有”是指解释清楚所有相关细节、涉及的所有方面，还是指提供所有可能的答案选项？\n3. 是否有特定的主题、领域或情境，比如科学、历史、文化、技术等，与您希望了解的答案相关？\n4. 是否有特定的人物、群体、机构等，他们的观点、行为或决策与您关心的答案有关？\n\n请补充相关信息，我会很乐意帮助您解答关于“答案说明所有”的具体所指。', 6, '2025-02-08 15:43:53', '2025-02-08 15:43:53', 0);
INSERT INTO `user_ai_message` VALUES (1888138562139553794, '面向对象和面向过程的区别面向过程编程（Procedural-Oriented Programming，POP）和面向对象编程（Object-Oriented Programming，OOP）是两种常见的编程范式，两者的主要区别在于解决问题的方式不同：面向过程编程（POP）：面向过程把解决问题的过程拆成一个个方法，通过一个个方法的执行解决问题。面向对象编程（OOP）：面向对象会先抽象出对象，然后用对象执行方法的方式解决问题。', '### 分析问题\n\n用户提出了一个关于面向过程编程（POP）和面向对象编程（OOP）区别的问题。这个问题是一个基础的编程范式问题，通常在面试中用于评估候选人对基本编程概念的理解。\n\n### 深度推理问题及可能的场景和解决方案\n\n1. **场景一：软件开发项目选择**\n   - **问题**：在一个大型软件开发项目中，如何决定是使用POP还是OOP？\n   - **解决方案**：\n     - 考虑项目的复杂性和可维护性。如果项目需求简单且变化不大，POP可能更合适。\n     - 如果项目需要高度的模块化、可扩展性和重用性，OOP可能是更好的选择。\n\n2. **场景二：团队技术栈统一**\n   - **问题**：如何在团队中统一技术栈，确保所有成员都能高效协作？\n   - **解决方案**：\n     - 进行技术调研，了解团队成员的技术背景和偏好。\n     - 根据项目需求和团队情况，选择适合的编程范式，并制定统一的编码规范和最佳实践。\n\n3. **场景三：性能优化**\n   - **问题**：在性能敏感的应用中，如何选择编程范式以优化性能？\n   - **解决方案**：\n     - 对于性能要求极高的应用，可能需要深入分析两种范式的性能表现。\n     - 在某些情况下，结合使用POP和OOP，或者根据性能瓶颈选择合适的范式，可能是最佳策略。\n\n### 用户回答打分及不足之处分析\n\n用户的回答简洁明了，正确地指出了POP和OOP的主要区别。然而，这个回答相对基础，没有深入探讨两种范式在不同场景下的应用和优缺点。为了更全面地展示对编程范式的理解，用户可以考虑添加以下内容：\n\n- **具体示例**：给出一个简单的代码示例，分别展示POP和OOP如何解决同一个问题。\n- **优缺点分析**：详细描述POP和OOP各自的优点和缺点，以及它们在不同类型项目中的应用。\n- **实际应用场景**：讨论在实际开发中，如何根据项目需求和团队情况选择合适的编程范式。\n\n综上所述，虽然用户的回答是正确的，但为了在面试中获得更高的评价，建议提供更详细、更具体的信息来展示对编程范式的深入理解。', 6, '2025-02-08 16:11:27', '2025-02-08 16:11:27', 0);
INSERT INTO `user_ai_message` VALUES (1890697165966913537, '有了进程为什么还需要线程?进程切换是一个开销很大的操作，线程切换的成本较低。线程更轻量，一个进程可以创建多个线程。多个线程可以并发处理不同的任务，更有效地利用了多处理器和多核计算机。而进程只能在一个时间干一件事，如果在执行过程中遇到阻塞问题比如 IO 阻塞就会挂起直到结果返回。同一进程内的线程共享内存和文件，因此它们之间相互通信无须调用内核。为什么要使用多线程?', '以下是对“有了进程为什么还需要线程”这一问题的分析、推理以及相关场景和解决方案的阐述，并包含对可能回答的打分及不足分析：\n\n### 问题分析\n- **核心关注点**：该问题主要聚焦于进程与线程存在的必要性，尤其是在已经有进程概念的情况下为何还要引入线程，重点在于探究二者的区别以及线程相较于进程的优势所在。\n\n### 深度推理及场景、解决方案\n#### 1. 资源利用角度\n - **场景**：在多核计算机系统中，如果只使用进程来执行任务，当一个进程因为I/O操作（如等待用户输入、等待文件读取完成等）而阻塞时，整个CPU核就会处于闲置状态，即使有其他可以执行的任务也无法进行，这就导致了计算资源的浪费。例如在一个服务器应用中，某个进程在等待客户端通过网络发送数据时，CPU就只能干等着，无法去处理其他可以即时处理的任务。\n - **解决方案**：引入线程后，当一个线程因为I/O阻塞时，同一进程内的其他线程可以利用CPU继续执行其他任务，使得CPU资源能够被充分利用起来，提高了系统的整体吞吐量。比如上述服务器应用中，可以在等待网络数据的进程中再创建几个线程，有的线程去处理其他已经接收到的数据，有的线程去处理一些本地计算任务等。\n\n#### 2. 并发性角度\n - **场景**：对于一些需要同时处理多个相似或不同任务的应用程序来说，如果仅靠进程来实现并发，会面临诸多限制。比如一个图形界面应用程序，既要响应用户的鼠标点击操作（这是一个独立的交互任务），又要不断更新界面显示内容（这是另一个独立的绘制任务），若只用进程，很难做到高效的同时处理这两个任务。\n - **解决方案**：使用线程可以让多个任务在同一个进程内并发执行。不同的线程可以专注于不同的功能模块，它们共享进程的资源（如内存空间等），通过合理的调度机制，能够快速地切换执行，实现真正意义上的并发处理，提高程序的响应速度和用户体验。例如上述图形界面程序中，可以创建一个专门处理鼠标事件的线程和一个专门负责界面绘制的线程，让它们并发运行。\n\n#### 3. 通信效率角度\n - **场景**：在复杂的应用程序中，不同部分之间往往需要进行数据传递和通信。如果使用多个进程来实现不同功能模块，那么进程间通信（IPC）通常需要借助操作系统提供的特定机制（如管道、消息队列等），这些机制相对复杂且开销较大。例如在一个企业级应用中，负责数据处理的进程要和负责数据存储的进程频繁交换数据，每次通信都要经过复杂的IPC流程。\n - **解决方案**：同一进程内的线程共享内存和文件等资源，它们之间的通信可以直接通过共享内存变量等方式进行，无需像进程间通信那样调用内核接口，极大地简化了通信流程，降低了通信成本，提高了通信效率。比如在上述企业级应用中，如果把数据处理和数据存储放在同一个进程的不同线程中，它们可以通过共享内存中的缓冲区来快速传递数据。\n\n### 对可能回答的打分及不足分析\n- **假设回答示例**：“有了进程还需要线程是因为线程更轻量，一个进程能创建多个线程，多个线程可以并发处理任务，比进程只能一个时间干一件事要好。”\n    - **打分**：5分（满分10分）\n    - **不足分析**：这个回答只是简单陈述了线程相比进程的部分优势，没有深入解释为什么会有这些优势以及在实际场景中如何体现这些优势。缺乏对资源利用、并发性、通信效率等具体方面的详细阐述，没有结合实际的应用案例来说明线程存在的必要性，整体回答比较笼统和表面，没有深入挖掘问题背后的原理和实际意义。\n \n\n综上所述，进程和线程在计算机系统中都有其不可或缺的地位，线程的出现是为了弥补进程在某些方面的不足，更好地满足现代复杂应用程序对资源利用、并发处理和高效通信等方面的需求。', 6, '2025-02-15 17:38:26', '2025-02-15 17:38:26', 0);
INSERT INTO `user_ai_message` VALUES (1891408151659982850, 'HTTP/1.0 和 HTTP/1.1 有什么区别？连接方式 : HTTP/1.0 为短连接，HTTP/1.1 支持长连接。HTTP 协议的长连接和短连接，实质上是 TCP 协议的长连接和短连接。', 'HTTP/1.0 和 HTTP/1.1 是两个版本的超文本传输协议（HTTP），它们在连接方式、缓存处理、管线化支持等方面存在一些关键区别。以下是对这些区别的详细分析：\n\n### 1. 连接方式\n- **HTTP/1.0**: 默认使用短连接，即每个请求都会建立一个新的TCP连接，并在请求处理完毕后立即关闭连接。这种方式在处理大量请求时效率较低，因为每次请求都需要进行三次握手和四次挥手的过程。\n- **HTTP/1.1**: 引入了持久连接（也称为长连接）的概念，允许多个请求复用同一个TCP连接。这减少了连接建立和关闭的开销，提高了网络传输的效率。\n\n### 2. 缓存处理\n- **HTTP/1.0**: 对缓存的支持较为有限，主要依赖于Expires头字段来控制缓存行为。\n- **HTTP/1.1**: 增强了对缓存的支持，引入了Cache-Control头字段，提供了更灵活的缓存控制机制，如max-age、no-cache等。\n\n### 3. 管线化支持\n- **HTTP/1.0**: 不支持管线化，即客户端必须等待服务器响应前一个请求后才能发送下一个请求。\n- **HTTP/1.1**: 支持管线化，允许客户端在一个TCP连接上发送多个请求而无需等待响应，这进一步提高了网络传输的效率。\n\n### 4. 主机头支持\n- **HTTP/1.0**: 不支持主机头（Host header），这意味着每个IP地址只能托管一个网站。\n- **HTTP/1.1**: 引入了主机头，使得同一个IP地址可以托管多个不同的网站，这是虚拟主机技术的基础。\n\n### 5. 状态码和原因短语\n- **HTTP/1.0**: 定义了一些基本的状态码和原因短语，但数量较少。\n- **HTTP/1.1**: 扩展了状态码和原因短语的数量，提供了更多的错误信息和成功响应的细分。\n\n### 6. 分块传输编码\n- **HTTP/1.0**: 不支持分块传输编码，这意味着服务器在发送响应之前需要知道整个响应体的大小。\n- **HTTP/1.1**: 引入了分块传输编码，允许服务器以流的方式发送响应体，这对于动态生成内容或大文件传输非常有用。\n\n### 7. 身份验证改进\n- **HTTP/1.0**: 身份验证方法相对简单，通常只支持基本的身份验证。\n- **HTTP/1.1**: 提供了更多种类的身份验证方案，包括摘要身份验证和Bearer token等。\n\n### 8. 安全性增强\n- **HTTP/1.0**: 安全性较低，没有内置的安全特性。\n- **HTTP/1.1**: 虽然本身并不安全，但它为后续的安全协议如HTTPS提供了基础。\n\n### 总结\nHTTP/1.1 在HTTP/1.0的基础上进行了多项改进，包括持久连接、缓存控制、管线化支持、主机头支持等，这些改进使得HTTP/1.1更加高效、灵活和安全。然而，需要注意的是，HTTP/1.1仍然是一个无状态协议，这意味着它不保留任何客户端到服务器的通信状态。为了解决这个问题，后来发展出了HTTP/2和HTTP/3等版本，它们进一步优化了性能和安全性。\n\n如果你有具体的代码或问题需要我点评打分，请提供相关详细信息，我会尽力为你进行分析和评价。', 6, '2025-02-17 16:43:38', '2025-02-17 16:43:38', 0);
INSERT INTO `user_ai_message` VALUES (1900774937460412417, '请给推荐几个商品\n', '以下是几个适合该用户的商品推荐及理由：\n\n### 方便面\n- **推荐理由**：\n    - **价格适配**：方便面价格为1.90元，远低于用户现有余额41.00元，用户购买无经济压力。\n    - **库存充足**：库存有8件，可满足用户的购买需求，不用担心缺货问题。\n    - **日常实用**：方便面是一种常见的速食食品，能快速解决用餐问题，对于很多用户来说是比较实用的商品。\n\n### 阿迪达斯T恤\n- **推荐理由**：\n    - **价格合适**：阿迪达斯T恤价格为49.90元，在用户余额41.00元的承受范围内，虽然余额稍显不足，但用户可以考虑通过一些方式（如充值少量金额）来购买。\n    - **品牌与品质**：阿迪达斯是知名品牌，其T恤在质量、设计和舒适度方面通常有一定保障，能满足用户对品牌商品的需求。\n    - **新旧程度较好**：九成新的T恤外观和品质相对较新，穿着体验较好。\n\n### 牙刷\n- **推荐理由**：\n    - **价格亲民**：牙刷价格为29.90元，低于用户现有余额，购买起来比较轻松。\n    - **库存有保障**：库存有4件，供应相对充足，用户可以放心购买。\n    - **生活必需品**：牙刷是日常生活中经常需要使用的物品，属于刚需商品，购买后能立即派上用场。', 6, '2025-03-15 13:03:54', '2025-03-15 13:03:54', 0);
INSERT INTO `user_ai_message` VALUES (1901156016193175554, '我想购买一些数码产品，您有什么好建议吗？', '根据您提供的信息，我为您推荐以下商品：\n\n1. 苹果蓝牙耳机：这款耳机是八五新的，库存只有1件，价格为69.90元。虽然价格略高于您的余额，但考虑到您对数码产品的偏好，这款耳机可能是一个不错的选择。您可以使用现有的余额支付一部分款项，剩余部分可以选择分期付款或者与卖家协商其他支付方式。\n\n2. 徕芬吹风机：这款吹风机是九五新的，库存有1件，价格为99.90元。虽然价格也略高于您的余额，但考虑到其较高的新旧程度和可能的使用价值，如果您对个人护理产品有兴趣，可以考虑购买这款吹风机。同样，您可以使用现有的余额支付一部分款项，剩余部分可以选择分期付款或者与卖家协商其他支付方式。\n\n3. 牙刷：这款牙刷是九成新的，库存有4件，价格为29.90元。价格在您的预算范围内，且新旧程度较高，适合日常使用。如果您需要更换牙刷或作为备用，这款产品是一个经济实惠的选择。\n\n请注意，以上推荐基于您提供的偏好信息和数据库中的商品信息。在实际购买前，请确保与卖家沟通确认商品的详细状况、交易条款以及任何可能的额外费用（如运费）。同时，考虑到您的余额限制，建议优先考虑价格较低或可以分期付款的商品。', 6, '2025-03-16 14:18:10', '2025-03-16 14:18:10', 0);

-- ----------------------------
-- Table structure for user_commodity_favorites
-- ----------------------------
DROP TABLE IF EXISTS `user_commodity_favorites`;
CREATE TABLE `user_commodity_favorites`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL COMMENT '用户 ID',
  `commodityId` bigint(20) NOT NULL COMMENT '商品 ID',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '1-正常收藏 0-取消收藏',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户备注',
  `createTime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_favorite`(`userId`, `commodityId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1899732371092668419 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_commodity_favorites
-- ----------------------------
INSERT INTO `user_commodity_favorites` VALUES (1899697851031224321, 6, 1899338652573212673, 0, NULL, '2025-03-12 13:43:57', '2025-03-12 14:12:24', 0);
INSERT INTO `user_commodity_favorites` VALUES (1899732371092668418, 6, 1899355409304231938, 0, NULL, '2025-03-12 16:01:07', '2025-03-12 16:01:07', 0);

SET FOREIGN_KEY_CHECKS = 1;
