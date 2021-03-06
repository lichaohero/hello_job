-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: recruit
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `mail_addr` varchar(30) DEFAULT NULL,
  `wanted_position` varchar(30) DEFAULT NULL,
  `wanted_salary` decimal(8,2) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `account` varchar(20) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant`
--

LOCK TABLES `applicant` WRITE;
/*!40000 ALTER TABLE `applicant` DISABLE KEYS */;
INSERT INTO `applicant` VALUES (1,'张晓','111@163.com','测试',5000.00,'1234561','qzzhangxiao','2020-01-18 23:06:19','2020-01-18 23:06:19'),(2,'刘强','222@163.com','程序员',6000.00,'234567','qzliuqian','2020-01-18 23:06:19','2020-01-18 23:06:19'),(3,'付超','333@qq.com','测试',5000.00,'345678','qzfuchao','2020-01-18 23:06:19','2020-01-18 23:06:19'),(4,'尹婷','444@qq.com','架构师',5000.00,'456789','qzyinting','2020-01-18 23:06:19','2020-01-18 23:06:19'),(5,'何丽','555@qq.com','秘书',5000.00,'567891','qzheli','2020-01-18 23:06:19','2020-01-18 23:06:19'),(6,'严蓉','666@qq.com','测试',5000.00,'678911','qzyanrong','2020-01-18 23:06:19','2020-01-18 23:06:19'),(7,'王俊文','777@163.com','程序员',5000.00,'789112','qzwangjunwen','2020-01-18 23:06:19','2020-01-18 23:06:19');
/*!40000 ALTER TABLE `applicant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_id` int(11) DEFAULT NULL,
  `applicant_id` int(11) DEFAULT NULL,
  `hr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `hr_id` int(11) DEFAULT NULL,
  `applicant_id` int(11) DEFAULT NULL,
  `type` enum('hr','applicant') DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_name` varchar(128) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `introduction` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `enterprise_id` int(11) DEFAULT NULL,
  `hr_password` varchar(20) DEFAULT NULL,
  `hr_account` varchar(20) DEFAULT NULL,
  `mail_addr` varchar(128) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr`
--

LOCK TABLES `hr` WRITE;
/*!40000 ALTER TABLE `hr` DISABLE KEYS */;
INSERT INTO `hr` VALUES (1,'张三',1,'123456','alizhangsan','123@qq.com','2020-01-18 17:04:42','2020-01-18 17:04:42'),(2,'李四',2,'234567','tengxunlisi','456@qq.com','2020-01-18 17:04:42','2020-01-18 17:04:42'),(3,'王五',3,'345678','baiduwangwu','789@qq.com','2020-01-18 17:04:42','2020-01-18 17:04:42'),(4,'孙六',4,'456789','didisunliu','asv@qq.com','2020-01-18 17:04:42','2020-01-18 17:04:42'),(5,'赵七',5,'567891','huweizhaoqi','rfv@qq.com','2020-01-18 17:04:42','2020-01-18 17:04:42'),(6,'吴八',6,'678911','xiaomiwuba','fds@qq.com','2020-01-18 17:04:42','2020-01-18 17:04:42');
/*!40000 ALTER TABLE `hr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `month_pay` decimal(8,2) DEFAULT NULL,
  `content` text,
  `hr_id` int(11) DEFAULT NULL,
  `enterprise_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'程序员',12000.00,'好好工作,天天向上',1,1),(2,'架构师',20000.00,'好好工作,天天向上',1,1),(3,'秘书',8000.00,'好好工作,天天向上',1,1),(4,'测试员',6000.00,'好好工作,天天向上',1,1);
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

-- Dump completed on 2020-01-25 10:53:08
