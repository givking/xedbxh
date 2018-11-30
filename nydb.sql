/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : nydb

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2018-11-30 17:06:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for alecms_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `alecms_advertisement`;
CREATE TABLE `alecms_advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(255) DEFAULT NULL,
  `imagepath` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_advertisement
-- ----------------------------

-- ----------------------------
-- Table structure for alecms_article
-- ----------------------------
DROP TABLE IF EXISTS `alecms_article`;
CREATE TABLE `alecms_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anthor` varchar(255) DEFAULT NULL,
  `clickcount` varchar(255) DEFAULT NULL,
  `content` longtext,
  `createtime` varchar(255) DEFAULT NULL,
  `imgpath` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `menu_id` varchar(255) DEFAULT NULL,
  `menu_type` varchar(255) DEFAULT NULL,
  `shortitle` varchar(255) DEFAULT NULL,
  `showid` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4178 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_article
-- ----------------------------
INSERT INTO `alecms_article` VALUES ('4174', 'system', null, '<p>ad<br/></p>', '2017-05-09', 'no', '0', '85', null, '', '1', '1', '中啊啊啊', null);
INSERT INTO `alecms_article` VALUES ('4175', 'system', null, '<p>阿萨德<br/></p>', '2017-05-09', 'no', '0', '86', null, '', '1', '1', '谁说的', null);
INSERT INTO `alecms_article` VALUES ('4176', 'system', null, '<p>1231<br/></p>', '2017-05-22', 'document/tit/20170522034153.png', '0', '85', null, '', '1', '1', 'aaa', null);
INSERT INTO `alecms_article` VALUES ('4177', 'system', null, '<p>fdsafda<br/></p>', '2017-05-22', 'no', '0', '85', null, '', '1', '1', 'aaa', null);

-- ----------------------------
-- Table structure for alecms_article_copy
-- ----------------------------
DROP TABLE IF EXISTS `alecms_article_copy`;
CREATE TABLE `alecms_article_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anthor` varchar(255) DEFAULT NULL,
  `clickcount` varchar(255) DEFAULT NULL,
  `content` longtext,
  `createtime` varchar(255) DEFAULT NULL,
  `imgpath` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `menu_id` varchar(255) DEFAULT NULL,
  `menu_type` varchar(255) DEFAULT NULL,
  `shortitle` varchar(255) DEFAULT NULL,
  `showid` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_article_copy
-- ----------------------------

-- ----------------------------
-- Table structure for alecms_document
-- ----------------------------
DROP TABLE IF EXISTS `alecms_document`;
CREATE TABLE `alecms_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  `filetype` varchar(255) DEFAULT NULL,
  `loadcount` varchar(255) DEFAULT NULL,
  `relate_id` int(11) DEFAULT NULL,
  `relate_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_document
-- ----------------------------

-- ----------------------------
-- Table structure for alecms_examination
-- ----------------------------
DROP TABLE IF EXISTS `alecms_examination`;
CREATE TABLE `alecms_examination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(255) DEFAULT NULL,
  `paper_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_examination
-- ----------------------------
INSERT INTO `alecms_examination` VALUES ('1', '2016-10-19', null, '1', '你是美女吗', '2');
INSERT INTO `alecms_examination` VALUES ('2', '2015-07-20', '1', '1', '你是帅哥吗', '1');
INSERT INTO `alecms_examination` VALUES ('3', '2015-07-20', '1', '1', '你炒股吗', '1');

-- ----------------------------
-- Table structure for alecms_examunser
-- ----------------------------
DROP TABLE IF EXISTS `alecms_examunser`;
CREATE TABLE `alecms_examunser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkcount` varchar(255) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `indenty` varchar(255) DEFAULT NULL,
  `showchar` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_examunser
-- ----------------------------
INSERT INTO `alecms_examunser` VALUES ('1', '1', '1', null, null, '是');
INSERT INTO `alecms_examunser` VALUES ('2', '5', '1', null, null, '不是');
INSERT INTO `alecms_examunser` VALUES ('3', '2', '2', null, null, '是');
INSERT INTO `alecms_examunser` VALUES ('4', '4', '2', null, null, '不是');
INSERT INTO `alecms_examunser` VALUES ('5', '1', '3', null, null, '炒股');
INSERT INTO `alecms_examunser` VALUES ('6', '3', '3', null, null, '不炒');
INSERT INTO `alecms_examunser` VALUES ('7', '2', '3', null, null, '不了解');

-- ----------------------------
-- Table structure for alecms_mailask
-- ----------------------------
DROP TABLE IF EXISTS `alecms_mailask`;
CREATE TABLE `alecms_mailask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `content` longtext,
  `createtime` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `icq` varchar(255) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `menu_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `showid` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `telnum` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2617 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_mailask
-- ----------------------------

-- ----------------------------
-- Table structure for alecms_mailunser
-- ----------------------------
DROP TABLE IF EXISTS `alecms_mailunser`;
CREATE TABLE `alecms_mailunser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ask_id` int(11) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `ucontent` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3438 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_mailunser
-- ----------------------------

-- ----------------------------
-- Table structure for alecms_menu
-- ----------------------------
DROP TABLE IF EXISTS `alecms_menu`;
CREATE TABLE `alecms_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `identity` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `hb` varchar(300) DEFAULT NULL,
  `is_article` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_menu
-- ----------------------------
INSERT INTO `alecms_menu` VALUES ('105', '2017-01-18', null, 'scroll_news', '1', null, '0', '0', '滚动新闻', '1', '', null, '1');
INSERT INTO `alecms_menu` VALUES ('100', '2017-02-15', null, 'ga_message', '1', '7', '0', '0', '短讯中心', '1', 'webcenter/webarticlelist?id=100', null, '1');
INSERT INTO `alecms_menu` VALUES ('83', '2017-01-10', null, 'org_rule', '2', '2', '80', '1', '协会章程', '1', 'webcenter/webarticlelist?id=83', null, '1');
INSERT INTO `alecms_menu` VALUES ('84', '2017-01-10', null, 'applicate', '2', '4', '80', '1', '入会申请', '1', 'webcenter/webarticlelist?id=84', null, '1');
INSERT INTO `alecms_menu` VALUES ('85', '2017-01-10', null, 'ga_info', '1', '2', '0', '1', '协会资讯', '1', 'webcenter/webarticlelist?id=85', null, '1');
INSERT INTO `alecms_menu` VALUES ('86', '2017-01-10', null, 'ga_dyn', '1', '3', '0', '1', '行业动态', '1', 'webcenter/webarticlelist?id=86', null, '1');
INSERT INTO `alecms_menu` VALUES ('87', '2017-01-10', null, 'ga_member', '1', '4', '0', '1', '会员中心', '1', 'webcenter/webarticlelist?id=87', null, '1');
INSERT INTO `alecms_menu` VALUES ('88', '2017-01-10', null, 'unit_pre', '2', null, '87', '1', '会长单位', '1', 'webcenter/webarticlelist?id=88', null, '1');
INSERT INTO `alecms_menu` VALUES ('89', '2017-01-10', null, 'unit_coun', '2', null, '87', '1', '理事单位', '1', 'webcenter/webarticlelist?id=89', null, '1');
INSERT INTO `alecms_menu` VALUES ('90', '2017-01-10', null, 'unit_lsup', '2', null, '87', '1', '监事长单位', '1', 'webcenter/webarticlelist?id=90', null, '1');
INSERT INTO `alecms_menu` VALUES ('91', '2017-01-10', null, 'unit_sup', '2', null, '87', '1', '监事单位', '1', 'webcenter/webarticlelist?id=91', null, '1');
INSERT INTO `alecms_menu` VALUES ('92', '2017-01-10', null, 'unit_member', '2', null, '87', '1', '会员单位', '1', 'webcenter/webarticlelist?id=92', null, '1');
INSERT INTO `alecms_menu` VALUES ('93', '2017-01-10', null, 'unit_vip', '2', null, '87', '1', '特别会员', '1', 'webcenter/webarticlelist?id=93', null, '1');
INSERT INTO `alecms_menu` VALUES ('94', '2017-01-10', null, 'ga_law', '1', '5', '0', '1', '政策法规', '1', 'webcenter/webarticlelist?id=94', null, '1');
INSERT INTO `alecms_menu` VALUES ('95', '2017-01-10', null, 'law_country', '2', null, '94', '1', '国家政策法规', '1', 'webcenter/webarticlelist?id=95', null, '1');
INSERT INTO `alecms_menu` VALUES ('80', '2017-01-10', null, 'ga_org', '1', '1', '0', '1', '关于协会', '1', 'webcenter/webarticlelist?id=80', null, '1');
INSERT INTO `alecms_menu` VALUES ('81', '2017-01-10', null, 'org_intro', '2', '1', '80', '1', '协会简介', '1', 'webcenter/webarticlelist?id=81', null, '1');
INSERT INTO `alecms_menu` VALUES ('82', '2017-01-10', null, 'member_str', '2', '3', '80', '1', '会员结构', '1', 'webcenter/webarticlelist?id=82', null, '1');
INSERT INTO `alecms_menu` VALUES ('96', '2017-01-10', null, 'law_sc', '2', null, '94', '1', '四川省政策法规', '1', 'webcenter/webarticlelist?id=96', null, '1');
INSERT INTO `alecms_menu` VALUES ('97', '2017-01-10', null, 'law_nc', '2', null, '94', '1', '南充市政策法规', '1', 'webcenter/webarticlelist?id=97', null, '1');
INSERT INTO `alecms_menu` VALUES ('98', '2017-01-10', null, 'law_other', '2', null, '94', '1', '其他文件', '1', 'webcenter/webarticlelist?id=98', null, '1');
INSERT INTO `alecms_menu` VALUES ('99', '2017-01-10', null, 'ga_research', '1', '6', '0', '1', '研究与杂谈', '1', 'webcenter/webarticlelist?id=99', null, '1');
INSERT INTO `alecms_menu` VALUES ('101', '2017-03-06', null, 'ga_download', '1', '8', '0', '1', '下载中心', '1', 'webcenter/webarticlelist?id=101', null, '0');
INSERT INTO `alecms_menu` VALUES ('102', '2017-01-10', null, 'ga_leave_message', '1', '9', '0', '1', '留言中心', '1', 'webcenter/webarticlelist?id=102', null, '0');
INSERT INTO `alecms_menu` VALUES ('103', '2017-01-10', null, 'ga_notice', '1', '10', '0', '1', '通知公告', '1', 'webcenter/webarticlelist?id=103', null, '1');

-- ----------------------------
-- Table structure for alecms_paper
-- ----------------------------
DROP TABLE IF EXISTS `alecms_paper`;
CREATE TABLE `alecms_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(255) DEFAULT NULL,
  `discription` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `over` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_paper
-- ----------------------------

-- ----------------------------
-- Table structure for alecms_product
-- ----------------------------
DROP TABLE IF EXISTS `alecms_product`;
CREATE TABLE `alecms_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `discription` varchar(255) DEFAULT NULL,
  `imgpath` varchar(255) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `pic_ids` varchar(255) DEFAULT NULL,
  `realmoney` varchar(255) DEFAULT NULL,
  `selmoney` varchar(255) DEFAULT NULL,
  `showid` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_product
-- ----------------------------

-- ----------------------------
-- Table structure for alecms_resource
-- ----------------------------
DROP TABLE IF EXISTS `alecms_resource`;
CREATE TABLE `alecms_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `identity` varchar(255) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_resource
-- ----------------------------
INSERT INTO `alecms_resource` VALUES ('1', '2015-07-02', null, 'alecms_system', '0', '0', '1', '系统管理', '0', '/');
INSERT INTO `alecms_resource` VALUES ('2', '2015-07-02', null, 'alecms_article', '1', '0', '1', '内容管理', '0', '/');
INSERT INTO `alecms_resource` VALUES ('3', '2015-07-02', null, 'system_user', '2', '1', '1', '用户管理', '1', 'jspsystem/systemuser/list.jsp');
INSERT INTO `alecms_resource` VALUES ('4', '2015-07-02', null, 'system_role', '3', '1', '1', '角色管理', '1', 'jspsystem/role/list.jsp');
INSERT INTO `alecms_resource` VALUES ('5', '2015-07-02', null, 'system_resource', '4', '1', '1', '资源管理', '1', 'jspsystem/resource/list.jsp');
INSERT INTO `alecms_resource` VALUES ('6', '2015-07-02', null, 'system_menu', '5', '1', '1', '菜单管理', '1', 'jspsystem/menu/list.jsp');
INSERT INTO `alecms_resource` VALUES ('7', '2015-07-02', null, 'article_article', '6', '2', '1', '文章管理', '1', 'jspsystem/article/list.jsp');
INSERT INTO `alecms_resource` VALUES ('28', '2017-02-15', null, 'ga_message', null, '2', '1', '留言管理', '1', 'jspsystem/message/list.jsp');
INSERT INTO `alecms_resource` VALUES ('26', '2017-03-06', null, 'ga_download', '17', '0', '1', '下载中心', '0', '');
INSERT INTO `alecms_resource` VALUES ('27', '2017-01-11', null, 'ga_file', null, '26', '1', '文件管理', '0', 'jspsystem/download/list.jsp');

-- ----------------------------
-- Table structure for alecms_role
-- ----------------------------
DROP TABLE IF EXISTS `alecms_role`;
CREATE TABLE `alecms_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_role
-- ----------------------------
INSERT INTO `alecms_role` VALUES ('1', '2015-07-02', '系统管理员', '1');
INSERT INTO `alecms_role` VALUES ('2', '2017-05-09', '管理员', '1');

-- ----------------------------
-- Table structure for alecms_role_res
-- ----------------------------
DROP TABLE IF EXISTS `alecms_role_res`;
CREATE TABLE `alecms_role_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `res_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=279 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_role_res
-- ----------------------------
INSERT INTO `alecms_role_res` VALUES ('273', '27', '1');
INSERT INTO `alecms_role_res` VALUES ('272', '26', '1');
INSERT INTO `alecms_role_res` VALUES ('271', '24', '1');
INSERT INTO `alecms_role_res` VALUES ('270', '22', '1');
INSERT INTO `alecms_role_res` VALUES ('269', '21', '1');
INSERT INTO `alecms_role_res` VALUES ('268', '17', '1');
INSERT INTO `alecms_role_res` VALUES ('267', '15', '1');
INSERT INTO `alecms_role_res` VALUES ('266', '11', '1');
INSERT INTO `alecms_role_res` VALUES ('265', '18', '1');
INSERT INTO `alecms_role_res` VALUES ('264', '12', '1');
INSERT INTO `alecms_role_res` VALUES ('263', '9', '1');
INSERT INTO `alecms_role_res` VALUES ('262', '28', '1');
INSERT INTO `alecms_role_res` VALUES ('261', '7', '1');
INSERT INTO `alecms_role_res` VALUES ('260', '2', '1');
INSERT INTO `alecms_role_res` VALUES ('259', '6', '1');
INSERT INTO `alecms_role_res` VALUES ('258', '5', '1');
INSERT INTO `alecms_role_res` VALUES ('257', '4', '1');
INSERT INTO `alecms_role_res` VALUES ('256', '3', '1');
INSERT INTO `alecms_role_res` VALUES ('255', '1', '1');
INSERT INTO `alecms_role_res` VALUES ('274', '2', '2');
INSERT INTO `alecms_role_res` VALUES ('275', '7', '2');
INSERT INTO `alecms_role_res` VALUES ('276', '28', '2');
INSERT INTO `alecms_role_res` VALUES ('277', '26', '2');
INSERT INTO `alecms_role_res` VALUES ('278', '27', '2');

-- ----------------------------
-- Table structure for alecms_system_user
-- ----------------------------
DROP TABLE IF EXISTS `alecms_system_user`;
CREATE TABLE `alecms_system_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `personname` varchar(255) DEFAULT NULL,
  `phonetel` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_system_user
-- ----------------------------
INSERT INTO `alecms_system_user` VALUES ('1', 'system', '中国', '2017-05-09', 'alelan@126.com', '123', 'system', '13990855552', '2', '1');
INSERT INTO `alecms_system_user` VALUES ('3', 'admin', '', '2017-05-09', '1', '86888061b399e74e30eeead8c7aab922', 'admin', '', '1', '1');

-- ----------------------------
-- Table structure for alecms_unsercontent
-- ----------------------------
DROP TABLE IF EXISTS `alecms_unsercontent`;
CREATE TABLE `alecms_unsercontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `createtime` varchar(255) DEFAULT NULL,
  `exam_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_unsercontent
-- ----------------------------

-- ----------------------------
-- Table structure for alecms_webcase
-- ----------------------------
DROP TABLE IF EXISTS `alecms_webcase`;
CREATE TABLE `alecms_webcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `casenum` varchar(255) DEFAULT NULL,
  `caseunit` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_webcase
-- ----------------------------

-- ----------------------------
-- Table structure for alecms_webtable
-- ----------------------------
DROP TABLE IF EXISTS `alecms_webtable`;
CREATE TABLE `alecms_webtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anthor` varchar(255) DEFAULT NULL,
  `clickcount` varchar(255) DEFAULT NULL,
  `content` longtext,
  `createtime` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `menu_id` varchar(255) DEFAULT NULL,
  `menu_type` varchar(255) DEFAULT NULL,
  `shortitle` varchar(255) DEFAULT NULL,
  `showid` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alecms_webtable
-- ----------------------------

-- ----------------------------
-- Table structure for cs_donation
-- ----------------------------
DROP TABLE IF EXISTS `cs_donation`;
CREATE TABLE `cs_donation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `bill` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `d_address` varchar(255) DEFAULT NULL,
  `d_email` varchar(255) DEFAULT NULL,
  `d_name` varchar(255) DEFAULT NULL,
  `d_telephone` varchar(255) DEFAULT NULL,
  `donor` varchar(255) DEFAULT NULL,
  `intention` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `org` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `updatetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cs_donation
-- ----------------------------

-- ----------------------------
-- Table structure for cs_volunteer
-- ----------------------------
DROP TABLE IF EXISTS `cs_volunteer`;
CREATE TABLE `cs_volunteer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ident` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `volarea` varchar(255) DEFAULT NULL,
  `volname` varchar(255) DEFAULT NULL,
  `voltime` varchar(255) DEFAULT NULL,
  `workstate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cs_volunteer
-- ----------------------------

-- ----------------------------
-- Table structure for ga_file
-- ----------------------------
DROP TABLE IF EXISTS `ga_file`;
CREATE TABLE `ga_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ga_file
-- ----------------------------
INSERT INTO `ga_file` VALUES ('1', '2017-05-22', 'jpg', 'f09210cbadddf46440a2bcf583d5f59d4173b53d573428-R5xpDt', 'D:\\apache-tomcat-7.0.55\\webapps\\ROOT\\document/filecenter/20170522033926.jpg', null);
INSERT INTO `ga_file` VALUES ('2', '2017-05-22', 'jpg', 'f09210cbadddf46440a2bcf583d5f59d4173b53d573428-R5xpDt', 'D:\\apache-tomcat-7.0.55\\webapps\\ROOT\\document/filecenter/20170522033938.jpg', null);
INSERT INTO `ga_file` VALUES ('3', '2017-05-22', 'jpg', 'f09210cbadddf46440a2bcf583d5f59d4173b53d573428-R5xpDt', 'D:\\apache-tomcat-7.0.55\\webapps\\ROOT\\document/filecenter/20170522034041.jpg', null);

-- ----------------------------
-- Table structure for ga_message
-- ----------------------------
DROP TABLE IF EXISTS `ga_message`;
CREATE TABLE `ga_message` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ga_message
-- ----------------------------

-- ----------------------------
-- Table structure for tb_test
-- ----------------------------
DROP TABLE IF EXISTS `tb_test`;
CREATE TABLE `tb_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_test
-- ----------------------------
