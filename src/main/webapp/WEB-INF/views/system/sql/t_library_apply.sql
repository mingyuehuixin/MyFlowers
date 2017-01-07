/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : library

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-12-23 10:20:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_library_apply`
-- ----------------------------
DROP TABLE IF EXISTS `t_library_apply`;
CREATE TABLE `t_library_apply` (
  `id` varchar(20) NOT NULL,
  `bookname` varchar(50) NOT NULL COMMENT '书名',
  `authorname` varchar(30) NOT NULL COMMENT '作者',
  `issuedate` date NOT NULL COMMENT '出版日期',
  `urllink` varchar(100) NOT NULL COMMENT '购买链接',
  `recommendreason` varchar(225) NOT NULL COMMENT '推荐理由',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `lastupdatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_library_apply
-- ----------------------------
INSERT INTO `t_library_apply` VALUES ('2433r234', '2433r234', '568776', '2016-11-29', '12123', 'nihao', '2016-12-09 00:00:00', '2016-12-12 17:06:51');
INSERT INTO `t_library_apply` VALUES ('erefdafaddfas', 'erefdafaddfas', 'dvsd', '2016-11-30', 'aef', 'dfscv', '2016-12-09 00:00:00', '2016-12-12 17:39:21');
INSERT INTO `t_library_apply` VALUES ('erfdasdsdaads', 'erfdasdsdaads', '1231', '2016-11-29', 'weqwer', 'sdfaf', '2016-12-09 00:00:00', '2016-12-12 17:37:53');
INSERT INTO `t_library_apply` VALUES ('fdfdasdas', 'fdfdasdas', 'sda', '2016-12-06', 'adfa', 'dfadfd', '2016-12-09 00:00:00', '2016-12-12 17:42:58');
INSERT INTO `t_library_apply` VALUES ('sfdjsdfjka', 'sfdjsdfjka', 'asdf', '2016-12-13', 'sda', 'asdffads', '2016-12-09 00:00:00', '2016-12-12 17:32:45');
INSERT INTO `t_library_apply` VALUES ('代发案件1482390294871', '代发案件', 'fdasdf', '2016-12-05', '', '', '2016-12-09 00:00:00', '2016-12-22 15:04:54');
INSERT INTO `t_library_apply` VALUES ('很航世界', '很航世界', 'dw', '2016-12-06', 'sdf', '\nkkj', '2016-12-09 00:00:00', '2016-12-13 09:44:11');
INSERT INTO `t_library_apply` VALUES ('爱上的方法', '爱上的方法', 'ewe', '2016-12-13', 'qww', '实打实地方', '2016-12-09 00:00:00', '2016-12-13 09:49:02');
