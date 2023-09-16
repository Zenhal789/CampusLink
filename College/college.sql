/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.6.12-log : Database - college
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`college` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `college`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

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
(25,'Can add add_student',7,'add_add_student'),
(26,'Can change add_student',7,'change_add_student'),
(27,'Can delete add_student',7,'delete_add_student'),
(28,'Can view add_student',7,'view_add_student'),
(29,'Can add department',8,'add_department'),
(30,'Can change department',8,'change_department'),
(31,'Can delete department',8,'delete_department'),
(32,'Can view department',8,'view_department'),
(33,'Can add login',9,'add_login'),
(34,'Can change login',9,'change_login'),
(35,'Can delete login',9,'delete_login'),
(36,'Can view login',9,'view_login'),
(37,'Can add staff',10,'add_staff'),
(38,'Can change staff',10,'change_staff'),
(39,'Can delete staff',10,'delete_staff'),
(40,'Can view staff',10,'view_staff'),
(41,'Can add sub_allocation',11,'add_sub_allocation'),
(42,'Can change sub_allocation',11,'change_sub_allocation'),
(43,'Can delete sub_allocation',11,'delete_sub_allocation'),
(44,'Can view sub_allocation',11,'view_sub_allocation'),
(45,'Can add course',12,'add_course'),
(46,'Can change course',12,'change_course'),
(47,'Can delete course',12,'delete_course'),
(48,'Can view course',12,'view_course'),
(49,'Can add attendance',13,'add_attendance'),
(50,'Can change attendance',13,'change_attendance'),
(51,'Can delete attendance',13,'delete_attendance'),
(52,'Can view attendance',13,'view_attendance'),
(53,'Can add complaint',14,'add_complaint'),
(54,'Can change complaint',14,'change_complaint'),
(55,'Can delete complaint',14,'delete_complaint'),
(56,'Can view complaint',14,'view_complaint');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `collegeapp_add_student` */

DROP TABLE IF EXISTS `collegeapp_add_student`;

CREATE TABLE `collegeapp_add_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `COURSE_id` bigint(20) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Collegeapp_add_stude_COURSE_id_fc8b728c_fk_Collegeap` (`COURSE_id`),
  KEY `Collegeapp_add_student_LOGIN_id_41325a79_fk_Collegeapp_login_id` (`LOGIN_id`),
  CONSTRAINT `Collegeapp_add_student_LOGIN_id_41325a79_fk_Collegeapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `collegeapp_login` (`id`),
  CONSTRAINT `Collegeapp_add_stude_COURSE_id_fc8b728c_fk_Collegeap` FOREIGN KEY (`COURSE_id`) REFERENCES `collegeapp_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `collegeapp_add_student` */

insert  into `collegeapp_add_student`(`id`,`name`,`email`,`phone`,`dob`,`status`,`COURSE_id`,`LOGIN_id`) values 
(11,'rahull','808885585','rhl@gmail.com','2000-02-10','Approved',1,8),
(12,'ryan','ryan@gmail.com','8943258528','2000-02-10','Rejected',1,10);

/*Table structure for table `collegeapp_attendance` */

DROP TABLE IF EXISTS `collegeapp_attendance`;

CREATE TABLE `collegeapp_attendance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `STUDENT_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Collegeapp_attendanc_STUDENT_id_ad53215e_fk_Collegeap` (`STUDENT_id`),
  CONSTRAINT `Collegeapp_attendanc_STUDENT_id_ad53215e_fk_Collegeap` FOREIGN KEY (`STUDENT_id`) REFERENCES `collegeapp_add_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `collegeapp_attendance` */

insert  into `collegeapp_attendance`(`id`,`status`,`date`,`STUDENT_id`) values 
(3,'present','2023-05-29',11),
(4,'absent','2023-06-07',12),
(5,'present','2023-09-13',12);

/*Table structure for table `collegeapp_complaint` */

DROP TABLE IF EXISTS `collegeapp_complaint`;

CREATE TABLE `collegeapp_complaint` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `complaint` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `reply` varchar(100) NOT NULL,
  `STUDENT_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Collegeapp_complaint_STUDENT_id_id_c526f745_fk_Collegeap` (`STUDENT_id_id`),
  CONSTRAINT `Collegeapp_complaint_STUDENT_id_id_c526f745_fk_Collegeap` FOREIGN KEY (`STUDENT_id_id`) REFERENCES `collegeapp_add_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `collegeapp_complaint` */

insert  into `collegeapp_complaint`(`id`,`date`,`complaint`,`status`,`reply`,`STUDENT_id_id`) values 
(1,'2023-05-29','not good','replied','we will look for that buddy',11),
(2,'2023-05-30','very bad ','replied','got it\r\n',11),
(3,'2023-09-13','average ','replied','got it',11),
(4,'2023-09-14','badd','replied','okk',12);

/*Table structure for table `collegeapp_course` */

DROP TABLE IF EXISTS `collegeapp_course`;

CREATE TABLE `collegeapp_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(100) NOT NULL,
  `DEPT_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Collegeapp_course_DEPT_id_644db59c_fk_Collegeapp_department_id` (`DEPT_id`),
  CONSTRAINT `Collegeapp_course_DEPT_id_644db59c_fk_Collegeapp_department_id` FOREIGN KEY (`DEPT_id`) REFERENCES `collegeapp_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `collegeapp_course` */

insert  into `collegeapp_course`(`id`,`coursename`,`DEPT_id`) values 
(1,'BCA',1),
(2,'robotics',2),
(3,'AI',2),
(4,'ML',2),
(5,'Machine learning',1);

/*Table structure for table `collegeapp_department` */

DROP TABLE IF EXISTS `collegeapp_department`;

CREATE TABLE `collegeapp_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `depart_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `collegeapp_department` */

insert  into `collegeapp_department`(`id`,`depart_name`) values 
(1,' SCIENCE'),
(2,'IT'),
(3,'FINANCE'),
(4,'CS');

/*Table structure for table `collegeapp_login` */

DROP TABLE IF EXISTS `collegeapp_login`;

CREATE TABLE `collegeapp_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `usertype` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `collegeapp_login` */

insert  into `collegeapp_login`(`id`,`username`,`password`,`usertype`) values 
(1,'admin','admin','admin'),
(3,'zayani','zayani','staff'),
(7,'','',''),
(8,'rahul','rahull','student'),
(9,'Zenhal','8254126578','staff'),
(10,'ryan','8943258528','student'),
(11,'harifa','8965234582','staff');

/*Table structure for table `collegeapp_staff` */

DROP TABLE IF EXISTS `collegeapp_staff`;

CREATE TABLE `collegeapp_staff` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `DEPARTMENT_id` bigint(20) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Collegeapp_staff_DEPARTMENT_id_cd73561b_fk_Collegeap` (`DEPARTMENT_id`),
  KEY `Collegeapp_staff_LOGIN_id_f7273152_fk_Collegeapp_login_id` (`LOGIN_id`),
  CONSTRAINT `Collegeapp_staff_DEPARTMENT_id_cd73561b_fk_Collegeap` FOREIGN KEY (`DEPARTMENT_id`) REFERENCES `collegeapp_department` (`id`),
  CONSTRAINT `Collegeapp_staff_LOGIN_id_f7273152_fk_Collegeapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `collegeapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `collegeapp_staff` */

insert  into `collegeapp_staff`(`id`,`staff_name`,`phone`,`email`,`photo`,`dob`,`DEPARTMENT_id`,`LOGIN_id`) values 
(1,'Muhammed ','08138887191','Zenhalzenu789@gmail.com','/media/20230914-130412jpg','2000-02-10',1,3),
(2,'Zenhal','8254126578','Zenhalzenu789@gmail.com','/media/20230606-094654jpg','2000-02-20',2,9),
(3,'harifa','8965234582','harifa@gmail.com','/media/20230913-182535.jpg','2003-01-13',3,11);

/*Table structure for table `collegeapp_sub_allocation` */

DROP TABLE IF EXISTS `collegeapp_sub_allocation`;

CREATE TABLE `collegeapp_sub_allocation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `DEP_id` bigint(20) NOT NULL,
  `STAFF_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Collegeapp_sub_alloc_DEP_id_8b4878cb_fk_Collegeap` (`DEP_id`),
  KEY `Collegeapp_sub_alloc_STAFF_id_484bbb87_fk_Collegeap` (`STAFF_id`),
  CONSTRAINT `Collegeapp_sub_alloc_DEP_id_8b4878cb_fk_Collegeap` FOREIGN KEY (`DEP_id`) REFERENCES `collegeapp_department` (`id`),
  CONSTRAINT `Collegeapp_sub_alloc_STAFF_id_484bbb87_fk_Collegeap` FOREIGN KEY (`STAFF_id`) REFERENCES `collegeapp_staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `collegeapp_sub_allocation` */

insert  into `collegeapp_sub_allocation`(`id`,`DEP_id`,`STAFF_id`) values 
(1,1,3),
(2,1,2),
(4,3,3);

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(7,'Collegeapp','add_student'),
(13,'Collegeapp','attendance'),
(14,'Collegeapp','complaint'),
(12,'Collegeapp','course'),
(8,'Collegeapp','department'),
(9,'Collegeapp','login'),
(10,'Collegeapp','staff'),
(11,'Collegeapp','sub_allocation'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'Collegeapp','0001_initial','2023-05-25 06:12:09.412477'),
(2,'contenttypes','0001_initial','2023-05-25 06:12:09.506226'),
(3,'auth','0001_initial','2023-05-25 06:12:10.506232'),
(4,'admin','0001_initial','2023-05-25 06:12:10.740629'),
(5,'admin','0002_logentry_remove_auto_add','2023-05-25 06:12:10.756227'),
(6,'admin','0003_logentry_add_action_flag_choices','2023-05-25 06:12:10.771859'),
(7,'contenttypes','0002_remove_content_type_name','2023-05-25 06:12:10.959351'),
(8,'auth','0002_alter_permission_name_max_length','2023-05-25 06:12:11.053104'),
(9,'auth','0003_alter_user_email_max_length','2023-05-25 06:12:11.131226'),
(10,'auth','0004_alter_user_username_opts','2023-05-25 06:12:11.146889'),
(11,'auth','0005_alter_user_last_login_null','2023-05-25 06:12:11.224988'),
(12,'auth','0006_require_contenttypes_0002','2023-05-25 06:12:11.224988'),
(13,'auth','0007_alter_validators_add_error_messages','2023-05-25 06:12:11.240600'),
(14,'auth','0008_alter_user_username_max_length','2023-05-25 06:12:11.318730'),
(15,'auth','0009_alter_user_last_name_max_length','2023-05-25 06:12:11.412504'),
(16,'auth','0010_alter_group_name_max_length','2023-05-25 06:12:11.490601'),
(17,'auth','0011_update_proxy_permissions','2023-05-25 06:12:11.521853'),
(18,'auth','0012_alter_user_first_name_max_length','2023-05-25 06:12:11.599983'),
(19,'sessions','0001_initial','2023-05-25 06:12:11.693725'),
(20,'Collegeapp','0002_complaint','2023-05-29 06:28:47.110786'),
(21,'Collegeapp','0003_alter_complaint_date','2023-05-31 04:39:12.888911');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('03c6f214qmnfup264rc92hqqi1na8p8u','eyJsaWQiOjF9:1q8bLC:NZLV9nj6luoGBI6NTDOCB-BRsnXBAeYxT7L1qzSUnuw','2023-06-26 06:47:50.354188'),
('1vlep556jz4r7d8yduinecg2sqeyaxzp','eyJsaWQiOjEwfQ:1qghaC:2NugOjX93cArXKZsia4O6u6kYLe5k8HbmrhONlBc334','2023-09-28 08:20:16.710187'),
('3lje8lgz6r9cmsb4gxk8yssx4yqi5rih','eyJsaWQiOjN9:1qfvSY:uaq56AQ1PyKh1oCZ9ElPWbCnzDdDLwZ0IYm5kvySSpQ','2023-09-26 04:57:10.114379'),
('x0xutv2gs2p7dsazxh4g85sbewt53ix0','eyJsaWQiOjN9:1qQhid:Q4kij-x9ZZRPwDXvwPqnjkEzYL1KxHVmRy6y2EP16SY','2023-08-15 05:14:51.134509');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
