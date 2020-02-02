/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : prueba_sym

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 02/02/2020 10:07:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'catcode0', 'Cat 0', 'des cat 0', 1, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `category` VALUES (2, 'catcode1', 'Cat 1', 'des cat 1', 1, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `category` VALUES (3, 'catcode2', 'Cat 2', 'des cat 2', 1, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `category` VALUES (4, 'catcode3', 'Cat 3', 'des cat 3', 1, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `category` VALUES (5, 'catcode4', 'Cat 4', 'des cat 4', 1, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `category` VALUES (6, 'catcode5', 'Cat 5', 'des cat 5', 1, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `category` VALUES (7, 'catcode6', 'Cat 6', 'des cat 6', 1, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `category` VALUES (8, 'catcode7', 'Cat 7', 'des cat 7', 1, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `category` VALUES (9, 'catcode8', 'Cat 8', 'des cat 8', 1, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `category` VALUES (10, 'catcode9', 'Cat 9', 'des cat 9', 1, '2020-02-02 15:06:54', '2020-02-02 15:06:54');

-- ----------------------------
-- Table structure for migration_versions
-- ----------------------------
DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE `migration_versions`  (
  `version` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime(0) NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migration_versions
-- ----------------------------
INSERT INTO `migration_versions` VALUES ('20200201004549', '2020-02-02 15:06:15');
INSERT INTO `migration_versions` VALUES ('20200201031255', '2020-02-02 15:06:15');
INSERT INTO `migration_versions` VALUES ('20200201041951', '2020-02-02 15:06:17');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_D34A04AD12469DE2`(`category_id`) USING BTREE,
  CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 3, 'prodCode0', 'product 0', ' Des product 0', 'brand3', 716165, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (2, 6, 'prodCode1', 'product 1', ' Des product 1', 'brand3', 783419, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (3, 4, 'prodCode2', 'product 2', ' Des product 2', 'brand1', 898421, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (4, 6, 'prodCode3', 'product 3', ' Des product 3', 'brand3', 372692, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (5, 6, 'prodCode4', 'product 4', ' Des product 4', 'brand1', 892594, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (6, 7, 'prodCode5', 'product 5', ' Des product 5', 'brand1', 868203, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (7, 5, 'prodCode6', 'product 6', ' Des product 6', 'brand3', 779527, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (8, 3, 'prodCode7', 'product 7', ' Des product 7', 'brand2', 478043, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (9, 4, 'prodCode8', 'product 8', ' Des product 8', 'brand4', 549199, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (10, 5, 'prodCode9', 'product 9', ' Des product 9', 'brand3', 339970, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (11, 9, 'prodCode10', 'product 10', ' Des product 10', 'brand5', 937778, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (12, 5, 'prodCode11', 'product 11', ' Des product 11', 'brand1', 236395, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (13, 8, 'prodCode12', 'product 12', ' Des product 12', 'brand2', 307947, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (14, 6, 'prodCode13', 'product 13', ' Des product 13', 'brand5', 288284, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (15, 7, 'prodCode14', 'product 14', ' Des product 14', 'brand1', 255148, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (16, 9, 'prodCode15', 'product 15', ' Des product 15', 'brand5', 810701, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (17, 5, 'prodCode16', 'product 16', ' Des product 16', 'brand2', 210426, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (18, 9, 'prodCode17', 'product 17', ' Des product 17', 'brand4', 389679, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (19, 9, 'prodCode18', 'product 18', ' Des product 18', 'brand1', 636811, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (20, 3, 'prodCode19', 'product 19', ' Des product 19', 'brand4', 126625, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (21, 6, 'prodCode20', 'product 20', ' Des product 20', 'brand2', 155635, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (22, 9, 'prodCode21', 'product 21', ' Des product 21', 'brand5', 167174, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (23, 7, 'prodCode22', 'product 22', ' Des product 22', 'brand3', 748317, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (24, 6, 'prodCode23', 'product 23', ' Des product 23', 'brand3', 677517, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (25, 3, 'prodCode24', 'product 24', ' Des product 24', 'brand5', 381185, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (26, 9, 'prodCode25', 'product 25', ' Des product 25', 'brand2', 990003, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (27, 5, 'prodCode26', 'product 26', ' Des product 26', 'brand4', 540207, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (28, 4, 'prodCode27', 'product 27', ' Des product 27', 'brand1', 834831, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (29, 5, 'prodCode28', 'product 28', ' Des product 28', 'brand1', 569559, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (30, 9, 'prodCode29', 'product 29', ' Des product 29', 'brand4', 331441, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (31, 5, 'prodCode30', 'product 30', ' Des product 30', 'brand1', 127941, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (32, 4, 'prodCode31', 'product 31', ' Des product 31', 'brand4', 347350, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (33, 4, 'prodCode32', 'product 32', ' Des product 32', 'brand4', 584109, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (34, 7, 'prodCode33', 'product 33', ' Des product 33', 'brand2', 196806, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (35, 6, 'prodCode34', 'product 34', ' Des product 34', 'brand1', 382470, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (36, 9, 'prodCode35', 'product 35', ' Des product 35', 'brand3', 770553, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (37, 7, 'prodCode36', 'product 36', ' Des product 36', 'brand4', 492678, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (38, 7, 'prodCode37', 'product 37', ' Des product 37', 'brand4', 625419, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (39, 7, 'prodCode38', 'product 38', ' Des product 38', 'brand2', 195954, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (40, 9, 'prodCode39', 'product 39', ' Des product 39', 'brand2', 116363, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (41, 4, 'prodCode40', 'product 40', ' Des product 40', 'brand5', 729613, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (42, 6, 'prodCode41', 'product 41', ' Des product 41', 'brand2', 189058, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (43, 6, 'prodCode42', 'product 42', ' Des product 42', 'brand5', 641312, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (44, 6, 'prodCode43', 'product 43', ' Des product 43', 'brand4', 592117, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (45, 6, 'prodCode44', 'product 44', ' Des product 44', 'brand5', 621636, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (46, 4, 'prodCode45', 'product 45', ' Des product 45', 'brand1', 710341, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (47, 3, 'prodCode46', 'product 46', ' Des product 46', 'brand3', 880043, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (48, 8, 'prodCode47', 'product 47', ' Des product 47', 'brand4', 839676, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (49, 8, 'prodCode48', 'product 48', ' Des product 48', 'brand2', 341114, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (50, 5, 'prodCode49', 'product 49', ' Des product 49', 'brand3', 821685, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (51, 8, 'prodCode50', 'product 50', ' Des product 50', 'brand5', 578666, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (52, 7, 'prodCode51', 'product 51', ' Des product 51', 'brand3', 786237, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (53, 8, 'prodCode52', 'product 52', ' Des product 52', 'brand1', 872091, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (54, 9, 'prodCode53', 'product 53', ' Des product 53', 'brand3', 992110, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (55, 3, 'prodCode54', 'product 54', ' Des product 54', 'brand3', 973132, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (56, 8, 'prodCode55', 'product 55', ' Des product 55', 'brand1', 352729, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (57, 4, 'prodCode56', 'product 56', ' Des product 56', 'brand5', 901783, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (58, 8, 'prodCode57', 'product 57', ' Des product 57', 'brand2', 201792, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (59, 7, 'prodCode58', 'product 58', ' Des product 58', 'brand4', 821977, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (60, 9, 'prodCode59', 'product 59', ' Des product 59', 'brand5', 453763, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (61, 6, 'prodCode60', 'product 60', ' Des product 60', 'brand2', 748258, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (62, 4, 'prodCode61', 'product 61', ' Des product 61', 'brand2', 804899, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (63, 8, 'prodCode62', 'product 62', ' Des product 62', 'brand1', 588284, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (64, 5, 'prodCode63', 'product 63', ' Des product 63', 'brand2', 242381, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (65, 3, 'prodCode64', 'product 64', ' Des product 64', 'brand5', 224244, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (66, 6, 'prodCode65', 'product 65', ' Des product 65', 'brand4', 686995, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (67, 9, 'prodCode66', 'product 66', ' Des product 66', 'brand4', 895696, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (68, 8, 'prodCode67', 'product 67', ' Des product 67', 'brand1', 931566, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (69, 7, 'prodCode68', 'product 68', ' Des product 68', 'brand1', 610414, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (70, 3, 'prodCode69', 'product 69', ' Des product 69', 'brand5', 346571, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (71, 4, 'prodCode70', 'product 70', ' Des product 70', 'brand2', 350300, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (72, 7, 'prodCode71', 'product 71', ' Des product 71', 'brand1', 991114, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (73, 4, 'prodCode72', 'product 72', ' Des product 72', 'brand2', 205457, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (74, 7, 'prodCode73', 'product 73', ' Des product 73', 'brand5', 290167, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (75, 9, 'prodCode74', 'product 74', ' Des product 74', 'brand2', 609097, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (76, 5, 'prodCode75', 'product 75', ' Des product 75', 'brand4', 329774, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (77, 8, 'prodCode76', 'product 76', ' Des product 76', 'brand1', 486855, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (78, 7, 'prodCode77', 'product 77', ' Des product 77', 'brand2', 384027, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (79, 9, 'prodCode78', 'product 78', ' Des product 78', 'brand4', 184634, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (80, 4, 'prodCode79', 'product 79', ' Des product 79', 'brand5', 727018, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (81, 9, 'prodCode80', 'product 80', ' Des product 80', 'brand2', 355372, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (82, 8, 'prodCode81', 'product 81', ' Des product 81', 'brand5', 537352, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (83, 7, 'prodCode82', 'product 82', ' Des product 82', 'brand3', 736049, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (84, 8, 'prodCode83', 'product 83', ' Des product 83', 'brand3', 129739, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (85, 7, 'prodCode84', 'product 84', ' Des product 84', 'brand5', 976484, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (86, 9, 'prodCode85', 'product 85', ' Des product 85', 'brand3', 367968, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (87, 8, 'prodCode86', 'product 86', ' Des product 86', 'brand2', 118189, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (88, 5, 'prodCode87', 'product 87', ' Des product 87', 'brand1', 911629, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (89, 7, 'prodCode88', 'product 88', ' Des product 88', 'brand1', 222855, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (90, 9, 'prodCode89', 'product 89', ' Des product 89', 'brand2', 987444, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (91, 3, 'prodCode90', 'product 90', ' Des product 90', 'brand1', 367462, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (92, 9, 'prodCode91', 'product 91', ' Des product 91', 'brand2', 868592, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (93, 6, 'prodCode92', 'product 92', ' Des product 92', 'brand2', 285137, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (94, 7, 'prodCode93', 'product 93', ' Des product 93', 'brand3', 422555, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (95, 7, 'prodCode94', 'product 94', ' Des product 94', 'brand4', 983933, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (96, 6, 'prodCode95', 'product 95', ' Des product 95', 'brand2', 352806, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (97, 3, 'prodCode96', 'product 96', ' Des product 96', 'brand4', 880143, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (98, 8, 'prodCode97', 'product 97', ' Des product 97', 'brand2', 945637, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (99, 6, 'prodCode98', 'product 98', ' Des product 98', 'brand3', 220733, '2020-02-02 15:06:54', '2020-02-02 15:06:54');
INSERT INTO `product` VALUES (100, 4, 'prodCode99', 'product 99', ' Des product 99', 'brand5', 820651, '2020-02-02 15:06:54', '2020-02-02 15:06:54');

SET FOREIGN_KEY_CHECKS = 1;
