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
INSERT INTO `applicant` VALUES (1,NULL,'1422413277@qq.com','a1','a1',NULL,NULL),(2,NULL,'111','a3','a3',NULL,NULL),(3,NULL,'111','a3','a3',NULL,NULL),(4,NULL,'1111','a4','a4',NULL,NULL),(5,NULL,'11111111','a5','a5',NULL,NULL),(6,NULL,'123','123','a2',NULL,NULL),(7,NULL,'11111','a6','a6',NULL,NULL),(8,NULL,'2','a7','a7',NULL,NULL),(9,NULL,'22','a8','a8',NULL,NULL),(10,NULL,'222','a9','a9',NULL,NULL),(11,NULL,'2222','a10','a10',NULL,NULL),(12,NULL,'1','a11','a11',NULL,NULL),(13,NULL,'daga','11343','a13',NULL,NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_record`
--

LOCK TABLES `chat_record` WRITE;
/*!40000 ALTER TABLE `chat_record` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='职位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'程序员',12000,'好好工作,天天向上',1,1),(2,'架构师',20000,'好好工作,天天向上',1,1),(3,'秘书',8000,'好好工作,天天向上',1,1),(4,'测试员',6000,'好好工作,天天向上',1,1);
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

-- Dump completed on 2020-01-20  8:51:04
