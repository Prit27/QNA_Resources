/*
SQLyog Community v12.15 (64 bit)
MySQL - 5.7.33-log : Database - qnadbtest2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`qnadbtest2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `qnadbtest2`;

/*Table structure for table `answer` */

DROP TABLE IF EXISTS `answer`;

CREATE TABLE `answer` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `total_likes` bigint(20) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8frr4bcabmmeyyu60qt7iiblo` (`question_id`),
  KEY `FK68tbcw6bunvfjaoscaj851xpb` (`user_id`),
  CONSTRAINT `FK68tbcw6bunvfjaoscaj851xpb` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK8frr4bcabmmeyyu60qt7iiblo` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `answer` */

insert  into `answer`(`id`,`description`,`total_likes`,`question_id`,`user_id`) values 
(25,'Answer is 1',0,18,5),
(26,'Answer is 2',0,18,6);

/*Table structure for table `answer_like` */

DROP TABLE IF EXISTS `answer_like`;

CREATE TABLE `answer_like` (
  `id` bigint(20) NOT NULL,
  `answer_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl7pr13s181idjq8qw2csdc8u9` (`answer_id`),
  KEY `FKhxjcqux2ns8h2jlng81xr5r79` (`user_id`),
  CONSTRAINT `FKhxjcqux2ns8h2jlng81xr5r79` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKl7pr13s181idjq8qw2csdc8u9` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `answer_like` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `answer_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdqc83j2n6hemidegfkim17d3l` (`answer_id`),
  KEY `FK8kcum44fvpupyw6f5baccx25c` (`user_id`),
  CONSTRAINT `FK8kcum44fvpupyw6f5baccx25c` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKdqc83j2n6hemidegfkim17d3l` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comment` */

insert  into `comment`(`id`,`comment`,`answer_id`,`user_id`) values 
(27,'Great explaination mate ',25,4),
(28,'Bad Explaination',25,6);

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` bigint(20) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `company` */

insert  into `company`(`id`,`company_name`) values 
(0,NULL),
(2,'Amazon'),
(3,'Delloite'),
(37,'Flipkart');

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hibernate_sequence` */

insert  into `hibernate_sequence`(`next_val`) values 
(38);

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` bigint(20) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `subtopic_id` bigint(20) DEFAULT NULL,
  `total_likes` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK29lvjbtuqadquc7vu3ydt5tq1` (`company_id`),
  KEY `FK4ekrlbqiybwk8abhgclfjwnmc` (`user_id`),
  CONSTRAINT `FK29lvjbtuqadquc7vu3ydt5tq1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK4ekrlbqiybwk8abhgclfjwnmc` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `question` */

insert  into `question`(`id`,`company_id`,`description`,`subtopic_id`,`total_likes`,`user_id`) values 
(18,0,'This is a Question',10,2,4),
(21,2,'This is a Question 21',7,0,4),
(23,3,'This is a Question 23',9,1,5);

/*Table structure for table `question_company` */

DROP TABLE IF EXISTS `question_company`;

CREATE TABLE `question_company` (
  `id` bigint(20) NOT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa49y56aidk1iuxy2su36gr91a` (`company_id`),
  KEY `FKdx2rftuugdivucy71m0p7b6p8` (`question_id`),
  CONSTRAINT `FKa49y56aidk1iuxy2su36gr91a` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FKdx2rftuugdivucy71m0p7b6p8` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `question_company` */

insert  into `question_company`(`id`,`company_id`,`question_id`) values 
(33,0,18),
(34,2,21),
(35,3,23),
(36,3,23);

/*Table structure for table `question_likes` */

DROP TABLE IF EXISTS `question_likes`;

CREATE TABLE `question_likes` (
  `id` bigint(20) NOT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmr6he6fnj5ttg8a4b095grbyf` (`question_id`),
  KEY `FKs9lx1s4tuukw2ijmllefdoawk` (`user_id`),
  CONSTRAINT `FKmr6he6fnj5ttg8a4b095grbyf` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `FKs9lx1s4tuukw2ijmllefdoawk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `question_likes` */

insert  into `question_likes`(`id`,`question_id`,`user_id`) values 
(29,18,4),
(30,18,5),
(31,23,5);

/*Table structure for table `question_tag` */

DROP TABLE IF EXISTS `question_tag`;

CREATE TABLE `question_tag` (
  `id` bigint(20) NOT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK98t1ucn99srvf809bi2ceahpc` (`tag_id`),
  CONSTRAINT `FK98t1ucn99srvf809bi2ceahpc` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `question_tag` */

insert  into `question_tag`(`id`,`question_id`,`tag_id`) values 
(19,18,14),
(20,18,15),
(22,21,16),
(24,23,NULL);

/*Table structure for table `subtopic` */

DROP TABLE IF EXISTS `subtopic`;

CREATE TABLE `subtopic` (
  `id` bigint(20) NOT NULL,
  `subtopic_name` varchar(255) DEFAULT NULL,
  `topic_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnw8n22hxt334w98uk45hu4gs` (`topic_id`),
  CONSTRAINT `FKnw8n22hxt334w98uk45hu4gs` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `subtopic` */

insert  into `subtopic`(`id`,`subtopic_name`,`topic_id`) values 
(10,'Queues',0),
(11,'Stack',0),
(12,'Load Balancing',8),
(13,'Normalization',9);

/*Table structure for table `tags` */

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tags` */

insert  into `tags`(`id`,`name`) values 
(0,NULL),
(14,'DSA'),
(15,'ABC'),
(16,'DEF');

/*Table structure for table `topic` */

DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `topic` */

insert  into `topic`(`id`,`name`) values 
(0,NULL),
(8,'System Design'),
(9,'Databases');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`password`,`username`) values 
(4,'prit','prit27'),
(5,'prit','prit2701'),
(6,'prit','prit270100');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
