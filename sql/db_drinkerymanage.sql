/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.6.26-log : Database - db_drinkerymanage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_drinkerymanage` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_drinkerymanage`;

/*Table structure for table `tb_desk` */

DROP TABLE IF EXISTS `tb_desk`;

CREATE TABLE `tb_desk` (
  `num` varchar(5) NOT NULL,
  `seating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_desk` */

insert  into `tb_desk`(`num`,`seating`) values ('8001',6),('8002',6),('8003',8),('8004',2),('8006',8),('8008',8);

/*Table structure for table `tb_menu` */

DROP TABLE IF EXISTS `tb_menu`;

CREATE TABLE `tb_menu` (
  `num` char(8) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `unit` varchar(4) DEFAULT NULL,
  `unit_price` int(11) DEFAULT NULL,
  `state` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_menu` */

insert  into `tb_menu`(`num`,`sort_id`,`name`,`code`,`unit`,`unit_price`,`state`) values ('07122401',22,'红*狮子头','hsszt','盘',168,'销售'),('07122402',22,'虾*蝎将','xbxj','盘',128,'销售'),('07122403',23,'雪*火焰山','xmhys','盘',16,'销售'),('07122404',22,'水*肉片','szrp','碗',66,'销售'),('07122405',24,'纯*','cs','瓶',3,'销售'),('07122406',24,'可乐','kl','瓶',6,'销售'),('07122407',26,'水饺','sj','斤',16,'销售'),('07122408',22,'清*鲤鱼','qzly','盘',68,'销售'),('07122801',22,'干*鲫鱼','gbjy','盘',56,'销售'),('07122802',22,'干*蚕蛹','gbcy','盘',98,'销售'),('08011501',23,'a','33','33',33,'删除'),('08011502',23,'f','f','f',3,'删除'),('08011503',23,'d','d','d',4,'删除'),('08011504',22,'小鱼','XY','盘',10,'删除'),('16011901',22,'s','1','1',128,'销售');

/*Table structure for table `tb_order_form` */

DROP TABLE IF EXISTS `tb_order_form`;

CREATE TABLE `tb_order_form` (
  `num` char(11) NOT NULL,
  `desk_num` varchar(5) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `money` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_order_form` */

insert  into `tb_order_form`(`num`,`desk_num`,`datetime`,`money`,`user_id`) values ('20160119001','8001','2016-01-19 17:05:10',128,12),('20160119002','8001','2016-01-19 17:05:10',128,12);

/*Table structure for table `tb_order_item` */

DROP TABLE IF EXISTS `tb_order_item`;

CREATE TABLE `tb_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_form_num` char(11) NOT NULL,
  `menu_num` char(8) NOT NULL,
  `amount` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tb_order_item` */

insert  into `tb_order_item`(`id`,`order_form_num`,`menu_num`,`amount`,`total`) values (1,'20160119002','16011901',1,128);

/*Table structure for table `tb_sort` */

DROP TABLE IF EXISTS `tb_sort`;

CREATE TABLE `tb_sort` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_sort` */

insert  into `tb_sort`(`id`,`name`) values (22,'炖炒类'),(23,'凉菜类'),(24,'酒水类'),(25,'饮料类'),(26,'主食类');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `name` varchar(8) NOT NULL,
  `sex` char(2) NOT NULL,
  `birthday` datetime NOT NULL,
  `id_card` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `freeze` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`name`,`sex`,`birthday`,`id_card`,`password`,`freeze`) values (12,'明明','男','1000-01-01 00:00:00','1100','000000','正常'),(13,'00','男','1000-01-01 00:00:00','220','000000','正常');

/*Table structure for table `v_order_item_and_menu` */

DROP TABLE IF EXISTS `v_order_item_and_menu`;

/*!50001 DROP VIEW IF EXISTS `v_order_item_and_menu` */;
/*!50001 DROP TABLE IF EXISTS `v_order_item_and_menu` */;

/*!50001 CREATE TABLE  `v_order_item_and_menu`(
 `id` int(11) ,
 `order_form_num` char(11) ,
 `name` varchar(20) ,
 `amount` int(11) 
)*/;

/*View structure for view v_order_item_and_menu */

/*!50001 DROP TABLE IF EXISTS `v_order_item_and_menu` */;
/*!50001 DROP VIEW IF EXISTS `v_order_item_and_menu` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_order_item_and_menu` AS select `tb_order_item`.`id` AS `id`,`tb_order_item`.`order_form_num` AS `order_form_num`,`tb_menu`.`name` AS `name`,`tb_order_item`.`amount` AS `amount` from (`tb_menu` join `tb_order_item` on((`tb_menu`.`num` = `tb_order_item`.`menu_num`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
