-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: handyman
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `latitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foreign_address_user` (`user_id`),
  CONSTRAINT `foreign_address_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (3,'كورش المعادي','E-finance, Nile Corniche, Al Isaweyah, El-Basatin, Cairo Governorate, Egypt',31.2361738,29.9726121,10,'2019-02-11 10:25:05','2019-02-11 10:25:05',NULL),(4,'Maadi','E-finance, Nile Corniche, Al Isaweyah, El-Basatin, Cairo Governorate, Egypt',31.2361738,29.9726121,9,'2019-02-11 10:30:56','2019-02-11 10:30:56',NULL),(8,'patel nagar','Laxmi Nagar, New Delhi, Delhi, India',77.2748070,28.6367360,21,'2019-02-16 11:05:11','2019-02-21 05:44:18','2019-02-21 05:44:18'),(9,'myaddress','Jana Kozietulskiego 15A, 85-657 Bydgoszcz, Polska',18.0268892,53.1335455,5,'2019-02-16 17:27:43','2019-03-06 16:52:38',NULL),(10,'Home','Gali Number 21, Rani Bagh, Dhampur, Uttar Pradesh 246761, India',78.5174497,29.2978178,27,'2019-02-18 09:06:00','2019-02-18 09:06:00',NULL),(11,'No','Dhaka, Bangladesh',90.3635083,23.7738276,33,'2019-02-18 10:12:47','2019-02-18 10:12:47',NULL),(12,'ffgghb','Current location',-34.8661297,-7.1133050,38,'2019-02-18 16:52:33','2019-02-18 16:52:33',NULL),(14,'Home','Amalieparken, 2665 Vallensbæk Strand, Denmark',12.3760274,55.6250077,41,'2019-02-19 11:25:16','2019-02-19 11:25:16',NULL),(15,'Patel Nagar','Laxmi Nagar, New Delhi, Delhi, India',77.2748070,28.6367360,21,'2019-02-20 16:38:47','2019-02-20 16:38:47',NULL),(17,'Terengganu','Kuala Terengganu, Terengganu, Malaysia',103.1370142,5.3296240,5,'2019-03-03 11:28:06','2019-03-03 11:28:06',NULL),(18,'villa 123','Unnamed Road - Abu Dhabi - United Arab Emirates',54.5323208,24.4216456,59,'2019-03-08 01:52:57','2019-03-08 01:52:57',NULL),(19,'Work','Rue Hachi Abderrahmane, Djelfa, الجزائر',3.2510345,34.6707292,5,'2019-03-10 08:38:20','2019-03-10 08:38:20',NULL),(20,'Test location','Hacettepe, Kızılay Sk. No:6, 06230 Altındağ/Ankara, Turquia',32.8582536,39.9312233,42,'2019-03-11 11:23:10','2019-03-11 11:23:10',NULL);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_status_logs`
--

DROP TABLE IF EXISTS `appointment_status_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_status_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `appointment_id` int(10) unsigned NOT NULL,
  `status` enum('pending','accepted','ongoing','complete','cancelled','rejected') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appointment_status_log_foreign_user` (`user_id`),
  KEY `appointment_status_log_foreign_appointment` (`appointment_id`),
  CONSTRAINT `appointment_status_log_foreign_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointment_status_log_foreign_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_status_logs`
--

LOCK TABLES `appointment_status_logs` WRITE;
/*!40000 ALTER TABLE `appointment_status_logs` DISABLE KEYS */;
INSERT INTO `appointment_status_logs` VALUES (43,5,27,'accepted','2019-02-16 17:43:08','2019-02-16 17:43:08'),(47,5,27,'ongoing','2019-02-18 12:28:28','2019-02-18 12:28:28'),(48,5,27,'complete','2019-02-18 12:28:38','2019-02-18 12:28:38'),(52,41,31,'accepted','2019-02-19 11:26:40','2019-02-19 11:26:40'),(53,41,31,'ongoing','2019-02-19 11:28:51','2019-02-19 11:28:51'),(54,41,31,'complete','2019-02-19 11:29:02','2019-02-19 11:29:02'),(55,5,32,'accepted','2019-02-20 15:35:27','2019-02-20 15:35:27'),(56,5,32,'ongoing','2019-02-21 03:41:27','2019-02-21 03:41:27'),(57,5,32,'complete','2019-02-21 03:55:00','2019-02-21 03:55:00'),(58,5,36,'accepted','2019-02-22 14:26:18','2019-02-22 14:26:18'),(59,5,36,'ongoing','2019-02-22 14:26:33','2019-02-22 14:26:33'),(60,5,36,'complete','2019-02-22 14:26:37','2019-02-22 14:26:37'),(61,5,37,'accepted','2019-03-03 13:28:21','2019-03-03 13:28:21'),(62,5,37,'ongoing','2019-03-03 13:29:23','2019-03-03 13:29:23'),(63,5,37,'complete','2019-03-03 13:29:26','2019-03-03 13:29:26');
/*!40000 ALTER TABLE `appointment_status_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `address_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `status` enum('pending','accepted','onway','ongoing','complete','cancelled','rejected') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appointment_foreign_user` (`user_id`),
  KEY `appointment_foreign_provider_profile` (`provider_id`),
  KEY `appointment_foreign_category` (`category_id`),
  CONSTRAINT `appointment_foreign_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointment_foreign_provider_profile` FOREIGN KEY (`provider_id`) REFERENCES `provider_profiles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointment_foreign_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (27,1,5,9,'2019-02-19','09:00:00','11:00:00','complete','2019-02-16 17:27:47','2019-02-18 12:28:38',5,NULL),(29,14,33,11,'2019-02-19','09:00:00','11:00:00','pending','2019-02-18 10:12:55','2019-02-18 10:12:55',23,NULL),(31,15,41,14,'2019-02-20','09:00:00','11:00:00','complete','2019-02-19 11:25:47','2019-02-19 11:29:02',5,'I need your service'),(32,1,5,9,'2019-02-20','09:00:00','11:00:00','complete','2019-02-19 18:02:20','2019-02-21 03:55:00',5,NULL),(33,13,21,8,'2019-02-23','17:00:00','19:00:00','pending','2019-02-21 03:38:39','2019-02-21 03:38:39',5,NULL),(34,13,2,8,'2019-02-24','15:00:00','17:00:00','cancelled','2019-02-21 05:16:01','2019-02-21 05:37:07',5,NULL),(35,13,2,15,'2019-02-22','09:00:00','11:00:00','pending','2019-02-21 05:39:11','2019-02-21 05:39:11',5,NULL),(36,1,5,9,'2019-02-23','13:00:00','15:00:00','complete','2019-02-22 14:13:37','2019-02-22 14:26:37',5,NULL),(37,1,5,9,'2019-03-04','09:00:00','11:00:00','complete','2019-03-03 13:27:26','2019-03-03 13:29:26',5,NULL),(38,1,5,9,'2019-03-04','09:00:00','11:00:00','pending','2019-03-03 13:30:12','2019-03-03 13:30:12',22,NULL),(39,13,5,9,'2019-03-11','17:00:00','19:00:00','cancelled','2019-03-06 08:42:42','2019-03-06 16:53:27',5,'please dont be late.'),(40,1,5,19,'2019-03-10','11:00:00','13:00:00','rejected','2019-03-10 09:01:30','2019-03-10 09:03:31',5,NULL);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `secondary_image_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_foreign_categories` (`parent_id`),
  CONSTRAINT `categories_foreign_categories` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Plumber','http://opuslabs.in:9085/storage/uploads/ZZ9X3T79wtZJDpSTmBEQ05UM8AJxna1oBZqhW87Q.png',NULL,'2019-02-09 11:10:34','2019-02-14 08:46:58','http://opuslabs.in:9085/storage/uploads/M9JjTUbGnxRWkKJRJ0zVknu1GBLfFwshUBFXM9Xm.png'),(2,'Appliances','http://opuslabs.in:9085/storage/uploads/rBarSy7Ot38xeVlQPtwYI06KhB0EIgX6Pdg4RY4w.png',NULL,'2019-02-09 11:10:48','2019-02-14 08:48:13','http://opuslabs.in:9085/storage/uploads/2P1SOX8WoH9fyKQ2asWYNtjZxRcsSiAWbnMCgS97.png'),(3,'Table',NULL,2,'2019-02-09 11:11:06','2019-02-09 11:11:06',NULL),(4,'Chair',NULL,2,'2019-02-09 11:11:20','2019-02-09 11:11:20',NULL),(5,'Tap',NULL,1,'2019-02-09 11:11:30','2019-02-09 11:11:30',NULL),(8,'Beauty','http://opuslabs.in:9085/storage/uploads/I3p3BdBLyVFnwmx3umX9DSuxBeQjItd9buM7zMqf.png',NULL,'2019-02-09 11:47:08','2019-02-14 08:48:05','http://opuslabs.in:9085/storage/uploads/uVVhrpXKibDcw3pRgD8IASgN3sM8rVZSxAkPx1qX.png'),(10,'Homecare','http://opuslabs.in:9085/storage/uploads/rOLMre4g5xs8Fl5a6iGjVLsKDPiUh4b2KJau1H3c.png',NULL,'2019-02-09 11:55:26','2019-02-14 08:47:16','http://opuslabs.in:9085/storage/uploads/TFt4tnpDlwqorHuSDqM6KIgwQk50xMT2xXMbuJ27.png'),(11,'Healthcare','http://opuslabs.in:9085/storage/uploads/zh3YUmV4ga64ne88etkIgPUKgIH3JDdwqJ9jWNQr.png',NULL,'2019-02-09 11:55:44','2019-02-14 08:47:38','http://opuslabs.in:9085/storage/uploads/WAOOMRTKU2XaiFchJxZgc5KUZBIz9syhcCBOWsgZ.png'),(12,'Electric','http://opuslabs.in:9085/storage/uploads/S0ekNXOUlW0KiUvnE5GU47FRglmRVi5MGVhOmvgp.png',NULL,'2019-02-09 11:55:59','2019-02-14 08:47:51','http://opuslabs.in:9085/storage/uploads/20hNDwCKRcRJNwKWPOeFYrGaaYPPJAXoCgLmAUsR.png'),(16,'Pest Control','http://opuslabs.in:9085/storage/uploads/IrytM1iuWFnQbI82XpDbAh0m8h5tMsDd4NEd8Bwg.png',NULL,'2019-02-14 08:40:30','2019-02-14 08:47:06','http://opuslabs.in:9085/storage/uploads/Isimcj9YQFIQ3UM5AFT3OAhatTZHTDHcDEGbIaLt.png'),(17,'Vehicles','http://opuslabs.in:9085/storage/uploads/bUCaP6v6QWxvz2ffNVERySbsXbiAaPJQsUTCilKh.png',NULL,'2019-02-14 08:46:20','2019-02-14 08:46:49','http://opuslabs.in:9085/storage/uploads/TMnCpvv0cX62C3IBoTrR7dt3siebogxuWAUhcWFb.png'),(18,'Hair Care',NULL,8,'2019-02-14 08:48:46','2019-02-14 08:48:46',NULL),(19,'Hair Cut',NULL,8,'2019-02-14 08:49:04','2019-02-14 08:49:04',NULL),(20,'Massage',NULL,8,'2019-02-14 08:49:19','2019-02-14 08:49:19',NULL),(21,'Bridal Makeup',NULL,8,'2019-02-14 08:49:32','2019-02-14 08:49:32',NULL),(22,'Leakage',NULL,1,'2019-02-14 08:50:06','2019-02-14 08:51:49',NULL),(23,'Water Blockage',NULL,12,'2019-02-14 08:50:27','2019-02-18 17:38:45',NULL),(24,'Flush Tank Leak',NULL,1,'2019-02-14 08:51:11','2019-02-14 08:51:11',NULL),(25,'teste','http://opuslabs.in:9085/storage/uploads/AEgabTjZ76AZpycUYp1GCPYbBvUYOSAoLpOPqU9n.jpeg',NULL,'2019-02-18 16:59:54','2019-02-18 16:59:54',NULL),(26,'new categeory test','http://opuslabs.in:9085/storage/uploads/1chQrnmmjdFy2YWM1OJp2CL4DB1GaN1O9IJJkSbS.png',12,'2019-02-19 22:02:26','2019-02-19 22:02:26','http://opuslabs.in:9085/storage/uploads/oBGqjMH8hRzb7XJ75m5jrbcGdzppiBUPBGQCjLH3.jpeg'),(27,'Engines','http://opuslabs.in:9085/storage/uploads/IOJALIrdTxoJxTMbaTshiSHfqcgLcGSeu7FbzKsk.png',17,'2019-02-27 09:58:37','2019-02-27 09:58:37','http://opuslabs.in:9085/storage/uploads/nFUvCGbNqLGO4JBwpzYCx6iYxxTVtzE4Rl6Aef4N.png'),(28,'Designing','http://opuslabs.in:9085/storage/uploads/gGNLG2Dyz6vxg0XnGfSumUbZQH2tTelKPBz76ans.png',NULL,'2019-02-27 10:08:28','2019-02-27 10:08:28','http://opuslabs.in:9085/storage/uploads/Rsqmn603AW9pzsnnyRyq2cpNNN9qmveOTfjErbLK.png');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (24,'2016_06_01_000001_create_oauth_auth_codes_table',1),(25,'2016_06_01_000002_create_oauth_access_tokens_table',1),(26,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(27,'2016_06_01_000004_create_oauth_clients_table',1),(28,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(29,'2017_04_10_000000_create_users_table',1),(30,'2017_04_10_000001_create_password_resets_table',1),(31,'2017_04_10_000002_create_social_accounts_table',1),(32,'2017_04_10_000003_create_roles_table',1),(33,'2017_04_10_000004_create_users_roles_table',1),(34,'2017_05_03_204317_create_plans_table',1),(35,'2017_05_03_204335_create_plan_features_table',1),(36,'2017_05_03_204353_create_plan_subscriptions_table',1),(37,'2017_05_03_204408_create_plan_subscription_usage_table',1),(38,'2018_02_22_110052_create_categories_table',1),(39,'2018_02_23_110052_create_provider_profiles_table',1),(40,'2018_02_26_000004_create_providers_categories_table',1),(41,'2018_02_27_120748_create_addresses_table',1),(42,'2018_02_28_123956_create_supports_table',1),(43,'2018_03_01_114833_create_ratings_table',1),(44,'2018_03_02_183956_create_settings_table',1),(45,'2018_03_05_110052_create_appointments_table',1),(46,'2018_03_06_110052_create_appointment_status_logs_table',1),(47,'2018_03_07_110052_alter_appointments_table',1),(48,'2018_03_07_110053_alter_appointments_add_notes_table',2),(49,'2018_03_07_110052_alter_addresses_table',3),(50,'2018_06_07_123211_plans',4),(51,'2019_06_07_123211_plans_metadata',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `oauth_access_tokens` VALUES ('0090ca64ad1699923d3109245ba628e967334a1c54908670a5c02f0c0975a26805070a5d973b2ea6',50,1,'Default','[]',0,'2019-02-25 10:01:10','2019-02-25 10:01:10','2020-02-25 10:01:10'),('01a1b6afe8eda7d2295962ecc54ffda1d500d42ddbb40cda4626dd5a3123a173c18deb755cd581fb',1,1,'Default','[]',0,'2019-02-14 08:39:55','2019-02-14 08:39:55','2020-02-14 08:39:55'),('03ab53526c6b5a5f1d7bd6671f5eab0f4fae8792612eccdc9a1bd21f1d2c1239bdbfbde9c364f48f',4,1,'Default','[]',0,'2019-02-28 11:50:18','2019-02-28 11:50:18','2020-02-28 11:50:18'),('04146d9099d20805c0db95d8ee8f6eb132bd66774c79d524e61cd7ee64e60a5db8e700c2bb618984',8,1,'Default','[]',0,'2019-02-11 12:20:46','2019-02-11 12:20:46','2020-02-11 12:20:46'),('0427e043a0738560b58f6d2a2a903489701d2271aa5549332a586e722e45f9df9e25eccdc2b0e473',1,1,'Default','[]',0,'2019-02-27 09:32:51','2019-02-27 09:32:51','2020-02-27 09:32:51'),('0452102e4b9a105a34ded48bd2763fe6ac886add98753c2cf48a29a95e9509a90629d7561b0cecdc',40,1,'Default','[]',0,'2019-02-27 09:39:13','2019-02-27 09:39:13','2020-02-27 09:39:13'),('061ed327a51c5d8127d5dcdaf68f402a75090d60c1b1475a588a4655c6a38d370e2867e7076d433d',60,1,'Default','[]',0,'2019-03-11 10:21:56','2019-03-11 10:21:56','2020-03-11 10:21:56'),('066bb908e3f59d7f02fdc2f54bc7da058840775834c8224e26ac966185619b9c79f1ca940d27eddf',1,1,'Default','[]',0,'2019-03-02 19:32:37','2019-03-02 19:32:37','2020-03-02 19:32:37'),('07710b48ef1a0ce9acb4dff9ce9a71047298938bac89b29f7ab2dea68fbb519d0207eb63d0fb7b1c',22,1,'Default','[]',0,'2019-02-16 11:02:21','2019-02-16 11:02:21','2020-02-16 11:02:21'),('083f17a3fc4e8f58cd542d507f12bcea5a88401226856a7b633153081d5b84838298f68cd64197e7',3,1,'Default','[]',0,'2019-02-15 16:14:18','2019-02-15 16:14:18','2020-02-15 16:14:18'),('088e7b0bd8d8ee203ca336d5deabaeb7d5ae1f9b41aa8ed2aeeffe47177147c498febf08a4ccefb5',24,1,'Default','[]',0,'2019-02-16 11:28:35','2019-02-16 11:28:35','2020-02-16 11:28:35'),('0941cf69d9a2713319233cdd37549d0a9f651d1a44c2f7d23b1a0165b153eb9201efffbc6808579b',28,1,'Default','[]',0,'2019-02-18 08:46:55','2019-02-18 08:46:55','2020-02-18 08:46:55'),('09b0d30cdf9be56182f609027bb87b56f2a185c9b221b30ba17e66ee6e71fda083ec1f12e98f5be9',32,1,'Default','[]',0,'2019-03-05 10:14:12','2019-03-05 10:14:12','2020-03-05 10:14:12'),('0aefc846a9e120600a1244d34a649fe3b5b6c33f877b646816a5a5d4b80d9e922d5e6fd96b0005c9',4,1,'Default','[]',0,'2019-02-22 14:35:21','2019-02-22 14:35:21','2020-02-22 14:35:21'),('0bbac7cd95e396d37b23decdaadaeda0632ee384f6f2fae73421d778d80e395c62ab1cc4a7ea2fd6',31,1,'Default','[]',0,'2019-02-18 09:25:05','2019-02-18 09:25:05','2020-02-18 09:25:05'),('0c5c00dcc63ff6a7dd4c3788d164e630744cd0c3b283221e31fc3d191ae1c45599530703309889f9',13,1,'Default','[]',0,'2019-02-12 13:56:57','2019-02-12 13:56:57','2020-02-12 13:56:57'),('0ca61176b1267e7f3b580f327d24266d6939418b4866749e4c033b5bfa6dc4ec796f3c5e3924b5dd',1,1,'Default','[]',0,'2019-03-11 11:56:46','2019-03-11 11:56:46','2020-03-11 11:56:46'),('0cc5b5bea97fca844e960519165f27edb38fa5e1628e53756add1dac4d53f37081a765ebed0e9089',4,1,'Default','[]',0,'2019-02-09 17:21:14','2019-02-09 17:21:14','2020-02-09 17:21:14'),('0e090e46492d013e1799af09a348da0193a4710982a164eeb568cb8519851bdb2b333f087a5bde31',32,1,'Default','[]',0,'2019-02-18 09:26:30','2019-02-18 09:26:30','2020-02-18 09:26:30'),('0ec6d1d5cff6caf691966608c28276a06f08dba9648d0348e1f61332abb857b2f082d909a6091fc1',7,1,'Default','[]',0,'2019-02-19 09:29:29','2019-02-19 09:29:29','2020-02-19 09:29:29'),('0f038e8303fa97e2863d8c697197749d67b64ad306872ee909a01afdc7384376987d9088f6d32905',4,1,'Default','[]',0,'2019-02-25 11:23:20','2019-02-25 11:23:20','2020-02-25 11:23:20'),('0f74dcee0b0d5efb5d0413853fa0f92f452d45fcd053f0a78e959a6c04fe295cf0b4c7fdf8d77f11',5,1,'Default','[]',0,'2019-03-11 10:24:00','2019-03-11 10:24:00','2020-03-11 10:24:00'),('10a6b028eeee3c92f065726a11aa5856b3ad04686547fd3958ab743759b474d20b457cbf813ad73c',3,1,'Default','[]',0,'2019-02-14 08:31:00','2019-02-14 08:31:00','2020-02-14 08:31:00'),('1233f1979ff82ef4f0fb27d9a8cb32d3e19d929255f71df1539713cfca77e97e509a14406f2aedad',6,1,'Default','[]',0,'2019-02-09 17:48:35','2019-02-09 17:48:35','2020-02-09 17:48:35'),('12ea01a30f2df24b7a25a7d91d3cee4b0dd2e31cef82110a25a7e502fa87e3bf77b69d8612e4fc15',2,1,'Default','[]',0,'2019-02-25 10:35:12','2019-02-25 10:35:12','2020-02-25 10:35:12'),('151abbd9c7a3128a7edbc6263e48e590717f8d85eb5f5db3d949552c141796d0938c9fea65f6d03c',46,1,'Default','[]',0,'2019-02-21 14:06:45','2019-02-21 14:06:45','2020-02-21 14:06:45'),('1574a7dc03bdfc111a25c2a8294d607abab74a6e84e5f9502221cf913960e3ab21b54056aef8226f',7,1,'Default','[]',0,'2019-02-15 06:53:12','2019-02-15 06:53:12','2020-02-15 06:53:12'),('159175c3f44c1479fdb792da57bbd277e4749acb22ff7f820dc0e496b34989e4139b3a2a93891192',21,1,'Default','[]',0,'2019-02-16 11:41:53','2019-02-16 11:41:53','2020-02-16 11:41:53'),('186955f01317f6157c391335187792f30a6ab8550f8f94f93042e4a8d7e54e3d60e235f32a879480',62,1,'Default','[]',0,'2019-03-11 11:02:25','2019-03-11 11:02:25','2020-03-11 11:02:25'),('18f77aa2951522a216645cf08d2fc5ce781af37571c04e00c95ea7787b7461806c27383c1f692fb0',59,1,'Default','[]',0,'2019-03-08 01:55:11','2019-03-08 01:55:11','2020-03-08 01:55:11'),('1b2277e04cd35b2b72209118605ad1963a209d43fc3b4831f84d45b090fa935f47b375acdf2f5b42',23,1,'Default','[]',0,'2019-02-16 11:15:53','2019-02-16 11:15:53','2020-02-16 11:15:53'),('1c232b3c58c38c3bd5c4d25db9e17aec0de38af2a6e10e99875589ffb963d2c48ba75d310600527b',2,1,'Default','[]',0,'2019-02-19 17:50:37','2019-02-19 17:50:37','2020-02-19 17:50:37'),('1d7301b9fca2bbcca035f8b35c1d5f1ae6b53385c44a30f895b340cb9e91158b6bdaea5cae368392',30,1,'Default','[]',0,'2019-02-18 09:22:24','2019-02-18 09:22:24','2020-02-18 09:22:24'),('1e6027cc5aa0bf698fc73314af373c09d861f840136d34d1be97a4eb5236be062fc0e4c3dd3e6f08',26,1,'Default','[]',0,'2019-02-17 08:36:16','2019-02-17 08:36:16','2020-02-17 08:36:16'),('1fdd11982f5a4328ef3aaf032e69c1fb63750872d27ea226deca28b3505e80c845f0dff0b03c50d4',5,1,'Default','[]',0,'2019-03-05 17:00:49','2019-03-05 17:00:49','2020-03-05 17:00:49'),('1ff84f52285a620b2cb9a79679fc29f024a6369b43edb61848b81abfb6c58ea488f2b46b1667a1ef',3,1,'Default','[]',0,'2019-02-09 11:32:26','2019-02-09 11:32:26','2020-02-09 11:32:26'),('20bd62c88d488556f4140c6bb9cd712cdcb06428f0babdd2ea25b70918d8e32e372804af7fa7ebab',27,1,'Default','[]',0,'2019-03-11 09:01:32','2019-03-11 09:01:32','2020-03-11 09:01:32'),('212ba3b9c1ba3f7498d28f2e6f54346554003d14644343e881eb5500f1b309bbbdd9d71014fbe239',7,1,'Default','[]',0,'2019-02-14 20:42:44','2019-02-14 20:42:44','2020-02-14 20:42:44'),('22cccec14f4681cd45beea031831300059ab403292b5fa302387f04bcaf11dcd4dfe3f6f38423688',1,1,'Default','[]',0,'2019-02-17 09:22:58','2019-02-17 09:22:58','2020-02-17 09:22:58'),('252e7ec40f60f1f4ea7603adf9b4ec4ce4c9a522c86213c31f07cf38332f1b8dfcf1f9745b16fc81',51,1,'Default','[]',0,'2019-03-02 19:36:12','2019-03-02 19:36:12','2020-03-02 19:36:12'),('255afd51e60606e1ab1fab262f82287043783bf032738eafbbeff92d7d05810dbb1e9e30cce21e3b',1,1,'Default','[]',0,'2019-02-18 16:10:12','2019-02-18 16:10:12','2020-02-18 16:10:12'),('25af314377606f02a4f4e799e0acba6ca3091f50d602bd902af7f7a8cac07c45908a05b7231524d9',5,1,'Default','[]',0,'2019-02-22 14:09:56','2019-02-22 14:09:56','2020-02-22 14:09:56'),('275ba20adf1441571b90c093c548eda26202cd64e56da2e842f681e08f8bc4cc06e8518d4772f21a',7,1,'Default','[]',0,'2019-02-10 00:41:42','2019-02-10 00:41:42','2020-02-10 00:41:42'),('2768097b8b75bc1bb91bf7835ce58616770381ba872d55d37f35930494def5f7209d917cd61e8799',48,1,'Default','[]',0,'2019-02-24 11:31:52','2019-02-24 11:31:52','2020-02-24 11:31:52'),('27881b42fa3e95b56a09703ce4e2f4761373d430f30b2c66a4175e7ba3fe10b9522012b4d2fe72a8',35,1,'Default','[]',0,'2019-02-18 11:21:27','2019-02-18 11:21:27','2020-02-18 11:21:27'),('27c8681d1dcc1071df7721fe41ce41e72bec7cd70698917afdb22f1e2762c18b027beebc264659ab',1,1,'Default','[]',0,'2019-02-16 08:41:51','2019-02-16 08:41:51','2020-02-16 08:41:51'),('28922d8f42f2ec587e0729db8d992a4b6ed70f768dbe7063816b275af269a9a6e3c34780c2117c89',7,1,'Default','[]',0,'2019-02-19 09:05:37','2019-02-19 09:05:37','2020-02-19 09:05:37'),('2bf70caaeb99129167a1ae572477b951c5e5a232a6b11b1fcaefdf152348c5deb24c236b137bf8dd',1,1,'Default','[]',0,'2019-02-16 07:17:21','2019-02-16 07:17:21','2020-02-16 07:17:21'),('2c3c3a058a56ed4d2ff8feb99d5cce796d8c0026c7039a85249338f3a0fd5cf6919a5b7e6ffc03da',38,1,'Default','[]',0,'2019-02-18 16:51:19','2019-02-18 16:51:19','2020-02-18 16:51:19'),('2d30024426f7d406aaf73092af54d7df2bd44de828fbd9791f4ac69f56ee39885fbf77b9621375ab',2,1,'Default','[]',0,'2019-02-14 08:31:12','2019-02-14 08:31:12','2020-02-14 08:31:12'),('2d50b6a2f0ecbb6438b009f27de929c60011ae5857f11b7898185d10d03b74f4e98e529c5432001b',6,1,'Default','[]',0,'2019-02-22 12:26:38','2019-02-22 12:26:38','2020-02-22 12:26:38'),('2dd26dbfe344b53c5aed3745545acf6fd1443fa76de269534e33205e5c268421e5dadb6301cf026a',42,1,'Default','[]',0,'2019-02-19 11:26:28','2019-02-19 11:26:28','2020-02-19 11:26:28'),('2de94b4f83754da1a230d60da67fe00f270398d7336960b53af9bcd2d11a7da306216689a92ad8d8',2,1,'Default','[]',0,'2019-02-28 12:27:39','2019-02-28 12:27:39','2020-02-28 12:27:39'),('2edba5a5546c99241ff2668a72ce487e4ac7070b01c34cde0a12d26e173fdba45dfc189444abd63b',1,1,'Default','[]',0,'2019-02-17 09:28:40','2019-02-17 09:28:40','2020-02-17 09:28:40'),('2fd5b1fdd38cf87080b533d64e23baa9ed42e4aa94d130058aee51420f22e4fa0706f62d78a5bf02',48,1,'Default','[]',0,'2019-02-24 11:32:13','2019-02-24 11:32:13','2020-02-24 11:32:13'),('3005322aaf108599c64875b220364b0565f6e2c56ccffd7d9d68b3206d00b9f4e95352a0a8fd2d12',3,1,'Default','[]',0,'2019-02-09 18:39:55','2019-02-09 18:39:55','2020-02-09 18:39:55'),('30bdcc77715ef6e8e89256488ed0896101d0065d303a3101b37170d3565d989807ecc622a86c35a1',3,1,'Default','[]',0,'2019-02-09 18:13:24','2019-02-09 18:13:24','2020-02-09 18:13:24'),('34eb12a1a0ea20907750f128ed20307648de5eaf6b9315e9b192bffb068c02b2b4aca4b7b9f93252',3,1,'Default','[]',0,'2019-02-13 07:10:37','2019-02-13 07:10:37','2020-02-13 07:10:37'),('37311e866bf82f9a06a125bc3c20c13b20c5fea6b0812a23a9d90dc93d8ef307044a36a94020a379',33,1,'Default','[]',0,'2019-02-18 09:55:15','2019-02-18 09:55:15','2020-02-18 09:55:15'),('37c7ced26135e48e658dc81e0f50ba03acfce9a434650738bae1945a87aa84293018122d869e9087',4,1,'Default','[]',0,'2019-02-22 12:22:26','2019-02-22 12:22:26','2020-02-22 12:22:26'),('37e6ce731cad4723b7882e55c5e3163d529e898ea0092cea634ab00aa77c3f52f72274722cc17ada',4,1,'Default','[]',0,'2019-02-22 08:59:50','2019-02-22 08:59:50','2020-02-22 08:59:50'),('38615a608d821a13b74e7d0837ffb45edaf5e529c413ca17ff6d3a016e4ae24aa3f6cca71d2876d9',21,1,'Default','[]',0,'2019-02-16 09:47:35','2019-02-16 09:47:35','2020-02-16 09:47:35'),('389c8681668462f59aea330b5ebc9dfe4caf5ac73e9895bd2e593f1ff6a250c6a31560d490b527ae',3,1,'Default','[]',0,'2019-02-14 10:20:09','2019-02-14 10:20:09','2020-02-14 10:20:09'),('38a5ead8801598550ba029b51ba8705902610f549ba060515d10edbde194256052d1dbe1f32ac1cf',1,1,'Default','[]',0,'2019-02-18 09:23:23','2019-02-18 09:23:23','2020-02-18 09:23:23'),('39424718b63b7fcdec2488bb90ab97f7385733931ca3cb00ae1141c704243d8e02e4c6619bd5ac06',51,1,'Default','[]',0,'2019-02-27 09:42:16','2019-02-27 09:42:16','2020-02-27 09:42:16'),('396bdf20db9ea472c3f4276f76033e6116193f3c3cdb71d1f0a51f64db0d20b84ca31a954f77af3b',4,1,'Default','[]',0,'2019-02-27 12:44:39','2019-02-27 12:44:39','2020-02-27 12:44:39'),('39d8547be3cf351a2a9acd6e14ab685a64f8b90905c3401ecb0d08539921e4570d1c068d06fb634a',8,1,'Default','[]',0,'2019-02-11 09:50:48','2019-02-11 09:50:48','2020-02-11 09:50:48'),('3adfb99dafe82721bc6c7922d6bdce30d5ea7939a0f9af82cf42e918ae5feabc069faf0a6bab1850',21,1,'Default','[]',0,'2019-02-16 10:29:45','2019-02-16 10:29:45','2020-02-16 10:29:45'),('3b45188ef8eef454440d3d7cf62aab7a6d9e71803c8ebc4ce089f0e0080cebec3b0177fb3e501773',5,1,'Default','[]',0,'2019-02-18 11:56:59','2019-02-18 11:56:59','2020-02-18 11:56:59'),('3be94aa621cf19c5822d29d1bc558c0e293632e512148d10f82e8c47124d5d456c0d00d953cc4ad3',15,1,'Default','[]',0,'2019-02-13 12:46:06','2019-02-13 12:46:06','2020-02-13 12:46:06'),('3cb94d54d70d0a43f7b3986cf9301b2b3f4641894780dc4b1857d241207b6e653978de348f7d5ef3',34,1,'Default','[]',0,'2019-02-18 10:09:19','2019-02-18 10:09:19','2020-02-18 10:09:19'),('3dadeb9b1d8e7744a368649acfd9dbf7de868fcaad870ef371352845ed6c63b570bd8650a8373b44',42,1,'Default','[]',0,'2019-03-11 11:17:04','2019-03-11 11:17:04','2020-03-11 11:17:04'),('3e2663a678800ed3a060b82757acd0c6038f013e3b4ca5ed6925a75f993a53e6ddfded2a23768d33',15,1,'Default','[]',0,'2019-02-13 12:55:53','2019-02-13 12:55:53','2020-02-13 12:55:53'),('3e91470babf4d67e0ccf795c694895bc261f694b5f1fa1656b051b328ea2544429fdcf2f4f9221cc',1,1,'Default','[]',0,'2019-03-03 17:14:37','2019-03-03 17:14:37','2020-03-03 17:14:37'),('3ee56b90cb62c4cdc99dc930fb4eba9a452ac53236b1c1791d4340cceee8aa3cf2a3d704db1db5b7',2,1,'Default','[]',0,'2019-02-16 13:18:21','2019-02-16 13:18:21','2020-02-16 13:18:21'),('3efce0b6f86de5b04b1d15ba8aff161f5b8d0801285c2b6dc7039adc6e4e6d7bc326e123f5fd656b',39,1,'Default','[]',0,'2019-02-19 09:45:50','2019-02-19 09:45:50','2020-02-19 09:45:50'),('3f1dfe5cbfe31d565a0e6a70cc58fe9d9525164a5470f6e1791635421a8f954608b7e53994c0f257',3,1,'Default','[]',0,'2019-02-09 18:48:07','2019-02-09 18:48:07','2020-02-09 18:48:07'),('40419401ca8665f00942b21f05cdb828962eaaecf5458c68c7238645c8ed1ce70f5e1f751a5c4638',1,1,'Default','[]',0,'2019-03-10 07:57:34','2019-03-10 07:57:34','2020-03-10 07:57:34'),('418f93d79d26fe7152df85336615b864ed17d1a8f078fc2a33ee933eb3ebf00d2eaeb1303f926408',1,1,'Default','[]',0,'2019-02-25 09:29:48','2019-02-25 09:29:48','2020-02-25 09:29:48'),('42132b8d920a616669a9381e07c61735024a668be324399b9f5516d75c147156e71ff33e304b571d',1,1,'Default','[]',0,'2019-03-03 12:08:26','2019-03-03 12:08:26','2020-03-03 12:08:26'),('425b4e291a05a5598500b60107632158adb0ff33255fd1e4c8e4d0827ebae647ce5febad77bc3eb8',21,1,'Default','[]',0,'2019-02-21 03:38:01','2019-02-21 03:38:01','2020-02-21 03:38:01'),('44342efef80feabac976a394f21d6e9902eb89bceee10efaf6bbbfb0ded7d22aff2f5e1924b2e48d',1,1,'Default','[]',0,'2019-02-14 09:10:05','2019-02-14 09:10:05','2020-02-14 09:10:05'),('44ab6685704c29c6b844796f3e86c70c78e26eca4210f16dfd4b31726d7b216b2f1b55b9cdafe117',1,1,'Default','[]',0,'2019-02-19 07:06:47','2019-02-19 07:06:47','2020-02-19 07:06:47'),('458ced98744cd243a3f6b1af81c965f18407d1fafc68cf8b86df806d0ccd5ce982ae7fd270ae9ea0',1,1,'Default','[]',0,'2019-02-18 11:08:00','2019-02-18 11:08:00','2020-02-18 11:08:00'),('45ef1a70f40d8784ce5d53bf6d23c75b207d1185f72b96ef121554bc8731b635666aace5d1bdb355',56,1,'Default','[]',0,'2019-03-06 08:12:38','2019-03-06 08:12:38','2020-03-06 08:12:38'),('47bab5ce052ffa59d623ead6a52ab7a7219bbd12216834543eddd4814e84949b64150b4fcdae7eb1',2,1,'Default','[]',0,'2019-02-15 16:14:46','2019-02-15 16:14:46','2020-02-15 16:14:46'),('489693e9a70c514bb2167adde339b54196bdf176d0f4ee3129163f3e185c86d79449ebfee5bc0c30',1,1,'Default','[]',0,'2019-02-11 09:55:40','2019-02-11 09:55:40','2020-02-11 09:55:40'),('48f4f6e83d8e4bb30f19ef078eb6a63fe9a082da44ecb87cadc78049ab9a70c7cef4381c38d30759',28,1,'Default','[]',0,'2019-02-18 08:47:22','2019-02-18 08:47:22','2020-02-18 08:47:22'),('49127c9a028cae01e561f0b823e6105b9f98e3aa87a42d60eead10c579a3d6fc1adcb540930fbba4',32,1,'Default','[]',0,'2019-03-11 09:00:45','2019-03-11 09:00:45','2020-03-11 09:00:45'),('4a15061bb8ddac36ca3f53853751091086b4529678ccd3a7391c38ce95ff8650a0f283123e4f1c2e',39,1,'Default','[]',0,'2019-02-19 09:43:05','2019-02-19 09:43:05','2020-02-19 09:43:05'),('4bba109a02d72cc1bf87ba203bbae8ff876ca979b5147d1a2b2cf423e11f9a78815af5eebd5bebfa',59,1,'Default','[]',0,'2019-03-08 01:54:20','2019-03-08 01:54:20','2020-03-08 01:54:20'),('4c16a29d9d34f9fcd5f78ad78e3e1bc468258be5817b3f0abc4e57159c0a45efa7d6a8409527bae2',27,1,'Default','[]',0,'2019-02-18 08:46:37','2019-02-18 08:46:37','2020-02-18 08:46:37'),('4c5621e3341ad2affb7755c6acb9305cb1a205d05e9ee634bc3d305b3e3a141b69d3cf2efaa31563',8,1,'Default','[]',0,'2019-02-11 12:24:07','2019-02-11 12:24:07','2020-02-11 12:24:07'),('4cfba6075fbdb94e31f390246bfc29b1979e31a83fda0f338152d6601daef6b84273dc659e662684',2,1,'Default','[]',0,'2019-02-12 14:08:14','2019-02-12 14:08:14','2020-02-12 14:08:14'),('4e2d7dd367766322a1c4eb7d778d74d342cd4928655effe8fd28068b5f9dc52103e01eba224179d5',2,1,'Default','[]',0,'2019-02-12 14:10:05','2019-02-12 14:10:05','2020-02-12 14:10:05'),('4f2cf89e858cf6761aea652a8b8d776b5c4f701838e4ef8612b69e728d4395a392f2022ff009b179',43,1,'Default','[]',0,'2019-02-19 16:58:44','2019-02-19 16:58:44','2020-02-19 16:58:44'),('50243ae3ea09aabc320f59f2e692803bac65feffeb53ff5a9af6e988de79f33243c8b14db92cc58b',21,1,'Default','[]',0,'2019-02-16 09:39:22','2019-02-16 09:39:22','2020-02-16 09:39:22'),('5178ce3280545d9a1b28f4e7602621f1f03d594a448824cfc1137dbe4aaeb73f8820072b39fda67b',10,1,'Default','[]',0,'2019-02-11 10:20:29','2019-02-11 10:20:29','2020-02-11 10:20:29'),('524230926041fb08292252a633c53ad3640f092043944ac87f9b8c9718fd1ce4dd3c81b81db77c6e',2,1,'Default','[]',0,'2019-03-05 16:59:13','2019-03-05 16:59:13','2020-03-05 16:59:13'),('52d736df0b8e269d90d405dc088b71e9bf8a6c1b935a04a185c84e5368a0c18de3c75a83de591e08',1,1,'Default','[]',0,'2019-02-09 17:05:04','2019-02-09 17:05:04','2020-02-09 17:05:04'),('53864b12b2923d0ea13d2883d62ee13ebf6a06ac252a8d54b19751bc79aa96a94e5574d4f2f3a231',3,1,'Default','[]',0,'2019-02-14 08:25:09','2019-02-14 08:25:09','2020-02-14 08:25:09'),('53e4863cd656183c8d71b68c358118e4e463d8dfead22f2f45f452732eddc26142397e26dded7d98',5,1,'Default','[]',0,'2019-02-18 11:30:29','2019-02-18 11:30:29','2020-02-18 11:30:29'),('55e125f29fd48925842c9d120c5e2f9af6808bd575b37f20924b71109885321d847acd1c1fb554ed',8,1,'Default','[]',0,'2019-02-17 08:43:46','2019-02-17 08:43:46','2020-02-17 08:43:46'),('56ba4efe9e737f9b182326335ae8da95de57ee5b6513d7a68f94f370d034842a6d3a6508dbb52bc1',45,1,'Default','[]',0,'2019-02-21 13:41:32','2019-02-21 13:41:32','2020-02-21 13:41:32'),('58c204c7b1a860af32b9268bf6a2008f46beefe0bc321aa72c222de949dad4408866d4966b28adce',50,1,'Default','[]',0,'2019-02-25 10:01:35','2019-02-25 10:01:35','2020-02-25 10:01:35'),('59149a5fc5c8f29be44074f4f1c29ca41531f6ffe3afb057e6f2bf092f5c519d49fb13d1d34a301a',5,1,'Default','[]',0,'2019-03-04 15:02:21','2019-03-04 15:02:21','2020-03-04 15:02:21'),('595ce0e078234d9cb4f21f46979b772ca8f8ba90bfe004249966b88e002ad7b5e1a67da4980980d7',47,1,'Default','[]',0,'2019-02-22 06:41:27','2019-02-22 06:41:27','2020-02-22 06:41:27'),('5a19c322eaa7fcb6366e4580297cf6b58ab488b05c40ff7d477d2cd754ff3c57f58531964f5b5d3c',1,1,'Default','[]',0,'2019-02-22 04:49:18','2019-02-22 04:49:18','2020-02-22 04:49:18'),('5a294f4d3ec44ceb9388d7b85a54e57ff1f10d0607e390273be4cf2d94b73f4d43aa15aa7207283a',10,1,'Default','[]',0,'2019-02-11 10:21:57','2019-02-11 10:21:57','2020-02-11 10:21:57'),('5a2dbc93d9a9933bb5b75915764fc103021f17b318be491041cbe4b122a8a63f0e571cd38160864e',1,1,'Default','[]',0,'2019-02-09 22:43:37','2019-02-09 22:43:37','2020-02-09 22:43:37'),('5b1fb01b604e40f9fc753e759d518c353d26f2d7149b4119129d927f7df75f66c49cc0499fe3c51b',5,1,'Default','[]',0,'2019-03-11 10:22:02','2019-03-11 10:22:02','2020-03-11 10:22:02'),('5b5b4659fa7f1cc08870af0b2e06a56b2be3a2acfc15ec832939bf960eafa67b64166d0ed23d6963',1,1,'Default','[]',0,'2019-02-09 20:43:00','2019-02-09 20:43:00','2020-02-09 20:43:00'),('5be9645a3e759583521d8b828b44618e6cb0fc61138670c2bba3c8942328c08648e66ea367b77b50',5,1,'Default','[]',0,'2019-02-21 04:14:17','2019-02-21 04:14:17','2020-02-21 04:14:17'),('5e14b2287554941a2c34d3982715920db2093ae5efe8388e23169eda66108db4ce92f1d2e823e6eb',3,1,'Default','[]',0,'2019-02-09 11:19:23','2019-02-09 11:19:23','2020-02-09 11:19:23'),('5f54d58bea81b080e1f1ddde48ae4419fb6f492776d37ae4509772ef88ac63399d112f1b302d81a9',3,1,'Default','[]',0,'2019-02-09 22:06:01','2019-02-09 22:06:01','2020-02-09 22:06:01'),('5fe7c831055e3cd464ef1f118deecd964441ef2bfc7038aa56afb58554e4a7b9008b21a106440432',12,1,'Default','[]',0,'2019-02-12 05:52:06','2019-02-12 05:52:06','2020-02-12 05:52:06'),('61689b4a862a36614dd84e297832cbf489c42f61c2ca943b0c37287dfe64d00b0f0a4b3cf6612db9',52,1,'Default','[]',0,'2019-02-27 09:48:05','2019-02-27 09:48:05','2020-02-27 09:48:05'),('6379ceb717448be51257e12238ea3ff34e3457c26368e025bb8454ed7845b0ca73e71729f40d4644',55,1,'Default','[]',0,'2019-03-04 17:24:16','2019-03-04 17:24:16','2020-03-04 17:24:16'),('639ee12e06688763f60b43b77a57e4fb2fb43bc1fc564a929830f379086bc9d505401f5183219e31',5,1,'Default','[]',0,'2019-02-22 07:41:07','2019-02-22 07:41:07','2020-02-22 07:41:07'),('63aad2f922a180fdd7ab2597953317a0f3bd2fccc8adbb6b06c006f5f58c23a09cd67cf3452f3e2a',2,1,'Default','[]',0,'2019-02-16 17:26:50','2019-02-16 17:26:50','2020-02-16 17:26:50'),('64156be00432852656678caf3d671bda592f6b744c0c452a4084297e04ee8833c5e3ec822bd50ef5',4,1,'Default','[]',0,'2019-02-22 14:49:23','2019-02-22 14:49:23','2020-02-22 14:49:23'),('64b8a032912a68e6174cc18ef6960d5e31f9cbc188838ffc3950e96dfe11dbc1f2e3035234436264',2,1,'Default','[]',0,'2019-02-22 14:11:22','2019-02-22 14:11:22','2020-02-22 14:11:22'),('65610c942f20352eec5328e000a5581628966a24cf07a1c0c9eddcb3c8590fb0c743aceaa550d0ea',1,1,'Default','[]',0,'2019-02-09 11:06:38','2019-02-09 11:06:38','2020-02-09 11:06:38'),('65aa878000e761c438fa29dc90f2e827e996a7396d00f1e3a78f8888032a8167f1385ab4ccc2d97f',32,1,'Default','[]',0,'2019-03-05 10:13:55','2019-03-05 10:13:55','2020-03-05 10:13:55'),('6681eb7b7e53ecd08f1dda8a680da4e5ec2d43090891fea6e08944fc50659c799299c2b591705fdc',1,1,'Default','[]',0,'2019-03-03 17:39:08','2019-03-03 17:39:08','2020-03-03 17:39:08'),('669dded9abf1d49c5a358143c7c911898afa465322efdabd98fb22ab1118c2373ff5df73b54a7e6b',10,1,'Default','[]',0,'2019-03-05 16:39:43','2019-03-05 16:39:43','2020-03-05 16:39:43'),('66cb96193837fbc37a55fc0653cbe3163ba0ddf1129262fe4993232c95f8efd57adef6dca077df46',1,1,'Default','[]',0,'2019-02-18 10:00:21','2019-02-18 10:00:21','2020-02-18 10:00:21'),('6758ece66d6bc0056ffc87393231b7ec860f56a90ecf96478613a3403c73efcaa22ab7aaa46148b1',1,1,'Default','[]',0,'2019-02-18 23:03:08','2019-02-18 23:03:08','2020-02-18 23:03:08'),('6840d708d0df5fdc8ddbc889792fe7b623ce3140c89bb6d59348b67755112f6ac50d7e9fa33b95ea',3,1,'Default','[]',0,'2019-02-12 15:37:59','2019-02-12 15:37:59','2020-02-12 15:37:59'),('68798281c46b6acffc88c7e1a62d881318d43a45296705b66b15fd5fb940f52ae53f7083473d9548',45,1,'Default','[]',0,'2019-02-21 13:42:03','2019-02-21 13:42:03','2020-02-21 13:42:03'),('68bf1634d794457f7aec198e721495855c88032ab75a820b4824a46a488f455c16a465d2e5ac7723',62,1,'Default','[]',0,'2019-03-11 11:02:11','2019-03-11 11:02:11','2020-03-11 11:02:11'),('6902734441daf86f5ba876b46848ac1b46497590cb688232520bb0fdefeaee27953a0ddb703f2c48',32,1,'Default','[]',0,'2019-03-05 10:15:15','2019-03-05 10:15:15','2020-03-05 10:15:15'),('6ad983dc267a113715a002e766d99f29f44ee30550af3d92dc1e168db1632e0b91757d5d1ccd429e',2,1,'Default','[]',0,'2019-03-04 17:26:57','2019-03-04 17:26:57','2020-03-04 17:26:57'),('6b19f252ce6a4617d1fe7475bf3a31621a9627a4250341fc4c2461bcc2c6c758e8fdba4ce08ff499',50,1,'Default','[]',0,'2019-03-05 15:10:32','2019-03-05 15:10:32','2020-03-05 15:10:32'),('6be1d4ddcad9cb62b2e64dea82002f74aa22b190ee77f048f2503f8cf21ade5e05b036fbea578c21',14,1,'Default','[]',0,'2019-02-13 09:32:37','2019-02-13 09:32:37','2020-02-13 09:32:37'),('6d639f28f716952f3c073e8adef9012651538bdd64fd3d59008f31de50e429d81612ade15df69b91',1,1,'Default','[]',0,'2019-02-12 11:06:44','2019-02-12 11:06:44','2020-02-12 11:06:44'),('6d8585aca0e985058fb3cf2847c4d5e8f81b6410303989e2ce549f0b7ab8e84a69a954d752c317e8',2,1,'Default','[]',0,'2019-02-10 00:43:19','2019-02-10 00:43:19','2020-02-10 00:43:19'),('6e4b881ed2bd3a94e427ec5465ed03342ca842366a640c8d0e3a69a472a267c968d42a2fa95ea477',9,1,'Default','[]',0,'2019-02-11 09:58:01','2019-02-11 09:58:01','2020-02-11 09:58:01'),('6e9b17146270a3a2c115a9d1cd5bf85ce04a805f739e94f09b64c39668997d695960ef64e93ac2f8',2,1,'Default','[]',0,'2019-02-09 20:37:07','2019-02-09 20:37:07','2020-02-09 20:37:07'),('6f01f81e77b6d413368de3d3d08c2bff7e5bc51285ac918aaaf657524de6241bbbcb0093691cac79',3,1,'Default','[]',0,'2019-02-12 11:35:27','2019-02-12 11:35:27','2020-02-12 11:35:27'),('6f69ddf78c4478565c30ee6aaf3c910f60a6b01287f22d14acea2b8b781d2bc3843cc979afa3d06c',2,1,'Default','[]',0,'2019-02-12 05:53:55','2019-02-12 05:53:55','2020-02-12 05:53:55'),('7016c5c26f84f56e49e94ade3d86d88398c0217de31132efc9f904d37c59554c02245ff08c2e668f',21,1,'Default','[]',0,'2019-02-16 13:36:18','2019-02-16 13:36:18','2020-02-16 13:36:18'),('70c343938460935850a1cba97a7f2fe91e2a7a29e17e68a4efc14ef48951c07daa8903799d293802',5,1,'Default','[]',0,'2019-02-25 10:37:21','2019-02-25 10:37:21','2020-02-25 10:37:21'),('71fb2abbe60501f719e72dfb41890f9dae1ebe93e352dfd32885a182efcf395f75649fb6bdfeac69',1,1,'Default','[]',0,'2019-03-11 12:41:08','2019-03-11 12:41:08','2020-03-11 12:41:08'),('72969e8ce1848162977452e286962a656f0998861bd36a402233d99ce804bb444b24b51b89692071',11,1,'Default','[]',0,'2019-02-11 10:25:17','2019-02-11 10:25:17','2020-02-11 10:25:17'),('73cc5c3e71bf8a4cf080df2e5ddc38e87df307ae2e8d28b155d01d14a8a395e7fe66e3f8a19b1d0a',1,1,'Default','[]',0,'2019-02-11 18:03:32','2019-02-11 18:03:32','2020-02-11 18:03:32'),('7559dac288ae8807ac089839e5079e8fd02058d0049823d273681b5c785fe25bb35fde4111a8d93c',52,1,'Default','[]',0,'2019-02-27 09:47:40','2019-02-27 09:47:40','2020-02-27 09:47:40'),('75d29f2064fd4f7c54d9852a5122170318e034c9aaaf9f8c466f2745a9e13d00283903390faab2b4',5,1,'Default','[]',0,'2019-02-17 17:13:23','2019-02-17 17:13:23','2020-02-17 17:13:23'),('75fd3b7eab110d7438c9a4db24720ded243750f0f79716749a8977455082e9497e99a664ec1477cb',1,1,'Default','[]',0,'2019-02-19 22:00:52','2019-02-19 22:00:52','2020-02-19 22:00:52'),('76bb231c52083914c187164999fd4b23cab46ef538a3479db0443d8aedc075f17bc5aa2e66fddcc4',1,1,'Default','[]',0,'2019-02-25 16:21:46','2019-02-25 16:21:46','2020-02-25 16:21:46'),('76d1e460a3322f6a6e6e76989248524ecc275b2fd1f04433783084d5bfccf780e36ab7e0b9b652f9',1,1,'Default','[]',0,'2019-03-06 12:11:59','2019-03-06 12:11:59','2020-03-06 12:11:59'),('778a61f80961d0b65b22100f9ea5ceff7788e412e187bdb53ce048357ce4bfd45fed89b6fadc846f',5,1,'Default','[]',0,'2019-03-04 12:26:10','2019-03-04 12:26:10','2020-03-04 12:26:10'),('7901dc00acfb4f8d7204275ae89a12bac9082d9b6e8c20e4aadbf0f4f7f24e6e5f87f99cfc4592b8',27,1,'Default','[]',0,'2019-03-11 09:01:56','2019-03-11 09:01:56','2020-03-11 09:01:56'),('7a3e711b478f7fd730f875124b6d2ac45f006b44a108f4a953174897db7dedc75244f52bcc9c7e65',1,1,'Default','[]',0,'2019-02-18 16:58:40','2019-02-18 16:58:40','2020-02-18 16:58:40'),('7aef1e9b2978e5662b1871fdc8bff9fcb9611bae8628c3d9f4f47613944962bc7485a4dfc4b57140',1,1,'Default','[]',0,'2019-02-09 17:35:44','2019-02-09 17:35:44','2020-02-09 17:35:44'),('7c11bef11029214a6c4b4807c904d4e16fed23b86ecfa5db5358bf2dfac7b47d53a485d4a1e384c3',3,1,'Default','[]',0,'2019-02-09 11:19:17','2019-02-09 11:19:17','2020-02-09 11:19:17'),('7dcf163f668013d9bfe948eb12025011a46f498bcbf35d6bdad153b5ab7715adc0310fcdd16b6ec4',19,1,'Default','[]',0,'2019-02-14 17:58:21','2019-02-14 17:58:21','2020-02-14 17:58:21'),('7e20a1d3ce0a10df44091e1718c6c0d2f95676008072e386c5b8b99b8fbbddcd405ad527b474a2c9',5,1,'Default','[]',0,'2019-02-16 17:23:21','2019-02-16 17:23:21','2020-02-16 17:23:21'),('7e49e0c9e90866438a0a04c7b2154448f2951e4ecc84073f7e9519011b432a7029fc975225a720c9',3,1,'Default','[]',0,'2019-02-15 13:40:46','2019-02-15 13:40:46','2020-02-15 13:40:46'),('7ffa51b86a74f91e1d896e97a5d9aeaa531fdb6cd0646a7fe21fb6b926309d6b349ecc9360f46f07',5,1,'Default','[]',0,'2019-03-06 08:29:30','2019-03-06 08:29:30','2020-03-06 08:29:30'),('809709b2dab3404ca68bf9b981f13ef82a2f37d08acc24ee6bd25f314015d04ebbad858676503180',1,1,'Default','[]',0,'2019-02-25 16:21:30','2019-02-25 16:21:30','2020-02-25 16:21:30'),('826002bc4c4306ebb30274099a2c6c00b2a9d1b6768d15b660d563ece120b631f59518fa800911b1',35,1,'Default','[]',0,'2019-02-18 11:22:02','2019-02-18 11:22:02','2020-02-18 11:22:02'),('82c1f71d81940d3ed9e9402e24a8e8ff0f6ab7a8f676ad9648ce2a501bc34bf68c7fba7b808daa62',59,1,'Default','[]',0,'2019-03-08 01:50:49','2019-03-08 01:50:49','2020-03-08 01:50:49'),('833f83495f251f0635d996c2103c47ad88fe616428de598bfe67e740dbb6a6749a1696ba4d32749f',2,1,'Default','[]',0,'2019-02-13 07:11:19','2019-02-13 07:11:19','2020-02-13 07:11:19'),('8354c28092b9e04a9700f555bf287950a42953f6d185eb5dd18d722ffe832d9c554fcb61b85b4748',8,1,'Default','[]',0,'2019-02-25 10:27:31','2019-02-25 10:27:31','2020-02-25 10:27:31'),('84131018ca83e345d07a3139253567179ed7e3dbef7ec42032d383695270ac71e870fd24e23f0eda',2,1,'Default','[]',0,'2019-03-06 14:12:35','2019-03-06 14:12:35','2020-03-06 14:12:35'),('856b80fa59d1b52644b671f881f052bfc9284fb9cd7ba66be84a139197b21c642cdc885198399cd9',47,1,'Default','[]',0,'2019-02-22 06:37:05','2019-02-22 06:37:05','2020-02-22 06:37:05'),('878a399f9daf601c2c4683442b14cdc27eb63b9f0652c52f0527e767d599eb4496d900f66731aec0',3,1,'Default','[]',0,'2019-02-15 16:36:53','2019-02-15 16:36:53','2020-02-15 16:36:53'),('887f3c8776e7f9404544b65df93f51aadf26126aef163ef72f790066570fb51cbd2cd20723fb9963',58,1,'Default','[]',0,'2019-03-08 01:21:02','2019-03-08 01:21:02','2020-03-08 01:21:02'),('8ace8dbf928a2c90de33b34913faaea69cba0951d045240e3a5fd11a51209868a8e50ce0cd56f2e5',40,1,'Default','[]',0,'2019-02-19 11:08:53','2019-02-19 11:08:53','2020-02-19 11:08:53'),('8ad7dc140faf22d536d1abbea6900b98507c5305bf6f50e888d2786dda0c4148dcbab90789a7b2ad',58,1,'Default','[]',0,'2019-03-06 08:24:41','2019-03-06 08:24:41','2020-03-06 08:24:41'),('8afd12b9ebd9c101c7521e89b87767e15a5c405132ee2b584bbf6421f135a7054d46cad47766811d',1,1,'Default','[]',0,'2019-02-10 11:11:37','2019-02-10 11:11:37','2020-02-10 11:11:37'),('8ba1fe660219d3e7a5854dd190b367c277600d3d650ee45882bd05eeda46fcfb2b6998f9cbc8d5ec',9,1,'Default','[]',0,'2019-02-11 10:05:51','2019-02-11 10:05:51','2020-02-11 10:05:51'),('8e39a6db6da2a4d085e0e4f91a7c5487da5fc7f554150602a5a447fc9f212a041f144b29871eeeae',32,1,'Default','[]',0,'2019-02-20 15:23:06','2019-02-20 15:23:06','2020-02-20 15:23:06'),('8feb4165458772dddb9e45a67067c8c7cefb4291540e33752e95c8c70dd10f2008117c198b8c0cb2',1,1,'Default','[]',0,'2019-02-19 09:18:31','2019-02-19 09:18:31','2020-02-19 09:18:31'),('90f14a8a9a0b169f9c75b3e739ef82f9f9114458003881f543ac48165f98d9da5723068d54e6866f',6,1,'Default','[]',0,'2019-02-09 17:48:16','2019-02-09 17:48:16','2020-02-09 17:48:16'),('9123db2eebe84742252ad9a11200bb953d4e746c953b6d8e36fcc46d14603006ce38a780b26551f7',44,1,'Default','[]',0,'2019-02-21 09:42:55','2019-02-21 09:42:55','2020-02-21 09:42:55'),('920a8d965ba27afd992a283a1d0650765207d3dee399860af829d6ac13a3ef6485e32dda5b1b021f',3,1,'Default','[]',0,'2019-02-09 17:12:51','2019-02-09 17:12:51','2020-02-09 17:12:51'),('935dbbb72cb1a3268d22958dae192ee6c4d64a204db4f34660368c0a34b5b3a67824f92cc19eb8c0',54,1,'Default','[]',0,'2019-03-04 16:53:20','2019-03-04 16:53:20','2020-03-04 16:53:20'),('959573e32c966ea79acb2d2c8788b45075b1cee27ce20586e676fba3284d8a4613dd305c1e25dc52',1,1,'Default','[]',0,'2019-02-09 22:42:12','2019-02-09 22:42:12','2020-02-09 22:42:12'),('95a2b7e2ca2f6a0658b9da3ea146c625b159533e69dfd20761c048fb9fe19a0cb60cccf446ade1a3',21,1,'Default','[]',0,'2019-02-20 16:28:23','2019-02-20 16:28:23','2020-02-20 16:28:23'),('96893ebbbf393b8c728a194ddfbf39f535f614b2cb22c2910f7d0a05d498259250bcd81c49b3a0c9',2,1,'Default','[]',0,'2019-02-09 17:10:04','2019-02-09 17:10:04','2020-02-09 17:10:04'),('9734a0666c8d6cc80c432c971e6f6b7fb30c9656525887f14d3bd948d2400f1a05f8edbc577419a5',39,1,'Default','[]',0,'2019-02-19 09:43:58','2019-02-19 09:43:58','2020-02-19 09:43:58'),('99db2fe747e99378de36de4f0542ea27ae56cd37ec7c94072d480e36fee0b08e15a0c3e46f3ed691',42,1,'Default','[]',0,'2019-02-19 11:26:06','2019-02-19 11:26:06','2020-02-19 11:26:06'),('9a81b90c2eed308df065c29d976f590060243b47d992f4ed7ee8f2f94af6b379f695b11ab1025ba6',43,1,'Default','[]',0,'2019-02-19 17:00:09','2019-02-19 17:00:09','2020-02-19 17:00:09'),('9b354ba42896fe4ce5ede7dc292a80d1e541c12a25856696456e395e1a2b03935cc516b39e9684fb',34,1,'Default','[]',0,'2019-02-18 10:09:59','2019-02-18 10:09:59','2020-02-18 10:09:59'),('9bba354fc9e6d1ed2c080486a75d9f47b20c708b7b45fb5f4c397da178e766617075ae4573ce7268',8,1,'Default','[]',0,'2019-02-11 12:21:00','2019-02-11 12:21:00','2020-02-11 12:21:00'),('9bc52f89ed1d8c4941e8fdca2aa00d4cdd1ad4ebd5e1f5669e820a19e5304ce222ae673dd78b5704',1,1,'Default','[]',0,'2019-02-19 18:10:51','2019-02-19 18:10:51','2020-02-19 18:10:51'),('9c23c16b048c0de74936984a8fb7e078d74ae061bb97caf8de4747bce97f3f4dd97111bcd16deb37',2,1,'Default','[]',0,'2019-02-09 17:19:39','2019-02-09 17:19:39','2020-02-09 17:19:39'),('9d03f567413bb2b36bcc5eb514d20ce8bd8b6769090ecfb35add3d9457ec6b4648772a6f924a854d',5,1,'Default','[]',0,'2019-02-16 13:15:35','2019-02-16 13:15:35','2020-02-16 13:15:35'),('9d55524a16c3549dffc5ec728121990661a0bdf50c17b82eb43061e4fa99fcefef7c55e22d22ffef',3,1,'Default','[]',0,'2019-02-12 15:17:29','2019-02-12 15:17:29','2020-02-12 15:17:29'),('9ee48fd74bac4421df1bfbff5db6653aad1cb2ee080035adaf3bffcc8755a76b61aa0dc3670cb485',29,1,'Default','[]',0,'2019-02-18 09:17:17','2019-02-18 09:17:17','2020-02-18 09:17:17'),('a0e1844fe86b7e0b48669a1358375e3cb201d8eebe244c46b6c9ada2d67f1e0aa569806d0704c0d0',10,1,'Default','[]',0,'2019-03-05 16:52:40','2019-03-05 16:52:40','2020-03-05 16:52:40'),('a0ece3e5d3ebeaafeb0f07c64b2032f1a8b375b80c87753bfe09df30b30b6eccffd460ff5c5eb67b',42,1,'Default','[]',0,'2019-02-19 11:30:49','2019-02-19 11:30:49','2020-02-19 11:30:49'),('a15656cab60f3cccf1d0fafd1f4f261dd2f1a632c84be021f84481a8a892d3eb45c817ff122d80fe',58,1,'Default','[]',0,'2019-03-06 08:30:35','2019-03-06 08:30:35','2020-03-06 08:30:35'),('a1d97be048c0ee8f6fed65c766b162ce40afdf2694d014d0755bd06ebb6defc8b009deb89121ed31',8,1,'Default','[]',0,'2019-02-11 09:47:50','2019-02-11 09:47:50','2020-02-11 09:47:50'),('a1df8f2f1de605d059dccab044a566a377cef977422323c3b231aaf661f75525fea4daf61b7124b2',1,1,'Default','[]',0,'2019-02-23 17:49:28','2019-02-23 17:49:28','2020-02-23 17:49:28'),('a2148bbfea77b707576bb2ecb82c7c53610793f7582dd5532f54e8920c69ea94331ba6ff644b092b',32,1,'Default','[]',0,'2019-02-18 09:26:44','2019-02-18 09:26:44','2020-02-18 09:26:44'),('a45b5f8609046462c5d95c41e0e4da7c11671fa0af4a94837c1f6323e05397ade97674e648bf80bd',31,1,'Default','[]',0,'2019-02-18 09:24:49','2019-02-18 09:24:49','2020-02-18 09:24:49'),('a45e49c970b74ba5882f4657ef170b38d539b7c78adda3df8e046859b1ca6f22b6430abfc26f7c2a',17,1,'Default','[]',0,'2019-02-13 16:44:24','2019-02-13 16:44:24','2020-02-13 16:44:24'),('a5103812e04795da5515d2b07457d03038ae408e16279ecc736e0ce31883e19d07f65d0215213737',18,1,'Default','[]',0,'2019-02-14 10:18:24','2019-02-14 10:18:24','2020-02-14 10:18:24'),('a58126933c2a0d6a5befb8bcdaee19059ce14d4eb4d4d3777c55e4b2448b2128576b4c5c94a4b81c',36,1,'Default','[]',0,'2019-02-18 16:45:37','2019-02-18 16:45:37','2020-02-18 16:45:37'),('a5b65050c5c38c6bd58d4fa3b0e45342e532f80b18934cc1b7ad00662c90d38b7344d79a7808c855',58,1,'Default','[]',0,'2019-03-08 01:29:27','2019-03-08 01:29:27','2020-03-08 01:29:27'),('a69f8fe98c77ff21568dc32403b65f427bfec46b9e961b87168516ffb5ef9e4fedfcc90a8337fd52',9,1,'Default','[]',0,'2019-02-11 10:26:14','2019-02-11 10:26:14','2020-02-11 10:26:14'),('a7305047abf0b59aeb301ecd0b74bcdc8fe6098d028369fcfd1cf2eb6756f64894c98a2309b5b122',1,1,'Default','[]',0,'2019-02-09 11:45:35','2019-02-09 11:45:35','2020-02-09 11:45:35'),('a7c01b00e9224d2af055a56781d8b73c047c118f850449c0e29177f47fbc2f52b2eec091e95143d3',1,1,'Default','[]',0,'2019-03-03 16:54:19','2019-03-03 16:54:19','2020-03-03 16:54:19'),('a93a884adc4f87b981098f5ea08c6b4994269a873ee3e09afae91593b41d1fcca67051ba012da395',1,1,'Default','[]',0,'2019-03-03 17:37:40','2019-03-03 17:37:40','2020-03-03 17:37:40'),('a991e379e215ed36d94d2c8696b6d2e2388aca08aba6470e115f983aabb822944213947e19adeebf',1,1,'Default','[]',0,'2019-03-03 18:12:46','2019-03-03 18:12:46','2020-03-03 18:12:46'),('aa4d41903a968febd3e57f0704fbb53599d82b725ebef67d3bbbe6ac52b34f81e8eb530832356098',32,1,'Default','[]',0,'2019-03-11 09:00:25','2019-03-11 09:00:25','2020-03-11 09:00:25'),('ab3cc285cdbaed0c8725040dedeeca369f016460f5087ead055634924f80bb639101421fa0d9ae31',2,1,'Default','[]',0,'2019-02-12 14:11:02','2019-02-12 14:11:02','2020-02-12 14:11:02'),('ac77ce33b705d68ab99aafeaf174f9bc15dc3cfb34a4b8e188067a76e08d638a101de33a6d206116',37,1,'Default','[]',0,'2019-02-18 16:48:51','2019-02-18 16:48:51','2020-02-18 16:48:51'),('acb05bd1aa39ab7cd3795480c1a0570a78fd2dcdfc6115e8946d4ac1b7e58c069fab7552694c53d1',2,1,'Default','[]',0,'2019-02-14 08:41:58','2019-02-14 08:41:58','2020-02-14 08:41:58'),('acdec5167c1a42b9d88cfc7627a61bdae601515c591897601bb6acd86855a24509ebebc3b8350c2b',1,1,'Default','[]',0,'2019-02-26 07:50:14','2019-02-26 07:50:14','2020-02-26 07:50:14'),('ad036b8feb1f353ede1893ff5275c636019cd54e05e8c2dad006a713b76a5c5a9b112f152f9815d5',57,1,'Default','[]',0,'2019-03-06 08:18:54','2019-03-06 08:18:54','2020-03-06 08:18:54'),('ad586c87b047d1d292bcea8fa6f65b781a11bca2cc637800e94f689a644378dc96e0055c382b428d',2,1,'Default','[]',0,'2019-03-04 17:35:57','2019-03-04 17:35:57','2020-03-04 17:35:57'),('add44c1da37dde0e38461882a7a46141b15acf9ff06ae1bea1c0939bbc896e2b30f8b3f8da590014',27,1,'Default','[]',0,'2019-02-18 08:48:06','2019-02-18 08:48:06','2020-02-18 08:48:06'),('aec15e90ddfd293c05957908287390f0fc1bb1fc41ea77af5dff5c8df1beeb2dc1680bdfd7e6c6c2',5,1,'Default','[]',0,'2019-03-10 08:37:42','2019-03-10 08:37:42','2020-03-10 08:37:42'),('af3ff33ec36185a0780414e6143e17c9ddaf7a7ac2becd817fc17abed1b8638633bb5cf32a98bafb',42,1,'Default','[]',0,'2019-03-11 11:25:09','2019-03-11 11:25:09','2020-03-11 11:25:09'),('afc2ccea269b613c286fc27f6619cd1267c8565bdbcb0a4c2ce12599b6838bda30b3db0c0822e6ea',49,1,'Default','[]',0,'2019-02-25 09:14:58','2019-02-25 09:14:58','2020-02-25 09:14:58'),('afdbf45afe8b51a555f2c8a2a4db663de0f376d3e6bb34b67ef3c9dcbeb9fe82279e1bcbc9c6fd22',5,1,'Default','[]',0,'2019-02-09 17:27:54','2019-02-09 17:27:54','2020-02-09 17:27:54'),('b0283e593ec8dbf3768eaaaa48775917b62d6277d3a5a9d2d7aa5826b6ef796b13d2b46369c0bdd0',3,1,'Default','[]',0,'2019-02-09 23:50:15','2019-02-09 23:50:15','2020-02-09 23:50:15'),('b0b46f874bc3cf9b16c7dc43ed665223836460b90aed7ff18853550adbb71cbf8fe457578ec861ec',38,1,'Default','[]',0,'2019-02-18 16:52:01','2019-02-18 16:52:01','2020-02-18 16:52:01'),('b1313cf79331d3bd888fa035c1d6105f9a92416b6f2d2ccba76ec879da16dd60081cf98c5618c2c3',16,1,'Default','[]',0,'2019-02-13 12:55:34','2019-02-13 12:55:34','2020-02-13 12:55:34'),('b1b17876d4678579798ab196f0ecab8aca4fde642a5aa437c6a9a65f561b1ea1c873aa9cd36286af',1,1,'Default','[]',0,'2019-03-10 12:03:18','2019-03-10 12:03:18','2020-03-10 12:03:18'),('b1b9930347135b809a8cde0f6972972b7a88ae1dc60cc49a66b2e0fca42869d478e9e53e87c084c0',56,1,'Default','[]',0,'2019-03-06 08:13:23','2019-03-06 08:13:23','2020-03-06 08:13:23'),('b1cfd03847116c6a6e7c03ecf3bc59647de2bf3da74c77c2f9b357f8ea13fbd10d8e955822f5fa81',41,1,'Default','[]',0,'2019-02-19 11:18:18','2019-02-19 11:18:18','2020-02-19 11:18:18'),('b4d611110d3b2d10ae576c893a6852513ed0690debd7874464d5b61a60238b1bba742fbb1635ab4b',1,1,'Default','[]',0,'2019-03-10 13:16:54','2019-03-10 13:16:54','2020-03-10 13:16:54'),('b555ebbe60d2c9d9bf7230dd5701f9aecc8189edb06a50178bb19bc9a2d98a0912743a225304be69',2,1,'Default','[]',0,'2019-02-12 14:19:13','2019-02-12 14:19:13','2020-02-12 14:19:13'),('b60ee736a7dd419b06336c49596ec4e406cc883b42d9bd6e847b47f74b7acb39f584b5ff40377345',1,1,'Default','[]',0,'2019-03-10 03:57:59','2019-03-10 03:57:59','2020-03-10 03:57:59'),('b65fbdc06272474d5dd213b27d73d23555726e3f323eab8592589ac7eeec6c78c3f83d2734abf8e5',2,1,'Default','[]',0,'2019-02-09 16:57:35','2019-02-09 16:57:35','2020-02-09 16:57:35'),('b69b67c659b6c2c2d9f6730817b8e8aa2beb591bb6b1e365f7235c4305635a86c73dd2bc20502cc9',8,1,'Default','[]',0,'2019-02-17 08:51:59','2019-02-17 08:51:59','2020-02-17 08:51:59'),('b9f4ab92d2862045dcde332a8bbaf498e42045c6d6e21aed475d6e69dfd116dd50b6f4db4e13dd60',25,1,'Default','[]',0,'2019-02-16 13:15:28','2019-02-16 13:15:28','2020-02-16 13:15:28'),('bad678e74716673cfec56e299bc83de052d88d4c6511b9c9c41f6f350745577885b6acb157be0819',3,1,'Default','[]',0,'2019-02-09 13:00:43','2019-02-09 13:00:43','2020-02-09 13:00:43'),('bb13612dd3037a29fa1fb8189197d526c7f47e2c2f9cda715e35336e3ddd019bc544267bc48cb5d7',21,1,'Default','[]',0,'2019-02-16 16:48:01','2019-02-16 16:48:01','2020-02-16 16:48:01'),('bb6d69bcd748cd3d84a6d2eaf2a243b3518abb422aad78c7c42216afac1f96fad9c6888e5bfc2f30',30,1,'Default','[]',0,'2019-02-18 09:22:06','2019-02-18 09:22:06','2020-02-18 09:22:06'),('bca992802db47435ac5009702e62becc625a602744632a242eebf0f1653061e8d1522b821551b242',5,1,'Default','[]',0,'2019-03-04 12:16:47','2019-03-04 12:16:47','2020-03-04 12:16:47'),('beb1a56b75a7715853012ba7caccba294c32aaa7efda088f747eb392a86361d5ac6423b9691824c0',40,1,'Default','[]',0,'2019-02-19 11:08:29','2019-02-19 11:08:29','2020-02-19 11:08:29'),('c137cd19cf458caf76c17425200b450582136a62055917cf3fc60080cd5d72912bf8e79c702456ae',15,1,'Default','[]',0,'2019-02-13 12:45:37','2019-02-13 12:45:37','2020-02-13 12:45:37'),('c13e1238846b13928a75df9eb6ad3497bdbf56511ca56e24e931dbef0df28fbf6309e007b17eae4c',2,1,'Default','[]',0,'2019-02-12 11:29:19','2019-02-12 11:29:19','2020-02-12 11:29:19'),('c1a085d296100f21ef2842a66a7099fcb80440b6f23c0684c47644d4d5c8ea5f465e4c7ed6cb2c01',3,1,'Default','[]',0,'2019-02-15 14:59:54','2019-02-15 14:59:54','2020-02-15 14:59:54'),('c27fda180c6939bc540849e650e76063f45afdade673801379c0e1f54096a8673502d453cac98a0f',10,1,'Default','[]',0,'2019-02-11 10:21:47','2019-02-11 10:21:47','2020-02-11 10:21:47'),('c28a20ca5045a6efb8c9670da286657abc4705773c6c7420207762bd55ca38aef489ab08bf71f723',50,1,'Default','[]',0,'2019-03-05 17:04:55','2019-03-05 17:04:55','2020-03-05 17:04:55'),('c2ade64e6199549e0d0b9625f16c6558d784a31139f9708dce184690eae240f6a00f5950c8e2d090',2,1,'Default','[]',0,'2019-03-06 20:12:32','2019-03-06 20:12:32','2020-03-06 20:12:32'),('c33ed4b41d4ca7197b2f5dbb12b42fabe0c9da4f3799c7e994e2ea9efd0108f2f188550b883f347e',2,1,'Default','[]',0,'2019-03-10 08:30:18','2019-03-10 08:30:18','2020-03-10 08:30:18'),('c45e06ef39c3680a6e450f200262936dcbc7150a2e23d6974e8b674b7b715519666e4825546d0479',17,1,'Default','[]',0,'2019-02-13 16:44:04','2019-02-13 16:44:04','2020-02-13 16:44:04'),('c5f043c31a7431935850654a95608111807188aedf4a934e81cd134dbbb4ba5f29233aca971937d8',2,1,'Default','[]',0,'2019-03-10 08:57:18','2019-03-10 08:57:18','2020-03-10 08:57:18'),('c73054b5f2f001cc4a1d78f62500c5e1d3e841cb491a8bbad0d3e9789e3908156c02eb2c6f38fb42',5,1,'Default','[]',0,'2019-03-06 08:32:28','2019-03-06 08:32:28','2020-03-06 08:32:28'),('c7b47ec97c3b3c94c1e0ed020bf39a37e52bad8de0267cbabaca22330781bc61d137c39226d67a73',4,1,'Default','[]',0,'2019-02-25 11:20:30','2019-02-25 11:20:30','2020-02-25 11:20:30'),('c80643c206845624811a1f6ceddd4c3f943d956e7d793284b77024bf62fac1285c13ec8e342369a4',51,1,'Default','[]',0,'2019-02-27 09:41:38','2019-02-27 09:41:38','2020-02-27 09:41:38'),('c806d94d8553b0ed6840696cdceccd34c8d0e0532eec1e5bde3b4b4773da143e2935460f066046af',3,1,'Default','[]',0,'2019-02-11 09:39:57','2019-02-11 09:39:57','2020-02-11 09:39:57'),('c806e07514e61934ff3e3b72dc734dd24c0640687c3f67c0260583ea3b9660db3c103a2d0c672de1',5,1,'Default','[]',0,'2019-03-05 10:54:24','2019-03-05 10:54:24','2020-03-05 10:54:24'),('cada0f72b5bdba8315d85bcb2a48f9a49f3dac1ef578ed26d8d8a47b0e2c902c1a1ae88c5305b7e0',3,1,'Default','[]',0,'2019-02-09 16:54:28','2019-02-09 16:54:28','2020-02-09 16:54:28'),('cbe3957274ee1ce1fac981c41f2664ba7be7ec4e8bbfd305abdf658f681feb0532e1b7fefd5bb7d1',5,1,'Default','[]',0,'2019-03-11 10:25:23','2019-03-11 10:25:23','2020-03-11 10:25:23'),('ce5fd51efe88ccd624b167ac2dc118482fddb7bd999518cfa4e9a480712bd6d1cce01d79d432464f',21,1,'Default','[]',0,'2019-02-16 09:37:52','2019-02-16 09:37:52','2020-02-16 09:37:52'),('cfd5dbf46d502c1c0b854e2e4e55dfdf330006f82e6612536af47a3e65cb098ef73fc8decc40cd6a',1,1,'Default','[]',0,'2019-02-12 14:08:53','2019-02-12 14:08:53','2020-02-12 14:08:53'),('d00139435c3dec8bfe3d1aeaa6c34a0f676cc561ce65c74f74777674155614e8f691a19fcd7fe5c7',1,1,'Default','[]',0,'2019-02-25 10:17:10','2019-02-25 10:17:10','2020-02-25 10:17:10'),('d15224c229a869e0ac30ea055339cfa4d3570ebc29ee23e85d3477f12b3981e086c6df71648b0ff9',1,1,'Default','[]',0,'2019-02-11 17:44:42','2019-02-11 17:44:42','2020-02-11 17:44:42'),('d1a8d1cfbdc28b11cce0eb192a8be351cc2ce6618743ede107633d582ae047c8cb1c5774d5645d24',2,1,'Default','[]',0,'2019-02-09 10:58:56','2019-02-09 10:58:56','2020-02-09 10:58:56'),('d253e5490198e1a98cd3bc6f40456bd0e85ab96bb50fcd4f4c3ae94ba5160ec9f196b8e3a768f79b',43,1,'Default','[]',0,'2019-02-19 17:12:35','2019-02-19 17:12:35','2020-02-19 17:12:35'),('d3df3958fa5d4177b3247f0ca9c5cfbe5b90010fafb7acc48cf359554b6efac2df9f8509a62ac6ca',6,1,'Default','[]',0,'2019-02-09 18:00:38','2019-02-09 18:00:38','2020-02-09 18:00:38'),('d44c665da9935abc1216a50c5580ff888ed3676d7b6d7d84344c46cef899e6a1ddd0b2aec465e335',8,1,'Default','[]',0,'2019-02-11 09:49:27','2019-02-11 09:49:27','2020-02-11 09:49:27'),('d5330ea57d0cea1e2cd5bd8f949e71f51d76c0cffaf0a579011bb85cd03046178e187070b2b3a05a',1,1,'Default','[]',0,'2019-02-12 12:31:01','2019-02-12 12:31:01','2020-02-12 12:31:01'),('d6efc2e1c854ba443e976f34220457593e8447c717be6411298eb2a99a6079e984172f1e8246b20f',5,1,'Default','[]',0,'2019-02-28 12:31:06','2019-02-28 12:31:06','2020-02-28 12:31:06'),('d72922e3517ddc663a85258d8861533ca232e81aeb242891d14bdffaf510bcaae25840ae37d4675c',1,1,'Default','[]',0,'2019-02-19 13:24:13','2019-02-19 13:24:13','2020-02-19 13:24:13'),('d729e067587327f63613b5256e9081428aa1f830dba814875074ab68990f499e8ea2ec92580adc29',23,1,'Default','[]',0,'2019-02-16 11:15:05','2019-02-16 11:15:05','2020-02-16 11:15:05'),('d809d5f9c34653c8368c3bea959e1e9cc10563870f15cb03083900abb47e824612de05d2f4a48141',32,1,'Default','[]',0,'2019-03-11 11:05:22','2019-03-11 11:05:22','2020-03-11 11:05:22'),('d9cce49bd5ee31c06c84ceedb3879d02c8aebc6947f0905df60cda25cf2c3331f30f2f3eba797f72',2,1,'Default','[]',0,'2019-02-09 10:58:49','2019-02-09 10:58:49','2020-02-09 10:58:49'),('da55318ab22a4c8fbbf2ed83987e10327728c9f3a7b6d30be17efb0f42bb5c35766ee0bedd6d5045',61,1,'Default','[]',0,'2019-03-11 10:37:03','2019-03-11 10:37:03','2020-03-11 10:37:03'),('dd58542a8923fd10092a305830415a85875f168fb34d702e1643e342e46ecd58fb48d6930584beab',5,1,'Default','[]',0,'2019-02-20 23:30:28','2019-02-20 23:30:28','2020-02-20 23:30:28'),('dea885d1ff1c69ea9d9b3642ddf4af15dbd128c0d5b5f01435a1ea1e946b6171b6563771c4f599b3',47,1,'Default','[]',0,'2019-02-22 06:37:21','2019-02-22 06:37:21','2020-02-22 06:37:21'),('e10a3ac23fa0a031848bfdf405a52cd9865875f19212b4bf5394cb47a3f960803ef0d70ad9d1b62e',5,1,'Default','[]',0,'2019-03-06 08:35:35','2019-03-06 08:35:35','2020-03-06 08:35:35'),('e12577801356f445fbdd5b693f281a47e1d0f8ea5965aaca46b814e432f3d222b373f96c391da70c',5,1,'Default','[]',0,'2019-03-06 08:46:37','2019-03-06 08:46:37','2020-03-06 08:46:37'),('e1fd14dd5426327f20c20274448bb04d1b17f339a396c830fdcf0dfbf00e6e2b98f4c17bdd9b7d2b',1,1,'Default','[]',0,'2019-03-02 02:47:49','2019-03-02 02:47:49','2020-03-02 02:47:49'),('e2189c493b1426b65a2db70cd8927f7506385048bf53cad04db338aa3753e895f4aa7a17f41930c5',61,1,'Default','[]',0,'2019-03-11 10:36:53','2019-03-11 10:36:53','2020-03-11 10:36:53'),('e253c93dfb0cc298c37aac729312d33ad6a9b26d0250bbd1deece43aec78080d39c13e14a56cfa8f',39,1,'Default','[]',0,'2019-02-19 10:55:07','2019-02-19 10:55:07','2020-02-19 10:55:07'),('e3334392fa397a109f431710a2faec571672ba46530a6f8e9502a7ec327b697d90ea45115db3f22e',20,1,'Default','[]',0,'2019-02-16 05:23:05','2019-02-16 05:23:05','2020-02-16 05:23:05'),('e34aa92b30b25918db99b7cec3c4714f9773cdcd70484c44f6639e3e31fda0294763371727474407',32,1,'Default','[]',0,'2019-03-05 10:15:33','2019-03-05 10:15:33','2020-03-05 10:15:33'),('e428d7ea700a6161cd9a40de22a512b75e9908bccc751386124d52b40860083181c329946553033b',1,1,'Default','[]',0,'2019-02-18 17:23:24','2019-02-18 17:23:24','2020-02-18 17:23:24'),('e4b116f1f81d63d7c61451c5368a3720669a56c72710fa49984b505dc06218bc46786ef5e1b77375',2,1,'Default','[]',0,'2019-03-10 05:11:44','2019-03-10 05:11:44','2020-03-10 05:11:44'),('e6f088107ba94a8998747f2b4db5aa0d771d84a51abd6be5a0922a721d6b318947750094cd497677',1,1,'Default','[]',0,'2019-02-18 22:57:48','2019-02-18 22:57:48','2020-02-18 22:57:48'),('e7289f5bbfaae7a064fc5bbdeaaba5575b1e23c9aab8a26e1f12878fa831bec5b54afbc5cc2b68ba',2,1,'Default','[]',0,'2019-02-09 12:58:57','2019-02-09 12:58:57','2020-02-09 12:58:57'),('e79bd2a9f2936dcef13c2553a6c0fe86f3e2b4862e258122921c3a1d22f7f67b34160f0210cb1a1a',1,1,'Default','[]',0,'2019-02-18 09:40:59','2019-02-18 09:40:59','2020-02-18 09:40:59'),('e891f4fb63e6fcd056269a05d72ce07b36185c609dab926cc91b8db93d67fe8b15cd37bd7a64d260',41,1,'Default','[]',0,'2019-02-19 11:15:16','2019-02-19 11:15:16','2020-02-19 11:15:16'),('ea304bfdec37ae62d4666ba862de812bd2a10c9547c1708bcb02ce0850efccc292be3118056cace6',32,1,'Default','[]',0,'2019-03-11 11:05:40','2019-03-11 11:05:40','2020-03-11 11:05:40'),('eb5d5ffa4224a65d726e4e4bfcec37d66a80935ccd014ed29c4f5d07e1c3043248077f84f3bbe32e',2,1,'Default','[]',0,'2019-02-15 13:55:31','2019-02-15 13:55:31','2020-02-15 13:55:31'),('eb8b0caa7d4426b1ca19768c22d28f33ebf69e089d25382a63ae08cb84b87f8a43b5d97223ed26c5',3,1,'Default','[]',0,'2019-02-13 09:43:17','2019-02-13 09:43:17','2020-02-13 09:43:17'),('ec1452930d685f47e63148aa6c02da3b188ddbaa137382fd364e47af14bb35d27acc8c44602e4bb2',3,1,'Default','[]',0,'2019-02-10 00:51:14','2019-02-10 00:51:14','2020-02-10 00:51:14'),('ec2f87a33644ad61b37ae433be1aa5a2e686070fd3c23e9130e39ab7a0a071f0670430b2d877aec0',59,1,'Default','[]',0,'2019-03-08 01:51:05','2019-03-08 01:51:05','2020-03-08 01:51:05'),('ec48434efcd252e7a480423e4806c41ec6a59327f21d2aee5661e2985ee01eaf33649ca09a978528',42,1,'Default','[]',0,'2019-02-25 09:59:24','2019-02-25 09:59:24','2020-02-25 09:59:24'),('ecdcfe399d1cc3a84c2fecaf8e540aeb353012d373f77413af4a8b80664cf2fd92a5cc31dc15ba76',2,1,'Default','[]',0,'2019-02-14 08:16:56','2019-02-14 08:16:56','2020-02-14 08:16:56'),('ee0d75fee1973cc4a4d50479f532d958268084f27516f1e2830f53db9393c07dd4cc91c9e7adc463',19,1,'Default','[]',0,'2019-02-14 17:58:37','2019-02-14 17:58:37','2020-02-14 17:58:37'),('ef08883caf3ffb1e8293444b77dde0e455fae7f750e82273adb2e5e8ad0ab6dda4f7e4299302f086',1,1,'Default','[]',0,'2019-02-09 11:07:40','2019-02-09 11:07:40','2020-02-09 11:07:40'),('f095af529d1c7243c1d2986aedb42d8e765fb9146c9abb60e5990c46339d2e00ba0b04eb968c4878',42,1,'Default','[]',0,'2019-02-25 09:16:10','2019-02-25 09:16:10','2020-02-25 09:16:10'),('f573bfdbb2500b0b6ce1eecb6f7bb3a1f07eb4098736b5a5126b3b0bb1144f37f1f4447aefec8c3b',1,1,'Default','[]',0,'2019-02-26 08:37:51','2019-02-26 08:37:51','2020-02-26 08:37:51'),('f59ba187265893a1a0249f5c34790e1f73a0b550c535f5bd5a9161d98e0e5cec6c1390906bae77be',33,1,'Default','[]',0,'2019-02-18 09:54:26','2019-02-18 09:54:26','2020-02-18 09:54:26'),('f6a7e922df6116c044d3580406478ef6fce9eb75adec39b64a6a4311f741b7e881c0dd5973e0baa5',22,1,'Default','[]',0,'2019-02-16 10:59:03','2019-02-16 10:59:03','2020-02-16 10:59:03'),('f89dd09071febda7792d0451725fb56115b8bbb3a002e9ab23de451afdd2ff06429a5bbbc6fcf177',1,1,'Default','[]',0,'2019-02-17 08:47:43','2019-02-17 08:47:43','2020-02-17 08:47:43'),('f8a9efa561aa6e01d0f88e06252b44644cd66c9f2c98cdaaf698f25b583fb487095453169a29534f',8,1,'Default','[]',0,'2019-02-11 12:21:24','2019-02-11 12:21:24','2020-02-11 12:21:24'),('fb68db7e84535ddba2fdbde024b91691b389032da00d10467c39bd7d74acb4bbaeeeddd1eb31cf1f',1,1,'Default','[]',0,'2019-02-25 10:05:28','2019-02-25 10:05:28','2020-02-25 10:05:28'),('fc46e4c81d630658ca6c3c588b933273058038d1ccd236472298fd03fe4224084ae76e35e9819707',1,1,'Default','[]',0,'2019-03-09 20:32:32','2019-03-09 20:32:32','2020-03-09 20:32:32'),('fc96b8b742bec510bf82c2a0fc26295b78149598a1e88dc9b37fc9316f9c7b402c19750a5a02fa27',1,1,'Default','[]',0,'2019-03-03 17:25:38','2019-03-03 17:25:38','2020-03-03 17:25:38');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `oauth_clients` VALUES (1,NULL,'Handyman Personal Access Client','pUerGeE3Lwp5yS7XUqz1YpyQjPw9uq3ZomPw6ebT','http://localhost',1,0,0,'2019-02-09 10:58:36','2019-02-09 10:58:36'),(2,NULL,'Handyman Password Grant Client','p73owaolOdDvlhC9lhl2Ur9ppIzRLXX19GAlkaX1','http://localhost',0,1,0,'2019-02-09 10:58:36','2019-02-09 10:58:36');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2019-02-09 10:58:36','2019-02-09 10:58:36');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
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
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` double(8,2) NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) NOT NULL DEFAULT '30',
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'Premium','Get 10 leads per day for a month.',50.00,'INR',30,NULL,'2019-03-04 16:46:00','2019-03-04 16:46:00'),(2,'Economy','Get 5 leads per day for a month.',30.00,'INR',30,NULL,'2019-03-04 16:46:00','2019-03-04 16:46:00'),(3,'Basic','Get 1 leads for a month.',30.00,'INR',30,NULL,'2019-03-04 16:46:00','2019-03-04 16:46:00');
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans_features`
--

DROP TABLE IF EXISTS `plans_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plans_features` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` enum('feature','limit') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'feature',
  `limit` int(11) NOT NULL DEFAULT '0',
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans_features`
--

LOCK TABLES `plans_features` WRITE;
/*!40000 ALTER TABLE `plans_features` DISABLE KEYS */;
INSERT INTO `plans_features` VALUES (1,1,'Leads per day','leads_per_day','leads_per_day','limit',300,NULL,'2019-03-04 16:46:00','2019-03-04 16:46:00'),(2,2,'Leads per day','leads_per_day','leads_per_day','limit',150,NULL,'2019-03-04 16:46:01','2019-03-04 16:46:01'),(3,3,'Leads per day','leads_per_day','leads_per_day','limit',30,NULL,'2019-03-04 16:46:01','2019-03-04 16:46:01');
/*!40000 ALTER TABLE `plans_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans_subscriptions`
--

DROP TABLE IF EXISTS `plans_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plans_subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` enum('stripe') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `charging_price` double(8,2) DEFAULT NULL,
  `charging_currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_recurring` tinyint(1) NOT NULL DEFAULT '1',
  `recurring_each_days` int(11) NOT NULL DEFAULT '30',
  `starts_on` timestamp NULL DEFAULT NULL,
  `expires_on` timestamp NULL DEFAULT NULL,
  `cancelled_on` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans_subscriptions`
--

LOCK TABLES `plans_subscriptions` WRITE;
/*!40000 ALTER TABLE `plans_subscriptions` DISABLE KEYS */;
INSERT INTO `plans_subscriptions` VALUES (1,1,54,'App\\Models\\Auth\\User\\User',NULL,1,50.00,'INR',1,30,'2019-03-04 16:56:12','2019-04-03 16:56:13',NULL,'2019-03-04 16:56:13','2019-03-04 16:56:13'),(2,1,2,'App\\Models\\Auth\\User\\User',NULL,1,50.00,'INR',1,30,'2019-03-05 05:14:21','2019-04-04 05:14:22',NULL,'2019-03-05 05:14:22','2019-03-05 05:14:22');
/*!40000 ALTER TABLE `plans_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans_usages`
--

DROP TABLE IF EXISTS `plans_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plans_usages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` double(9,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans_usages`
--

LOCK TABLES `plans_usages` WRITE;
/*!40000 ALTER TABLE `plans_usages` DISABLE KEYS */;
/*!40000 ALTER TABLE `plans_usages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_profiles`
--

DROP TABLE IF EXISTS `provider_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `primary_category_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `document_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `price_type` enum('visit','hour') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `latitude` decimal(15,7) NOT NULL DEFAULT '0.0000000',
  `about` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `provider_profiles_foreign_user` (`user_id`),
  KEY `provider_profiles_foreign_categories` (`primary_category_id`),
  CONSTRAINT `provider_profiles_foreign_categories` FOREIGN KEY (`primary_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `provider_profiles_foreign_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_profiles`
--

LOCK TABLES `provider_profiles` WRITE;
/*!40000 ALTER TABLE `provider_profiles` DISABLE KEYS */;
INSERT INTO `provider_profiles` VALUES (1,1,2,1,'https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Sat%20Feb%2009%202019%2016%3A43%3A19%20GMT%2B0530%20(India%20Standard%20Time)?alt=media&token=27963b27-e5eb-48b9-8c74-28461dad863a',NULL,102,'visit','حي الكويت، Djelfa, Algérie',3.2498503,34.6682644,'Restoran Singgang Budu','2019-02-09 10:57:03','2019-03-10 09:00:04'),(2,NULL,2,0,NULL,NULL,NULL,NULL,NULL,0.0000000,0.0000000,NULL,'2019-02-09 10:58:48','2019-02-09 10:58:48'),(4,1,8,1,'https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Mon%20Feb%2011%202019%2011%3A59%3A15%20GMT%2B0200%20(Eastern%20European%20Standard%20Time)?alt=media&token=7ce1b17c-cb36-48d1-b70f-d3331b3f2c51',NULL,100,'hour','20300 Kuala Terengganu, Terengganu',103.1351373,5.3287515,'Test Syrup vs Soda','2019-02-11 09:47:50','2019-03-03 11:29:21'),(5,NULL,13,0,NULL,NULL,NULL,NULL,NULL,0.0000000,0.0000000,NULL,'2019-02-12 13:56:57','2019-02-12 13:56:57'),(6,1,15,1,'https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Wed%20Feb%2013%202019%2013%3A52%3A12%20GMT%2B0100%20(heure%20normale%20d%E2%80%99Europe%20centrale)?alt=media&token=1b48d011-3645-454d-a783-e058ab3254d8',NULL,599,'hour','92500 Rueil-Malmaison, France',2.1769300,48.8827670,'Je','2019-02-13 12:45:37','2019-03-03 11:25:05'),(7,NULL,20,0,NULL,NULL,NULL,NULL,NULL,0.0000000,0.0000000,NULL,'2019-02-16 05:23:05','2019-02-16 05:23:05'),(9,NULL,24,0,NULL,NULL,NULL,NULL,NULL,0.0000000,0.0000000,NULL,'2019-02-16 11:28:35','2019-02-16 11:28:35'),(13,1,32,0,'https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Mon%20Feb%2018%202019%2014%3A57%3A31%20GMT%2B0530%20(India%20Standard%20Time)?alt=media&token=a47b7069-0373-4a9c-9eec-a4a643f8bfe0',NULL,53,'hour','Anafartalar Mahallesi, Eskicioğlu Sk. No:12, 06050 Altındağ/Ankara, Turkey',32.8602145,39.9354386,'Hahaj','2019-02-18 09:26:30','2019-03-05 10:15:53'),(14,1,34,0,'https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Mon%20Feb%2018%202019%2016%3A11%3A50%20GMT%2B0600%20(Bangladesh%20Standard%20Time)?alt=media&token=34cf0a32-c7f0-414b-b537-0cd640acbf82',NULL,10,'visit','Ring Rd, Dhaka, Bangladesh',90.3585152,23.7690501,'I\'m waiting for your server','2019-02-18 10:09:19','2019-02-18 10:11:57'),(15,1,40,0,'https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Tue%20Feb%2019%202019%2012%3A10%3A05%20GMT%2B0100%20(Central%20European%20Standard%20Time)?alt=media&token=09a70092-2b62-4b7f-a763-a7344795fb4d',NULL,124,'hour','Benediktevej 5, 4100 Ringsted, Denmark',11.7849165,55.4401200,'We do very good for you','2019-02-19 11:08:29','2019-02-19 11:10:46'),(16,NULL,43,0,NULL,NULL,NULL,NULL,NULL,0.0000000,0.0000000,NULL,'2019-02-19 16:58:44','2019-02-19 16:58:44'),(17,NULL,46,0,NULL,NULL,NULL,NULL,NULL,0.0000000,0.0000000,NULL,'2019-02-21 14:06:45','2019-02-21 14:06:45'),(18,12,47,1,'https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Fri%20Feb%2022%202019%2012%3A08%3A15%20GMT%2B0530%20(India%20Standard%20Time)?alt=media&token=15202b3a-eae1-4dea-9966-456376b51d44',NULL,25,'hour','FM1770, Winters, TX 79567, USA',-99.9072633,31.9700733,'Test','2019-02-22 06:37:05','2019-02-22 14:47:56'),(19,NULL,49,0,NULL,NULL,NULL,NULL,NULL,0.0000000,0.0000000,NULL,'2019-02-25 09:14:58','2019-02-25 09:14:58'),(20,17,52,0,'https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Wed%20Feb%2027%202019%2013%3A56%3A21%20GMT%2B0400%20(GST)?alt=media&token=19780728-6f8c-4ee9-b9f8-6ccb0bce722b',NULL,100,'hour','7 شارع البثنية - أبوظبي - الإمارات العربية المتحدة',54.3857638,24.4666330,'its me khattab','2019-02-27 09:47:40','2019-02-27 09:59:30'),(21,NULL,54,0,NULL,NULL,NULL,NULL,NULL,0.0000000,0.0000000,NULL,'2019-03-04 16:53:20','2019-03-04 16:53:20'),(22,NULL,55,0,NULL,NULL,NULL,NULL,NULL,0.0000000,0.0000000,NULL,'2019-03-04 17:24:16','2019-03-04 17:24:16'),(23,17,61,0,'https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Mon%20Mar%2011%202019%2016%3A07%3A57%20GMT%2B0530%20(India%20Standard%20Time)?alt=media&token=abdd9b3f-3140-4031-99d5-c7490ced32b9',NULL,50,'hour','A-138, Jagatpuri, Shahdara, Delhi, 110032, India',77.2993789,28.6880025,'I service engines','2019-03-11 10:36:53','2019-03-11 10:38:13'),(24,17,62,0,'https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Mon%20Mar%2011%202019%2013%3A03%3A00%20GMT%2B0200%20(Eastern%20European%20Standard%20Time)?alt=media&token=a1e90a22-31fc-4669-9249-ace4865a67f6',NULL,100,'hour','E-finance, Nile Corniche, Al Isaweyah, El-Basatin, Cairo Governorate, Egypt',31.2362457,29.9726110,'sfsfsfsvscssf','2019-03-11 11:02:11','2019-03-11 11:03:14');
/*!40000 ALTER TABLE `provider_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers_categories`
--

DROP TABLE IF EXISTS `providers_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providers_categories` (
  `provider_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `providers_categories_provider_id_category_id_unique` (`provider_id`,`category_id`),
  KEY `provider_categories_foreign_category` (`category_id`),
  CONSTRAINT `provider_categories_foreign_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `provider_categories_foreign_provider_profile` FOREIGN KEY (`provider_id`) REFERENCES `provider_profiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers_categories`
--

LOCK TABLES `providers_categories` WRITE;
/*!40000 ALTER TABLE `providers_categories` DISABLE KEYS */;
INSERT INTO `providers_categories` VALUES (1,5),(4,5),(6,5),(13,5),(14,5),(15,5),(1,22),(4,22),(6,22),(13,22),(14,22),(15,22),(18,22),(13,23),(14,23),(1,24),(4,24),(6,24),(13,24),(14,24),(15,24),(20,27),(23,27),(24,27);
/*!40000 ALTER TABLE `providers_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rating` double(8,2) NOT NULL,
  `review` varchar(140) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foreign_ratings_provider` (`provider_id`),
  KEY `foreign_ratings_user` (`user_id`),
  CONSTRAINT `foreign_ratings_provider` FOREIGN KEY (`provider_id`) REFERENCES `provider_profiles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `foreign_ratings_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (4,1.00,'خرا',4,9,'2019-02-11 10:34:09','2019-02-11 10:34:09'),(7,5.00,'Did very good job',15,41,'2019-02-19 11:29:50','2019-02-19 11:29:50');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'administrator',0),(2,'authenticated',0),(3,'customer',0),(4,'provider',0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'currency','MYR'),(2,'admin_fee_for_order_in_percent','10'),(3,'tax_in_percent','10'),(4,'support_email','admin@example.com'),(5,'support_phone','8181818118'),(6,'distance_limit','150000'),(7,'privacy_policy','aaaaaa'),(8,'about_us','aaaa'),(9,'faq','Demo FAQ');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_accounts`
--

DROP TABLE IF EXISTS `social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `provider` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_accounts_user_id_provider_provider_id_index` (`user_id`,`provider`,`provider_id`),
  CONSTRAINT `social_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_accounts`
--

LOCK TABLES `social_accounts` WRITE;
/*!40000 ALTER TABLE `social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stripe_customers`
--

DROP TABLE IF EXISTS `stripe_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stripe_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stripe_customers`
--

LOCK TABLES `stripe_customers` WRITE;
/*!40000 ALTER TABLE `stripe_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `stripe_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supports`
--

DROP TABLE IF EXISTS `supports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supports`
--

LOCK TABLES `supports` WRITE;
/*!40000 ALTER TABLE `supports` DISABLE KEYS */;
INSERT INTO `supports` VALUES (1,'Test Provider','test@pro.com','Faq not working','2019-02-14 08:19:11','2019-02-14 08:19:11'),(2,'Test User','aman.sharma.230693@gmail.com','Hi','2019-02-21 17:29:12','2019-02-21 17:29:12'),(3,'Hh','hosam231@gmail.com','Hhh','2019-02-23 18:07:21','2019-02-23 18:07:21'),(4,'Tariq Al Hosani','tah5300@gmail.com','hi, this is test m3ssage','2019-03-08 01:26:47','2019-03-08 01:26:47'),(5,'Tariq','tah5300@gmail.com','123','2019-03-08 01:53:10','2019-03-08 01:53:10');
/*!40000 ALTER TABLE `supports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_verified` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `confirmation_code` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '1',
  `fcm_registration_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_number_unique` (`mobile_number`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@example.com','$2y$10$wfSfb5yWZB6XBNbymwa.KO/YmMMB636h.7FDJr.LKqGNyC2.XACEO',NULL,'8888888888',1,1,'c25c13c5-9454-4ea4-bf29-4505acdb3faa',1,NULL,NULL,'2019-02-09 10:58:29','2019-02-09 10:58:29',NULL),(2,'Test Provider','test@pro.com','$2y$10$ycpNT0tZq0iUtdK8l5iCyOTHKq/6BnGiQeBugIGbNV55EhbyaSsuS','https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Sat%20Feb%2009%202019%2016%3A43%3A59%20GMT%2B0530%20(India%20Standard%20Time)?alt=media&token=6dfe1aa6-7e80-4052-9ffa-09ff140196c9','+919999999991',0,1,NULL,1,'03f746be-bd1d-4d4c-8360-3919e3aa30ae',NULL,'2019-02-09 10:58:48','2019-03-11 12:44:36',NULL),(4,'ahmed','ahmed_re1984@yahoo.com','$2y$10$nxhP.nkWgr2pct/9aM6.U.hAUE5/79LTo/5jgQ.qdMTKwCXRoJV0m',NULL,'+2001099060167',0,1,NULL,1,'c9e49eb6-1787-48fe-b1df-27affb1a83c3',NULL,'2019-02-09 17:21:14','2019-02-22 08:59:51',NULL),(5,'aaaa','a@a.com','$2y$10$O3lBphPw/0iCPqm/vW9lYeztR1pTHeNraw6QTPk7Gjj4yNwCcjDqC','https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Mon%20Mar%2011%202019%2020%3A46%3A30%20GMT%2B0800%20(Malaysia%20Time)?alt=media&token=90fa8b63-cfee-4777-a389-5295daa4d061','+919999999999999',0,1,NULL,1,'03f746be-bd1d-4d4c-8360-3919e3aa30ae',NULL,'2019-02-09 17:27:54','2019-03-11 12:46:34',NULL),(6,'Hh','hosam231@gmail.com','$2y$10$.hlI3Mc6RKDsQb7E/otSbeNrvVu0fJlZx.l5HLmZymVP7IvLXYZUG',NULL,'+201000425904',0,1,NULL,1,'b961e3e8-04f6-4b5e-9596-69ad811dc4c3',NULL,'2019-02-09 17:48:16','2019-02-09 17:48:36',NULL),(8,'ahmed hendawy','ahmed.adel.hendawy@gmail.com','$2y$10$7GWnZd3WRnO.FJOFHjMVaex1fERQui0W8thTY1MfRY9Q1IccuFPYW',NULL,'+2001129924366',0,1,NULL,1,'87b82bc3-6ed3-480f-a5bd-a01b6f0e45e8',NULL,'2019-02-11 09:47:50','2019-02-11 09:50:49',NULL),(9,'Abduallah Kotb Ibrahim','abduallahkotb73@gmail.com','$2y$10$iUeExBEBBEwXvOxxNPWLCOKEsS/711gpyRU52cr7UX1eKkBaZZFzy',NULL,'+2000201550432201',0,1,NULL,1,'0dd92106-bd59-4f6f-b067-b5e77b77e6d9',NULL,'2019-02-11 09:58:01','2019-02-11 10:26:15',NULL),(10,'Mohamed Gamal','emarketbank@gmail.com','$2y$10$wrfbxN9PBJEfj3BP1gxyBemxuUwWKmRYnhqIjeOm9owItJfZdGOZC','https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Tue%20Mar%2005%202019%2018%3A41%3A44%20GMT%2B0200%20(Eastern%20European%20Standard%20Time)?alt=media&token=f297de62-7ae8-4eb2-a077-8b19903c6dc5','+2001289172008',0,1,NULL,1,'f73d5a00-a1a5-4e71-85c3-4764b4690aec',NULL,'2019-02-11 10:20:29','2019-03-05 16:41:01',NULL),(11,'body','body@gmail.com','$2y$10$D2fz7j3AM8entWqTW1AGzeI5zPam1m1NkQN/VH8u.3ghanFDwmr/O',NULL,'+2001550432201',0,1,NULL,1,NULL,NULL,'2019-02-11 10:25:17','2019-02-11 10:25:17',NULL),(12,'Norazak Zaha Zainal Abidin','xpertsquad@gmail.com','$2y$10$HrhbQIRjeTn7W4ituQ9gJ.N.Ry.t8FBSQhvH5WIqkNcvfEJiLnxUG',NULL,'+910133922412',0,1,NULL,1,NULL,NULL,'2019-02-12 05:52:06','2019-02-12 05:52:06',NULL),(13,'Digit Tamao','digitamao@gmail.com','$2y$10$BRaHxsB2zOpmou1Volwuyu7bbMveioJfDCG1N6NItrefdhMLkflZG',NULL,'+600167332330',0,1,NULL,1,NULL,NULL,'2019-02-12 13:56:57','2019-02-12 13:56:57',NULL),(14,'ابو يحيى','fl2006@hotmail.com','$2y$10$M9pQwU5Z1Jrs6sb1P6FmyODrwe8LpED0FlZP.ajyJcIFp2yOt1nSe',NULL,'+9620796699093',0,1,NULL,1,NULL,NULL,'2019-02-13 09:32:37','2019-02-13 09:32:37',NULL),(15,'Abdou','ab@gmail.com','$2y$10$ollJFxYN.SqlRLxwz0WRpe6mT2V08d5g57KzxBy0tIK0aTVRJBH..',NULL,'+33601849217',0,1,NULL,1,'3350e6d6-d7d4-47eb-9cc8-1b764fde5e36',NULL,'2019-02-13 12:45:37','2019-02-13 12:46:08',NULL),(16,'biznes less','biznesless7@gmail.com','$2y$10$iNCasAoQaEokth9GZh5EK.ZNQSlI7s8tDNa9nROsnd.SJKdVmgp2u',NULL,'+330601849217',0,1,NULL,1,NULL,NULL,'2019-02-13 12:55:34','2019-02-13 12:55:34',NULL),(17,'One more user','one@more.com','$2y$10$cZnWqSZIVLkBjFWKOd/BYud4Fd9BuRU.42W8QGhuAS.tANEzW/VNy',NULL,'+919560873006',0,1,NULL,1,'730aa66b-0700-4b75-bb3b-34cb53849386',NULL,'2019-02-13 16:44:04','2019-02-13 16:44:25',NULL),(18,'Bhushan','bhushanbjain@gmail.com','$2y$10$jZA35FWoWBithwhl2KuPLe3QrmWAbQJt.IncR7DnPusPoURbmYlpq',NULL,'+9199999999999',0,1,NULL,1,NULL,NULL,'2019-02-14 10:18:24','2019-02-14 10:18:24',NULL),(19,'Muhammad Arslan','aralan_mecom@yahoo.com','$2y$10$kL/X.KgoSq.Ls3mHyk5j/ezQN8Bzlv6Gyh4E9GLr5YWoo0YF1Kidm',NULL,'+46721470089',0,1,NULL,1,'e2a07e8a-a288-4319-872c-2cd7ddd45ee5',NULL,'2019-02-14 17:58:21','2019-02-14 17:58:38',NULL),(20,'fgbgb','sumitkumar@gmail.com','$2y$10$zUZsV4RtXaV3obz74ReyuuUebpfSVVNjrT4pPsgXLbEXJbtnnbM3K',NULL,'+91vfvfv',0,1,NULL,1,NULL,NULL,'2019-02-16 05:23:05','2019-02-16 05:23:05',NULL),(21,'Sumit','sumit@gmail.com','$2y$10$ocqPC4pcV8X8xV4I4B8nveuou.TIVuqdMPObtmAddlZZuSLUJCcKu','https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Sat%20Feb%2016%202019%2015%3A10%3A51%20GMT%2B0530%20(India%20Standard%20Time)?alt=media&token=b80f0940-bd14-4b07-922a-7582183ef308','+919643148746',0,1,NULL,1,NULL,NULL,'2019-02-16 09:37:52','2019-02-16 09:41:12',NULL),(24,'Sumit','sumitkumar7275@gmail.com','$2y$10$VifOuDB9nhqEzVQmWBfzE.H0HUVpsrc9we7vHiE5Fdr4/8547qTGO',NULL,'+91+919643148746',0,1,NULL,1,NULL,NULL,'2019-02-16 11:28:35','2019-02-16 11:28:35',NULL),(25,'ابو سحية','ffawh@hotmail.com','$2y$10$IUrLtaUFx4cpK3oDqVkPne1Pz6lX8OyrJRrJdW/1TMCHOhazq6.3a',NULL,'+919999999999',0,1,NULL,1,NULL,NULL,'2019-02-16 13:15:28','2019-02-16 13:15:28',NULL),(26,'Aaaaaaa','a@y.com','$2y$10$zs3StqJSiN/9nVlye596y.AvlQzLUqUI1jR147TOBcIMWm3TWb74q',NULL,'+2000201099060167',0,1,NULL,1,NULL,NULL,'2019-02-17 08:36:16','2019-02-17 08:36:16',NULL),(27,'Prashant Gupta','Prashant4630@gmail.com','$2y$10$zVTHFEPzS/fzJDY7jNACbudTTXfn6902K/e62uwD69KE9/egOEU2q',NULL,'+919540443424',0,1,NULL,1,'2082d0e9-a002-48f3-b4e4-3d17bfc003f8',NULL,'2019-02-18 08:46:37','2019-02-18 08:48:07',NULL),(32,'Prachi Gupta','prachi27g@gmail.com','$2y$10$Rkvgtxe9rLnb8qoeSfUjheaxsPDjOlapV0cm5f7um08Ln7NbtUot.',NULL,'+917617668705',0,1,NULL,1,'ac9129d7-6f6c-4142-bcb5-cb6e9dc6b308',NULL,'2019-02-18 09:26:30','2019-02-18 09:26:51',NULL),(33,'Md nayeem','nayeem.edu@gmail.com','$2y$10$wi.6lKtWK7RTGzMrMj0MUOLi9N5gCNLcOt/UXldlUuX/M97ZokMWe',NULL,'+8801764926694',0,1,NULL,1,'2acc3359-d54c-45c8-a7da-5a74d6d3116a',NULL,'2019-02-18 09:54:26','2019-02-18 09:55:15',NULL),(34,'abdul kahar Nayeem','nayeem.edu01@gmail.com','$2y$10$pTyldUdRpLSGyxhY0k8CyeAu/WhX7NJCgRH61wMa4lNZGw5Tp2J7y',NULL,'+8801723611125',0,1,NULL,1,'2acc3359-d54c-45c8-a7da-5a74d6d3116a',NULL,'2019-02-18 10:09:19','2019-02-18 10:10:00',NULL),(35,'Aman Sharma','dimpiisback@gmail.com','$2y$10$TvgC8whuH5GIa/cP8zH5XOGs6JMmRU7Xm57Qn8CylcweVFjw84Lpy',NULL,'+919654666210',0,1,NULL,1,'859de042-e502-49e6-ab88-a4b2b85e07b2',NULL,'2019-02-18 11:21:27','2019-02-18 11:22:02',NULL),(36,'Teste','djsjejsk@djdjdm.com','$2y$10$zW1Q.J29myQ95TuperWua.EF2v1vNwC7aj50TTTRCILRqdrTba0W2',NULL,'+91999999999',0,1,NULL,1,NULL,NULL,'2019-02-18 16:45:37','2019-02-18 16:45:37',NULL),(37,'teste','williammenezes510@gmail.com','$2y$10$3HwCQwrgHUKuDiWVjKck7u7WlGmf56wHDOLS79QOnFLySzB1sZLx6',NULL,'+5581987914909',0,1,NULL,1,NULL,NULL,'2019-02-18 16:48:51','2019-02-18 16:48:51',NULL),(38,'teste55','william.menezes@conductor.com.br','$2y$10$PVaIqpM3no8FR2v1GXCJZ.yuliHpUgTZbnS74zwmQrh5UaKfnh/D.','https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Mon%20Feb%2018%202019%2013%3A52%3A42%20GMT-0300%20(Hor%C3%A1rio%20Padr%C3%A3o%20de%20Bras%C3%ADlia)?alt=media&token=2f061424-1720-4c43-8e74-561b66c79e62','+5583987914909',0,1,NULL,1,'d949e371-749f-4826-a007-b71c40507975',NULL,'2019-02-18 16:51:19','2019-02-18 16:52:48',NULL),(40,'Mosa','havall88@hotmail.com','$2y$10$.QfGmUcXqbb/eVyr4tZdE.MFcOhKr5/oIuAJ7SbFlLYfmsc5OCFEW','https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Tue%20Feb%2019%202019%2012%3A10%3A32%20GMT%2B0100%20(Central%20European%20Standard%20Time)?alt=media&token=9b2ce8b8-9d33-4511-b918-b3fe679fcca8','+4542415641',0,1,NULL,1,'7d253815-f063-4f00-ae19-4fe79ce79646',NULL,'2019-02-19 11:08:29','2019-02-19 11:10:38',NULL),(41,'Masti','mohasaeed.ms@gmail.com','$2y$10$UWJhgbCEuqAabFIUq/AWguuvmPG.vtofxbJkYfXMCo5EMdPdKLQPK',NULL,'+4541588354',0,1,NULL,1,'7d253815-f063-4f00-ae19-4fe79ce79646',NULL,'2019-02-19 11:15:16','2019-02-19 11:18:19',NULL),(42,'Viv Mendes','vivaldo.mendes@mwangobrain.co.ao','$2y$10$cHcU9RKOx41ixgHi5vgNZuEt9Jx.lDw2V0HPmSfUgJdoa4DL/uoZy',NULL,'+244941573102',0,1,NULL,1,'a13517f9-4ea8-4562-a7ea-86f36cb6afa1',NULL,'2019-02-19 11:26:06','2019-02-19 11:26:29',NULL),(43,'Babar Kiani','mabkiani36@gmail.com','$2y$10$aILq0mIYeNQ9xBC0wgU4u.tzG0B6c13VOj9DwIre6.0HBgR3mpHm.','https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Tue%20Feb%2019%202019%2022%3A12%3A53%20GMT%2B0500%20(PKT)?alt=media&token=5d98b9a9-b07a-4ebd-8bc4-5d3a512e0eb8','+923245749454',0,1,NULL,1,'e7e15705-ca18-401b-a43c-f32f25f21b85',NULL,'2019-02-19 16:58:44','2019-02-19 17:13:07',NULL),(44,'Bk','mabkiani36@hotmail.com','$2y$10$eOKSRQwFD25JUHG37Bb3N.TxGy7xt.dBRIrwyTI/bwHgMv1o1x5va',NULL,'+92+923245749454',0,1,NULL,1,NULL,NULL,'2019-02-21 09:42:55','2019-02-21 09:42:55',NULL),(45,'Mab Kiani','mab_kiani@hotmail.com','$2y$10$vek1eNbRNU5cmL4K2eKoZOFCK3xxbh.TElaQ9Abapen.Mm/EWtVDa',NULL,'+923143002655',0,1,NULL,1,'e7e15705-ca18-401b-a43c-f32f25f21b85',NULL,'2019-02-21 13:41:32','2019-02-21 13:42:04',NULL),(46,'Tesr','tesr@rrf.hh','$2y$10$Iq9XzGMnL940hG3DhSPbq.qVJbS.XxWkFhTKxo6ChXWzTCR9.PRsK',NULL,'+9166',0,1,NULL,1,NULL,NULL,'2019-02-21 14:06:45','2019-02-21 14:06:45',NULL),(47,'Test','test@test.com','$2y$10$AnDInHyx9audOsc0etREq.tGZbP5vKzvYwhsaqEgx4/gwKSP9crSG',NULL,'+917878545750',0,1,NULL,1,'42f15176-2fc6-4bd4-9a93-b925d7b10cf9',NULL,'2019-02-22 06:37:05','2019-02-22 06:37:22',NULL),(48,'Aniceto D\'Carvalho','anicetojjc@gmail.com','$2y$10$K5BWSGVC2xVNLd/2So5yQu9SI.MU0l8NV/1Pdg7cZG8PVjSYah.9C',NULL,'+244945193669',0,1,NULL,1,'04e3188c-492a-4399-96a4-20438d49efd0',NULL,'2019-02-24 11:31:52','2019-02-24 11:32:14',NULL),(49,'Viv Mendes','viv.vivaldomendes@gmail.com','$2y$10$YGYLQzHHAZ2swwIhDiuwKu3ONJY3walEAohGQRzk2N4W8qkIcq9oG',NULL,'+244+244941573102',0,1,NULL,1,NULL,NULL,'2019-02-25 09:14:58','2019-02-25 09:14:58',NULL),(52,'khattab','creative@0g.ae','$2y$10$C3wtVE7blFAAZN8mnHSwPuRaC2q9frwNjDZNj0S/Y3f6wCO50oVTG','https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Wed%20Feb%2027%202019%2013%3A54%3A16%20GMT%2B0400%20(GST)?alt=media&token=58488123-0d3a-4e2d-8815-854bbbd50b3a','+971563429813',0,1,NULL,1,'3a99c9b3-5f00-4388-b7a2-dc2891246466',NULL,'2019-02-27 09:47:40','2019-02-27 09:54:22',NULL),(53,'afiqon','afiqon@gmail.com','123456',NULL,'0143316248',0,1,NULL,1,NULL,NULL,'2019-03-03 17:38:20','2019-03-03 17:38:20',NULL),(54,'Test Provider','provider@example.com','$2y$10$gHcTSFeQPNrr1aV2WMEfF.T4MOnLdJ2FMRPccpn5Bwn/qcjTwKGIG',NULL,'8282828282',0,1,NULL,1,NULL,NULL,'2019-03-04 16:53:20','2019-03-04 16:53:20',NULL),(55,'test','test@driver.com','$2y$10$hI009IFOrJVBv8GKPaI6C.u2IXdIFc46BY.rXDx9iva6ai42FAX3e',NULL,'+918888888888',0,1,NULL,1,NULL,NULL,'2019-03-04 17:24:16','2019-03-04 17:24:16',NULL),(56,'Verbose','verbosetechnologies@gmail.com','$2y$10$YAmNrcJ9OcZK2rN/EjSDw.oep14zvXGlMy6OleIs/LBp85XbpyFYC',NULL,'+919456001007',0,1,NULL,1,'d57ef9ce-f6a5-4fc2-a973-68650cda8d2b',NULL,'2019-03-06 08:12:38','2019-03-06 08:13:23',NULL),(59,'Tariq','tah5300@gmail.com','$2y$10$Oq/JPuN0tO31h5aTym5HCeTTTW5nk/bmU2Cc1CIYoIeXoGM1sKCRa','https://firebasestorage.googleapis.com/v0/b/handyman-47f5a.appspot.com/o/Fri%20Mar%2008%202019%2010%3A55%3A17%20GMT%2B0900%20(Korean%20Standard%20Time)?alt=media&token=389fd567-5ff6-45f6-802f-19b84551c74c','+971502996299',0,1,NULL,1,'0c5f0706-aa2b-494d-9f73-13d49e601d8f',NULL,'2019-03-08 01:50:49','2019-03-08 01:55:26',NULL),(60,'Test user','test@egypt.com','$2y$10$V9x609UGTccSDou54LPHWuB0hppqu/B5U83RAmEUkW72n.f9yGdye',NULL,'+209999999999',0,1,NULL,1,NULL,NULL,'2019-03-11 10:21:56','2019-03-11 10:21:56',NULL),(61,'Test Provider','testp@egypt.com','$2y$10$ah2gZggmoyedm9WCuabcmufFH3HDHf2IGjspokuFTGXYU7sBVhPX.',NULL,'+209876543210',0,1,NULL,1,'859de042-e502-49e6-ab88-a4b2b85e07b2',NULL,'2019-03-11 10:36:53','2019-03-11 10:37:04',NULL),(62,'Mohamed Gamal','tesssst@gmail.com','$2y$10$LUH.G.WckeBqpm1z07ckYeH64WKumHfG8OOd0NBIc3jNdu1C/caJ.',NULL,'+2001151372064',0,1,NULL,1,'bc7fde4a-d47c-4a33-b67d-83186aac0091',NULL,'2019-03-11 11:02:11','2019-03-11 11:02:26',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `users_roles_user_id_role_id_unique` (`user_id`,`role_id`),
  KEY `foreign_role` (`role_id`),
  CONSTRAINT `foreign_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `foreign_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(53,1),(4,3),(5,3),(6,3),(9,3),(10,3),(11,3),(12,3),(14,3),(16,3),(17,3),(18,3),(19,3),(21,3),(25,3),(26,3),(27,3),(33,3),(35,3),(36,3),(37,3),(38,3),(41,3),(42,3),(44,3),(45,3),(48,3),(56,3),(59,3),(60,3),(2,4),(8,4),(13,4),(15,4),(20,4),(24,4),(32,4),(34,4),(40,4),(43,4),(46,4),(47,4),(49,4),(52,4),(54,4),(55,4),(61,4),(62,4);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-11 13:23:54
