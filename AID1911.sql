-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: AID1911
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `applicant`
--

DROP TABLE IF EXISTS `applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applicant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL COMMENT '求职者姓名',
  `mail_addr` varchar(30) DEFAULT NULL COMMENT '邮箱地址',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `account` varchar(20) DEFAULT NULL COMMENT '账号',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `logout_time` datetime DEFAULT NULL COMMENT '登出时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='求职者表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant`
--

LOCK TABLES `applicant` WRITE;
/*!40000 ALTER TABLE `applicant` DISABLE KEYS */;
INSERT INTO `applicant` VALUES (1,NULL,'1422413277@qq.com','a1','a1',NULL,NULL),(3,NULL,'111','a3','a3',NULL,NULL),(4,NULL,'1111','a4','a4',NULL,NULL),(5,NULL,'11111111','a5','a5',NULL,NULL),(6,NULL,'123','123','a2',NULL,NULL),(7,NULL,'11111','a6','a6',NULL,NULL),(8,NULL,'2','a7','a7',NULL,NULL),(9,NULL,'22','a8','a8',NULL,NULL),(10,NULL,'222','a9','a9',NULL,NULL),(11,NULL,'2222','a10','a10',NULL,NULL),(12,NULL,'1','a11','a11',NULL,NULL),(13,NULL,'daga','11343','a13',NULL,NULL);
/*!40000 ALTER TABLE `applicant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_id` int(11) DEFAULT NULL,
  `applicant_id` int(11) DEFAULT NULL,
  `hr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天室管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_record`
--

DROP TABLE IF EXISTS `chat_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `hr_id` int(11) DEFAULT NULL,
  `applicant_id` int(11) DEFAULT NULL,
  `type` enum('hr','applicant') DEFAULT NULL,
  `content` text,
  `isofflinemsg` tinyint(1) DEFAULT NULL COMMENT '是否为离线消息',
  `from_account` varchar(20) DEFAULT NULL COMMENT '消息发送者',
  `to_account` varchar(20) DEFAULT NULL COMMENT '消息接收者',
  `send_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '消息接收者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COMMENT='聊天记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_record`
--

LOCK TABLES `chat_record` WRITE;
/*!40000 ALTER TABLE `chat_record` DISABLE KEYS */;
INSERT INTO `chat_record` VALUES (1,NULL,NULL,NULL,NULL,'您好！',1,'a1','alizhangsan','2020-01-30 20:57:05'),(2,NULL,NULL,NULL,NULL,'在吗？',1,'a1','alizhangsan','2020-01-30 22:53:38'),(3,NULL,NULL,NULL,NULL,'是我呀！',1,'a1','alizhangsan','2020-01-30 22:54:10'),(4,NULL,NULL,NULL,NULL,'麻烦在的时候给我回个消息',1,'a1','alizhangsan','2020-01-30 22:54:56'),(5,NULL,NULL,NULL,NULL,'您好！',1,'a3','alizhangsan','2020-01-30 23:22:49'),(6,NULL,NULL,NULL,NULL,'我想求职贵公司python开发的岗位',1,'a3','alizhangsan','2020-01-30 23:23:56'),(7,NULL,NULL,NULL,NULL,'您什么时候有时间，',1,'a3','alizhangsan','2020-01-30 23:26:08'),(8,NULL,NULL,NULL,NULL,'我发一份简历给您',1,'a3','alizhangsan','2020-01-30 23:26:17'),(9,NULL,NULL,NULL,NULL,'您好a1!',1,'alizhangsan','a1','2020-01-31 08:25:34'),(10,NULL,NULL,NULL,NULL,'alizhangsan发的在线消息',1,'alizhangsan','a1','2020-01-31 13:33:59'),(11,NULL,NULL,NULL,NULL,'alizhangsan发的在线消息2',1,'alizhangsan','a1','2020-01-31 13:36:13'),(12,NULL,NULL,NULL,NULL,'alizhangsan发的在线消息3',1,'alizhangsan','a1','2020-01-31 13:41:05'),(13,NULL,NULL,NULL,NULL,'我是a1',1,'alizhangsan','a1','2020-01-31 13:42:41'),(14,NULL,NULL,NULL,NULL,'python开发岗位还在招人吗？',1,'a1','alizhangsan','2020-01-31 13:48:51'),(15,NULL,NULL,NULL,NULL,'在招人',1,'alizhangsan','a1','2020-01-31 13:49:22'),(16,NULL,NULL,NULL,NULL,'发过来吧',1,'alizhangsan','a3','2020-01-31 14:06:59'),(17,NULL,NULL,NULL,NULL,'好嘞！',1,'a3','alizhangsan','2020-01-31 14:07:26'),(18,NULL,NULL,NULL,NULL,'zaima?',1,'a1','alizhangsan','2020-01-31 14:08:01'),(19,NULL,NULL,NULL,NULL,'在的',1,'alizhangsan','a3','2020-01-31 14:08:09'),(20,NULL,NULL,NULL,NULL,'zaide',1,'a1','alizhangsan','2020-01-31 14:08:43'),(21,NULL,NULL,NULL,NULL,'方便发一份简历过来吗？',1,'alizhangsan','a1','2020-01-31 14:09:37'),(22,NULL,NULL,NULL,NULL,'方便',1,'a1','alizhangsan','2020-01-31 14:09:51'),(23,NULL,NULL,NULL,NULL,'发了吗？',1,'alizhangsan','a3','2020-01-31 14:11:24'),(24,NULL,NULL,NULL,NULL,'马上',1,'a3','alizhangsan','2020-01-31 14:11:35'),(25,NULL,NULL,NULL,NULL,'好的',1,'alizhangsan','a3','2020-01-31 14:11:41'),(26,NULL,NULL,NULL,NULL,'我公司正在招聘python开发工程师，您有兴趣吗？',1,'tengxunlisi','a1','2020-01-31 14:41:22'),(27,NULL,NULL,NULL,NULL,'工作地点在哪儿？',1,'a1','tengxunlisi','2020-01-31 14:42:51'),(28,NULL,NULL,NULL,NULL,'？',1,'tengxunlisi','a1','2020-01-31 14:44:10'),(29,NULL,NULL,NULL,NULL,'在北京吗？',1,'a1','tengxunlisi','2020-01-31 14:45:03'),(30,NULL,NULL,NULL,NULL,'全国各地好多大城市可选',1,'tengxunlisi','a1','2020-01-31 14:47:55'),(31,NULL,NULL,NULL,NULL,'您期望在哪个城市工作？',1,'tengxunlisi','a1','2020-01-31 14:48:27'),(32,NULL,NULL,NULL,NULL,'一线城市',1,'a1','tengxunlisi','2020-01-31 14:48:44'),(33,NULL,NULL,NULL,NULL,'具体有什么要求？',1,'a1','alizhangsan','2020-01-31 14:53:52'),(34,NULL,NULL,NULL,NULL,'没？',1,'alizhangsan','a1','2020-01-31 14:56:36'),(35,NULL,NULL,NULL,NULL,'？？',1,'a1','alizhangsan','2020-01-31 14:57:35'),(36,NULL,NULL,NULL,NULL,'我看不到您的消息',1,'a1','alizhangsan','2020-01-31 14:57:45'),(37,NULL,NULL,NULL,NULL,'？',1,'alizhangsan','a1','2020-01-31 14:58:33'),(38,NULL,NULL,NULL,NULL,'您在吗？',1,'a1','alizhangsan','2020-01-31 14:59:17'),(39,NULL,NULL,NULL,NULL,'发给您了',1,'a3','alizhangsan','2020-01-31 15:02:01'),(40,NULL,NULL,NULL,NULL,'我看一下',1,'alizhangsan','a3','2020-01-31 15:02:39'),(41,NULL,NULL,NULL,NULL,'您明天上午有时间吗？',1,'alizhangsan','a3','2020-01-31 15:04:59'),(42,NULL,NULL,NULL,NULL,'明天上午有时间',1,'a3','alizhangsan','2020-01-31 15:07:22'),(43,NULL,NULL,NULL,NULL,'那您明天上午十点来公司面试吧',1,'alizhangsan','a3','2020-01-31 15:07:43'),(44,NULL,NULL,NULL,NULL,'好的',1,'a3','alizhangsan','2020-01-31 15:08:30'),(45,NULL,NULL,NULL,NULL,'如果不能按时参加面试请提前告诉我',1,'alizhangsan','a3','2020-01-31 16:12:51'),(46,NULL,NULL,NULL,NULL,'在吗？',1,'a1','tengxunlisi','2020-01-31 16:15:39'),(47,NULL,NULL,NULL,NULL,'收不到您的消息',1,'tengxunlisi','a1','2020-01-31 16:15:57'),(48,NULL,NULL,NULL,NULL,'python开发的岗位',1,'a3','tengxunlisi','2020-01-31 16:26:46'),(49,NULL,NULL,NULL,NULL,'您工作几年了？',1,'tengxunlisi','a3','2020-01-31 16:32:14'),(50,NULL,NULL,NULL,NULL,'3年了',1,'a3','tengxunlisi','2020-01-31 16:32:54'),(51,NULL,NULL,NULL,NULL,'最近做过什么项目？',1,'tengxunlisi','a3','2020-01-31 16:33:43'),(52,NULL,NULL,NULL,NULL,'做过一个金融风控项目',1,'a3','tengxunlisi','2020-01-31 16:37:35'),(53,NULL,NULL,NULL,NULL,'hello!',1,'alizhangsan','a1','2020-01-31 16:38:23'),(54,NULL,NULL,NULL,NULL,'我到您公司楼下了',1,'a1','alizhangsan','2020-02-01 09:13:54'),(55,NULL,NULL,NULL,NULL,'核心业务是房地产',1,'a3','tengxunlisi','2020-02-01 09:15:19'),(56,NULL,NULL,NULL,NULL,'您做过相关的工作吗？',1,'a3','tengxunlisi','2020-02-01 09:15:50'),(57,NULL,NULL,NULL,NULL,'怎么走',1,'a1','alizhangsan','2020-02-01 09:16:34'),(58,NULL,NULL,NULL,NULL,'您稍等，',1,'alizhangsan','a1','2020-02-01 09:18:49'),(59,NULL,NULL,NULL,NULL,'您坐电梯到16楼，',1,'alizhangsan','a1','2020-02-01 09:20:09'),(60,NULL,NULL,NULL,NULL,'我在电梯口等您',1,'alizhangsan','a1','2020-02-01 09:20:19'),(61,NULL,NULL,NULL,NULL,'ok',1,'a1','alizhangsan','2020-02-01 09:21:00'),(62,NULL,NULL,NULL,NULL,'做过，',1,'a3','tengxunlisi','2020-02-01 09:23:46'),(63,NULL,NULL,NULL,NULL,'什么时候做的？',1,'tengxunlisi','a3','2020-02-01 09:24:16'),(64,NULL,NULL,NULL,NULL,'去年',1,'a3','tengxunlisi','2020-02-01 09:24:25'),(65,NULL,NULL,NULL,NULL,'给万科做过一个项目管理系统',1,'a3','tengxunlisi','2020-02-01 09:25:21'),(66,NULL,NULL,NULL,NULL,'您好，王总！',1,'a4','baiduwangwu','2020-02-01 09:28:53'),(67,NULL,NULL,NULL,NULL,'您好',1,'baiduwangwu','a4','2020-02-01 09:30:14'),(68,NULL,NULL,NULL,NULL,'我看到了贵公司python开发的职位',1,'a4','baiduwangwu','2020-02-01 09:30:45'),(69,NULL,NULL,NULL,NULL,'您有相关工作经验吗？',1,'baiduwangwu','a4','2020-02-01 09:31:15'),(70,NULL,NULL,NULL,NULL,'我最近这两年一直在做python',1,'a4','baiduwangwu','2020-02-01 09:32:14'),(71,NULL,NULL,NULL,NULL,'请把简历发我一份',1,'baiduwangwu','a4','2020-02-01 09:34:12'),(72,NULL,NULL,NULL,NULL,'王总，这是我的简历',1,'a4','baiduwangwu','2020-02-01 09:35:19'),(73,NULL,NULL,NULL,NULL,'王总？',1,'a4','baiduwangwu','2020-02-01 09:35:57'),(74,NULL,NULL,NULL,NULL,'在的',1,'baiduwangwu','a4','2020-02-01 09:36:15'),(75,NULL,NULL,NULL,NULL,'简历发给您了',1,'a4','baiduwangwu','2020-02-01 09:36:36'),(76,NULL,NULL,NULL,NULL,'没收到',1,'baiduwangwu','a4','2020-02-01 09:39:31'),(77,NULL,NULL,NULL,NULL,'你再发一遍',1,'baiduwangwu','a4','2020-02-01 09:39:39'),(78,NULL,NULL,NULL,NULL,'王总，这是我的简历',1,'a4','baiduwangwu','2020-02-01 09:39:55'),(79,NULL,NULL,NULL,NULL,'请问我的面试结果？',1,'a1','alizhangsan','2020-02-01 10:07:03'),(80,NULL,NULL,NULL,NULL,'我收不到您的消息',1,'alizhangsan','a1','2020-02-01 10:08:40'),(81,NULL,NULL,NULL,NULL,'您好！',1,'a1','alizhangsan','2020-02-01 10:08:55'),(82,NULL,NULL,NULL,NULL,'能收到吗？',1,'a1','alizhangsan','2020-02-01 10:10:21'),(83,NULL,NULL,NULL,NULL,'？',1,'a1','alizhangsan','2020-02-01 10:10:37'),(84,NULL,NULL,NULL,NULL,'a',1,'a1','alizhangsan','2020-02-01 10:15:25'),(85,NULL,NULL,NULL,NULL,'？？？',1,'a1','alizhangsan','2020-02-01 10:17:23'),(86,NULL,NULL,NULL,NULL,'？',1,'a1','alizhangsan','2020-02-01 10:21:39'),(87,NULL,NULL,NULL,NULL,'还是收不到啊',1,'alizhangsan','a1','2020-02-01 10:22:49'),(88,NULL,NULL,NULL,NULL,'？？？',1,'a1','alizhangsan','2020-02-01 10:25:20'),(89,NULL,NULL,NULL,NULL,'现在呢？',1,'a1','alizhangsan','2020-02-01 10:39:55'),(90,NULL,NULL,NULL,NULL,'？？？',1,'a1','alizhangsan','2020-02-01 10:44:05'),(91,NULL,NULL,NULL,NULL,'？？',1,'a1','alizhangsan','2020-02-01 10:47:18'),(92,NULL,NULL,NULL,NULL,'1',1,'alizhangsan','a1','2020-02-01 10:48:48'),(93,NULL,NULL,NULL,NULL,'2',1,'a1','alizhangsan','2020-02-01 10:49:14'),(94,NULL,NULL,NULL,NULL,'a',1,'alizhangsan','a1','2020-02-01 13:26:01'),(95,NULL,NULL,NULL,NULL,'b',1,'a1','alizhangsan','2020-02-01 13:26:30'),(96,NULL,NULL,NULL,NULL,'c',1,'a1','alizhangsan','2020-02-01 13:28:07'),(97,NULL,NULL,NULL,NULL,'d',1,'a1','alizhangsan','2020-02-01 13:28:40'),(98,NULL,NULL,NULL,NULL,'e',1,'a1','alizhangsan','2020-02-01 13:30:30'),(99,NULL,NULL,NULL,NULL,'f',1,'alizhangsan','a1','2020-02-01 13:35:39'),(100,NULL,NULL,NULL,NULL,'g',1,'a1','alizhangsan','2020-02-01 13:38:19'),(101,NULL,NULL,NULL,NULL,'h',1,'a1','alizhangsan','2020-02-01 13:41:27'),(102,NULL,NULL,NULL,NULL,'您好',1,'a1','alizhangsan','2020-02-01 13:48:41'),(103,NULL,NULL,NULL,NULL,'收不到',1,'alizhangsan','a1','2020-02-01 14:26:15'),(104,NULL,NULL,NULL,NULL,'每次消息都发给自己了',1,'a1','alizhangsan','2020-02-01 14:55:36'),(105,NULL,NULL,NULL,NULL,'????',1,'alizhangsan','a1','2020-02-01 14:57:31'),(106,NULL,NULL,NULL,NULL,'???',1,'alizhangsan','a1','2020-02-01 15:17:19'),(107,NULL,NULL,NULL,NULL,'???',1,'alizhangsan','a1','2020-02-01 15:17:19'),(108,NULL,NULL,NULL,NULL,'1',1,'alizhangsan','a1','2020-02-01 15:28:18'),(109,NULL,NULL,NULL,NULL,'1',1,'alizhangsan','a1','2020-02-01 15:29:29'),(110,NULL,NULL,NULL,NULL,'hello',1,'a1','alizhangsan','2020-02-01 17:53:03'),(111,NULL,NULL,NULL,NULL,'终于又收到您的消息了',1,'alizhangsan','a1','2020-02-01 17:53:34'),(112,NULL,NULL,NULL,NULL,'感觉好兴奋啊',1,'a1','alizhangsan','2020-02-01 17:58:50'),(113,NULL,NULL,NULL,NULL,'我也是',1,'alizhangsan','a1','2020-02-01 17:59:00'),(114,NULL,NULL,NULL,NULL,'该项目已上线',1,'a3','tengxunlisi','2020-02-01 18:00:41'),(115,NULL,NULL,NULL,NULL,'访问地址是？',1,'tengxunlisi','a3','2020-02-01 18:01:40'),(116,NULL,NULL,NULL,NULL,'www.wanke.com',1,'a3','tengxunlisi','2020-02-01 18:02:00'),(117,NULL,NULL,NULL,NULL,'你做了哪些部分？',1,'tengxunlisi','a3','2020-02-01 18:02:31'),(118,NULL,NULL,NULL,NULL,'好的',1,'baiduwangwu','a4','2020-02-01 18:05:37'),(119,NULL,NULL,NULL,NULL,'我看一下',1,'baiduwangwu','a4','2020-02-01 18:05:55'),(120,NULL,NULL,NULL,NULL,'明天上午你有时间吗？',1,'baiduwangwu','a4','2020-02-01 18:06:16'),(121,NULL,NULL,NULL,NULL,'上午几点？',1,'a4','baiduwangwu','2020-02-01 18:06:32'),(122,NULL,NULL,NULL,NULL,'9:30',1,'baiduwangwu','a4','2020-02-01 18:06:42'),(123,NULL,NULL,NULL,NULL,'我住的有点远，',1,'a4','baiduwangwu','2020-02-01 18:07:02'),(124,NULL,NULL,NULL,NULL,'十点您看可以吗？',1,'a4','baiduwangwu','2020-02-01 18:07:12'),(125,NULL,NULL,NULL,NULL,'行，明天上午十点到来面试',1,'baiduwangwu','a4','2020-02-01 18:08:09'),(126,NULL,NULL,NULL,NULL,'地址在：海淀区西土城致真大厦',1,'baiduwangwu','a4','2020-02-01 18:08:53'),(127,NULL,NULL,NULL,NULL,'好嘞，',1,'a4','baiduwangwu','2020-02-01 18:09:00'),(128,NULL,NULL,NULL,NULL,'明天见',1,'a4','baiduwangwu','2020-02-01 18:09:05');
/*!40000 ALTER TABLE `chat_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise`
--

DROP TABLE IF EXISTS `enterprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '企业id',
  `enterprise_name` varchar(128) DEFAULT NULL COMMENT '企业名称',
  `address` varchar(256) DEFAULT NULL COMMENT '企业地址',
  `introduction` text COMMENT '企业介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='企业表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise`
--

LOCK TABLES `enterprise` WRITE;
/*!40000 ALTER TABLE `enterprise` DISABLE KEYS */;
INSERT INTO `enterprise` VALUES (1,'阿里巴巴（中国）有限公司','杭州余杭区阿里巴巴西溪园区','牛逼的公司'),(2,'腾讯科技（深圳）有限公司','深圳南山区腾讯大厦','牛逼的公司'),(3,'百度在线网络技术（北京）有限公司','北京海淀区百度科技园','牛逼的公司'),(4,'北京滴滴无限科技发展有限公司','北京市海淀区未名视通研发楼','牛逼的公司'),(5,'华为技术有限公司','杭州滨江区华为科技有限公司杭州研究所','牛逼的公司'),(6,'北京小米移动软件有限公司','北京海淀区小米移动互联网产业园','牛逼的公司');
/*!40000 ALTER TABLE `enterprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr`
--

DROP TABLE IF EXISTS `hr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'hr主键',
  `name` varchar(30) DEFAULT NULL COMMENT '职位发布者',
  `enterprise_id` int(11) DEFAULT NULL,
  `hr_password` varchar(20) DEFAULT NULL COMMENT '密码',
  `hr_account` varchar(20) DEFAULT NULL COMMENT '账号',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `logout_time` datetime DEFAULT NULL COMMENT '登出时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='hr表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr`
--

LOCK TABLES `hr` WRITE;
/*!40000 ALTER TABLE `hr` DISABLE KEYS */;
INSERT INTO `hr` VALUES (14,'张三',1,'123456','alizhangsan','2020-01-19 17:16:43','2020-01-19 17:16:43'),(15,'李四',2,'234567','tengxunlisi','2020-01-19 17:16:43','2020-01-19 17:16:43'),(16,'王五',3,'345678','baiduwangwu','2020-01-19 17:16:43','2020-01-19 17:16:43'),(17,'孙六',4,'456789','didisunliu','2020-01-19 17:16:43','2020-01-19 17:16:43'),(18,'赵七',5,'567891','huweizhaoqi','2020-01-19 17:16:43','2020-01-19 17:16:43'),(19,'吴八',6,'678911','xiaomiwuba','2020-01-19 17:16:43','2020-01-19 17:16:43');
/*!40000 ALTER TABLE `hr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职位id',
  `name` varchar(30) DEFAULT NULL COMMENT '职位名称',
  `month_pay` decimal(10,0) DEFAULT NULL COMMENT '月薪',
  `content` text COMMENT '职位描述',
  `hr_id` int(11) DEFAULT NULL,
  `enterprise_id` int(11) DEFAULT NULL,
  `app_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='职位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'程序员',12000,'好好工作,天天向上',1,1,NULL),(2,'架构师',20000,'好好工作,天天向上',1,1,NULL),(3,'秘书',8000,'好好工作,天天向上',1,1,NULL),(4,'测试员',6000,'好好工作,天天向上',1,1,NULL);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-02 16:52:45
