/*
SQLyog Ultimate v9.30 
MySQL - 5.5.40 : Database - ssm_conference_room_yuyue
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm_conference_room_yuyue` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `ssm_conference_room_yuyue`;

/*Table structure for table `reservation` */

DROP TABLE IF EXISTS `reservation`;

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `user` varchar(32) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `reason` varchar(32) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `begintime` time DEFAULT NULL,
  `endtime` time DEFAULT NULL,
  `mark` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reservation_room` (`room_id`),
  CONSTRAINT `fk_reservation_room` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `reservation` */

insert  into `reservation`(`id`,`room_id`,`user`,`username`,`reason`,`mobile`,`date`,`begintime`,`endtime`,`mark`) values (1,1,'zhangs','张三','周会','13539902243','2021-03-18','09:00:00','10:00:00','审核未通过'),(2,1,'zhangs','张三','小组会','13539902243','2021-03-18','10:30:00','11:30:00','审核通过');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`role_id`,`role_name`) values (1,'admin'),(2,'ordinary');

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `message` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `room` */

insert  into `room`(`id`,`name`,`message`) values (1,'光明顶','大型会议室，可使用多媒体，适合开会、讲座'),(2,'达摩院','能够使用多媒体，适合组会，论文答辩'),(3,'罗汉堂','能够使用多媒体，适合开组会，硕/博士毕业论文答辩'),(4,'聚贤庄','大型会议室，可容纳200人，适合举办讲座'),(5,'半山亭','小包间会议室，适合小组讨论'),(6,'侠客岛','小会议室，适合二十人小型会议，含多媒体'),(7,'黑木崖','展览'),(12,'摩天崖','展览');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_role` (`role`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`role`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`role`) values ('admin','管理员','admin',1),('zhangs','张三','123456',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
