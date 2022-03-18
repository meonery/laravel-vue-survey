# ************************************************************
# Sequel Ace SQL dump
# Version 20016
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.4.18-MariaDB)
# Database: laravel_survey
# Generation Time: 2022-03-18 11:05:01 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
	(5,'2022_02_03_073751_create_surveys_table',1),
	(6,'2022_02_03_073828_create_survey_questions_table',1),
	(7,'2022_02_03_073851_create_survey_answers_table',1),
	(8,'2022_02_03_073904_create_survey_question_answers_table',1),
	(9,'2022_02_16_053355_add_image_column_to_surveys_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table personal_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`)
VALUES
	(1,'App\\Models\\User',1,'main','c14974c99385d411da75841b8ed37d769feeda7d75dcf1de555b7d19428e349a','[\"*\"]','2022-02-18 12:06:23','2022-02-18 12:04:44','2022-02-18 12:06:23'),
	(2,'App\\Models\\User',1,'main','7b41164a7654a9389e884df3f49ccb92ff7452ba15e38e116ebfdf87d3f83f0f','[\"*\"]','2022-02-19 08:20:17','2022-02-19 06:25:35','2022-02-19 08:20:17'),
	(3,'App\\Models\\User',1,'main','dbf71ad0f0a4cef651407559981908d72af3484c0ba8c5018397681e323245ed','[\"*\"]','2022-02-19 10:38:25','2022-02-19 10:03:53','2022-02-19 10:38:25'),
	(4,'App\\Models\\User',1,'main','4a3181a5051ad85cf1d20cc71a148c4858a93f7a81692466c2c721d4a2c60bb4','[\"*\"]','2022-02-21 07:40:58','2022-02-21 06:29:42','2022-02-21 07:40:58'),
	(5,'App\\Models\\User',1,'main','259dc89bc4719e0c76e405b4613ca07f85c2ab9c303114d520c0be22bcec69fe','[\"*\"]','2022-02-23 04:46:38','2022-02-22 07:52:49','2022-02-23 04:46:38'),
	(6,'App\\Models\\User',1,'main','5628579dad556ebb4798db24a00941ffdc4a1b4611b0d1421d65d8ee9f4fbae6','[\"*\"]','2022-02-23 05:26:51','2022-02-22 08:59:35','2022-02-23 05:26:51'),
	(7,'App\\Models\\User',1,'main','3b44c7c98d9fbd5821a088befe0c2ed56909a0d06de1e76e29af2cd5df6d345e','[\"*\"]','2022-02-23 05:03:59','2022-02-23 03:33:55','2022-02-23 05:03:59'),
	(8,'App\\Models\\User',1,'main','6ab3d782642f15aaddda1c8d8f979087714ae821cad9a1b8b29193eb1f31cfde','[\"*\"]','2022-02-23 10:26:48','2022-02-23 05:28:15','2022-02-23 10:26:48'),
	(9,'App\\Models\\User',1,'main','d23338dd900803edb6130179a80bd6aea2549561afbecd0614d207452bf2241f','[\"*\"]','2022-02-24 05:08:54','2022-02-24 05:04:13','2022-02-24 05:08:54'),
	(10,'App\\Models\\User',1,'main','7b01e8240abe3bf41d92a6a0aba347831727d15c7d93aa00e420fa6fbac6f468','[\"*\"]','2022-02-24 08:05:50','2022-02-24 07:25:30','2022-02-24 08:05:50'),
	(11,'App\\Models\\User',1,'main','c501feb427ee910c91987b830cad37cbbe40c9e0ca62bbb11f269fc918b01314','[\"*\"]','2022-02-28 07:17:07','2022-02-28 07:12:54','2022-02-28 07:17:07'),
	(12,'App\\Models\\User',1,'main','ff8198a4ffe579780e9aeefeb9e02891de4297c05284e51d7dda965469f216f3','[\"*\"]','2022-03-01 12:06:08','2022-03-01 10:36:08','2022-03-01 12:06:08'),
	(13,'App\\Models\\User',1,'main','072b2d2a8f5bfa29d33f6cdb2cb3c4b1b83eb69cdc162f3a6789b29977052d8e','[\"*\"]','2022-03-01 14:51:26','2022-03-01 12:08:59','2022-03-01 14:51:26'),
	(14,'App\\Models\\User',1,'main','5b6e75137f73a6f909a3d01ee49cc0f6dd942cd689a515525fa5131d74d20b78','[\"*\"]','2022-03-02 08:02:33','2022-03-02 06:50:18','2022-03-02 08:02:33'),
	(15,'App\\Models\\User',1,'main','b74f1910288d9bd4cc33cc332741c368a5e9c81df1a883a5f78b4faec6241475','[\"*\"]','2022-03-04 08:30:10','2022-03-04 06:02:28','2022-03-04 08:30:10'),
	(16,'App\\Models\\User',1,'main','170f5f1b7e58ed28f09d8bdf9563b353c9ad247470560bd0ac0b38c69e2deae6','[\"*\"]','2022-03-09 09:13:02','2022-03-09 02:00:06','2022-03-09 09:13:02'),
	(17,'App\\Models\\User',1,'main','64dc9bb1e97a759e642a54ea75a40cd648aa216c456144725bdf3aa951bf731d','[\"*\"]','2022-03-10 08:42:04','2022-03-10 05:46:06','2022-03-10 08:42:04'),
	(18,'App\\Models\\User',1,'main','1157818f2ee1173bb8a395e7e0ea87f3b2bb522f3c14798ff550d79415450d42','[\"*\"]','2022-03-10 09:26:18','2022-03-10 08:50:26','2022-03-10 09:26:18'),
	(19,'App\\Models\\User',1,'main','0c8a3ef819d595a20e4e7fa5edd1a8bf40b614c9069be7b7c0ce84158c0b8447','[\"*\"]','2022-03-11 07:04:03','2022-03-11 04:00:39','2022-03-11 07:04:03'),
	(20,'App\\Models\\User',1,'main','2c49ac8948c415de38dfd19b468f909d32e3dc12c786bc3e3532c812e449a9a3','[\"*\"]','2022-03-16 10:48:17','2022-03-16 10:18:10','2022-03-16 10:48:17'),
	(21,'App\\Models\\User',1,'main','4c938e999f9a0ac8fcbef3092c2919c398cf07cd205369d9463848d3699a7d68','[\"*\"]','2022-03-17 14:30:50','2022-03-17 13:29:03','2022-03-17 14:30:50'),
	(22,'App\\Models\\User',1,'main','9c5627b276ccd8f6385fc58062a2456cbce5bde48688fc8cacf564e1680f2576','[\"*\"]','2022-03-17 14:25:55','2022-03-17 14:01:06','2022-03-17 14:25:55'),
	(23,'App\\Models\\User',1,'main','c2187abda5b08cd4e9117fb0a2545d56b0c69c8457a0e1d42f6257fae4c7c0de','[\"*\"]','2022-03-17 14:38:05','2022-03-17 14:35:06','2022-03-17 14:38:05'),
	(26,'App\\Models\\User',1,'main','a37188ffd4f2554c81b3b60b250d87170287b765bbae9d0a29f50f6040222ab7','[\"*\"]','2022-03-18 03:33:38','2022-03-18 03:30:50','2022-03-18 03:33:38'),
	(27,'App\\Models\\User',1,'main','c7effbb15ff2500ed4639f5ba4963d8b1e8b810475f4bee3e748bb1afd21c6dc','[\"*\"]','2022-03-18 03:34:52','2022-03-18 03:34:47','2022-03-18 03:34:52'),
	(29,'App\\Models\\User',1,'main','e76a53598554ce392c07d9eeef631b9d99f5da02d13311fc46098d03f56c2eea','[\"*\"]','2022-03-18 04:09:29','2022-03-18 03:38:36','2022-03-18 04:09:29'),
	(30,'App\\Models\\User',1,'main','4283281fed37f13779cb0a60ed8a410bda9f7601d0f7e955f415aa9913eae696','[\"*\"]','2022-03-18 03:43:12','2022-03-18 03:40:49','2022-03-18 03:43:12');

/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table survey_answers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `survey_answers`;

CREATE TABLE `survey_answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `survey_id` bigint(20) unsigned NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `survey_answers` WRITE;
/*!40000 ALTER TABLE `survey_answers` DISABLE KEYS */;

INSERT INTO `survey_answers` (`id`, `survey_id`, `start_date`, `end_date`)
VALUES
	(1,5,'2022-03-11 07:59:33','2022-03-11 07:59:33'),
	(2,5,'2022-03-11 08:01:03','2022-03-11 08:01:03'),
	(3,5,'2022-03-11 08:04:10','2022-03-11 08:04:10'),
	(4,5,'2022-03-11 08:05:07','2022-03-11 08:05:07'),
	(5,5,'2022-03-11 08:32:11','2022-03-11 08:32:11'),
	(6,23,'2022-03-17 14:01:42','2022-03-17 14:01:42'),
	(7,23,'2022-03-17 14:02:42','2022-03-17 14:02:42'),
	(8,5,'2022-03-17 14:26:02','2022-03-17 14:26:02'),
	(9,8,'2022-03-18 03:35:12','2022-03-18 03:35:12'),
	(10,8,'2022-03-18 03:35:40','2022-03-18 03:35:40'),
	(11,8,'2022-03-18 03:36:18','2022-03-18 03:36:18'),
	(12,8,'2022-03-18 03:36:36','2022-03-18 03:36:36'),
	(13,8,'2022-03-18 03:36:57','2022-03-18 03:36:57');

/*!40000 ALTER TABLE `survey_answers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table survey_question_answers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `survey_question_answers`;

CREATE TABLE `survey_question_answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `survey_question_id` bigint(20) unsigned NOT NULL,
  `survey_answer_id` bigint(20) unsigned NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `survey_question_answers` WRITE;
/*!40000 ALTER TABLE `survey_question_answers` DISABLE KEYS */;

INSERT INTO `survey_question_answers` (`id`, `survey_question_id`, `survey_answer_id`, `answer`, `created_at`, `updated_at`)
VALUES
	(1,1,2,'USA','2022-03-11 08:01:03','2022-03-11 08:01:03'),
	(2,2,2,'[\"Javascript\",\"PHP\"]','2022-03-11 08:01:03','2022-03-11 08:01:03'),
	(3,3,2,'[\"Laravel\"]','2022-03-11 08:01:03','2022-03-11 08:01:03'),
	(4,4,2,'Laravel 5','2022-03-11 08:01:03','2022-03-11 08:01:03'),
	(5,5,2,'[\"REST API\",\"Ecommerce\"]','2022-03-11 08:01:03','2022-03-11 08:01:03'),
	(6,1,3,'Georgia','2022-03-11 08:04:10','2022-03-11 08:04:10'),
	(7,2,3,'[\"Javascript\",\"HTML + CSS\"]','2022-03-11 08:04:10','2022-03-11 08:04:10'),
	(8,3,3,'[\"Yii2\"]','2022-03-11 08:04:10','2022-03-11 08:04:10'),
	(9,4,3,'Laravel 6','2022-03-11 08:04:10','2022-03-11 08:04:10'),
	(10,5,3,'[\"Real Estate\"]','2022-03-11 08:04:10','2022-03-11 08:04:10'),
	(11,2,4,'[\"PHP\"]','2022-03-11 08:05:07','2022-03-11 08:05:07'),
	(12,3,4,'[\"Laravel\",\"Yii2\"]','2022-03-11 08:05:07','2022-03-11 08:05:07'),
	(13,5,4,'[\"Real Estate\",\"REST API\"]','2022-03-11 08:05:07','2022-03-11 08:05:07'),
	(14,1,5,'United Kingdom','2022-03-11 08:32:11','2022-03-11 08:32:11'),
	(15,2,5,'[\"All of the Above\"]','2022-03-11 08:32:11','2022-03-11 08:32:11'),
	(16,3,5,'[\"Codeigniter\",\"Symfony\"]','2022-03-11 08:32:11','2022-03-11 08:32:11'),
	(17,4,5,'Laravel 7','2022-03-11 08:32:11','2022-03-11 08:32:11'),
	(18,10,6,'Test this','2022-03-17 14:01:42','2022-03-17 14:01:42'),
	(19,11,6,'about','2022-03-17 14:01:42','2022-03-17 14:01:42'),
	(20,10,7,'Test','2022-03-17 14:02:42','2022-03-17 14:02:42'),
	(21,1,8,'Georgia','2022-03-17 14:26:02','2022-03-17 14:26:02'),
	(22,2,8,'[\"HTML + CSS\"]','2022-03-17 14:26:02','2022-03-17 14:26:02'),
	(23,12,9,'Yes','2022-03-18 03:35:12','2022-03-18 03:35:12'),
	(24,12,10,'Yes','2022-03-18 03:35:40','2022-03-18 03:35:40'),
	(25,12,11,'Yes','2022-03-18 03:36:18','2022-03-18 03:36:18'),
	(26,12,12,'Yes','2022-03-18 03:36:36','2022-03-18 03:36:36'),
	(27,13,12,'test','2022-03-18 03:36:36','2022-03-18 03:36:36'),
	(28,12,13,'No','2022-03-18 03:36:57','2022-03-18 03:36:57');

/*!40000 ALTER TABLE `survey_question_answers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table survey_questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `survey_questions`;

CREATE TABLE `survey_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `survey_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `survey_questions` WRITE;
/*!40000 ALTER TABLE `survey_questions` DISABLE KEYS */;

INSERT INTO `survey_questions` (`id`, `type`, `question`, `description`, `data`, `survey_id`, `created_at`, `updated_at`)
VALUES
	(1,'select','From which country are you?',NULL,'{\"options\": [{\"uuid\":\"f8af96f2\", \"text\":\"USA\"},{\"uuid\":\"201c1ff5\", \"text\":\"Georgia\"},{\"uuid\":\"b5c09733\", \"text\":\"Germany\"},{\"uuid\":\"2abf1cee\", \"text\":\"India\" },{\"uuid\":\"8d14341b\", \"text\":\"United Kingdom\"}]}',5,'2022-02-20 18:00:00','2022-02-20 18:00:00'),
	(2,'checkbox','Which language videos do you want to see on my channel?','Lorem Ipsum is simply dummy text of the printing and typesetting industry.','{\"options\": [{\"uuid\":\"f8af96f2\", \"text\":\"Javascript\"},{\"uuid\":\"201c1ff5\", \"text\": \"PHP\"},{\"uuid\":\"b5c09733\", \"text\":\"HTML + CSS\"},{\"uuid\":\"2abf1cee\", \"text\":\"All of the Above\"},{\"uuid\":\"8d14341b\", \"text\":\"Everything you think will be good\"}]}',5,'2022-02-20 18:00:00','2022-02-20 18:00:00'),
	(3,'checkbox','Which PHP framework videos do you want to see on my channel?','Lorem Ipsum is simply dummy text of the printing and typesetting industry.','{\"options\": [{\"uuid\": \"f8af96f2\", \"text\": \"Laravel\"},{\"uuid\": \"201c1ff5\", \"text\": \"Yii2\"},{\"uuid\": \"b5c09733\", \"text\": \"Codeigniter\"},{\"uuid\": \"2abf1cee\", \"text\": \"Symfony\"}]}',5,'2022-02-20 18:00:00','2022-02-20 18:00:00'),
	(4,'radio','Which Laravel framework do you love most?','Lorem Ipsum is simply dummy text of the printing and typesetting industry.','{\"options\": [{\"uuid\": \"31132230\", \"text\": \"Laravel 5\"},{\"uuid\": \"0ab53401\", \"text\": \"Laravel 6\"},{\"uuid\": \"748fbsa4\", \"text\": \"Laravel 7\"},{\"uuid\": \"f189hYjk\", \"text\": \"Laravel 8\"}]}',5,'2022-02-20 18:00:00','2022-02-20 18:00:00'),
	(5,'checkbox','What type of projects do you want to see on my channel built with Laravel?','Lorem Ipsum is simply dummy text of the printing and typesetting industry.','{\"options\": [{\"uuid\": \"f8af96f2\", \"text\": \"REST API\"},{\"uuid\": \"201c1ff5\", \"text\": \"Ecommerce\"},{\"uuid\": \"b5c09733\", \"text\": \"Real Estate\"},{\"uuid\": \"2abf1cee\", \"text\": \"All of the Above\"}]}',5,'2022-02-20 18:00:00','2022-02-20 18:00:00'),
	(6,'text','What\'s your favorite youtube channel?',NULL,NULL,5,'2022-02-20 18:00:00','2022-02-20 18:00:00'),
	(7,'textarea','What do you think about TheCodeholic channel?','Write your honest opinion. Everything is anonymous.',NULL,5,'2022-02-20 18:00:00','2022-02-20 18:00:00'),
	(10,'text','Question 1 [updated]',NULL,'[]',23,'2022-03-04 06:37:26','2022-03-04 08:00:43'),
	(11,'radio','Question 2',NULL,'{\"options\":[{\"uuid\":\"520afc85-cc72-4aa1-8433-eeed7cae3c70\",\"text\":\"option 1\"},{\"uuid\":\"a827ab23-c72c-44c8-89d2-e2680846e742\",\"text\":\"option 2\"},{\"uuid\":\"8a0bb75e-7e07-4b61-a57a-b3d34f9372e0\",\"text\":\"about\"}]}',23,'2022-03-04 06:37:26','2022-03-09 02:01:27'),
	(12,'radio','Is Tailwind better than Bootstrap?',NULL,'{\"options\":[{\"uuid\":\"5175f5cb-14e7-456a-9501-ad6b37d06e2b\",\"text\":\"Yes\"},{\"uuid\":\"58988908-3836-4abd-a258-5a489f89d471\",\"text\":\"No\"}]}',8,'2022-03-18 03:32:17','2022-03-18 03:32:17'),
	(13,'textarea','If Yes, Why?',NULL,'[]',8,'2022-03-18 03:33:35','2022-03-18 03:33:35');

/*!40000 ALTER TABLE `survey_questions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table surveys
# ------------------------------------------------------------

DROP TABLE IF EXISTS `surveys`;

CREATE TABLE `surveys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expire_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `surveys` WRITE;
/*!40000 ALTER TABLE `surveys` DISABLE KEYS */;

INSERT INTO `surveys` (`id`, `user_id`, `image`, `title`, `slug`, `status`, `description`, `created_at`, `updated_at`, `expire_date`)
VALUES
	(5,1,'images/kZeE0R9GQFfyfDan.png','TheCodeholic tutorial','thecodeholic-tutorial',1,'My name is Ashlynn. <br>\nI am a Web Developer with 3 years of experience','2022-02-23 05:03:59','2022-02-23 08:10:39','2022-12-31 00:00:00'),
	(6,1,'images/ij4pm0Yh6k3XkBSx.png','Laravel 8','laravel-8',1,'Laravel is a web application framework with expressive, elegant syntax.','2022-02-23 05:06:25','2022-02-23 05:06:25','2022-12-31 00:00:00'),
	(7,1,'images/RzRVS4XzHkqhkU2v.png','Vue 3','vue-3',1,'Vue (pronounced /vjuː/, like view) is a progressive framework for building user interfaces.','2022-02-23 05:07:25','2022-02-23 05:19:45','2022-12-31 00:00:00'),
	(8,1,'images/qViWQePDNfgovgOd.png','Tailwind 3','tailwind-3',0,'A utility-first CSS framework for rapidly building custom user interfaces','2022-02-23 05:20:40','2022-03-18 04:07:10','2022-12-30 00:00:00');

/*!40000 ALTER TABLE `surveys` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Mayriele','ashlynn@example.com',NULL,'$2y$10$gAGHXoQyFvmh0QSI6Y5w4eAQOH8S4PYXasOCQ/E2YuSO3mmAkudTS',NULL,'2022-02-18 12:04:44','2022-02-18 12:04:44'),
	(2,'admin','admin@admin.com',NULL,'$2y$10$dSt7HXK0jAFQzFen09pHLOM3p4ahGc3lTcw0XgivC3Z9qLsHfytwi',NULL,'2022-03-18 03:37:44','2022-03-18 03:37:44');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
