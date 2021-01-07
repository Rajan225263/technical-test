/*
SQLyog Enterprise - MySQL GUI v7.02 
MySQL - 5.5.5-10.4.11-MariaDB : Database - nanosoft_tecnical_test_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`nanosoft_tecnical_test_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `nanosoft_tecnical_test_db`;

/*Table structure for table `answers` */

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `question_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answers_question_id_foreign` (`question_id`),
  CONSTRAINT `answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `answers` */

/*Table structure for table `manage_transactions` */

DROP TABLE IF EXISTS `manage_transactions`;

CREATE TABLE `manage_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `last_tran_no` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `manage_transactions` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2021_01_01_054143_create_questions_table',1),(4,'2021_01_01_054417_create_answers_table',1),(5,'2021_01_01_054910_create_manage_transactions_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_mcq` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'I',
  `status` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `questions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `questions` */

insert  into `questions`(`id`,`name`,`number_of_mcq`,`type`,`status`,`created_at`,`updated_at`) values (1,'What is your favourite color','Red,Blue,Green,White','I','Active','2021-01-01 00:00:00','2021-01-02 13:08:59'),(2,'What is your home district name','Dhaka,Khulna,BNCC,Dinajpur','I','Active','2021-01-01 00:00:00','2021-01-02 13:29:10'),(3,'What is your country name','Bangladesh,Canada,England','I','Active','2021-01-01 00:00:00','2021-01-02 12:46:19'),(4,'what is your favourate cricket team name','Banglades,Australia','I','Active','2021-01-01 00:00:00','2021-01-02 12:43:02'),(5,'What is your favourite programming language','PHP,JAVA,PYTHON,DOT NET','I','Active','2021-01-01 00:00:00','2021-01-02 12:45:13'),(6,'Which one Laravel command line interface','CLI,php artisan,composer,git','I','Active','2021-01-01 00:00:00','2021-01-02 12:43:29'),(7,'Which command is used to start laravel server','php artisan serve,php artisan start,php artisan start-server,php artisan project_name','I','Active','2021-01-01 00:00:00','2021-01-02 13:59:34'),(8,'What is it Blade','Template Engine,package,view file,framework','I','Active','2021-01-01 00:00:00','2021-01-02 13:49:27'),(9,'The View files in Laravel end in','.vue,.php,.blade,.blade.php','I','Active','2021-01-01 00:00:00','2021-01-02 12:44:50'),(10,'Who developed Laravel','Taylor Otwell,Bhatta,James Gosling,Rasmus Lerdorf','I','Active','2021-01-01 00:00:00','2021-01-02 14:10:09');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
