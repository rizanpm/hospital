/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.28-MariaDB : Database - hospital
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `hospital`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(25,'Can add department',7,'add_department'),
(26,'Can change department',7,'change_department'),
(27,'Can delete department',7,'delete_department'),
(28,'Can view department',7,'view_department'),
(29,'Can add doctor',8,'add_doctor'),
(30,'Can change doctor',8,'change_doctor'),
(31,'Can delete doctor',8,'delete_doctor'),
(32,'Can view doctor',8,'view_doctor'),
(33,'Can add login',9,'add_login'),
(34,'Can change login',9,'change_login'),
(35,'Can delete login',9,'delete_login'),
(36,'Can view login',9,'view_login'),
(37,'Can add patient',10,'add_patient'),
(38,'Can change patient',10,'change_patient'),
(39,'Can delete patient',10,'delete_patient'),
(40,'Can view patient',10,'view_patient'),
(41,'Can add request',11,'add_request'),
(42,'Can change request',11,'change_request'),
(43,'Can delete request',11,'delete_request'),
(44,'Can view request',11,'view_request'),
(45,'Can add complaint',12,'add_complaint'),
(46,'Can change complaint',12,'change_complaint'),
(47,'Can delete complaint',12,'delete_complaint'),
(48,'Can view complaint',12,'view_complaint'),
(49,'Can add sendrequest',11,'add_sendrequest'),
(50,'Can change sendrequest',11,'change_sendrequest'),
(51,'Can delete sendrequest',11,'delete_sendrequest'),
(52,'Can view sendrequest',11,'view_sendrequest');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(12,'hospitalapp','complaint'),
(7,'hospitalapp','department'),
(8,'hospitalapp','doctor'),
(9,'hospitalapp','login'),
(10,'hospitalapp','patient'),
(11,'hospitalapp','sendrequest'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-07-20 06:34:43.030649'),
(2,'auth','0001_initial','2023-07-20 06:34:45.104220'),
(3,'admin','0001_initial','2023-07-20 06:34:45.551292'),
(4,'admin','0002_logentry_remove_auto_add','2023-07-20 06:34:45.569739'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-07-20 06:34:45.576922'),
(6,'contenttypes','0002_remove_content_type_name','2023-07-20 06:34:45.800412'),
(7,'auth','0002_alter_permission_name_max_length','2023-07-20 06:34:46.002274'),
(8,'auth','0003_alter_user_email_max_length','2023-07-20 06:34:46.070235'),
(9,'auth','0004_alter_user_username_opts','2023-07-20 06:34:46.081240'),
(10,'auth','0005_alter_user_last_login_null','2023-07-20 06:34:46.210620'),
(11,'auth','0006_require_contenttypes_0002','2023-07-20 06:34:46.210620'),
(12,'auth','0007_alter_validators_add_error_messages','2023-07-20 06:34:46.241121'),
(13,'auth','0008_alter_user_username_max_length','2023-07-20 06:34:46.288499'),
(14,'auth','0009_alter_user_last_name_max_length','2023-07-20 06:34:46.351007'),
(15,'auth','0010_alter_group_name_max_length','2023-07-20 06:34:46.398325'),
(16,'auth','0011_update_proxy_permissions','2023-07-20 06:34:46.414954'),
(17,'auth','0012_alter_user_first_name_max_length','2023-07-20 06:34:46.470745'),
(18,'hospitalapp','0001_initial','2023-07-20 06:34:47.917556'),
(19,'sessions','0001_initial','2023-07-20 06:34:48.028011'),
(20,'hospitalapp','0002_request_status','2023-07-27 04:57:16.926125'),
(21,'hospitalapp','0003_rename_request_sendrequest_alter_patient_photo','2023-08-21 06:54:50.509831');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('tozl42nsq6n24jds2qat6ynzmf4d8fo5','eyJsaWQiOjZ9:1qfhk2:QwHPL8RZ9npklEuKCMMCGHRd5ITAjEZ2Qno9wijxTiY','2023-09-25 14:18:18.676512');

/*Table structure for table `hospitalapp_complaint` */

DROP TABLE IF EXISTS `hospitalapp_complaint`;

CREATE TABLE `hospitalapp_complaint` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `complaint` varchar(100) NOT NULL,
  `reply` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `PATIENT_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospitalapp_complain_PATIENT_id_cc04093e_fk_hospitala` (`PATIENT_id`),
  CONSTRAINT `hospitalapp_complain_PATIENT_id_cc04093e_fk_hospitala` FOREIGN KEY (`PATIENT_id`) REFERENCES `hospitalapp_patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `hospitalapp_complaint` */

insert  into `hospitalapp_complaint`(`id`,`complaint`,`reply`,`date`,`status`,`PATIENT_id`) values 
(1,'doctor zenhal is not responding','ok','2023-08-22','replied',2),
(2,'doctor rizan is not working properly','i notice it','2023-09-11','replied',3),
(3,'i faced a bad expiriance while doctor zenhal is checking me',' i defnitly take action','2023-09-11','replied',3);

/*Table structure for table `hospitalapp_department` */

DROP TABLE IF EXISTS `hospitalapp_department`;

CREATE TABLE `hospitalapp_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `hospitalapp_department` */

insert  into `hospitalapp_department`(`id`,`name`) values 
(4,'orthology'),
(6,'cardiology'),
(10,'dermatology'),
(12,'ENT');

/*Table structure for table `hospitalapp_doctor` */

DROP TABLE IF EXISTS `hospitalapp_doctor`;

CREATE TABLE `hospitalapp_doctor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `photo` varchar(300) NOT NULL,
  `DEPARTMENT_id` bigint(20) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospitalapp_doctor_LOGIN_id_d1227288_fk_hospitalapp_login_id` (`LOGIN_id`),
  KEY `hospitalapp_doctor_DEPARTMENT_id_ce4e2c9b_fk_hospitala` (`DEPARTMENT_id`),
  CONSTRAINT `hospitalapp_doctor_DEPARTMENT_id_ce4e2c9b_fk_hospitala` FOREIGN KEY (`DEPARTMENT_id`) REFERENCES `hospitalapp_department` (`id`),
  CONSTRAINT `hospitalapp_doctor_LOGIN_id_d1227288_fk_hospitalapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `hospitalapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `hospitalapp_doctor` */

insert  into `hospitalapp_doctor`(`id`,`name`,`gender`,`place`,`post`,`pin`,`district`,`state`,`qualification`,`photo`,`DEPARTMENT_id`,`LOGIN_id`) values 
(2,'mohd rizan','on','tly','temple','670102','kannur','kerala','mbbs','/media/20230822-101324.jpg',4,3),
(3,'danish','on','pallor','784784','214214','kannur','kerala','ccc','/media/20230822-101959.jpg',6,4),
(4,'zenhal','male','chokli','chokli','67412','knnur','kerala','ccc','/media/20230822-101959.jpg',6,5),
(5,'zayani','male','palloor','temple','670201','kannur','kerala','mbbs','/media/20230822-101324.jpg',4,7),
(6,'hamad','male','kochi','670102','670102','kannur','kerala','mbbs','/media/20230822-101959.jpg',12,8),
(9,'shaz','male','chova','kannur','145214','kannur','kerala','mbbs','/media/20230822-101959.jpg',6,11),
(10,'zakariya','male','kollam','karipuya','758475','kollam','kerala','mbbs md','/media/20230822-101324.jpg',4,16);

/*Table structure for table `hospitalapp_login` */

DROP TABLE IF EXISTS `hospitalapp_login`;

CREATE TABLE `hospitalapp_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `hospitalapp_login` */

insert  into `hospitalapp_login`(`id`,`username`,`password`,`type`) values 
(1,'mohd rizan','670102','doctor'),
(2,'mohd ','670102','doctor'),
(3,'mohd rizan','123','doctor'),
(4,'danish','214214','doctor'),
(5,'zenhal','123456','doctor'),
(6,'admin@gmail.com','admin1','admin'),
(7,'zayani','670201','doctor'),
(8,'hamad','670102','doctor'),
(9,'hamad','670102','doctor'),
(10,'priya','777777','doctor'),
(11,'shaz','145214','doctor'),
(12,'shashi','889188','useer'),
(13,'shibu','12345','user'),
(14,'lalitha','789456','user'),
(15,'zenhal mahroof','83838','user'),
(16,'zakariya','758475','doctor'),
(17,'shyam','670102','doctor');

/*Table structure for table `hospitalapp_patient` */

DROP TABLE IF EXISTS `hospitalapp_patient`;

CREATE TABLE `hospitalapp_patient` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospitalapp_patient_LOGIN_id_014ec3a9_fk_hospitalapp_login_id` (`LOGIN_id`),
  CONSTRAINT `hospitalapp_patient_LOGIN_id_014ec3a9_fk_hospitalapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `hospitalapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `hospitalapp_patient` */

insert  into `hospitalapp_patient`(`id`,`name`,`age`,`Email`,`photo`,`gender`,`place`,`post`,`pin`,`district`,`LOGIN_id`) values 
(1,'shashi','33','','/media/20230808-122317.jpg','male','kollam','kp','889188','kollam',12),
(2,'shibu','44','','/media/20230808-123204.jpg','male','trissur','kova','12345','thrissur',13),
(3,'lalitha','23','lalitha33@gmail.com','/media/20230808-123643.jpg','female','wayanad','pillar','789456','wayanad',14),
(4,'zenhal wf','                22','zenhalbridgeway@gmail.com','/media/20230816-125814.jpg','male','palloor','chokli','                83838','                kollam',15);

/*Table structure for table `hospitalapp_sendrequest` */

DROP TABLE IF EXISTS `hospitalapp_sendrequest`;

CREATE TABLE `hospitalapp_sendrequest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `DOCTOR_id` bigint(20) NOT NULL,
  `PATIENT_id` bigint(20) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospitalapp_request_DOCTOR_id_904929b3_fk_hospitalapp_doctor_id` (`DOCTOR_id`),
  KEY `hospitalapp_request_PATIENT_id_058d9b7c_fk_hospitala` (`PATIENT_id`),
  CONSTRAINT `hospitalapp_request_DOCTOR_id_904929b3_fk_hospitalapp_doctor_id` FOREIGN KEY (`DOCTOR_id`) REFERENCES `hospitalapp_doctor` (`id`),
  CONSTRAINT `hospitalapp_request_PATIENT_id_058d9b7c_fk_hospitala` FOREIGN KEY (`PATIENT_id`) REFERENCES `hospitalapp_patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `hospitalapp_sendrequest` */

insert  into `hospitalapp_sendrequest`(`id`,`date`,`DOCTOR_id`,`PATIENT_id`,`status`) values 
(1,'2023-08-21',3,2,'pending');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
