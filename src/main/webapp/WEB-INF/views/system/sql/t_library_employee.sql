/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : library

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-12-23 10:20:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_library_employee`
-- ----------------------------
DROP TABLE IF EXISTS `t_library_employee`;
CREATE TABLE `t_library_employee` (
  `id` varchar(20) NOT NULL,
  `empname` varchar(20) NOT NULL COMMENT '姓名',
  `email` varchar(20) NOT NULL COMMENT '邮箱',
  `empno` varchar(30) NOT NULL COMMENT '工号',
  `phonenumber` varchar(15) NOT NULL COMMENT '手机号',
  `sex` enum('男','女') NOT NULL COMMENT '性别',
  `status` varchar(10) NOT NULL COMMENT '状态',
  `isadmin` varchar(10) NOT NULL COMMENT '是否管理员',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `lastupdatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `password` varchar(64) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_library_employee
-- ----------------------------
INSERT INTO `t_library_employee` VALUES ('11111111_upzsh', 'uuuuu', '1@11.1', '11111111', '15465678765', '男', '1', '1', '2016-12-12 03:29:30', '2016-12-22 14:58:57', '11111111');
INSERT INTO `t_library_employee` VALUES ('11111112_upzsh', 'ppppp', '1@11.2', '11111112', '15465678765', '女', '不可用', '0', '2016-12-12 03:29:23', '2016-12-22 02:10:14', '1111111111');
INSERT INTO `t_library_employee` VALUES ('12312300_upzsh', '123123', '11@qq.com32', '12312300', '15465678765', '男', '不可用', '0', '2016-12-12 03:09:39', '2016-12-22 14:10:21', '23131231');
INSERT INTO `t_library_employee` VALUES ('12312365_upzsh', 'qweqwe', '11@qq.com67', '12312365', '15465678765', '男', '1', '0', '2016-12-12 02:57:27', '2016-12-12 02:57:27', '123123123');
INSERT INTO `t_library_employee` VALUES ('12312366_upzsh', 'ttttt', '11@qq.com43', '12312366', '15465678765', '男', '不可用', '0', '2016-12-12 03:33:09', '2016-12-12 03:38:04', '12312123');
INSERT INTO `t_library_employee` VALUES ('12313211_upzsh', 'ioio', '11@qq.com11', '12313211', '15465678765', '男', '不可用', '0', '2016-12-12 02:55:08', '2016-12-13 12:14:38', '123123123');
INSERT INTO `t_library_employee` VALUES ('12313214_upzsh', 'qqqq', '123@11.com1111', '12313214', '15465678765', '男', '1', '0', '2016-12-12 02:57:54', '2016-12-12 02:57:54', '123123321');
INSERT INTO `t_library_employee` VALUES ('12332111_upzsh', '12312', '123123@qq.com', '12332111', '15465678765', '男', '不可用', '0', '2016-12-12 09:56:04', '2016-12-12 14:59:06', '1231231');
INSERT INTO `t_library_employee` VALUES ('12332144_upzsh', '1231', '123@11.com11', '12332144', '15465678765', '男', '1', '0', '2016-12-12 02:57:48', '2016-12-12 02:57:48', '123123123');
INSERT INTO `t_library_employee` VALUES ('12333321_upzsh', '123', '11@qq.com', '12333321', '15465678765', '男', '3', '0', '2016-12-06 04:38:36', '2016-12-13 12:16:44', '123123');
INSERT INTO `t_library_employee` VALUES ('12342132_upzsh', '111111111', '123@11.com1', '12342132', '15465678765', '男', '1', '0', '2016-12-06 04:53:45', '2016-12-12 03:38:28', '123321123');
INSERT INTO `t_library_employee` VALUES ('12345621_upzsh', '123', '12@qq.com', '12345621', '15678945673', '女', '3', '1', '2016-12-06 03:19:52', '2016-12-22 14:08:58', '12345678');
INSERT INTO `t_library_employee` VALUES ('12345678_upzsh', 'ewqewq', '11@qq.com6721', '12345678', '15465678765', '男', '不可用', '0', '2016-12-12 02:52:08', '2016-12-12 15:09:31', '31231231');
INSERT INTO `t_library_employee` VALUES ('31212311_upzsh', '123', '321123@qq.com', '31212311', '15678456765', '男', '1', '0', '2016-12-06 03:20:33', '2016-12-09 13:08:04', '321456');
INSERT INTO `t_library_employee` VALUES ('31235678_upzsh', '1231233', '123@11.com22', '31235678', '15465678765', '男', '1', '0', '2016-12-06 04:44:57', '2016-12-09 13:08:12', '123123123');
INSERT INTO `t_library_employee` VALUES ('32112333_upzsh', '12312', '11@qq.com321', '32112333', '15465678765', '男', '1', '0', '2016-12-09 01:06:45', '2016-12-09 01:06:45', '34512311');
INSERT INTO `t_library_employee` VALUES ('32112345_upzsh', '66666666', '123@11.com2211', '32112345', '15465678765', '男', '1', '0', '2016-12-07 01:37:24', '2016-12-09 13:08:16', '123456765');
INSERT INTO `t_library_employee` VALUES ('32123111_upzsh', '12312', '123@11.com', '32123111', '15465678765', '男', '1', '0', '2016-12-12 02:09:32', '2016-12-12 02:09:32', '123123');
INSERT INTO `t_library_employee` VALUES ('32123112_upzsh', '12312', '1234@11.com', '32123112', '15465678765', '男', '1', '0', '2016-12-06 04:37:01', '2016-12-09 13:08:24', '123123');
INSERT INTO `t_library_employee` VALUES ('32145677_upzsh', '123123', '123@11.com221', '32145677', '15465678765', '男', '不可用', '0', '2016-12-06 04:47:30', '2016-12-12 14:09:53', '12312332');
INSERT INTO `t_library_employee` VALUES ('32146789_upzsh', '123', '123@11.com111', '32146789', '15465678765', '男', '1', '0', '2016-12-06 04:49:22', '2016-12-09 13:08:31', '123123123');
INSERT INTO `t_library_employee` VALUES ('55667788_upzsh', '12312', '1232@11.com', '55667788', '15465678765', '男', '1', '0', '2016-12-06 04:43:29', '2016-12-09 13:08:34', '1234567');
INSERT INTO `t_library_employee` VALUES ('56745432_upzsh', '123', '34@qq.com', '56745432', '15465678765', '男', '1', '0', '2016-12-06 03:53:09', '2016-12-09 13:08:40', '1234321');
