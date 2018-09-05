/*
SQLyog v10.2 
MySQL - 5.1.72-community : Database - shiro
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `sys_permission` */
#1
CREATE TABLE `sys_permission` (
  `id` BIGINT(20) NOT NULL COMMENT '主键',
  `name` VARCHAR(128) NOT NULL COMMENT '资源名称',
  `type` VARCHAR(32) NOT NULL COMMENT '资源类型：menu,button,',
  `url` VARCHAR(128) DEFAULT NULL COMMENT '访问url地址',
  `percode` VARCHAR(128) DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` BIGINT(20) DEFAULT NULL COMMENT '父结点id',
  `parentids` VARCHAR(128) DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` VARCHAR(128) DEFAULT NULL COMMENT '排序号',
  `available` CHAR(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_role` */
#1
CREATE TABLE `sys_role` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(128) NOT NULL,
  `available` CHAR(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;




/*Table structure for table `sys_role_permission` */
#1
CREATE TABLE `sys_role_permission` (
  `id` VARCHAR(36) NOT NULL COMMENT '主键',
  `sys_role_id` VARCHAR(32) NOT NULL COMMENT '角色id',
  `sys_permission_id` VARCHAR(32) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_user` */
#1
CREATE TABLE `sys_user` (
  `id` VARCHAR(36) NOT NULL COMMENT '主键',
  `usercode` VARCHAR(32) NOT NULL COMMENT '账号',
  `username` VARCHAR(64) NOT NULL COMMENT '姓名',
  `password` VARCHAR(32) NOT NULL COMMENT '密码',
  `salt` VARCHAR(64) DEFAULT NULL COMMENT '盐',
  `locked` CHAR(1) DEFAULT NULL COMMENT '账号是否锁定，1：锁定，0未锁定',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_user_role` */
#1
CREATE TABLE `sys_user_role` (
  `id` VARCHAR(36) NOT NULL,
  `sys_user_id` VARCHAR(32) NOT NULL,
  `sys_role_id` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
