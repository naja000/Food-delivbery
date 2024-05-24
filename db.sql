/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 8.0.33 : Database - food_delivery
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`food_delivery` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `food_delivery`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add category',7,'add_category'),
(26,'Can change category',7,'change_category'),
(27,'Can delete category',7,'delete_category'),
(28,'Can view category',7,'view_category'),
(29,'Can add delivery_agent',8,'add_delivery_agent'),
(30,'Can change delivery_agent',8,'change_delivery_agent'),
(31,'Can delete delivery_agent',8,'delete_delivery_agent'),
(32,'Can view delivery_agent',8,'view_delivery_agent'),
(33,'Can add item',9,'add_item'),
(34,'Can change item',9,'change_item'),
(35,'Can delete item',9,'delete_item'),
(36,'Can view item',9,'view_item'),
(37,'Can add login_table',10,'add_login_table'),
(38,'Can change login_table',10,'change_login_table'),
(39,'Can delete login_table',10,'delete_login_table'),
(40,'Can view login_table',10,'view_login_table'),
(41,'Can add order',11,'add_order'),
(42,'Can change order',11,'change_order'),
(43,'Can delete order',11,'delete_order'),
(44,'Can view order',11,'view_order'),
(45,'Can add work',12,'add_work'),
(46,'Can change work',12,'change_work'),
(47,'Can delete work',12,'delete_work'),
(48,'Can view work',12,'view_work'),
(49,'Can add user',13,'add_user'),
(50,'Can change user',13,'change_user'),
(51,'Can delete user',13,'delete_user'),
(52,'Can view user',13,'view_user'),
(53,'Can add review',14,'add_review'),
(54,'Can change review',14,'change_review'),
(55,'Can delete review',14,'delete_review'),
(56,'Can view review',14,'view_review'),
(57,'Can add restaurant',15,'add_restaurant'),
(58,'Can change restaurant',15,'change_restaurant'),
(59,'Can delete restaurant',15,'delete_restaurant'),
(60,'Can view restaurant',15,'view_restaurant'),
(61,'Can add order_item',16,'add_order_item'),
(62,'Can change order_item',16,'change_order_item'),
(63,'Can delete order_item',16,'delete_order_item'),
(64,'Can view order_item',16,'view_order_item'),
(65,'Can add complaint',17,'add_complaint'),
(66,'Can change complaint',17,'change_complaint'),
(67,'Can delete complaint',17,'delete_complaint'),
(68,'Can view complaint',17,'view_complaint'),
(69,'Can add assign',18,'add_assign'),
(70,'Can change assign',18,'change_assign'),
(71,'Can delete assign',18,'delete_assign'),
(72,'Can view assign',18,'view_assign'),
(73,'Can add payment',19,'add_payment'),
(74,'Can change payment',19,'change_payment'),
(75,'Can delete payment',19,'delete_payment'),
(76,'Can view payment',19,'view_payment'),
(77,'Can add location',20,'add_location'),
(78,'Can change location',20,'change_location'),
(79,'Can delete location',20,'delete_location'),
(80,'Can view location',20,'view_location'),
(81,'Can add timeschedule',21,'add_timeschedule'),
(82,'Can change timeschedule',21,'change_timeschedule'),
(83,'Can delete timeschedule',21,'delete_timeschedule'),
(84,'Can view timeschedule',21,'view_timeschedule');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$600000$3u2YEYcJHnfos2Vnfns9Bp$HiQrliN7MA79clZrD2MrjDKvESnUkbslRA9pWIvSulw=','2024-03-14 05:07:42.590688',1,'admin','','','admin@gmail.com',1,1,'2023-12-21 04:32:41.566225');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(18,'fapp','assign'),
(7,'fapp','category'),
(17,'fapp','complaint'),
(8,'fapp','delivery_agent'),
(9,'fapp','item'),
(20,'fapp','location'),
(10,'fapp','login_table'),
(11,'fapp','order'),
(16,'fapp','order_item'),
(19,'fapp','payment'),
(15,'fapp','restaurant'),
(14,'fapp','review'),
(21,'fapp','timeschedule'),
(13,'fapp','user'),
(12,'fapp','work'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-12-19 03:35:54.371933'),
(2,'auth','0001_initial','2023-12-19 03:35:54.620720'),
(3,'admin','0001_initial','2023-12-19 03:35:54.690341'),
(4,'admin','0002_logentry_remove_auto_add','2023-12-19 03:35:54.690341'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-12-19 03:35:54.690341'),
(6,'contenttypes','0002_remove_content_type_name','2023-12-19 03:35:54.751182'),
(7,'auth','0002_alter_permission_name_max_length','2023-12-19 03:35:54.776629'),
(8,'auth','0003_alter_user_email_max_length','2023-12-19 03:35:54.784798'),
(9,'auth','0004_alter_user_username_opts','2023-12-19 03:35:54.801184'),
(10,'auth','0005_alter_user_last_login_null','2023-12-19 03:35:54.832224'),
(11,'auth','0006_require_contenttypes_0002','2023-12-19 03:35:54.836433'),
(12,'auth','0007_alter_validators_add_error_messages','2023-12-19 03:35:54.836433'),
(13,'auth','0008_alter_user_username_max_length','2023-12-19 03:35:54.869220'),
(14,'auth','0009_alter_user_last_name_max_length','2023-12-19 03:35:54.918791'),
(15,'auth','0010_alter_group_name_max_length','2023-12-19 03:35:54.938434'),
(16,'auth','0011_update_proxy_permissions','2023-12-19 03:35:54.943741'),
(17,'auth','0012_alter_user_first_name_max_length','2023-12-19 03:35:54.976820'),
(18,'fapp','0001_initial','2023-12-19 03:35:55.415175'),
(19,'sessions','0001_initial','2023-12-19 03:35:55.438154'),
(20,'fapp','0002_order_status','2023-12-19 05:05:48.129512'),
(21,'fapp','0003_review_restaurant','2023-12-19 07:28:47.632430'),
(22,'fapp','0004_remove_delivery_agent_login_and_more','2023-12-19 09:27:46.497493'),
(23,'fapp','0005_delivery_agent_login','2023-12-19 09:51:52.813566'),
(24,'fapp','0006_remove_order_item_payment_payment','2023-12-24 04:58:56.986504'),
(25,'fapp','0007_location','2023-12-24 11:38:53.246789'),
(26,'fapp','0008_timeschedule','2024-03-12 10:39:55.851897'),
(27,'fapp','0009_timeschedule_status','2024-03-13 04:03:40.123824');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('22hk5m8fzxqkgitwsknubpw36r7zagx2','.eJxVjMsOwiAUBf-FtSE8iqBL9_0Gch8g1QaS0q6M_65Nuul2Zs75iHlicdfqIiJsa4lbT0vckdDixBDoneou-AX12SS1ui4Tyj2Rh-1ybJzmx9GeDgr08l-TRciI7K0Lt-D0QITGM2fwrExOmJggXzPqNJAyPhB7wyYDqGDJefH9Ab0_O-s:1rJt8G:DCh77zNhIlgsnjjb61yB5ewdSB1ALNLzZAEBl0TRfQM','2024-01-14 10:33:24.825747'),
('7xvy2xi8ng61alvelq5fini95kr1c3th','.eJxVjMsOwiAUBf-FtSE8iqBL9_0Gch8g1QaS0q6M_65Nuul2Zs75iHlicdfqIiJsa4lbT0vckdDixBDoneou-AX12SS1ui4Tyj2Rh-1ybJzmx9GeDgr08l-TRciI7K0Lt-D0QITGM2fwrExOmJggXzPqNJAyPhB7wyYDqGDJefH9Ab0_O-s:1rGW1C:QR-MMRtwsBHZBl2kqyl4nqfMEEDoQ2_suasEWfKVBRo','2024-01-05 03:16:10.152115'),
('9fsgiw5fbfeaabdyzr8iwj8altwkwr3s','.eJxVjk0OwiAYRO_C2pACRdCle89Avh-QagNJaVfGu1uSbrp9M_MyXzFPLO76IgJsaw5bi0voRChxYgj0iaUH_IbyqpJqWZcJZa_II23yWTnOj6N7EmRoeV-TQUiI7Iz1N2_VSITaMSdwPOgUMTJBuiZUcaRBO0_sNOsEMHhD1u3SWvvB8fcHwA8-RQ:1rJPks:2QYZQ04_Dq47si1U41Jz5kwluQXvlPTjOA1wzaelHfY','2024-01-13 03:11:18.356830'),
('biggycf8n4rujdsvar9lgmeb5vm67olx','.eJxVjssOgjAURP-la9O0hdrq0j3fQO6jV1BCEwor479LIxu2Z2ZO5qOmkdXdmovqYVuHfitp6StSVp0YAr3TXAN-wfzMmvK8LiPqWtFHWnSXOU2Po3sSDFCGfU0NgiByaHy8RW9bInSBWSCwcZIwMYFcBW1qybgQiYNjJwAmNuTDLs35__n7AyILPqE:1rkdLH:U8DhKxqDDZx7hf-vvcDQ53QASDe0l8HOaLACueJQ1xs','2024-03-28 05:09:23.121072'),
('c94m0f5m601s2bzf0o351piw5q6yi3ie','.eJyrVsrJTFGyMjTQUUpNVrIy1lHKzwcLAPlQKhMoXAsA288Kiw:1rGAVj:PwraDGUffKwJ9PZ5g8vX7nfLYKUvZuTCl3IzvN7K4qA','2024-01-04 04:18:15.133975'),
('r1h3pn4zksli7iyqfspj2eu2qdsj1sc5','.eJxVjE0OgyAYBe_CuiECWqjL7j0D-f6otEYS0VXTu1cTN25n5r2vmjKr3t5UhG0d41ZliQdRRl0YAn1kPgS_YX4VTWVel4z6SPRpqx4Ky_Q828vBCHXc1-QQEiJ714VH6ExLhNYzJ_Dc2CQoTJDuCY201FgfiL1lmwCa4Kjz-6lk1ZvfH0JvPWU:1rHG07:y5cbkT1fO47UBq6RUv5P9FvbngLjhA2TYj1wbWgf3P8','2024-01-07 04:22:07.215993'),
('sx6cf3zy6zumvgf3v41qpjpfa87rn04l','.eJxVjE0OwiAYBe_C2hCgRdCle89Avj-kaiAp7cp4d23ShW7fzLyXSrAuJa1d5jSxOiurDr8bAj2kboDvUG9NU6vLPKHeFL3Trq-N5XnZ3b-DAr18axoQMiKHwcdT9HYkQheYMwQ2LgsKE-RjRisjGRcicXDsMoCJA_mg3h8rMjmn:1rJtMQ:NQGckFZiAqHbikS6CHZ5yiqDNqimb2_Sa7y3U4mHyPM','2024-01-14 10:48:02.020801'),
('uhpa0sy4qpqyq4wrrndqaf8pfyrzniq9','.eJxVjMsOwiAUBf-FtSE8iqBL9_0Gch8g1QaS0q6M_65Nuul2Zs75iHlicTcXEWFbS9x6WuJOhBYnhkDvVHfBL6jPJqnVdZlQ7ok8bJdj4zQ_jvZ0UKCX_5osQkZkb124BacHIjSeOYNnZXLCxAT5mlGngZTxgdgbNhlABUvOi-8Pm0c7vA:1rLHP3:nGaoumulGSGHh7kqh18jppKyKxw1W_W0dQA4c_3F24E','2024-01-18 06:40:29.726581'),
('xqmr04sztc8kyy9ddqb5r3yto5ukmkvw','.eJxVjjkOwjAURO_iGlleEmwo6XMG6y82DkS2lKVC3J0YpUn7ZuZpPmIaWdy1uogA25rDtsQ5NCS0ODEEesfSAn5BeVZJtazziLJV5JEucqgcp8fRPQkyLHlfk0VIiOxs72--1x0RGsecwLEyKWJkgnRNqGNHyjhP7AybBKC8pd7t0lr_n-33ByIRPqQ:1rWFAM:l8PAXjLD3RV4_TOkwncgbIgBiwEV_AToSs2f-zN9PmE','2024-02-17 12:30:38.159273');

/*Table structure for table `fapp_assign` */

DROP TABLE IF EXISTS `fapp_assign`;

CREATE TABLE `fapp_assign` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `delivery_agent_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fapp_assign_delivery_agent_id_ea7a1e33_fk_fapp_delivery_agent_id` (`delivery_agent_id`),
  KEY `fapp_assign_order_id_c5d8fa4e_fk_fapp_order_id` (`order_id`),
  CONSTRAINT `fapp_assign_delivery_agent_id_ea7a1e33_fk_fapp_delivery_agent_id` FOREIGN KEY (`delivery_agent_id`) REFERENCES `fapp_delivery_agent` (`id`),
  CONSTRAINT `fapp_assign_order_id_c5d8fa4e_fk_fapp_order_id` FOREIGN KEY (`order_id`) REFERENCES `fapp_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fapp_assign` */

insert  into `fapp_assign`(`id`,`status`,`date`,`delivery_agent_id`,`order_id`) values 
(1,'On the way','2024-02-02',2,3),
(2,'assigned','2024-02-02',2,7),
(3,'assigned','2024-02-03',3,13),
(4,'assigned','2024-03-14',3,10);

/*Table structure for table `fapp_category` */

DROP TABLE IF EXISTS `fapp_category`;

CREATE TABLE `fapp_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `details` varchar(100) NOT NULL,
  `restaurant_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fapp_category_restaurant_id_02d2af9b_fk_fapp_restaurant_id` (`restaurant_id`),
  CONSTRAINT `fapp_category_restaurant_id_02d2af9b_fk_fapp_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `fapp_restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fapp_category` */

insert  into `fapp_category`(`id`,`category`,`details`,`restaurant_id`) values 
(1,'Veg','ooooooo',1),
(2,'Non veg','ppppp',1),
(3,'Non veg','oooooo',2),
(4,'desert','ghjkl',2);

/*Table structure for table `fapp_complaint` */

DROP TABLE IF EXISTS `fapp_complaint`;

CREATE TABLE `fapp_complaint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` varchar(100) NOT NULL,
  `reply` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `users_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fapp_complaint_users_id_359ba522_fk_fapp_user_id` (`users_id`),
  CONSTRAINT `fapp_complaint_users_id_359ba522_fk_fapp_user_id` FOREIGN KEY (`users_id`) REFERENCES `fapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fapp_complaint` */

insert  into `fapp_complaint`(`id`,`complaint`,`reply`,`date`,`users_id`) values 
(1,'bsns','pending','2023-12-24',2),
(2,'not bad','pending','2024-02-01',3);

/*Table structure for table `fapp_delivery_agent` */

DROP TABLE IF EXISTS `fapp_delivery_agent`;

CREATE TABLE `fapp_delivery_agent` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pincode` bigint NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(100) NOT NULL,
  `restaurant_id` bigint NOT NULL,
  `login_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fapp_delivery_agent_restaurant_id_53b7ac60_fk_fapp_restaurant_id` (`restaurant_id`),
  KEY `fapp_delivery_agent_login_id_6e267d27_fk_fapp_login_table_id` (`login_id`),
  CONSTRAINT `fapp_delivery_agent_login_id_6e267d27_fk_fapp_login_table_id` FOREIGN KEY (`login_id`) REFERENCES `fapp_login_table` (`id`),
  CONSTRAINT `fapp_delivery_agent_restaurant_id_53b7ac60_fk_fapp_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `fapp_restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fapp_delivery_agent` */

insert  into `fapp_delivery_agent`(`id`,`name`,`place`,`post`,`pincode`,`phone`,`email`,`restaurant_id`,`login_id`) values 
(2,'wafa','kollam','kottayam',456789,9876541098,'naja@gmail.com',1,9),
(3,'famis','kannur','kottayam malabar',456789,9876543210,'famis@gmail.com',2,16);

/*Table structure for table `fapp_item` */

DROP TABLE IF EXISTS `fapp_item`;

CREATE TABLE `fapp_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `stock` int NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fapp_item_category_id_9a6e4a11_fk_fapp_category_id` (`category_id`),
  CONSTRAINT `fapp_item_category_id_9a6e4a11_fk_fapp_category_id` FOREIGN KEY (`category_id`) REFERENCES `fapp_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fapp_item` */

insert  into `fapp_item`(`id`,`name`,`image`,`price`,`stock`,`category_id`) values 
(1,'Veg Rice','workshop4_J30JUFD.jpg',100,134,1),
(2,'Shawarma','workshop3_fKvOUJg.jpg',150,54,2),
(3,'Shawaya','phr3.jpg',180,15,3),
(4,'Donets','workshop.jpg',50,26,4);

/*Table structure for table `fapp_location` */

DROP TABLE IF EXISTS `fapp_location`;

CREATE TABLE `fapp_location` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fapp_location_user_id_0a1234af_fk_fapp_user_id` (`user_id`),
  CONSTRAINT `fapp_location_user_id_0a1234af_fk_fapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `fapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fapp_location` */

insert  into `fapp_location`(`id`,`latitude`,`longitude`,`user_id`) values 
(1,11.2577807,75.7845289,4),
(2,11.257710000000001,75.78444333333333,2);

/*Table structure for table `fapp_login_table` */

DROP TABLE IF EXISTS `fapp_login_table`;

CREATE TABLE `fapp_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fapp_login_table` */

insert  into `fapp_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin@gmail.com','admin','admin'),
(2,'naja@gmail.com','naja','restaurant'),
(3,'anu','anu123','user'),
(9,'wafa','wafa','agent'),
(10,'hadhi@gmail.com','hadhi','restaurant'),
(12,'anu','anu','user'),
(13,'','','user'),
(14,'anju','anju','user'),
(15,'rasha','rasha','user'),
(16,'famis','famis','agent');

/*Table structure for table `fapp_order` */

DROP TABLE IF EXISTS `fapp_order`;

CREATE TABLE `fapp_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total` int NOT NULL,
  `time` time(6) NOT NULL,
  `date` date NOT NULL,
  `user_id` bigint NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fapp_order_user_id_4b432c77_fk_fapp_user_id` (`user_id`),
  CONSTRAINT `fapp_order_user_id_4b432c77_fk_fapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `fapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fapp_order` */

insert  into `fapp_order`(`id`,`total`,`time`,`date`,`user_id`,`status`) values 
(3,300,'09:51:15.823246','2023-12-24',2,'assigned'),
(4,200,'15:58:56.664567','2023-12-24',2,'cart'),
(5,200,'15:59:39.333291','2023-12-24',2,'order'),
(6,200,'16:00:50.014121','2023-12-24',2,'order'),
(7,0,'09:23:11.829755','2024-02-01',3,'assigned'),
(8,100,'09:28:20.351878','2024-02-01',3,'order'),
(9,200,'17:57:13.377561','2024-02-02',3,'order'),
(10,360,'19:03:03.706571','2024-02-02',3,'assigned'),
(11,180,'19:04:22.085992','2024-02-02',3,'order'),
(12,200,'17:50:42.119459','2024-02-03',4,'order'),
(13,360,'17:52:48.977077','2024-02-03',4,'assigned');

/*Table structure for table `fapp_order_item` */

DROP TABLE IF EXISTS `fapp_order_item`;

CREATE TABLE `fapp_order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `status` varchar(100) NOT NULL,
  `item_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fapp_order_item_item_id_a954a90e_fk_fapp_item_id` (`item_id`),
  KEY `fapp_order_item_order_id_7eaf084c_fk_fapp_order_id` (`order_id`),
  CONSTRAINT `fapp_order_item_item_id_a954a90e_fk_fapp_item_id` FOREIGN KEY (`item_id`) REFERENCES `fapp_item` (`id`),
  CONSTRAINT `fapp_order_item_order_id_7eaf084c_fk_fapp_order_id` FOREIGN KEY (`order_id`) REFERENCES `fapp_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fapp_order_item` */

insert  into `fapp_order_item`(`id`,`quantity`,`status`,`item_id`,`order_id`) values 
(12,2,'order',3,10),
(13,1,'order',3,11),
(14,2,'order',1,12),
(15,2,'order',3,13);

/*Table structure for table `fapp_payment` */

DROP TABLE IF EXISTS `fapp_payment`;

CREATE TABLE `fapp_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `order_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fapp_payment_order_id_19c91aeb_fk_fapp_order_id` (`order_id`),
  KEY `fapp_payment_user_id_d313acc4_fk_fapp_user_id` (`user_id`),
  CONSTRAINT `fapp_payment_order_id_19c91aeb_fk_fapp_order_id` FOREIGN KEY (`order_id`) REFERENCES `fapp_order` (`id`),
  CONSTRAINT `fapp_payment_user_id_d313acc4_fk_fapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `fapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fapp_payment` */

insert  into `fapp_payment`(`id`,`amount`,`date`,`order_id`,`user_id`) values 
(1,'200','2024-02-02',9,3),
(2,'360','2024-02-02',10,3),
(3,'180','2024-02-02',11,3),
(4,'360','2024-02-03',13,4),
(5,'360','2024-02-03',13,4);

/*Table structure for table `fapp_restaurant` */

DROP TABLE IF EXISTS `fapp_restaurant`;

CREATE TABLE `fapp_restaurant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pincode` bigint NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `login_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fapp_restaurant_login_id_8325365b_fk_fapp_login_table_id` (`login_id`),
  CONSTRAINT `fapp_restaurant_login_id_8325365b_fk_fapp_login_table_id` FOREIGN KEY (`login_id`) REFERENCES `fapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fapp_restaurant` */

insert  into `fapp_restaurant`(`id`,`name`,`place`,`post`,`pincode`,`phone`,`email`,`image`,`latitude`,`longitude`,`login_id`) values 
(1,'rahmath','kannur','kottayam malabar',456789,9876541098,'naja@gmail.com','gym2.jpg',11.7899,45.789,2),
(2,'paragon','kannur','kottayam',670000,9876543210,'hadhi@gmail.com','workshop1.jpg',11.7899,45.789,10);

/*Table structure for table `fapp_review` */

DROP TABLE IF EXISTS `fapp_review`;

CREATE TABLE `fapp_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `review` varchar(100) NOT NULL,
  `rating` double NOT NULL,
  `date` date NOT NULL,
  `users_id` bigint NOT NULL,
  `restaurant_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fapp_review_users_id_0ddaebd5_fk_fapp_user_id` (`users_id`),
  KEY `fapp_review_restaurant_id_b3844105_fk_fapp_restaurant_id` (`restaurant_id`),
  CONSTRAINT `fapp_review_restaurant_id_b3844105_fk_fapp_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `fapp_restaurant` (`id`),
  CONSTRAINT `fapp_review_users_id_0ddaebd5_fk_fapp_user_id` FOREIGN KEY (`users_id`) REFERENCES `fapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fapp_review` */

insert  into `fapp_review`(`id`,`review`,`rating`,`date`,`users_id`,`restaurant_id`) values 
(1,'bdhx',2.5,'2023-12-24',2,1),
(2,'nice',2.5,'2024-02-01',3,2);

/*Table structure for table `fapp_timeschedule` */

DROP TABLE IF EXISTS `fapp_timeschedule`;

CREATE TABLE `fapp_timeschedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `day` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `item_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fapp_timeschedule_item_id_b0427033_fk_fapp_item_id` (`item_id`),
  KEY `fapp_timeschedule_user_id_a419e28c_fk_fapp_user_id` (`user_id`),
  CONSTRAINT `fapp_timeschedule_item_id_b0427033_fk_fapp_item_id` FOREIGN KEY (`item_id`) REFERENCES `fapp_item` (`id`),
  CONSTRAINT `fapp_timeschedule_user_id_a419e28c_fk_fapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `fapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fapp_timeschedule` */

insert  into `fapp_timeschedule`(`id`,`day`,`type`,`item_id`,`user_id`,`status`) values 
(6,'Monday','Breakfast',1,2,'pending'),
(8,'Thursday','Dinner',2,2,'pending'),
(9,'Thursday','launch',3,2,'accept');

/*Table structure for table `fapp_user` */

DROP TABLE IF EXISTS `fapp_user`;

CREATE TABLE `fapp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pincode` bigint NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(100) NOT NULL,
  `login_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fapp_user_login_id_8deb00da_fk_fapp_login_table_id` (`login_id`),
  CONSTRAINT `fapp_user_login_id_8deb00da_fk_fapp_login_table_id` FOREIGN KEY (`login_id`) REFERENCES `fapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fapp_user` */

insert  into `fapp_user`(`id`,`name`,`place`,`post`,`pincode`,`phone`,`email`,`login_id`) values 
(1,'anu','palayam','palayam',876543,876654345,'ghjkl',3),
(2,'anu','calicut','calicut',766555,9797979709,'anu@gmail.com',12),
(3,'anju','calicut','calicut',976567,6969696969,'anju@gmail.com',14),
(4,'rasha','calicut','calicut',566776,6464646494,'rasah@gmail.com',15);

/*Table structure for table `fapp_work` */

DROP TABLE IF EXISTS `fapp_work`;

CREATE TABLE `fapp_work` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `delivery_agent_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fapp_work_delivery_agent_id_b22ec757_fk_fapp_delivery_agent_id` (`delivery_agent_id`),
  CONSTRAINT `fapp_work_delivery_agent_id_b22ec757_fk_fapp_delivery_agent_id` FOREIGN KEY (`delivery_agent_id`) REFERENCES `fapp_delivery_agent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fapp_work` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
