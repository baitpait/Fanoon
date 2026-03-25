CREATE DATABASE IF NOT EXISTS `anagmgxt_elitevape` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `anagmgxt_elitevape`;

-- MySQL dump 10.13  Distrib 9.5.0, for macos26.1 (arm64)
--
-- Host: localhost    Database: elitevape_new_temp
-- ------------------------------------------------------
-- Server version	9.5.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Elite','vape','970597177755','elitevape@baitpait.com','2026-02-26-69a04ea02c8a6.webp','$2y$10$yKCH/jyN5VDhVOBQ/pz5mOryicL5T7ym.5xUzuyLrCnWDECk8q9sS','XnY8I8z9RhnZMXNK38y2ZAK8bl5nOvjB5EvUzpLVKMBbSSBJgtW01IKwi76M','2026-02-26 04:12:56','2026-02-28 21:05:15',NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name_en` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `names` json DEFAULT NULL,
  `delivery_charge` double NOT NULL DEFAULT '0',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `areas_branch_id_index` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,1,'','الضفة الغربية','{\"ar\": \"الضفة الغربية\"}',20,1,'2026-02-26 18:43:15','2026-02-26 18:43:15'),(2,1,'','عرب الداخل','{\"ar\": \"عرب الداخل\"}',70,2,'2026-02-26 18:43:24','2026-02-26 18:43:24'),(3,1,'Jerusalem','القدس','{\"ar\": \"القدس\", \"en\": \"Jerusalem\"}',30,3,'2026-03-05 20:24:47','2026-03-05 20:24:47');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (3,NULL,'2026-03-05 20:05:33','2026-03-05 20:05:33'),(5,NULL,'2026-03-05 20:05:50','2026-03-05 20:05:50');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `banner_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'primary',
  `placement` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banners_placement_index` (`placement`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'يطا','2026-02-26-69a03a2acb91f.webp',33,1,'2026-02-26 19:18:50','2026-02-26 19:18:50',NULL,'primary',NULL);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `login_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coverage` int unsigned NOT NULL DEFAULT '1',
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,NULL,'Dinajpur','newb@gmail.com','$2y$10$ty7WZIxF2GQ0ajs5xsEnrOzOlDc9UqL4X6NIDRx5ofm3NLcUm1j0S','22.848823','91.390306','Hazi osman gani lane',1,0,'2021-02-24 16:45:49','2021-03-06 11:31:01',500,NULL,NULL,NULL);
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_settings`
--

DROP TABLE IF EXISTS `business_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_settings`
--

LOCK TABLES `business_settings` WRITE;
/*!40000 ALTER TABLE `business_settings` DISABLE KEYS */;
INSERT INTO `business_settings` VALUES (1,'self_pickup','0','2021-01-06 12:55:51','2026-02-28 21:04:49'),(3,'store_name','Elite vape','2026-02-27 04:33:39','2026-02-28 21:04:49'),(4,'currency','ILS',NULL,'2026-02-26 04:42:11'),(5,'logo','2026-02-28-69a2cc994fdf3.webp','2026-02-27 04:33:39','2026-02-28 18:08:09'),(6,'mail_config','{\"status\":0,\"name\":\"Delivery APP\",\"host\":\"mail.demo.com\",\"driver\":\"smtp\",\"port\":\"587\",\"username\":\"info@demo.com\",\"email_id\":\"info@demo.com\",\"encryption\":\"tls\",\"password\":\"demo\"}',NULL,'2025-01-04 21:59:15'),(7,'delivery_charge','100',NULL,NULL),(8,'ssl_commerz_payment','{\"status\":\"0\",\"store_id\":null,\"store_password\":null}',NULL,'2021-06-12 11:59:06'),(9,'paypal','{\"status\":\"0\",\"paypal_client_id\":null,\"paypal_secret\":null}',NULL,'2021-06-12 11:59:20'),(10,'stripe','{\"status\":\"1\",\"api_key\":null,\"published_key\":null}',NULL,'2021-06-12 11:59:25'),(11,'phone','970597177755',NULL,'2026-02-28 21:04:49'),(13,'footer_text','copyright',NULL,NULL),(14,'address','الخليل',NULL,'2026-02-26 04:42:11'),(15,'email_address','info@elitevape.com',NULL,'2026-02-26 04:42:11'),(16,'cash_on_delivery','{\"status\":\"1\"}',NULL,'2021-02-12 01:39:36'),(17,'email_verification',NULL,NULL,'2026-02-26 04:42:11'),(18,'digital_payment','{\"status\":\"1\"}','2021-01-31 02:38:54','2021-01-31 02:38:58'),(19,'terms_and_conditions','{\"ar\":\"<h1>Terms and Condition<\\/h1><p><br><\\/p><ol><li>Hello, terms and conditions.......<\\/li><li>Hello<\\/li><\\/ol>\",\"en\":\"<h1 style=\\\";text-align:left;direction:ltr\\\">Terms and Condition<\\/h1><p style=\\\";text-align:left;direction:ltr\\\"><br><\\/p><ol style=\\\";text-align:left;direction:ltr\\\"><li style=\\\";text-align:left;direction:ltr\\\"> Hello, terms and conditions.......<\\/li><li style=\\\";text-align:left;direction:ltr\\\"> Hello<\\/li><\\/ol>\",\"he\":\"<h1>\\u05ea\\u05e0\\u05d0\\u05d9\\u05dd \\u05d5\\u05d4\\u05d2\\u05d1\\u05dc\\u05d5\\u05ea<\\/h1><p><br><\\/p><ol><li> \\u05e9\\u05dc\\u05d5\\u05dd, \\u05ea\\u05e0\\u05d0\\u05d9\\u05dd \\u05d5\\u05d4\\u05d2\\u05d1\\u05dc\\u05d5\\u05ea.......<\\/li><li> \\u05e9\\u05dc\\u05d5\\u05dd<\\/li><\\/ol>\"}',NULL,'2026-02-28 18:49:04'),(20,'fcm_topic','',NULL,NULL),(21,'fcm_project_id','3f34f34',NULL,NULL),(22,'push_notification_key','demo',NULL,NULL),(24,'order_pending_message','{\"status\":1,\"message\":\"Your order has been placed successfully.\"}',NULL,NULL),(25,'order_processing_message','{\"status\":1,\"message\":\"Your order is going to the cook\"}',NULL,NULL),(26,'out_for_delivery_message','{\"status\":0,\"message\":\"Order out for delivery.\"}',NULL,NULL),(27,'order_delivered_message','{\"status\":1,\"message\":\"delivered\"}',NULL,NULL),(28,'delivery_boy_assign_message','{\"status\":1,\"message\":\"boy assigned\"}',NULL,NULL),(29,'delivery_boy_start_message','{\"status\":1,\"message\":\"start delivery\"}',NULL,NULL),(30,'delivery_boy_delivered_message','{\"status\":1,\"message\":\"boy delivered\"}',NULL,NULL),(32,'order_confirmation_msg','{\"status\":1,\"message\":\"Your order has been confirmed.\"}',NULL,NULL),(33,'razor_pay','{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}','2021-02-14 17:15:12','2021-06-12 11:59:11'),(34,'location_coverage','{\"status\":1,\"longitude\":\"91.410747\",\"latitude\":\"22.986282\",\"coverage\":\"20\"}',NULL,NULL),(35,'minimum_order_value','10',NULL,'2026-02-26 04:42:11'),(36,'about_us','{\"ar\":\"<p>fffvawvwvw<\\/p>\",\"en\":\"\",\"he\":\"\"}',NULL,'2021-05-31 16:26:16'),(37,'privacy_policy','{\"ar\":\"<div class=\\\"ql-editor\\\" data-gramm=\\\"false\\\" contenteditable=\\\"true\\\" spellcheck=\\\"false\\\"><p>hello<\\/p><\\/div><grammarly-extension data-grammarly-shadow-root=\\\"true\\\" style=\\\"position: absolute; top: 0px; left: -1px; pointer-events: none; z-index: auto;\\\" class=\\\"cGcvT\\\"><\\/grammarly-extension><grammarly-extension data-grammarly-shadow-root=\\\"true\\\" style=\\\"mix-blend-mode: darken; position: absolute; top: 0px; left: -1px; pointer-events: none; z-index: auto;\\\" class=\\\"cGcvT\\\"><\\/grammarly-extension><div class=\\\"ql-clipboard\\\" contenteditable=\\\"true\\\" tabindex=\\\"-1\\\"><\\/div><div class=\\\"ql-tooltip ql-hidden\\\"><a class=\\\"ql-preview\\\" target=\\\"_blank\\\" href=\\\"about:blank\\\"><\\/a><input type=\\\"text\\\" data-formula=\\\"e=mc^2\\\" data-link=\\\"https:\\/\\/quilljs.com\\\" data-video=\\\"Embed URL\\\"><a class=\\\"ql-action\\\"><\\/a><a class=\\\"ql-remove\\\"><\\/a><\\/div>\",\"en\":\"\",\"he\":\"\"}',NULL,'2021-05-23 16:02:03'),(38,'senang_pay','{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}',NULL,'2021-06-12 11:59:51'),(39,'paystack','{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}',NULL,'2021-06-12 11:59:38'),(40,'point_per_currency',NULL,NULL,'2026-02-26 04:42:11'),(41,'language','[\"ar\",\"en\",\"he\"]',NULL,'2026-02-26 18:35:17'),(42,'time_zone','Asia/Jerusalem',NULL,'2026-02-26 04:42:11'),(43,'internal_point','{\"status\":null}','2021-06-01 11:36:10','2021-06-01 11:36:10'),(44,'phone_verification',NULL,NULL,'2026-02-26 04:42:11'),(45,'msg91_sms','{\"status\":0,\"template_id\":null,\"authkey\":null}',NULL,NULL),(46,'2factor_sms','{\"status\":\"0\",\"api_key\":null}',NULL,NULL),(47,'nexmo_sms','{\"status\":0,\"api_key\":null,\"api_secret\":null,\"signature_secret\":\"\",\"private_key\":\"\",\"application_id\":\"\",\"from\":null,\"otp_template\":null}',NULL,NULL),(48,'twilio_sms','{\"status\":0,\"sid\":null,\"token\":null,\"from\":null,\"otp_template\":null}',NULL,NULL),(49,'pagination_limit','20',NULL,'2026-02-26 04:42:11'),(50,'map_api_key','',NULL,NULL),(51,'delivery_management','{\"status\":0,\"min_shipping_charge\":0,\"shipping_per_km\":0}',NULL,NULL),(52,'play_store_config','{\"status\":\"\",\"link\":\"\",\"min_version\":\"\"}',NULL,NULL),(53,'app_store_config','{\"status\":\"\",\"link\":\"\",\"min_version\":\"\"}',NULL,NULL),(54,'dm_self_registration','0',NULL,'2026-02-26 04:42:11'),(55,'maximum_otp_hit','5',NULL,NULL),(56,'otp_resend_time','60',NULL,NULL),(57,'temporary_block_time','120',NULL,NULL),(58,'maximum_login_hit','5',NULL,NULL),(59,'temporary_login_block_time','120',NULL,NULL),(60,'cookies','{\"status\":\"1\",\"text\":{\"ar\":\"\\u0646\\u0633\\u062a\\u062e\\u062f\\u0645 \\u0645\\u0644\\u0641\\u0627\\u062a \\u062a\\u0639\\u0631\\u064a\\u0641 \\u0627\\u0644\\u0627\\u0631\\u062a\\u0628\\u0627\\u0637 (Cookies) \\u0644\\u062a\\u062d\\u0633\\u064a\\u0646 \\u062a\\u062c\\u0631\\u0628\\u062a\\u0643 \\u0641\\u064a \\u062a\\u0635\\u0641\\u062d \\u0645\\u0648\\u0642\\u0639\\u0646\\u0627\\u060c \\u0648\\u062a\\u062d\\u0644\\u064a\\u0644 \\u0627\\u0644\\u0623\\u062f\\u0627\\u0621\\u060c \\u0648\\u062a\\u062e\\u0635\\u064a\\u0635 \\u0627\\u0644\\u0645\\u062d\\u062a\\u0648\\u0649 \\u0648\\u0627\\u0644\\u0625\\u0639\\u0644\\u0627\\u0646\\u0627\\u062a \\u0628\\u0645\\u0627 \\u064a\\u062a\\u0646\\u0627\\u0633\\u0628 \\u0645\\u0639 \\u0627\\u0647\\u062a\\u0645\\u0627\\u0645\\u0627\\u062a\\u0643. \\u0628\\u0627\\u0644\\u0627\\u0633\\u062a\\u0645\\u0631\\u0627\\u0631 \\u0641\\u064a \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u0643 \\u0644\\u0644\\u0645\\u0648\\u0642\\u0639\\u060c \\u0641\\u0625\\u0646\\u0643 \\u062a\\u0648\\u0627\\u0641\\u0642 \\u0639\\u0644\\u0649 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u0646\\u0627 \\u0644\\u0645\\u0644\\u0641\\u0627\\u062a \\u062a\\u0639\\u0631\\u064a\\u0641 \\u0627\\u0644\\u0627\\u0631\\u062a\\u0628\\u0627\\u0637 \\u0648\\u0641\\u0642\\u064b\\u0627 \\u0644\\u0633\\u064a\\u0627\\u0633\\u0629 \\u0627\\u0644\\u062e\\u0635\\u0648\\u0635\\u064a\\u0629 \\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0628\\u0646\\u0627. \\u064a\\u0645\\u0643\\u0646\\u0643 \\u0625\\u062f\\u0627\\u0631\\u0629 \\u062a\\u0641\\u0636\\u064a\\u0644\\u0627\\u062a\\u0643 \\u0623\\u0648 \\u062a\\u0639\\u0637\\u064a\\u0644 \\u0645\\u0644\\u0641\\u0627\\u062a \\u062a\\u0639\\u0631\\u064a\\u0641 \\u0627\\u0644\\u0627\\u0631\\u062a\\u0628\\u0627\\u0637 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0625\\u0639\\u062f\\u0627\\u062f\\u0627\\u062a \\u0627\\u0644\\u0645\\u062a\\u0635\\u0641\\u062d \\u0627\\u0644\\u062e\\u0627\\u0635 \\u0628\\u0643.\",\"en\":\"We use cookies to improve your browsing experience on our website, analyze performance, and personalize content and advertising to match your interests. By continuing to use the site, you consent to our use of cookies in accordance with our Privacy Policy. You can manage your preferences or disable cookies through your browser settings.\",\"he\":\"\\u05d0\\u05e0\\u05d5 \\u05de\\u05e9\\u05ea\\u05de\\u05e9\\u05d9\\u05dd \\u05d1\\u05e7\\u05d5\\u05d1\\u05e6\\u05d9 Cookie \\u05db\\u05d3\\u05d9 \\u05dc\\u05e9\\u05e4\\u05e8 \\u05d0\\u05ea \\u05d7\\u05d5\\u05d5\\u05d9\\u05d9\\u05ea \\u05d4\\u05d2\\u05dc\\u05d9\\u05e9\\u05d4 \\u05e9\\u05dc\\u05da \\u05d1\\u05d0\\u05ea\\u05e8 \\u05e9\\u05dc\\u05e0\\u05d5, \\u05dc\\u05e0\\u05ea\\u05d7 \\u05d1\\u05d9\\u05e6\\u05d5\\u05e2\\u05d9\\u05dd \\u05d5\\u05dc\\u05d4\\u05ea\\u05d0\\u05d9\\u05dd \\u05d0\\u05d9\\u05e9\\u05d9\\u05ea \\u05ea\\u05d5\\u05db\\u05df \\u05d5\\u05e4\\u05e8\\u05e1\\u05d5\\u05dd \\u05d1\\u05d4\\u05ea\\u05d0\\u05dd \\u05dc\\u05ea\\u05d7\\u05d5\\u05de\\u05d9 \\u05d4\\u05e2\\u05e0\\u05d9\\u05d9\\u05df \\u05e9\\u05dc\\u05da. \\u05e2\\u05dc \\u05d9\\u05d3\\u05d9 \\u05d4\\u05de\\u05e9\\u05da \\u05d4\\u05e9\\u05d9\\u05de\\u05d5\\u05e9 \\u05d1\\u05d0\\u05ea\\u05e8, \\u05d4\\u05e0\\u05da \\u05de\\u05e1\\u05db\\u05d9\\u05dd \\u05dc\\u05e9\\u05d9\\u05de\\u05d5\\u05e9 \\u05e9\\u05dc\\u05e0\\u05d5 \\u05d1\\u05e7\\u05d5\\u05d1\\u05e6\\u05d9 Cookie \\u05d1\\u05d4\\u05ea\\u05d0\\u05dd \\u05dc\\u05de\\u05d3\\u05d9\\u05e0\\u05d9\\u05d5\\u05ea \\u05d4\\u05e4\\u05e8\\u05d8\\u05d9\\u05d5\\u05ea \\u05e9\\u05dc\\u05e0\\u05d5. \\u05d1\\u05d0\\u05e4\\u05e9\\u05e8\\u05d5\\u05ea\\u05da \\u05dc\\u05e0\\u05d4\\u05dc \\u05d0\\u05ea \\u05d4\\u05d4\\u05e2\\u05d3\\u05e4\\u05d5\\u05ea \\u05e9\\u05dc\\u05da \\u05d0\\u05d5 \\u05dc\\u05d4\\u05e9\\u05d1\\u05d9\\u05ea \\u05e7\\u05d5\\u05d1\\u05e6\\u05d9 Cookie \\u05d3\\u05e8\\u05da \\u05d4\\u05d2\\u05d3\\u05e8\\u05d5\\u05ea \\u05d4\\u05d3\\u05e4\\u05d3\\u05e4\\u05df \\u05e9\\u05dc\\u05da.\"}}',NULL,'2026-02-28 18:53:32'),(61,'fav_icon','2026-02-28-69a2cc995b4d1.webp','2026-02-27 04:33:39','2026-02-28 18:08:09'),(62,'map_api_server_key','',NULL,NULL),(63,'google_social_login','1',NULL,NULL),(64,'facebook_social_login','1',NULL,NULL),(65,'whatsapp','{\"status\":\"0\",\"number\":\"\"}',NULL,NULL),(66,'telegram','{\"status\":\"0\",\"user_name\":\"\"}',NULL,NULL),(67,'messenger','{\"status\":\"0\",\"user_name\":\"\"}',NULL,NULL),(68,'app_logo','2026-02-28-69a2cc9963f6f.webp','2026-02-27 04:33:39','2026-02-28 18:08:09'),(69,'push_notification_service_file_content','',NULL,NULL),(70,'maintenance_system_setup','[]',NULL,NULL),(71,'maintenance_duration_setup','{\"maintenance_duration\":\"until_change\",\"start_date\":null,\"end_date\":null}',NULL,NULL),(72,'maintenance_message_setup','{\"business_number\":1,\"business_email\":1,\"maintenance_message\":\"We are Cooking Up Something Special!\",\"message_body\":\"Our system is currently undergoing maintenance to bring you an even tastier experience. Hang tight while we make the dishes.\"}',NULL,NULL),(73,'firebase_otp_verification','{\"status\":0,\"web_api_key\":\"\"}',NULL,NULL),(74,'google_map_status','0',NULL,'2026-02-26 04:42:11'),(75,'apple_login','{\"status\":0, \"login_medium\":\"apple\",\"client_id\":\"\",\"client_secret\":\"\",\"team_id\":\"\",\"key_id\":\"\",\"service_file\":\"\",\"redirect_url\":\"\"}',NULL,NULL),(76,'currency_symbol_position','right','2026-02-26 04:42:05','2026-02-26 04:42:05'),(77,'country','PS','2026-02-26 04:42:11','2026-02-26 04:42:11'),(78,'guest_checkout','1','2026-02-26 04:42:11','2026-02-28 21:04:49'),(79,'cancellation_page','{\"status\":0,\"content\":{\"ar\":\"<p><br><\\/p>\",\"en\":\"<p>\\u064a\\u0628\\u0644\\u064a\\u0628\\u0644\\u064a\\u0628\\u0644\\u064a\\u0628\\u0644<\\/p>\",\"he\":\"<p><br><\\/p>\"}}',NULL,'2026-02-28 17:55:27'),(80,'refund_page','{\"status\":0,\"content\":{\"ar\":\"\",\"en\":\"\",\"he\":\"\"}}',NULL,NULL),(81,'return_page','{\"status\":0,\"content\":{\"ar\":\"<p><br><\\/p>\",\"en\":\"<p><br><\\/p>\",\"he\":\"<p><br><\\/p>\"}}',NULL,'2026-02-28 18:48:50'),(82,'app_store_url','','2026-02-27 04:09:39','2026-02-27 04:09:39'),(83,'play_store_url','','2026-02-27 04:09:39','2026-02-27 04:09:39'),(84,'footer_logo','','2026-02-27 04:09:39','2026-02-27 04:09:39'),(85,'footer_heading','','2026-02-27 04:09:39','2026-02-27 04:09:39'),(86,'footer_description','','2026-02-27 04:09:39','2026-02-27 04:09:39'),(87,'google_maps_url','','2026-02-27 04:09:39','2026-02-27 04:09:39'),(88,'loyalty_points_enabled','0','2026-03-05 21:16:02','2026-03-05 21:16:02'),(89,'loyalty_points_per_amount','1','2026-03-05 21:16:02','2026-03-05 21:16:02'),(90,'loyalty_amount_for_one_point','10','2026-03-05 21:16:02','2026-03-05 21:16:02'),(91,'default_minimum_stock_alert','5','2026-03-05 21:16:02','2026-03-05 21:16:02'),(92,'loyalty_point_redemption_value','0.5','2026-03-05 21:16:02','2026-03-05 21:16:02');
/*!40000 ALTER TABLE `business_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `level` tinyint unsigned NOT NULL DEFAULT '1',
  `position` int unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `banner_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (4,'أراجيل',NULL,0,1,0,1,'2026-02-26 17:52:27','2026-02-26 18:13:13','pngtree-elegant-hookah-for-tobacco-smoking-on-white-background-png-image_14709752.png',NULL,1),(5,'معسل',NULL,0,1,0,1,'2026-02-26 17:52:27','2026-02-26 18:13:16','Mazaya_orange_with_mint_1024x_2da052ac-cbdc-4e8a-87ea-b203a978f660.webp',NULL,1),(6,'سيجارة الكترونية',NULL,0,1,0,1,'2026-02-26 17:52:27','2026-02-26 18:13:19','pngtree-black-vape-pen-on-transparent-background-png-image_11989479.png',NULL,1),(7,'جوس',NULL,0,1,0,1,'2026-02-26 17:52:27','2026-02-26 18:13:21','img-28.jpg',NULL,1),(9,'سوري',NULL,4,1,1,1,'2026-02-26 17:52:27','2026-02-26 17:52:27','WhatsApp-Image-2025-08-19-at-12.51.23-PM-2.png',NULL,0),(10,'مصري',NULL,4,1,1,1,'2026-02-26 17:52:27','2026-02-26 17:52:27','DSC01364-1-scaled.jpg',NULL,0),(11,'ألماني',NULL,4,1,1,1,'2026-02-26 17:52:27','2026-02-26 17:52:27','DSC01420-scaled.jpg',NULL,0),(12,'بوادي',NULL,5,1,1,1,'2026-02-26 17:52:27','2026-02-26 17:52:27','DSC04159-scaled.jpg',NULL,0),(13,'ملوكي',NULL,5,1,1,1,'2026-02-26 17:52:27','2026-02-26 17:52:27','DSC04160-scaled.jpg',NULL,0),(14,'مزايا',NULL,5,1,1,1,'2026-02-26 17:52:27','2026-02-26 17:52:27','Mazaya_orange_with_mint_1024x_2da052ac-cbdc-4e8a-87ea-b203a978f660.webp',NULL,0),(15,'نخلة',NULL,5,1,1,1,'2026-02-26 17:52:27','2026-02-26 17:52:27','DSC04195-scaled.jpg',NULL,0),(16,'دوزان',NULL,5,1,1,1,'2026-02-26 17:52:27','2026-02-26 17:52:27','DSC04150-scaled.jpg',NULL,0),(17,'معسل جوكر فيب',NULL,5,1,1,1,'2026-02-26 17:52:27','2026-02-26 17:52:27','DSC04201-scaled.jpg',NULL,0),(18,'سحبات',NULL,6,1,1,1,'2026-02-26 17:52:27','2026-02-26 17:52:27','rn-image_picker_lib_temp_9174d9d9-a480-45e9-9877-069f0f377f66.webp',NULL,0),(19,'كويت',NULL,7,1,1,1,'2026-02-26 17:52:27','2026-02-26 17:52:27','DSC04116-scaled.jpg',NULL,0),(20,'بود سالت',NULL,7,1,1,1,'2026-02-26 17:52:27','2026-02-26 17:52:27','bc3e83b1-3668-4f99-83bc-f500e96e5213.png',NULL,0),(21,'بينك بانثر',NULL,7,1,1,1,'2026-02-26 17:52:27','2026-02-26 17:52:27','a418e416-7b12-4fd0-88f5-84a6249c1f53.jpg',NULL,0),(170,'ارقيله الكترونيه',NULL,0,1,0,1,'2026-03-05 20:30:18','2026-03-05 20:30:18','2026-03-05-69a9856a8cc08.webp','def.png',0),(171,'سقائر',NULL,170,1,1,1,'2026-03-05 20:31:30','2026-03-05 20:31:30','def.png','def.png',0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `area_id` bigint unsigned DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `names` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,2,'Ramallah','رام الله',1,'2026-02-26 18:45:12','2026-02-26 18:51:43','{\"ar\": \"رام الله\", \"en\": \"Ramallah\", \"he\": \"Ramallah\"}'),(2,1,'Nablus','نابلس',2,'2026-02-26 18:45:12','2026-02-26 18:45:12','{\"ar\": \"نابلس\", \"en\": \"Nablus\"}'),(3,1,'Hebron','الخليل',3,'2026-02-26 18:45:12','2026-02-26 18:45:12','{\"ar\": \"الخليل\", \"en\": \"Hebron\"}'),(4,2,'Nazareth','الناصرة',4,'2026-02-26 18:45:12','2026-02-26 18:45:12','{\"ar\": \"الناصرة\", \"en\": \"Nazareth\"}'),(5,2,'Umm al-Fahm','أم الفحم',5,'2026-02-26 18:45:12','2026-02-26 18:45:12','{\"ar\": \"أم الفحم\", \"en\": \"Umm al-Fahm\"}'),(6,2,'Sakhnin','سخنين',6,'2026-02-26 18:45:12','2026-02-26 18:45:12','{\"ar\": \"سخنين\", \"en\": \"Sakhnin\"}'),(9,1,'بيت لحم','بيت لحم',8,'2026-03-05 20:25:22','2026-03-05 20:25:22','{\"ar\": \"بيت لحم\"}'),(10,3,'Jerusalem','القدس',9,'2026-03-05 20:26:34','2026-03-05 20:26:34','{\"ar\": \"القدس\", \"en\": \"Jerusalem\"}');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_us` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_us`
--

LOCK TABLES `contact_us` WRITE;
/*!40000 ALTER TABLE `contact_us` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `reply` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` text COLLATE utf8mb4_unicode_ci,
  `is_reply` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coupon_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `limit` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (48,'Israeli New Sheqel','ILS','₪',1.00,NULL,NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_addresses`
--

DROP TABLE IF EXISTS `customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `floor` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `road` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `contact_person_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_addresses`
--

LOCK TABLES `customer_addresses` WRITE;
/*!40000 ALTER TABLE `customer_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_charge_by_areas`
--

DROP TABLE IF EXISTS `delivery_charge_by_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_charge_by_areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int unsigned NOT NULL,
  `area_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_charge` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_charge_by_areas_branch_id_index` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_charge_by_areas`
--

LOCK TABLES `delivery_charge_by_areas` WRITE;
/*!40000 ALTER TABLE `delivery_charge_by_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_charge_by_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_charge_setups`
--

DROP TABLE IF EXISTS `delivery_charge_setups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_charge_setups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int unsigned NOT NULL,
  `delivery_charge_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'distance' COMMENT 'area/distance',
  `delivery_charge_per_kilometer` double NOT NULL DEFAULT '0',
  `minimum_delivery_charge` double NOT NULL DEFAULT '0',
  `minimum_distance_for_free_delivery` double NOT NULL DEFAULT '0',
  `fixed_delivery_charge` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_charge_setups_branch_id_index` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_charge_setups`
--

LOCK TABLES `delivery_charge_setups` WRITE;
/*!40000 ALTER TABLE `delivery_charge_setups` DISABLE KEYS */;
INSERT INTO `delivery_charge_setups` VALUES (1,1,'fixed',0,0,0,100,'2024-09-29 01:22:11','2024-09-29 01:22:11');
/*!40000 ALTER TABLE `delivery_charge_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_verifications`
--

DROP TABLE IF EXISTS `email_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_verifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint unsigned NOT NULL DEFAULT '0',
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `temp_block_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_verifications`
--

LOCK TABLES `email_verifications` WRITE;
/*!40000 ALTER TABLE `email_verifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flash_sale_products`
--

DROP TABLE IF EXISTS `flash_sale_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_sale_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `flash_sale_id` bigint unsigned DEFAULT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_sale_products`
--

LOCK TABLES `flash_sale_products` WRITE;
/*!40000 ALTER TABLE `flash_sale_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_sale_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flash_sales`
--

DROP TABLE IF EXISTS `flash_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_sales`
--

LOCK TABLES `flash_sales` WRITE;
/*!40000 ALTER TABLE `flash_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_users`
--

DROP TABLE IF EXISTS `guest_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_users`
--

LOCK TABLES `guest_users` WRITE;
/*!40000 ALTER TABLE `guest_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `guest_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_setups`
--

DROP TABLE IF EXISTS `login_setups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_setups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_setups`
--

LOCK TABLES `login_setups` WRITE;
/*!40000 ALTER TABLE `login_setups` DISABLE KEYS */;
INSERT INTO `login_setups` VALUES (1,'email_verification','0','2024-09-29 01:22:11','2024-09-29 01:22:11'),(2,'phone_verification','0','2024-09-29 01:22:11','2024-09-29 01:22:11'),(3,'login_options','{\"manual_login\":1,\"otp_login\":0,\"social_media_login\":0}','2024-09-29 01:22:11','2024-09-29 01:22:11'),(4,'social_media_for_login','{\"google\":0,\"facebook\":0,\"apple\":0}','2024-09-29 01:22:11','2024-09-29 01:22:11');
/*!40000 ALTER TABLE `login_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyalty_point_logs`
--

DROP TABLE IF EXISTS `loyalty_point_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyalty_point_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `points` int NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loyalty_point_logs_user_id_foreign` (`user_id`),
  KEY `loyalty_point_logs_order_id_foreign` (`order_id`),
  CONSTRAINT `loyalty_point_logs_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `loyalty_point_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyalty_point_logs`
--

LOCK TABLES `loyalty_point_logs` WRITE;
/*!40000 ALTER TABLE `loyalty_point_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `loyalty_point_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyalty_points`
--

DROP TABLE IF EXISTS `loyalty_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyalty_points` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `points` int NOT NULL DEFAULT '0',
  `level` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'bronze',
  `total_spent` decimal(12,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loyalty_points_user_id_unique` (`user_id`),
  CONSTRAINT `loyalty_points_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyalty_points`
--

LOCK TABLES `loyalty_points` WRITE;
/*!40000 ALTER TABLE `loyalty_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `loyalty_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `attachment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2026_01_01_000000_baitpait_full_schema',1),(2,'2026_03_08_000001_add_minimum_stock_alert_to_products',1),(3,'2026_03_08_000002_ensure_mail_config_defaults',1),(4,'2026_03_08_000003_remove_recaptcha_from_business_settings',1),(5,'2026_03_08_000004_fix_social_chat_keys',1),(6,'2026_03_08_100000_create_webhook_endpoints_table',1),(7,'2026_03_08_200000_add_columns_for_backup_import',1),(8,'2026_03_08_200001_add_name_ar_to_cities',1),(9,'2026_03_10_000001_ensure_fcm_default_messages',1),(10,'2026_03_10_000002_ensure_cookies_default_text',1),(11,'2026_03_11_000001_rename_restaurant_name_to_store_name',1),(12,'2026_03_12_000001_create_product_tags_tables',1),(13,'2026_03_12_000002_create_order_status_logs_table',1),(14,'2026_03_12_000003_create_product_relations_table',1),(15,'2026_03_13_000001_add_login_enabled_to_branches',1),(16,'2026_03_15_000001_add_performance_indexes',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','z5ky1aF18fNgAczYo0W2MdglqUxpyt0KsKdmbRIt',NULL,'http://localhost',1,0,0,'2021-01-06 01:07:29','2021-01-06 01:07:29'),(2,NULL,'Laravel Password Grant Client','clk5DEe0ANVDYwD79OUYBkLcZ6CLSykUvULubUuk','users','http://localhost',0,1,0,'2021-01-06 01:07:29','2021-01-06 01:07:29'),(3,NULL,'Laravel Personal Access Client','8XbbHWODoSOmyxXHxPwyAeg5Kz8EXMTUBKvIUZj9',NULL,'http://localhost',1,0,0,'2021-04-11 17:55:02','2021-04-11 17:55:02'),(4,NULL,'Laravel Password Grant Client','LLqqu0rMd8ezIqZe9oiR6LsQ3cgyPtZs5ajniUzo','users','http://localhost',0,1,0,'2021-04-11 17:55:02','2021-04-11 17:55:02'),(5,NULL,'Laravel Personal Access Client','dMGdChOSAmSYCEmS6D96zc6Ywcy3p58LpultWMjb',NULL,'http://localhost',1,0,0,'2021-04-17 18:32:10','2021-04-17 18:32:10'),(6,NULL,'Laravel Password Grant Client','s2HDoNC5YESRprOZXDVELjuXyJGSyhDblu2KlKrE','users','http://localhost',0,1,0,'2021-04-17 18:32:10','2021-04-17 18:32:10');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2021-01-06 01:07:29','2021-01-06 01:07:29'),(2,3,'2021-04-11 17:55:02','2021-04-11 17:55:02'),(3,5,'2021-04-17 18:32:10','2021-04-17 18:32:10');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_areas`
--

DROP TABLE IF EXISTS `order_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `branch_id` bigint unsigned NOT NULL,
  `area_id` bigint unsigned NOT NULL,
  `distance` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_areas_order_id_index` (`order_id`),
  KEY `order_areas_branch_id_index` (`branch_id`),
  KEY `order_areas_area_id_index` (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_areas`
--

LOCK TABLES `order_areas` WRITE;
/*!40000 ALTER TABLE `order_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `product_details` text COLLATE utf8mb4_unicode_ci,
  `variation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_on_product` decimal(8,2) DEFAULT NULL,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `quantity` int unsigned NOT NULL DEFAULT '1',
  `tax_amount` decimal(8,2) NOT NULL DEFAULT '1.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pc',
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `order_details_order_id_index` (`order_id`),
  KEY `order_details_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shipments`
--

DROP TABLE IF EXISTS `order_shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_shipments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `shipping_company_id` bigint unsigned NOT NULL,
  `tracking_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT 'pending, shipped, in_transit, delivered, failed',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `shipped_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_shipments_order_id_index` (`order_id`),
  KEY `order_shipments_shipping_company_id_index` (`shipping_company_id`),
  CONSTRAINT `order_shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_shipments_shipping_company_id_foreign` FOREIGN KEY (`shipping_company_id`) REFERENCES `shipping_companies` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shipments`
--

LOCK TABLES `order_shipments` WRITE;
/*!40000 ALTER TABLE `order_shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status_logs`
--

DROP TABLE IF EXISTS `order_status_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `old_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `changed_by_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'admin, branch, system',
  `changed_by_id` bigint unsigned DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_status_logs_order_id_created_at_index` (`order_id`,`created_at`),
  CONSTRAINT `order_status_logs_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_logs`
--

LOCK TABLES `order_status_logs` WRITE;
/*!40000 ALTER TABLE `order_status_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_status_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `order_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `coupon_discount_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_tax_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT '0.00',
  `order_note` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `branch_id` bigint unsigned NOT NULL DEFAULT '1',
  `callback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `delivery_address` text COLLATE utf8mb4_unicode_ci,
  `bring_change_amount` decimal(24,8) DEFAULT '0.00000000',
  `paid_amount` decimal(24,8) DEFAULT '0.00000000',
  `loyalty_points_used` int unsigned NOT NULL DEFAULT '0',
  `loyalty_discount_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `additional_payment_method` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_index` (`user_id`),
  KEY `orders_order_status_index` (`order_status`),
  KEY `orders_branch_id_index` (`branch_id`),
  KEY `orders_created_at_index` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email_or_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint unsigned NOT NULL DEFAULT '0',
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `temp_block_time` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_or_phone_index` (`email_or_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_verifications`
--

DROP TABLE IF EXISTS `phone_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_verifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint unsigned NOT NULL DEFAULT '0',
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `temp_block_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_verifications`
--

LOCK TABLES `phone_verifications` WRITE;
/*!40000 ALTER TABLE `phone_verifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_relations`
--

DROP TABLE IF EXISTS `product_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_relations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `related_product_id` bigint unsigned NOT NULL,
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_relations_product_id_related_product_id_unique` (`product_id`,`related_product_id`),
  KEY `product_relations_related_product_id_foreign` (`related_product_id`),
  CONSTRAINT `product_relations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_relations_related_product_id_foreign` FOREIGN KEY (`related_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_relations`
--

LOCK TABLES `product_relations` WRITE;
/*!40000 ALTER TABLE `product_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tag`
--

DROP TABLE IF EXISTS `product_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tag` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_tag_product_id_tag_id_unique` (`product_id`,`tag_id`),
  KEY `product_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tag`
--

LOCK TABLES `product_tag` WRITE;
/*!40000 ALTER TABLE `product_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_user_type_discounts`
--

DROP TABLE IF EXISTS `product_user_type_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_user_type_discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `user_type_id` bigint unsigned NOT NULL,
  `discount` decimal(24,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_user_type_discounts_product_id_user_type_id_unique` (`product_id`,`user_type_id`),
  KEY `product_user_type_discounts_user_type_id_foreign` (`user_type_id`),
  CONSTRAINT `product_user_type_discounts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_user_type_discounts_user_type_id_foreign` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_user_type_discounts`
--

LOCK TABLES `product_user_type_discounts` WRITE;
/*!40000 ALTER TABLE `product_user_type_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_user_type_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_user_type_prices`
--

DROP TABLE IF EXISTS `product_user_type_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_user_type_prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `user_type_id` bigint unsigned NOT NULL,
  `price` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_user_type_prices_product_id_user_type_id_unique` (`product_id`,`user_type_id`),
  KEY `product_user_type_prices_user_type_id_foreign` (`user_type_id`),
  CONSTRAINT `product_user_type_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_user_type_prices_user_type_id_foreign` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_user_type_prices`
--

LOCK TABLES `product_user_type_prices` WRITE;
/*!40000 ALTER TABLE `product_user_type_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_user_type_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_brand_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL DEFAULT '0',
  `variations` text COLLATE utf8mb4_unicode_ci,
  `tax` decimal(8,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci,
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pc',
  `total_stock` bigint unsigned NOT NULL DEFAULT '0',
  `min_order_qty` int unsigned NOT NULL DEFAULT '1',
  `minimum_stock_alert` int unsigned DEFAULT NULL,
  `view_count` int unsigned NOT NULL DEFAULT '0',
  `sales_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `products_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,NULL,'Geekvape T200 Kit','','[\"WhatsApp-Image-2025-08-18-at-11.02.57-AM-1.jpeg\"]',350,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(3,NULL,'Geekvape AN2','','[\"WhatsApp-Image-2025-08-18-at-11.02.57-AM-2.jpeg\"]',140,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(4,NULL,'wenax M1','','[\"WhatsApp-Image-2025-08-18-at-11.02.57-AM-3.jpeg\"]',50,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(5,NULL,'wenax K2','','[\"WhatsApp-Image-2025-08-18-at-11.02.57-AM.jpeg\"]',80,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(6,NULL,'sonder  Q','','[\"WhatsApp-Image-2025-08-18-at-11.02.58-AM-1.jpeg\"]',55,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(7,NULL,'wenax stylus','','[\"WhatsApp-Image-2025-08-18-at-11.02.58-AM.jpeg\"]',60,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(8,NULL,'Geekvape z200','','[\"WhatsApp-Image-2025-08-18-at-11.02.59-AM-1.jpeg\"]',250,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(9,NULL,'Geekvape b60','','[\"WhatsApp-Image-2025-08-18-at-11.02.59-AM.jpeg\"]',150,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(10,NULL,'Geekvape M100','','[\"WhatsApp-Image-2025-08-18-at-11.03.00-AM-1.jpeg\"]',240,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(11,NULL,'Geekvape Soul','','[\"WhatsApp-Image-2025-08-18-at-11.03.00-AM.jpeg\"]',140,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(12,NULL,'wenax Q','','[\"WhatsApp-Image-2025-08-18-at-11.03.01-AM-1.jpeg\"]',95,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(13,NULL,'Geekvape H45','','[\"WhatsApp-Image-2025-08-18-at-11.03.01-AM.jpeg\"]',200,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(14,NULL,'wenax Q MINI','','[\"WhatsApp-Image-2025-08-18-at-11.03.02-AM-1.jpeg\"]',90,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(15,NULL,'Geekvape Z','','[\"WhatsApp-Image-2025-08-18-at-11.03.02-AM-2.jpeg\"]',110,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(16,NULL,'Geekvape E100  &  E100i KIT','','[\"WhatsApp-Image-2025-08-18-at-11.03.02-AM-3.jpeg\"]',180,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(17,NULL,'Geekvape ONE','','[\"WhatsApp-Image-2025-08-18-at-11.03.02-AM.jpeg\"]',55,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(18,NULL,'Geekvape z Nano 2  Tank','','[\"WhatsApp-Image-2025-08-18-at-11.03.03-AM-1.jpeg\"]',100,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(19,NULL,'GeekVape - wenax M starter kit','','[\"WhatsApp-Image-2025-08-18-at-11.03.03-AM-2.jpeg\"]',180,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(20,NULL,'Wenax U','','[\"WhatsApp-Image-2025-08-18-at-11.03.03-AM-3.jpeg\"]',50,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(21,NULL,'Digitlavor Digi - Q kit 1000 MAh','','[\"WhatsApp-Image-2025-08-18-at-11.03.03-AM-4.jpeg\"]',120,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(22,NULL,'Geekvape B100 KIT','','[\"WhatsApp-Image-2025-08-18-at-11.03.03-AM.jpeg\"]',180,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(23,NULL,'aspark xcel','','[\"WhatsApp-Image-2025-08-18-at-12.27.12-PM-1.jpeg\"]',120,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(24,NULL,'XROS 5 MINI','','[\"لقطة-شاشة-2025-08-18-124038.png\"]',100,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(25,NULL,'XROS 4 NANO','','[\"لقطة-شاشة-2025-08-18-124249.png\"]',110,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(26,NULL,'XROS 4','','[\"لقطة-شاشة-2025-08-18-124438.png\"]',120,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(27,NULL,'XROS 4 Mini','','[\"لقطة-شاشة-2025-08-18-124524.png\"]',100,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(28,NULL,'XROS 3 NANO','','[\"لقطة-شاشة-2025-08-18-124728.png\"]',90,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(29,NULL,'XROS Pro','','[\"لقطة-شاشة-2025-08-18-125647.png\"]',110,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(30,NULL,'XROS 3 Mini','','[\"لقطة-شاشة-2025-08-18-130033.png\"]',70,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(31,NULL,'LUXE QS','','[\"لقطة-شاشة-2025-08-18-130203.png\"]',80,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(32,NULL,'ARGUS G3','','[\"لقطة-شاشة-2025-08-18-130848.png\"]',110,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(33,NULL,'ARGUS A','','[\"argus-a-20250428.png\"]',100,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(34,NULL,'ARGUS G2','','[\"VOOPOO-ARGUS-G2.png\"]',60,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(35,NULL,'ARGUS G2 mini','','[\"argus-g2-mini-20250428.png\"]',60,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(36,NULL,'ARGUS P1s','','[\"VOOPOO-ARGUS-P1s.png\"]',110,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(37,NULL,'ARGUS PRO 2','','[\"VOOPOO-ARGUS-PRO-21.png\"]',160,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(38,NULL,'ARGUS P1','','[\"ARGUS-P1-白底图-1.png\"]',130,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(39,NULL,'ARGUS POD','','[\"ARGUS-PRO-小图.png\"]',100,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(40,NULL,'بربيج تيربوا  ريمبو','','[\"DSC04104-1-scaled.jpg\"]',8,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(41,NULL,'جوس Qweet','','[\"DSC04116-scaled.jpg\"]',18,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"7\", \"position\": 1}, {\"id\": \"19\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(42,NULL,'جوسPink Panther','ملاحظة النكيوتين 50 %\r\n<div></div>','[\"a418e416-7b12-4fd0-88f5-84a6249c1f53.jpg\"]',48,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"7\", \"position\": 1}, {\"id\": \"21\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(43,NULL,'جوس Podsalt','','[\"bc3e83b1-3668-4f99-83bc-f500e96e5213.png\"]',18,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"7\", \"position\": 1}, {\"id\": \"20\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(44,NULL,'معسل دوزان (ADD)','نكهات ( تفاحتين - ليمون ونعنع - بطيخ ونعنع - لوڤ 66- قرفة وعلكة - بلوباري ) الاحجام ( كيلو - نص كيلو - 50 غرام )','[\"DSC04150-scaled.jpg\"]',10,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"5\", \"position\": 1}, {\"id\": \"16\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(45,NULL,'معسل بوادي','نكهات ( تفاحتين - ليمون ونعنع - بطيخ ونعنع - لوڤ 66- قرفة وعلكة - بلوباري - كاندي - ليمون ونعنع مثلج -عنب وتوت ) الاحجام ( كيلو - نص كيلو - 50 غرام )','[\"DSC04159-scaled.jpg\"]',10,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"5\", \"position\": 1}, {\"id\": \"12\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(46,NULL,'معسل ملوكي','نكهات ( تفاحتين - ليمون ونعنع - بطيخ ونعنع -لوڤ 66- قرفة وعلكة - بلوباري -عنب وتوت - نعنع - شمام - عنب ) الاحجام ( كيلو - نص كيلو - 50 غرام )','[\"DSC04160-scaled.jpg\"]',100,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"5\", \"position\": 1}, {\"id\": \"13\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(47,NULL,'معسل نخلة','','[\"DSC04195-scaled.jpg\"]',33,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"5\", \"position\": 1}, {\"id\": \"15\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(48,NULL,'معسل جوكر ڤيب','','[\"DSC04201-scaled.jpg\"]',15,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"5\", \"position\": 1}, {\"id\": \"17\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(49,NULL,'قصدير','','[\"DSC04227-scaled.jpg\"]',5,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(50,NULL,'قصدير الرشيد المخرم','','[\"DSC04264-scaled.jpg\"]',3,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(51,NULL,'برييج سوري - دلع','','[\"DSC04266-scaled.jpg\"]',12,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(52,NULL,'فحم أبو شنب','','[\"DSC04293-scaled.jpg\"]',12,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(53,NULL,'فحم الأرز','','[\"a75285b2-3f8c-4805-a9e3-f1867f3ed352.png\"]',8,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(54,NULL,'فحم أبو سمرة','','[\"DSC04295-scaled.jpg\"]',10,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(55,NULL,'ROSE X MAX  PUFF Disposable','','[\"rn-image_picker_lib_temp_9174d9d9-a480-45e9-9877-069f0f377f66.webp\"]',50,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}, {\"id\": \"18\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(56,NULL,'Solo Bar vape','','[\"WhatsApp-Image-2025-08-18-at-11.39.45-AM-4.jpeg\"]',65,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}, {\"id\": \"18\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(57,NULL,'أرجيلة مصري الحصان الاسود','','[\"DSC01364-1-scaled.jpg\"]',150,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}, {\"id\": \"10\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(58,NULL,'أرجيلة الألماني مع شنتة','','[\"DSC01420-scaled.jpg\"]',80,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}, {\"id\": \"11\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(59,NULL,'أرجيلة الألماني حجم كبير','','[\"DSC01441-scaled.jpg\"]',130,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}, {\"id\": \"11\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(60,NULL,'أرجيلة فطوطة','','[\"DSC01457-scaled.jpg\"]',40,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(61,NULL,'RPM 4 Kit','','[\"smok-rpm-4-pod-kit-black.webp\"]',120,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(62,NULL,'Morph 2 Kit','','[\"images-3.png\"]',180,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(63,NULL,'Nord 50W Kit','','[\"تنزيل-1.png\"]',120,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"6\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(64,NULL,'راس ارجيلة نفق','راس ارجيلة نفق الألوان مميزة','[\"WhatsApp-Image-2025-08-19-at-12.48.49-PM-1.jpeg\"]',15,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(65,NULL,'زجاج ارجيلة الألماني حجم كبير','زجاج ارجيلة الألماني حجم كبير','[\"WhatsApp-Image-2025-08-19-at-12.48.49-PM-4.jpeg\"]',30,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(66,NULL,'زجاج تركي حجم كبير','','[\"WhatsApp-Image-2025-08-19-at-12.48.49-PM.jpeg\"]',20,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(67,NULL,'مثقاب  قصدير','','[\"WhatsApp-Image-2025-08-19-at-12.48.50-PM-2.png\"]',6,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(68,NULL,'فراشة تنظيف راس','','[\"WhatsApp-Image-2025-08-19-at-12.48.50-PM-3.png\"]',5,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(69,NULL,'غطاء راس معدني بديل القصدير','','[\"WhatsApp-Image-2025-08-19-at-12.48.50-PM.png\"]',15,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(70,NULL,'قلب سامر دور واحد سوري','','[\"WhatsApp-Image-2025-08-19-at-12.51.23-PM-2.png\"]',80,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}, {\"id\": \"9\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(71,NULL,'قلب سوري دورين','','[\"WhatsApp-Image-2025-08-19-at-12.51.33-PM-3.png\"]',130,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}, {\"id\": \"9\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(72,NULL,'مباسم ارجيل','','[\"shisha-accessosries1.jpg\"]',5,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(73,NULL,'ارجيلة سوري النورس مختوم دورين','','[\"96774629_849616045521566_561033642093051904_n.jpg\"]',120,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(74,NULL,'ملقط','','[\"WhatsApp-Image-2025-08-19-at-12.48.07-PM.jpeg\"]',5,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(75,NULL,'صحن ارجيلة حجم كبير','','[\"WhatsApp-Image-2025-08-19-at-12.48.09-PM.jpeg\"]',20,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(76,NULL,'فرشاة قصبة','','[\"WhatsApp-Image-2025-08-19-at-12.48.10-PM-1.jpeg\"]',5,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(77,NULL,'ارجيلة الألماني متوسطة الحجم','','[\"WhatsApp-Image-2025-08-19-at-12.48.10-PM-2.jpeg\"]',120,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}, {\"id\": \"11\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(78,NULL,'برابيج تيربو الألوان متعدده','','[\"WhatsApp-Image-2025-08-19-at-12.48.10-PM-5.jpeg\"]',8,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(79,NULL,'حاملة فحم وموزع حراري','','[\"WhatsApp-Image-2025-08-19-at-12.48.10-PM.jpeg\"]',12,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(80,NULL,'قصبة تركي دور ونص','','[\"WhatsApp-Image-2025-08-19-at-12.48.11-PM-1.jpeg\"]',50,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(81,NULL,'ارجيلة تركي دور واحد','','[\"WhatsApp-Image-2025-08-19-at-12.48.15-PM-2.jpeg\"]',75,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(82,NULL,'قصبة ارجيلة تركي دورين','','[\"WhatsApp-Image-2025-08-19-at-12.48.15-PM-3.jpeg\"]',110,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(83,NULL,'ارجيلة تركية  دور ونص شنطة','','[\"WhatsApp-Image-2025-08-19-at-12.48.19-PM-2.jpeg\"]',100,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(84,NULL,'ارجيلة الالماني شنطة وسط','','[\"سيش-1.jpg\"]',120,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}, {\"id\": \"11\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(85,NULL,'ارجية الالماني حجم كبير','','[\"يبليبليبل-1.jpg\"]',140,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}, {\"id\": \"11\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(86,NULL,'ارجيلية الالماني حجم كبير الألوان جذابة','','[\"ثقثصق-1.jpg\"]',160,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}, {\"id\": \"11\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(87,NULL,'ارجيلة االالماني حجم كبير','','[\"سيسيثق-1.jpg\"]',160,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}, {\"id\": \"11\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(88,NULL,'ارجيلة  الألماني حجم كبير','','[\"WhatsApp-Image-2025-08-19-at-12.48.23-PM-1.jpeg\"]',150,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}, {\"id\": \"11\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(89,NULL,'ارجيلة الألماني عنكبوت','','[\"WhatsApp-Image-2025-08-19-at-12.48.24-PM.jpg\"]',140,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}, {\"id\": \"11\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(90,NULL,'ارجيلة تركي وسط','','[\"2254.jpg\"]',120,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(91,NULL,'متكة سجاير','','[\"WhatsApp-Image-2025-08-19-at-12.48.26-PM-1.png\"]',15,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(92,NULL,'محفظة دخان نفل','','[\"WhatsApp-Image-2025-08-19-at-12.48.27-PM-2.png\"]',15,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(93,NULL,'متكة سجاير للسيارة','','[\"Screenshot-2025-09-02-115506.png\"]',20,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(94,NULL,'معشق ارجيلة','','[\"Screenshot-2025-09-02-115629.png\"]',35,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(95,NULL,'حاجب الرياح راس ارجيلة','','[\"WhatsApp-Image-2025-08-19-at-12.48.30-PM.png\"]',20,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(96,NULL,'راس زجاجي بالألوان زاهية','','[\"WhatsApp-Image-2025-08-19-at-12.48.30-PM-1.png\"]',15,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(97,NULL,'بربيج ارجيلة الألماني','','[\"WhatsApp-Image-2025-08-19-at-12.48.30-PM-2.png\"]',20,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(98,NULL,'مثقاب قصدير خشبي','','[\"WhatsApp-Image-2025-08-19-at-12.48.30-PM-3.png\"]',5,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(99,NULL,'راس فخار طبيعي','5','[\"WhatsApp-Image-2025-08-19-at-12.48.48-PM-3.png\"]',5,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(100,NULL,'راس ميوزك','','[\"WhatsApp-Image-2025-08-19-at-12.48.31-PM-1.png\"]',20,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(101,NULL,'راس زجاجي ومعدن','','[\"WhatsApp-Image-2025-08-19-at-12.48.46-PM.jpeg\"]',25,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(102,NULL,'مكعبات مبربد ارجيلة','','[\"WhatsApp-Image-2025-08-19-at-12.48.32-PM-1.png\"]',8,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(103,NULL,'ملقط معدني ازرق','','[\"WhatsApp-Image-2025-08-19-at-12.48.32-PM-2.png\"]',4,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(104,NULL,'راس معدن بدون قصدير على شكل ورده منفتحة','','[\"WhatsApp-Image-2025-08-19-at-12.48.34-PM-1.png\"]',30,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(105,NULL,'ملقط معدني مميز','7','[\"WhatsApp-Image-2025-08-19-at-12.48.32-PM-3.png\"]',7,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(106,NULL,'شاروخ نحاس','','[\"WhatsApp-Image-2025-08-19-at-12.48.34-PM.png\"]',25,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(107,NULL,'راس فخار مقبض بلاستك','','[\"WhatsApp-Image-2025-08-19-at-12.48.42-PM-1.png\"]',15,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(108,NULL,'راس فخار مميز','10','[\"WhatsApp-Image-2025-08-19-at-12.48.42-PM-2.png\"]',10,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(109,NULL,'راس فخار نفق مقبض خيوط','','[\"WhatsApp-Image-2025-08-19-at-12.48.43-PM-1.png\"]',15,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(110,NULL,'راس ارجيلة زجاجي بكفر بلاستك','','[\"WhatsApp-Image-2025-08-19-at-12.48.44-PM-4.png\"]',15,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(111,NULL,'شاروخ بلاستيك مقواه','','[\"WhatsApp-Image-2025-08-19-at-12.48.45-PM-1.png\"]',15,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(112,NULL,'شاروخ نحاسي صلب','','[\"WhatsApp-Image-2025-08-19-at-12.48.45-PM-2.png\"]',35,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"8\", \"position\": 1}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(113,NULL,'ارجيلة الحصان الأسود مصري  دورين','','[\"WhatsApp-Image-2025-08-19-at-12.48.46-PM-1.png\"]',160,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}, {\"id\": \"10\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(114,NULL,'ارجيلة الحصان الأسود مصري دور ونص','','[\"WhatsApp-Image-2025-08-19-at-12.48.47-PM-2.png\"]',150,NULL,0.00,1,'2026-02-26 17:52:27','2026-02-26 17:52:27',NULL,'[{\"id\": \"4\", \"position\": 1}, {\"id\": \"10\", \"position\": 2}]',NULL,0.00,'percent','percent','pc',10,1,NULL,0,0),(176,NULL,'معسل','<p><br></p>','[\"2026-03-05-69a9871dba9cc.webp\"]',10,'[{\"type\":\"\\u0641\\u0631\\u0627\\u0648\\u0644\\u0629-\\u0630\\u0647\\u0628\\u064a\",\"price\":0,\"stock\":0},{\"type\":\"\\u0641\\u0631\\u0627\\u0648\\u0644\\u0629-\\u0627\\u0633\\u0648\\u062f\",\"price\":12,\"stock\":33},{\"type\":\"\\u0641\\u062e\\u0641\\u062e\\u064a\\u0646\\u0627-\\u0630\\u0647\\u0628\\u064a\",\"price\":11,\"stock\":44},{\"type\":\"\\u0641\\u062e\\u0641\\u062e\\u064a\\u0646\\u0627-\\u0627\\u0633\\u0648\\u062f\",\"price\":8,\"stock\":12}]',0.00,1,'2026-03-05 20:37:33','2026-03-05 20:38:46','[\"3\"]','[{\"id\":\"170\",\"position\":1},{\"id\":\"171\",\"position\":2}]','[{\"name\":\"choice_3\",\"title\":\"\\u0627\\u0644\\u0637\\u0639\\u0645\",\"options\":[\"\\u0641\\u0631\\u0627\\u0648\\u0644\\u0629\",\" \\u0641\\u062e\\u0641\\u062e\\u064a\\u0646\\u0627\"]},{\"name\":\"choice_4\",\"title\":\"\\u0627\\u0644\\u0644\\u0648\\u0646\",\"options\":[\"\\u0630\\u0647\\u0628\\u064a\",\" \\u0627\\u0633\\u0648\\u062f\"]}]',0.00,'percent','percent','pc',89,1,NULL,0,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_companies`
--

DROP TABLE IF EXISTS `shipping_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_key` text COLLATE utf8mb4_unicode_ci,
  `api_secret` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shipping_companies_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_companies`
--

LOCK TABLES `shipping_companies` WRITE;
/*!40000 ALTER TABLE `shipping_companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_medias`
--

DROP TABLE IF EXISTS `social_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_medias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_medias`
--

LOCK TABLES `social_medias` WRITE;
/*!40000 ALTER TABLE `social_medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `translationable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `translations_translationable_id_index` (`translationable_id`),
  KEY `translations_locale_index` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'App\\Models\\UserType',1,'en','name','custmer'),(3,'App\\Models\\Attribute',1,'ar','name','الالوان'),(4,'App\\Models\\Product',173,'en','description','<p><br></p>'),(5,'App\\Models\\Product',173,'he','description','<p><br></p>'),(6,'App\\Models\\Attribute',2,'ar','name','الحجم'),(7,'App\\Models\\Attribute',3,'ar','name','الطعم'),(8,'App\\Models\\Attribute',4,'ar','name','اللون'),(9,'App\\Models\\Attribute',5,'ar','name','الوزن'),(10,'App\\Models\\Product',174,'en','description','<p><br></p>'),(11,'App\\Models\\Product',174,'he','description','<p><br></p>'),(12,'App\\Models\\Product',175,'en','description','<p><br></p>'),(13,'App\\Models\\Product',175,'he','description','<p><br></p>'),(14,'App\\Models\\Product',176,'en','description','<p><br></p>'),(15,'App\\Models\\Product',176,'he','description','<p><br></p>');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `position` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_types`
--

LOCK TABLES `user_types` WRITE;
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
INSERT INTO `user_types` VALUES (1,'زبون',1,0,'2026-02-26 04:12:44','2026-02-26 04:12:44');
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_verification_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temporary_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_hit_count` tinyint unsigned NOT NULL DEFAULT '0',
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `temp_block_time` timestamp NULL DEFAULT NULL,
  `login_medium` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook_endpoints`
--

DROP TABLE IF EXISTS `webhook_endpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook_endpoints` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `events` json NOT NULL,
  `secret` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_endpoints`
--

LOCK TABLES `webhook_endpoints` WRITE;
/*!40000 ALTER TABLE `webhook_endpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook_endpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'elitevape_new_temp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-09 12:19:17
