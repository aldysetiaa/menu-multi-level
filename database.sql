/*
SQLyog Ultimate v10.3 
MySQL - 5.5.5-10.4.6-MariaDB : Database - tesdover
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tesdover` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tesdover`;

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `child` int(11) DEFAULT NULL,
  `nama_menu` varchar(30) DEFAULT NULL,
  `menu_aktif` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `menu` */

LOCK TABLES `menu` WRITE;

insert  into `menu`(`id_menu`,`child`,`nama_menu`,`menu_aktif`) values (1,0,'Maintenance',1),(2,1,'Menu',1),(3,1,'Group',1),(4,1,'Department',1),(5,1,'Employee',1),(6,1,'Location',1),(7,0,'Transaction',1),(8,7,'Contact Form',1),(9,7,'Sundry Lease',1);

UNLOCK TABLES;

/*Table structure for table `role_menu` */

DROP TABLE IF EXISTS `role_menu`;

CREATE TABLE `role_menu` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `nama_role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `role_menu` */

LOCK TABLES `role_menu` WRITE;

insert  into `role_menu`(`id_role`,`nama_role`) values (1,'Administrator'),(2,'Staff');

UNLOCK TABLES;

/*Table structure for table `role_transaction` */

DROP TABLE IF EXISTS `role_transaction`;

CREATE TABLE `role_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_role` int(11) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_role` (`id_role`),
  KEY `role_menu` (`id_menu`),
  CONSTRAINT `role_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`),
  CONSTRAINT `role_transaction_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role_menu` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `role_transaction` */

LOCK TABLES `role_transaction` WRITE;

insert  into `role_transaction`(`id`,`id_role`,`id_menu`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,2,7),(11,2,8),(12,2,9);

UNLOCK TABLES;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(50) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `level` enum('Administrator','Staff') DEFAULT NULL,
  `id_role` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`id_role`),
  CONSTRAINT `role` FOREIGN KEY (`id_role`) REFERENCES `role_menu` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

LOCK TABLES `user` WRITE;

insert  into `user`(`id`,`nama_lengkap`,`username`,`password`,`level`,`id_role`) values (1,'Aldy Setiawan','aldy','aldy','Administrator',1),(2,'Willy','willy','willy','Staff',2);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
