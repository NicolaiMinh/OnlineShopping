-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.24 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table hangxachtayconan.abouts
DROP TABLE IF EXISTS `abouts`;
CREATE TABLE IF NOT EXISTS `abouts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_header` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_footer` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `googleplus` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hangxachtayconan.abouts: ~0 rows (approximately)
/*!40000 ALTER TABLE `abouts` DISABLE KEYS */;
INSERT IGNORE INTO `abouts` (`id`, `address`, `site_title`, `site_name`, `logo_header`, `logo_footer`, `content`, `phone`, `email`, `facebook`, `googleplus`, `youtube`, `skype`, `updated_at`, `created_at`, `updated_by`, `created_by`, `deleted`) VALUES
	(1, 'Quận Thủ Đức, TpHCM', 'Hàng xách tay Conan', 'hangxachtayconan.com', '/images/logo.gif', '/images/logo.gif', '&lt;h3&gt;-&lt;strong&gt; Đ&amp;acirc;y l&amp;agrave; T&lt;/strong&gt;ra&lt;span style=&quot;color:#FF0000;&quot;&gt;ng H&amp;agrave;ng x&amp;aacute;ch tay Conan&lt;/span&gt;&amp;nbsp;...&lt;/h3&gt;\r\n\r\n&lt;p&gt;Abc&lt;img alt=&quot;&quot; src=&quot;/public/files/images/hoa-anh-dao-o-nui-phu-si_800x415.jpg&quot; style=&quot;width: 800px; height: 415px;&quot; /&gt;&lt;/p&gt;\r\n', '0123456789', 'abcdfads@gmail.com', NULL, NULL, NULL, NULL, '2018-04-26 00:02:49', '2018-04-22 22:26:20', 3, 3, 0);
/*!40000 ALTER TABLE `abouts` ENABLE KEYS */;

-- Dumping structure for table hangxachtayconan.banner
DROP TABLE IF EXISTS `banner`;
CREATE TABLE IF NOT EXISTS `banner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hangxachtayconan.banner: ~2 rows (approximately)
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT IGNORE INTO `banner` (`id`, `image`, `text`, `text2`, `link`, `deleted`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
	(1, '/images/banner/home_slide_4.jpg', 'Summer Collection', 'Limited Edition', '#', 0, '2016-04-25 12:52:33', '2016-07-01 10:37:51', 0, 1),
	(2, '/images/banner/home_slide_6.jpg', 'link1 rqwer qưer', 'Limited Edition 1', '#', 0, '2016-07-01 10:39:28', '2016-07-01 10:39:28', 1, 1),
	(5, '/images/banner/home_slide_5.jpg', 'cvbcvbc', 'dfgdfgdfg', '#', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
	(6, '/public/files/images/hoa-anh-dao-o-nui-phu-si_800x415.jpg', NULL, NULL, NULL, 1, '2018-04-23 22:15:38', '2018-04-23 22:15:38', 3, 3);
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;

-- Dumping structure for table hangxachtayconan.categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `slug` varchar(255) COLLATE utf8_bin NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table hangxachtayconan.categories: ~7 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT IGNORE INTO `categories` (`id`, `name`, `slug`, `deleted`, `updated_by`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Danh mục 1', 'danh-muc-1', 1, 1, 0, '2018-04-22 22:28:14', '2017-11-20 21:23:37'),
	(2, 'Danh mục 2', 'danh-muc-2', 0, 0, 0, '2018-04-22 22:28:14', '0000-00-00 00:00:00'),
	(3, 'Danh mục 3', 'danh-muc-3', 0, 0, 0, '2018-04-22 22:28:14', '0000-00-00 00:00:00'),
	(4, 'Danh mục 4', 'danh-muc-4', 0, 0, 0, '2018-04-22 22:28:14', '0000-00-00 00:00:00'),
	(5, 'Danh mục 5', 'danh-muc-5', 0, 0, 0, '2018-04-22 22:28:14', '0000-00-00 00:00:00'),
	(6, 'Danh mục 6', 'danh-muc-6', 0, 0, 0, '2018-04-22 22:28:14', '0000-00-00 00:00:00'),
	(15, 'Danh mục 15', 'danh-muc-15', 1, 1, 1, '2018-04-22 22:28:14', '2017-11-22 22:34:53'),
	(16, 'Danh mục 16', 'danh-muc-16', 0, 3, 3, '2018-04-22 22:28:14', '2018-04-22 16:07:12'),
	(17, 'Danh mục 17', 'danh-muc-17', 0, 0, 0, '2018-04-22 23:20:56', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table hangxachtayconan.category_details
DROP TABLE IF EXISTS `category_details`;
CREATE TABLE IF NOT EXISTS `category_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` bigint(20) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table hangxachtayconan.category_details: ~48 rows (approximately)
/*!40000 ALTER TABLE `category_details` DISABLE KEYS */;
INSERT IGNORE INTO `category_details` (`id`, `name`, `slug`, `category_id`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted`) VALUES
	(1, 'Danh mục con 1', 'danh-muc-con-1', 1, 3, 3, '2018-04-22 22:20:13', '2018-04-22 22:31:53', 0),
	(2, 'Danh mục con 2', 'danh-muc-con-2', 2, 3, 3, '2018-04-22 22:20:20', '2018-04-22 22:30:58', 0),
	(3, 'Danh mục con 3', 'danh-muc-con-3', 3, 3, 3, '2018-04-22 22:20:30', '2018-04-22 22:31:53', 0),
	(4, 'Danh mục con 4', 'danh-muc-con-4', 4, 3, 3, '2018-04-22 22:20:39', '2018-04-22 22:31:53', 0),
	(5, 'Danh mục con 5', 'danh-muc-con-5', 5, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(6, 'Danh mục con 6', 'danh-muc-con-6', 6, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(7, 'Danh mục con 7', 'danh-muc-con-7', 15, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:35:58', 0),
	(8, 'Danh mục con 8', 'danh-muc-con-8', 16, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:36:04', 0),
	(9, 'Danh mục con 9', 'danh-muc-con-9', 1, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(10, 'Danh mục con 10', 'danh-muc-con-10', 2, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(11, 'Danh mục con 11', 'danh-muc-con-11', 3, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(12, 'Danh mục con 12', 'danh-muc-con-12', 4, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(13, 'Danh mục con 13', 'danh-muc-con-13', 5, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(14, 'Danh mục con 14', 'danh-muc-con-14', 6, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(15, 'Danh mục con 15', 'danh-muc-con-15', 15, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:35:58', 0),
	(16, 'Danh mục con 16', 'danh-muc-con-16', 16, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:36:04', 0),
	(17, 'Danh mục con 17', 'danh-muc-con-17', 1, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(18, 'Danh mục con 18', 'danh-muc-con-18', 2, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(19, 'Danh mục con 19', 'danh-muc-con-19', 3, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(20, 'Danh mục con 20', 'danh-muc-con-20', 4, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(21, 'Danh mục con 21', 'danh-muc-con-21', 5, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(22, 'Danh mục con 22', 'danh-muc-con-22', 6, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(23, 'Danh mục con 23', 'danh-muc-con-23', 15, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:35:58', 0),
	(24, 'Danh mục con 24', 'danh-muc-con-24', 16, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:36:04', 0),
	(25, 'Danh mục con 25', 'danh-muc-con-25', 1, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(26, 'Danh mục con 26', 'danh-muc-con-26', 2, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(27, 'Danh mục con 27', 'danh-muc-con-27', 3, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(28, 'Danh mục con 28', 'danh-muc-con-28', 4, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(29, 'Danh mục con 29', 'danh-muc-con-29', 5, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(30, 'Danh mục con 30', 'danh-muc-con-30', 6, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(31, 'Danh mục con 31', 'danh-muc-con-31', 15, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:35:58', 0),
	(32, 'Danh mục con 32', 'danh-muc-con-32', 16, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:36:04', 0),
	(33, 'Danh mục con 33', 'danh-muc-con-33', 1, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(34, 'Danh mục con 34', 'danh-muc-con-34', 2, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(35, 'Danh mục con 35', 'danh-muc-con-35', 3, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(36, 'Danh mục con 36', 'danh-muc-con-36', 4, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(37, 'Danh mục con 37', 'danh-muc-con-37', 5, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(38, 'Danh mục con 38', 'danh-muc-con-38', 6, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(39, 'Danh mục con 39', 'danh-muc-con-39', 15, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:35:58', 0),
	(40, 'Danh mục con 40', 'danh-muc-con-40', 16, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:36:04', 0),
	(41, 'Danh mục con 41', 'danh-muc-con-41', 1, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(42, 'Danh mục con 42', 'danh-muc-con-42', 2, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(43, 'Danh mục con 43', 'danh-muc-con-43', 3, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(44, 'Danh mục con 44', 'danh-muc-con-44', 4, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(45, 'Danh mục con 45', 'danh-muc-con-45', 5, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(46, 'Danh mục con 46', 'danh-muc-con-46', 6, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:31:53', 0),
	(47, 'Danh mục con 47', 'danh-muc-con-47', 15, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:35:58', 0),
	(48, 'Danh mục con 48', 'danh-muc-con-48', 16, 0, 0, '0000-00-00 00:00:00', '2018-04-22 22:36:04', 0),
	(49, 'Danh mục con 49', 'danh-muc-con-49', 2, 3, 3, '2018-04-23 22:13:00', '2018-04-23 22:14:36', 0);
/*!40000 ALTER TABLE `category_details` ENABLE KEYS */;

-- Dumping structure for table hangxachtayconan.contacts
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT '0',
  `user_id` bigint(20) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `deleted` tinyint(4) NOT NULL,
  `created_by` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` tinyint(4) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hangxachtayconan.contacts: ~0 rows (approximately)
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;

-- Dumping structure for table hangxachtayconan.feedbacks
DROP TABLE IF EXISTS `feedbacks`;
CREATE TABLE IF NOT EXISTS `feedbacks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `deleted` tinyint(4) NOT NULL,
  `created_by` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` tinyint(4) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hangxachtayconan.feedbacks: ~0 rows (approximately)
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;

-- Dumping structure for table hangxachtayconan.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_price` double NOT NULL DEFAULT '0',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1. Chưa xem, 2. Đang xử lý, 3. Đã giao hàng, 4. Hủy',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `created_by` bigint(20) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hangxachtayconan.orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table hangxachtayconan.order_details
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT '0',
  `product_id` bigint(20) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `created_by` bigint(20) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hangxachtayconan.order_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;

-- Dumping structure for table hangxachtayconan.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `resource` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table hangxachtayconan.permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table hangxachtayconan.posts
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` bigint(20) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table hangxachtayconan.posts: ~0 rows (approximately)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Dumping structure for table hangxachtayconan.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL DEFAULT '0',
  `category_detail_ids` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `sale_price` double DEFAULT '0',
  `image_thumbnail` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `image_slides` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0. Cũ, 1. Mới, 2. Hot',
  `specifications` text COLLATE utf8mb4_unicode_ci,
  `rating` float DEFAULT '0',
  `count_rating` float DEFAULT '0',
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hangxachtayconan.products: ~24 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT IGNORE INTO `products` (`id`, `category_id`, `category_detail_ids`, `name`, `slug`, `price`, `sale_price`, `image_thumbnail`, `image_slides`, `short_description`, `description`, `status`, `specifications`, `rating`, `count_rating`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted`) VALUES
	(1, 1, ',1,9,17,25,33,', 'Aedream Black Raspberry Extract saadddddd', 'aedream-black-raspberry-extract-1692300', 1, 0, '/images/products/1.jpg', '/images/products/1.jpg,/images/products/2.jpg,/images/products/3.jpg,/images/products/4.jpg', 'Product Code: ABRE-30PCH Availability: In Stock', 'Richest source of Vitamin C1', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>30 Pouches x 100ml</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ingredients</td>\r\n			<td>\r\n			<p>Black Raspberry&nbsp;95%</p>\r\n\r\n			<p>Oligosaccharide&nbsp;5%</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>3.4kg</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 1, '2016-07-01 22:57:34', '2017-07-02 03:11:02', 0),
	(2, 1, '17,25,33,10,', 'AEDREAM ORGANIC BLUEBERRY EXTRACT', 'aedream-organic-blueberry-extract-0022900', 22222, 1111, '/images/products/2.jpg', '/images/products/6.jpg,/images/products/5.jpg,/images/products/7.jpg,/images/products/8.jpg', 'Product Code: AOBE-30PCH Availability: In Stock', 'Richest source of Vitamin C2', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>30 Pouches x 80ml</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ingredients</td>\r\n			<td>\r\n			<p>Blueberry 95%</p>\r\n\r\n			<p>Oligosaccharide 5%</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>2.83kg</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 1, '2016-07-02 03:13:30', '2016-07-02 04:30:20', 0),
	(3, 1, ',1,9,17,25,10,', 'ASAMI COLLAGEN EX10000', 'asami-collagen-ex10000-1221100', 2, 2342, '/images/products/3.jpg', '/images/products/15.jpg,/images/products/9.jpg,/images/products/10.jpg,/images/products/11.jpg', 'Product Code: AC10000-10PCH Availability: In Stock', 'Richest source of Vitamin C3', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>10 Pouches x 50ml</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ingredients</td>\r\n			<td>\r\n			<p>Fish Collagen Peptide</p>\r\n\r\n			<p>Rose Petal Extract</p>\r\n\r\n			<p>Seaweed Extract</p>\r\n\r\n			<p>Camellia Japonica Seed Extract</p>\r\n\r\n			<p>CoEnzyme Q10</p>\r\n\r\n			<p>Elastin Peptide</p>\r\n\r\n			<p>Hyaluronic Acid</p>\r\n\r\n			<p>Chondroitin Sulfate/Glucosamine Hydrochloride</p>\r\n\r\n			<p>L-Cystine</p>\r\n\r\n			<p>L-Carnitine</p>\r\n\r\n			<p>Calcium</p>\r\n\r\n			<p>Vitamin C</p>\r\n\r\n			<p>Multi Vitamins</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>610gm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 1, '2016-07-02 03:16:24', '2016-07-02 03:16:24', 0),
	(4, 1, ',9,17,25,10,', 'FERMENT BLACK GARLIC', 'ferment-black-garlic-2118900', 3, 345345, '/images/products/4.jpg', '/images/products/1.jpg,/images/products/2.jpg,/images/products/3.jpg,/images/products/4.jpg', 'Product Code: FBG-90CPS Availability: In Stock68.00 ', 'Richest source of Vitamin C4', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>90 Capsules x 250mg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Ingredients</p>\r\n\r\n			<p>(Per 3 Capsules)</p>\r\n			</td>\r\n			<td>\r\n			<p>510mg Ferment Black Garlic Extract</p>\r\n\r\n			<p>150mg Black Onion Extract</p>\r\n\r\n			<p>90mg Dextrin</p>\r\n\r\n			<p>90mg Ester</p>\r\n\r\n			<p>90mg Silicon Dioxide.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>55gm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 1, '2016-07-02 03:18:26', '2016-07-02 03:18:26', 0),
	(5, 2, ',2,10,18,26,34,', 'GLUTATHIONE GOLD', 'glutathione-gold-5197100', 4, 0, '/images/products/5.jpg', '/images/products/6.jpg,/images/products/5.jpg,/images/products/7.jpg,/images/products/8.jpg', 'Product Code: GG-60SCH Availability: In Stock', 'Richest source of Vitamin C5', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>60 Sachets x 2g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ingredients</td>\r\n			<td>\r\n			<p>Yeast Extract</p>\r\n\r\n			<p>Gluthathione</p>\r\n\r\n			<p>Dextrin</p>\r\n\r\n			<p>Milk Sugar</p>\r\n\r\n			<p>Apple Juice Powder</p>\r\n\r\n			<p>L-Ornitine</p>\r\n\r\n			<p>Malic</p>\r\n\r\n			<p>Apple Flavour</p>\r\n\r\n			<p>Sucralose</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>193gm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 1, '2016-07-02 03:21:00', '2016-07-02 03:21:00', 0),
	(6, 2, ',18,26,34,', 'HIGH GOLD VITAMIN C 1000', 'high-gold-vitamin-c-1000-7703300', 5, 0, '/images/products/6.jpg', '/images/products/15.jpg,/images/products/9.jpg,/images/products/10.jpg,/images/products/11.jpg', 'Product Code: HGVC-30SCH Availability: In Stock', 'Richest source of Vitamin C6', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>30 Sachet x 3g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ingredients</td>\r\n			<td>\r\n			<p>1050mg Vitamin C</p>\r\n\r\n			<p>900mg Powder Sugar</p>\r\n\r\n			<p>876.9mg Milk Sugar</p>\r\n\r\n			<p>60mg Honey Powder</p>\r\n\r\n			<p>30mg Camcam (Myrciariadubia)</p>\r\n\r\n			<p>30mg Acerola</p>\r\n\r\n			<p>30mg Lemon Flavour</p>\r\n\r\n			<p>9mg Starch</p>\r\n\r\n			<p>7.5mg Rose HP</p>\r\n\r\n			<p>5.4mg Sucralose</p>\r\n\r\n			<p>1.2mg Vitamin B2</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>123gm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 1, '2016-07-02 03:22:11', '2016-07-02 03:22:11', 0),
	(7, 2, ',2,10,18,4,', 'KAKI GOLD (JAPANESE OYSTER WITH SHITAKE EXTRACT)', 'kaki-gold-japanese-oyster-with-shitake-extract-5347800', 69, 69, '/images/products/7.jpg', '/images/products/1.jpg,/images/products/2.jpg,/images/products/3.jpg,/images/products/4.jpg', 'Product Code: JOEKG-90SGL Availability: In Stock', 'Richest source of Vitamin C7', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>90 Softgels x 450mg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Ingredients</p>\r\n\r\n			<p>(Per 3 Softgels)</p>\r\n			</td>\r\n			<td>\r\n			<p>390mg Japanese Oyster Extract Powder</p>\r\n\r\n			<p>360mg Japanese Oyster Extract</p>\r\n\r\n			<p>90mg Shitake Extract</p>\r\n\r\n			<p>60mg Vitamin E</p>\r\n\r\n			<p>369mg Safflower Oil</p>\r\n\r\n			<p>81mg Beewax</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>65gm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 1, '2016-07-02 03:24:03', '2016-07-02 03:24:15', 0),
	(8, 2, ',10,18,26,', 'MANNAN CGF EXTRACT', 'mannan-cgf-extract-7082200', 6, 0, '/images/products/8.jpg', '/images/products/6.jpg,/images/products/5.jpg,/images/products/7.jpg,/images/products/8.jpg', 'Product Code: MCGF-720ML Availability: In Stock', 'Richest source of Vitamin C8', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>720ml</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ingredients</td>\r\n			<td>\r\n			<p>CGF</p>\r\n\r\n			<p>Honey</p>\r\n\r\n			<p>Oligosaccharide</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>1.57kg</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 1, '2016-07-02 03:25:54', '2016-07-02 03:25:54', 0),
	(9, 3, ',11,19,27,35,10,', 'MANNAN CHLORELLA ACE GOLD (1500 TABLETS)', 'mannan-chlorella-ace-gold-1500-tablets-2907700', 7, 0, '/images/products/9.jpg', '/images/products/6.jpg,/images/products/5.jpg,/images/products/7.jpg,/images/products/8.jpg', 'Product Code: MCAG-1500TBL Availability: In Stock', 'Richest source of Vitamin C9', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>1500 Tablets x 200mg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Ingredients</p>\r\n			</td>\r\n			<td>100% Top Grade Chlorella Powder</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>764gm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 1, '2016-07-02 03:38:13', '2016-07-02 03:38:31', 0),
	(10, 3, ',19,27,35,10,', 'MANNAN CHLORELLA ACE GOLD (300 TABLETS)', 'mannan-chlorella-ace-gold-300-tablets-5609700', 8, 0, '/images/products/10.jpg', '/images/products/1.jpg,/images/products/2.jpg,/images/products/3.jpg,/images/products/4.jpg', 'Product Code: MCAG-300TBL Availability: In Stock', 'Richest source of Vitamin C10', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>300 Tablets x 200mg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Ingredients</p>\r\n			</td>\r\n			<td>100% Top Grade Chlorella Powder</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>gm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 1, '2016-07-02 03:40:33', '2016-07-02 03:40:33', 0),
	(11, 3, ',11,19,27,10,', 'MANNAN SPIRULINA', 'mannan-spirulina-462800', 9, 456, '/images/products/11.jpg', '/images/products/6.jpg,/images/products/5.jpg,/images/products/7.jpg,/images/products/8.jpg', 'Product Code: MS-1300TBL Availability: In Stock', 'Richest source of Vitamin C11', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>1300 Tablets x 200mg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Ingredients</p>\r\n			</td>\r\n			<td>100% Top Grade Spirulina Powder</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>723gm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 1, '2016-07-02 03:42:28', '2016-07-02 04:56:44', 0),
	(12, 5, ',5,13,21,29,10,', 'NATTOKINASE SOD', 'nattokinase-sod-745300', 98, 0, '/images/products/12.jpg', '/images/products/6.jpg,/images/products/5.jpg,/images/products/7.jpg,/images/products/8.jpg', 'Product Code: NTK-90CPS Availability: In Stock', 'Richest source of Vitamin C12', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>90 Capsules x 300mg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Ingredients</p>\r\n			</td>\r\n			<td>\r\n			<p>Fermented Soybean Extract</p>\r\n\r\n			<p>GMT (Fermented Rice Embryo &amp; Soybean Extract)</p>\r\n\r\n			<p>Safflower Oil</p>\r\n\r\n			<p>Glycerlin Fatty Acid Ester.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>92gm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 1, '2016-07-02 04:07:11', '2016-07-02 04:07:11', 0),
	(13, 5, ',1,9,17,25,10,', 'PURE FISH COLLAGEN', 'pure-fish-collagen-0082300', 67, 567567, '/images/products/13.jpg', '/images/products/1.jpg,/images/products/2.jpg,/images/products/3.jpg,/images/products/4.jpg', 'Product Code: PFC-300TBL Availability: In Stock', 'Richest source of Vitamin C13', 0, '<p>Content300 Tablets x 200mg</p>\r\n\r\n<p>Ingredients</p>\r\n\r\n<p>Fish Collagen</p>\r\n\r\n<p>Chondroitin</p>\r\n\r\n<p>Royal Jelly</p>\r\n\r\n<p>Vitamin C</p>\r\n\r\n<p>Calcium</p>\r\n\r\n<p>Gross Weight90gm</p>\r\n', 0, 0, 1, 1, '2016-07-02 04:11:39', '2016-07-02 04:11:39', 0),
	(14, 5, ',5,13,21,37,45,10,', 'SILKY AMINO', 'silky-amino-3643600', 4555553, 2423455, '/images/products/14.jpg', '/images/products/15.jpg,/images/products/9.jpg,/images/products/10.jpg,/images/products/11.jpg', 'Product Code: SA-60SCH Availability: In Stock', 'Richest source of Vitamin C14', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>60 Sachets x 3g</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Ingredients</p>\r\n			</td>\r\n			<td>\r\n			<p>Silk Peptide Powder</p>\r\n\r\n			<p>Sugaralose</p>\r\n\r\n			<p>Leucine</p>\r\n\r\n			<p>Fish Collagen Peptide</p>\r\n\r\n			<p>Dextrin</p>\r\n\r\n			<p>Valine Isoleucine</p>\r\n\r\n			<p>Citric Acid</p>\r\n\r\n			<p>Lemon Flavour</p>\r\n\r\n			<p>Ornitine</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>250gm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 1, '2016-07-02 04:13:17', '2016-07-02 04:13:17', 0),
	(15, 2, ',49,10,26,42,2,', 'SOD BALANCER', 'sod-balancer-8664700', 56, 345345, '/images/products/15.jpg', '/images/products/15.jpg,/images/products/9.jpg,/images/products/10.jpg,/images/products/11.jpg', '&lt;p&gt;Product Code: SODB-30PCH Availability: In Stock&lt;/p&gt;\r\n', '&lt;p&gt;Richest source of Vitamin C15&lt;/p&gt;\r\n', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>30 Pouches x 30ml</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Ingredients</td>\r\n			<td>\r\n			<p>GMT (fermented rice embryo - soy bean extract)</p>\r\n\r\n			<p>Glucose</p>\r\n\r\n			<p>Green Tea Extract</p>\r\n\r\n			<p>DL-Alanine</p>\r\n\r\n			<p>Rooibos Tea Pure Powder (Aspalathos Linearis)</p>\r\n\r\n			<p>Oligosaccharide</p>\r\n\r\n			<p>Fiber</p>\r\n\r\n			<p>Ganoderma Lucidum Extract</p>\r\n\r\n			<p>Collagen</p>\r\n\r\n			<p>Crataegus Extract</p>\r\n\r\n			<p>Ascorbic Acid</p>\r\n\r\n			<p>Citric Acid</p>\r\n\r\n			<p>Caramel</p>\r\n\r\n			<p>Hyaluronic Acid</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>1.13kg</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 3, '2016-07-02 04:15:41', '2018-04-24 00:15:30', 0),
	(16, 5, ',5,13,21,10,', 'SUPER COLLAGEN COQ10', 'super-collagen-coq10-2350800', 128.1, 455656, '/images/products/16.jpg', '/images/products/6.jpg,/images/products/5.jpg,/images/products/7.jpg,/images/products/8.jpg', 'Product Code: SCCOQ10-720ML Availability: In Stock', 'Richest source of Vitamin C16', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>720ml</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Ingredients</p>\r\n			</td>\r\n			<td>\r\n			<p>Fish Collagen Peptide</p>\r\n\r\n			<p>CO-Q10</p>\r\n\r\n			<p>A-Lipoic Acid</p>\r\n\r\n			<p>Catechin</p>\r\n\r\n			<p>L-Carnitine</p>\r\n\r\n			<p>Glucosamine</p>\r\n\r\n			<p>Chondroitin</p>\r\n\r\n			<p>Hyaluronic Acid</p>\r\n\r\n			<p>Beta-Cartene</p>\r\n\r\n			<p>Milk Calcium</p>\r\n\r\n			<p>Elastin</p>\r\n\r\n			<p>Royal Jelly</p>\r\n\r\n			<p>Vitamin B1, B2, B6, C, D3, E</p>\r\n\r\n			<p>Magnesium </p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>1.59kg</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 1, '2016-07-02 04:17:58', '2016-07-02 04:34:11', 0),
	(17, 4, ',1,9,17,25,', 'GINGKO LEAF EXTRACT', 'gingko-leaf-extract-4809300', 545, 3434, '/images/products/17.jpg', '/images/products/15.jpg,/images/products/9.jpg,/images/products/10.jpg,/images/products/11.jpg', '', 'Richest source of Vitamin C17', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>90 Softgels x 250mg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Ingredients</p>\r\n\r\n			<p>(Per 2 Softgels)</p>\r\n			</td>\r\n			<td>\r\n			<p>130mg Ginkgo Leaf Extract</p>\r\n\r\n			<p>100mg Pine Leaf Extract</p>\r\n\r\n			<p>20mg Vitamin E</p>\r\n\r\n			<p>40mg Saffron Powder</p>\r\n\r\n			<p>40mg Soybean Lecithin</p>\r\n\r\n			<p>170mg Safflower.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>70gm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 1, '2016-07-02 04:21:56', '2016-07-02 04:21:56', 0),
	(18, 4, ',36,44,20,', 'SUPER DHA 46', 'super-dha-46-4008900', 567, 0, '/images/products/18.jpg', '/images/products/1.jpg,/images/products/2.jpg,/images/products/3.jpg,/images/products/4.jpg', '', 'Richest source of Vitamin C18', 0, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Content</td>\r\n			<td>120 Softgels x 250mg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Ingredients</p>\r\n			</td>\r\n			<td>\r\n			<p>46% Pure DHA</p>\r\n\r\n			<p>4% EPA</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Gross Weight</td>\r\n			<td>75gm</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 1, 1, '2016-07-02 04:24:16', '2016-07-02 04:24:16', 0),
	(19, 5, ',13,29,37,45,', 'aaaaa 1 22222 3333 444', 'aaaaa-adfasdfasdf-4869900', 1231231123, 34234231, '/images/products/19.jpg', '/images/products/1.jpg,/images/products/2.jpg,/images/products/3.jpg,/images/products/4.jpg', '&lt;p&gt;fasfdas fasdf &amp;aacute;dfasdfasdf afd &amp;agrave;asfds&lt;/p&gt;\r\n', '&lt;p&gt;lkj aksdfasfdasfawer qẻ waer werwa re&lt;/p&gt;\r\n', 2, NULL, 0, 0, 3, 3, '2017-12-11 22:50:38', '2018-04-24 00:15:09', 0),
	(20, 16, ',8,16,24,40,48,', 'xbhgdfg', 'xbhgdfg-1650200', 46456456, 0, '/images/products/20.jpg', '/images/products/1.jpg,/images/products/2.jpg,/images/products/3.jpg,/images/products/4.jpg', '&lt;p&gt;fasfdas fasdf &amp;aacute;dfasdfasdf afd &amp;agrave;asfds&lt;/p&gt;\r\n', '&lt;p&gt;lkj aksdfasfdasfawer qẻ waer werwa re&lt;/p&gt;\r\n', 1, NULL, 0, 0, 3, 3, '2018-04-01 22:51:32', '2018-04-24 00:14:36', 0),
	(21, 2, ',1,9,17,25,', 'AAAAAAAAAAA', 'aaaaaaaaaaa-9049100', 243234, 234, '/images/products/8.jpg', '/images/products/1.jpg,/images/products/2.jpg,/images/products/3.jpg,/images/products/4.jpg', '', '', 0, NULL, 0, 0, 3, 3, '2018-04-23 23:00:04', '2018-04-23 23:00:04', 1),
	(22, 3, ',11,35,10,', 'zxcvzxcvzxcv', 'zxcvzxcvzxcv-0874300', 234234, 5345, '/images/products/8.jpg', '/images/products/1.jpg,/images/products/2.jpg,/images/products/3.jpg,/images/products/4.jpg', '', '', 2, NULL, 0, 0, 3, 3, '2018-04-23 23:01:36', '2018-04-23 23:01:36', 1),
	(23, 6, ',6,30,10,', 'cbxcncbncbn', 'cbxcncbncbn-8536500', 234, 0, '/images/products/8.jpg', '/images/products/6.jpg,/images/products/5.jpg,/images/products/7.jpg,/images/products/8.jpg', '&lt;p&gt;fasfdas fasdf &amp;aacute;dfasdfasdf afd &amp;agrave;asfds&lt;/p&gt;\r\n', '&lt;p&gt;lkj aksdfasfdasfawer qẻ waer werwa re&lt;/p&gt;\r\n', 1, NULL, 0, 0, 3, 3, '2018-04-23 23:10:31', '2018-04-23 23:26:46', 1),
	(24, 16, ',8,32,10,', 'xcvxcv', 'xcvxcv-390400', 234234, 123, '/images/products/8.jpg', '/images/products/1.jpg,/images/products/2.jpg,/images/products/3.jpg,/images/products/4.jpg', '&lt;p&gt;fasfdas fasdf &amp;aacute;dfasdfasdf afd &amp;agrave;asfds&lt;/p&gt;\r\n', '&lt;p&gt;lkj aksdfasfdasfawer qẻ waer werwa re&lt;/p&gt;\r\n', 2, NULL, 0, 0, 3, 3, '2018-04-23 23:13:36', '2018-04-23 23:26:31', 0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table hangxachtayconan.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `active` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hangxachtayconan.roles: ~4 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT IGNORE INTO `roles` (`id`, `name`, `active`) VALUES
	(1, 'Sys-Administrators', 'Y'),
	(2, 'Administrators', 'Y'),
	(3, 'Customer', 'Y'),
	(4, 'Shop_Privilege_Customer', 'Y');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table hangxachtayconan.ships
DROP TABLE IF EXISTS `ships`;
CREATE TABLE IF NOT EXISTS `ships` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `delivery_cost` double NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `company_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `address1` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `address2` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` bigint(20) NOT NULL DEFAULT '0',
  `created_by` bigint(20) NOT NULL,
  `deleted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table hangxachtayconan.ships: ~8 rows (approximately)
/*!40000 ALTER TABLE `ships` DISABLE KEYS */;
INSERT IGNORE INTO `ships` (`id`, `order_id`, `delivery_cost`, `first_name`, `last_name`, `company_name`, `email`, `phone`, `address1`, `address2`, `updated_at`, `created_at`, `updated_by`, `created_by`, `deleted`) VALUES
	(1, 1, 20, 'eeeeeeeeeeeee', 'fffffffffffffffffff', 'ddddddddd', '0', '0', 'adsf ádf cvzxcv xczvzxv zxcv xzcvzxcv zxcv', '0', '2016-07-07 10:24:32', '2016-07-07 10:24:32', 0, 0, 0),
	(2, 2, 20, 'eeeeeeeeeeeee', 'fffffffffffffffffff', 'ddddddddd', '0', '0', 'adsf ádf cvzxcv xczvzxv zxcv xzcvzxcv zxcv', '0', '2016-07-07 10:37:00', '2016-07-07 10:37:00', 0, 0, 0),
	(3, 3, 20, 'eeeeeeeeeeeee', 'fffffffffffffffffff', 'ddddddddd', '0', '0', 'adsf ádf cvzxcv xczvzxv zxcv xzcvzxcv zxcv', '0', '2016-07-07 10:39:00', '2016-07-07 10:39:00', 0, 0, 0),
	(4, 4, 20, 'eeeeeeeeeeeee', 'fffffffffffffffffff', 'ddddddddd', '0', '0', 'adsf ádf cvzxcv xczvzxv zxcv xzcvzxcv zxcv', '0', '2016-07-07 10:43:20', '2016-07-07 10:43:20', 0, 0, 0),
	(5, 5, 20, 'ẻawer ', 'aqwer ưer ư', ' ádf ádfa sdfa s', '0', '0', '23412 3123 123 ', '0', '2016-07-07 10:43:48', '2016-07-07 10:43:48', 0, 0, 0),
	(6, 6, 20, 'ẻawer ', 'aqwer ưer ư', ' ádf ádfa sdfa s', '0', '0', '23412 3123 123 ', '0', '2016-07-07 10:44:31', '2016-07-07 10:44:31', 0, 0, 0),
	(7, 8, 0, 'ádf ádf á', 'df àd ádf', ' àd ádf ádf', '0', '0', ' ádf ádf ', '0', '2016-07-07 11:14:11', '2016-07-07 11:14:11', 0, 0, 0),
	(8, 9, 0, 'dhf df', 'hg dfhgdf hdf', 'hg dfhg dfhg', '0', '0', ' dfhdf hd', '0', '2016-07-07 11:18:04', '2016-07-07 11:18:04', 0, 0, 0);
/*!40000 ALTER TABLE `ships` ENABLE KEYS */;

-- Dumping structure for table hangxachtayconan.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` tinyint(4) NOT NULL,
  `avatar` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address1` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accept_receive_mail` tinyint(4) NOT NULL DEFAULT '1',
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT '1',
  `sub_domain` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_domain` tinyint(4) DEFAULT '0',
  `domain` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT '0',
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table hangxachtayconan.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`id`, `first_name`, `name`, `email`, `password`, `phone`, `mobile`, `role_id`, `avatar`, `address1`, `address2`, `city`, `post_code`, `country`, `accept_receive_mail`, `code`, `sub_domain`, `use_domain`, `domain`, `parent_id`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted`) VALUES
	(1, 'sys-admin', 'sys-admin', 'admin@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '123456781', NULL, 1, '/files/images/user_profile.png', NULL, NULL, NULL, NULL, NULL, 1, '1', '0', 0, NULL, 0, 0, 0, '2016-04-18 14:19:36', '2016-04-19 10:12:19', 0),
	(3, 'tuan', 'vu 324', 'tuanvu101289@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '234234234', '3234234', 4, NULL, 'sfdasd fasdf', ' ádf ádfa sdf', 'ádf ádf a 2 eqr sdf ádfasdf', '123456789', NULL, 1, '1', NULL, 0, NULL, 0, 0, 3, '2016-07-07 15:17:53', '2016-07-07 15:19:09', 0),
	(4, 'minh', 'tri', 'minhtri@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', '123123', NULL, 1, '/files/images/user_profile.png', NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, 0, NULL, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
