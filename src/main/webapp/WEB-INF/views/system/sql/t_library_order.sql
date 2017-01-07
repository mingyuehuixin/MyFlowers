/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : library

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-12-23 10:20:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_library_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_library_order`;
CREATE TABLE `t_library_order` (
  `id` varchar(20) NOT NULL,
  `ordernumber` varchar(30) NOT NULL COMMENT '订单号',
  `employeeid` varchar(20) NOT NULL COMMENT '订单申请人ID',
  `bookid` varchar(20) NOT NULL COMMENT '申请图书ID',
  `status` enum('1','2','3','4') NOT NULL COMMENT '订单状态',
  `applydate` date NOT NULL COMMENT '申请日期',
  `borrowdate` date NOT NULL COMMENT '借出日期',
  `returndate` date NOT NULL COMMENT '归还日期',
  `expectreturndate` date NOT NULL COMMENT '预计归还日期',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `lastupdatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`ordernumber`),
  KEY `employeeid` (`employeeid`),
  KEY `bookid` (`bookid`),
  CONSTRAINT `bookid` FOREIGN KEY (`bookid`) REFERENCES `t_library_book` (`id`),
  CONSTRAINT `employeeid` FOREIGN KEY (`employeeid`) REFERENCES `t_library_employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_library_order
-- ----------------------------
INSERT INTO `t_library_order` VALUES ('1482390204336', '14823902043364', '11111111_upzsh', '4', '2', '2016-12-22', '2016-12-22', '2001-01-01', '2017-01-01', '2016-12-22 00:00:00', '2016-12-22 15:03:32');
INSERT INTO `t_library_order` VALUES ('1482390719819', '148239071981911100', '11111111_upzsh', '11100', '2', '2016-12-22', '2016-12-22', '2001-01-01', '2017-01-01', '2016-12-22 00:00:00', '2016-12-22 15:32:09');
INSERT INTO `t_library_order` VALUES ('1482392436440', '14823924364401109120024', '11111111_upzsh', '1109120024', '4', '2016-12-22', '2016-12-22', '2016-12-22', '2017-01-01', '2016-12-22 00:00:00', '2016-12-22 15:41:08');
