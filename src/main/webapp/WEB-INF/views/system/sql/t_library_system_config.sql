/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : library

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-12-23 10:20:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_library_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_library_system_config`;
CREATE TABLE `t_library_system_config` (
  `id` varchar(20) NOT NULL,
  `configname` varchar(30) NOT NULL COMMENT '配置项名称',
  `configvalue` varchar(50) NOT NULL COMMENT '配置项值',
  `configclassify` varchar(20) NOT NULL COMMENT '配置项分类',
  `description` varchar(225) NOT NULL COMMENT '说明',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `lastupdatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `configname` (`configname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_library_system_config
-- ----------------------------
