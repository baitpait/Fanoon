-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: fanoon
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fcm_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Bait Pait','Admin',NULL,'info@baitpait.com',NULL,'$2y$10$DXsVbxk4CY6wqt.C91yIreFOO2poUn/5QL930cDvnIbe0h7l6R0cq',NULL,'2026-06-09 08:07:51','2026-06-09 08:07:51',NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) unsigned NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `name_ar` varchar(100) DEFAULT NULL,
  `names` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`names`)),
  `delivery_charge` double NOT NULL DEFAULT 0,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `areas_branch_id_index` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `banner_type` varchar(255) NOT NULL DEFAULT 'primary',
  `placement` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banners_placement_index` (`placement`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'اعلان','2026-06-10-6a29c2599c07c.webp',32,1,'2026-06-10 20:00:25','2026-06-10 20:01:17',NULL,'primary',NULL);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `login_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coverage` int(10) unsigned NOT NULL DEFAULT 1,
  `remember_token` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,NULL,'Bait Pait','branch@baitpait.com','$2y$10$BxdxnTY6Wx8mBsN2iFKdQuv637QBr4F540ICHLHDQCcAJ9MOLcfYu',NULL,NULL,NULL,1,0,'2026-06-09 08:08:00','2026-06-09 08:08:00',500,NULL,NULL,NULL);
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_settings`
--

DROP TABLE IF EXISTS `business_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_settings`
--

LOCK TABLES `business_settings` WRITE;
/*!40000 ALTER TABLE `business_settings` DISABLE KEYS */;
INSERT INTO `business_settings` VALUES (1,'store_name','Elite للدعاية والإعلان','2026-06-09 08:07:51','2026-06-09 08:07:51'),(2,'currency','ILS','2026-06-09 08:07:51','2026-06-09 08:07:51'),(3,'delivery_charge','0','2026-06-09 08:07:51','2026-06-09 08:07:51'),(4,'cash_on_delivery','{\"status\":1}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(5,'maintenance_duration_setup','{\"maintenance_duration\":\"until_change\",\"start_date\":null,\"end_date\":null}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(6,'maintenance_message_setup','{\"business_number\":1,\"business_email\":1,\"maintenance_message\":\"We\'re Working On Something Special!\",\"message_body\":\"Our system is currently undergoing maintenance. Please check back soon.\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(7,'pagination_limit','10','2026-06-09 08:07:51','2026-06-09 08:07:51'),(8,'language','[\"ar\",\"en\",\"he\"]','2026-06-09 08:07:51','2026-06-10 10:18:10'),(9,'logo','elite-logo.png','2026-06-09 08:07:51','2026-06-09 08:07:51'),(10,'app_logo','','2026-06-09 08:07:51','2026-06-09 08:07:51'),(11,'fav_icon','','2026-06-09 08:07:51','2026-06-09 08:07:51'),(12,'push_notification_key','','2026-06-09 08:07:51','2026-06-09 08:07:51'),(13,'order_pending_message','{\"status\":0,\"message\":\"\\u0634\\u0643\\u0631\\u0627\\u064b \\u0644\\u062b\\u0642\\u062a\\u0643! \\u0627\\u0633\\u062a\\u0644\\u0645\\u0646\\u0627 \\u0637\\u0644\\u0628\\u0643 \\u0648\\u0646\\u062c\\u0647\\u0651\\u0632\\u0647 \\u062e\\u0635\\u064a\\u0635\\u0627\\u064b \\u0644\\u0643 \\u2014 \\u0633\\u0646\\u0624\\u0643\\u062f \\u0644\\u0643 \\u0641\\u0648\\u0631 \\u0627\\u0644\\u062c\\u0627\\u0647\\u0632\\u064a\\u0629\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(14,'order_confirmation_msg','{\"status\":0,\"message\":\"\\u062e\\u0628\\u0631 \\u0633\\u0627\\u0631! \\u0637\\u0644\\u0628\\u0643 \\u0645\\u0624\\u0643\\u062f \\u0648\\u0646\\u062d\\u0636\\u0651\\u0631\\u0647 \\u0628\\u0639\\u0646\\u0627\\u064a\\u0629. \\u0633\\u0646\\u0635\\u0644 \\u0625\\u0644\\u064a\\u0643 \\u0641\\u064a \\u0627\\u0644\\u0645\\u0648\\u0639\\u062f \\u2014 \\u0646\\u0646\\u062a\\u0638\\u0631 \\u0631\\u0623\\u064a\\u0643\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(15,'order_processing_message','{\"status\":0,\"message\":\"\\u0637\\u0644\\u0628\\u0643 \\u0628\\u064a\\u0646 \\u0623\\u064a\\u062f\\u064a\\u0646\\u0627 \\u0627\\u0644\\u0622\\u0646 \\u0648\\u0646\\u0639\\u0637\\u064a\\u0647 \\u0643\\u0644 \\u0627\\u0644\\u0627\\u0647\\u062a\\u0645\\u0627\\u0645. \\u0633\\u0646\\u062e\\u0628\\u0631\\u0643 \\u0639\\u0646\\u062f \\u062e\\u0631\\u0648\\u062c\\u0647 \\u0644\\u0644\\u062a\\u0648\\u0635\\u064a\\u0644\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(16,'out_for_delivery_message','{\"status\":0,\"message\":\"\\u0637\\u0644\\u0628\\u0643 \\u0641\\u064a \\u0627\\u0644\\u0637\\u0631\\u064a\\u0642 \\u0625\\u0644\\u064a\\u0643! \\u0634\\u0643\\u0631\\u0627\\u064b \\u0644\\u0635\\u0628\\u0631\\u0643 \\u2014 \\u0633\\u0646\\u0635\\u0644 \\u0642\\u0631\\u064a\\u0628\\u0627\\u064b \\u0648\\u0646\\u062a\\u0645\\u0646\\u0649 \\u062a\\u062c\\u0631\\u0628\\u0629 \\u0631\\u0627\\u0626\\u0639\\u0629\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(17,'order_delivered_message','{\"status\":0,\"message\":\"\\u062a\\u0645 \\u0627\\u0644\\u062a\\u0648\\u0635\\u064a\\u0644 \\u0628\\u0646\\u062c\\u0627\\u062d! \\u0634\\u0643\\u0631\\u0627\\u064b \\u0644\\u0627\\u062e\\u062a\\u064a\\u0627\\u0631\\u0643 \\u0644\\u0646\\u0627. \\u0631\\u0623\\u064a\\u0643 \\u064a\\u0647\\u0645\\u0646\\u0627 \\u2014 \\u0634\\u0627\\u0631\\u0643\\u0646\\u0627 \\u062a\\u062c\\u0631\\u0628\\u062a\\u0643\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(18,'delivery_boy_assign_message','{\"status\":0,\"message\":\"\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(19,'delivery_boy_start_message','{\"status\":0,\"message\":\"\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(20,'delivery_boy_delivered_message','{\"status\":0,\"message\":\"\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(21,'customer_notify_message','{\"status\":0,\"message\":\"\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(22,'returned_message','{\"status\":0,\"message\":\"\\u0634\\u0643\\u0631\\u0627\\u064b \\u0644\\u062a\\u0648\\u0627\\u0635\\u0644\\u0643. \\u0627\\u0633\\u062a\\u0644\\u0645\\u0646\\u0627 \\u0637\\u0644\\u0628 \\u0627\\u0644\\u0625\\u0631\\u062c\\u0627\\u0639 \\u0648\\u0641\\u0631\\u064a\\u0642\\u0646\\u0627 \\u0633\\u064a\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0645\\u0639\\u0643 \\u062e\\u0644\\u0627\\u0644 24 \\u0633\\u0627\\u0639\\u0629\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(23,'failed_message','{\"status\":0,\"message\":\"\\u0646\\u0639\\u062a\\u0630\\u0631 \\u0639\\u0646 \\u0627\\u0644\\u0625\\u0632\\u0639\\u0627\\u062c. \\u0648\\u0627\\u062c\\u0647\\u0646\\u0627 \\u0635\\u0639\\u0648\\u0628\\u0629 \\u2014 \\u0633\\u0646\\u062a\\u0648\\u0627\\u0635\\u0644 \\u0645\\u0639\\u0643 \\u0641\\u0648\\u0631\\u0627\\u064b \\u0644\\u062a\\u0631\\u062a\\u064a\\u0628 \\u0623\\u0641\\u0636\\u0644 \\u062d\\u0644. \\u062b\\u0642\\u062a\\u0643 \\u062a\\u0647\\u0645\\u0646\\u0627\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(24,'canceled_message','{\"status\":0,\"message\":\"\\u062a\\u0645 \\u062a\\u0646\\u0641\\u064a\\u0630 \\u0637\\u0644\\u0628 \\u0627\\u0644\\u0625\\u0644\\u063a\\u0627\\u0621. \\u0646\\u0623\\u0645\\u0644 \\u062e\\u062f\\u0645\\u062a\\u0643 \\u0645\\u062c\\u062f\\u062f\\u0627\\u064b \\u2014 \\u0646\\u062d\\u0646 \\u0647\\u0646\\u0627 \\u0644\\u062e\\u062f\\u0645\\u062a\\u0643 \\u0639\\u0646\\u062f \\u062d\\u0627\\u062c\\u062a\\u0643\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(25,'play_store_config','{\"status\":0,\"link\":\"\",\"min_version\":\"0\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(26,'app_store_config','{\"status\":0,\"link\":\"\",\"min_version\":\"0\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(27,'phone','0598500721','2026-06-09 08:07:51','2026-06-09 08:07:51'),(28,'email_address','Eliteagency2024@gmail.com','2026-06-09 08:07:51','2026-06-09 08:07:51'),(29,'address','الخليل - الحاووز الأول','2026-06-09 08:07:51','2026-06-09 08:07:51'),(30,'country','PS','2026-06-09 08:07:51','2026-06-09 08:07:51'),(31,'minimum_order_value','1','2026-06-09 08:07:51','2026-06-10 10:18:10'),(32,'self_pickup','0','2026-06-09 08:07:51','2026-06-09 08:07:51'),(33,'currency_symbol_position','right','2026-06-09 08:07:51','2026-06-09 08:07:51'),(34,'guest_checkout','0','2026-06-09 08:07:51','2026-06-09 08:07:51'),(35,'maintenance_mode','0','2026-06-09 08:07:51','2026-06-09 08:07:51'),(36,'cookies','{\"status\":0,\"text\":{\"ar\":\"\\u0646\\u0633\\u062a\\u062e\\u062f\\u0645 \\u0645\\u0644\\u0641\\u0627\\u062a \\u062a\\u0639\\u0631\\u064a\\u0641 \\u0627\\u0644\\u0627\\u0631\\u062a\\u0628\\u0627\\u0637 \\u0644\\u062a\\u062d\\u0633\\u064a\\u0646 \\u062a\\u062c\\u0631\\u0628\\u062a\\u0643 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0645\\u0648\\u0642\\u0639 \\u0648\\u062a\\u0630\\u0643\\u0631 \\u062a\\u0641\\u0636\\u064a\\u0644\\u0627\\u062a\\u0643. \\u064a\\u0645\\u0643\\u0646\\u0643 \\u062a\\u0639\\u0637\\u064a\\u0644\\u0647\\u0627 \\u0645\\u0646 \\u0625\\u0639\\u062f\\u0627\\u062f\\u0627\\u062a \\u0627\\u0644\\u0645\\u062a\\u0635\\u0641\\u062d. \\u0628\\u0645\\u062a\\u0627\\u0628\\u0639\\u0629 \\u0627\\u0644\\u062a\\u0635\\u0641\\u062d\\u060c \\u0641\\u0625\\u0646\\u0643 \\u062a\\u0648\\u0627\\u0641\\u0642 \\u0639\\u0644\\u0649 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645\\u0646\\u0627 \\u0644\\u0645\\u0644\\u0641\\u0627\\u062a \\u062a\\u0639\\u0631\\u064a\\u0641 \\u0627\\u0644\\u0627\\u0631\\u062a\\u0628\\u0627\\u0637.\",\"en\":\"We use cookies to improve your site experience and remember your preferences. You can disable them from your browser settings. By continuing to browse, you agree to our use of cookies.\"}}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(37,'google_social_login','1','2026-06-09 08:07:51','2026-06-09 08:07:51'),(38,'facebook_social_login','0','2026-06-09 08:07:51','2026-06-09 08:07:51'),(39,'apple_login','{\"login_medium\":\"\",\"client_id\":\"\",\"team_id\":\"\",\"key_id\":\"\",\"service_file\":\"\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(40,'whatsapp','{\"status\":0,\"number\":\"\"}','2026-06-09 08:07:51','2026-06-09 08:07:52'),(41,'telegram','{\"status\":0,\"user_name\":\"\"}','2026-06-09 08:07:51','2026-06-09 08:07:52'),(42,'messenger','{\"status\":0,\"user_name\":\"\"}','2026-06-09 08:07:51','2026-06-09 08:07:52'),(43,'terms_and_conditions','','2026-06-09 08:07:51','2026-06-09 08:07:51'),(44,'privacy_policy','','2026-06-09 08:07:51','2026-06-09 08:07:51'),(45,'about_us','','2026-06-09 08:07:51','2026-06-09 08:07:51'),(46,'mail_config','{\"status\":0,\"name\":\"Elite Vape\",\"host\":\"smtp.gmail.com\",\"driver\":\"smtp\",\"port\":\"587\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"tls\",\"password\":\"\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(47,'firebase_otp_verification','{\"status\":0,\"web_api_key\":\"\"}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(48,'otp_resend_time','60','2026-06-09 08:07:51','2026-06-09 08:07:51'),(49,'loyalty_points_enabled','0','2026-06-09 08:07:51','2026-06-09 08:07:51'),(50,'loyalty_amount_for_one_point','10','2026-06-09 08:07:51','2026-06-09 08:07:51'),(51,'loyalty_points_per_amount','1','2026-06-09 08:07:51','2026-06-09 08:07:51'),(52,'loyalty_point_redemption_value','0.5','2026-06-09 08:07:51','2026-06-09 08:07:51'),(53,'loyalty_and_coupon_together','1','2026-06-09 08:07:52','2026-06-09 08:07:52'),(54,'ecommerce_name','ايليت للطباعة والتصميم','2026-06-09 12:01:43','2026-06-09 12:01:43'),(57,'ecommerce_email','info@elite-print.ps','2026-06-09 12:01:43','2026-06-09 12:01:43'),(59,'ecommerce_logo','elite-logo.png','2026-06-09 12:02:25','2026-06-09 12:02:25'),(69,'store_google_maps_url','','2026-06-10 10:16:17','2026-06-10 10:16:17'),(70,'phone_verification',NULL,'2026-06-10 10:18:10','2026-06-10 10:18:10'),(71,'email_verification',NULL,'2026-06-10 10:18:10','2026-06-10 10:18:10'),(72,'point_per_currency',NULL,'2026-06-10 10:18:10','2026-06-10 10:18:10'),(73,'time_zone','Asia/Jerusalem','2026-06-10 10:18:10','2026-06-10 10:18:10'),(74,'dm_self_registration','0','2026-06-10 10:18:10','2026-06-10 10:18:10');
/*!40000 ALTER TABLE `business_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `level` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'def.png',
  `banner_image` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `visible_to_user_types` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'NULL = all; [] = none; [id,...] = specific user_type IDs; include 0 for guests' CHECK (json_valid(`visible_to_user_types`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'دروع تكريمية','droaa-tkrymy-1',0,1,0,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(2,'شوادر ولافتات','shoadr-olaftat-2',0,1,1,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(3,'بطاقات وكروت','btakat-okrot-3',0,1,2,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(4,'ليبلات وملصقات','lyblat-omlskat-4',0,1,3,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(5,'مستلزمات الأعراس','mstlzmat-alaaaras-5',0,1,4,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(6,'مطبوعات تسويقية','mtboaaat-tsoyky-6',0,1,5,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(7,'قارمات وإعلانات','karmat-oaaalanat-7',0,1,6,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(8,'هدايا مطبوعة','hdaya-mtboaa-8',0,1,7,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(9,'دروع خشبية','droaa-khshby-1-1',1,2,0,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(10,'دروع كريستالية','droaa-krystaly-1-2',1,2,1,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(11,'دروع زجاجية','droaa-zgagy-1-3',1,2,2,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(12,'دروع معدنية','droaa-maadny-1-4',1,2,3,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(13,'رول أب','rol-ab-2-1',2,2,4,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(14,'شادر قماش','shadr-kmash-2-2',2,2,5,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(15,'X-Banner','x-banner-2-3',2,2,6,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(16,'كروت أعمال','krot-aaamal-3-1',3,2,7,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(17,'بطاقات دعوة','btakat-daao-3-2',3,2,8,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(18,'كروت تهنئة','krot-thny-3-3',3,2,9,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(19,'ملصقات دائرية','mlskat-dayry-4-1',4,2,10,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(20,'ملصقات مستطيلة','mlskat-msttyl-4-2',4,2,11,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(21,'ملصقات خاصة','mlskat-khas-4-3',4,2,12,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(22,'بطاقات الدعوة','btakat-aldaao-5-1',5,2,13,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(23,'ديكور الحفل','dykor-alhfl-5-2',5,2,14,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(24,'هدايا الأعراس','hdaya-alaaaras-5-3',5,2,15,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(25,'فلايرات','flayrat-6-1',6,2,16,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(26,'بوسترات','bostrat-6-2',6,2,17,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(27,'بروشورات','broshorat-6-3',6,2,18,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(28,'قارمات تجارية','karmat-tgary-7-1',7,2,19,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(29,'لافتات','laftat-7-2',7,2,20,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(30,'أعلام ورايات','alamat-wa-rayat-7-3',7,2,21,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(31,'أكواب','akoab-8-1',8,2,22,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(32,'قرطاسية مطبوعة','krtasy-mtboaa-8-2',8,2,23,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL),(33,'إكسسوارات','akssoarat-8-3',8,2,24,1,'2026-06-09 12:01:43','2026-06-09 12:01:43','def.png',NULL,1,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `area_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `name_ar` varchar(100) DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `names` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`names`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_us` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `is_reply` tinyint(1) NOT NULL DEFAULT 0,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coupon_type` varchar(255) NOT NULL DEFAULT 'default',
  `limit` int(10) unsigned DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL,
  `exchange_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'Israeli Shekel','ILS','₪',1.00,'2026-06-09 08:07:51','2026-06-09 08:07:51'),(2,'US Dollar','USD','$',1.00,'2026-06-09 08:07:51','2026-06-09 08:07:51'),(3,'British Pound Sterling','GBP','£',1.00,'2026-06-09 08:07:51','2026-06-09 08:07:51'),(4,'Euro','EUR','€',1.00,'2026-06-09 08:07:51','2026-06-09 08:07:51');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_addresses`
--

DROP TABLE IF EXISTS `customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(100) NOT NULL,
  `contact_person_number` varchar(20) NOT NULL,
  `floor` varchar(10) DEFAULT NULL,
  `house` varchar(50) DEFAULT NULL,
  `road` varchar(50) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT 0,
  `contact_person_name` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `area_id` bigint(20) unsigned DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_charge_by_areas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `delivery_charge` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_charge_by_areas_branch_id_index` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_charge_by_areas`
--

LOCK TABLES `delivery_charge_by_areas` WRITE;
/*!40000 ALTER TABLE `delivery_charge_by_areas` DISABLE KEYS */;
INSERT INTO `delivery_charge_by_areas` VALUES (1,1,'رام الله',10,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(2,1,'البيرة',10,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(3,1,'بيتونيا',12,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(4,1,'بير نبالا',14,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(5,1,'قدورة',12,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(6,1,'عين عريك',15,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(7,1,'بيتيلو',18,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(8,1,'دير قديس',18,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(9,1,'أبو قش',14,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(10,1,'بيت أنان',20,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(11,1,'جفنا',15,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(12,1,'دورا القرع',20,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(13,1,'القدس — البلدة القديمة',25,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(14,1,'القدس — المشارف',28,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(15,1,'القدس — بيت حنينا',25,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(16,1,'القدس — شعفاط',25,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(17,1,'القدس — رأس العامود',25,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(18,1,'القدس — الطور',27,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(19,1,'القدس — عناتا',22,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(20,1,'العيزرية',20,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(21,1,'أبو ديس',20,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(22,1,'العيسوية',25,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(23,1,'بيت لحم',20,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(24,1,'بيت جالا',22,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(25,1,'بيت ساحور',22,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(26,1,'الدهيشة',22,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(27,1,'الخضر',25,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(28,1,'العبيدية',25,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(29,1,'الولجة',28,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(30,1,'حوسان',28,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(31,1,'نحالين',30,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(32,1,'الخليل — المركز',30,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(33,1,'الخليل — الحرس',32,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(34,1,'الخليل — الكيلو 9',35,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(35,1,'الخليل — بلد',30,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(36,1,'دورا',35,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(37,1,'يطا',40,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(38,1,'سعير',35,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(39,1,'حلحول',32,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(40,1,'ترقومية',38,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(41,1,'السموع',45,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(42,1,'بني نعيم',35,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(43,1,'نابلس — المركز',25,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(44,1,'نابلس — شرق',28,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(45,1,'نابلس — غرب',28,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(46,1,'بلاطة البلد',25,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(47,1,'رفيديا',25,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(48,1,'حوارة',30,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(49,1,'زواتا',32,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(50,1,'بيت إيبا',30,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(51,1,'صرة',30,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(52,1,'جنين — المركز',30,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(53,1,'جنين — مخيم',30,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(54,1,'يعبد',38,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(55,1,'قباطية',35,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(56,1,'عرابة',35,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(57,1,'صانور',40,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(58,1,'برقين',35,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(59,1,'طولكرم — المركز',28,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(60,1,'طولكرم — مخيم',28,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(61,1,'عنبتا',32,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(62,1,'قفين',35,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(63,1,'بلعا',35,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(64,1,'إيلار',38,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(65,1,'قلقيلية — المركز',28,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(66,1,'حبلة',30,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(67,1,'كفر ثلث',32,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(68,1,'بكا الشرقية',32,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(69,1,'سلفيت — المركز',25,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(70,1,'كفل حارس',28,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(71,1,'مردا',28,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(72,1,'دير استيا',30,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(73,1,'أريحا — المركز',25,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(74,1,'أريحا — عين السلطان',28,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(75,1,'الأغوار الشمالية',40,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(76,1,'الأغوار الجنوبية',45,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(77,1,'العوجا',35,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(78,1,'طوباس — المركز',35,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(79,1,'تياسير',45,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(80,1,'حيفا',50,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(81,1,'عكا',55,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(82,1,'الناصرة',45,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(83,1,'أم الفحم',40,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(84,1,'طمرة',45,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(85,1,'باقة الغربية',38,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(86,1,'جلجولية',35,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(87,1,'كفر قاسم',35,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(88,1,'يافا',50,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(89,1,'اللد',48,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(90,1,'الرملة',48,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(91,1,'تل أبيب',55,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(92,1,'بئر السبع',60,'2026-06-10 19:10:58','2026-06-10 19:10:58'),(93,1,'عسقلان — المجدل',60,'2026-06-10 19:10:58','2026-06-10 19:10:58');
/*!40000 ALTER TABLE `delivery_charge_by_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_charge_setups`
--

DROP TABLE IF EXISTS `delivery_charge_setups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_charge_setups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) unsigned NOT NULL,
  `delivery_charge_type` varchar(255) NOT NULL DEFAULT 'distance' COMMENT 'area/distance',
  `delivery_charge_per_kilometer` double NOT NULL DEFAULT 0,
  `minimum_delivery_charge` double NOT NULL DEFAULT 0,
  `minimum_distance_for_free_delivery` double NOT NULL DEFAULT 0,
  `fixed_delivery_charge` double NOT NULL DEFAULT 0,
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
INSERT INTO `delivery_charge_setups` VALUES (1,1,'area',0,5,0,15,'2026-06-10 19:10:58','2026-06-10 19:10:58');
/*!40000 ALTER TABLE `delivery_charge_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design_templates`
--

DROP TABLE IF EXISTS `design_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `design_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `canvas_json` longtext NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `canvas_width` smallint(5) unsigned NOT NULL DEFAULT 800,
  `canvas_height` smallint(5) unsigned NOT NULL DEFAULT 800,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design_templates`
--

LOCK TABLES `design_templates` WRITE;
/*!40000 ALTER TABLE `design_templates` DISABLE KEYS */;
INSERT INTO `design_templates` VALUES (1,'قالب',13,48,NULL,'{\"version\":\"5.1.0\",\"objects\":[{\"type\":\"i-text\",\"version\":\"5.1.0\",\"originX\":\"center\",\"originY\":\"top\",\"left\":400,\"top\":80,\"width\":76.86,\"height\":20.34,\"fill\":\"#1a1a1a\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"miter\",\"strokeUniform\":false,\"strokeMiterLimit\":4,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"skewX\":0,\"skewY\":0,\"fontFamily\":\"Cairo\",\"fontWeight\":\"normal\",\"fontSize\":18,\"text\":\"اكتب هنا...\",\"underline\":false,\"overline\":false,\"linethrough\":false,\"textAlign\":\"right\",\"fontStyle\":\"normal\",\"lineHeight\":1.16,\"textBackgroundColor\":\"\",\"charSpacing\":0,\"styles\":{},\"direction\":\"rtl\",\"path\":null,\"pathStartOffset\":0,\"pathSide\":\"left\",\"pathAlign\":\"baseline\",\"selectable\":true,\"hasControls\":true},{\"type\":\"i-text\",\"version\":\"5.1.0\",\"originX\":\"center\",\"originY\":\"top\",\"left\":400,\"top\":80,\"width\":333.36,\"height\":54.24,\"fill\":\"#1a1a1a\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"miter\",\"strokeUniform\":false,\"strokeMiterLimit\":4,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"skewX\":0,\"skewY\":0,\"fontFamily\":\"Cairo\",\"fontWeight\":\"700\",\"fontSize\":48,\"text\":\"العنوان الرئيسي\",\"underline\":false,\"overline\":false,\"linethrough\":false,\"textAlign\":\"right\",\"fontStyle\":\"normal\",\"lineHeight\":1.16,\"textBackgroundColor\":\"\",\"charSpacing\":0,\"styles\":{},\"direction\":\"rtl\",\"path\":null,\"pathStartOffset\":0,\"pathSide\":\"left\",\"pathAlign\":\"baseline\",\"selectable\":true,\"hasControls\":true},{\"type\":\"i-text\",\"version\":\"5.1.0\",\"originX\":\"center\",\"originY\":\"top\",\"left\":400,\"top\":80,\"width\":44.99,\"height\":24.86,\"fill\":\"#1a1a2e\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"miter\",\"strokeUniform\":false,\"strokeMiterLimit\":4,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"backgroundColor\":\"#f7d354\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"skewX\":0,\"skewY\":0,\"fontFamily\":\"Cairo\",\"fontWeight\":\"700\",\"fontSize\":22,\"text\":\"جديد\",\"underline\":false,\"overline\":false,\"linethrough\":false,\"textAlign\":\"right\",\"fontStyle\":\"normal\",\"lineHeight\":1.16,\"textBackgroundColor\":\"\",\"charSpacing\":0,\"styles\":{},\"direction\":\"rtl\",\"path\":null,\"pathStartOffset\":0,\"pathSide\":\"left\",\"pathAlign\":\"baseline\",\"selectable\":true,\"hasControls\":true},{\"type\":\"i-text\",\"version\":\"5.1.0\",\"originX\":\"center\",\"originY\":\"top\",\"left\":400,\"top\":80,\"width\":43.7,\"height\":18.08,\"fill\":\"#f7c59f\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"miter\",\"strokeUniform\":false,\"strokeMiterLimit\":4,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"skewX\":0,\"skewY\":0,\"fontFamily\":\"Cairo\",\"fontWeight\":\"600\",\"fontSize\":16,\"text\":\"تسمية\",\"underline\":false,\"overline\":false,\"linethrough\":false,\"textAlign\":\"right\",\"fontStyle\":\"normal\",\"lineHeight\":1.16,\"textBackgroundColor\":\"\",\"charSpacing\":0,\"styles\":{},\"direction\":\"rtl\",\"path\":null,\"pathStartOffset\":0,\"pathSide\":\"left\",\"pathAlign\":\"baseline\",\"selectable\":true,\"hasControls\":true}],\"background\":\"#ffffff\"}','86e1d3fb-f300-42c0-8616-b1b532e878cd.png',800,800,1,1,'2026-06-23 18:35:56','2026-06-23 18:35:56'),(3,'درع خشبي',13,64,NULL,'{\"version\":\"5.1.0\",\"objects\":[{\"type\":\"i-text\",\"version\":\"5.1.0\",\"originX\":\"center\",\"originY\":\"top\",\"left\":400,\"top\":80,\"width\":76.86,\"height\":20.34,\"fill\":\"#1a1a1a\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"miter\",\"strokeUniform\":false,\"strokeMiterLimit\":4,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"skewX\":0,\"skewY\":0,\"fontFamily\":\"Cairo\",\"fontWeight\":\"normal\",\"fontSize\":18,\"text\":\"اكتب هنا...\",\"underline\":false,\"overline\":false,\"linethrough\":false,\"textAlign\":\"right\",\"fontStyle\":\"normal\",\"lineHeight\":1.16,\"textBackgroundColor\":\"\",\"charSpacing\":0,\"styles\":{},\"direction\":\"rtl\",\"path\":null,\"pathStartOffset\":0,\"pathSide\":\"left\",\"pathAlign\":\"baseline\",\"selectable\":true,\"hasControls\":true},{\"type\":\"i-text\",\"version\":\"5.1.0\",\"originX\":\"center\",\"originY\":\"top\",\"left\":400,\"top\":80,\"width\":333.36,\"height\":54.24,\"fill\":\"#1a1a1a\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"miter\",\"strokeUniform\":false,\"strokeMiterLimit\":4,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"skewX\":0,\"skewY\":0,\"fontFamily\":\"Cairo\",\"fontWeight\":\"700\",\"fontSize\":48,\"text\":\"العنوان الرئيسي\",\"underline\":false,\"overline\":false,\"linethrough\":false,\"textAlign\":\"right\",\"fontStyle\":\"normal\",\"lineHeight\":1.16,\"textBackgroundColor\":\"\",\"charSpacing\":0,\"styles\":{},\"direction\":\"rtl\",\"path\":null,\"pathStartOffset\":0,\"pathSide\":\"left\",\"pathAlign\":\"baseline\",\"selectable\":true,\"hasControls\":true},{\"type\":\"i-text\",\"version\":\"5.1.0\",\"originX\":\"center\",\"originY\":\"top\",\"left\":400,\"top\":80,\"width\":44.99,\"height\":24.86,\"fill\":\"#1a1a2e\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"miter\",\"strokeUniform\":false,\"strokeMiterLimit\":4,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"backgroundColor\":\"#f7d354\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"skewX\":0,\"skewY\":0,\"fontFamily\":\"Cairo\",\"fontWeight\":\"700\",\"fontSize\":22,\"text\":\"جديد\",\"underline\":false,\"overline\":false,\"linethrough\":false,\"textAlign\":\"right\",\"fontStyle\":\"normal\",\"lineHeight\":1.16,\"textBackgroundColor\":\"\",\"charSpacing\":0,\"styles\":{},\"direction\":\"rtl\",\"path\":null,\"pathStartOffset\":0,\"pathSide\":\"left\",\"pathAlign\":\"baseline\",\"selectable\":true,\"hasControls\":true},{\"type\":\"i-text\",\"version\":\"5.1.0\",\"originX\":\"center\",\"originY\":\"top\",\"left\":400,\"top\":80,\"width\":43.7,\"height\":18.08,\"fill\":\"#f7c59f\",\"stroke\":null,\"strokeWidth\":1,\"strokeDashArray\":null,\"strokeLineCap\":\"butt\",\"strokeDashOffset\":0,\"strokeLineJoin\":\"miter\",\"strokeUniform\":false,\"strokeMiterLimit\":4,\"scaleX\":1,\"scaleY\":1,\"angle\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadow\":null,\"visible\":true,\"backgroundColor\":\"\",\"fillRule\":\"nonzero\",\"paintFirst\":\"fill\",\"globalCompositeOperation\":\"source-over\",\"skewX\":0,\"skewY\":0,\"fontFamily\":\"Cairo\",\"fontWeight\":\"600\",\"fontSize\":16,\"text\":\"تسمية\",\"underline\":false,\"overline\":false,\"linethrough\":false,\"textAlign\":\"right\",\"fontStyle\":\"normal\",\"lineHeight\":1.16,\"textBackgroundColor\":\"\",\"charSpacing\":0,\"styles\":{},\"direction\":\"rtl\",\"path\":null,\"pathStartOffset\":0,\"pathSide\":\"left\",\"pathAlign\":\"baseline\",\"selectable\":true,\"hasControls\":true}],\"background\":\"#ffffff\"}','86e1d3fb-f300-42c0-8616-b1b532e878cd.png',800,800,1,1,'2026-06-23 18:40:57','2026-06-23 18:40:57');
/*!40000 ALTER TABLE `design_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_verifications`
--

DROP TABLE IF EXISTS `email_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_verifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flash_sale_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `flash_sale_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flash_sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guest_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) DEFAULT NULL,
  `fcm_token` varchar(255) DEFAULT NULL,
  `language_code` varchar(255) NOT NULL DEFAULT 'en',
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_setups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
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
INSERT INTO `login_setups` VALUES (1,'email_verification','0','2026-06-09 08:07:51','2026-06-09 08:07:51'),(2,'phone_verification','0','2026-06-09 08:07:51','2026-06-09 08:07:51'),(3,'login_options','{\"manual_login\":1,\"otp_login\":0,\"social_media_login\":0}','2026-06-09 08:07:51','2026-06-09 08:07:51'),(4,'social_media_for_login','{\"google\":0,\"facebook\":0,\"apple\":0}','2026-06-09 08:07:51','2026-06-09 08:07:51');
/*!40000 ALTER TABLE `login_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyalty_point_logs`
--

DROP TABLE IF EXISTS `loyalty_point_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loyalty_point_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `points` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loyalty_points` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `level` varchar(20) NOT NULL DEFAULT 'bronze',
  `total_spent` decimal(12,2) NOT NULL DEFAULT 0.00,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint(20) unsigned NOT NULL,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2026_01_01_000000_baitpait_full_schema',1),(2,'2026_03_08_000001_add_minimum_stock_alert_to_products',1),(3,'2026_03_08_000002_ensure_mail_config_defaults',1),(4,'2026_03_08_000003_remove_recaptcha_from_business_settings',1),(5,'2026_03_08_000004_fix_social_chat_keys',1),(6,'2026_03_08_100000_create_webhook_endpoints_table',1),(7,'2026_03_08_200000_add_columns_for_backup_import',1),(8,'2026_03_08_200001_add_name_ar_to_cities',1),(9,'2026_03_10_000001_ensure_fcm_default_messages',1),(10,'2026_03_10_000002_ensure_cookies_default_text',1),(11,'2026_03_11_000001_rename_restaurant_name_to_store_name',1),(12,'2026_03_12_000001_create_product_tags_tables',1),(13,'2026_03_12_000002_create_order_status_logs_table',1),(14,'2026_03_12_000003_create_product_relations_table',1),(15,'2026_03_13_000001_add_login_enabled_to_branches',1),(16,'2026_03_15_000001_add_performance_indexes',1),(17,'2026_03_16_000001_add_user_type_columns_to_users',1),(18,'2026_03_16_000002_add_loyalty_and_coupon_together_setting',1),(19,'2026_06_10_161858_add_visible_to_user_types_to_categories_table',2),(20,'2026_06_13_120452_add_design_image_to_order_details',3),(21,'2026_06_16_114042_add_visible_to_user_types_to_products_table',4),(22,'2026_06_16_115548_create_clients_table',5),(23,'2026_06_23_142939_create_design_templates_table',6),(24,'2026_06_23_144005_add_category_id_to_design_templates',7),(25,'2026_06_23_144428_add_product_id_to_design_templates',8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
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
INSERT INTO `oauth_access_tokens` VALUES ('291b104577df9f1a2ac845e9b709152eecff95a98a266ce7c1a2bfa0aa68402c77718d186e9a90b8',2,1,'RestaurantCustomerAuth','[]',0,'2026-06-10 14:01:18','2026-06-10 14:01:18','2027-06-10 17:01:18'),('4ee5c2b68fc1e9fda8dd065a57eeb19ec0d1e5173bce7aa1b855013084a40f0842b0d3cb48294a27',1,1,'RestaurantCustomerAuth','[]',0,'2026-06-10 13:44:22','2026-06-10 13:44:22','2027-06-10 16:44:22');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Fanoon Personal Access Client','KWJa49zf8eOBUrQkAcs2eYlEn4c2QRSMOGNP8eBl',NULL,'http://localhost',1,0,0,'2026-06-09 08:08:00','2026-06-09 08:08:00'),(2,NULL,'Fanoon Password Grant Client','pNhouevZsKqmVvXHyMcv8d47Mpn9Cz5L8MjIPfFP','users','http://localhost',0,1,0,'2026-06-09 08:08:00','2026-06-09 08:08:00');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2026-06-09 08:08:00','2026-06-09 08:08:00');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_areas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `branch_id` bigint(20) unsigned NOT NULL,
  `area_id` bigint(20) unsigned NOT NULL,
  `distance` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_areas_order_id_index` (`order_id`),
  KEY `order_areas_branch_id_index` (`branch_id`),
  KEY `order_areas_area_id_index` (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_areas`
--

LOCK TABLES `order_areas` WRITE;
/*!40000 ALTER TABLE `order_areas` DISABLE KEYS */;
INSERT INTO `order_areas` VALUES (1,100001,1,1,0,'2026-06-10 19:26:27','2026-06-10 19:26:27'),(2,100002,1,6,0,'2026-06-10 19:27:29','2026-06-10 19:27:29');
/*!40000 ALTER TABLE `order_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `product_details` text DEFAULT NULL,
  `variation` varchar(255) DEFAULT NULL,
  `design_image` varchar(500) DEFAULT NULL,
  `discount_on_product` decimal(8,2) DEFAULT NULL,
  `discount_type` varchar(20) NOT NULL DEFAULT 'amount',
  `quantity` int(10) unsigned NOT NULL DEFAULT 1,
  `tax_amount` decimal(8,2) NOT NULL DEFAULT 1.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `unit` varchar(255) NOT NULL DEFAULT 'pc',
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `order_details_order_id_index` (`order_id`),
  KEY `order_details_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,2,100001,60.00,'{\"id\":2,\"product_brand_id\":null,\"name\":\"\\u062f\\u0631\\u0639 \\u062e\\u0634\\u0628\\u064a \\u0645\\u0632\\u062e\\u0631\\u0641\",\"description\":\"\\u0645\\u0646\\u062a\\u062c \\u0637\\u0628\\u0627\\u0639\\u0629 \\u0627\\u062d\\u062a\\u0631\\u0627\\u0641\\u064a \\u2014 \\u062f\\u0631\\u0639 \\u062e\\u0634\\u0628\\u064a \\u0645\\u0632\\u062e\\u0631\\u0641\",\"image\":\"[\\\"product_2.jpg\\\"]\",\"price\":60,\"variations\":null,\"tax\":0,\"status\":1,\"created_at\":\"2026-06-09T12:01:43.000000Z\",\"updated_at\":\"2026-06-09T12:01:43.000000Z\",\"attributes\":null,\"category_ids\":\"[{\\\"id\\\":\\\"1\\\"},{\\\"id\\\":\\\"9\\\"}]\",\"choice_options\":null,\"discount\":0,\"discount_type\":\"percent\",\"tax_type\":\"percent\",\"unit\":\"\\u0642\\u0637\\u0639\\u0629\",\"total_stock\":999,\"min_order_qty\":1,\"minimum_stock_alert\":null,\"view_count\":0,\"sales_count\":0,\"image_fullpath\":[\"http:\\/\\/127.0.0.1:8080\\/storage\\/product\\/product_2.jpg\"],\"translations\":[]}','[]',NULL,0.00,'discount_on_product',1,0.00,'2026-06-10 19:26:27','2026-06-10 19:26:27',NULL,'قطعة',1),(2,2,100002,60.00,'{\"id\":2,\"product_brand_id\":null,\"name\":\"\\u062f\\u0631\\u0639 \\u062e\\u0634\\u0628\\u064a \\u0645\\u0632\\u062e\\u0631\\u0641\",\"description\":\"\\u0645\\u0646\\u062a\\u062c \\u0637\\u0628\\u0627\\u0639\\u0629 \\u0627\\u062d\\u062a\\u0631\\u0627\\u0641\\u064a \\u2014 \\u062f\\u0631\\u0639 \\u062e\\u0634\\u0628\\u064a \\u0645\\u0632\\u062e\\u0631\\u0641\",\"image\":\"[\\\"product_2.jpg\\\"]\",\"price\":60,\"variations\":null,\"tax\":0,\"status\":1,\"created_at\":\"2026-06-09T12:01:43.000000Z\",\"updated_at\":\"2026-06-10T19:26:27.000000Z\",\"attributes\":null,\"category_ids\":\"[{\\\"id\\\":\\\"1\\\"},{\\\"id\\\":\\\"9\\\"}]\",\"choice_options\":null,\"discount\":0,\"discount_type\":\"percent\",\"tax_type\":\"percent\",\"unit\":\"\\u0642\\u0637\\u0639\\u0629\",\"total_stock\":998,\"min_order_qty\":1,\"minimum_stock_alert\":null,\"view_count\":0,\"sales_count\":0,\"image_fullpath\":[\"http:\\/\\/localhost:8080\\/storage\\/product\\/product_2.jpg\"],\"translations\":[]}','[]',NULL,0.00,'discount_on_product',1,0.00,'2026-06-10 19:27:29','2026-06-10 19:27:29',NULL,'قطعة',1);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shipments`
--

DROP TABLE IF EXISTS `order_shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shipments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `shipping_company_id` bigint(20) unsigned NOT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending' COMMENT 'pending, shipped, in_transit, delivered, failed',
  `notes` text DEFAULT NULL,
  `shipped_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_shipments_order_id_index` (`order_id`),
  KEY `order_shipments_shipping_company_id_index` (`shipping_company_id`),
  CONSTRAINT `order_shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_shipments_shipping_company_id_foreign` FOREIGN KEY (`shipping_company_id`) REFERENCES `shipping_companies` (`id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `old_status` varchar(50) DEFAULT NULL,
  `new_status` varchar(50) NOT NULL,
  `changed_by_type` varchar(30) DEFAULT NULL COMMENT 'admin, branch, system',
  `changed_by_id` bigint(20) unsigned DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_status_logs_order_id_created_at_index` (`order_id`,`created_at`),
  CONSTRAINT `order_status_logs_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_logs`
--

LOCK TABLES `order_status_logs` WRITE;
/*!40000 ALTER TABLE `order_status_logs` DISABLE KEYS */;
INSERT INTO `order_status_logs` VALUES (1,100002,'pending','processing','App\\Models\\Admin',1,NULL,'2026-06-10 19:34:15','2026-06-10 19:34:15'),(2,100002,'processing','قيد الطباعة','App\\Models\\Admin',1,NULL,'2026-06-10 19:34:32','2026-06-10 19:34:32'),(3,100002,'قيد الطباعة','out_for_delivery','App\\Models\\Admin',1,NULL,'2026-06-10 19:35:12','2026-06-10 19:35:12'),(4,100002,'out_for_delivery','في الطريق','App\\Models\\Admin',1,NULL,'2026-06-10 19:40:45','2026-06-10 19:40:45'),(5,100002,'في الطريق','في الطريق','App\\Models\\Admin',1,NULL,'2026-06-10 19:48:01','2026-06-10 19:48:01'),(6,100001,'pending','قيد الطباعة','App\\Models\\Admin',1,NULL,'2026-06-10 19:59:22','2026-06-10 19:59:22');
/*!40000 ALTER TABLE `order_status_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT 0,
  `order_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `coupon_discount_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `coupon_discount_title` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(255) NOT NULL DEFAULT 'pending',
  `total_tax_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(30) DEFAULT NULL,
  `transaction_reference` varchar(255) DEFAULT NULL,
  `delivery_address_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT 0.00,
  `order_note` text DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `order_type` varchar(255) NOT NULL DEFAULT 'delivery',
  `branch_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `callback` varchar(255) DEFAULT NULL,
  `extra_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `delivery_address` text DEFAULT NULL,
  `bring_change_amount` decimal(24,8) DEFAULT 0.00000000,
  `paid_amount` decimal(24,8) DEFAULT 0.00000000,
  `loyalty_points_used` int(10) unsigned NOT NULL DEFAULT 0,
  `loyalty_discount_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `additional_payment_method` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional_payment_method`)),
  PRIMARY KEY (`id`),
  KEY `orders_user_id_index` (`user_id`),
  KEY `orders_order_status_index` (`order_status`),
  KEY `orders_branch_id_index` (`branch_id`),
  KEY `orders_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=100003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (100001,NULL,1,70.00,0.00,NULL,'unpaid','قيد الطباعة',0.00,'cash_on_delivery',NULL,NULL,'2026-06-10 19:26:27','2026-06-10 19:59:22',1,10.00,NULL,NULL,'delivery',1,NULL,0.00,'{\"address\":\"\\u0631\\u0627\\u0645 \\u0627\\u0644\\u0644\\u0647 \\u2014 \\u0627\\u0644\\u062d\\u064a \\u0627\\u0644\\u062c\\u062f\\u064a\\u062f\\u060c \\u0645\\u0628\\u0646\\u0649 5\",\"contact_person_name\":\"\\u0645\\u062d\\u0645\\u062f\",\"contact_person_number\":\"0594513978\"}',NULL,0.00000000,0,0.00,NULL),(100002,NULL,1,75.00,0.00,NULL,'paid','في الطريق',0.00,'cash_on_delivery',NULL,NULL,'2026-06-10 19:27:29','2026-06-10 19:40:45',1,15.00,NULL,NULL,'delivery',1,NULL,0.00,'{\"address\":\"\\u0639\\u064a\\u0646 \\u0639\\u0631\\u064a\\u0643 \\u2014 \\u0633\\u0633\\u0634\\u064a\\u064a\\u0633\",\"contact_person_name\":\"\\u0645\\u062d\\u0645\\u062f\",\"contact_person_number\":\"0594513978\"}',NULL,0.00000000,0,0.00,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email_or_phone` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_verifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `temp_block_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_relations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `related_product_id` bigint(20) unsigned NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_user_type_discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `user_type_id` bigint(20) unsigned NOT NULL,
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) NOT NULL DEFAULT 'percent',
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_user_type_prices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `user_type_id` bigint(20) unsigned NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_brand_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `variations` text DEFAULT NULL,
  `tax` decimal(8,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `visible_to_user_types` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'NULL = all; [] = none; [id,...] = specific user_type IDs; include 0 for guests' CHECK (json_valid(`visible_to_user_types`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attributes` varchar(255) DEFAULT NULL,
  `category_ids` varchar(255) DEFAULT NULL,
  `choice_options` text DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) NOT NULL DEFAULT 'percent',
  `tax_type` varchar(20) NOT NULL DEFAULT 'percent',
  `unit` varchar(255) NOT NULL DEFAULT 'pc',
  `total_stock` bigint(20) unsigned NOT NULL DEFAULT 0,
  `min_order_qty` int(10) unsigned NOT NULL DEFAULT 1,
  `minimum_stock_alert` int(10) unsigned DEFAULT NULL,
  `view_count` int(10) unsigned NOT NULL DEFAULT 0,
  `sales_count` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `products_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,NULL,'درع خشبي كلاسيكي','منتج طباعة احترافي — درع خشبي كلاسيكي','[\"product_1.jpg\"]',45,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-16 08:49:28',NULL,'[{\"id\":\"1\"},{\"id\":\"9\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(2,NULL,'درع خشبي مزخرف','منتج طباعة احترافي — درع خشبي مزخرف','[\"product_2.jpg\"]',60,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-10 19:27:29',NULL,'[{\"id\":\"1\"},{\"id\":\"9\"}]',NULL,0.00,'percent','percent','قطعة',997,1,NULL,0,0),(3,NULL,'لوح خشبي تكريمي','منتج طباعة احترافي — لوح خشبي تكريمي','[\"product_3.jpg\"]',55,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"1\"},{\"id\":\"9\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(4,NULL,'درع كريستال مقطّع','منتج طباعة احترافي — درع كريستال مقطّع','[\"product_4.jpg\"]',95,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"1\"},{\"id\":\"10\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(5,NULL,'درع كريستال ملوّن','منتج طباعة احترافي — درع كريستال ملوّن','[\"product_5.jpg\"]',110,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"1\"},{\"id\":\"10\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(6,NULL,'كأس كريستال','منتج طباعة احترافي — كأس كريستال','[\"product_6.jpg\"]',80,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"1\"},{\"id\":\"10\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(7,NULL,'درع زجاج شفاف','منتج طباعة احترافي — درع زجاج شفاف','[\"product_7.jpg\"]',70,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"1\"},{\"id\":\"11\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(8,NULL,'درع زجاج ملوّن','منتج طباعة احترافي — درع زجاج ملوّن','[\"product_8.jpg\"]',85,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"1\"},{\"id\":\"11\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(9,NULL,'درع ألومنيوم','منتج طباعة احترافي — درع ألومنيوم','[\"product_9.jpg\"]',65,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"1\"},{\"id\":\"12\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(10,NULL,'لوح نحاسي','منتج طباعة احترافي — لوح نحاسي','[\"product_10.jpg\"]',90,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"1\"},{\"id\":\"12\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(11,NULL,'رول أب 60×160 سم','منتج طباعة احترافي — رول أب 60×160 سم','[\"product_11.jpg\"]',55,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"2\"},{\"id\":\"13\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(12,NULL,'رول أب 85×200 سم','منتج طباعة احترافي — رول أب 85×200 سم','[\"product_12.jpg\"]',75,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"2\"},{\"id\":\"13\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(13,NULL,'رول أب مزدوج الوجه','منتج طباعة احترافي — رول أب مزدوج الوجه','[\"product_13.jpg\"]',110,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"2\"},{\"id\":\"13\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(14,NULL,'شادر قماش كتاني','منتج طباعة احترافي — شادر قماش كتاني','[\"product_14.jpg\"]',120,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"2\"},{\"id\":\"14\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(15,NULL,'شادر mesh شبكي','منتج طباعة احترافي — شادر mesh شبكي','[\"product_15.jpg\"]',95,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"2\"},{\"id\":\"14\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(16,NULL,'إكس بانر 60×160 سم','منتج طباعة احترافي — إكس بانر 60×160 سم','[\"product_16.jpg\"]',45,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"2\"},{\"id\":\"15\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(17,NULL,'إكس بانر صغير 40×120 سم','منتج طباعة احترافي — إكس بانر صغير 40×120 سم','[\"product_17.jpg\"]',35,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"2\"},{\"id\":\"15\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(18,NULL,'كرت بيزنس عادي','منتج طباعة احترافي — كرت بيزنس عادي','[\"product_18.jpg\"]',25,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"3\"},{\"id\":\"16\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(19,NULL,'كرت بيزنس مقوى فاخر','منتج طباعة احترافي — كرت بيزنس مقوى فاخر','[\"product_19.jpg\"]',45,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"3\"},{\"id\":\"16\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(20,NULL,'كرت بيزنس UV لامع','منتج طباعة احترافي — كرت بيزنس UV لامع','[\"product_20.jpg\"]',55,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"3\"},{\"id\":\"16\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(21,NULL,'دعوة رسمية A5','منتج طباعة احترافي — دعوة رسمية A5','[\"product_21.jpg\"]',8,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"3\"},{\"id\":\"17\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(22,NULL,'دعوة مؤتمر وفعالية','منتج طباعة احترافي — دعوة مؤتمر وفعالية','[\"product_22.jpg\"]',12,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"3\"},{\"id\":\"17\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(23,NULL,'دعوة حفل وعشاء','منتج طباعة احترافي — دعوة حفل وعشاء','[\"product_23.jpg\"]',10,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"3\"},{\"id\":\"17\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(24,NULL,'كرت تهنئة عيد ميلاد','منتج طباعة احترافي — كرت تهنئة عيد ميلاد','[\"product_24.jpg\"]',5,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"3\"},{\"id\":\"18\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(25,NULL,'كرت تهنئة عامة','منتج طباعة احترافي — كرت تهنئة عامة','[\"product_25.jpg\"]',5,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"3\"},{\"id\":\"18\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(26,NULL,'ملصق دائري 5 سم','منتج طباعة احترافي — ملصق دائري 5 سم','[\"product_26.jpg\"]',15,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"4\"},{\"id\":\"19\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(27,NULL,'ملصق دائري 10 سم','منتج طباعة احترافي — ملصق دائري 10 سم','[\"product_27.jpg\"]',22,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"4\"},{\"id\":\"19\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(28,NULL,'ليبل مستطيل صغير','منتج طباعة احترافي — ليبل مستطيل صغير','[\"product_28.jpg\"]',12,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"4\"},{\"id\":\"20\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(29,NULL,'ليبل مستطيل كبير','منتج طباعة احترافي — ليبل مستطيل كبير','[\"product_29.jpg\"]',18,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"4\"},{\"id\":\"20\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(30,NULL,'ملصق شفاف','منتج طباعة احترافي — ملصق شفاف','[\"product_30.jpg\"]',20,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"4\"},{\"id\":\"21\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(31,NULL,'ملصق هولوغرامي','منتج طباعة احترافي — ملصق هولوغرامي','[\"product_31.jpg\"]',30,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"4\"},{\"id\":\"21\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(32,NULL,'ليبل كرافت ورقي','منتج طباعة احترافي — ليبل كرافت ورقي','[\"product_32.jpg\"]',10,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"4\"},{\"id\":\"21\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(33,NULL,'دعوة زفاف كلاسيكية','منتج طباعة احترافي — دعوة زفاف كلاسيكية','[\"product_33.jpg\"]',15,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"5\"},{\"id\":\"22\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(34,NULL,'دعوة زفاف عصرية','منتج طباعة احترافي — دعوة زفاف عصرية','[\"product_34.jpg\"]',18,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"5\"},{\"id\":\"22\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(35,NULL,'دعوة زفاف فاخرة','منتج طباعة احترافي — دعوة زفاف فاخرة','[\"product_35.jpg\"]',25,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"5\"},{\"id\":\"22\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(36,NULL,'بطاقة رقم الطاولة','منتج طباعة احترافي — بطاقة رقم الطاولة','[\"product_36.jpg\"]',8,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"5\"},{\"id\":\"23\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(37,NULL,'بطاقة المنيو','منتج طباعة احترافي — بطاقة المنيو','[\"product_37.jpg\"]',12,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"5\"},{\"id\":\"23\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(38,NULL,'لافتة الترحيب','منتج طباعة احترافي — لافتة الترحيب','[\"product_38.jpg\"]',45,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"5\"},{\"id\":\"23\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(39,NULL,'بطاقة شكر للضيوف','منتج طباعة احترافي — بطاقة شكر للضيوف','[\"product_39.jpg\"]',6,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"5\"},{\"id\":\"24\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(40,NULL,'غلاف هدية مطبوع','منتج طباعة احترافي — غلاف هدية مطبوع','[\"product_40.jpg\"]',10,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"5\"},{\"id\":\"24\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(41,NULL,'فلاير A5','منتج طباعة احترافي — فلاير A5','[\"product_41.jpg\"]',18,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"6\"},{\"id\":\"25\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(42,NULL,'فلاير A4','منتج طباعة احترافي — فلاير A4','[\"product_42.jpg\"]',25,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"6\"},{\"id\":\"25\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(43,NULL,'فلاير ثلاثي الطي','منتج طباعة احترافي — فلاير ثلاثي الطي','[\"product_43.jpg\"]',35,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"6\"},{\"id\":\"25\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(44,NULL,'بوستر A3','منتج طباعة احترافي — بوستر A3','[\"product_44.jpg\"]',30,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"6\"},{\"id\":\"26\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(45,NULL,'بوستر A2','منتج طباعة احترافي — بوستر A2','[\"product_45.jpg\"]',50,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"6\"},{\"id\":\"26\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(46,NULL,'بوستر A1 كبير','منتج طباعة احترافي — بوستر A1 كبير','[\"product_46.jpg\"]',85,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"6\"},{\"id\":\"26\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(47,NULL,'بروشور ثنائي الطي','منتج طباعة احترافي — بروشور ثنائي الطي','[\"product_47.jpg\"]',40,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"6\"},{\"id\":\"27\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(48,NULL,'بروشور ثلاثي الطي','منتج طباعة احترافي — بروشور ثلاثي الطي','[\"product_48.jpg\"]',50,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"6\"},{\"id\":\"27\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(49,NULL,'كتالوج منتجات','منتج طباعة احترافي — كتالوج منتجات','[\"product_49.jpg\"]',120,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"6\"},{\"id\":\"27\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(50,NULL,'قارمة أكريليك','منتج طباعة احترافي — قارمة أكريليك','[\"product_50.jpg\"]',180,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"7\"},{\"id\":\"28\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(51,NULL,'قارمة PVC','منتج طباعة احترافي — قارمة PVC','[\"product_51.jpg\"]',95,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"7\"},{\"id\":\"28\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(52,NULL,'قارمة LED مضيئة','منتج طباعة احترافي — قارمة LED مضيئة','[\"product_52.jpg\"]',350,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"7\"},{\"id\":\"28\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(53,NULL,'لافتة خارجية ألومنيوم','منتج طباعة احترافي — لافتة خارجية ألومنيوم','[\"product_53.jpg\"]',140,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"7\"},{\"id\":\"29\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(54,NULL,'لافتة داخلية فوم','منتج طباعة احترافي — لافتة داخلية فوم','[\"product_54.jpg\"]',65,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"7\"},{\"id\":\"29\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(55,NULL,'علم طاولة','منتج طباعة احترافي — علم طاولة','[\"product_55.jpg\"]',35,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"7\"},{\"id\":\"30\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(56,NULL,'علم طريق قماش','منتج طباعة احترافي — علم طريق قماش','[\"product_56.jpg\"]',75,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"7\"},{\"id\":\"30\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(57,NULL,'كوب سيراميك مطبوع','منتج طباعة احترافي — كوب سيراميك مطبوع','[\"product_57.jpg\"]',25,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"8\"},{\"id\":\"31\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(58,NULL,'كوب حراري Magic','منتج طباعة احترافي — كوب حراري Magic','[\"product_58.jpg\"]',35,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"8\"},{\"id\":\"31\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(59,NULL,'مج زجاجي','منتج طباعة احترافي — مج زجاجي','[\"product_59.jpg\"]',30,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"8\"},{\"id\":\"31\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(60,NULL,'دفتر A5 مطبوع','منتج طباعة احترافي — دفتر A5 مطبوع','[\"product_60.jpg\"]',30,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"8\"},{\"id\":\"32\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(61,NULL,'مفكرة سنوية','منتج طباعة احترافي — مفكرة سنوية','[\"product_61.jpg\"]',45,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"8\"},{\"id\":\"32\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(62,NULL,'حقيبة قماش مطبوعة','منتج طباعة احترافي — حقيبة قماش مطبوعة','[\"product_62.jpg\"]',28,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"8\"},{\"id\":\"33\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(63,NULL,'إطار صورة مطبوع','منتج طباعة احترافي — إطار صورة مطبوع','[\"product_63.jpg\"]',40,NULL,0.00,1,NULL,'2026-06-09 12:01:43','2026-06-09 12:01:43',NULL,'[{\"id\":\"8\"},{\"id\":\"33\"}]',NULL,0.00,'percent','percent','قطعة',999,1,NULL,0,0),(64,NULL,'درع خشبي','<p>درع</p>','[\"2026-06-23-6a3ad2f853d6c.webp\"]',50,'[]',0.00,1,NULL,'2026-06-23 18:39:52','2026-06-23 18:39:52','[]','[{\"id\":\"1\",\"position\":1},{\"id\":\"9\",\"position\":2}]','[]',0.00,'percent','percent','pc',50,1,NULL,0,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `comment` mediumtext DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `rating` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `api_url` varchar(500) DEFAULT NULL,
  `api_key` text DEFAULT NULL,
  `api_secret` varchar(500) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_medias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT 0,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `translationable_type` varchar(255) NOT NULL,
  `translationable_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_translationable_id_index` (`translationable_id`),
  KEY `translations_locale_index` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'App\\Models\\Product',64,'en','description','<p><br></p>'),(2,'App\\Models\\Product',64,'he','description','<p><br></p>');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_types`
--

LOCK TABLES `user_types` WRITE;
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
INSERT INTO `user_types` VALUES (1,'زائر',1,0,'2026-06-10 13:25:32','2026-06-10 13:25:32'),(2,'مميز',0,0,'2026-06-23 11:08:55','2026-06-23 11:08:55');
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_verification_token` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `cm_firebase_token` varchar(255) DEFAULT NULL,
  `temporary_token` varchar(255) DEFAULT NULL,
  `login_hit_count` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `temp_block_time` timestamp NULL DEFAULT NULL,
  `login_medium` varchar(255) NOT NULL DEFAULT 'general',
  `user_type_id` bigint(20) unsigned DEFAULT NULL,
  `requested_user_type_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'mohammad','khallaf','mohammadkhallaf2002@gmail.com',NULL,0,NULL,'$2y$10$8q0YNf9IFrTPjw7zD2PwbOkpY2yjlwme4E4lz9H9Uj.Vbk58x6GOS',NULL,'2026-06-10 13:44:22','2026-06-10 13:44:22',NULL,'+972594513978',NULL,NULL,0,0,NULL,'general',1,NULL),(2,'mohammad','khallaf','mohammadkhallaf15@gmail.com',NULL,0,NULL,'$2y$10$T.xlLBXT1ECEgkkfq.M0KOjegT1vEByGVR3MArqxFSXCB58oi7vX2',NULL,'2026-06-10 14:01:18','2026-06-10 14:01:18',NULL,'+972598420090',NULL,NULL,0,0,NULL,'general',1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook_endpoints`
--

DROP TABLE IF EXISTS `webhook_endpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webhook_endpoints` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(500) NOT NULL,
  `events` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`events`)),
  `secret` varchar(64) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-25 16:03:53
