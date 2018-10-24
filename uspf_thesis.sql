/*
SQLyog Ultimate v12.3.2 (64 bit)
MySQL - 5.7.23-log : Database - uspf_thesis
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`uspf_thesis` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `uspf_thesis`;

/*Table structure for table `tb_category_types` */

DROP TABLE IF EXISTS `tb_category_types`;

CREATE TABLE `tb_category_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_category_types` */

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

/*Table structure for table `tb_civil_statuses` */

DROP TABLE IF EXISTS `tb_civil_statuses`;

CREATE TABLE `tb_civil_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_civil_statuses` */

/*Table structure for table `tb_client_types` */

DROP TABLE IF EXISTS `tb_client_types`;

CREATE TABLE `tb_client_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_client_types` */

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
  CONSTRAINT `competency_assessment_to_take_table_client_type_foreign` FOREIGN KEY (`client_type`) REFERENCES `tb_client_types` (`id`),
  CONSTRAINT `competency_assessment_to_take_table_program_sector_foreign` FOREIGN KEY (`program_sector`) REFERENCES `tb_program_sector_types` (`id`),
  CONSTRAINT `competency_assessment_to_take_table_training_program_foreign` FOREIGN KEY (`training_program`) REFERENCES `tb_training_program_types` (`id`),
  CONSTRAINT `competency_assessment_to_take_table_trainor_foreign` FOREIGN KEY (`trainor`) REFERENCES `tb_trainors_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_competency_assessment_to_take_table` */

/*Table structure for table `tb_contact` */

DROP TABLE IF EXISTS `tb_contact`;

CREATE TABLE `tb_contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trainor` int(10) unsigned NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_type` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_trainor_index` (`trainor`),
  KEY `contact_contact_type_index` (`contact_type`),
  CONSTRAINT `contact_contact_type_foreign` FOREIGN KEY (`contact_type`) REFERENCES `tb_contact_types` (`id`),
  CONSTRAINT `contact_trainor_foreign` FOREIGN KEY (`trainor`) REFERENCES `tb_trainors_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_contact` */

/*Table structure for table `tb_contact_types` */

DROP TABLE IF EXISTS `tb_contact_types`;

CREATE TABLE `tb_contact_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_contact_types` */

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

/*Table structure for table `tb_designations` */

DROP TABLE IF EXISTS `tb_designations`;

CREATE TABLE `tb_designations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designations_region_index` (`region`),
  CONSTRAINT `designations_region_foreign` FOREIGN KEY (`region`) REFERENCES `tb_regions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_designations` */

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

/*Table structure for table `tb_employment_statuses` */

DROP TABLE IF EXISTS `tb_employment_statuses`;

CREATE TABLE `tb_employment_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_employment_statuses` */

/*Table structure for table `tb_employment_types` */

DROP TABLE IF EXISTS `tb_employment_types`;

CREATE TABLE `tb_employment_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_employment_types` */

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_migrations` */

insert  into `tb_migrations`(`id`,`migration`,`batch`) values 
(1,'2018_10_22_000000_create_regions_table',1),
(2,'2018_10_23_000000_create_user_types_table',1),
(3,'2018_10_23_000001_create_designations_table',1),
(4,'2018_10_23_000002_create_password_resets_table',1),
(5,'2018_10_23_000003_create_users_table',1),
(6,'2018_10_23_000004_create_statuses_table',1),
(7,'2018_10_23_000005_create_contact_types_table',1),
(8,'2018_10_23_085442_create_civil_statuses_table',1),
(9,'2018_10_23_085443_create_trainors_info_table',1),
(10,'2018_10_23_085859_create_mailing_address_table',1),
(11,'2018_10_23_090221_create_contacts_table',1),
(12,'2018_10_23_090400_create_employment_types_table',1),
(13,'2018_10_23_091231_create_employment_statuses_table',1),
(14,'2018_10_23_091726_create_education_background_table',1),
(15,'2018_10_23_092207_create_course_title_table',1),
(16,'2018_10_23_093252_create_training_program_types_table',1),
(17,'2018_10_23_093342_create_program_sector_types_table',1),
(18,'2018_10_23_093457_create_client_types_table',1),
(19,'2018_10_23_093935_create_occupation_types_table',1),
(20,'2018_10_23_094558_create_certificate_types_table',1),
(21,'2018_10_23_094648_create_training_base_types_table',1),
(22,'2018_10_23_094738_create_category_types_table',1),
(23,'2018_10_23_094819_create_proficiency_types_table',1),
(24,'2018_10_23_094925_create_licenses_examination_passed_table',1),
(25,'2018_10_23_095209_create_competency_assessment_passed_table',1),
(26,'2018_10_23_095422_create_family_background_table',1),
(27,'2018_10_23_095806_create_competency_assessment_to_take_table',1),
(28,'2018_10_23_095807_create_working_experience_table',1),
(29,'2018_10_23_095808_create_trainings_seminars_attended_table',1),
(30,'2018_10_23_095809_create_dependents_table',1);

/*Table structure for table `tb_occupation_types` */

DROP TABLE IF EXISTS `tb_occupation_types`;

CREATE TABLE `tb_occupation_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_occupation_types` */

/*Table structure for table `tb_password_resets` */

DROP TABLE IF EXISTS `tb_password_resets`;

CREATE TABLE `tb_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_password_resets` */

/*Table structure for table `tb_proficiency_types` */

DROP TABLE IF EXISTS `tb_proficiency_types`;

CREATE TABLE `tb_proficiency_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_proficiency_types` */

/*Table structure for table `tb_program_sector_types` */

DROP TABLE IF EXISTS `tb_program_sector_types`;

CREATE TABLE `tb_program_sector_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_program_sector_types` */

/*Table structure for table `tb_regions` */

DROP TABLE IF EXISTS `tb_regions`;

CREATE TABLE `tb_regions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_regions` */

/*Table structure for table `tb_statuses` */

DROP TABLE IF EXISTS `tb_statuses`;

CREATE TABLE `tb_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_statuses` */

/*Table structure for table `tb_training_base_types` */

DROP TABLE IF EXISTS `tb_training_base_types`;

CREATE TABLE `tb_training_base_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_training_base_types` */

/*Table structure for table `tb_training_program_types` */

DROP TABLE IF EXISTS `tb_training_program_types`;

CREATE TABLE `tb_training_program_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_training_program_types` */

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
  CONSTRAINT `trainings_seminars_attended_category_foreign` FOREIGN KEY (`category`) REFERENCES `tb_category_types` (`id`),
  CONSTRAINT `trainings_seminars_attended_certificate_types_foreign` FOREIGN KEY (`certificate_types`) REFERENCES `tb_certificate_types` (`id`),
  CONSTRAINT `trainings_seminars_attended_proficiency_foreign` FOREIGN KEY (`proficiency`) REFERENCES `tb_proficiency_types` (`id`),
  CONSTRAINT `trainings_seminars_attended_training_base_foreign` FOREIGN KEY (`training_base`) REFERENCES `tb_training_base_types` (`id`),
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
  `designation` int(10) unsigned NOT NULL,
  `application_status` int(10) unsigned NOT NULL,
  `application_status_result_at` date DEFAULT NULL,
  `application_status_result_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trainors_info_civil_status_index` (`civil_status`),
  KEY `trainors_info_designation_index` (`designation`),
  KEY `trainors_info_application_status_index` (`application_status`),
  KEY `trainors_info_application_status_result_by_index` (`application_status_result_by`),
  CONSTRAINT `trainors_info_application_status_foreign` FOREIGN KEY (`application_status`) REFERENCES `tb_statuses` (`id`),
  CONSTRAINT `trainors_info_application_status_result_by_foreign` FOREIGN KEY (`application_status_result_by`) REFERENCES `tb_users` (`id`),
  CONSTRAINT `trainors_info_civil_status_foreign` FOREIGN KEY (`civil_status`) REFERENCES `tb_civil_statuses` (`id`),
  CONSTRAINT `trainors_info_designation_foreign` FOREIGN KEY (`designation`) REFERENCES `tb_designations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_trainors_info` */

/*Table structure for table `tb_user_types` */

DROP TABLE IF EXISTS `tb_user_types`;

CREATE TABLE `tb_user_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_user_types` */

/*Table structure for table `tb_users` */

DROP TABLE IF EXISTS `tb_users`;

CREATE TABLE `tb_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` int(10) unsigned NOT NULL,
  `designation` int(10) unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_user_type_index` (`user_type`),
  KEY `users_designation_index` (`designation`),
  CONSTRAINT `users_designation_foreign` FOREIGN KEY (`designation`) REFERENCES `tb_designations` (`id`),
  CONSTRAINT `users_user_type_foreign` FOREIGN KEY (`user_type`) REFERENCES `tb_user_types` (`id`)
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
  CONSTRAINT `working_experience_table_occupation_type_foreign` FOREIGN KEY (`occupation_type`) REFERENCES `tb_occupation_types` (`id`),
  CONSTRAINT `working_experience_table_trainor_foreign` FOREIGN KEY (`trainor`) REFERENCES `tb_trainors_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_working_experience_table` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
