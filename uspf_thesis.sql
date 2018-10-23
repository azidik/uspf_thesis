/*
SQLyog Ultimate v12.3.2 (64 bit)
MySQL - 5.6.22-log : Database - uspf_thesis
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`uspf_thesis` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `uspf_thesis`;

/*Table structure for table `tb_category` */

DROP TABLE IF EXISTS `tb_category`;

CREATE TABLE `tb_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_category` */

/*Table structure for table `tb_certificate_types` */

DROP TABLE IF EXISTS `tb_certificate_types`;

CREATE TABLE `tb_certificate_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_certificate_types` */

/*Table structure for table `tb_civil_status` */

DROP TABLE IF EXISTS `tb_civil_status`;

CREATE TABLE `tb_civil_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_civil_status` */

/*Table structure for table `tb_client_type` */

DROP TABLE IF EXISTS `tb_client_type`;

CREATE TABLE `tb_client_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_client_type` */

/*Table structure for table `tb_competency_assessment_passed` */

DROP TABLE IF EXISTS `tb_competency_assessment_passed`;

CREATE TABLE `tb_competency_assessment_passed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trainor` int(10) unsigned NOT NULL,
  `industry_sector` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trade_area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classification_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `competency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specialization_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `competency_assessment_passed_trainor_index` (`trainor`),
  CONSTRAINT `competency_assessment_passed_trainor_foreign` FOREIGN KEY (`trainor`) REFERENCES `tb_trainors_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_competency_assessment_passed` */

/*Table structure for table `tb_competency_assessment_to_take_table` */

DROP TABLE IF EXISTS `tb_competency_assessment_to_take_table`;

CREATE TABLE `tb_competency_assessment_to_take_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trainor` int(10) unsigned NOT NULL,
  `date_of_application` date NOT NULL,
  `sector_component` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trade_area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `competency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `training_program` int(10) unsigned NOT NULL,
  `program_sector` int(10) unsigned NOT NULL,
  `client_type` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `competency_assessment_to_take_table_trainor_index` (`trainor`),
  KEY `competency_assessment_to_take_table_training_program_index` (`training_program`),
  KEY `competency_assessment_to_take_table_program_sector_index` (`program_sector`),
  KEY `competency_assessment_to_take_table_client_type_index` (`client_type`),
  CONSTRAINT `competency_assessment_to_take_table_client_type_foreign` FOREIGN KEY (`client_type`) REFERENCES `tb_client_type` (`id`),
  CONSTRAINT `competency_assessment_to_take_table_program_sector_foreign` FOREIGN KEY (`program_sector`) REFERENCES `tb_program_sector` (`id`),
  CONSTRAINT `competency_assessment_to_take_table_training_program_foreign` FOREIGN KEY (`training_program`) REFERENCES `tb_training_program` (`id`),
  CONSTRAINT `competency_assessment_to_take_table_trainor_foreign` FOREIGN KEY (`trainor`) REFERENCES `tb_trainors_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_competency_assessment_to_take_table` */

/*Table structure for table `tb_contact_nos` */

DROP TABLE IF EXISTS `tb_contact_nos`;

CREATE TABLE `tb_contact_nos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trainor` int(10) unsigned NOT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cell` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `others` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_nos_trainor_index` (`trainor`),
  CONSTRAINT `contact_nos_trainor_foreign` FOREIGN KEY (`trainor`) REFERENCES `tb_trainors_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_contact_nos` */

/*Table structure for table `tb_course_title` */

DROP TABLE IF EXISTS `tb_course_title`;

CREATE TABLE `tb_course_title` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trainor` int(10) unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `training_duration_no_of_hours` double(9,2) NOT NULL,
  `date` date NOT NULL,
  `time` datetime NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_title_trainor_index` (`trainor`),
  CONSTRAINT `course_title_trainor_foreign` FOREIGN KEY (`trainor`) REFERENCES `tb_trainors_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_course_title` */

/*Table structure for table `tb_dependents` */

DROP TABLE IF EXISTS `tb_dependents`;

CREATE TABLE `tb_dependents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trainor` int(10) unsigned NOT NULL,
  `dependent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dependents_trainor_index` (`trainor`),
  CONSTRAINT `dependents_trainor_foreign` FOREIGN KEY (`trainor`) REFERENCES `tb_trainors_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_dependents` */

/*Table structure for table `tb_educational_background` */

DROP TABLE IF EXISTS `tb_educational_background`;

CREATE TABLE `tb_educational_background` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trainor` int(10) unsigned NOT NULL,
  `school` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `educational_level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_year` year(4) NOT NULL,
  `degree` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `major` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `units_earned` double(9,2) NOT NULL,
  `honors_received` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `educational_background_trainor_index` (`trainor`),
  CONSTRAINT `educational_background_trainor_foreign` FOREIGN KEY (`trainor`) REFERENCES `tb_trainors_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_educational_background` */

/*Table structure for table `tb_employment_status` */

DROP TABLE IF EXISTS `tb_employment_status`;

CREATE TABLE `tb_employment_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_employment_status` */

/*Table structure for table `tb_employment_type` */

DROP TABLE IF EXISTS `tb_employment_type`;

CREATE TABLE `tb_employment_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_employment_type` */

/*Table structure for table `tb_family_background` */

DROP TABLE IF EXISTS `tb_family_background`;

CREATE TABLE `tb_family_background` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trainor` int(10) unsigned NOT NULL,
  `spouse_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_educational_attainment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_occupation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_average_monthly_income` double(9,2) NOT NULL,
  `fathers_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `f_educational_attainment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `f_occupation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `f_average_monthly_income` double(9,2) NOT NULL,
  `mothers_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_educational_attainment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_occupation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_average_monthly_income` double(9,2) NOT NULL,
  `guardians_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `g_educational_attainment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `g_occupation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `g_average_monthly_income` double(9,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `family_background_trainor_index` (`trainor`),
  CONSTRAINT `family_background_trainor_foreign` FOREIGN KEY (`trainor`) REFERENCES `tb_trainors_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_family_background` */

/*Table structure for table `tb_licenses_examination_passed` */

DROP TABLE IF EXISTS `tb_licenses_examination_passed`;

CREATE TABLE `tb_licenses_examination_passed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trainor` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_taken` year(4) NOT NULL,
  `examination_venue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `licenses_examination_passed_trainor_index` (`trainor`),
  CONSTRAINT `licenses_examination_passed_trainor_foreign` FOREIGN KEY (`trainor`) REFERENCES `tb_trainors_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_licenses_examination_passed` */

/*Table structure for table `tb_mailing_address` */

DROP TABLE IF EXISTS `tb_mailing_address`;

CREATE TABLE `tb_mailing_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trainor` int(10) unsigned NOT NULL,
  `number_street` int(11) NOT NULL,
  `brgy` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` int(11) NOT NULL,
  `po_box_no` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mailing_address_trainor_index` (`trainor`),
  CONSTRAINT `mailing_address_trainor_foreign` FOREIGN KEY (`trainor`) REFERENCES `tb_trainors_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_mailing_address` */

/*Table structure for table `tb_migrations` */

DROP TABLE IF EXISTS `tb_migrations`;

CREATE TABLE `tb_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_migrations` */

insert  into `tb_migrations`(`id`,`migration`,`batch`) values 
(64,'2018_10_23_085442_create_civil_status_table',1),
(65,'2018_10_23_085443_create_trainors_info_table',1),
(66,'2018_10_23_085859_create_mailing_address_table',1),
(67,'2018_10_23_090221_create_contact_nos_table',1),
(68,'2018_10_23_090400_create_employment_type_table',1),
(69,'2018_10_23_091231_create_employment_status_table',1),
(70,'2018_10_23_091726_create_education_background_table',1),
(71,'2018_10_23_092207_create_course_title_table',1),
(72,'2018_10_23_093252_create_training_program_table',1),
(73,'2018_10_23_093342_create_program_sector_table',1),
(74,'2018_10_23_093457_create_client_type_table',1),
(75,'2018_10_23_093935_create_occupation_type_table',1),
(76,'2018_10_23_094558_create_certificate_types_table',1),
(77,'2018_10_23_094648_create_training_base_table',1),
(78,'2018_10_23_094738_create_category_table',1),
(79,'2018_10_23_094819_create_proficiency_table',1),
(80,'2018_10_23_094925_create_licenses_examination_passed_table',1),
(81,'2018_10_23_095209_create_competency_assessment_passed_table',1),
(82,'2018_10_23_095422_create_family_background_table',1),
(83,'2018_10_23_095806_create_competency_assessment_to_take_table',1),
(84,'2018_10_23_095807_create_working_experience_table',1),
(85,'2018_10_23_095808_create_trainings_seminars_attended_table',1),
(86,'2018_10_23_095809_create_dependents_table',1),
(87,'2014_10_12_000000_create_users_table',2),
(88,'2014_10_12_100000_create_password_resets_table',2);

/*Table structure for table `tb_occupation_type` */

DROP TABLE IF EXISTS `tb_occupation_type`;

CREATE TABLE `tb_occupation_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_occupation_type` */

/*Table structure for table `tb_password_resets` */

DROP TABLE IF EXISTS `tb_password_resets`;

CREATE TABLE `tb_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_password_resets` */

/*Table structure for table `tb_proficiency` */

DROP TABLE IF EXISTS `tb_proficiency`;

CREATE TABLE `tb_proficiency` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_proficiency` */

/*Table structure for table `tb_program_sector` */

DROP TABLE IF EXISTS `tb_program_sector`;

CREATE TABLE `tb_program_sector` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_program_sector` */

/*Table structure for table `tb_training_base` */

DROP TABLE IF EXISTS `tb_training_base`;

CREATE TABLE `tb_training_base` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_training_base` */

/*Table structure for table `tb_training_program` */

DROP TABLE IF EXISTS `tb_training_program`;

CREATE TABLE `tb_training_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_training_program` */

/*Table structure for table `tb_trainings_seminars_attended` */

DROP TABLE IF EXISTS `tb_trainings_seminars_attended`;

CREATE TABLE `tb_trainings_seminars_attended` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trainor` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `certificate_types` int(10) unsigned NOT NULL,
  `no_of_hours` double(8,2) NOT NULL,
  `training_base` int(10) unsigned NOT NULL,
  `category` int(10) unsigned NOT NULL,
  `conducted_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proficiency` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trainings_seminars_attended_trainor_index` (`trainor`),
  KEY `trainings_seminars_attended_certificate_types_index` (`certificate_types`),
  KEY `trainings_seminars_attended_training_base_index` (`training_base`),
  KEY `trainings_seminars_attended_category_index` (`category`),
  KEY `trainings_seminars_attended_proficiency_index` (`proficiency`),
  CONSTRAINT `trainings_seminars_attended_category_foreign` FOREIGN KEY (`category`) REFERENCES `tb_category` (`id`),
  CONSTRAINT `trainings_seminars_attended_certificate_types_foreign` FOREIGN KEY (`certificate_types`) REFERENCES `tb_certificate_types` (`id`),
  CONSTRAINT `trainings_seminars_attended_proficiency_foreign` FOREIGN KEY (`proficiency`) REFERENCES `tb_proficiency` (`id`),
  CONSTRAINT `trainings_seminars_attended_training_base_foreign` FOREIGN KEY (`training_base`) REFERENCES `tb_training_base` (`id`),
  CONSTRAINT `trainings_seminars_attended_trainor_foreign` FOREIGN KEY (`trainor`) REFERENCES `tb_trainors_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_trainings_seminars_attended` */

/*Table structure for table `tb_trainors_info` */

DROP TABLE IF EXISTS `tb_trainors_info`;

CREATE TABLE `tb_trainors_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `civil_status` int(10) unsigned NOT NULL,
  `bdate` date NOT NULL,
  `bplace` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `citizenship` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `religion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` double(9,2) NOT NULL,
  `weight` double(9,2) NOT NULL,
  `bloodtype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sss_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gsis_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tin_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distinguishing_remarks` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trainors_info_civil_status_index` (`civil_status`),
  CONSTRAINT `trainors_info_civil_status_foreign` FOREIGN KEY (`civil_status`) REFERENCES `tb_civil_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_trainors_info` */

/*Table structure for table `tb_users` */

DROP TABLE IF EXISTS `tb_users`;

CREATE TABLE `tb_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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

/*Data for the table `tb_users` */

/*Table structure for table `tb_working_experience_table` */

DROP TABLE IF EXISTS `tb_working_experience_table`;

CREATE TABLE `tb_working_experience_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trainor` int(10) unsigned NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `monthly_salary` decimal(9,2) NOT NULL,
  `occupation_type` int(10) unsigned NOT NULL,
  `status_of_appointment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_years_working_exp` double(9,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `working_experience_table_trainor_index` (`trainor`),
  KEY `working_experience_table_occupation_type_index` (`occupation_type`),
  CONSTRAINT `working_experience_table_occupation_type_foreign` FOREIGN KEY (`occupation_type`) REFERENCES `tb_occupation_type` (`id`),
  CONSTRAINT `working_experience_table_trainor_foreign` FOREIGN KEY (`trainor`) REFERENCES `tb_trainors_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_working_experience_table` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
