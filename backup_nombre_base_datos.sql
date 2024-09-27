-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: database.c3aem6q8kqy0.eu-west-3.rds.amazonaws.com    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.35

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `component_type_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `component_component_type_id_foreign` (`component_type_id`),
  CONSTRAINT `component_component_type_id_foreign` FOREIGN KEY (`component_type_id`) REFERENCES `component_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
INSERT INTO `component` VALUES (1,'2024-09-24 15:16:48','2024-09-24 15:16:48','Page','Page',1),(3,'2024-09-24 15:16:48','2024-09-24 15:16:48','card 1','card component',3),(4,'2024-09-24 15:16:48','2024-09-24 15:16:48','title h1','title component',4),(5,'2024-09-24 15:16:48','2024-09-24 15:16:48','text p','text component',4),(6,'2024-09-24 15:16:48','2024-09-24 15:16:48','img component','img',5),(8,'2024-09-24 19:33:48','2024-09-24 19:33:48','button','button',7),(9,'2024-09-25 18:16:53','2024-09-25 18:16:53','image3d','image3d',8),(10,'2024-09-25 18:23:36','2024-09-25 18:23:37','codeplayground_v2','codeplayground_v2',9),(11,'2024-09-26 15:49:00','2024-09-26 15:55:20','grid','grid',2),(12,'2024-09-26 15:55:34','2024-09-26 15:55:34','Page','Page',1);
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component_attribute`
--

DROP TABLE IF EXISTS `component_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component_attribute` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `component_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `component_attribute_component_id_foreign` (`component_id`),
  CONSTRAINT `component_attribute_component_id_foreign` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component_attribute`
--

LOCK TABLES `component_attribute` WRITE;
/*!40000 ALTER TABLE `component_attribute` DISABLE KEYS */;
INSERT INTO `component_attribute` VALUES (1,'2024-09-24 15:16:48','2024-09-24 19:35:16','styles','w-full max-w-screen-xl mx-auto p-5',1),(3,'2024-09-24 15:16:48','2024-09-25 18:19:00','styles','w-full p-4 rounded-md bg-bgSeco border-l-4 border-primary',3),(4,'2024-09-24 15:16:48','2024-09-24 19:32:40','styles','font-semibold text-3xl md:text-4xl xl:text-5xl  text-textPrimary',4),(5,'2024-09-24 15:16:48','2024-09-26 01:10:39','text_label','titleghjhh',4),(6,'2024-09-24 15:16:48','2024-09-24 19:32:49','styles','text-textSecondary mt-2 leading-relaxed whitespace-pre-line',5),(7,'2024-09-24 15:16:48','2024-09-24 15:16:48','text_label','text',5),(8,'2024-09-24 15:16:48','2024-09-24 15:16:48','styles','w-full h-full',6),(9,'2024-09-24 15:16:48','2024-09-24 15:16:48','url','day92-freelancing.svg',6),(19,'2024-09-24 19:33:48','2024-09-26 16:07:07','styles','relative m-0  rounded-none bg-transparent  shadow-none w-full',8),(20,'2024-09-24 19:33:48','2024-09-26 16:07:29','styles_button','relative m-0  rounded-none bg-transparent  shadow-none w-full',8),(21,'2024-09-24 19:33:48','2024-09-24 19:33:48','label','button',8),(22,'2024-09-24 19:33:48','2024-09-24 19:33:48','url','www.google.com',8),(23,'2024-09-25 18:16:53','2024-09-25 18:16:53','styles','p-4 relative m-0  rounded-none bg-transparent  shadow-none ',9),(24,'2024-09-25 18:16:53','2024-09-25 18:16:53','img_url','p-4 relative m-0  rounded-none bg-transparent  shadow-none ',9),(25,'2024-09-25 18:16:53','2024-09-25 18:16:53','img_bg_url','p-4 relative m-0  rounded-none bg-transparent  shadow-none ',9),(26,'2024-09-25 18:23:37','2024-09-25 18:23:37','styles','w-full',10),(27,'2024-09-25 18:23:37','2024-09-25 18:41:08','html','null',10),(28,'2024-09-25 18:23:37','2024-09-25 18:41:08','css','null',10),(29,'2024-09-25 18:23:37','2024-09-25 18:41:08','js','null',10),(30,'2024-09-25 18:23:37','2024-09-25 18:30:11','height','h-[500px]',10),(31,'2024-09-25 18:23:37','2024-09-25 18:23:37','bg_color_1','bg-[#151528]',10),(32,'2024-09-25 18:23:37','2024-09-25 18:23:37','bg_color_2','bg-[#2A2A50]',10),(33,'2024-09-25 18:23:37','2024-09-25 18:23:37','text_color_1','text-[#d8d6ff]',10),(34,'2024-09-25 18:23:37','2024-09-25 18:23:37','text_color_2','text-[#7e73a2]',10),(35,'2024-09-25 18:23:37','2024-09-25 18:23:37','rounded','rounded-lg',10),(36,'2024-09-26 15:49:00','2024-09-26 16:13:15','styles','border h-10',11),(37,'2024-09-26 15:55:34','2024-09-26 16:13:46','styles','w-full max-w-screen-xl mx-auto p-5 bg-purple-500 h-min',12);
/*!40000 ALTER TABLE `component_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component_type`
--

DROP TABLE IF EXISTS `component_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component_type`
--

LOCK TABLES `component_type` WRITE;
/*!40000 ALTER TABLE `component_type` DISABLE KEYS */;
INSERT INTO `component_type` VALUES (1,'2024-09-24 15:16:48','2024-09-24 15:16:48','page','type page'),(2,'2024-09-24 15:16:48','2024-09-24 15:16:48','grid','type grid'),(3,'2024-09-24 15:16:48','2024-09-24 15:16:48','card','desc'),(4,'2024-09-24 15:16:48','2024-09-24 15:16:48','text','desc'),(5,'2024-09-24 15:16:48','2024-09-24 15:16:48','img','desc'),(6,'2024-09-24 19:28:58','2024-09-24 19:28:58','codeplayground_v2','desc'),(7,'2024-09-24 19:33:48','2024-09-24 19:33:48','button','button'),(8,'2024-09-25 18:16:53','2024-09-25 18:16:53','image3d','image3d'),(9,'2024-09-25 18:23:37','2024-09-25 18:23:37','codeplayground_v2','desc');
/*!40000 ALTER TABLE `component_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
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
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint unsigned DEFAULT NULL,
  `post_content_id` bigint unsigned DEFAULT NULL,
  `component_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_post_id_foreign` (`post_id`),
  KEY `images_post_content_id_foreign` (`post_content_id`),
  KEY `images_component_id_foreign` (`component_id`),
  CONSTRAINT `images_component_id_foreign` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`) ON DELETE CASCADE,
  CONSTRAINT `images_post_content_id_foreign` FOREIGN KEY (`post_content_id`) REFERENCES `post_contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `images_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_12_15_003335_create_post_categories_table',1),(6,'2022_12_15_003335_create_post_content_types_table',1),(7,'2022_12_15_003336_create_clients_table',1),(8,'2022_12_15_003336_create_post_content_type_attributes_table',1),(9,'2022_12_15_003336_create_posts_table',1),(10,'2022_12_15_003337_create_post_contents_table',1),(11,'2022_12_15_003338_create_post_content_attributes_table',1),(12,'2022_12_15_003338_create_post_subcontents_table',1),(13,'2023_01_24_150529_create_post_tags_table',1),(14,'2023_01_24_150530_create_posts_tags_table',1),(15,'2023_01_24_150536_cretae_post_comments_table',1),(16,'2023_06_07_224956_create_permission_tables',1),(17,'2024_01_13_210601_post_content_attributes_custom',1),(18,'2024_01_15_211128_post',1),(19,'2024_01_15_211129_component_type',1),(20,'2024_01_15_211130_component',1),(21,'2024_01_15_211137_post_component',1),(22,'2024_01_15_211151_component_attribute',1),(23,'2024_01_15_211152_post_component_attribute',1),(24,'2024_01_15_211306_subcomponent',1),(25,'2024_01_15_211308_subcomponent_attribute',1),(26,'2024_01_15_211309_create_posts_images_table',1),(27,'2024_01_19_170625_relation_subcomponents',1),(28,'2024_01_24_000505_add_order_to_subcomponent_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `post_category_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_client_id_foreign` (`client_id`),
  KEY `post_user_id_foreign` (`user_id`),
  KEY `post_post_category_id_foreign` (`post_category_id`),
  CONSTRAINT `post_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_post_category_id_foreign` FOREIGN KEY (`post_category_id`) REFERENCES `post_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'2024-09-24 15:16:48','2024-09-25 21:32:31','local Building a Magical 3D Button','subname','Bet you can\'t click just once!',NULL,NULL,1),(2,'2024-09-26 15:48:38','2024-09-26 15:48:38','slack page','subname','desc',NULL,1,1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,'2024-09-24 15:16:48','2024-09-24 15:16:48','cat1','desc','img');
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_comments`
--

DROP TABLE IF EXISTS `post_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comments_post_id_foreign` (`post_id`),
  KEY `post_comments_client_id_foreign` (`client_id`),
  KEY `post_comments_user_id_foreign` (`user_id`),
  CONSTRAINT `post_comments_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_comments`
--

LOCK TABLES `post_comments` WRITE;
/*!40000 ALTER TABLE `post_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_component`
--

DROP TABLE IF EXISTS `post_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_component` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `component_id` bigint unsigned DEFAULT NULL,
  `post_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_component_component_id_foreign` (`component_id`),
  KEY `post_component_post_id_foreign` (`post_id`),
  CONSTRAINT `post_component_component_id_foreign` FOREIGN KEY (`component_id`) REFERENCES `component` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_component_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_component`
--

LOCK TABLES `post_component` WRITE;
/*!40000 ALTER TABLE `post_component` DISABLE KEYS */;
INSERT INTO `post_component` VALUES (1,NULL,NULL,1,1),(3,NULL,NULL,12,2);
/*!40000 ALTER TABLE `post_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_component_attribute`
--

DROP TABLE IF EXISTS `post_component_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_component_attribute` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `post_component_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_component_attribute_post_component_id_foreign` (`post_component_id`),
  CONSTRAINT `post_component_attribute_post_component_id_foreign` FOREIGN KEY (`post_component_id`) REFERENCES `post_component` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_component_attribute`
--

LOCK TABLES `post_component_attribute` WRITE;
/*!40000 ALTER TABLE `post_component_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_component_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_content_attributes`
--

DROP TABLE IF EXISTS `post_content_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_content_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `post_content_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_content_attributes_post_content_id_foreign` (`post_content_id`),
  CONSTRAINT `post_content_attributes_post_content_id_foreign` FOREIGN KEY (`post_content_id`) REFERENCES `post_contents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_content_attributes`
--

LOCK TABLES `post_content_attributes` WRITE;
/*!40000 ALTER TABLE `post_content_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_content_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_content_attributes_custom`
--

DROP TABLE IF EXISTS `post_content_attributes_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_content_attributes_custom` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `post_content_id` bigint unsigned DEFAULT NULL,
  `post_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_content_attributes_custom_post_content_id_foreign` (`post_content_id`),
  KEY `post_content_attributes_custom_post_id_foreign` (`post_id`),
  CONSTRAINT `post_content_attributes_custom_post_content_id_foreign` FOREIGN KEY (`post_content_id`) REFERENCES `post_contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_content_attributes_custom_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_content_attributes_custom`
--

LOCK TABLES `post_content_attributes_custom` WRITE;
/*!40000 ALTER TABLE `post_content_attributes_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_content_attributes_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_content_type_attributes`
--

DROP TABLE IF EXISTS `post_content_type_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_content_type_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_content_type_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_content_type_attributes_post_content_type_id_foreign` (`post_content_type_id`),
  CONSTRAINT `post_content_type_attributes_post_content_type_id_foreign` FOREIGN KEY (`post_content_type_id`) REFERENCES `post_content_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_content_type_attributes`
--

LOCK TABLES `post_content_type_attributes` WRITE;
/*!40000 ALTER TABLE `post_content_type_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_content_type_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_content_types`
--

DROP TABLE IF EXISTS `post_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_content_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_content_types`
--

LOCK TABLES `post_content_types` WRITE;
/*!40000 ALTER TABLE `post_content_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_contents`
--

DROP TABLE IF EXISTS `post_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_contents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_id` bigint unsigned DEFAULT NULL,
  `post_content_type_id` bigint unsigned DEFAULT NULL,
  `post_content_id` bigint unsigned DEFAULT NULL,
  `recycled_id` bigint unsigned DEFAULT NULL,
  `copied_id` bigint unsigned DEFAULT NULL,
  `global` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_contents_post_id_foreign` (`post_id`),
  KEY `post_contents_post_content_type_id_foreign` (`post_content_type_id`),
  KEY `post_contents_post_content_id_foreign` (`post_content_id`),
  CONSTRAINT `post_contents_post_content_id_foreign` FOREIGN KEY (`post_content_id`) REFERENCES `post_contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_contents_post_content_type_id_foreign` FOREIGN KEY (`post_content_type_id`) REFERENCES `post_content_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_contents_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_contents`
--

LOCK TABLES `post_contents` WRITE;
/*!40000 ALTER TABLE `post_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_subcontents`
--

DROP TABLE IF EXISTS `post_subcontents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_subcontents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content_child_id` bigint unsigned DEFAULT NULL,
  `content_parent_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_subcontents_content_child_id_foreign` (`content_child_id`),
  KEY `post_subcontents_content_parent_id_foreign` (`content_parent_id`),
  CONSTRAINT `post_subcontents_content_child_id_foreign` FOREIGN KEY (`content_child_id`) REFERENCES `post_contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_subcontents_content_parent_id_foreign` FOREIGN KEY (`content_parent_id`) REFERENCES `post_contents` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_subcontents`
--

LOCK TABLES `post_subcontents` WRITE;
/*!40000 ALTER TABLE `post_subcontents` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_subcontents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `post_category_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_client_id_foreign` (`client_id`),
  KEY `posts_user_id_foreign` (`user_id`),
  KEY `posts_post_category_id_foreign` (`post_category_id`),
  CONSTRAINT `posts_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_post_category_id_foreign` FOREIGN KEY (`post_category_id`) REFERENCES `post_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_tags`
--

DROP TABLE IF EXISTS `posts_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned DEFAULT NULL,
  `post_tag_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_tags_post_id_foreign` (`post_id`),
  KEY `posts_tags_post_tag_id_foreign` (`post_tag_id`),
  CONSTRAINT `posts_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_tags_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_tags`
--

LOCK TABLES `posts_tags` WRITE;
/*!40000 ALTER TABLE `posts_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_subcomponent`
--

DROP TABLE IF EXISTS `relation_subcomponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relation_subcomponent` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subcomponent_related_id` bigint unsigned NOT NULL,
  `subcomponent_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relation_subcomponent_subcomponent_related_id_foreign` (`subcomponent_related_id`),
  KEY `relation_subcomponent_subcomponent_id_foreign` (`subcomponent_id`),
  CONSTRAINT `relation_subcomponent_subcomponent_id_foreign` FOREIGN KEY (`subcomponent_id`) REFERENCES `subcomponent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relation_subcomponent_subcomponent_related_id_foreign` FOREIGN KEY (`subcomponent_related_id`) REFERENCES `subcomponent` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_subcomponent`
--

LOCK TABLES `relation_subcomponent` WRITE;
/*!40000 ALTER TABLE `relation_subcomponent` DISABLE KEYS */;
INSERT INTO `relation_subcomponent` VALUES (16,19,18,NULL,NULL),(19,22,18,NULL,NULL),(43,50,48,NULL,NULL),(44,51,48,NULL,NULL),(45,52,50,NULL,NULL),(46,53,50,NULL,NULL),(47,54,50,NULL,NULL),(48,55,50,NULL,NULL),(49,56,51,NULL,NULL),(52,59,51,NULL,NULL),(53,60,51,NULL,NULL),(55,62,49,NULL,NULL),(56,63,49,NULL,NULL),(57,64,63,NULL,NULL);
/*!40000 ALTER TABLE `relation_subcomponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'superadmin','api','2024-09-24 15:16:48','2024-09-24 15:16:48'),(2,'admin','api','2024-09-24 15:16:48','2024-09-24 15:16:48'),(3,'user','api','2024-09-24 15:16:48','2024-09-24 15:16:48');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcomponent`
--

DROP TABLE IF EXISTS `subcomponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcomponent` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `component_child_id` bigint unsigned DEFAULT NULL,
  `component_parent_id` bigint unsigned DEFAULT NULL,
  `subcomponent_id` bigint unsigned DEFAULT NULL,
  `order` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subcomponent_component_child_id_foreign` (`component_child_id`),
  KEY `subcomponent_component_parent_id_foreign` (`component_parent_id`),
  CONSTRAINT `subcomponent_component_child_id_foreign` FOREIGN KEY (`component_child_id`) REFERENCES `component` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subcomponent_component_parent_id_foreign` FOREIGN KEY (`component_parent_id`) REFERENCES `component` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcomponent`
--

LOCK TABLES `subcomponent` WRITE;
/*!40000 ALTER TABLE `subcomponent` DISABLE KEYS */;
INSERT INTO `subcomponent` VALUES (5,'2024-09-24 15:49:19','2024-09-24 15:49:19',4,3,NULL,1),(14,'2024-09-24 19:31:49','2024-09-24 19:31:49',4,NULL,12,1),(15,'2024-09-24 19:31:57','2024-09-24 19:31:57',5,NULL,12,2),(16,'2024-09-24 19:34:11','2024-09-25 18:32:34',5,NULL,13,0),(17,'2024-09-24 19:34:11','2024-09-25 18:32:34',8,NULL,13,1),(18,'2024-09-24 19:34:11','2024-09-25 18:32:34',3,NULL,13,2),(19,'2024-09-24 19:34:11','2024-09-25 18:21:16',4,NULL,18,0),(22,'2024-09-25 18:20:44','2024-09-25 18:21:16',5,NULL,18,1),(23,'2024-09-25 18:22:15','2024-09-25 18:32:34',4,NULL,13,3),(24,'2024-09-25 18:22:47','2024-09-25 18:32:34',5,NULL,13,4),(26,'2024-09-25 18:23:47','2024-09-25 18:32:34',10,NULL,13,5),(27,'2024-09-25 18:24:09','2024-09-25 18:32:34',4,NULL,13,6),(28,'2024-09-25 18:24:32','2024-09-25 18:32:34',5,NULL,13,7),(29,'2024-09-25 18:24:51','2024-09-25 18:32:51',5,NULL,13,8),(30,'2024-09-25 18:25:07','2024-09-25 18:32:34',10,NULL,13,12),(31,'2024-09-25 18:25:37','2024-09-25 18:32:36',5,NULL,13,10),(32,'2024-09-25 18:25:57','2024-09-25 18:32:36',5,NULL,13,11),(33,'2024-09-25 18:26:14','2024-09-25 18:32:52',10,NULL,13,9),(34,'2024-09-25 18:34:44','2024-09-25 18:34:44',5,NULL,13,14),(35,'2024-09-25 18:34:44','2024-09-25 18:34:44',10,NULL,13,15),(36,'2024-09-25 18:34:44','2024-09-25 18:34:44',4,NULL,13,16),(40,'2024-09-25 18:37:32','2024-09-25 18:37:32',10,NULL,13,17),(41,'2024-09-25 18:37:32','2024-09-25 18:37:32',10,NULL,13,18),(42,'2024-09-25 18:38:12','2024-09-25 18:38:12',10,NULL,13,19),(43,'2024-09-25 18:54:04','2024-09-25 18:54:04',4,NULL,13,20),(48,'2024-09-26 15:56:18','2024-09-26 15:56:18',11,12,NULL,1),(49,'2024-09-26 15:56:58','2024-09-26 15:56:58',11,12,NULL,1),(50,'2024-09-26 15:57:49','2024-09-26 15:57:49',11,NULL,48,1),(51,'2024-09-26 15:57:49','2024-09-26 15:57:49',11,NULL,48,2),(52,'2024-09-26 15:58:09','2024-09-26 15:58:09',5,NULL,50,1),(53,'2024-09-26 15:58:09','2024-09-26 15:58:09',5,NULL,50,2),(54,'2024-09-26 15:58:09','2024-09-26 15:58:09',5,NULL,50,3),(55,'2024-09-26 15:58:09','2024-09-26 15:58:09',5,NULL,50,4),(56,'2024-09-26 15:59:12','2024-09-26 16:00:18',5,NULL,51,0),(59,'2024-09-26 15:59:59','2024-09-26 16:00:18',5,NULL,51,1),(60,'2024-09-26 16:01:05','2024-09-26 16:01:05',8,NULL,51,3),(62,'2024-09-26 16:12:34','2024-09-26 16:12:34',11,NULL,49,2),(63,'2024-09-26 16:12:34','2024-09-26 16:12:34',11,NULL,49,3),(64,'2024-09-26 16:14:08','2024-09-26 16:14:08',6,NULL,63,1);
/*!40000 ALTER TABLE `subcomponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcomponent_attribute`
--

DROP TABLE IF EXISTS `subcomponent_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcomponent_attribute` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subcomponent_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subcomponent_attribute_subcomponent_id_foreign` (`subcomponent_id`),
  CONSTRAINT `subcomponent_attribute_subcomponent_id_foreign` FOREIGN KEY (`subcomponent_id`) REFERENCES `subcomponent` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcomponent_attribute`
--

LOCK TABLES `subcomponent_attribute` WRITE;
/*!40000 ALTER TABLE `subcomponent_attribute` DISABLE KEYS */;
INSERT INTO `subcomponent_attribute` VALUES (2,'2024-09-24 19:32:07','2024-09-25 21:39:19','text_label','server Building a Magical 3D Button',14),(3,'2024-09-24 19:32:13','2024-09-24 19:32:13','text_label','Bet you can\'t click just once!',15),(5,'2024-09-24 19:34:48','2024-09-24 19:34:48','text_label','I had a neat realization recently: Buttons are the “killer feature” of the web.  Every significant thing we do online, from ordering food to scheduling an appointment to playing a video, involves pressing a button. Buttons (and the forms they submit) make the web dynamic and interactive and powerful.  But so many of those buttons are lackluster. They can trigger enormous changes in the real world, but they don\'t feel tangible at all. The feel like dull everyday pixels.  In this tutorial, we\'ll build a whimsical 3D button:',16),(6,'2024-09-25 18:18:12','2024-09-25 18:18:12','styles','w-[300px] p-4 relative m-0  rounded-none bg-transparent  shadow-none mx-auto',17),(7,'2024-09-25 18:18:45','2024-09-25 18:20:15','styles','w-full p-4 rounded-md bg-bgSeco border-l-4 border-primary',18),(9,'2024-09-25 18:20:34','2024-09-25 18:21:32','text_label','Intended audience',19),(10,'2024-09-25 18:21:32','2024-09-25 18:21:32','styles','text-textSecondary mb-2 leading-relaxed font-semibold',19),(11,'2024-09-25 18:21:44','2024-09-25 18:21:44','text_label','This is an intermediate-level tutorial for front-end developers. It\'s focused on HTML/CSS, no JavaScript knowledge required.  If you\'re relatively new to CSS transitions, I\'d recommend reading “An Interactive Guide to CSS Transitions” first.  Link to this heading',22),(12,'2024-09-25 18:22:19','2024-09-25 18:22:19','text_label','Our strategy',23),(13,'2024-09-25 18:22:35','2024-09-25 18:22:35','styles','font-semibold text-xl md:text-2xl xl:text-3xl  text-textPrimary',23),(14,'2024-09-25 18:22:51','2024-09-25 18:22:51','text_label','There\'s one main trick we\'ll use a couple times in this tutorial to create the illusion of a 3D button.',24),(15,'2024-09-25 18:24:13','2024-09-25 18:24:13','text_label','Paso a paso',27),(16,'2024-09-25 18:24:36','2024-09-25 18:24:36','text_label','Estructura del componente\r\n\r\n.btn => Este es el componente base que define y encapsula las variables y estilos generales como la estructura principal del botón.\r\n\r\n.btn_primary: Esta clase agrega estilos específicos para definir el tema principal del botón. Simplemente agregando otra clase, como .btn_secondary, puedes cambiar fácilmente el estilo del botón a un tema secundario.\r\n\r\n.btn_shadow: Representa la última capa del botón, la sombra. Utilizamos el pseudo-elemento :before o :after para lograr un posicionamiento que no afecte a los elementos hijos, permitiéndonos mover la sombra fuera de la caja principal sin afectar a los elementos front y back.\r\n\r\n.btn_back: Capa intermedia situada entre la sombra y la parte frontal del botón. Proporciona la estructura y los estilos de fondo del botón.\r\n\r\n.btn_front: La capa frontal del botón, que contiene el contenido visible del botón. Aquí es donde se define el estilo visual y el contenido del botón.',28),(17,'2024-09-25 18:24:55','2024-09-25 18:24:55','text_label','Utilizando una de las variables principales raise la qual maneja la elevacion en contexto 3D del botón, tecnicamente se le aplica a la base donde el alto (2d) total es la altura definida mas la elevacion 3d que queremos',29),(18,'2024-09-25 18:25:25','2024-09-25 18:33:51','css','/*style for btn*/\r\n.btn{\r\n  --font-body-family:-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica Neue,sans-serif;\r\n  --height: 50px;\r\n  --raise: 100px;\r\n  --rounded: 10px;\r\n  --rotate: 1;\r\n  --rotate_invers: 1 * - 1;\r\n  --border:4px;\r\n  --border_style:solid #004c65 var(--border);\r\n  --bg-front-color: #AAD3EA;\r\n  --bg-shadow-color: #4B4B4B84;\r\n  --bg-back-color: #004c65;\r\n  --font-color: white;\r\n  --font-body-weight:800;\r\n  --width:180px;\r\n  color:var(--font-color);\r\n  font-family:var(--font-body-family);\r\n  height: calc(var(--height) + var(--raise)); \r\n  width:var(--width);\r\n  font-weight:var(--font-body-weight);\r\n}\r\n\r\n.btn_primary{\r\n  --bg-shadow-color: #4B4B4B20;\r\n  --bg-front-color: #338a9d;\r\n  --bg-back-color: #9a453f;\r\n  --border_style:solid #b84a41 var(--border);\r\n  --font-color: #ea893e;\r\n}\r\n\r\n.btn_shadow {\r\n  border: var(--border) solid transparent;\r\n}\r\n\r\n.btn_shadow:before {\r\n  content:\" \";\r\n  position:absolute;\r\n  height: var(--height); \r\n  margin-top: calc((var(--raise)/0.5)); \r\n  width:var(--width);\r\n  background: var(--bg-shadow-color);\r\n  border-radius: var(--rounded);\r\n  transition:transform 0.2s ease-out;\r\n  border: var(--border) solid transparent;\r\n}\r\n.btn_back:before{\r\n  content:\" \";\r\n  position: absolute; \r\n  height: var(--height); \r\n  margin-top: var(--raise); \r\n  width:var(--width);\r\n  border: var(--border) solid transparent;\r\n  background: var(--bg-back-color);\r\n  border-radius:var(--rounded); \r\n  transition:transform 0.1s ease-out;\r\n} \r\n\r\n.btn_front{\r\n  position: absolute;\r\n  height: var(--height);\r\n  width:var(--width);\r\n  background: var(--bg-front-color);\r\n  display: flex;\r\n  align-items: center;\r\n  justify-content: center;\r\n  border-radius:var(--rounded);\r\n  border: var(--border_style);\r\n  transition:transform 0.1s ease-out;\r\n}\r\n\r\n\r\n\r\n/* It is not necessary only for the body*/\r\n.h-screen{\r\n    height:90vh; \r\n}\r\n.mt-36{\r\n  margin-top:136px;\r\n}\r\n.justify-center {\r\n    justify-content: center;\r\n}\r\n.items-center {\r\n    align-items: center;\r\n}\r\n.flex-wrap {\r\n    flex-wrap: wrap;\r\n}\r\n.flex-col {\r\n    flex-direction: column;\r\n}\r\n.flex{\r\n display : flex;\r\n}',30),(19,'2024-09-25 18:25:42','2024-09-25 18:25:42','text_label','En términos sencillos, las tres capas del botón (shadow, back y front) son clave para lograr el efecto 3D. Al utilizar pseudo-elementos y técnicas de posicionamiento, podemos separar la sombra del botón principal sin afectar la disposición de los elementos visibles. Experimentar con estas clases te permitirá entender mejor cómo cada capa contribuye al diseño general del botón y cómo puedes personalizarlo según tus necesidades. ¡Diviértete explorando las posibilidades!',31),(20,'2024-09-25 18:26:02','2024-09-25 18:26:02','text_label','Aquí tienes una vista explosionada del componente,',32),(22,'2024-09-25 18:27:02','2024-09-25 18:33:51','html','<div class=\"flex flex-col flex-wrap overflow-x-hidden  justify-center items-center h-screen\">\r\n<div class=\"btn btn_primary btn_shadow \" >\r\n  <div class=\"btn_back\">\r\n    <div class=\"btn_front\">\r\n      <p>Hover</p>\r\n    </div>\r\n  </div>\r\n</div>\r\n</div>',30),(23,'2024-09-25 18:27:02','2024-09-25 18:27:02','js','var raise=10;\r\n\r\nfunction obtenerValor() {\r\n  // Obtén el elemento input por su ID\r\n  var rangeInput = document.getElementById(\"button_range\");\r\n\r\n  // Obtén el valor actual del input de rango\r\n  var valor = rangeInput.value;\r\n  var btn = document.querySelector(\".btn\");\r\n    var style = btn.style;\r\n  style.setProperty(\'--raise\', valor+\'px\');\r\n  raise=valor;\r\n  // Actualiza el texto para mostrar el valor actual\r\n  document.getElementById(\"valor_actual\").textContent = \"Valor actual: \" + valor;\r\n}',30),(24,'2024-09-25 18:31:13','2024-09-25 18:31:45','css','.h-screen{\r\n    height:90vh; \r\n}\r\n.mt-auto{\r\n  margin-top:auto;\r\n}\r\n.justify-center {\r\n    justify-content: center;\r\n}\r\n.items-center {\r\n    align-items: center;\r\n}\r\n.flex-wrap {\r\n    flex-wrap: wrap; \r\n}\r\n.flex-col {\r\n    flex-direction: column;\r\n}\r\n.flex{\r\n display : flex;\r\n}\r\n\r\n\r\n.btn{\r\n  --font-body-family:-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica Neue,sans-serif;\r\n  --height: 50px;\r\n  --raise: 100px;\r\n  --rounded: 10px;\r\n  --rotate: 1;\r\n  --rotate_invers: 1 * - 1;\r\n  --border:4px;\r\n  --border_style:solid #004c65 var(--border);\r\n  --bg-front-color: #AAD3EA;\r\n  --bg-shadow-color: #4B4B4B84;\r\n  --bg-back-color: #004c65;\r\n  --font-color: white;\r\n  --font-body-weight:800;\r\n  --width:180px;\r\n/*     transform:   translate3d(-10px, 0px, 0px) rotateX(20deg) rotateY(-45deg); */\r\n\r\n}\r\n#valor_actual{\r\n  font-family:\'Ubuntu\';\r\n  font-weight:700;\r\n}\r\n.btn_primary{\r\n  --bg-shadow-color: #4B4B4B20;\r\n  --bg-front-color: #338a9d;\r\n  --bg-back-color: #9a453f;\r\n  --border_style:solid #b84a41 var(--border);\r\n  --font-color: #ea893e;\r\n}\r\n.btn_secondary{\r\n  --bg-shadow-color: #4B4B4B84;\r\n  --bg-front-color: #fffbb5;/*#fffbb5;*/\r\n  --bg-back-color: #4e6a6b;\r\n  --border_style:solid #5c8486 var(--border);\r\n  --font-color: #20201e;\r\n}\r\n.btn_anchor{\r\n  --bg-shadow-color: #4B4B4B84;\r\n  --bg-front-color: #ececec;\r\n  --bg-back-color: #313131;\r\n  --border_style:solid #404040 var(--border);\r\n  --font-color: #7f4997;\r\n}\r\n.btn_danger{\r\n  --bg-shadow-color: #4B4B4B84;\r\n  --bg-front-color: #8B3357;\r\n  --bg-back-color: #afca92;\r\n  --border_style:solid #d2f3af var(--border);\r\n  --font-color: #fff;\r\n}\r\n.btn_disabled{\r\n  --bg-shadow-color: #4B4B4B84;\r\n  --bg-front-color: #f16c5d;\r\n  --bg-back-color: #7da7ac;\r\n  --border_style:solid #9dd6dd var(--border);\r\n  --font-color: #ececec;\r\n}\r\n.btn p{\r\n  font-weight:var(--font-body-weight);\r\n}\r\n.btn_shadow {\r\n  height: calc(var(--height) + var(--raise));\r\n  font-family:var(--font-body-family);\r\n  width:var(--width);\r\n  color:var(--font-color);\r\n  border: var(--border) solid transparent;\r\n}\r\n.btn_shadow:before {\r\n  content:\" \";\r\n  position:absolute;\r\n  height: var(--height);\r\n  margin-top: calc(var(--raise) + (var(--raise)/1.2)); \r\n  width:var(--width);\r\n  background: var(--bg-shadow-color);\r\n  border-radius: var(--rounded);\r\n  transition:transform 0.2s ease-out;\r\n  border: var(--border) solid transparent;\r\n}\r\n.btn_shadow .btn_back:before{\r\n  content:\" \";\r\n  position: absolute;\r\n  height: var(--height);\r\n  margin-top: var(--raise);\r\n  \r\n  width:var(--width);\r\n  border: var(--border) solid transparent;\r\n  background: var(--bg-back-color);\r\n  border-radius:var(--rounded);\r\n  transition:transform 0.1s ease-out;\r\n} \r\n.btn_shadow .btn_front{\r\n  position: absolute;\r\n  height: var(--height);\r\n  width:var(--width);\r\n\r\n  background: var(--bg-front-color);\r\n  display: flex;\r\n  align-items: center;\r\n  justify-content: center;\r\n  border-radius:var(--rounded);\r\n  border: var(--border_style);\r\n  transition:transform 0.1s ease-out;\r\n}\r\n\r\n.btn_shadow_left:before{\r\n  transition: transform 0.2s ease-out;\r\n  transform:skewY(calc(1deg * var(--rotate_invers)));\r\n}\r\n.btn_shadow_right:before{\r\n  transition:transform 0.2s ease-out;\r\n  transform:skewY(calc(1deg * var(--rotate)));\r\n}\r\n.btn_shadow_default:before{\r\n  transform:skew(0) translateZ(0);\r\n}\r\n\r\n.btn_shadow_default:hover:before{\r\n  transform: translateY(-5px);\r\n}\r\n.btn_shadow_default:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n.btn_shadow_left:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n.btn_shadow_right:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n/*btn_front events*/\r\n.btn_front_left{\r\n  transform:skewY(calc(1deg * var(--rotate_invers)));\r\n}\r\n.btn_front_right{\r\n  transform:skewY(calc(1deg * var(--rotate)));\r\n  transition:transform 0.2s ease-out;\r\n}\r\n.btn_front_default{\r\n  transform:skew(0) translateZ(0);\r\n  transition:transform 0.2s ease-out;\r\n}\r\n\r\n.btn_front_left:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n.btn_front_right:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n.btn_front_default:hover{\r\n  transform: translateY(calc(var(--raise) * 0.5));\r\n\r\n}\r\n.btn_front_default:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n\r\n/*loading*/\r\n.btn_loading_wrapp{\r\n  position: absolute;\r\n  height: var(--height);\r\n   width:var(--width);\r\n\r\n  margin-left:calc(var(--border)*-1);/* padding for borders of parent */\r\n  margin-right:calc(var(--border)*-1);/* padding for borders of parent */\r\n  background: var(--bg-back-color);\r\n  display: flex;\r\n  align-items: center;\r\n  justify-content: center;\r\n  border-radius:var(--rounded);\r\n  border: var(--border_style);\r\n  overflow: hidden;\r\n  z-index:1;\r\n}\r\n\r\n.btn_loading_wrapp:before{\r\n  content:\" \";\r\n  position: absolute;\r\n  height: var(--height);\r\n  width: 0;\r\n  left: 0;\r\n  right: 0;\r\n  background: var(--bg-front-color);\r\n  z-index:-1;\r\n}\r\n\r\n.btn_loading_2:before{\r\n  width:100%;\r\n  transition: width 1s ease-in;\r\n}\r\n.opacity-0{\r\n  opacity:0;\r\n}\r\n.hidden{\r\n  display:none;\r\n}\r\n/*.flex{\r\n  display:flex;\r\n}*/\r\n\r\n/*animation text*/\r\n.btn_loading_2 .txt_loading{\r\n  animation: slide-up 0.5s ease-in-out;\r\n}\r\n.btn_loading_2 .txt_loaded{\r\n  animation: slide-down 0.5s ease-in-out;\r\n}\r\n@keyframes slide-down {\r\n  0% {\r\n    transform: translateY(-150%);\r\n    opacity: 0;\r\n  }\r\n  100% {\r\n    transform: translateY(0);\r\n    opacity: 1;\r\n  }\r\n}\r\n@keyframes slide-up {\r\n  0% {\r\n    transform: translateY(150%);\r\n    opacity: 0;\r\n  }\r\n  100% {\r\n    transform: translateY(0);\r\n    opacity: 1;\r\n  }\r\n}\r\n\r\n\r\n/* bender eye*/\r\n\r\n\r\n.wrap {\r\n  position: relative;\r\n  width: 100px;\r\n  height: 40px;\r\n  margin: 0 2rem;\r\n  color: #dbc9aa;\r\n  line-height: 40px;\r\n  font-size: 2rem;\r\n  text-align: center;\r\n  font-weight: 400;\r\n  padding-top: 5.5rem;\r\n  margin-bottom: 0;\r\n}\r\n.wrap .eye {\r\n  position: absolute;\r\n  margin: auto;\r\n  top: 0;\r\n  bottom: 0;\r\n  background: #fff;\r\n  width: 40px;\r\n  height: 40px;\r\n  border-radius: 50%;\r\n  display: inline-block;\r\n  overflow: hidden;\r\n}\r\n.wrap .eye:before {\r\n  content: \"\";\r\n  position: absolute;\r\n  margin-left: auto;\r\n  width: 10px;\r\n  height: 10px;\r\n  left: 0;\r\n  right: 0;\r\n  bottom: 0;\r\n  background: #141414;\r\n  margin: auto;\r\n}\r\n.wrap .eye.grin:after, .wrap .eye.sad:after {\r\n  content: \"\";\r\n  position: absolute;\r\n  width: calc(100% + 20px);\r\n  height: 0;\r\n  background: #eae0ce;\r\n  left: -10px;\r\n}\r\n.wrap .eye.grin:after {\r\n  bottom: -20px;\r\n}\r\n.wrap .eye:first-child {\r\n  left: 0;\r\n}\r\n.wrap .eye:last-child {\r\n  right: 0;\r\n}\r\n.wrap .eye.grin:before {\r\n  -webkit-animation: grinb 4s cubic-bezier(0.785, 0.135, 0.15, 0.86) infinite;\r\n          animation: grinb 4s cubic-bezier(0.785, 0.135, 0.15, 0.86) infinite;\r\n}\r\n.wrap .eye.grin:after {\r\n  -webkit-animation: grina 4s cubic-bezier(0.785, 0.135, 0.15, 0.86) infinite;\r\n          animation: grina 4s cubic-bezier(0.785, 0.135, 0.15, 0.86) infinite;\r\n}\r\n\r\n@-webkit-keyframes grinb {\r\n  0%, 10% {\r\n    bottom: 0;\r\n  }\r\n  20%, 40% {\r\n    bottom: 50%;\r\n  }\r\n  50%, 100% {\r\n    bottom: 0;\r\n  }\r\n}\r\n\r\n@keyframes grinb {\r\n  0%, 10% {\r\n    bottom: 0;\r\n  }\r\n  20%, 40% {\r\n    bottom: 50%;\r\n  }\r\n  50%, 100% {\r\n    bottom: 0;\r\n  }\r\n}\r\n@-webkit-keyframes grina {\r\n  0%, 10% {\r\n    height: 0;\r\n  }\r\n  20%, 40% {\r\n    height: 100%;\r\n  }\r\n  50%, 100% {\r\n    height: 0;\r\n  }\r\n}\r\n@keyframes grina {\r\n  0%, 10% {\r\n    height: 0;\r\n  }\r\n  20%, 40% {\r\n    height: 100%;\r\n  }\r\n  50%, 100% {\r\n    height: 0;\r\n  }\r\n}\r\n\r\n\r\n/* water*/\r\n\r\n.bubble {\r\n  --bg_front_color:#42a5f5;\r\n  --bg_back_color:#c7eeff;\r\n  width: 100%;\r\n  height: 100%;\r\n  background-color: var(--bg-front-color);\r\n  overflow: hidden;\r\n  transform: translate(0, 0);\r\nborder-radius:var(--rounded);\r\n}\r\n.bubble .water {\r\n  position: absolute;\r\n  left: 0;\r\n  top: 0;\r\n  z-index: 2;\r\n  width: 100%;\r\n  height: 100%;\r\n  -webkit-transform: translate(0, 100%);\r\n  transform: translate(0, 100%);\r\n}\r\n.bubble .water_wave_back {\r\n  width:200%;\r\n  left: 0;\r\n  top:0;\r\n  position:relative;\r\n  fill: var(--bg_back_color);\r\n\r\n  animation: wave-back 0.8s infinite linear;\r\n}\r\n.bubble .water_wave_front {\r\n    margin-top: 8px;\r\n  width:200%;\r\n  left: 0;\r\n  top:0;\r\n  position:absolute;\r\n  fill: var(--bg_front_color);\r\n  animation: wave-front 0.6s infinite linear;\r\n}\r\n\r\n.liquid{\r\n  background:var(--bg_front_color);\r\n  width: 100%;\r\n  height: 100%;\r\n  margin-top:-6px;\r\n}\r\n\r\n\r\n@keyframes wave-front {\r\n  100% {\r\n    transform: translate(-50%, 0);\r\n  }\r\n}\r\n@keyframes wave-back {\r\n  100% {\r\n    transform: translate(-50%, 0);\r\n  }\r\n}',26),(25,'2024-09-25 18:31:45','2024-09-25 18:31:45','html','<div class=\"flex flex-col flex-wrap overflow-x-hidden  justify-center items-center h-screen\">\r\n\r\n  <div class=\"mt-auto btn btn_primary btn_shadow btn_loading\" >\r\n  <div class=\"btn_back\">\r\n    <div class=\"btn_front\">\r\n      <div class=\"btn_loading_wrapp opacity-0\">\r\n        <p class=\"txt_loading\">Loading</p>\r\n        <p class=\"txt_loaded hidden\">succes</p>\r\n      </div>\r\n      <p>Hover</p>\r\n    </div>\r\n  </div> \r\n</div>\r\n<input class=\"mt-auto\" type=\"range\" id=\"button_range\" min=\"0\" max=\"100\" value=\"10\" oninput=\"obtenerValor()\">\r\n<p id=\"valor_actual\">Valor actual: 100</p>\r\n</div>',26),(26,'2024-09-25 18:31:45','2024-09-25 18:31:45','js','var raise=10;\r\nbtn = document.querySelector(\'.btn\');\r\n\r\n  var loading=false;\r\n  var style = btn.style;\r\n  style.setProperty(\'--raise\', raise+\'px\');\r\n  btn.addEventListener(\'mousemove\', event => {\r\n    if(raise>0){\r\n       const width = btn.offsetWidth;\r\n    const height = btn.offsetHeight;\r\n    const rotationDegrees = Math.atan((height * (raise) + raise) / (width )) ;\r\n    const btnWidth = btn.offsetWidth;\r\n    const mouseX = event.clientX - btn.getBoundingClientRect().left;\r\n\r\n    style.setProperty(\'--rotate\', (rotationDegrees));\r\n    style.setProperty(\'--rotate_invers\', (rotationDegrees * -1));\r\n\r\n    this.rotate_Y = -10 * ((mouseX - btnWidth / 2) / (btnWidth / 2));\r\n    if(this.rotate_Y>2){\r\n      btn.classList.remove(\'btn_shadow_default\', \'btn_shadow_left\');\r\n      btn.classList.add(\'btn_shadow_right\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_default\', \'btn_front_right\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_left\');\r\n    }\r\n    if(this.rotate_Y>-2 && this.rotate_Y<2){\r\n      btn.classList.remove(\'btn_shadow_right\', \'btn_shadow_left\');\r\n      btn.classList.add(\'btn_shadow_default\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_right\', \'btn_front_left\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_default\');\r\n    }\r\n    if(this.rotate_Y<-2){\r\n      console.log(\'right\');\r\n      btn.classList.remove(\'btn_shadow_right\', \'btn_shadow_default\');\r\n      btn.classList.add(\'btn_shadow_left\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_default\', \'btn_front_left\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_right\');\r\n    }\r\n   \r\n    }\r\n  });\r\n  btn.addEventListener(\"click\", function() {\r\n    if(!loading){\r\n      //loading=true;\r\n\r\n      console.log(\'eeeeee\')\r\n      const childElement= btn.querySelector(\'.btn_loading_wrapp\');\r\n      childElement.classList.remove(\'opacity-0\');\r\n      childElement.classList.add(\'flex\',\'btn_loading_2\');\r\n      document.querySelector(\'.btn_loading\').style.pointerEvents = \"none\";\r\n      document.querySelector(\'.btn_front\').style.pointerEvents = \"none\";\r\n      //document.querySelector(\'.btn_front\').style.opacity = \"0.8\";\r\n\r\n      document.querySelector(\'.txt_loaded\').classList.add(\'hidden\');\r\n      document.querySelector(\'.txt_loading\').classList.remove(\'hidden\');\r\n\r\n      setTimeout(function() {\r\n        document.querySelector(\'.txt_loaded\').classList.remove(\'hidden\');\r\n        document.querySelector(\'.txt_loading\').classList.add(\'hidden\');\r\n        setTimeout(function() {\r\n          childElement.classList.add(\'opacity-0\');\r\n          childElement.classList.remove(\'flex\',\'btn_loading_2\');\r\n          document.querySelector(\'.btn_loading\').style.pointerEvents = \"auto\";\r\n          document.querySelector(\'.btn_front\').style.pointerEvents = \"auto\";\r\n          //document.querySelector(\'.btn_front\').style.opacity = \"1\";\r\n        }, 1000);\r\n        //loading=false;\r\n      }, 3000);\r\n    }\r\n  });\r\n\r\nfunction obtenerValor() {\r\n  // Obtén el elemento input por su ID\r\n  var rangeInput = document.getElementById(\"button_range\");\r\n\r\n  // Obtén el valor actual del input de rango\r\n  var valor = rangeInput.value;\r\n  var btn = document.querySelector(\".btn\");\r\n    var style = btn.style;\r\n  style.setProperty(\'--raise\', valor+\'px\');\r\n  raise=valor;\r\n  // Actualiza el texto para mostrar el valor actual\r\n  document.getElementById(\"valor_actual\").textContent = \"Valor actual: \" + valor;\r\n}',26),(27,'2024-09-25 18:33:12','2024-09-25 18:33:12','css','.btn{\r\n  --height: 50px;\r\n  height: calc(var(--height) + var(--raise)); \r\n  --raise: 100px;\r\n}\r\n\r\n.btn_shadow:before {\r\n  height: var(--height); \r\n  margin-top: calc((var(--raise)/0.5)); \r\n}\r\n\r\n.btn_back:before{\r\n  height: var(--height); \r\n  margin-top: var(--raise);   \r\n}',33),(28,'2024-09-25 18:34:49','2024-09-25 18:34:49','text_label','Vamos animar la capa shadow y la capa front agregando un par de clases\r\nbtn_front_default y btn_shadow_default\r\n\r\nQue queremos conseguir?¿\r\n\r\nEl objectivo es simular un boton real que al pasar el cursor se unda un poco y al estar activo se unda del todo, agregamos ha esas clases los eventos hover y active y el comportamiento que hemos especificado usando transform para mover las capas y agregamos el tipo de animacion',34),(29,'2024-09-25 18:34:57','2024-09-25 18:34:57','text_label','El secreto de la masa',36),(30,'2024-09-25 18:37:52','2024-09-25 18:37:52','html','<div class=\"flex flex-col flex-wrap overflow-x-hidden  justify-center items-center h-screen\">\r\n<div class=\"btn btn_primary btn_shadow btn_shadow_default btn_loading\" >\r\n  <div class=\"btn_back\">\r\n    <div class=\"btn_front btn_front_default\">\r\n    \r\n      <p>Hover</p> \r\n    </div> \r\n  </div>\r\n</div>\r\n  <input class=\"mt-auto\" type=\"range\" id=\"button_range\" min=\"0\" max=\"100\" value=\"10\" oninput=\"obtenerValor()\">\r\n<p id=\"valor_actual\">Valor actual: 100</p> \r\n</div>',40),(31,'2024-09-25 18:39:02','2024-09-25 18:39:25','css','/*style for btn*/\r\n.btn{\r\n  --font-body-family:-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica Neue,sans-serif;\r\n  --height: 50px;  \r\n  --raise: 100px;\r\n  --rounded: 10px;\r\n  --rotate: 1;\r\n  --rotate_invers: 1 * - 1;\r\n  --border:4px;\r\n  --border_style:solid #004c65 var(--border);\r\n  --bg-front-color: #AAD3EA;\r\n  --bg-shadow-color: #4B4B4B84;\r\n  --bg-back-color: #004c65;\r\n  --font-color: white;\r\n  --font-body-weight:800;\r\n  --width:180px;\r\n  color:var(--font-color);\r\n  font-family:var(--font-body-family);\r\n  height: calc(var(--height) + var(--raise)); \r\n  width:var(--width);\r\n  font-weight:var(--font-body-weight);\r\n}\r\n\r\n.btn_primary{\r\n  --bg-shadow-color: #4B4B4B20;\r\n  --bg-front-color: #338a9d;\r\n  --bg-back-color: #9a453f;\r\n  --border_style:solid #b84a41 var(--border);\r\n  --font-color: #ea893e;\r\n}\r\n\r\n.btn_shadow {\r\n  border: var(--border) solid transparent;\r\n}\r\n.btn_shadow:before {\r\n  content:\" \";\r\n  position:absolute;\r\n  height: var(--height);\r\n  margin-top: calc(var(--raise) + (var(--raise)/1.2)); \r\n  width:var(--width);\r\n  background: var(--bg-shadow-color);\r\n  border-radius: var(--rounded);\r\n  transition:transform 0.2s ease-out;\r\n  border: var(--border) solid transparent;\r\n}\r\n.btn_back:before{\r\n  content:\" \";\r\n  position: absolute;\r\n  height: var(--height);\r\n  margin-top: var(--raise);\r\n  width:var(--width);\r\n  border: var(--border) solid transparent;\r\n  background: var(--bg-back-color);\r\n  border-radius:var(--rounded);\r\n  transition:transform 0.1s ease-out;\r\n} \r\n.btn_front{\r\n  position: absolute;\r\n  height: var(--height);\r\n  width:var(--width);\r\n  background: var(--bg-front-color);\r\n  display: flex;\r\n  align-items: center;\r\n  justify-content: center;\r\n  border-radius:var(--rounded);\r\n  border: var(--border_style);\r\n  transition:transform 0.1s ease-out;\r\n}\r\n\r\n/*on mouse move in button zone add classes*/\r\n.btn_shadow_left:before{\r\n  transition: transform 0.2s ease-out;\r\n  transform:skewY(calc(1deg * var(--rotate_invers)));\r\n}\r\n.btn_shadow_right:before{\r\n  transition:transform 0.2s ease-out;\r\n  transform:skewY(calc(1deg * var(--rotate)));\r\n}\r\n.btn_shadow_default:before{\r\n  transform:skew(0) translateZ(0);\r\n}\r\n.btn_shadow_default:hover:before{\r\n  transform: translateY(calc((var(--raise)/4) * -1 )); \r\n}      \r\n.btn_shadow_default:active:before{ \r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n} \r\n.btn_shadow_default:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n.btn_shadow_left:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n.btn_shadow_right:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n/*btn_front events*/\r\n.btn_front_left{\r\n  transform:skewY(calc(1deg * var(--rotate_invers)));\r\n}\r\n.btn_front_right{\r\n  transform:skewY(calc(1deg * var(--rotate)));\r\n  transition:transform 0.2s ease-out;\r\n}\r\n.btn_front_default{\r\n  transform:skew(0) translateZ(0);\r\n  transition:transform 0.2s ease-out;\r\n}\r\n\r\n.btn_front_left:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n.btn_front_right:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n.btn_front_default:hover{\r\n  transform: translateY(calc(var(--raise) * 0.5));\r\n\r\n}\r\n.btn_front_default:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n} \r\n\r\n\r\n/*loading*/\r\n.btn_loading_wrapp{\r\n  position: absolute;\r\n  height: var(--height);\r\n   width:var(--width);\r\n\r\n  margin-left:calc(var(--border)*-1);/* padding for borders of parent */\r\n  margin-right:calc(var(--border)*-1);/* padding for borders of parent */\r\n  background: var(--bg-back-color);\r\n  display: flex;\r\n  align-items: center;\r\n  justify-content: center;\r\n  border-radius:var(--rounded);\r\n  border: var(--border_style);\r\n  overflow: hidden;\r\n  z-index:1;\r\n}\r\n\r\n.btn_loading_wrapp:before{\r\n  content:\" \";\r\n  position: absolute;\r\n  height: var(--height);\r\n  width: 0;\r\n  left: 0;\r\n  right: 0;\r\n  background: var(--bg-front-color);\r\n  z-index:-1;\r\n}\r\n\r\n.btn_loading_2:before{\r\n  width:100%;\r\n  transition: width 1s ease-in;\r\n}\r\n.opacity-0{\r\n  opacity:0;\r\n}\r\n.hidden{\r\n  display:none;\r\n}\r\n\r\n\r\n\r\n\r\n#valor_actual{ \r\n  font-family:\'Ubuntu\';\r\n  font-weight:700;\r\n}\r\n\r\n/* It is not necessary only for the body*/\r\n.h-screen{\r\n    height:90vh; \r\n}\r\n.mt-auto{\r\n  margin-top:136px; \r\n}\r\n.justify-center {\r\n    justify-content: center;\r\n}\r\n.items-center {\r\n    align-items: center;\r\n}\r\n.flex-wrap {\r\n    flex-wrap: wrap;\r\n}\r\n.flex-col {\r\n    flex-direction: column;\r\n}\r\n.flex{\r\n display : flex;\r\n}',40),(32,'2024-09-25 18:39:55','2024-09-25 18:39:55','js','var raise=10;\r\nbtn = document.querySelector(\'.btn\');\r\n\r\n  var loading=false;\r\n  var style = btn.style;\r\n  style.setProperty(\'--raise\', raise+\'px\');\r\n  btn.addEventListener(\'mousemove\', event => {\r\n    if(raise>0){\r\n    const width = btn.offsetWidth;\r\n    const height = btn.offsetHeight;\r\n    const rotationDegrees = Math.atan((height * (raise) + raise) / (width )) ;\r\n    const btnWidth = btn.offsetWidth;\r\n    const mouseX = event.clientX - btn.getBoundingClientRect().left;\r\n    style.setProperty(\'--rotate\', (rotationDegrees));\r\n    style.setProperty(\'--rotate_invers\', (rotationDegrees * -1));\r\n\r\n    this.rotate_Y = -10 * ((mouseX - btnWidth / 2) / (btnWidth / 2));\r\n    if(this.rotate_Y>2){\r\n      btn.classList.remove(\'btn_shadow_default\', \'btn_shadow_left\');\r\n      btn.classList.add(\'btn_shadow_right\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_default\', \'btn_front_right\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_left\');\r\n    }\r\n    if(this.rotate_Y>-2 && this.rotate_Y<2){\r\n      btn.classList.remove(\'btn_shadow_right\', \'btn_shadow_left\');\r\n      btn.classList.add(\'btn_shadow_default\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_right\', \'btn_front_left\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_default\');\r\n    }\r\n    if(this.rotate_Y<-2){\r\n      console.log(\'right\');\r\n      btn.classList.remove(\'btn_shadow_right\', \'btn_shadow_default\');\r\n      btn.classList.add(\'btn_shadow_left\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_default\', \'btn_front_left\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_right\');\r\n    }\r\n    }\r\n  });\r\n\r\n\r\n\r\nfunction obtenerValor() {\r\n  // Obtén el elemento input por su ID\r\n  var rangeInput = document.getElementById(\"button_range\");\r\n\r\n  // Obtén el valor actual del input de rango\r\n  var valor = rangeInput.value;\r\n  var btn = document.querySelector(\".btn\");\r\n    var style = btn.style;\r\n  style.setProperty(\'--raise\', valor+\'px\');\r\n  raise=valor;\r\n  // Actualiza el texto para mostrar el valor actual\r\n  document.getElementById(\"valor_actual\").textContent = \"Valor actual: \" + valor;\r\n}',40),(33,'2024-09-25 18:41:08','2024-09-25 18:41:08','html','<div class=\"flex flex-col flex-wrap overflow-x-hidden  justify-center items-center h-screen\">\r\n<div class=\"btn btn_primary btn_shadow btn_loading\" >\r\n  <div class=\"btn_back\"> \r\n       <div class=\"btn_front\">\r\n      <div class=\"btn_loading_wrapp opacity-0\">\r\n         \r\n        <p class=\"txt_loading\">Loading</p>\r\n        <p class=\"txt_loaded hidden\">succes</p>\r\n      </div>\r\n      <p>Hover</p>\r\n    </div> \r\n  </div>\r\n</div>\r\n  <input class=\"mt-auto\" type=\"range\" id=\"button_range\" min=\"0\" max=\"100\" value=\"10\" oninput=\"obtenerValor()\">\r\n<p id=\"valor_actual\">Valor actual: 100</p> \r\n</div>',41),(34,'2024-09-25 18:41:08','2024-09-25 18:41:08','css','/*style for btn*/\r\n.btn{\r\n  --font-body-family:-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica Neue,sans-serif;\r\n  --height: 50px;  \r\n  --raise: 100px;\r\n  --rounded: 10px;\r\n  --rotate: 1;\r\n  --rotate_invers: 1 * - 1;\r\n  --border:4px;\r\n  --border_style:solid #004c65 var(--border);\r\n  --bg-front-color: #AAD3EA;\r\n  --bg-shadow-color: #4B4B4B84;\r\n  --bg-back-color: #004c65;\r\n  --font-color: white;\r\n  --font-body-weight:800;\r\n  --width:180px;\r\n  color:var(--font-color);\r\n  font-family:var(--font-body-family);\r\n  height: calc(var(--height) + var(--raise)); \r\n  width:var(--width);\r\n  font-weight:var(--font-body-weight);\r\n}\r\n\r\n.btn_primary{\r\n  --bg-shadow-color: #4B4B4B20;\r\n  --bg-front-color: #338a9d;\r\n  --bg-back-color: #9a453f;\r\n  --border_style:solid #b84a41 var(--border);\r\n  --font-color: #ea893e;\r\n}\r\n\r\n.btn_shadow {\r\n  border: var(--border) solid transparent;\r\n}\r\n.btn_shadow:before {\r\n  content:\" \";\r\n  position:absolute;\r\n  height: var(--height);\r\n  margin-top: calc(var(--raise) + (var(--raise)/1.2)); \r\n  width:var(--width);\r\n  background: var(--bg-shadow-color);\r\n  border-radius: var(--rounded);\r\n  transition:transform 0.2s ease-out;\r\n  border: var(--border) solid transparent;\r\n}\r\n.btn_back:before{\r\n  content:\" \";\r\n  position: absolute;\r\n  height: var(--height);\r\n  margin-top: var(--raise);\r\n  width:var(--width);\r\n  border: var(--border) solid transparent;\r\n  background: var(--bg-back-color);\r\n  border-radius:var(--rounded);\r\n  transition:transform 0.1s ease-out;\r\n} \r\n.btn_front{\r\n  position: absolute;\r\n  height: var(--height);\r\n  width:var(--width);\r\n  background: var(--bg-front-color);\r\n  display: flex;\r\n  align-items: center;\r\n  justify-content: center;\r\n  border-radius:var(--rounded);\r\n  border: var(--border_style);\r\n  transition:transform 0.1s ease-out;\r\n}\r\n\r\n/*on mouse move in button zone add classes*/\r\n.btn_shadow_left:before{\r\n  transition: transform 0.2s ease-out;\r\n  transform:skewY(calc(1deg * var(--rotate_invers)));\r\n}\r\n.btn_shadow_right:before{\r\n  transition:transform 0.2s ease-out;\r\n  transform:skewY(calc(1deg * var(--rotate)));\r\n}\r\n.btn_shadow_default:before{\r\n  transform:skew(0) translateZ(0);\r\n}\r\n.btn_shadow_default:hover:before{\r\n  transform: translateY(calc((var(--raise)/4) * -1 )); \r\n}      \r\n.btn_shadow_default:active:before{ \r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n} \r\n.btn_shadow_default:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n.btn_shadow_left:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n.btn_shadow_right:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n/*btn_front events*/\r\n.btn_front_left{\r\n  transform:skewY(calc(1deg * var(--rotate_invers)));\r\n}\r\n.btn_front_right{\r\n  transform:skewY(calc(1deg * var(--rotate)));\r\n  transition:transform 0.2s ease-out;\r\n}\r\n.btn_front_default{\r\n  transform:skew(0) translateZ(0);\r\n  transition:transform 0.2s ease-out;\r\n}\r\n\r\n.btn_front_left:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n.btn_front_right:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n.btn_front_default:hover{\r\n  transform: translateY(calc(var(--raise) * 0.5));\r\n\r\n}\r\n.btn_front_default:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n} \r\n\r\n\r\n/*loading*/\r\n.btn_loading_wrapp{\r\n  position: absolute;\r\n  height: var(--height);\r\n   width:var(--width);\r\n\r\n  margin-left:calc(var(--border)*-1);/* padding for borders of parent */\r\n  margin-right:calc(var(--border)*-1);/* padding for borders of parent */\r\n  background: var(--bg-back-color);\r\n  display: flex;\r\n  align-items: center;\r\n  justify-content: center;\r\n  border-radius:var(--rounded);\r\n  border: var(--border_style);\r\n  overflow: hidden;\r\n  z-index:1;\r\n}\r\n\r\n.btn_loading_wrapp:before{\r\n  content:\" \";\r\n  position: absolute;\r\n  height: var(--height);\r\n  width: 0;\r\n  left: 0;\r\n  right: 0;\r\n  background: var(--bg-front-color);\r\n  z-index:-1;\r\n}\r\n\r\n.btn_loading_2:before{\r\n  width:100%;\r\n  transition: width 1s ease-in;\r\n}\r\n.opacity-0{\r\n  opacity:0;\r\n}\r\n.hidden{\r\n  display:none;\r\n}\r\n\r\n\r\n\r\n\r\n/*waves animation*/\r\n.btn_loading_2 .txt_loading{\r\n  animation: slide-up 0.5s ease-in-out;\r\n    position:absolute\r\n\r\n}\r\n.btn_loading_2 .txt_loaded{\r\n  animation: slide-down 0.5s ease-in-out;\r\n    position:absolute\r\n}\r\n@keyframes slide-down {\r\n  0% {\r\n    transform: translateY(-150%);\r\n    opacity: 0;\r\n  }\r\n  100% {\r\n    transform: translateY(0);\r\n    opacity: 1;\r\n  }\r\n}\r\n@keyframes slide-up {\r\n  0% {\r\n    transform: translateY(150%);\r\n    opacity: 0;\r\n  }\r\n  100% {\r\n    transform: translateY(0);\r\n    opacity: 1;\r\n  }\r\n}\r\n/* water*/\r\n\r\n.bubble { \r\n/*     --bg-front-color: #95D44A; */\r\n/*   --bg-back-color: #52A934; */\r\n  --bg_front_color:#462255;\r\n  --bg_back_color:#602F75;\r\n  width: 100%;\r\n  height: 100%;\r\n  background-color: var(--bg-front-color);\r\n  overflow: hidden;\r\n  transform: translate(0, 0);\r\nborder-radius:var(--rounded);\r\n}\r\n.bubble .water {\r\n  position: absolute;\r\n  left: 0;\r\n  top: 0;\r\n  z-index: 2;\r\n  width: 100%;\r\n  height: 100%;\r\n  -webkit-transform: translate(0, 100%);\r\n  transform: translate(0, 100%); \r\n} \r\n.bubble .water_wave_back {\r\n  width:200%;\r\n  left: 0;\r\n  top:0;\r\n  position:relative;\r\n  fill: var(--bg_back_color);\r\n  \r\n  animation: wave-back 0.8s infinite linear;\r\n}\r\n.bubble .water_wave_front {\r\n    margin-top: 8px;\r\n  width:200%;\r\n  left: 0;\r\n  top:0;\r\n  position:absolute;\r\n  fill: var(--bg_front_color);\r\n  animation: wave-front 0.6s infinite linear;\r\n}\r\n\r\n.liquid{\r\n  background:var(--bg_front_color);\r\n  width: 100%;\r\n  height: 120%;\r\n  margin-top:-6px;\r\n  \r\n}\r\n\r\n\r\n@keyframes wave-front {\r\n  100% {\r\n    transform: translate(-50%, 0);\r\n  }\r\n}\r\n@keyframes wave-back {\r\n  100% {\r\n    transform: translate(-50%, 0);\r\n  }\r\n} \r\n\r\n\r\n\r\n#valor_actual{ \r\n  font-family:\'Ubuntu\';\r\n  font-weight:700;\r\n}\r\n\r\n/* It is not necessary only for the body*/\r\n.h-screen{\r\n    height:90vh; \r\n}\r\n.mt-auto{\r\n  margin-top:136px; \r\n}\r\n.justify-center {\r\n    justify-content: center;\r\n}\r\n.items-center {\r\n    align-items: center;\r\n}\r\n.flex-wrap {\r\n    flex-wrap: wrap;\r\n}\r\n.flex-col {\r\n    flex-direction: column;\r\n}\r\n.flex{\r\n display : flex;\r\n}',41),(35,'2024-09-25 18:41:08','2024-09-25 18:41:08','js','var raise=10;\r\nbtn = document.querySelector(\'.btn\');\r\n\r\n  var loading=false;\r\n  var style = btn.style;\r\n  style.setProperty(\'--raise\', raise+\'px\');\r\n  btn.addEventListener(\'mousemove\', event => {\r\n    if(raise>0){\r\n    const width = btn.offsetWidth;\r\n    const height = btn.offsetHeight;\r\n    const rotationDegrees = Math.atan((height * (raise) + raise) / (width )) ;\r\n    const btnWidth = btn.offsetWidth;\r\n    const mouseX = event.clientX - btn.getBoundingClientRect().left;\r\n    style.setProperty(\'--rotate\', (rotationDegrees));\r\n    style.setProperty(\'--rotate_invers\', (rotationDegrees * -1));\r\n\r\n    this.rotate_Y = -10 * ((mouseX - btnWidth / 2) / (btnWidth / 2));\r\n    if(this.rotate_Y>2){\r\n      btn.classList.remove(\'btn_shadow_default\', \'btn_shadow_left\');\r\n      btn.classList.add(\'btn_shadow_right\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_default\', \'btn_front_right\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_left\');\r\n    }\r\n    if(this.rotate_Y>-2 && this.rotate_Y<2){\r\n      btn.classList.remove(\'btn_shadow_right\', \'btn_shadow_left\');\r\n      btn.classList.add(\'btn_shadow_default\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_right\', \'btn_front_left\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_default\');\r\n    }\r\n    if(this.rotate_Y<-2){\r\n      console.log(\'right\');\r\n      btn.classList.remove(\'btn_shadow_right\', \'btn_shadow_default\');\r\n      btn.classList.add(\'btn_shadow_left\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_default\', \'btn_front_left\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_right\');\r\n    }\r\n   \r\n    }\r\n  });\r\n  \r\n\r\n    btn.addEventListener(\"click\", function() {\r\n    if(!loading){\r\n    const childElement= btn.querySelector(\'.btn_loading_wrapp\');\r\n    childElement.classList.remove(\'opacity-0\');\r\n    childElement.classList.add(\'flex\',\'btn_loading_2\');\r\n    document.querySelector(\'.btn_loading\').style.pointerEvents = \"none\";\r\n    document.querySelector(\'.btn_front\').style.pointerEvents = \"none\";\r\n    document.querySelector(\'.txt_loaded\').classList.add(\'hidden\');\r\n    document.querySelector(\'.txt_loading\').classList.remove(\'hidden\');\r\n    \r\n    setTimeout(function() {\r\n        document.querySelector(\'.txt_loaded\').classList.remove(\'hidden\');\r\n    document.querySelector(\'.txt_loading\').classList.add(\'hidden\');\r\n          setTimeout(function() {\r\n     childElement.classList.add(\'opacity-0\');\r\n    childElement.classList.remove(\'flex\',\'btn_loading_2\');\r\n    document.querySelector(\'.btn_loading\').style.pointerEvents = \"auto\";\r\n    document.querySelector(\'.btn_front\').style.pointerEvents = \"auto\";\r\n    //document.querySelector(\'.btn_front\').style.opacity = \"1\";\r\n    }, 1000);\r\n    }, 3000);\r\n    }\r\n  });\r\n\r\n\r\n\r\nfunction obtenerValor() {\r\n  // Obtén el elemento input por su ID\r\n  var rangeInput = document.getElementById(\"button_range\");\r\n\r\n  // Obtén el valor actual del input de rango\r\n  var valor = rangeInput.value;\r\n  var btn = document.querySelector(\".btn\");\r\n    var style = btn.style;\r\n  style.setProperty(\'--raise\', valor+\'px\');\r\n  raise=valor;\r\n  // Actualiza el texto para mostrar el valor actual\r\n  document.getElementById(\"valor_actual\").textContent = \"Valor actual: \" + valor;\r\n}',41),(36,'2024-09-25 18:41:45','2024-09-25 18:41:45','html','<div class=\"flex flex-col flex-wrap overflow-x-hidden  justify-center items-center h-screen\">\r\n<div class=\"btn btn_primary btn_shadow btn_loading\" >\r\n  <div class=\"btn_back\"> \r\n       <div class=\"btn_front\">\r\n      <div class=\"btn_loading_wrapp opacity-0\">\r\n         \r\n        <p class=\"txt_loading\">Loading</p>\r\n        <p class=\"txt_loaded hidden\">succes</p>\r\n      </div>\r\n      <p>Hover</p>\r\n    </div> \r\n  </div>\r\n</div>\r\n  <input class=\"mt-auto\" type=\"range\" id=\"button_range\" min=\"0\" max=\"100\" value=\"10\" oninput=\"obtenerValor()\">\r\n<p id=\"valor_actual\">Valor actual: 100</p> \r\n</div>',42),(37,'2024-09-25 18:41:45','2024-09-25 18:41:45','css','/*style for btn*/\r\n.btn{\r\n  --font-body-family:-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica Neue,sans-serif;\r\n  --height: 50px;  \r\n  --raise: 100px;\r\n  --rounded: 10px;\r\n  --rotate: 1;\r\n  --rotate_invers: 1 * - 1;\r\n  --border:4px;\r\n  --border_style:solid #004c65 var(--border);\r\n  --bg-front-color: #AAD3EA;\r\n  --bg-shadow-color: #4B4B4B84;\r\n  --bg-back-color: #004c65;\r\n  --font-color: white;\r\n  --font-body-weight:800;\r\n  --width:180px;\r\n  color:var(--font-color);\r\n  font-family:var(--font-body-family);\r\n  height: calc(var(--height) + var(--raise)); \r\n  width:var(--width);\r\n  font-weight:var(--font-body-weight);\r\n}\r\n\r\n.btn_primary{\r\n  --bg-shadow-color: #4B4B4B20;\r\n  --bg-front-color: #338a9d;\r\n  --bg-back-color: #9a453f;\r\n  --border_style:solid #b84a41 var(--border);\r\n  --font-color: #ea893e;\r\n}\r\n\r\n.btn_shadow {\r\n  border: var(--border) solid transparent;\r\n}\r\n.btn_shadow:before {\r\n  content:\" \";\r\n  position:absolute;\r\n  height: var(--height);\r\n  margin-top: calc(var(--raise) + (var(--raise)/1.2)); \r\n  width:var(--width);\r\n  background: var(--bg-shadow-color);\r\n  border-radius: var(--rounded);\r\n  transition:transform 0.2s ease-out;\r\n  border: var(--border) solid transparent;\r\n}\r\n.btn_back:before{\r\n  content:\" \";\r\n  position: absolute;\r\n  height: var(--height);\r\n  margin-top: var(--raise);\r\n  width:var(--width);\r\n  border: var(--border) solid transparent;\r\n  background: var(--bg-back-color);\r\n  border-radius:var(--rounded);\r\n  transition:transform 0.1s ease-out;\r\n} \r\n.btn_front{\r\n  position: absolute;\r\n  height: var(--height);\r\n  width:var(--width);\r\n  background: var(--bg-front-color);\r\n  display: flex;\r\n  align-items: center;\r\n  justify-content: center;\r\n  border-radius:var(--rounded);\r\n  border: var(--border_style);\r\n  transition:transform 0.1s ease-out;\r\n}\r\n\r\n/*on mouse move in button zone add classes*/\r\n.btn_shadow_left:before{\r\n  transition: transform 0.2s ease-out;\r\n  transform:skewY(calc(1deg * var(--rotate_invers)));\r\n}\r\n.btn_shadow_right:before{\r\n  transition:transform 0.2s ease-out;\r\n  transform:skewY(calc(1deg * var(--rotate)));\r\n}\r\n.btn_shadow_default:before{\r\n  transform:skew(0) translateZ(0);\r\n}\r\n.btn_shadow_default:hover:before{\r\n  transform: translateY(calc((var(--raise)/4) * -1 )); \r\n}      \r\n.btn_shadow_default:active:before{ \r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n} \r\n.btn_shadow_default:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n.btn_shadow_left:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n.btn_shadow_right:active:before{\r\n  transform: translateY(calc((var(--raise)/1.2) * -1 ));\r\n}\r\n/*btn_front events*/\r\n.btn_front_left{\r\n  transform:skewY(calc(1deg * var(--rotate_invers)));\r\n}\r\n.btn_front_right{\r\n  transform:skewY(calc(1deg * var(--rotate)));\r\n  transition:transform 0.2s ease-out;\r\n}\r\n.btn_front_default{\r\n  transform:skew(0) translateZ(0);\r\n  transition:transform 0.2s ease-out;\r\n}\r\n\r\n.btn_front_left:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n.btn_front_right:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n}\r\n.btn_front_default:hover{\r\n  transform: translateY(calc(var(--raise) * 0.5));\r\n\r\n}\r\n.btn_front_default:active{\r\n  transform:skewY(0) translateY(var(--raise));\r\n} \r\n\r\n\r\n/*loading*/\r\n.btn_loading_wrapp{\r\n  position: absolute;\r\n  height: var(--height);\r\n   width:var(--width);\r\n\r\n  margin-left:calc(var(--border)*-1);/* padding for borders of parent */\r\n  margin-right:calc(var(--border)*-1);/* padding for borders of parent */\r\n  background: var(--bg-back-color);\r\n  display: flex;\r\n  align-items: center;\r\n  justify-content: center;\r\n  border-radius:var(--rounded);\r\n  border: var(--border_style);\r\n  overflow: hidden;\r\n  z-index:1;\r\n}\r\n\r\n.btn_loading_wrapp:before{\r\n  content:\" \";\r\n  position: absolute;\r\n  height: var(--height);\r\n  width: 0;\r\n  left: 0;\r\n  right: 0;\r\n  background: var(--bg-front-color);\r\n  z-index:-1;\r\n}\r\n\r\n.btn_loading_2:before{\r\n  width:100%;\r\n  transition: width 1s ease-in;\r\n}\r\n.opacity-0{\r\n  opacity:0;\r\n}\r\n.hidden{\r\n  display:none;\r\n}\r\n\r\n\r\n\r\n\r\n/*waves animation*/\r\n.btn_loading_2 .txt_loading{\r\n  animation: slide-up 0.5s ease-in-out;\r\n    position:absolute\r\n\r\n}\r\n.btn_loading_2 .txt_loaded{\r\n  animation: slide-down 0.5s ease-in-out;\r\n    position:absolute\r\n}\r\n@keyframes slide-down {\r\n  0% {\r\n    transform: translateY(-150%);\r\n    opacity: 0;\r\n  }\r\n  100% {\r\n    transform: translateY(0);\r\n    opacity: 1;\r\n  }\r\n}\r\n@keyframes slide-up {\r\n  0% {\r\n    transform: translateY(150%);\r\n    opacity: 0;\r\n  }\r\n  100% {\r\n    transform: translateY(0);\r\n    opacity: 1;\r\n  }\r\n}\r\n/* water*/\r\n\r\n.bubble { \r\n/*     --bg-front-color: #95D44A; */\r\n/*   --bg-back-color: #52A934; */\r\n  --bg_front_color:#462255;\r\n  --bg_back_color:#602F75;\r\n  width: 100%;\r\n  height: 100%;\r\n  background-color: var(--bg-front-color);\r\n  overflow: hidden;\r\n  transform: translate(0, 0);\r\nborder-radius:var(--rounded);\r\n}\r\n.bubble .water {\r\n  position: absolute;\r\n  left: 0;\r\n  top: 0;\r\n  z-index: 2;\r\n  width: 100%;\r\n  height: 100%;\r\n  -webkit-transform: translate(0, 100%);\r\n  transform: translate(0, 100%); \r\n} \r\n.bubble .water_wave_back {\r\n  width:200%;\r\n  left: 0;\r\n  top:0;\r\n  position:relative;\r\n  fill: var(--bg_back_color);\r\n  \r\n  animation: wave-back 0.8s infinite linear;\r\n}\r\n.bubble .water_wave_front {\r\n    margin-top: 8px;\r\n  width:200%;\r\n  left: 0;\r\n  top:0;\r\n  position:absolute;\r\n  fill: var(--bg_front_color);\r\n  animation: wave-front 0.6s infinite linear;\r\n}\r\n\r\n.liquid{\r\n  background:var(--bg_front_color);\r\n  width: 100%;\r\n  height: 120%;\r\n  margin-top:-6px;\r\n  \r\n}\r\n\r\n\r\n@keyframes wave-front {\r\n  100% {\r\n    transform: translate(-50%, 0);\r\n  }\r\n}\r\n@keyframes wave-back {\r\n  100% {\r\n    transform: translate(-50%, 0);\r\n  }\r\n} \r\n\r\n\r\n\r\n#valor_actual{ \r\n  font-family:\'Ubuntu\';\r\n  font-weight:700;\r\n}\r\n\r\n/* It is not necessary only for the body*/\r\n.h-screen{\r\n    height:90vh; \r\n}\r\n.mt-auto{\r\n  margin-top:136px; \r\n}\r\n.justify-center {\r\n    justify-content: center;\r\n}\r\n.items-center {\r\n    align-items: center;\r\n}\r\n.flex-wrap {\r\n    flex-wrap: wrap;\r\n}\r\n.flex-col {\r\n    flex-direction: column;\r\n}\r\n.flex{\r\n display : flex;\r\n}',42),(38,'2024-09-25 18:41:45','2024-09-25 18:41:45','js','var raise=10;\r\nbtn = document.querySelector(\'.btn\');\r\n\r\n  var loading=false;\r\n  var style = btn.style;\r\n  style.setProperty(\'--raise\', raise+\'px\');\r\n  btn.addEventListener(\'mousemove\', event => {\r\n    if(raise>0){\r\n    const width = btn.offsetWidth;\r\n    const height = btn.offsetHeight;\r\n    const rotationDegrees = Math.atan((height * (raise) + raise) / (width )) ;\r\n    const btnWidth = btn.offsetWidth;\r\n    const mouseX = event.clientX - btn.getBoundingClientRect().left;\r\n    style.setProperty(\'--rotate\', (rotationDegrees));\r\n    style.setProperty(\'--rotate_invers\', (rotationDegrees * -1));\r\n\r\n    this.rotate_Y = -10 * ((mouseX - btnWidth / 2) / (btnWidth / 2));\r\n    if(this.rotate_Y>2){\r\n      btn.classList.remove(\'btn_shadow_default\', \'btn_shadow_left\');\r\n      btn.classList.add(\'btn_shadow_right\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_default\', \'btn_front_right\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_left\');\r\n    }\r\n    if(this.rotate_Y>-2 && this.rotate_Y<2){\r\n      btn.classList.remove(\'btn_shadow_right\', \'btn_shadow_left\');\r\n      btn.classList.add(\'btn_shadow_default\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_right\', \'btn_front_left\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_default\');\r\n    }\r\n    if(this.rotate_Y<-2){\r\n      console.log(\'right\');\r\n      btn.classList.remove(\'btn_shadow_right\', \'btn_shadow_default\');\r\n      btn.classList.add(\'btn_shadow_left\');\r\n      btn.querySelector(\'.btn_front\').classList.remove(\'btn_front_default\', \'btn_front_left\');\r\n      btn.querySelector(\'.btn_front\').classList.add(\'btn_front_right\');\r\n    }\r\n   \r\n    }\r\n  });\r\n  \r\n\r\n    btn.addEventListener(\"click\", function() {\r\n    if(!loading){\r\n    const childElement= btn.querySelector(\'.btn_loading_wrapp\');\r\n    childElement.classList.remove(\'opacity-0\');\r\n    childElement.classList.add(\'flex\',\'btn_loading_2\');\r\n    document.querySelector(\'.btn_loading\').style.pointerEvents = \"none\";\r\n    document.querySelector(\'.btn_front\').style.pointerEvents = \"none\";\r\n    document.querySelector(\'.txt_loaded\').classList.add(\'hidden\');\r\n    document.querySelector(\'.txt_loading\').classList.remove(\'hidden\');\r\n    \r\n    setTimeout(function() {\r\n        document.querySelector(\'.txt_loaded\').classList.remove(\'hidden\');\r\n    document.querySelector(\'.txt_loading\').classList.add(\'hidden\');\r\n          setTimeout(function() {\r\n     childElement.classList.add(\'opacity-0\');\r\n    childElement.classList.remove(\'flex\',\'btn_loading_2\');\r\n    document.querySelector(\'.btn_loading\').style.pointerEvents = \"auto\";\r\n    document.querySelector(\'.btn_front\').style.pointerEvents = \"auto\";\r\n    //document.querySelector(\'.btn_front\').style.opacity = \"1\";\r\n    }, 1000);\r\n    }, 3000);\r\n    }\r\n  });\r\n\r\n\r\n\r\nfunction obtenerValor() {\r\n  // Obtén el elemento input por su ID\r\n  var rangeInput = document.getElementById(\"button_range\");\r\n\r\n  // Obtén el valor actual del input de rango\r\n  var valor = rangeInput.value;\r\n  var btn = document.querySelector(\".btn\");\r\n    var style = btn.style;\r\n  style.setProperty(\'--raise\', valor+\'px\');\r\n  raise=valor;\r\n  // Actualiza el texto para mostrar el valor actual\r\n  document.getElementById(\"valor_actual\").textContent = \"Valor actual: \" + valor;\r\n}',42),(40,'2024-09-26 15:58:25','2024-09-26 16:05:00','styles','flex gap-4 items-center',50),(41,'2024-09-26 15:58:49','2024-09-26 15:58:49','styles','flex justify-between items-center',48),(42,'2024-09-26 16:00:12','2024-09-26 16:06:40','styles','flex gap-4 items-center w-min',51),(43,'2024-09-26 16:01:52','2024-09-26 16:06:50','styles','w-[100px]',60),(44,'2024-09-26 16:15:00','2024-09-26 16:15:00','url','https://picsum.photos/200',64);
/*!40000 ALTER TABLE `subcomponent_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'superadmin','superadmin@gmail.com',NULL,'$2y$10$KGOPo3tq2s735phYCdSQD.X2NdjE847Ufs9SJ2rJdTWLEMvayJINW','977502170','Calle','super','admin',NULL,'2024-09-24 15:16:48','2024-09-24 15:16:48');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-28  1:18:18
