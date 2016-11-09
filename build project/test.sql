/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50024
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50024
File Encoding         : 65001

Date: 2016-10-24 22:08:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for file_upload
-- ----------------------------
DROP TABLE IF EXISTS `file_upload`;
CREATE TABLE `file_upload` (
  `id` varchar(500) NOT NULL COMMENT 'primary key uuid',
  `file_name` varchar(255) default NULL COMMENT 'file name',
  `file_type` varchar(255) default NULL COMMENT 'file type',
  `file_size` bigint(11) default NULL,
  `file_content_type` varchar(255) default NULL COMMENT 'file content type',
  `file_content` longblob COMMENT 'file content in bytes',
  `secure_level` int(11) default NULL COMMENT 'secure level',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oauth_role
-- ----------------------------
DROP TABLE IF EXISTS `oauth_role`;
CREATE TABLE `oauth_role` (
  `id` varchar(255) NOT NULL COMMENT 'primary key uuid',
  `user_id` varchar(255) default NULL COMMENT 'reference table user primary key',
  `description` varchar(255) default NULL COMMENT 'description',
  PRIMARY KEY  (`id`),
  KEY `user_id_reference` (`user_id`),
  CONSTRAINT `user_id_reference` FOREIGN KEY (`user_id`) REFERENCES `oauth_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oauth_service
-- ----------------------------
DROP TABLE IF EXISTS `oauth_service`;
CREATE TABLE `oauth_service` (
  `id` varchar(255) NOT NULL COMMENT 'primary key uuid',
  `role_id` varchar(255) default NULL COMMENT 'role id',
  `description` varchar(255) default NULL COMMENT 'description',
  PRIMARY KEY  (`id`),
  KEY `role_id_reference` (`role_id`),
  CONSTRAINT `role_id_reference` FOREIGN KEY (`role_id`) REFERENCES `oauth_role` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oauth_user
-- ----------------------------
DROP TABLE IF EXISTS `oauth_user`;
CREATE TABLE `oauth_user` (
  `id` varchar(250) NOT NULL COMMENT 'primary key uuid',
  `name` varchar(45) NOT NULL COMMENT 'name',
  `password` varchar(45) NOT NULL COMMENT 'password',
  `gender` varchar(255) default NULL COMMENT 'gender',
  `phone_number` varchar(255) default NULL COMMENT 'phone number',
  `email` varchar(255) default NULL COMMENT 'email',
  `description` varchar(255) default NULL COMMENT 'description',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `unique_name_index` USING HASH (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
