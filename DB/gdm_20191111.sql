-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: gdm
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `allot_guide`
--

DROP TABLE IF EXISTS `allot_guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allot_guide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL COMMENT '指导老师id',
  `stu_id` int(11) DEFAULT NULL COMMENT '学生ID',
  `opTime` datetime DEFAULT NULL COMMENT '分配时间',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allot_guide`
--

LOCK TABLES `allot_guide` WRITE;
/*!40000 ALTER TABLE `allot_guide` DISABLE KEYS */;
INSERT INTO `allot_guide` VALUES (2,396,870,NULL,2019),(3,396,879,NULL,2019),(4,396,878,NULL,2019),(5,396,877,NULL,2019),(6,396,875,NULL,2019),(7,396,859,NULL,2019),(8,396,871,NULL,2019),(11,400,876,NULL,2019),(12,400,872,NULL,2019),(13,400,860,NULL,2019),(14,400,855,NULL,2019),(15,400,853,NULL,2019),(16,400,804,'2019-11-07 10:55:50',2019),(17,398,874,NULL,2019),(18,377,842,'2019-11-08 10:47:26',2019),(21,399,869,NULL,2019),(22,399,862,NULL,2019),(23,399,850,NULL,2019),(24,399,849,NULL,2019),(25,399,864,NULL,2019);
/*!40000 ALTER TABLE `allot_guide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_file`
--

DROP TABLE IF EXISTS `chat_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_info_id` int(11) DEFAULT NULL COMMENT '聊天信息id',
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件类型， 1-图片 2-文件',
  `file_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_file`
--

LOCK TABLES `chat_file` WRITE;
/*!40000 ALTER TABLE `chat_file` DISABLE KEYS */;
INSERT INTO `chat_file` VALUES (1,8,'56f1f89006ce8.jpg','1','attached/chatFile/4CEA18B6-62B3-4588-A7A3-818E2FBE81B6_56f1f89006ce8.jpg'),(2,9,'.jpg','1','attached/chatFile/0C2ACA67-88B6-473E-814A-8C1A5F8AF738_.jpg'),(3,10,'4-160PQ61502.jpg','1','attached/chatFile/4FD47383-F12F-4139-A961-4A0C970BCFF4_4-160PQ61502.jpg');
/*!40000 ALTER TABLE `chat_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_info`
--

DROP TABLE IF EXISTS `chat_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_info` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL COMMENT '发送人id',
  `sender_name` varchar(255) DEFAULT NULL COMMENT '发送人',
  `sender_content` varchar(255) DEFAULT NULL COMMENT '发送内容',
  `answer_id` int(11) DEFAULT NULL COMMENT '回复人id',
  `answer_name` varchar(255) DEFAULT NULL COMMENT '回复人',
  `read_type` varchar(255) DEFAULT NULL COMMENT '消息 , 0-已读 1-未读',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `chat_type` varchar(255) DEFAULT NULL COMMENT '交流，1-私聊  0-群聊',
  `cont_type` varchar(255) DEFAULT NULL COMMENT '消息类型，0-文字消息  1-图片消息  2-文件消息',
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_info`
--

LOCK TABLES `chat_info` WRITE;
/*!40000 ALTER TABLE `chat_info` DISABLE KEYS */;
INSERT INTO `chat_info` VALUES (1,804,'覃丽菊','hello\n',400,'许传本','0',2019,'2019-11-08 23:07:41','1','0'),(2,804,'覃丽菊','hello everyone',1,'','876,872,860,855,853,',2019,'2019-11-08 23:07:59','0','0'),(3,400,'许传本','can i help you ?',804,'覃丽菊','0',2019,'2019-11-08 23:08:53','1','0'),(4,804,'覃丽菊','yes',400,'许传本','1',2019,'2019-11-09 08:56:13','1','0'),(5,804,'覃丽菊','i need you help',400,'许传本','1',2019,'2019-11-09 08:56:22','1','0'),(6,804,'覃丽菊','that\'s all',1,'','400,876,872,860,855,853,',2019,'2019-11-09 09:16:35','0','0'),(7,879,'谢云','老莫',396,'莫智懿','1',2019,'2019-11-09 10:53:00','1','0'),(8,879,'谢云','56f1f89006ce8.jpg',1,'','878,877,875,871,870,859,',2019,'2019-11-09 10:53:15','0','1'),(9,879,'谢云','.jpg',1,'','878,877,875,871,870,859,',2019,'2019-11-09 10:55:06','0','1'),(10,879,'谢云','4-160PQ61502.jpg',396,'莫智懿','1',2019,'2019-11-09 10:55:50','1','1'),(11,396,'莫智懿','哎呀卧槽',1,'','878,877,875,871,870,859,',2019,'2019-11-09 16:43:12','0','0');
/*!40000 ALTER TABLE `chat_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defense_record`
--

DROP TABLE IF EXISTS `defense_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defense_record` (
  `defense_id` int(11) NOT NULL AUTO_INCREMENT,
  `defense_content` longtext COMMENT '答辩记录',
  `stu_id` int(11) DEFAULT NULL COMMENT '学生ID',
  `teacher_id` int(11) DEFAULT NULL COMMENT '指导老师Id',
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`defense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defense_record`
--

LOCK TABLES `defense_record` WRITE;
/*!40000 ALTER TABLE `defense_record` DISABLE KEYS */;
INSERT INTO `defense_record` VALUES (1,'哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦',842,396,2019),(2,'哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦',842,396,2019),(3,'ffffffffffffffffffffff',804,400,2019),(25,'111111111111111111111',879,396,2019),(26,'222222222222222222',879,396,2019);
/*!40000 ALTER TABLE `defense_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_allot`
--

DROP TABLE IF EXISTS `group_allot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_allot` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_number` varchar(50) DEFAULT NULL,
  `classRoom_id` int(11) DEFAULT NULL,
  `reply_time` datetime DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL COMMENT '组名',
  `group_type` varchar(255) DEFAULT NULL COMMENT '分组类型：00-答辩组 01-系答辩委员会',
  `first_defense` varchar(255) DEFAULT NULL COMMENT '是否是第一次分配评阅：00-是 01-否',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_allot`
--

LOCK TABLES `group_allot` WRITE;
/*!40000 ALTER TABLE `group_allot` DISABLE KEYS */;
INSERT INTO `group_allot` VALUES (1,'201700202',NULL,NULL,'答辩1组','00','01',2019),(2,'201700202',1,'2019-12-07 00:00:00','大组一组','01','00',2019);
/*!40000 ALTER TABLE `group_allot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_defense_direction`
--

DROP TABLE IF EXISTS `group_defense_direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_defense_direction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_allot_id` int(11) DEFAULT NULL COMMENT '分组Id',
  `major_id` int(11) DEFAULT NULL COMMENT '专业教研室Id',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_defense_direction`
--

LOCK TABLES `group_defense_direction` WRITE;
/*!40000 ALTER TABLE `group_defense_direction` DISABLE KEYS */;
INSERT INTO `group_defense_direction` VALUES (1,1,4,2019),(2,2,13,2019),(3,2,12,2019),(4,2,11,2019),(5,2,10,2019),(6,2,9,2019),(7,2,6,2019),(8,2,5,2019),(9,2,4,2019);
/*!40000 ALTER TABLE `group_defense_direction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_student`
--

DROP TABLE IF EXISTS `group_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_no` varchar(50) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `group_allot_id` int(11) DEFAULT NULL COMMENT '分组ID',
  `defense_teacher_id` int(11) DEFAULT NULL COMMENT '评阅老师id',
  `opTime` datetime DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_student`
--

LOCK TABLES `group_student` WRITE;
/*!40000 ALTER TABLE `group_student` DISABLE KEYS */;
INSERT INTO `group_student` VALUES (1,'201600208446',842,1,396,'2019-11-08 10:48:38',2019),(2,'201600208446',842,2,396,'2019-11-08 22:29:19',2019);
/*!40000 ALTER TABLE `group_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_teacher`
--

DROP TABLE IF EXISTS `group_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_allot_id` int(11) DEFAULT NULL COMMENT '分组Id',
  `teacher_id` int(11) DEFAULT NULL,
  `opTime` datetime DEFAULT NULL,
  `year` int(11) DEFAULT NULL COMMENT '年度',
  `type` varchar(255) DEFAULT NULL COMMENT '0-组长 1-答辩老师 2-记录员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_teacher`
--

LOCK TABLES `group_teacher` WRITE;
/*!40000 ALTER TABLE `group_teacher` DISABLE KEYS */;
INSERT INTO `group_teacher` VALUES (1,1,396,'2019-11-08 09:35:50',2019,'0'),(2,1,399,'2019-11-08 09:36:00',2019,'1'),(3,1,400,'2019-11-08 09:36:10',2019,'2'),(4,2,385,'2019-11-08 20:32:14',2019,'1'),(5,2,396,'2019-11-08 20:32:45',2019,'0'),(6,2,397,'2019-11-08 20:33:05',2019,'2');
/*!40000 ALTER TABLE `group_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guide_count`
--

DROP TABLE IF EXISTS `guide_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guide_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `max_stuNum` int(11) DEFAULT NULL COMMENT '指导老师最多学生人数',
  `already_stuNum` int(11) DEFAULT NULL COMMENT '指导老师已有学生人数',
  `guide_teachId` int(11) DEFAULT NULL COMMENT '指导老师id',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide_count`
--

LOCK TABLES `guide_count` WRITE;
/*!40000 ALTER TABLE `guide_count` DISABLE KEYS */;
INSERT INTO `guide_count` VALUES (1,20,7,396,2019),(2,5,6,400,2019),(3,5,1,377,2019),(4,5,5,399,2019);
/*!40000 ALTER TABLE `guide_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_info`
--

DROP TABLE IF EXISTS `issue_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_info` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL COMMENT '学生id',
  `issue_name` varchar(255) DEFAULT NULL COMMENT '课题名称',
  `issue_type` varchar(255) DEFAULT NULL COMMENT '课题名类型',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  `opTime` datetime DEFAULT NULL COMMENT '分配时间',
  `is_pass` int(11) DEFAULT '0',
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_info`
--

LOCK TABLES `issue_info` WRITE;
/*!40000 ALTER TABLE `issue_info` DISABLE KEYS */;
INSERT INTO `issue_info` VALUES (1,879,'66666666','&4&_&5&_',2019,NULL,0),(2,842,'sadfasdfffffffffffffffffffffffffffffffffffffffffffffffffffffffff','&2&_',2019,NULL,0),(3,804,'覃丽菊课题','&3&_',2019,NULL,NULL);
/*!40000 ALTER TABLE `issue_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_report`
--

DROP TABLE IF EXISTS `open_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `background` longtext COMMENT '课题研究的背景及意义',
  `report_content` longtext COMMENT '毕业论文研究内容、拟解决的主要问题',
  `report_method` longtext COMMENT '论文研究方法、步骤及措施',
  `report_document` longtext COMMENT '主要参考文献',
  `stu_id` int(11) DEFAULT NULL COMMENT '学生ID',
  `teacher_id` int(11) DEFAULT NULL COMMENT '老师ID',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  `reply_link` varchar(255) DEFAULT NULL COMMENT '是否通过答辩环节：00-否 01-是',
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_report`
--

LOCK TABLES `open_report` WRITE;
/*!40000 ALTER TABLE `open_report` DISABLE KEYS */;
INSERT INTO `open_report` VALUES (1,'<p>谢云添加开题报告</p>','<p>谢云添加开题报告</p>','<p>谢云添加开题报告</p>','<p>谢云添加开题报告</p>',879,396,2019,'1'),(2,'谈茵茵开题报告','谈茵茵开题报告','谈茵茵开题报告','谈茵茵开题报告',842,396,2019,'01');
/*!40000 ALTER TABLE `open_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_progress`
--

DROP TABLE IF EXISTS `plan_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_progress` (
  `progress_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_number` varchar(255) DEFAULT NULL COMMENT '学院编号',
  `category_id` int(11) DEFAULT NULL,
  `major_id` int(255) DEFAULT NULL COMMENT '大类Id',
  `startTime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '结束时间',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  `progress_item_no` varchar(255) DEFAULT NULL COMMENT '阶段编号',
  `progress_start` int(11) DEFAULT NULL COMMENT '进程开始',
  PRIMARY KEY (`progress_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_progress`
--

LOCK TABLES `plan_progress` WRITE;
/*!40000 ALTER TABLE `plan_progress` DISABLE KEYS */;
INSERT INTO `plan_progress` VALUES (1,'201700202',-1,-1,'2019-11-05 22:19:55','2019-11-06 22:19:58',2019,'00',1),(2,'201700202',-1,-1,'2019-11-05 22:20:09','2019-11-09 22:20:13',2019,'01',1),(3,'201700202',-1,-1,'2019-11-05 22:20:47','2019-11-28 22:21:20',2019,'14',1),(4,'201700202',-1,-1,'2019-11-07 22:22:30','2019-11-20 22:22:33',2019,'02',1),(5,'201700202',-1,-1,'2019-11-20 22:22:40','2019-11-29 22:22:43',2019,'04',1),(6,'201700202',-1,-1,'2019-11-14 22:22:51','2019-11-21 22:22:54',2019,'03',1),(7,'201700202',-1,-1,'2019-11-13 22:23:01','2019-11-13 22:23:04',2019,'06',1),(8,'201700202',-1,-1,'2019-11-04 22:23:18','2019-11-22 22:23:23',2019,'07',1),(9,'201700202',-1,-1,'2019-11-13 22:23:31','2019-11-13 22:23:34',2019,'08',1),(10,'201700202',-1,-1,'2019-11-05 22:23:41','2019-11-29 22:23:43',2019,'05',1),(11,'201700202',-1,-1,'2019-11-05 22:23:51','2019-11-30 22:23:54',2019,'10',1),(12,'201700202',-1,-1,'2019-11-05 22:24:01','2019-11-29 22:24:04',2019,'11',1),(13,'201700202',-1,-1,'2019-11-05 22:24:10','2019-11-23 22:24:12',2019,'12',1),(14,'201700202',-1,-1,'2019-11-29 22:24:19','2019-12-07 22:24:22',2019,'13',1),(15,'201700202',8,-1,'2019-11-05 22:54:00','2019-11-30 22:54:03',2019,'00',1),(16,'201700202',8,4,'2019-11-05 22:54:00','2019-11-30 22:54:03',2019,'00',1),(17,'201700202',8,-1,'2019-11-05 22:54:13','2019-11-09 22:54:16',2019,'01',1),(18,'201700202',8,4,'2019-11-05 22:54:13','2019-11-09 22:54:16',2019,'01',1),(19,'201700202',8,-1,'2019-11-08 22:54:23','2019-12-05 22:54:27',2019,'02',1),(20,'201700202',8,4,'2019-11-08 22:54:23','2019-12-05 22:54:27',2019,'02',1),(21,'201700202',8,4,'2019-11-05 09:14:36','2019-11-30 09:14:40',2019,'04',1),(22,'201700202',8,4,'2019-11-04 09:14:49','2019-11-30 09:14:54',2019,'03',1),(23,'201700202',8,4,'2019-11-05 09:15:01','2019-11-30 09:15:05',2019,'06',1),(24,'201700202',8,4,'2019-11-05 09:15:14','2019-11-30 09:15:17',2019,'07',1),(25,'201700202',8,4,'2019-11-01 09:15:24','2019-11-29 09:15:29',2019,'08',1),(26,'201700202',8,4,'2019-10-28 09:15:39','2019-11-30 09:15:42',2019,'05',1),(27,'201700202',8,4,'2019-11-06 09:15:52','2019-11-30 09:15:55',2019,'10',1),(28,'201700202',8,4,'2019-11-05 09:16:02','2019-11-24 09:16:05',2019,'11',1),(29,'201700202',8,4,'2019-11-06 09:16:16','2019-11-30 09:16:18',2019,'12',1),(30,'201700202',8,4,'2019-11-06 09:16:26','2019-11-30 09:16:28',2019,'13',1),(31,'201700202',8,4,'2019-11-06 09:16:38','2019-11-30 09:16:39',2019,'14',1);
/*!40000 ALTER TABLE `plan_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_year`
--

DROP TABLE IF EXISTS `plan_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `op_user_id` int(11) DEFAULT NULL COMMENT '录入入',
  `opTime` datetime DEFAULT NULL COMMENT '录入时间',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_year`
--

LOCK TABLES `plan_year` WRITE;
/*!40000 ALTER TABLE `plan_year` DISABLE KEYS */;
INSERT INTO `plan_year` VALUES (1,201,'2019-11-05 21:56:47',2019),(2,201,'2019-11-08 10:09:05',2020),(3,201,'2019-11-08 10:09:12',2019);
/*!40000 ALTER TABLE `plan_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progress_item`
--

DROP TABLE IF EXISTS `progress_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progress_item` (
  `progress_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `progress_item_no` varchar(255) DEFAULT NULL COMMENT '进度进程编号',
  `progress_name` varchar(255) DEFAULT NULL COMMENT '进度进程名称',
  PRIMARY KEY (`progress_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress_item`
--

LOCK TABLES `progress_item` WRITE;
/*!40000 ALTER TABLE `progress_item` DISABLE KEYS */;
INSERT INTO `progress_item` VALUES (1,'00','安排计划'),(2,'01','指导分配'),(3,'02','选题情况'),(4,'04','分组情况'),(5,'03','任务书'),(6,'06','开题报告'),(7,'07','进展情况'),(8,'06','论文上交'),(9,'08','指导老师规范审查评阅信息'),(11,'05','评阅老师论文评阅'),(12,'10','论文答辩'),(13,'11','答辩记录'),(14,'12','成绩及评阅'),(15,'13','答辩组（成绩录入/评阅分配/评阅信息）'),(16,'14','论文推优');
/*!40000 ALTER TABLE `progress_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progress_situ`
--

DROP TABLE IF EXISTS `progress_situ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progress_situ` (
  `progress_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL COMMENT '学生id',
  `teacher_id` int(11) DEFAULT NULL COMMENT '教师id',
  `progress_time` varchar(255) DEFAULT NULL COMMENT '时间',
  `progress_work` varchar(255) DEFAULT NULL COMMENT '工作要求',
  `progress_record` varchar(255) DEFAULT NULL COMMENT '进程记录',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`progress_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress_situ`
--

LOCK TABLES `progress_situ` WRITE;
/*!40000 ALTER TABLE `progress_situ` DISABLE KEYS */;
INSERT INTO `progress_situ` VALUES (1,842,396,'2019-11-08 09:40:29','谈茵茵进度情况\r\n\r\n','谈茵茵进度情况\r\n',2019),(2,842,396,'2019-11-08 09:40:46','谈茵茵进度情况\r\n2','谈茵茵进度情况\r\n2',2019),(3,804,400,'2019-11-09 11:59:04','33333333333333333333333333333333','33333333333333333333333333333333333',2019),(4,879,396,'2019-11-09 15:57:03','	谢云进度情况','	谢云进度情况',2019),(5,879,396,'2019-11-09 15:57:10','	谢云进度情况','	谢云进度情况',2019);
/*!40000 ALTER TABLE `progress_situ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `read_group`
--

DROP TABLE IF EXISTS `read_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `read_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) DEFAULT NULL,
  `group_leader_id` int(10) DEFAULT NULL,
  `teacher_name` varchar(50) DEFAULT NULL,
  `classRoom_id` int(10) DEFAULT NULL,
  `classRoom_name` varchar(50) DEFAULT NULL,
  `major_name` varchar(50) DEFAULT NULL,
  `major_id` int(10) DEFAULT NULL,
  `reply_time` date DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `dept_number` varchar(50) DEFAULT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `read_group`
--

LOCK TABLES `read_group` WRITE;
/*!40000 ALTER TABLE `read_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `read_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply_score`
--

DROP TABLE IF EXISTS `reply_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply_score` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_link` varchar(2000) DEFAULT NULL COMMENT '评语',
  `reply_score` float DEFAULT NULL COMMENT '答辩成绩',
  `reply_score_finish` int(11) DEFAULT NULL COMMENT '答辩最终成绩',
  `grade` varchar(255) DEFAULT NULL COMMENT '等级',
  `stu_id` int(11) DEFAULT NULL COMMENT '学生Id',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  `reply_type` varchar(255) DEFAULT NULL COMMENT '答辩类型： 00答辩小组 01系答辩委员会',
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply_score`
--

LOCK TABLES `reply_score` WRITE;
/*!40000 ALTER TABLE `reply_score` DISABLE KEYS */;
INSERT INTO `reply_score` VALUES (1,NULL,94,37,'不及格',842,2019,'00');
/*!40000 ALTER TABLE `reply_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL COMMENT '学生Id',
  `total_score` float DEFAULT NULL COMMENT '总得分',
  `teacherId` int(11) DEFAULT NULL COMMENT '老师Id',
  `review_content` text COMMENT '评语或者对规范审查不合格者说明原因',
  `review_type` varchar(255) DEFAULT NULL COMMENT '评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查',
  `reply_link` varchar(255) DEFAULT NULL COMMENT '是否通过答辩环节：00-否 01-是',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  `opTime` datetime DEFAULT NULL COMMENT '分配时间',
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,842,24,396,'哎呦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦','00','01',2019,NULL),(2,842,6,396,'哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦哎呦不错哦','02',NULL,2019,NULL),(3,842,13,377,'33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333','01','01',2019,NULL);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_score`
--

DROP TABLE IF EXISTS `review_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_score` (
  `review_score_id` int(11) NOT NULL AUTO_INCREMENT,
  `review_id` int(11) DEFAULT NULL COMMENT '评阅Id',
  `score_item_id` int(11) NOT NULL COMMENT '评分项目Id',
  `score` float DEFAULT NULL COMMENT '得分',
  `weight` int(11) DEFAULT NULL COMMENT '权值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  `opTime` datetime DEFAULT NULL COMMENT '分配时间',
  PRIMARY KEY (`review_score_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_score`
--

LOCK TABLES `review_score` WRITE;
/*!40000 ALTER TABLE `review_score` DISABLE KEYS */;
INSERT INTO `review_score` VALUES (1,1,1,2,1,NULL,2019,NULL),(2,1,2,2,2,NULL,2019,NULL),(3,1,3,2,3,NULL,2019,NULL),(4,1,4,2,4,NULL,2019,NULL),(5,1,5,2,5,NULL,2019,NULL),(6,1,6,2,6,NULL,2019,NULL),(7,1,7,2,7,NULL,2019,NULL),(8,1,8,2,8,NULL,2019,NULL),(9,1,9,2,9,NULL,2019,NULL),(10,1,10,2,10,NULL,2019,NULL),(11,1,11,2,11,NULL,2019,NULL),(12,1,12,2,12,NULL,2019,NULL),(13,2,26,1,1,NULL,2019,NULL),(14,2,27,1,2,NULL,2019,NULL),(15,2,28,1,3,NULL,2019,NULL),(16,2,29,1,4,NULL,2019,NULL),(17,2,30,1,5,NULL,2019,NULL),(18,2,31,1,6,NULL,2019,NULL),(19,3,19,1,7,NULL,2019,NULL),(20,3,20,1,8,NULL,2019,NULL),(21,3,21,1,9,NULL,2019,NULL),(22,3,22,1,10,NULL,2019,NULL),(23,3,23,1,11,NULL,2019,NULL),(24,3,24,1,12,NULL,2019,NULL),(25,3,25,1,13,NULL,2019,NULL);
/*!40000 ALTER TABLE `review_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_item`
--

DROP TABLE IF EXISTS `score_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_item` (
  `score_item_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评分项目Id',
  `item_group_no` varchar(11) DEFAULT NULL COMMENT '评分项目分组编号',
  `item_name` varchar(255) DEFAULT NULL COMMENT '评分项目名称',
  `item_score` int(11) DEFAULT NULL COMMENT '分值',
  `weight` int(11) DEFAULT NULL COMMENT '权值',
  `item_type` varchar(255) DEFAULT NULL COMMENT '评分项目类型：00-评阅   01-规范审查',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`score_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_item`
--

LOCK TABLES `score_item` WRITE;
/*!40000 ALTER TABLE `score_item` DISABLE KEYS */;
INSERT INTO `score_item` VALUES (1,'g00-1','学习态度',7,1,'00',2019),(2,'g00-1','科学实践、调研',7,2,'00',2019),(3,'g00-1','题目工作量',6,3,'00',2019),(4,'g00-2','查阅文献资料',10,1,'00',2019),(5,'g00-2','综合运用知识能力',10,2,'00',2019),(6,'g00-2','研究方案的设计能力',10,3,'00',2019),(7,'g00-2','研究方法和手段的运用能力',10,4,'00',2019),(8,'g00-3','外文运用能力',10,1,'00',2019),(9,'g00-3','写作水平',10,2,'00',2019),(10,'g00-3','写作规范',5,3,'00',2019),(11,'g00-3','篇幅',5,4,'00',2019),(12,'g00-3','成果的理论或实际价值',10,5,'00',2019),(13,'g01-1','专业培养目标',5,1,'00',2019),(14,'g01-1','理论意义或实际价值',5,2,'00',2019),(15,'g01-1','选题',5,3,'00',2019),(16,'g01-1','题目工作量',5,4,'00',2019),(17,'g01-2','查阅文献资料',8,1,'00',2019),(18,'g01-2','综合运用知识能力',8,2,'00',2019),(19,'g01-2','研究方案的设计能力',8,3,'00',2019),(20,'g01-2','研究方法和手段的运用能力',8,4,'00',2019),(21,'g01-2','外文运用能力',8,5,'00',2019),(22,'g01-3','写作水平',12,1,'00',2019),(23,'g01-3','写作规范',8,2,'00',2019),(24,'g01-3','篇幅',8,3,'00',2019),(25,'g01-3','成果的理论或实际价值',12,4,'00',2019),(26,'g02-1','开题报告完成情况',10,1,'01',2019),(27,'g02-1','毕业实习、毕业设计(论文)出勤情况',10,2,'01',2019),(28,'g02-1','毕业设计(论文)工作进度完成情况',20,3,'01',2019),(29,'g02-1','中、英文摘要、外文资料完成情况',10,4,'01',2019),(30,'g02-1','独立完成情况',20,5,'01',2019),(31,'g02-1','毕业设计(论文)内容、格式规范情况',30,6,'01',2019);
/*!40000 ALTER TABLE `score_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_item_group`
--

DROP TABLE IF EXISTS `score_item_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_item_group` (
  `item_group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评分项目分组Id',
  `group_name` varchar(255) DEFAULT NULL COMMENT '评分项目组名',
  `weight` int(11) DEFAULT NULL COMMENT '权值',
  `group_percent` varchar(255) DEFAULT NULL COMMENT '百分比',
  `group_type` varchar(255) DEFAULT NULL COMMENT '分组类别：00-指导老师评阅  01-评阅老师评阅  02-指导老师规范审查',
  `group_no` varchar(255) DEFAULT NULL COMMENT '组编号',
  PRIMARY KEY (`item_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_item_group`
--

LOCK TABLES `score_item_group` WRITE;
/*!40000 ALTER TABLE `score_item_group` DISABLE KEYS */;
INSERT INTO `score_item_group` VALUES (1,'工作表现',1,'20%','00','g00-1'),(2,'能力水平',2,'50%','00','g00-2'),(3,'成果质量',3,'30%','00','g00-3'),(4,'选题质量',1,'20%','01','g01-1'),(5,'能力水平',2,'40%','01','g01-2'),(6,'成果质量',3,'40%','01','g01-3'),(7,'评阅老师评阅审查',1,NULL,'02','g02-1');
/*!40000 ALTER TABLE `score_item_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_file`
--

DROP TABLE IF EXISTS `student_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_file` (
  `file_id` int(11) NOT NULL DEFAULT '0',
  `file_name` varchar(255) DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_file`
--

LOCK TABLES `student_file` WRITE;
/*!40000 ALTER TABLE `student_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_paper`
--

DROP TABLE IF EXISTS `student_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_paper` (
  `paper_id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_name` varchar(255) DEFAULT NULL COMMENT '论文名称',
  `stu_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件类型（1-论文 2-查重报告 3-承诺书）',
  `opTime` datetime DEFAULT NULL COMMENT '分配时间',
  PRIMARY KEY (`paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_paper`
--

LOCK TABLES `student_paper` WRITE;
/*!40000 ALTER TABLE `student_paper` DISABLE KEYS */;
INSERT INTO `student_paper` VALUES (1,'4-14120Q54144.jpg',842,377,2019,'/upload/19C2080E-B04F-46F8-B26A-67F03835E117_4-14120Q54144.jpg',75659,'00',NULL),(2,'5-160401142549.jpg',842,377,2019,'/upload/DBA17225-92E3-4801-8B11-DCF7F7FA02F6_5-160401142549.jpg',477585,'01',NULL),(3,'53c4a3ad158f8.jpg',842,377,2019,'/upload/38F76C3A-5311-4096-AEE1-AA8AFBD890AD_53c4a3ad158f8.jpg',360890,'02',NULL);
/*!40000 ALTER TABLE `student_paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_category`
--

DROP TABLE IF EXISTS `sys_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(250) DEFAULT NULL,
  `dept_number` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category`
--

LOCK TABLES `sys_category` WRITE;
/*!40000 ALTER TABLE `sys_category` DISABLE KEYS */;
INSERT INTO `sys_category` VALUES (3,'计算机类','201700202'),(4,'物联网类','201700202'),(5,'数字媒体类','201700202'),(6,'电子类','201700202'),(7,'数学类','201700202'),(8,'软件类','201700202'),(9,'行政','201700202'),(10,'计算机基础','201700202');
/*!40000 ALTER TABLE `sys_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_class`
--

DROP TABLE IF EXISTS `sys_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_no` varchar(50) DEFAULT NULL COMMENT '班级编号',
  `class_name` varchar(50) DEFAULT NULL COMMENT '班级名称',
  `dept_number` varchar(255) DEFAULT NULL COMMENT '学院编号',
  `major_id` int(11) DEFAULT NULL COMMENT '专业Id',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_class`
--

LOCK TABLES `sys_class` WRITE;
/*!40000 ALTER TABLE `sys_class` DISABLE KEYS */;
INSERT INTO `sys_class` VALUES (23,NULL,'14软件工程2班','201700202',4),(25,NULL,'14软件工程中升本','201700202',4),(26,NULL,'15软件工程1班','201700202',4),(27,NULL,'15软件工程2班','201700202',4),(28,NULL,'15软件工程3班','201700202',4),(29,NULL,'15软件工程4班','201700202',4),(30,NULL,'15软件工程中升本1班','201700202',4),(31,NULL,'15软件工程中升本2班','201700202',4),(32,NULL,'16软件工程1班','201700202',4),(33,NULL,'16软件工程2班','201700202',4),(34,NULL,'16软件工程3班','201700202',4),(35,NULL,'16软件工程4班','201700202',4),(36,NULL,'16软件工程中升本1班','201700202',4),(37,NULL,'16软件工程中升本2班','201700202',4);
/*!40000 ALTER TABLE `sys_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_classroom`
--

DROP TABLE IF EXISTS `sys_classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_classroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classroom_name` varchar(255) NOT NULL COMMENT '教研室名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_classroom`
--

LOCK TABLES `sys_classroom` WRITE;
/*!40000 ALTER TABLE `sys_classroom` DISABLE KEYS */;
INSERT INTO `sys_classroom` VALUES (1,'n201'),(2,'n202'),(3,'n203'),(4,'n204'),(5,'n205'),(7,'n301'),(8,'n302'),(9,'n303'),(10,'n304'),(11,'n305'),(12,'n401'),(13,'n501'),(14,'n402'),(15,'n405'),(16,'n403'),(17,'n502'),(18,'n404'),(19,'n503'),(20,'n504'),(21,'n505'),(22,'n601'),(23,'n602'),(24,'n603'),(25,'n604'),(26,'n605'),(27,'m401'),(28,'m402'),(29,'m403'),(30,'m404'),(31,'m405'),(32,'m406'),(33,'软件室一'),(34,'软件室二'),(35,'计算机基础实验室一'),(36,'计算机基础实验室二'),(37,'计算机基础实验室三'),(38,'软件开发中心');
/*!40000 ALTER TABLE `sys_classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_department`
--

DROP TABLE IF EXISTS `sys_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_number` varchar(250) DEFAULT NULL COMMENT '学院',
  `dept_name` varchar(250) DEFAULT NULL COMMENT '学院名称',
  `dept_description` varchar(250) DEFAULT NULL COMMENT '学院描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_department`
--

LOCK TABLES `sys_department` WRITE;
/*!40000 ALTER TABLE `sys_department` DISABLE KEYS */;
INSERT INTO `sys_department` VALUES (1,'201700201','信息与电子工程学院',' 	信息与电子工程学院'),(2,'201700202','大数据与软件工程学院','大数据与软件工程学院'),(3,'201700203','教师教育学院','教师教育学院'),(4,'201700204','宝石与艺术设计学院','宝石与艺术设计学院'),(5,'201700205','外国语学院','外国语学院'),(6,'201700206','商学院','商学院'),(7,'201700207','机械与材料工程学院','机械与材料工程学院'),(8,'201700208','化学工程与资源再利用学院','化学工程与资源再利用学院'),(9,'201700209','文学与传媒学院','文学与传媒学院'),(10,'201700210','法学与公共管理学院','法学与公共管理学院'),(11,'201700211','马克思主义学院','马克思主义学院'),(12,'201700212','继续教育学院','继续教育学院'),(13,'201700213','高等职业技术学院 ','高等职业技术学院 ');
/*!40000 ALTER TABLE `sys_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_directions`
--

DROP TABLE IF EXISTS `sys_directions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_directions` (
  `directions_id` int(11) NOT NULL AUTO_INCREMENT,
  `directions_name` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`directions_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_directions`
--

LOCK TABLES `sys_directions` WRITE;
/*!40000 ALTER TABLE `sys_directions` DISABLE KEYS */;
INSERT INTO `sys_directions` VALUES (1,'软件开发'),(2,'AR技术'),(3,'网络安全'),(4,'UI设计'),(5,'软件测试');
/*!40000 ALTER TABLE `sys_directions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_duties`
--

DROP TABLE IF EXISTS `sys_duties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_duties` (
  `duties_id` int(11) NOT NULL AUTO_INCREMENT,
  `duties_no` varchar(255) DEFAULT NULL COMMENT '职称编号',
  `duties_name` varchar(255) DEFAULT NULL COMMENT '职务名称',
  PRIMARY KEY (`duties_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_duties`
--

LOCK TABLES `sys_duties` WRITE;
/*!40000 ALTER TABLE `sys_duties` DISABLE KEYS */;
INSERT INTO `sys_duties` VALUES (3,'00','院党委书记'),(4,'01','院长'),(5,'02','院党委副书记'),(6,'03','副院长（主管教学）'),(7,'04','副院长（主管行政）'),(8,'05','副院长（主管科研）'),(9,'06','行政办公室主任'),(10,'07','教学办公室主任'),(11,'08','教学秘书'),(12,'09','实验室主任'),(13,'10','课程教研室主任'),(14,'11','计算机科学与技术专业教研室主任'),(15,'12','物联网工程专业教研室主任'),(16,'13','数字媒体技专业教研室主任'),(17,'14','电子信息工程专业教研室主任'),(18,'15','软件工程专业教研室主任'),(19,'16','数学与应用数学专业教研室主任'),(20,'17','电子科学与技术专业教研室主任'),(21,'18','信息与计算科学专业教研室主任'),(22,'19','应用物理学专业教研室主任'),(23,'20','辅导员'),(24,'21','实验技术人员'),(25,'22','教师'),(26,'23','实验室管理员');
/*!40000 ALTER TABLE `sys_duties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_type`
--

DROP TABLE IF EXISTS `sys_file_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_type` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_type_no` varchar(255) DEFAULT NULL COMMENT '文件类型编号',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_type`
--

LOCK TABLES `sys_file_type` WRITE;
/*!40000 ALTER TABLE `sys_file_type` DISABLE KEYS */;
INSERT INTO `sys_file_type` VALUES (1,'论文','00'),(2,'查重报告','01'),(3,'承诺书','02');
/*!40000 ALTER TABLE `sys_file_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_group`
--

DROP TABLE IF EXISTS `sys_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_group` (
  `groupId` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) DEFAULT NULL COMMENT '权限分组名称',
  `groupPerm` varchar(255) DEFAULT NULL COMMENT '分组权限',
  `menuId` int(11) DEFAULT NULL COMMENT '分组ID',
  `weight` int(11) DEFAULT NULL COMMENT '权值',
  `group_url` varchar(255) DEFAULT NULL COMMENT '访问地址',
  PRIMARY KEY (`groupId`),
  KEY `FK1F960A8D9B76FDFA` (`menuId`),
  CONSTRAINT `sys_group_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `sys_menu` (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_group`
--

LOCK TABLES `sys_group` WRITE;
/*!40000 ALTER TABLE `sys_group` DISABLE KEYS */;
INSERT INTO `sys_group` VALUES (49,'用户管理','perm:userHelpManagement',16,1,'/sys/userHelp_list.action?view=list'),(50,'角色管理','perm:roleManagement',16,2,'/sys/sysRole_list.action?view=list'),(51,'我的毕业课题','perm:myTopicInformation',27,1,'/biz/materialInfo_info.action?view=info'),(52,'我的个人资料','perm:myPersonalInformation',28,1,'/sys/userHelp_openUserInfo.action?view=userInfo'),(53,'我的任务书','perm:myTaskBook',26,1,'/biz/materialInfo_info.action?view=info&mark=taskBook&flag=03'),(54,'选择指导老师','perm:chooseTheInstructor',20,1,'/biz/allotGuide_allotTeacherList.action?view=teacher_list&flag=01'),(55,'我的开题报告','perm:myOpeningReport',25,1,'/biz/materialInfo_info.action?view=info&mark=openingReport&flag=04'),(56,'我的进度情况','perm:myProgressStatus',24,1,'/biz/materialInfo_info.action?view=info&mark=progressStatus&flag=05'),(57,'学生答辩记录','perm:myDefenseRecord',21,1,'/biz/materialInfo_info.action?view=info'),(58,'我的论文','perm:myPaper',29,1,'/biz/materialInfo_info.action?view=uploadFile&tabFlag=04'),(59,'学生信息','perm:BasicInformation',17,1,'/sys/student_list.action?view=list'),(60,'学生课题信息','perm:topicInformation',27,2,'/biz/materialInfo_guideStudentList.action?view=guide_student_list&flag=13'),(61,'选择所带学生','perm:selectStudent',20,2,'/biz/allotGuide_allotStudentList.action?view=student_list&flag=01'),(62,'老师分组','perm:enterTheTeacherGroup',19,1,'/biz/GroupTeacher_list.action?view=teacher_list&flag=08'),(63,'学生分组','perm:enterTheStudentGroup',19,2,'/biz/GroupStudent_list.action?view=student_list&flag=08'),(64,'学生任务书','perm:studentTaskBook',26,1,'/biz/taskBook_openAdd.action?view=detail'),(65,'学生开题报告','perm:studentOpeningReport',25,1,'/biz/materialInfo_guideStudentList.action?view=guide_student_list&flag=13'),(66,'进度计划','perm:planProgress',18,2,'/biz/PlanProgress_list.action?view=progress_list&tabFlag=01'),(67,'年度计划','perm:planYear',18,1,'/biz/PlanYear_list.action?view=year_list&tabFlag=00'),(68,'指导人数安排','perm:planGuide',18,3,'/biz/PlanGuide_list.action?view=guide_list&tabFlag=02'),(69,'答辩过程记录','perm:defenseRecord',21,1,'/biz/defenseRecord_groupAllStudentList.action?view=groupAllStudentList&flag=12&thisReplyType=00'),(70,'成绩及评阅','perm:replyScore',21,2,'/biz/replyScore_list.action?view=list&flag=12&thisReplyType=00'),(73,'学生论文','perm:studentPapers',29,1,'/biz/materialInfo_info.action?view=info&mark=paper'),(74,'老师信息','perm:teacherInformation',17,2,'/sys/teacher_list.action?view=list'),(75,'班级信息','perm:classInformation',17,5,'/sys/classes_list.action?view=list'),(76,'学院信息','perm:departInformation',17,3,'/sys/department_list.action?view=list'),(77,'专业信息','perm:majorInformation',17,4,'/sys/major_list.action?view=list'),(78,'教室管理','perm:classrommInformation',17,6,'/sys/classroom_list.action?view=list'),(80,'职称管理','perm:technicalInformation',17,8,'/sys/technical_list.action?view=list'),(81,'大类信息','perm:categoryInformation',17,9,'/sys/category_list.action?view=list'),(82,'研究方向信息','perm:directionsInformation',17,10,'/sys/directions_list.action?view=list'),(83,'职务信息','perm:positionInformation',17,11,'/sys/duties_list.action?view=list'),(84,'课题类型信息','perm:issueTypeInformation',17,12,'/sys/issueType_list.action?view=list'),(85,'成绩录入','perm:RecordEntryInformation',21,1,'/biz/materialInfo_groupStudentList.action?view=recordEntry&flag=13&thisReplyType=00'),(86,'评阅分配','perm:reviewAssignInformation',30,2,'/biz/materialInfo_groupDefenseStudentList.action?view=defense_student_list&flag=13'),(87,'文件类型信息','perm:fileTypeInformation',17,13,'/sys/fileType_list.action?view=list'),(88,'公告信息','perm:noticeInformation',17,14,'/sys/notice_list.action?view=list'),(90,'评阅信息','perm:reviewInformation',31,1,'/biz/materialInfo_groupDefenseStudentList.action?view=reviewDissertation&flag=13'),(91,'导师课题信息','perm:projectInformation',27,1,'/biz/teacherProject_list.action?view=list'),(92,'我的导师课题','perm:myTeaProInformation',27,2,'/biz/teacherProject_detail.action?view=detail'),(93,'课题类型统计','perm:typeStatistics',27,3,'/biz/issueInfo_openChart.action?view=statistics');
/*!40000 ALTER TABLE `sys_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_issue_type`
--

DROP TABLE IF EXISTS `sys_issue_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_issue_type` (
  `issue_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_type_name` varchar(255) DEFAULT NULL COMMENT '课题类型名称',
  PRIMARY KEY (`issue_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_issue_type`
--

LOCK TABLES `sys_issue_type` WRITE;
/*!40000 ALTER TABLE `sys_issue_type` DISABLE KEYS */;
INSERT INTO `sys_issue_type` VALUES (1,'基础研究'),(2,'应用基础'),(3,'应用研究'),(4,'工程设计'),(5,'实验研究');
/*!40000 ALTER TABLE `sys_issue_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_major`
--

DROP TABLE IF EXISTS `sys_major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_major` (
  `major_id` int(11) NOT NULL AUTO_INCREMENT,
  `major_no` varchar(250) DEFAULT NULL COMMENT '专业编号',
  `dept_number` varchar(250) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT '大类Id',
  `major_name` varchar(250) DEFAULT NULL COMMENT '专业名称',
  `staff_name` varchar(250) DEFAULT NULL COMMENT '教研室名称',
  PRIMARY KEY (`major_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_major`
--

LOCK TABLES `sys_major` WRITE;
/*!40000 ALTER TABLE `sys_major` DISABLE KEYS */;
INSERT INTO `sys_major` VALUES (4,'000','201700202',8,'软件工程','软件工程专业教研室'),(5,'001','201700202',4,'物联网工程','物联网工程专业教研室'),(6,'002','201700202',3,'计算机科学与技术','计算机科学与技术专业教研室'),(9,'005','201700202',7,'数学与应用数学','数学与应用数学专业教研室'),(10,'006','201700202',6,'电子科学与技术','电子科学与技术专业教研室'),(11,'007','201700202',10,'信息与计算科学','信息与计算科学专业教研室'),(12,'008','201700202',10,'数字媒体应用技术','数字媒体应用技术实验室'),(13,'009','201700202',10,'计算机基础','计算机基础教研室');
/*!40000 ALTER TABLE `sys_major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT,
  `menuName` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `menuPerm` varchar(255) DEFAULT NULL COMMENT '菜单权限',
  `weight` int(11) DEFAULT NULL COMMENT '权值',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (16,'系统管理','perm:SystemManagement',14),(17,'基础信息','perm:BasicInformation',11),(18,'安排计划','perm:Schedule',2),(19,'分组管理','perm:GroupManagement',5),(20,'指导分配','perm:InstructionAllocation',3),(21,'答辩记录','perm:DefenseRecord',12),(24,'进度情况','perm:ProgressStatus',9),(25,'开题报告','perm:OpeningReport',8),(26,'任务书','perm:TaskBook',7),(27,'毕业课题','perm:Topic',4),(28,'个人信息','perm:Personalnformation',13),(29,'毕业论文','perm:Dissertation',10),(30,'评阅分配','perm:DefenseGrouplnformation',6),(31,'论文评阅','perm:ReviewDissertationlnformation',11);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_name` varchar(255) DEFAULT NULL COMMENT '公告标题',
  `notice_content` varchar(9999) DEFAULT NULL COMMENT '公告内容',
  `notice_time` datetime DEFAULT NULL COMMENT '公告发布时间',
  `user_id` int(11) DEFAULT NULL COMMENT '公告发布者',
  `notice_path` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `notice_type` int(11) DEFAULT NULL COMMENT '公告类型，1-文本 2-图片 3-文件',
  `dept_number` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL COMMENT '年度',
  `major_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (2,'关于开题报告地点更换通知','由于与老师课程时间冲突，将原定N202答辩地点改为S502，请同学相互通知！','2019-07-08 17:14:10',772,NULL,NULL,NULL,2019,-2),(3,'莫智懿发布公告','自动垃圾收集\r\n自动垃圾收集是查看堆内存，识别正在使用那些对象，那些对象未被删除，删除未被使用对象的过程。使用中对象或引用的对象意味着程序的某些部分任然维护指向该对象的指针。程序的任何部分都不再引用未使用的对象或未引用的对象，则可以回收未引用对象的内存。在C语言中，内存的分配和释放是手动的过程，在Java语言中内存的分配和回收是由垃圾收集器自动处理的。\r\n\r\n而在自动垃圾收集中如何确定那些内存需要被回收，通常来说第一步就是标记，利用引用计数，可达性分析等来标记那些内存正在使用，那些内存不在使用。','2019-11-09 08:54:38',772,NULL,NULL,NULL,2019,-2),(4,'老莫发布公告','1234567890-','2019-11-09 16:46:13',1532,NULL,NULL,201700202,2019,4),(5,'33333333333333','点点滴滴的点点滴滴的点点滴滴','2019-11-09 16:49:49',1532,NULL,NULL,201700202,2019,4),(6,'通知1通知1通知1通知1','通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1通知1','2019-11-10 08:55:12',772,NULL,NULL,NULL,2019,-2),(7,'asdfasdfas','asdfasdfasdf','2019-11-10 09:11:58',772,NULL,NULL,NULL,2019,-2),(9,'莫智懿发布公告3','form.submit is not a function','2019-11-10 09:20:51',1532,NULL,NULL,201700202,2019,4),(10,'asdf','asdfasd','2019-11-10 11:00:25',772,NULL,NULL,NULL,2019,-2),(11,'莫智懿发布公告','asdf','2019-11-10 11:16:44',772,NULL,NULL,NULL,2019,-2);
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_operation`
--

DROP TABLE IF EXISTS `sys_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_operation` (
  `operationId` int(11) NOT NULL AUTO_INCREMENT,
  `operationName` varchar(255) DEFAULT NULL COMMENT '操作名称',
  `operationPerm` varchar(255) DEFAULT NULL COMMENT '操作权限',
  `groupId` int(11) DEFAULT NULL COMMENT '分组ID',
  PRIMARY KEY (`operationId`),
  KEY `FK2C5D5255467D909E` (`groupId`),
  CONSTRAINT `sys_operation_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `sys_group` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_operation`
--

LOCK TABLES `sys_operation` WRITE;
/*!40000 ALTER TABLE `sys_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(255) DEFAULT NULL COMMENT '权限资源',
  `roleId` int(11) DEFAULT NULL COMMENT '角色Id',
  PRIMARY KEY (`id`),
  KEY `FKC9610A816F1ACE7F` (`roleId`),
  CONSTRAINT `sys_permission_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=828 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission`
--

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
INSERT INTO `sys_permission` VALUES (185,'perm:myTopicInformation',24),(186,'perm:Personalnformation',24),(187,'perm:ProgressStatus',24),(188,'perm:Topic',24),(189,'perm:myPersonalInformation',24),(190,'perm:chooseTheInstructor',24),(191,'perm:TaskBook',24),(192,'perm:myTaskBook',24),(193,'perm:DefenseRecord',24),(194,'perm:myProgressStatus',24),(195,'perm:InstructionAllocation',24),(196,'perm:myDefenseRecord',24),(197,'perm:myPaper',24),(198,'perm:OpeningReport',24),(199,'perm:Dissertation',24),(200,'perm:myOpeningReport',24),(717,'perm:teacherInformation',23),(718,'perm:classrommInformation',23),(719,'perm:planProgress',23),(720,'perm:DefenseRecord',23),(721,'perm:ProgressStatus',23),(722,'perm:TaskBook',23),(723,'perm:topicInformation',23),(724,'perm:defenseRecord',23),(725,'perm:Dissertation',23),(726,'perm:userHelpManagement',23),(727,'perm:majorInformation',23),(728,'perm:reviewInformation',23),(729,'perm:issueTypeInformation',23),(730,'perm:Schedule',23),(731,'perm:categoryInformation',23),(732,'perm:departInformation',23),(733,'perm:ReviewDissertationlnformation',23),(734,'perm:myPersonalInformation',23),(735,'perm:RecordEntryInformation',23),(736,'perm:planYear',23),(737,'perm:BasicInformation',23),(738,'perm:directionsInformation',23),(739,'perm:myOpeningReport',23),(740,'perm:planGuide',23),(741,'perm:chooseTheInstructor',23),(742,'perm:classInformation',23),(743,'perm:myDefenseRecord',23),(744,'perm:replyScore',23),(745,'perm:selectStudent',23),(746,'perm:reviewAssignInformation',23),(747,'perm:typeStatistics',23),(748,'perm:BasicInformation',23),(749,'perm:GroupManagement',23),(750,'perm:studentTaskBook',23),(751,'perm:DefenseGrouplnformation',23),(752,'perm:InstructionAllocation',23),(753,'perm:enterTheStudentGroup',23),(754,'perm:myPaper',23),(755,'perm:fileTypeInformation',23),(756,'perm:studentOpeningReport',23),(757,'perm:myProgressStatus',23),(758,'perm:OpeningReport',23),(759,'perm:enterTheTeacherGroup',23),(760,'perm:SystemManagement',23),(761,'perm:Topic',23),(762,'perm:roleManagement',23),(763,'perm:positionInformation',23),(764,'perm:noticeInformation',23),(765,'perm:Personalnformation',23),(766,'perm:technicalInformation',23),(767,'perm:myTopicInformation',23),(768,'perm:myTaskBook',23),(769,'perm:studentPapers',23),(788,'perm:DefenseGrouplnformation',25),(789,'perm:enterTheTeacherGroup',25),(790,'perm:myPersonalInformation',25),(791,'perm:DefenseRecord',25),(792,'perm:RecordEntryInformation',25),(793,'perm:topicInformation',25),(794,'perm:selectStudent',25),(795,'perm:Topic',25),(796,'perm:reviewInformation',25),(797,'perm:InstructionAllocation',25),(798,'perm:ReviewDissertationlnformation',25),(799,'perm:replyScore',25),(800,'perm:defenseRecord',25),(801,'perm:reviewAssignInformation',25),(802,'perm:GroupManagement',25),(803,'perm:enterTheStudentGroup',25),(804,'perm:Personalnformation',25),(805,'perm:BasicInformation',26),(806,'perm:Personalnformation',26),(807,'perm:planProgress',26),(808,'perm:Topic',26),(809,'perm:teacherInformation',26),(810,'perm:InstructionAllocation',26),(811,'perm:enterTheTeacherGroup',26),(812,'perm:planGuide',26),(813,'perm:topicInformation',26),(814,'perm:enterTheStudentGroup',26),(815,'perm:ReviewDissertationlnformation',26),(816,'perm:reviewInformation',26),(817,'perm:majorInformation',26),(818,'perm:reviewAssignInformation',26),(819,'perm:classInformation',26),(820,'perm:GroupManagement',26),(821,'perm:BasicInformation',26),(822,'perm:myPersonalInformation',26),(823,'perm:noticeInformation',26),(824,'perm:Schedule',26),(825,'perm:RecordEntryInformation',26),(826,'perm:DefenseGrouplnformation',26),(827,'perm:selectStudent',26);
/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) DEFAULT NULL COMMENT '角色详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (23,'系统管理员','获得系统所有操作'),(24,'学生用户','学院所有学生'),(25,'教师','学校教师'),(26,'教研室主任','学院教研室主任'),(27,'院系管理员','主管院系所有信息');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_student`
--

DROP TABLE IF EXISTS `sys_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_student` (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_no` varchar(255) DEFAULT NULL COMMENT '学生学号',
  `stu_name` varchar(255) NOT NULL COMMENT '学生姓名',
  `stu_idcart` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `stu_address` varchar(255) DEFAULT NULL COMMENT '家庭地址',
  `stu_arrangement` varchar(255) DEFAULT NULL COMMENT '学历层次(1-本科 2-高职)',
  `stu_schoollength` varchar(255) DEFAULT NULL COMMENT '学制',
  `stu_entrance` date DEFAULT NULL COMMENT '入学时间',
  `stu_grade` varchar(255) DEFAULT NULL COMMENT '年级',
  `dept_number` varchar(255) DEFAULT NULL COMMENT '院系编号',
  `category_id` int(11) DEFAULT NULL COMMENT '大类Id',
  `major_id` int(11) DEFAULT NULL COMMENT '专业编号',
  `class_id` int(11) DEFAULT NULL COMMENT '班级编号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户编号',
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=882 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_student`
--

LOCK TABLES `sys_student` WRITE;
/*!40000 ALTER TABLE `sys_student` DISABLE KEYS */;
INSERT INTO `sys_student` VALUES (252,'201600208104','何盛万','20170001','梧州学院','本科','4','2016-09-07','2016','201700202',NULL,4,32,1138),(253,'201600213141','李苑瑜','20170001','梧州学院','本科','4','2016-09-08','2016','201700202',NULL,4,36,1139),(254,'201600213142','陆南梅','20170001','梧州学院','本科','4','2016-09-09','2016','201700202',NULL,4,36,1140),(255,'201400213018','廖克裕','20170001','梧州学院','本科','4','2016-09-10','2016','201700202',NULL,4,36,1141),(256,'201600213104','甘德品','20170001','梧州学院','本科','4','2016-09-11','2016','201700202',NULL,4,36,1142),(257,'201600213108','黄依顺','20170001','梧州学院','本科','4','2016-09-12','2016','201700202',NULL,4,36,1143),(258,'201600213113','李春霖','20170001','梧州学院','本科','4','2016-09-13','2016','201700202',NULL,4,36,1144),(259,'201600213115','李宗森','20170001','梧州学院','本科','4','2016-09-14','2016','201700202',NULL,4,36,1145),(260,'201600213117','梁稳','20170001','梧州学院','本科','4','2016-09-15','2016','201700202',NULL,4,36,1146),(261,'201600213120','龙永亮','20170001','梧州学院','本科','4','2016-09-16','2016','201700202',NULL,4,36,1147),(262,'201600213122','卢山盟','20170001','梧州学院','本科','4','2016-09-17','2016','201700202',NULL,4,36,1148),(263,'201600213126','王文滔','20170001','梧州学院','本科','4','2016-09-18','2016','201700202',NULL,4,36,1149),(264,'201600213132','周林福','20170001','梧州学院','本科','4','2016-09-19','2016','201700202',NULL,4,36,1150),(265,'201600213138','黄叶英','20170001','梧州学院','本科','4','2016-09-20','2016','201700202',NULL,4,36,1151),(266,'201600213139','黄玉花','20170001','梧州学院','本科','4','2016-09-21','2016','201700202',NULL,4,36,1152),(267,'201600213145','潘丽梅','20170001','梧州学院','本科','4','2016-09-22','2016','201700202',NULL,4,36,1153),(268,'201600213148','唐艳妮','20170001','梧州学院','本科','4','2016-09-23','2016','201700202',NULL,4,36,1154),(269,'201600213153','杨冬雪','20170001','梧州学院','本科','4','2016-09-24','2016','201700202',NULL,4,36,1155),(270,'201600213155','游春兰 ','20170001','梧州学院','本科','4','2016-09-25','2016','201700202',NULL,4,36,1156),(271,'201600213215','马欣廷','20170001','梧州学院','本科','4','2016-09-26','2016','201700202',NULL,4,37,1157),(272,'201600213218','潘辉','20170001','梧州学院','本科','4','2016-09-27','2016','201700202',NULL,4,37,1158),(273,'201600213220','宋楚皓','20170001','梧州学院','本科','4','2016-09-28','2016','201700202',NULL,4,37,1159),(274,'201500208207','黄郁盛','20170001','梧州学院','本科','4','2016-09-29','2015','201700202',NULL,4,NULL,1160),(275,'201500208218','梁家琪','20170001','梧州学院','本科','4','2016-09-30','2015','201700202',NULL,4,NULL,1161),(276,'201500208230','沈嘉伟','20170001','梧州学院','本科','4','2016-10-01','2015','201700202',NULL,4,NULL,1162),(277,'201500208231','覃镜毓','20170001','梧州学院','本科','4','2016-10-02','2015','201700202',NULL,4,NULL,1163),(278,'201500208235','王志','20170001','梧州学院','本科','4','2016-10-03','2015','201700202',NULL,4,NULL,1164),(279,'20160020820\'1','陈胜','20170001','梧州学院','本科','4','2016-10-04','2016','201700202',NULL,4,33,1165),(280,'201600208230','杨长官','20170001','梧州学院','本科','4','2016-10-05','2016','201700202',NULL,4,33,1166),(281,'201600208233‘','陈冬霞','20170001','梧州学院','本科','4','2016-10-06','2016','201700202',NULL,4,33,1167),(282,'201600208234’','程秀英','20170001','梧州学院','本科','4','2016-10-07','2016','201700202',NULL,4,33,1168),(283,'201600208236','李美琦','20170001','梧州学院','本科','4','2016-10-08','2016','201700202',NULL,4,33,1169),(284,'201600208237‘','李逸','20170001','梧州学院','本科','4','2016-10-09','2016','201700202',NULL,4,33,1170),(285,'201600208241‘','罗贺','20170001','梧州学院','本科','4','2016-10-10','2016','201700202',NULL,4,33,1171),(286,'201600208244’','孙少喜','20170001','梧州学院','本科','4','2016-10-11','2016','201700202',NULL,4,33,1172),(287,'201600208408','李海华','20170001','梧州学院','本科','4','2016-10-12','2016','201700202',NULL,4,35,1173),(288,'201600208409','李善念','20170001','梧州学院','本科','4','2016-10-13','2016','201700202',NULL,4,35,1174),(289,'201600208410','李天赐','20170001','梧州学院','本科','4','2016-10-14','2016','201700202',NULL,4,35,1175),(290,'201600208420','覃威茗','20170001','梧州学院','本科','4','2016-10-15','2016','201700202',NULL,4,35,1176),(291,'201600208427','吴思敏','20170001','梧州学院','本科','4','2016-10-16','2016','201700202',NULL,4,35,1177),(292,'201600208428','杨健铭','20170001','梧州学院','本科','4','2016-10-17','2016','201700202',NULL,4,35,1178),(293,'201600208430','郑宣贵','20170001','梧州学院','本科','4','2016-10-18','2016','201700202',NULL,4,35,1179),(294,'201600208431','周杰威','20170001','梧州学院','本科','4','2016-10-19','2016','201700202',NULL,4,35,1180),(295,'201600208435','池小媛','20170001','梧州学院','本科','4','2016-10-20','2016','201700202',NULL,4,35,1181),(296,'201600208439','梁海玲','20170001','梧州学院','本科','4','2016-10-21','2016','201700202',NULL,4,35,1182),(297,'201600213202','陈德培','20170001','梧州学院','本科','4','2016-10-22','2016','201700202',NULL,4,37,1183),(298,'201600213203','陈永任','20170001','梧州学院','本科','4','2016-10-23','2016','201700202',NULL,4,37,1184),(299,'201600213210','黄贻通','20170001','梧州学院','本科','4','2016-10-24','2016','201700202',NULL,4,37,1185),(300,'201600213223','苏祖豪','20170001','梧州学院','本科','4','2016-10-25','2016','201700202',NULL,4,37,1186),(301,'201500208107','黄慧君','20170001','梧州学院','本科','4','2016-10-26','2015','201700202',NULL,4,NULL,1187),(302,'201500208317','李睿','20170001','梧州学院','本科','4','2016-10-27','2015','201700202',NULL,4,NULL,1188),(303,'201500208318','梁皓','20170001','梧州学院','本科','4','2016-10-28','2015','201700202',NULL,4,NULL,1189),(304,'201500208323','陆权宁','20170001','梧州学院','本科','4','2016-10-29','2015','201700202',NULL,4,NULL,1190),(305,'201600208101','陈巨洁','20170001','梧州学院','本科','4','2016-10-30','2016','201700202',NULL,4,32,1191),(306,'201600208106','蒋邦雄','20170001','梧州学院','本科','4','2016-10-31','2016','201700202',NULL,4,32,1192),(307,'201600208108','李炳志','20170001','梧州学院','本科','4','2016-11-01','2016','201700202',NULL,4,32,1193),(308,'201600208109','李宏伟','20170001','梧州学院','本科','4','2016-11-02','2016','201700202',NULL,4,32,1194),(309,'201600208112','李杨','20170001','梧州学院','本科','4','2016-11-03','2016','201700202',NULL,4,32,1195),(310,'201600208113','李造','20170001','梧州学院','本科','4','2016-11-04','2016','201700202',NULL,4,32,1196),(311,'201600208114','林家健','20170001','梧州学院','本科','4','2016-11-05','2016','201700202',NULL,4,32,1197),(312,'201600208115','凌钦华','20170001','梧州学院','本科','4','2016-11-06','2016','201700202',NULL,4,32,1198),(313,'201600208130','杨夕锋','20170001','梧州学院','本科','4','2016-11-07','2016','201700202',NULL,4,32,1199),(314,'201600208132','曾波','20170001','梧州学院','本科','4','2016-11-08','2016','201700202',NULL,4,32,1200),(315,'201600208203','董有宏','20170001','梧州学院','本科','4','2016-11-09','2016','201700202',NULL,4,33,1201),(316,'201600208207','蓝福','20170001','梧州学院','本科','4','2016-11-10','2016','201700202',NULL,4,33,1202),(317,'201600208209','李家荣','20170001','梧州学院','本科','4','2016-11-11','2016','201700202',NULL,4,33,1203),(318,'201600208214','刘维逸','20170001','梧州学院','本科','4','2016-11-12','2016','201700202',NULL,4,33,1204),(319,'201600208215','卢永贵','20170001','梧州学院','本科','4','2016-11-13','2016','201700202',NULL,4,33,1205),(320,'201600208216‘','罗浩铨','20170001','梧州学院','本科','4','2016-11-14','2016','201700202',NULL,4,33,1206),(321,'201600208219','慕荣辉','20170001','梧州学院','本科','4','2016-11-15','2016','201700202',NULL,4,33,1207),(322,'201600213154','杨银燕','20170001','梧州学院','本科','4','2016-11-16','2016','201700202',NULL,4,36,1208),(323,'201600213207','黄鸿羲','20170001','梧州学院','本科','4','2016-11-17','2016','201700202',NULL,4,37,1209),(324,'201600213213','李汶霖','20170001','梧州学院','本科','4','2016-11-18','2016','201700202',NULL,4,37,1210),(325,'201600213216','莫运平','20170001','梧州学院','本科','4','2016-11-19','2016','201700202',NULL,4,37,1211),(326,'201600213219','潘琦','20170001','梧州学院','本科','4','2016-11-20','2016','201700202',NULL,4,37,1212),(327,'201600213232','钟将','20170001','梧州学院','本科','4','2016-11-21','2016','201700202',NULL,4,37,1213),(328,'201400213045','张超','20170001','梧州学院','本科','4','2016-11-22','2014','201700202',NULL,4,25,1214),(329,'201500208305','董振华','20170001','梧州学院','本科','4','2016-11-23','2015','201700202',NULL,4,NULL,1215),(330,'201500208415','陆宏安','20170001','梧州学院','本科','4','2016-11-24','2015','201700202',NULL,4,NULL,1216),(331,'201600208147','杨吉','20170001','梧州学院','本科','4','2016-11-25','2016','201700202',NULL,4,32,1217),(332,'201600208229‘','颜阳','20170001','梧州学院','本科','4','2016-11-26','2016','201700202',NULL,4,33,1218),(333,'201600208242‘','潘杏','20170001','梧州学院','本科','4','2016-11-27','2016','201700202',NULL,4,33,1219),(334,'201600208302','陈春杨','20170001','梧州学院','本科','4','2016-11-28','2016','201700202',NULL,4,34,1220),(335,'201600208313','梁艺耀','20170001','梧州学院','本科','4','2016-11-29','2016','201700202',NULL,4,34,1221),(336,'201600208314','廖富光','20170001','梧州学院','本科','4','2016-11-30','2016','201700202',NULL,4,34,1222),(337,'201600208329','叶子胜','20170001','梧州学院','本科','4','2016-12-01','2016','201700202',NULL,4,34,1223),(338,'201600208332','周家财','20170001','梧州学院','本科','4','2016-12-02','2016','201700202',NULL,4,34,1224),(339,'201600208336','陈紫丽','20170001','梧州学院','本科','4','2016-12-03','2016','201700202',NULL,4,34,1225),(340,'201600208339','李静','20170001','梧州学院','本科','4','2016-12-04','2016','201700202',NULL,4,34,1226),(341,'201600208424','唐志晖','20170001','梧州学院','本科','4','2016-12-05','2016','201700202',NULL,4,35,1227),(342,'201600208429','杨顺海','20170001','梧州学院','本科','4','2016-12-06','2016','201700202',NULL,4,35,1228),(343,'201600208442','刘玉霜','20170001','梧州学院','本科','4','2016-12-07','2016','201700202',NULL,4,35,1229),(344,'201600208451','张中怡','20170001','梧州学院','本科','4','2016-12-08','2016','201700202',NULL,4,35,1230),(345,'201600213236','陈艳艳','20170001','梧州学院','本科','4','2016-12-09','2016','201700202',NULL,4,37,1231),(346,'201600213237','黄靖舒','20170001','梧州学院','本科','4','2016-12-10','2016','201700202',NULL,4,37,1232),(347,'201600213238','黄柳条','20170001','梧州学院','本科','4','2016-12-11','2016','201700202',NULL,4,37,1233),(348,'201600213240','江锦琦','20170001','梧州学院','本科','4','2016-12-12','2016','201700202',NULL,4,37,1234),(349,'201600213241','蓝金董','20170001','梧州学院','本科','4','2016-12-13','2016','201700202',NULL,4,37,1235),(350,'201600213245','吕江','20170001','梧州学院','本科','4','2016-12-14','2016','201700202',NULL,4,37,1236),(351,'201600213246','蒙丹','20170001','梧州学院','本科','4','2016-12-15','2016','201700202',NULL,4,37,1237),(352,'201600213249','覃香群','20170001','梧州学院','本科','4','2016-12-16','2016','201700202',NULL,4,37,1238),(353,'201500213101','蔡昌志','20170001','梧州学院','本科','4','2016-12-17','2015','201700202',NULL,4,NULL,1239),(354,'201500213103','董世怡','20170001','梧州学院','本科','4','2016-12-18','2015','201700202',NULL,4,NULL,1240),(355,'201500213216','陶锐','20170001','梧州学院','本科','4','2016-12-19','2015','201700202',NULL,4,NULL,1241),(356,'201500213220','韦汀晏','20170001','梧州学院','本科','4','2016-12-20','2015','201700202',NULL,4,NULL,1242),(357,'201500213224','钟宾','20170001','梧州学院','本科','4','2016-12-21','2015','201700202',NULL,4,NULL,1243),(358,'201600208148','张翠玲','20170001','梧州学院','本科','4','2016-12-22','2016','201700202',NULL,4,32,1244),(359,'201600208401','曹宸玮','20170001','梧州学院','本科','4','2016-12-23','2016','201700202',NULL,4,35,1245),(360,'201600208406','韩鹏程','20170001','梧州学院','本科','4','2016-12-24','2016','201700202',NULL,4,35,1246),(361,'201600208415','刘柏池','20170001','梧州学院','本科','4','2016-12-25','2016','201700202',NULL,4,35,1247),(362,'201600208419','阮民涛','20170001','梧州学院','本科','4','2016-12-26','2016','201700202',NULL,4,35,1248),(363,'201600208422','唐昊','20170001','梧州学院','本科','4','2016-12-27','2016','201700202',NULL,4,35,1249),(364,'201600208423','唐奕明','20170001','梧州学院','本科','4','2016-12-28','2016','201700202',NULL,4,35,1250),(365,'201600208425','韦永共','20170001','梧州学院','本科','4','2016-12-29','2016','201700202',NULL,4,35,1251),(366,'201600208436','丁婉朔','20170001','梧州学院','本科','4','2016-12-30','2016','201700202',NULL,4,35,1252),(367,'201600208441','刘家倩','20170001','梧州学院','本科','4','2016-12-31','2016','201700202',NULL,4,35,1253),(368,'201600213101','陈炳成','20170001','梧州学院','本科','4','2017-01-01','2016','201700202',NULL,4,36,1254),(369,'201600213105','甘范名','20170001','梧州学院','本科','4','2017-01-02','2016','201700202',NULL,4,36,1255),(370,'201600213111','雷观昌','20170001','梧州学院','本科','4','2017-01-03','2016','201700202',NULL,4,36,1256),(371,'201600213112','黎峻豪','20170001','梧州学院','本科','4','2017-01-04','2016','201700202',NULL,4,36,1257),(372,'201600213118','刘冠宏','20170001','梧州学院','本科','4','2017-01-05','2016','201700202',NULL,4,36,1258),(373,'201600213124','石宏磊','20170001','梧州学院','本科','4','2017-01-06','2016','201700202',NULL,4,36,1259),(374,'201600213125','谭建狄','20170001','梧州学院','本科','4','2017-01-07','2016','201700202',NULL,4,36,1260),(375,'201600213127','韦歌迪','20170001','梧州学院','本科','4','2017-01-08','2016','201700202',NULL,4,36,1261),(376,'201600213133','朱华庭','20170001','梧州学院','本科','4','2017-01-09','2016','201700202',NULL,4,36,1262),(377,'201600213134','朱首彰','20170001','梧州学院','本科','4','2017-01-10','2016','201700202',NULL,4,36,1263),(378,'201600213239','黄小梅','20170001','梧州学院','本科','4','2017-01-11','2016','201700202',NULL,4,37,1264),(379,'201600213243','梁小英','20170001','梧州学院','本科','4','2017-01-12','2016','201700202',NULL,4,37,1265),(380,'201600213248','覃萍','20170001','梧州学院','本科','4','2017-01-13','2016','201700202',NULL,4,37,1266),(381,'201500208123','彭标','20170001','梧州学院','本科','4','2017-01-14','2015','201700202',NULL,4,NULL,1267),(382,'201500208128','韦增武','20170001','梧州学院','本科','4','2017-01-15','2015','201700202',NULL,4,NULL,1268),(383,'201500208129','闻丽媛','20170001','梧州学院','本科','4','2017-01-16','2015','201700202',NULL,4,NULL,1269),(384,'201500208204','傅宇华','20170001','梧州学院','本科','4','2017-01-17','2015','201700202',NULL,4,NULL,1270),(385,'201600208105','黄智中','20170001','梧州学院','本科','4','2017-01-18','2016','201700202',NULL,4,32,1271),(386,'201600208118','潘宸','20170001','梧州学院','本科','4','2017-01-19','2016','201700202',NULL,4,32,1272),(387,'201600208120','沈喜龙','20170001','梧州学院','本科','4','2017-01-20','2016','201700202',NULL,4,32,1273),(388,'201600208121','司开元','20170001','梧州学院','本科','4','2017-01-21','2016','201700202',NULL,4,32,1274),(389,'201600208124','王梓能','20170001','梧州学院','本科','4','2017-01-22','2016','201700202',NULL,4,32,1275),(390,'201600208128','谢常繁','20170001','梧州学院','本科','4','2017-01-23','2016','201700202',NULL,4,32,1276),(391,'201600208135','黄滢','20170001','梧州学院','本科','4','2017-01-24','2016','201700202',NULL,4,32,1277),(392,'201600208136','蒋玉蓉','20170001','梧州学院','本科','4','2017-01-25','2016','201700202',NULL,4,32,1278),(393,'201600208145','温晓怡','20170001','梧州学院','本科','4','2017-01-26','2016','201700202',NULL,4,32,1279),(394,'201600208208‘','李锋','20170001','梧州学院','本科','4','2017-01-27','2016','201700202',NULL,4,33,1280),(395,'201600208246’','王惠','20170001','梧州学院','本科','4','2017-01-28','2016','201700202',NULL,4,33,1281),(396,'201600208249','张露丹','20170001','梧州学院','本科','4','2017-01-29','2016','201700202',NULL,4,33,1282),(397,'201600208251','曾小婷','20170001','梧州学院','本科','4','2017-01-30','2016','201700202',NULL,4,33,1283),(398,'201600208307','黄启东','20170001','梧州学院','本科','4','2017-01-31','2016','201700202',NULL,4,34,1284),(399,'201600208321','阮春彪','20170001','梧州学院','本科','4','2017-02-01','2016','201700202',NULL,4,34,1285),(400,'201600208345','盘美英','20170001','梧州学院','本科','4','2017-02-02','2016','201700202',NULL,4,34,1286),(401,'201600208404','范书豪','20170001','梧州学院','本科','4','2017-02-03','2016','201700202',NULL,4,35,1287),(402,'201600208413','廖树杰','20170001','梧州学院','本科','4','2017-02-04','2016','201700202',NULL,4,35,1288),(403,'201600208414','凌朝政','20170001','梧州学院','本科','4','2017-02-05','2016','201700202',NULL,4,35,1289),(404,'201600208418','潘登','20170001','梧州学院','本科','4','2017-02-06','2016','201700202',NULL,4,35,1290),(405,'201600208440','梁静华','20170001','梧州学院','本科','4','2017-02-07','2016','201700202',NULL,4,35,1291),(406,'201600213128','吴映辉','20170001','梧州学院','本科','4','2017-02-08','2016','201700202',NULL,4,36,1292),(407,'201600213227','吴光辉','20170001','梧州学院','本科','4','2017-02-09','2016','201700202',NULL,4,37,1293),(408,'201500208324','罗定友','20170001','梧州学院','本科','4','2017-02-10','2015','201700202',NULL,4,NULL,1294),(409,'201500208325','蒙伟森','20170001','梧州学院','本科','4','2017-02-11','2015','201700202',NULL,4,NULL,1295),(410,'201500208333','叶展鹏','20170001','梧州学院','本科','4','2017-02-12','2015','201700202',NULL,4,NULL,1296),(411,'201600208146','吴丹茗','20170001','梧州学院','本科','4','2017-02-13','2016','201700202',NULL,4,32,1297),(412,'201600208213','刘上剑','20170001','梧州学院','本科','4','2017-02-14','2016','201700202',NULL,4,33,1298),(413,'201600208243','庞桂花','20170002','梧州学院','本科','4','2017-02-15','2016','201700202',NULL,4,33,1299),(414,'201600208250‘','朱美林','20170003','梧州学院','本科','4','2017-02-16','2016','201700202',NULL,4,33,1300),(415,'201600208301','曹鹏轩','20170004','梧州学院','本科','4','2017-02-17','2016','201700202',NULL,4,34,1301),(416,'201600208309','黄世创','20170005','梧州学院','本科','4','2017-02-18','2016','201700202',NULL,4,34,1302),(417,'201600208318','潘沛杰','20170006','梧州学院','本科','4','2017-02-19','2016','201700202',NULL,4,34,1303),(418,'201600208330','张恒','20170007','梧州学院','本科','4','2017-02-20','2016','201700202',NULL,4,34,1304),(419,'201600208331','张积健','20170008','梧州学院','本科','4','2017-02-21','2016','201700202',NULL,4,34,1305),(420,'201600208335','陈怡','20170009','梧州学院','本科','4','2017-02-22','2016','201700202',NULL,4,34,1306),(421,'201600208340','刘海帆','20170010','梧州学院','本科','4','2017-02-23','2016','201700202',NULL,4,34,1307),(422,'201600208341','刘嘉嘉','20170011','梧州学院','本科','4','2017-02-24','2016','201700202',NULL,4,34,1308),(423,'201600208344','罗颖玉','20170012','梧州学院','本科','4','2017-02-25','2016','201700202',NULL,4,34,1309),(424,'201600208350','张晓君','20170013','梧州学院','本科','4','2017-02-26','2016','201700202',NULL,4,34,1310),(425,'201600208402','陈震洺','20170014','梧州学院','本科','4','2017-02-27','2016','201700202',NULL,4,35,1311),(426,'201600208403','邓彦松','20170015','梧州学院','本科','4','2017-02-28','2016','201700202',NULL,4,35,1312),(427,'201600208412','梁海超','20170016','梧州学院','本科','4','2017-03-01','2016','201700202',NULL,4,35,1313),(428,'201600208426','魏祥','20170017','梧州学院','本科','4','2017-03-02','2016','201700202',NULL,4,35,1314),(429,'201600208433','陈秋梅','20170018','梧州学院','本科','4','2017-03-03','2016','201700202',NULL,4,35,1315),(430,'201600208438','李春梅','20170019','梧州学院','本科','4','2017-03-04','2016','201700202',NULL,4,35,1316),(431,'201600208445','盛晓洁','20170020','梧州学院','本科','4','2017-03-05','2016','201700202',NULL,4,35,1317),(432,'201600213250','韦露沐','20170021','梧州学院','本科','4','2017-03-06','2016','201700202',NULL,4,37,1318),(433,'201500208116','陆兆民','20170022','梧州学院','本科','4','2017-03-07','2015','201700202',NULL,4,NULL,1319),(434,'201500208421','秦文兵','20170023','梧州学院','本科','4','2017-03-08','2015','201700202',NULL,4,NULL,1320),(435,'201600208102','陈龙','20170026','梧州学院','本科','4','2017-03-09','2016','201700202',NULL,4,32,1321),(436,'201600208122','覃一鋆','20170027','梧州学院','本科','4','2017-03-10','2016','201700202',NULL,4,32,1322),(437,'201600208133','和雪英','20170028','梧州学院','本科','4','2017-03-11','2016','201700202',NULL,4,32,1323),(438,'201600208134','黄佩珍','20170029','梧州学院','本科','4','2017-03-12','2016','201700202',NULL,4,32,1324),(439,'201600208139','莫小丽','20170030','梧州学院','本科','4','2017-03-13','2016','201700202',NULL,4,32,1325),(440,'201600208140','欧榕坤','20170031','梧州学院','本科','4','2017-03-14','2016','201700202',NULL,4,32,1326),(441,'201600208141','冉带素','20170032','梧州学院','本科','4','2017-03-15','2016','201700202',NULL,4,32,1327),(442,'201600208202','邓扬殷','20170033','梧州学院','本科','4','2017-03-16','2016','201700202',NULL,4,33,1328),(443,'201600208206','华孝鹏','20170034','梧州学院','本科','4','2017-03-17','2016','201700202',NULL,4,33,1329),(444,'201600208210','廖桂生','20170035','梧州学院','本科','4','2017-03-18','2016','201700202',NULL,4,33,1330),(445,'201600208224‘','宋玉富','20170036','梧州学院','本科','4','2017-03-19','2016','201700202',NULL,4,33,1331),(446,'201600208226','唐民','20170037','梧州学院','本科','4','2017-03-20','2016','201700202',NULL,4,33,1332),(447,'201600208232’','周易源','20170038','梧州学院','本科','4','2017-03-21','2016','201700202',NULL,4,33,1333),(448,'201500208136','赵迪','20170039','梧州学院','本科','4','2017-03-22','2016','201700202',NULL,4,34,1334),(449,'201600208311','李昂','20170040','梧州学院','本科','4','2017-03-23','2016','201700202',NULL,4,34,1335),(450,'201600208320','薛培星','20170041','梧州学院','本科','4','2017-03-24','2016','201700202',NULL,4,34,1336),(451,'201600208323','王晗','20170042','梧州学院','本科','4','2017-03-25','2016','201700202',NULL,4,34,1337),(452,'201600208326','谢振威','20170043','梧州学院','本科','4','2017-03-26','2016','201700202',NULL,4,34,1338),(453,'201600213119','刘淋逸','20170044','梧州学院','本科','4','2017-03-27','2016','201700202',NULL,4,36,1339),(454,'201600213144','蒙俐宏','20170045','梧州学院','本科','4','2017-03-28','2016','201700202',NULL,4,36,1340),(455,'201600213208','黄家理','20170046','梧州学院','本科','4','2017-03-29','2016','201700202',NULL,4,37,1341),(456,'201600213211','雷文浩','20170047','梧州学院','本科','4','2017-03-30','2016','201700202',NULL,4,37,1342),(457,'201600213212','李家聪','20170048','梧州学院','本科','4','2017-03-31','2016','201700202',NULL,4,37,1343),(458,'201601902132','黄妹','20170051','梧州学院','本科','4','2017-04-01','2016','201700202',NULL,4,32,1344),(459,'201600208217','骆世嘉','20170052','梧州学院','本科','4','2017-04-02','2016','201700202',NULL,4,33,1345),(460,'201600208218','蒙勇飞','20170053','梧州学院','本科','4','2017-04-03','2016','201700202',NULL,4,33,1346),(461,'201600208221','庞彪','20170054','梧州学院','本科','4','2017-04-04','2016','201700202',NULL,4,33,1347),(462,'201600208223','司晓硕','20170055','梧州学院','本科','4','2017-04-05','2016','201700202',NULL,4,33,1348),(463,'201600208227','王洪升','20170056','梧州学院','本科','4','2017-04-06','2016','201700202',NULL,4,33,1349),(464,'201600208247‘','吴丽丽','20170057','梧州学院','本科','4','2017-04-07','2016','201700202',NULL,4,33,1350),(465,'201600208312','李国严','20170058','梧州学院','本科','4','2017-04-08','2016','201700202',NULL,4,34,1351),(466,'201600208316','陆建宁','20170059','梧州学院','本科','4','2017-04-09','2016','201700202',NULL,4,34,1352),(467,'201600213114','李汉彬','20170061','梧州学院','本科','4','2017-04-11','2016','201700202',NULL,4,36,1353),(468,'201600213116','梁林','20170062','梧州学院','本科','4','2017-04-12','2016','201700202',NULL,4,36,1354),(469,'201600213135','陈孔妙','20170063','梧州学院','本科','4','2017-04-13','2016','201700202',NULL,4,36,1355),(470,'201600213205','黄安','20170064','梧州学院','本科','4','2017-04-14','2016','201700202',NULL,4,37,1356),(471,'201600213206','黄鸿庭','20170065','梧州学院','本科','4','2017-04-15','2016','201700202',NULL,4,37,1357),(472,'201600213209','黄培彬','20170066','梧州学院','本科','4','2017-04-16','2016','201700202',NULL,4,37,1358),(473,'201600213214','罗明贵','20170067','梧州学院','本科','4','2017-04-17','2016','201700202',NULL,4,37,1359),(474,'201600213217','农建泽','20170068','梧州学院','本科','4','2017-04-18','2016','201700202',NULL,4,37,1360),(475,'201600213221','苏家卫','20170069','梧州学院','本科','4','2017-04-19','2016','201700202',NULL,4,37,1361),(476,'201600213224','孙广进','20170070','梧州学院','本科','4','2017-04-20','2016','201700202',NULL,4,37,1362),(477,'201600213225','谭霁航','20170071','梧州学院','本科','4','2017-04-21','2016','201700202',NULL,4,37,1363),(478,'201600213233','周孔波','20170072','梧州学院','本科','4','2017-04-22','2016','201700202',NULL,4,37,1364),(479,'201500208337','周华生','20170073','梧州学院','本科','4','2017-04-23','2015','201700202',NULL,4,NULL,1365),(480,'201500208417','陆月富','20170074','梧州学院','本科','4','2017-04-24','2015','201700202',NULL,4,NULL,1366),(481,'201500208426','孙亮','20170075','梧州学院','本科','4','2017-04-25','2015','201700202',NULL,4,NULL,1367),(482,'201500208431','吴煜辉','20170076','梧州学院','本科','4','2017-04-26','2015','201700202',NULL,4,NULL,1368),(483,'201600208103','邓彬胜','20170077','梧州学院','本科','4','2017-04-27','2016','201700202',NULL,4,32,1369),(484,'201600208119','容宇轩','20170078','梧州学院','本科','4','2017-04-28','2016','201700202',NULL,4,32,1370),(485,'201600208123','汪志明','20170079','梧州学院','本科','4','2017-04-29','2016','201700202',NULL,4,32,1371),(486,'201600208126','温德尊','20170080','梧州学院','本科','4','2017-04-30','2016','201700202',NULL,4,32,1372),(487,'201600208405','高航涛','20170081','梧州学院','本科','4','2017-05-01','2016','201700202',NULL,4,35,1373),(488,'201600208416','陆正荣','20170082','梧州学院','本科','4','2017-05-02','2016','201700202',NULL,4,35,1374),(489,'201600208437','黎艳芳','20170083','梧州学院','本科','4','2017-05-03','2016','201700202',NULL,4,35,1375),(490,'201600208447','覃丽菊','20170084','梧州学院','本科','4','2017-05-04','2016','201700202',NULL,4,35,1376),(491,'201600213103','邓祥鸿','20170085','梧州学院','本科','4','2017-05-05','2016','201700202',NULL,4,36,1377),(492,'201600213107','郭天千','20170086','梧州学院','本科','4','2017-05-06','2016','201700202',NULL,4,36,1378),(493,'201600213109','黄源松','20170087','梧州学院','本科','4','2017-05-07','2016','201700202',NULL,4,36,1379),(494,'201600213123','秦曼人','20170088','梧州学院','本科','4','2017-05-08','2016','201700202',NULL,4,36,1380),(495,'201600213130','谢惟朋','20170089','梧州学院','本科','4','2017-05-09','2016','201700202',NULL,4,36,1381),(496,'201600213136','甘丽','20170090','梧州学院','本科','4','2017-05-10','2016','201700202',NULL,4,36,1382),(497,'201600213137','何柳花','20170091','梧州学院','本科','4','2017-05-11','2016','201700202',NULL,4,36,1383),(498,'201600213150','韦燕琳','20170092','梧州学院','本科','4','2017-05-12','2016','201700202',NULL,4,36,1384),(499,'201600213230','叶炜','20170093','梧州学院','本科','4','2017-05-13','2016','201700202',NULL,4,37,1385),(500,'201600213235','陈贵连','20170094','梧州学院','本科','4','2017-05-14','2016','201700202',NULL,4,37,1386),(501,'201600213244','廖小兰','20170095','梧州学院','本科','4','2017-05-15','2016','201700202',NULL,4,37,1387),(502,'201600213247','莫佩凤','20170096','梧州学院','本科','4','2017-05-16','2016','201700202',NULL,4,37,1388),(503,'201600213254','赵春艳','20170097','梧州学院','本科','4','2017-05-17','2016','201700202',NULL,4,37,1389),(504,'201600213255','钟佳萍','20170098','梧州学院','本科','4','2017-05-18','2016','201700202',NULL,4,37,1390),(505,'201500208103','陈石新','20170099','梧州学院','本科','4','2017-05-19','2015','201700202',NULL,4,NULL,1391),(506,'201500208311','黄荣春','20170100','梧州学院','本科','4','2017-05-20','2015','201700202',NULL,4,NULL,1392),(507,'201500208312','黄英强','20170101','梧州学院','本科','4','2017-05-21','2015','201700202',NULL,4,NULL,1393),(508,'201500208316','李权治','20170102','梧州学院','本科','4','2017-05-22','2015','201700202',NULL,4,NULL,1394),(509,'201600208131','周雯才','20170104','梧州学院','本科','4','2017-05-23','2016','201700202',NULL,4,32,1395),(510,'201600208138','李碧静','20170105','梧州学院','本科','4','2017-05-24','2016','201700202',NULL,4,32,1396),(511,'201600208142','谭月莲','20170106','梧州学院','本科','4','2017-05-25','2016','201700202',NULL,4,32,1397),(512,'201600208143','王娜','20170107','梧州学院','本科','4','2017-05-26','2016','201700202',NULL,4,32,1398),(513,'201600208149','张楠','20170108','梧州学院','本科','4','2017-05-27','2016','201700202',NULL,4,32,1399),(514,'201600208150','张旺珍','20170109','梧州学院','本科','4','2017-05-28','2016','201700202',NULL,4,32,1400),(515,'201600208151','周丽鲜','20170110','梧州学院','本科','4','2017-05-29','2016','201700202',NULL,4,32,1401),(516,'201600208212','刘清旭','20170111','梧州学院','本科','4','2017-05-30','2016','201700202',NULL,4,33,1402),(517,'201600208225','孙艺','20170112','梧州学院','本科','4','2017-05-31','2016','201700202',NULL,4,33,1403),(518,'201600208231‘','叶城廷','20170113','梧州学院','本科','4','2017-06-01','2016','201700202',NULL,4,33,1404),(519,'201600208239’','廖梦青','20170114','梧州学院','本科','4','2017-06-02','2016','201700202',NULL,4,33,1405),(520,'201600208315','刘春福','20170115','梧州学院','本科','4','2017-06-03','2016','201700202',NULL,4,34,1406),(521,'201600208334','陈宣媛','20170116','梧州学院','本科','4','2017-06-04','2016','201700202',NULL,4,34,1407),(522,'201600208338','孔丽玲','20170117','梧州学院','本科','4','2017-06-05','2016','201700202',NULL,4,34,1408),(523,'201600208343','刘禹含','20170118','梧州学院','本科','4','2017-06-06','2016','201700202',NULL,4,34,1409),(524,'201600208346','覃荔靖','20170119','梧州学院','本科','4','2017-06-07','2016','201700202',NULL,4,34,1410),(525,'201600208348','王菁颖','20170120','梧州学院','本科','4','2017-06-08','2016','201700202',NULL,4,34,1411),(526,'201600208417','莫东林','20170121','梧州学院','本科','4','2017-06-09','2016','201700202',NULL,4,35,1412),(527,'201600208444','商文鑫','20170122','梧州学院','本科','4','2017-06-10','2016','201700202',NULL,4,35,1413),(528,'201600208446','谈茵茵','20170123','梧州学院','本科','4','2017-06-11','2016','201700202',NULL,4,35,1414),(529,'201600213140','李桂兰','20170124','梧州学院','本科','4','2017-06-12','2016','201700202',NULL,4,36,1415),(530,'201600213151','魏钰','20170125','梧州学院','本科','4','2017-06-13','2016','201700202',NULL,4,36,1416),(531,'201600213152','肖雨君','20170126','梧州学院','本科','4','2017-06-14','2016','201700202',NULL,4,36,1417),(532,'201500213105','何鹏程','20170127','梧州学院','本科','4','2017-06-15','2015','201700202',NULL,4,NULL,1418),(533,'201500213116','唐昌钰','20170128','梧州学院','本科','4','2017-06-16','2015','201700202',NULL,4,NULL,1419),(534,'201500213117','唐立','20170129','梧州学院','本科','4','2017-06-17','2015','201700202',NULL,4,NULL,1420),(535,'201500213126','钟明城','20170130','梧州学院','本科','4','2017-06-18','2015','201700202',NULL,4,NULL,1421),(536,'201600208110','李明清','20170131','梧州学院','本科','4','2017-06-19','2016','201700202',NULL,4,32,1422),(537,'201600208116','陆鹏祥','20170132','梧州学院','本科','4','2017-06-20','2016','201700202',NULL,4,32,1423),(538,'201600208117','陆镇峰','20170133','梧州学院','本科','4','2017-06-21','2016','201700202',NULL,4,32,1424),(539,'201600208137','黎军君','20170134','梧州学院','本科','4','2017-06-22','2016','201700202',NULL,4,32,1425),(540,'201600208144','王研','20170135','梧州学院','本科','4','2017-06-23','2016','201700202',NULL,4,32,1426),(541,'201600208238','梁容','20170136','梧州学院','本科','4','2017-06-24','2016','201700202',NULL,4,33,1427),(542,'201600208240’','林远秋','20170137','梧州学院','本科','4','2017-06-25','2016','201700202',NULL,4,33,1428),(543,'201500208307','郭家欣','20170138','梧州学院','本科','4','2017-06-26','2016','201700202',NULL,4,34,1429),(544,'201500208410','廖家鹏','20170139','梧州学院','本科','4','2017-06-27','2016','201700202',NULL,4,34,1430),(545,'201600208303','陈天艺','20170140','梧州学院','本科','4','2017-06-28','2016','201700202',NULL,4,34,1431),(546,'201600208304','丁程强','20170141','梧州学院','本科','4','2017-06-29','2016','201700202',NULL,4,34,1432),(547,'201600208305','董思源','20170142','梧州学院','本科','4','2017-06-30','2016','201700202',NULL,4,34,1433),(548,'201600208308','黄庆港','20170143','梧州学院','本科','4','2017-07-01','2016','201700202',NULL,4,34,1434),(549,'201600208310','黄祖彬','20170144','梧州学院','本科','4','2017-07-02','2016','201700202',NULL,4,34,1435),(550,'201600208322','覃悦','20170145','梧州学院','本科','4','2017-07-03','2016','201700202',NULL,4,34,1436),(551,'201600208328','叶国标','20170146','梧州学院','本科','4','2017-07-04','2016','201700202',NULL,4,34,1437),(552,'201600208337','方丽萍','20170147','梧州学院','本科','4','2017-07-05','2016','201700202',NULL,4,34,1438),(553,'201600208342','刘丽蓉','20170148','梧州学院','本科','4','2017-07-06','2016','201700202',NULL,4,34,1439),(554,'201600208347','唐纤蓥','20170149','梧州学院','本科','4','2017-07-07','2016','201700202',NULL,4,34,1440),(555,'201600213222','苏三明','20170150','梧州学院','本科','4','2017-07-08','2016','201700202',NULL,4,37,1441),(556,'201600213226','韦冠宇','20170151','梧州学院','本科','4','2017-07-09','2016','201700202',NULL,4,37,1442),(557,'201600213228','吴尚彬','20170152','梧州学院','本科','4','2017-07-10','2016','201700202',NULL,4,37,1443),(558,'201600213229','严荣','20170153','梧州学院','本科','4','2017-07-11','2016','201700202',NULL,4,37,1444),(559,'201500208113','梁鹏飞','20170154','梧州学院','本科','4','2017-07-12','2015','201700202',NULL,4,NULL,1445),(560,'201500208127','王玉华','20170155','梧州学院','本科','4','2017-07-13','2015','201700202',NULL,4,NULL,1446),(561,'201500208428','王嘉雯','20170156','梧州学院','本科','4','2017-07-14','2015','201700202',NULL,4,NULL,1447),(562,'201600208129','羊腾强','20170157','梧州学院','本科','4','2017-07-15','2016','201700202',NULL,4,32,1448),(563,'201400213017','莫冠华','20170158','梧州学院','本科','4','2017-07-16','2014','201700202',NULL,4,25,1449),(564,'201400213014','霍胜权','20170159','梧州学院','本科','4','2017-07-17','2014','201700202',NULL,4,25,1450),(565,'201400208223','谢云','20170160','梧州学院','本科','4','2017-07-18','2014','201700202',NULL,4,23,1451),(566,'201600208104','何盛万','20170001','梧州学院','本科','4','2016-09-07','2016','201700202',NULL,4,32,1566),(567,'201600213141','李苑瑜','20170001','梧州学院','本科','4','2016-09-08','2016','201700202',NULL,4,36,1567),(568,'201600213142','陆南梅','20170001','梧州学院','本科','4','2016-09-09','2016','201700202',NULL,4,36,1568),(569,'201400213018','廖克裕','20170001','梧州学院','本科','4','2016-09-10','2016','201700202',NULL,4,36,1569),(570,'201600213104','甘德品','20170001','梧州学院','本科','4','2016-09-11','2016','201700202',NULL,4,36,1570),(571,'201600213108','黄依顺','20170001','梧州学院','本科','4','2016-09-12','2016','201700202',NULL,4,36,1571),(572,'201600213113','李春霖','20170001','梧州学院','本科','4','2016-09-13','2016','201700202',NULL,4,36,1572),(573,'201600213115','李宗森','20170001','梧州学院','本科','4','2016-09-14','2016','201700202',NULL,4,36,1573),(574,'201600213117','梁稳','20170001','梧州学院','本科','4','2016-09-15','2016','201700202',NULL,4,36,1574),(575,'201600213120','龙永亮','20170001','梧州学院','本科','4','2016-09-16','2016','201700202',NULL,4,36,1575),(576,'201600213122','卢山盟','20170001','梧州学院','本科','4','2016-09-17','2016','201700202',NULL,4,36,1576),(577,'201600213126','王文滔','20170001','梧州学院','本科','4','2016-09-18','2016','201700202',NULL,4,36,1577),(578,'201600213132','周林福','20170001','梧州学院','本科','4','2016-09-19','2016','201700202',NULL,4,36,1578),(579,'201600213138','黄叶英','20170001','梧州学院','本科','4','2016-09-20','2016','201700202',NULL,4,36,1579),(580,'201600213139','黄玉花','20170001','梧州学院','本科','4','2016-09-21','2016','201700202',NULL,4,36,1580),(581,'201600213145','潘丽梅','20170001','梧州学院','本科','4','2016-09-22','2016','201700202',NULL,4,36,1581),(582,'201600213148','唐艳妮','20170001','梧州学院','本科','4','2016-09-23','2016','201700202',NULL,4,36,1582),(583,'201600213153','杨冬雪','20170001','梧州学院','本科','4','2016-09-24','2016','201700202',NULL,4,36,1583),(584,'201600213155','游春兰 ','20170001','梧州学院','本科','4','2016-09-25','2016','201700202',NULL,4,36,1584),(585,'201600213215','马欣廷','20170001','梧州学院','本科','4','2016-09-26','2016','201700202',NULL,4,37,1585),(586,'201600213218','潘辉','20170001','梧州学院','本科','4','2016-09-27','2016','201700202',NULL,4,37,1586),(587,'201600213220','宋楚皓','20170001','梧州学院','本科','4','2016-09-28','2016','201700202',NULL,4,37,1587),(588,'201500208207','黄郁盛','20170001','梧州学院','本科','4','2016-09-29','2015','201700202',NULL,4,NULL,1588),(589,'201500208218','梁家琪','20170001','梧州学院','本科','4','2016-09-30','2015','201700202',NULL,4,NULL,1589),(590,'201500208230','沈嘉伟','20170001','梧州学院','本科','4','2016-10-01','2015','201700202',NULL,4,NULL,1590),(591,'201500208231','覃镜毓','20170001','梧州学院','本科','4','2016-10-02','2015','201700202',NULL,4,NULL,1591),(592,'201500208235','王志','20170001','梧州学院','本科','4','2016-10-03','2015','201700202',NULL,4,NULL,1592),(593,'20160020820\'1','陈胜','20170001','梧州学院','本科','4','2016-10-04','2016','201700202',NULL,4,33,1593),(594,'201600208230','杨长官','20170001','梧州学院','本科','4','2016-10-05','2016','201700202',NULL,4,33,1594),(595,'201600208233‘','陈冬霞','20170001','梧州学院','本科','4','2016-10-06','2016','201700202',NULL,4,33,1595),(596,'201600208234’','程秀英','20170001','梧州学院','本科','4','2016-10-07','2016','201700202',NULL,4,33,1596),(597,'201600208236','李美琦','20170001','梧州学院','本科','4','2016-10-08','2016','201700202',NULL,4,33,1597),(598,'201600208237‘','李逸','20170001','梧州学院','本科','4','2016-10-09','2016','201700202',NULL,4,33,1598),(599,'201600208241‘','罗贺','20170001','梧州学院','本科','4','2016-10-10','2016','201700202',NULL,4,33,1599),(600,'201600208244’','孙少喜','20170001','梧州学院','本科','4','2016-10-11','2016','201700202',NULL,4,33,1600),(601,'201600208408','李海华','20170001','梧州学院','本科','4','2016-10-12','2016','201700202',NULL,4,35,1601),(602,'201600208409','李善念','20170001','梧州学院','本科','4','2016-10-13','2016','201700202',NULL,4,35,1602),(603,'201600208410','李天赐','20170001','梧州学院','本科','4','2016-10-14','2016','201700202',NULL,4,35,1603),(604,'201600208420','覃威茗','20170001','梧州学院','本科','4','2016-10-15','2016','201700202',NULL,4,35,1604),(605,'201600208427','吴思敏','20170001','梧州学院','本科','4','2016-10-16','2016','201700202',NULL,4,35,1605),(606,'201600208428','杨健铭','20170001','梧州学院','本科','4','2016-10-17','2016','201700202',NULL,4,35,1606),(607,'201600208430','郑宣贵','20170001','梧州学院','本科','4','2016-10-18','2016','201700202',NULL,4,35,1607),(608,'201600208431','周杰威','20170001','梧州学院','本科','4','2016-10-19','2016','201700202',NULL,4,35,1608),(609,'201600208435','池小媛','20170001','梧州学院','本科','4','2016-10-20','2016','201700202',NULL,4,35,1609),(610,'201600208439','梁海玲','20170001','梧州学院','本科','4','2016-10-21','2016','201700202',NULL,4,35,1610),(611,'201600213202','陈德培','20170001','梧州学院','本科','4','2016-10-22','2016','201700202',NULL,4,37,1611),(612,'201600213203','陈永任','20170001','梧州学院','本科','4','2016-10-23','2016','201700202',NULL,4,37,1612),(613,'201600213210','黄贻通','20170001','梧州学院','本科','4','2016-10-24','2016','201700202',NULL,4,37,1613),(614,'201600213223','苏祖豪','20170001','梧州学院','本科','4','2016-10-25','2016','201700202',NULL,4,37,1614),(615,'201500208107','黄慧君','20170001','梧州学院','本科','4','2016-10-26','2015','201700202',NULL,4,NULL,1615),(616,'201500208317','李睿','20170001','梧州学院','本科','4','2016-10-27','2015','201700202',NULL,4,NULL,1616),(617,'201500208318','梁皓','20170001','梧州学院','本科','4','2016-10-28','2015','201700202',NULL,4,NULL,1617),(618,'201500208323','陆权宁','20170001','梧州学院','本科','4','2016-10-29','2015','201700202',NULL,4,NULL,1618),(619,'201600208101','陈巨洁','20170001','梧州学院','本科','4','2016-10-30','2016','201700202',NULL,4,32,1619),(620,'201600208106','蒋邦雄','20170001','梧州学院','本科','4','2016-10-31','2016','201700202',NULL,4,32,1620),(621,'201600208108','李炳志','20170001','梧州学院','本科','4','2016-11-01','2016','201700202',NULL,4,32,1621),(622,'201600208109','李宏伟','20170001','梧州学院','本科','4','2016-11-02','2016','201700202',NULL,4,32,1622),(623,'201600208112','李杨','20170001','梧州学院','本科','4','2016-11-03','2016','201700202',NULL,4,32,1623),(624,'201600208113','李造','20170001','梧州学院','本科','4','2016-11-04','2016','201700202',NULL,4,32,1624),(625,'201600208114','林家健','20170001','梧州学院','本科','4','2016-11-05','2016','201700202',NULL,4,32,1625),(626,'201600208115','凌钦华','20170001','梧州学院','本科','4','2016-11-06','2016','201700202',NULL,4,32,1626),(627,'201600208130','杨夕锋','20170001','梧州学院','本科','4','2016-11-07','2016','201700202',NULL,4,32,1627),(628,'201600208132','曾波','20170001','梧州学院','本科','4','2016-11-08','2016','201700202',NULL,4,32,1628),(629,'201600208203','董有宏','20170001','梧州学院','本科','4','2016-11-09','2016','201700202',NULL,4,33,1629),(630,'201600208207','蓝福','20170001','梧州学院','本科','4','2016-11-10','2016','201700202',NULL,4,33,1630),(631,'201600208209','李家荣','20170001','梧州学院','本科','4','2016-11-11','2016','201700202',NULL,4,33,1631),(632,'201600208214','刘维逸','20170001','梧州学院','本科','4','2016-11-12','2016','201700202',NULL,4,33,1632),(633,'201600208215','卢永贵','20170001','梧州学院','本科','4','2016-11-13','2016','201700202',NULL,4,33,1633),(634,'201600208216‘','罗浩铨','20170001','梧州学院','本科','4','2016-11-14','2016','201700202',NULL,4,33,1634),(635,'201600208219','慕荣辉','20170001','梧州学院','本科','4','2016-11-15','2016','201700202',NULL,4,33,1635),(636,'201600213154','杨银燕','20170001','梧州学院','本科','4','2016-11-16','2016','201700202',NULL,4,36,1636),(637,'201600213207','黄鸿羲','20170001','梧州学院','本科','4','2016-11-17','2016','201700202',NULL,4,37,1637),(638,'201600213213','李汶霖','20170001','梧州学院','本科','4','2016-11-18','2016','201700202',NULL,4,37,1638),(639,'201600213216','莫运平','20170001','梧州学院','本科','4','2016-11-19','2016','201700202',NULL,4,37,1639),(640,'201600213219','潘琦','20170001','梧州学院','本科','4','2016-11-20','2016','201700202',NULL,4,37,1640),(641,'201600213232','钟将','20170001','梧州学院','本科','4','2016-11-21','2016','201700202',NULL,4,37,1641),(642,'201400213045','张超','20170001','梧州学院','本科','4','2016-11-22','2014','201700202',NULL,4,25,1642),(643,'201500208305','董振华','20170001','梧州学院','本科','4','2016-11-23','2015','201700202',NULL,4,NULL,1643),(644,'201500208415','陆宏安','20170001','梧州学院','本科','4','2016-11-24','2015','201700202',NULL,4,NULL,1644),(645,'201600208147','杨吉','20170001','梧州学院','本科','4','2016-11-25','2016','201700202',NULL,4,32,1645),(646,'201600208229‘','颜阳','20170001','梧州学院','本科','4','2016-11-26','2016','201700202',NULL,4,33,1646),(647,'201600208242‘','潘杏','20170001','梧州学院','本科','4','2016-11-27','2016','201700202',NULL,4,33,1647),(648,'201600208302','陈春杨','20170001','梧州学院','本科','4','2016-11-28','2016','201700202',NULL,4,34,1648),(649,'201600208313','梁艺耀','20170001','梧州学院','本科','4','2016-11-29','2016','201700202',NULL,4,34,1649),(650,'201600208314','廖富光','20170001','梧州学院','本科','4','2016-11-30','2016','201700202',NULL,4,34,1650),(651,'201600208329','叶子胜','20170001','梧州学院','本科','4','2016-12-01','2016','201700202',NULL,4,34,1651),(652,'201600208332','周家财','20170001','梧州学院','本科','4','2016-12-02','2016','201700202',NULL,4,34,1652),(653,'201600208336','陈紫丽','20170001','梧州学院','本科','4','2016-12-03','2016','201700202',NULL,4,34,1653),(654,'201600208339','李静','20170001','梧州学院','本科','4','2016-12-04','2016','201700202',NULL,4,34,1654),(655,'201600208424','唐志晖','20170001','梧州学院','本科','4','2016-12-05','2016','201700202',NULL,4,35,1655),(656,'201600208429','杨顺海','20170001','梧州学院','本科','4','2016-12-06','2016','201700202',NULL,4,35,1656),(657,'201600208442','刘玉霜','20170001','梧州学院','本科','4','2016-12-07','2016','201700202',NULL,4,35,1657),(658,'201600208451','张中怡','20170001','梧州学院','本科','4','2016-12-08','2016','201700202',NULL,4,35,1658),(659,'201600213236','陈艳艳','20170001','梧州学院','本科','4','2016-12-09','2016','201700202',NULL,4,37,1659),(660,'201600213237','黄靖舒','20170001','梧州学院','本科','4','2016-12-10','2016','201700202',NULL,4,37,1660),(661,'201600213238','黄柳条','20170001','梧州学院','本科','4','2016-12-11','2016','201700202',NULL,4,37,1661),(662,'201600213240','江锦琦','20170001','梧州学院','本科','4','2016-12-12','2016','201700202',NULL,4,37,1662),(663,'201600213241','蓝金董','20170001','梧州学院','本科','4','2016-12-13','2016','201700202',NULL,4,37,1663),(664,'201600213245','吕江','20170001','梧州学院','本科','4','2016-12-14','2016','201700202',NULL,4,37,1664),(665,'201600213246','蒙丹','20170001','梧州学院','本科','4','2016-12-15','2016','201700202',NULL,4,37,1665),(666,'201600213249','覃香群','20170001','梧州学院','本科','4','2016-12-16','2016','201700202',NULL,4,37,1666),(667,'201500213101','蔡昌志','20170001','梧州学院','本科','4','2016-12-17','2015','201700202',NULL,4,NULL,1667),(668,'201500213103','董世怡','20170001','梧州学院','本科','4','2016-12-18','2015','201700202',NULL,4,NULL,1668),(669,'201500213216','陶锐','20170001','梧州学院','本科','4','2016-12-19','2015','201700202',NULL,4,NULL,1669),(670,'201500213220','韦汀晏','20170001','梧州学院','本科','4','2016-12-20','2015','201700202',NULL,4,NULL,1670),(671,'201500213224','钟宾','20170001','梧州学院','本科','4','2016-12-21','2015','201700202',NULL,4,NULL,1671),(672,'201600208148','张翠玲','20170001','梧州学院','本科','4','2016-12-22','2016','201700202',NULL,4,32,1672),(673,'201600208401','曹宸玮','20170001','梧州学院','本科','4','2016-12-23','2016','201700202',NULL,4,35,1673),(674,'201600208406','韩鹏程','20170001','梧州学院','本科','4','2016-12-24','2016','201700202',NULL,4,35,1674),(675,'201600208415','刘柏池','20170001','梧州学院','本科','4','2016-12-25','2016','201700202',NULL,4,35,1675),(676,'201600208419','阮民涛','20170001','梧州学院','本科','4','2016-12-26','2016','201700202',NULL,4,35,1676),(677,'201600208422','唐昊','20170001','梧州学院','本科','4','2016-12-27','2016','201700202',NULL,4,35,1677),(678,'201600208423','唐奕明','20170001','梧州学院','本科','4','2016-12-28','2016','201700202',NULL,4,35,1678),(679,'201600208425','韦永共','20170001','梧州学院','本科','4','2016-12-29','2016','201700202',NULL,4,35,1679),(680,'201600208436','丁婉朔','20170001','梧州学院','本科','4','2016-12-30','2016','201700202',NULL,4,35,1680),(681,'201600208441','刘家倩','20170001','梧州学院','本科','4','2016-12-31','2016','201700202',NULL,4,35,1681),(682,'201600213101','陈炳成','20170001','梧州学院','本科','4','2017-01-01','2016','201700202',NULL,4,36,1682),(683,'201600213105','甘范名','20170001','梧州学院','本科','4','2017-01-02','2016','201700202',NULL,4,36,1683),(684,'201600213111','雷观昌','20170001','梧州学院','本科','4','2017-01-03','2016','201700202',NULL,4,36,1684),(685,'201600213112','黎峻豪','20170001','梧州学院','本科','4','2017-01-04','2016','201700202',NULL,4,36,1685),(686,'201600213118','刘冠宏','20170001','梧州学院','本科','4','2017-01-05','2016','201700202',NULL,4,36,1686),(687,'201600213124','石宏磊','20170001','梧州学院','本科','4','2017-01-06','2016','201700202',NULL,4,36,1687),(688,'201600213125','谭建狄','20170001','梧州学院','本科','4','2017-01-07','2016','201700202',NULL,4,36,1688),(689,'201600213127','韦歌迪','20170001','梧州学院','本科','4','2017-01-08','2016','201700202',NULL,4,36,1689),(690,'201600213133','朱华庭','20170001','梧州学院','本科','4','2017-01-09','2016','201700202',NULL,4,36,1690),(691,'201600213134','朱首彰','20170001','梧州学院','本科','4','2017-01-10','2016','201700202',NULL,4,36,1691),(692,'201600213239','黄小梅','20170001','梧州学院','本科','4','2017-01-11','2016','201700202',NULL,4,37,1692),(693,'201600213243','梁小英','20170001','梧州学院','本科','4','2017-01-12','2016','201700202',NULL,4,37,1693),(694,'201600213248','覃萍','20170001','梧州学院','本科','4','2017-01-13','2016','201700202',NULL,4,37,1694),(695,'201500208123','彭标','20170001','梧州学院','本科','4','2017-01-14','2015','201700202',NULL,4,NULL,1695),(696,'201500208128','韦增武','20170001','梧州学院','本科','4','2017-01-15','2015','201700202',NULL,4,NULL,1696),(697,'201500208129','闻丽媛','20170001','梧州学院','本科','4','2017-01-16','2015','201700202',NULL,4,NULL,1697),(698,'201500208204','傅宇华','20170001','梧州学院','本科','4','2017-01-17','2015','201700202',NULL,4,NULL,1698),(699,'201600208105','黄智中','20170001','梧州学院','本科','4','2017-01-18','2016','201700202',NULL,4,32,1699),(700,'201600208118','潘宸','20170001','梧州学院','本科','4','2017-01-19','2016','201700202',NULL,4,32,1700),(701,'201600208120','沈喜龙','20170001','梧州学院','本科','4','2017-01-20','2016','201700202',NULL,4,32,1701),(702,'201600208121','司开元','20170001','梧州学院','本科','4','2017-01-21','2016','201700202',NULL,4,32,1702),(703,'201600208124','王梓能','20170001','梧州学院','本科','4','2017-01-22','2016','201700202',NULL,4,32,1703),(704,'201600208128','谢常繁','20170001','梧州学院','本科','4','2017-01-23','2016','201700202',NULL,4,32,1704),(705,'201600208135','黄滢','20170001','梧州学院','本科','4','2017-01-24','2016','201700202',NULL,4,32,1705),(706,'201600208136','蒋玉蓉','20170001','梧州学院','本科','4','2017-01-25','2016','201700202',NULL,4,32,1706),(707,'201600208145','温晓怡','20170001','梧州学院','本科','4','2017-01-26','2016','201700202',NULL,4,32,1707),(708,'201600208208‘','李锋','20170001','梧州学院','本科','4','2017-01-27','2016','201700202',NULL,4,33,1708),(709,'201600208246’','王惠','20170001','梧州学院','本科','4','2017-01-28','2016','201700202',NULL,4,33,1709),(710,'201600208249','张露丹','20170001','梧州学院','本科','4','2017-01-29','2016','201700202',NULL,4,33,1710),(711,'201600208251','曾小婷','20170001','梧州学院','本科','4','2017-01-30','2016','201700202',NULL,4,33,1711),(712,'201600208307','黄启东','20170001','梧州学院','本科','4','2017-01-31','2016','201700202',NULL,4,34,1712),(713,'201600208321','阮春彪','20170001','梧州学院','本科','4','2017-02-01','2016','201700202',NULL,4,34,1713),(714,'201600208345','盘美英','20170001','梧州学院','本科','4','2017-02-02','2016','201700202',NULL,4,34,1714),(715,'201600208404','范书豪','20170001','梧州学院','本科','4','2017-02-03','2016','201700202',NULL,4,35,1715),(716,'201600208413','廖树杰','20170001','梧州学院','本科','4','2017-02-04','2016','201700202',NULL,4,35,1716),(717,'201600208414','凌朝政','20170001','梧州学院','本科','4','2017-02-05','2016','201700202',NULL,4,35,1717),(718,'201600208418','潘登','20170001','梧州学院','本科','4','2017-02-06','2016','201700202',NULL,4,35,1718),(719,'201600208440','梁静华','20170001','梧州学院','本科','4','2017-02-07','2016','201700202',NULL,4,35,1719),(720,'201600213128','吴映辉','20170001','梧州学院','本科','4','2017-02-08','2016','201700202',NULL,4,36,1720),(721,'201600213227','吴光辉','20170001','梧州学院','本科','4','2017-02-09','2016','201700202',NULL,4,37,1721),(722,'201500208324','罗定友','20170001','梧州学院','本科','4','2017-02-10','2015','201700202',NULL,4,NULL,1722),(723,'201500208325','蒙伟森','20170001','梧州学院','本科','4','2017-02-11','2015','201700202',NULL,4,NULL,1723),(724,'201500208333','叶展鹏','20170001','梧州学院','本科','4','2017-02-12','2015','201700202',NULL,4,NULL,1724),(725,'201600208146','吴丹茗','20170001','梧州学院','本科','4','2017-02-13','2016','201700202',NULL,4,32,1725),(726,'201600208213','刘上剑','20170001','梧州学院','本科','4','2017-02-14','2016','201700202',NULL,4,33,1726),(727,'201600208243','庞桂花','20170002','梧州学院','本科','4','2017-02-15','2016','201700202',NULL,4,33,1727),(728,'201600208250‘','朱美林','20170003','梧州学院','本科','4','2017-02-16','2016','201700202',NULL,4,33,1728),(729,'201600208301','曹鹏轩','20170004','梧州学院','本科','4','2017-02-17','2016','201700202',NULL,4,34,1729),(730,'201600208309','黄世创','20170005','梧州学院','本科','4','2017-02-18','2016','201700202',NULL,4,34,1730),(731,'201600208318','潘沛杰','20170006','梧州学院','本科','4','2017-02-19','2016','201700202',NULL,4,34,1731),(732,'201600208330','张恒','20170007','梧州学院','本科','4','2017-02-20','2016','201700202',NULL,4,34,1732),(733,'201600208331','张积健','20170008','梧州学院','本科','4','2017-02-21','2016','201700202',NULL,4,34,1733),(734,'201600208335','陈怡','20170009','梧州学院','本科','4','2017-02-22','2016','201700202',NULL,4,34,1734),(735,'201600208340','刘海帆','20170010','梧州学院','本科','4','2017-02-23','2016','201700202',NULL,4,34,1735),(736,'201600208341','刘嘉嘉','20170011','梧州学院','本科','4','2017-02-24','2016','201700202',NULL,4,34,1736),(737,'201600208344','罗颖玉','20170012','梧州学院','本科','4','2017-02-25','2016','201700202',NULL,4,34,1737),(738,'201600208350','张晓君','20170013','梧州学院','本科','4','2017-02-26','2016','201700202',NULL,4,34,1738),(739,'201600208402','陈震洺','20170014','梧州学院','本科','4','2017-02-27','2016','201700202',NULL,4,35,1739),(740,'201600208403','邓彦松','20170015','梧州学院','本科','4','2017-02-28','2016','201700202',NULL,4,35,1740),(741,'201600208412','梁海超','20170016','梧州学院','本科','4','2017-03-01','2016','201700202',NULL,4,35,1741),(742,'201600208426','魏祥','20170017','梧州学院','本科','4','2017-03-02','2016','201700202',NULL,4,35,1742),(743,'201600208433','陈秋梅','20170018','梧州学院','本科','4','2017-03-03','2016','201700202',NULL,4,35,1743),(744,'201600208438','李春梅','20170019','梧州学院','本科','4','2017-03-04','2016','201700202',NULL,4,35,1744),(745,'201600208445','盛晓洁','20170020','梧州学院','本科','4','2017-03-05','2016','201700202',NULL,4,35,1745),(746,'201600213250','韦露沐','20170021','梧州学院','本科','4','2017-03-06','2016','201700202',NULL,4,37,1746),(747,'201500208116','陆兆民','20170022','梧州学院','本科','4','2017-03-07','2015','201700202',NULL,4,NULL,1747),(748,'201500208421','秦文兵','20170023','梧州学院','本科','4','2017-03-08','2015','201700202',NULL,4,NULL,1748),(749,'201600208102','陈龙','20170026','梧州学院','本科','4','2017-03-09','2016','201700202',NULL,4,32,1749),(750,'201600208122','覃一鋆','20170027','梧州学院','本科','4','2017-03-10','2016','201700202',NULL,4,32,1750),(751,'201600208133','和雪英','20170028','梧州学院','本科','4','2017-03-11','2016','201700202',NULL,4,32,1751),(752,'201600208134','黄佩珍','20170029','梧州学院','本科','4','2017-03-12','2016','201700202',NULL,4,32,1752),(753,'201600208139','莫小丽','20170030','梧州学院','本科','4','2017-03-13','2016','201700202',NULL,4,32,1753),(754,'201600208140','欧榕坤','20170031','梧州学院','本科','4','2017-03-14','2016','201700202',NULL,4,32,1754),(755,'201600208141','冉带素','20170032','梧州学院','本科','4','2017-03-15','2016','201700202',NULL,4,32,1755),(756,'201600208202','邓扬殷','20170033','梧州学院','本科','4','2017-03-16','2016','201700202',NULL,4,33,1756),(757,'201600208206','华孝鹏','20170034','梧州学院','本科','4','2017-03-17','2016','201700202',NULL,4,33,1757),(758,'201600208210','廖桂生','20170035','梧州学院','本科','4','2017-03-18','2016','201700202',NULL,4,33,1758),(759,'201600208224‘','宋玉富','20170036','梧州学院','本科','4','2017-03-19','2016','201700202',NULL,4,33,1759),(760,'201600208226','唐民','20170037','梧州学院','本科','4','2017-03-20','2016','201700202',NULL,4,33,1760),(761,'201600208232’','周易源','20170038','梧州学院','本科','4','2017-03-21','2016','201700202',NULL,4,33,1761),(762,'201500208136','赵迪','20170039','梧州学院','本科','4','2017-03-22','2016','201700202',NULL,4,34,1762),(763,'201600208311','李昂','20170040','梧州学院','本科','4','2017-03-23','2016','201700202',NULL,4,34,1763),(764,'201600208320','薛培星','20170041','梧州学院','本科','4','2017-03-24','2016','201700202',NULL,4,34,1764),(765,'201600208323','王晗','20170042','梧州学院','本科','4','2017-03-25','2016','201700202',NULL,4,34,1765),(766,'201600208326','谢振威','20170043','梧州学院','本科','4','2017-03-26','2016','201700202',NULL,4,34,1766),(767,'201600213119','刘淋逸','20170044','梧州学院','本科','4','2017-03-27','2016','201700202',NULL,4,36,1767),(768,'201600213144','蒙俐宏','20170045','梧州学院','本科','4','2017-03-28','2016','201700202',NULL,4,36,1768),(769,'201600213208','黄家理','20170046','梧州学院','本科','4','2017-03-29','2016','201700202',NULL,4,37,1769),(770,'201600213211','雷文浩','20170047','梧州学院','本科','4','2017-03-30','2016','201700202',NULL,4,37,1770),(771,'201600213212','李家聪','20170048','梧州学院','本科','4','2017-03-31','2016','201700202',NULL,4,37,1771),(772,'201601902132','黄妹','20170051','梧州学院','本科','4','2017-04-01','2016','201700202',NULL,4,32,1772),(773,'201600208217','骆世嘉','20170052','梧州学院','本科','4','2017-04-02','2016','201700202',NULL,4,33,1773),(774,'201600208218','蒙勇飞','20170053','梧州学院','本科','4','2017-04-03','2016','201700202',NULL,4,33,1774),(775,'201600208221','庞彪','20170054','梧州学院','本科','4','2017-04-04','2016','201700202',NULL,4,33,1775),(776,'201600208223','司晓硕','20170055','梧州学院','本科','4','2017-04-05','2016','201700202',NULL,4,33,1776),(777,'201600208227','王洪升','20170056','梧州学院','本科','4','2017-04-06','2016','201700202',NULL,4,33,1777),(778,'201600208247‘','吴丽丽','20170057','梧州学院','本科','4','2017-04-07','2016','201700202',NULL,4,33,1778),(779,'201600208312','李国严','20170058','梧州学院','本科','4','2017-04-08','2016','201700202',NULL,4,34,1779),(780,'201600208316','陆建宁','20170059','梧州学院','本科','4','2017-04-09','2016','201700202',NULL,4,34,1780),(781,'201600213114','李汉彬','20170061','梧州学院','本科','4','2017-04-11','2016','201700202',NULL,4,36,1781),(782,'201600213116','梁林','20170062','梧州学院','本科','4','2017-04-12','2016','201700202',NULL,4,36,1782),(783,'201600213135','陈孔妙','20170063','梧州学院','本科','4','2017-04-13','2016','201700202',NULL,4,36,1783),(784,'201600213205','黄安','20170064','梧州学院','本科','4','2017-04-14','2016','201700202',NULL,4,37,1784),(785,'201600213206','黄鸿庭','20170065','梧州学院','本科','4','2017-04-15','2016','201700202',NULL,4,37,1785),(786,'201600213209','黄培彬','20170066','梧州学院','本科','4','2017-04-16','2016','201700202',NULL,4,37,1786),(787,'201600213214','罗明贵','20170067','梧州学院','本科','4','2017-04-17','2016','201700202',NULL,4,37,1787),(788,'201600213217','农建泽','20170068','梧州学院','本科','4','2017-04-18','2016','201700202',NULL,4,37,1788),(789,'201600213221','苏家卫','20170069','梧州学院','本科','4','2017-04-19','2016','201700202',NULL,4,37,1789),(790,'201600213224','孙广进','20170070','梧州学院','本科','4','2017-04-20','2016','201700202',NULL,4,37,1790),(791,'201600213225','谭霁航','20170071','梧州学院','本科','4','2017-04-21','2016','201700202',NULL,4,37,1791),(792,'201600213233','周孔波','20170072','梧州学院','本科','4','2017-04-22','2016','201700202',NULL,4,37,1792),(793,'201500208337','周华生','20170073','梧州学院','本科','4','2017-04-23','2015','201700202',NULL,4,NULL,1793),(794,'201500208417','陆月富','20170074','梧州学院','本科','4','2017-04-24','2015','201700202',NULL,4,NULL,1794),(795,'201500208426','孙亮','20170075','梧州学院','本科','4','2017-04-25','2015','201700202',NULL,4,NULL,1795),(796,'201500208431','吴煜辉','20170076','梧州学院','本科','4','2017-04-26','2015','201700202',NULL,4,NULL,1796),(797,'201600208103','邓彬胜','20170077','梧州学院','本科','4','2017-04-27','2016','201700202',NULL,4,32,1797),(798,'201600208119','容宇轩','20170078','梧州学院','本科','4','2017-04-28','2016','201700202',NULL,4,32,1798),(799,'201600208123','汪志明','20170079','梧州学院','本科','4','2017-04-29','2016','201700202',NULL,4,32,1799),(800,'201600208126','温德尊','20170080','梧州学院','本科','4','2017-04-30','2016','201700202',NULL,4,32,1800),(801,'201600208405','高航涛','20170081','梧州学院','本科','4','2017-05-01','2016','201700202',NULL,4,35,1801),(802,'201600208416','陆正荣','20170082','梧州学院','本科','4','2017-05-02','2016','201700202',NULL,4,35,1802),(803,'201600208437','黎艳芳','20170083','梧州学院','本科','4','2017-05-03','2016','201700202',NULL,4,35,1803),(804,'201600208447','覃丽菊','20170084','梧州学院','本科','4','2017-05-04','2016','201700202',NULL,4,35,1804),(805,'201600213103','邓祥鸿','20170085','梧州学院','本科','4','2017-05-05','2016','201700202',NULL,4,36,1805),(806,'201600213107','郭天千','20170086','梧州学院','本科','4','2017-05-06','2016','201700202',NULL,4,36,1806),(807,'201600213109','黄源松','20170087','梧州学院','本科','4','2017-05-07','2016','201700202',NULL,4,36,1807),(808,'201600213123','秦曼人','20170088','梧州学院','本科','4','2017-05-08','2016','201700202',NULL,4,36,1808),(809,'201600213130','谢惟朋','20170089','梧州学院','本科','4','2017-05-09','2016','201700202',NULL,4,36,1809),(810,'201600213136','甘丽','20170090','梧州学院','本科','4','2017-05-10','2016','201700202',NULL,4,36,1810),(811,'201600213137','何柳花','20170091','梧州学院','本科','4','2017-05-11','2016','201700202',NULL,4,36,1811),(812,'201600213150','韦燕琳','20170092','梧州学院','本科','4','2017-05-12','2016','201700202',NULL,4,36,1812),(813,'201600213230','叶炜','20170093','梧州学院','本科','4','2017-05-13','2016','201700202',NULL,4,37,1813),(814,'201600213235','陈贵连','20170094','梧州学院','本科','4','2017-05-14','2016','201700202',NULL,4,37,1814),(815,'201600213244','廖小兰','20170095','梧州学院','本科','4','2017-05-15','2016','201700202',NULL,4,37,1815),(816,'201600213247','莫佩凤','20170096','梧州学院','本科','4','2017-05-16','2016','201700202',NULL,4,37,1816),(817,'201600213254','赵春艳','20170097','梧州学院','本科','4','2017-05-17','2016','201700202',NULL,4,37,1817),(818,'201600213255','钟佳萍','20170098','梧州学院','本科','4','2017-05-18','2016','201700202',NULL,4,37,1818),(819,'201500208103','陈石新','20170099','梧州学院','本科','4','2017-05-19','2015','201700202',NULL,4,NULL,1819),(820,'201500208311','黄荣春','20170100','梧州学院','本科','4','2017-05-20','2015','201700202',NULL,4,NULL,1820),(821,'201500208312','黄英强','20170101','梧州学院','本科','4','2017-05-21','2015','201700202',NULL,4,NULL,1821),(822,'201500208316','李权治','20170102','梧州学院','本科','4','2017-05-22','2015','201700202',NULL,4,NULL,1822),(823,'201600208131','周雯才','20170104','梧州学院','本科','4','2017-05-23','2016','201700202',NULL,4,32,1823),(824,'201600208138','李碧静','20170105','梧州学院','本科','4','2017-05-24','2016','201700202',NULL,4,32,1824),(825,'201600208142','谭月莲','20170106','梧州学院','本科','4','2017-05-25','2016','201700202',NULL,4,32,1825),(826,'201600208143','王娜','20170107','梧州学院','本科','4','2017-05-26','2016','201700202',NULL,4,32,1826),(827,'201600208149','张楠','20170108','梧州学院','本科','4','2017-05-27','2016','201700202',NULL,4,32,1827),(828,'201600208150','张旺珍','20170109','梧州学院','本科','4','2017-05-28','2016','201700202',NULL,4,32,1828),(829,'201600208151','周丽鲜','20170110','梧州学院','本科','4','2017-05-29','2016','201700202',NULL,4,32,1829),(830,'201600208212','刘清旭','20170111','梧州学院','本科','4','2017-05-30','2016','201700202',NULL,4,33,1830),(831,'201600208225','孙艺','20170112','梧州学院','本科','4','2017-05-31','2016','201700202',NULL,4,33,1831),(832,'201600208231‘','叶城廷','20170113','梧州学院','本科','4','2017-06-01','2016','201700202',NULL,4,33,1832),(833,'201600208239’','廖梦青','20170114','梧州学院','本科','4','2017-06-02','2016','201700202',NULL,4,33,1833),(834,'201600208315','刘春福','20170115','梧州学院','本科','4','2017-06-03','2016','201700202',NULL,4,34,1834),(835,'201600208334','陈宣媛','20170116','梧州学院','本科','4','2017-06-04','2016','201700202',NULL,4,34,1835),(836,'201600208338','孔丽玲','20170117','梧州学院','本科','4','2017-06-05','2016','201700202',NULL,4,34,1836),(837,'201600208343','刘禹含','20170118','梧州学院','本科','4','2017-06-06','2016','201700202',NULL,4,34,1837),(838,'201600208346','覃荔靖','20170119','梧州学院','本科','4','2017-06-07','2016','201700202',NULL,4,34,1838),(839,'201600208348','王菁颖','20170120','梧州学院','本科','4','2017-06-08','2016','201700202',NULL,4,34,1839),(840,'201600208417','莫东林','20170121','梧州学院','本科','4','2017-06-09','2016','201700202',NULL,4,35,1840),(841,'201600208444','商文鑫','20170122','梧州学院','本科','4','2017-06-10','2016','201700202',NULL,4,35,1841),(842,'201600208446','谈茵茵','201701232','梧州学院2','本科2','4','2017-06-11','2016','201700202',8,4,35,1842),(843,'201600213140','李桂兰','20170124','梧州学院','本科','4','2017-06-12','2016','201700202',NULL,4,36,1843),(844,'201600213151','魏钰','20170125','梧州学院','本科','4','2017-06-13','2016','201700202',NULL,4,36,1844),(845,'201600213152','肖雨君','20170126','梧州学院','本科','4','2017-06-14','2016','201700202',NULL,4,36,1845),(846,'201500213105','何鹏程','20170127','梧州学院','本科','4','2017-06-15','2015','201700202',NULL,4,NULL,1846),(847,'201500213116','唐昌钰','20170128','梧州学院','本科','4','2017-06-16','2015','201700202',NULL,4,NULL,1847),(848,'201500213117','唐立','20170129','梧州学院','本科','4','2017-06-17','2015','201700202',NULL,4,NULL,1848),(849,'201500213126','钟明城','20170130','梧州学院','本科','4','2017-06-18','2015','201700202',NULL,4,NULL,1849),(850,'201600208110','李明清','20170131','梧州学院','本科','4','2017-06-19','2016','201700202',NULL,4,32,1850),(851,'201600208116','陆鹏祥','20170132','梧州学院','本科','4','2017-06-20','2016','201700202',NULL,4,32,1851),(852,'201600208117','陆镇峰','20170133','梧州学院','本科','4','2017-06-21','2016','201700202',NULL,4,32,1852),(853,'201600208137','黎军君','20170134','梧州学院','本科','4','2017-06-22','2016','201700202',NULL,4,32,1853),(854,'201600208144','王研','20170135','梧州学院','本科','4','2017-06-23','2016','201700202',NULL,4,32,1854),(855,'201600208238','梁容','20170136','梧州学院','本科','4','2017-06-24','2016','201700202',NULL,4,33,1855),(856,'201600208240’','林远秋','20170137','梧州学院','本科','4','2017-06-25','2016','201700202',NULL,4,33,1856),(857,'201500208307','郭家欣','20170138','梧州学院','本科','4','2017-06-26','2016','201700202',NULL,4,34,1857),(858,'201500208410','廖家鹏','20170139','梧州学院','本科','4','2017-06-27','2016','201700202',NULL,4,34,1858),(859,'201600208303','陈天艺','20170140','梧州学院','本科','4','2017-06-28','2016','201700202',NULL,4,34,1859),(860,'201600208304','丁程强','20170141','梧州学院','本科','4','2017-06-29','2016','201700202',NULL,4,34,1860),(861,'201600208305','董思源','20170142','梧州学院','本科','4','2017-06-30','2016','201700202',NULL,4,34,1861),(862,'201600208308','黄庆港','20170143','梧州学院','本科','4','2017-07-01','2016','201700202',NULL,4,34,1862),(863,'201600208310','黄祖彬','20170144','梧州学院','本科','4','2017-07-02','2016','201700202',NULL,4,34,1863),(864,'201600208322','覃悦','20170145','梧州学院','本科','4','2017-07-03','2016','201700202',NULL,4,34,1864),(865,'201600208328','叶国标','20170146','梧州学院','本科','4','2017-07-04','2016','201700202',NULL,4,34,1865),(866,'201600208337','方丽萍','20170147','梧州学院','本科','4','2017-07-05','2016','201700202',NULL,4,34,1866),(867,'201600208342','刘丽蓉','20170148','梧州学院','本科','4','2017-07-06','2016','201700202',NULL,4,34,1867),(868,'201600208347','唐纤蓥','20170149','梧州学院','本科','4','2017-07-07','2016','201700202',NULL,4,34,1868),(869,'201600213222','苏三明','20170150','梧州学院','本科','4','2017-07-08','2016','201700202',NULL,4,37,1869),(870,'201600213226','韦冠宇','20170151','梧州学院','本科','4','2017-07-09','2016','201700202',NULL,4,37,1870),(871,'201600213228','吴尚彬','20170152','梧州学院','本科','4','2017-07-10','2016','201700202',NULL,4,37,1871),(872,'201600213229','严荣','20170153','梧州学院','本科','4','2017-07-11','2016','201700202',3,4,36,1872),(873,'201500208113','梁鹏飞','20170154','梧州学院','本科','4','2017-07-12','2015','201700202',NULL,4,NULL,1873),(874,'201500208127','王玉华','20170155','梧州学院','本科','4','2017-07-13','2015','201700202',NULL,4,NULL,1874),(875,'201500208428','王嘉雯','20170156','梧州学院','本科','4','2017-07-14','2015','201700202',NULL,4,NULL,1875),(876,'201600208129','羊腾强','20170157','梧州学院','本科','4','2017-07-15','2016','201700202',NULL,4,32,1876),(877,'201400213017','莫冠华','20170158','梧州学院','本科','4','2017-07-16','2014','201700202',NULL,4,25,1877),(878,'201400213014','霍胜权','20170159','梧州学院','本科','4','2017-07-17','2014','201700202',NULL,4,25,1878),(879,'201400208223','谢云','20170160','梧州学院','本科','4','2017-07-18','2014','201700202',8,4,23,1879),(880,'232323','秦dd','452228199902202554','dsaf','0','1','2019-11-05','2017','201700202',NULL,4,27,1880),(881,'2323232','asdsa','452228199902202554','','0','1','2019-11-06','2018','201700202',NULL,4,37,1881);
/*!40000 ALTER TABLE `sys_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_teacher`
--

DROP TABLE IF EXISTS `sys_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_no` varchar(50) DEFAULT NULL COMMENT '老师编号',
  `teacher_name` varchar(50) DEFAULT NULL,
  `dept_number` varchar(50) DEFAULT NULL COMMENT '学院标号',
  `category_id` int(11) DEFAULT NULL COMMENT '大类Id',
  `staffroom_id` int(11) DEFAULT NULL COMMENT '教研室ID',
  `technical_id` int(11) DEFAULT NULL COMMENT '职称ID',
  `duties_no` varchar(255) DEFAULT NULL COMMENT '职务编号:',
  `user_id` int(11) DEFAULT NULL COMMENT '用户Id',
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_teacher`
--

LOCK TABLES `sys_teacher` WRITE;
/*!40000 ALTER TABLE `sys_teacher` DISABLE KEYS */;
INSERT INTO `sys_teacher` VALUES (201,'admin','admin','201700201',NULL,NULL,213,'24',772),(373,'18074','龚红梅','201700202',NULL,NULL,NULL,NULL,1509),(374,'17005','吴燕端','201700202',NULL,NULL,NULL,NULL,1510),(375,'30008','刘树先','201700202',NULL,NULL,NULL,NULL,1511),(376,'17702','邵晋芳','201700202',NULL,NULL,NULL,NULL,1512),(377,'17703','蔡敏仪','201700202',8,4,212,'20',1513),(378,'17704','曾雨珊','201700202',NULL,NULL,NULL,NULL,1514),(379,'17049','汪梅','201700202',10,13,NULL,NULL,1515),(380,'17020','李健','201700202',10,13,NULL,NULL,1516),(381,'17011','陈佳','201700202',10,13,NULL,NULL,1517),(382,'17022','黄洁明','201700202',10,13,NULL,NULL,1518),(383,'27013','梁朝湘','201700202',10,13,NULL,NULL,1519),(384,'17064','吴芳','201700202',10,13,NULL,NULL,1520),(385,'17018','代丽娴','201700202',3,6,NULL,NULL,1521),(386,'07003','黄宏本','201700202',3,6,NULL,NULL,1522),(387,'17037','梁菁','201700202',3,6,NULL,NULL,1523),(388,'31047','李宗妮','201700202',3,6,NULL,NULL,1524),(389,'17202','农健','201700202',3,6,NULL,NULL,1525),(390,'17132','卿海军','201700202',3,6,NULL,NULL,1526),(391,'17039','陈聪','201700202',3,6,NULL,NULL,1527),(392,'17038','卢雪燕','201700202',3,6,NULL,NULL,1528),(393,'17133','黄寄洪','201700202',3,6,NULL,NULL,1529),(394,'17213','郑明','201700202',3,6,NULL,NULL,1530),(395,'31046','何希','201700202',8,4,NULL,NULL,1531),(396,'17041','莫智懿','201700202',8,4,216,'03',1532),(397,'17025','吴炎桃','201700202',8,4,NULL,NULL,1533),(398,'17221','陈悦','201700202',8,4,NULL,NULL,1534),(399,'17134','冀肖榆','201700202',8,4,214,'05',1535),(400,'27105','许传本','201700202',8,4,212,'22',1536),(401,'17224','朱肖颖','201700202',8,4,NULL,NULL,1537),(402,'17074','庞光垚','201700202',8,4,NULL,NULL,1538),(403,'17701','蒲保兴','201700202',8,4,NULL,NULL,1539),(404,'21016','覃学文','201700202',7,9,NULL,NULL,1540),(405,'30011','赵春茹','201700202',7,9,NULL,NULL,1541),(406,'21022','覃桂茳','201700202',7,9,NULL,NULL,1542),(407,'21011','刘敏捷','201700202',7,9,NULL,NULL,1543),(408,'21054','杨甲山','201700202',7,9,NULL,NULL,1544),(409,'21012','黄劲','201700202',7,9,NULL,NULL,1545),(410,'28009','胡庆席','201700202',7,9,NULL,NULL,1546),(411,'21005','李连芬','201700202',7,9,NULL,NULL,1547),(412,'21014','石向东','201700202',7,9,NULL,NULL,1548),(413,'30013','涂井先','201700202',7,9,NULL,NULL,1549),(414,'06003','陈红','201700202',7,9,NULL,NULL,1550),(415,'21018','李志军','201700202',7,9,NULL,NULL,1551),(416,'21017','许成章','201700202',7,9,NULL,NULL,1552),(417,'23098','吴飞燕','201700202',10,13,NULL,NULL,1553),(418,'17010','贺杰','201700202',10,13,NULL,NULL,1554),(419,'17044','宫海晓','201700202',10,13,NULL,NULL,1555),(420,'17062','邸臻炜','201700202',10,13,NULL,NULL,1556),(421,'17031','李翊','201700202',10,13,NULL,NULL,1557),(422,'17033','黄筱佟','201700202',10,13,NULL,NULL,1558),(423,'17214','杨秋慧','201700202',10,13,NULL,NULL,1559),(424,'17046','何高明','201700202',4,5,NULL,NULL,1560),(425,'17027','蒋琳琼','201700202',4,5,NULL,NULL,1561),(426,'17019','李海英','201700202',4,5,NULL,NULL,1562),(427,'17021','李军','201700202',4,5,NULL,NULL,1563),(428,'21010','苏芳','201700202',10,11,NULL,NULL,1564),(429,'21019','赵贤','201700202',10,11,NULL,NULL,1565),(430,'asdfas','asdfasd','201700202',NULL,NULL,212,NULL,1882),(431,'11111111','11111111','201700202',8,4,216,'20',1883);
/*!40000 ALTER TABLE `sys_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_technical`
--

DROP TABLE IF EXISTS `sys_technical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_technical` (
  `technical_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '职称id',
  `technical_no` varchar(255) DEFAULT NULL COMMENT '职称编号',
  `technical_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`technical_id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_technical`
--

LOCK TABLES `sys_technical` WRITE;
/*!40000 ALTER TABLE `sys_technical` DISABLE KEYS */;
INSERT INTO `sys_technical` VALUES (212,'01','助教'),(213,'02','讲师'),(214,'03','副教授'),(215,'04','教授'),(216,'05','高级工程师');
/*!40000 ALTER TABLE `sys_technical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_book`
--

DROP TABLE IF EXISTS `task_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_book` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_content` longtext COMMENT '论文内容和要求',
  `task_plan_job` longtext COMMENT '进度计划与完成的工作',
  `task_document` longtext COMMENT '主要参考文献、资料',
  `stu_id` int(11) DEFAULT NULL COMMENT '学生ID',
  `teacher_id` int(11) DEFAULT NULL COMMENT '指导老师Id',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_book`
--

LOCK TABLES `task_book` WRITE;
/*!40000 ALTER TABLE `task_book` DISABLE KEYS */;
INSERT INTO `task_book` VALUES (1,'<p>rrrrrrrrrrrrrrr</p><p style=\"text-align:center\"><img src=\"/gdm/attached/ueeditor/1573093025308078871.jpg\" title=\"1573093025308078871.jpg\" alt=\"4-160PQ61502.jpg\"/></p><p><br/></p>','<p>fsadfas<img src=\"/gdm/attached/ueeditor/1573093054507035555.jpg\" title=\"1573093054507035555.jpg\" alt=\"62.jpg\"/></p>','<p>asdfas<img src=\"/gdm/attached/ueeditor/1573093060416051889.jpg\" title=\"1573093060416051889.jpg\" alt=\"04.jpg\"/></p>',842,396,2019);
/*!40000 ALTER TABLE `task_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_directions`
--

DROP TABLE IF EXISTS `teacher_directions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_directions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `directions_id` int(11) DEFAULT NULL COMMENT '研究方向Id',
  `teacher_id` int(11) DEFAULT NULL COMMENT '老师ID',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_directions`
--

LOCK TABLES `teacher_directions` WRITE;
/*!40000 ALTER TABLE `teacher_directions` DISABLE KEYS */;
INSERT INTO `teacher_directions` VALUES (1,1,339,2019),(2,1,396,2019),(3,1,400,2019),(4,1,377,2019),(5,1,399,2019),(7,1,431,2019);
/*!40000 ALTER TABLE `teacher_directions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_major`
--

DROP TABLE IF EXISTS `teacher_major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_major` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_major`
--

LOCK TABLES `teacher_major` WRITE;
/*!40000 ALTER TABLE `teacher_major` DISABLE KEYS */;
INSERT INTO `teacher_major` VALUES (1,339,4,2019),(2,396,4,2019),(3,400,4,2019),(4,377,4,2019),(5,399,4,2019),(6,431,4,2019);
/*!40000 ALTER TABLE `teacher_major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_project`
--

DROP TABLE IF EXISTS `teacher_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) DEFAULT NULL COMMENT '导师课题名称',
  `project_type` varchar(255) DEFAULT NULL COMMENT '导师课题类型',
  `project_describ` varchar(255) DEFAULT NULL COMMENT '课题描述',
  `teacher_id` int(11) DEFAULT NULL COMMENT '教师编号',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `stu_ids` varchar(255) DEFAULT NULL,
  `stu_names` varchar(255) DEFAULT NULL COMMENT '学生名字集合',
  `already_choose` int(11) DEFAULT NULL COMMENT '已经选择此课题的人数',
  `max_choose` int(11) DEFAULT NULL COMMENT '选择此课题的人数上限',
  `project_sign` int(11) DEFAULT NULL COMMENT '标识',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_project`
--

LOCK TABLES `teacher_project` WRITE;
/*!40000 ALTER TABLE `teacher_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_hlep`
--

DROP TABLE IF EXISTS `user_hlep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_hlep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL COMMENT '用户名',
  `loginName` varchar(255) DEFAULT NULL COMMENT '登录名',
  `password` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `userType` varchar(255) DEFAULT NULL COMMENT '用户类型（1.学生用户2.老师3 .管理员））',
  `opTime` datetime DEFAULT NULL COMMENT '录入时间',
  `sign` varchar(255) DEFAULT NULL COMMENT '登录标识',
  `userSex` varchar(255) DEFAULT NULL COMMENT '用户性别',
  `userAge` varchar(255) DEFAULT NULL COMMENT '用户年龄',
  `userTel` varchar(255) DEFAULT NULL COMMENT '用户电话',
  `userEmail` varchar(255) DEFAULT NULL COMMENT '用户邮箱',
  `userImg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1884 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hlep`
--

LOCK TABLES `user_hlep` WRITE;
/*!40000 ALTER TABLE `user_hlep` DISABLE KEYS */;
INSERT INTO `user_hlep` VALUES (772,'admin','admin','admin','3','2017-09-30 11:31:23',NULL,'1','12','13507749831','11547830091@qq.com','/attached/userImg/FA29E1F9-CB79-4D39-A365-7CC0F151D52B_04 (1).jpg'),(1509,'龚红梅','18074','18074','2','2019-11-05 22:58:13',NULL,'1','',NULL,NULL,NULL),(1510,'吴燕端','17005','17005','2','2019-11-05 22:58:13',NULL,'1','',NULL,NULL,NULL),(1511,'刘树先','30008','30008','2','2019-11-05 22:58:13',NULL,'0','',NULL,NULL,NULL),(1512,'邵晋芳','17702','17702','2','2019-11-05 22:58:13',NULL,'1','',NULL,NULL,NULL),(1513,'蔡敏仪','17703','17703','2','2019-11-05 22:58:13',NULL,'0','','11111111111','2',NULL),(1514,'曾雨珊','17704','17704','2','2019-11-05 22:58:13',NULL,'1','',NULL,NULL,NULL),(1515,'汪梅','17049','17049','2','2019-11-05 22:58:13',NULL,'1','',NULL,NULL,NULL),(1516,'李健','17020','17020','2','2019-11-05 22:58:13',NULL,'0','',NULL,NULL,NULL),(1517,'陈佳','17011','17011','2','2019-11-05 22:58:13',NULL,'1','',NULL,NULL,NULL),(1518,'黄洁明','17022','17022','2','2019-11-05 22:58:13',NULL,'0','',NULL,NULL,NULL),(1519,'梁朝湘','27013','27013','2','2019-11-05 22:58:13',NULL,'0','',NULL,NULL,NULL),(1520,'吴芳','17064','17064','2','2019-11-05 22:58:13',NULL,'1','',NULL,NULL,NULL),(1521,'代丽娴','17018','17018','2','2019-11-05 22:58:13',NULL,'1','',NULL,NULL,NULL),(1522,'黄宏本','07003','07003','2','2019-11-05 22:58:13',NULL,'0','',NULL,NULL,NULL),(1523,'梁菁','17037','17037','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1524,'李宗妮','31047','31047','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1525,'农健','17202','17202','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1526,'卿海军','17132','17132','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1527,'陈聪','17039','17039','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1528,'卢雪燕','17038','17038','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1529,'黄寄洪','17133','17133','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1530,'郑明','17213','17213','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1531,'何希','31046','31046','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1532,'莫智懿','17041','17041','2','2019-11-05 22:58:14',NULL,'1','','201600208446','1111111111','/attached/userImg/2F3FA116-BC66-4EF7-A02C-843A7D18D73C_linus.jpg'),(1533,'吴炎桃','17025','17025','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1534,'陈悦','17221','17221','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1535,'冀肖榆','17134','17134','2','2019-11-05 22:58:14',NULL,'0','','17134','',NULL),(1536,'许传本','27105','27105','2','2019-11-05 22:58:14',NULL,'1','','27105','15866952842@qq.com',NULL),(1537,'朱肖颖','17224','17224','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1538,'庞光垚','17074','17074','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1539,'蒲保兴','17701','17701','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1540,'覃学文','21016','21016','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1541,'赵春茹','30011','30011','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1542,'覃桂茳','21022','21022','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1543,'刘敏捷','21011','21011','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1544,'杨甲山','21054','21054','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1545,'黄劲','21012','21012','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1546,'胡庆席','28009','28009','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1547,'李连芬','21005','21005','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1548,'石向东','21014','21014','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1549,'涂井先','30013','30013','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1550,'陈红','06003','06003','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1551,'李志军','21018','21018','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1552,'许成章','21017','21017','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1553,'吴飞燕','23098','23098','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1554,'贺杰','17010','17010','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1555,'宫海晓','17044','17044','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1556,'邸臻炜','17062','17062','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1557,'李翊','17031','17031','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1558,'黄筱佟','17033','17033','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1559,'杨秋慧','17214','17214','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1560,'何高明','17046','17046','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1561,'蒋琳琼','17027','17027','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1562,'李海英','17019','17019','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1563,'李军','17021','17021','2','2019-11-05 22:58:14',NULL,'0','',NULL,NULL,NULL),(1564,'苏芳','21010','21010','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1565,'赵贤','21019','21019','2','2019-11-05 22:58:14',NULL,'1','',NULL,NULL,NULL),(1566,'何盛万','201600208104','201600208104','1',NULL,NULL,'0',NULL,'13025978592','1835284800@qq.com',NULL),(1567,'李苑瑜','201600213141','201600213141','1',NULL,NULL,'0',NULL,'18977460345','850611863@qq.com',NULL),(1568,'陆南梅','201600213142','201600213142','1',NULL,NULL,'0',NULL,'18977418562','1945401687@qq.com',NULL),(1569,'廖克裕','201400213018','201400213018','1',NULL,NULL,'0',NULL,'15177400717','1254567951@qq.com',NULL),(1570,'甘德品','201600213104','201600213104','1',NULL,NULL,'0',NULL,'15277479500','1304899107@qq.com',NULL),(1571,'黄依顺','201600213108','201600213108','1',NULL,NULL,'0',NULL,'13324704970','1770219081@qq.com',NULL),(1572,'李春霖','201600213113','201600213113','1',NULL,NULL,'0',NULL,'13132756595','84345886@qq.com',NULL),(1573,'李宗森','201600213115','201600213115','1',NULL,NULL,'0',NULL,'18277415630','1247502122@qq.com',NULL),(1574,'梁稳','201600213117','201600213117','1',NULL,NULL,'0',NULL,'18377873304','2711127630@qq.com',NULL),(1575,'龙永亮','201600213120','201600213120','1',NULL,NULL,'0',NULL,'18577429460','1436036517@qq.com',NULL),(1576,'卢山盟','201600213122','201600213122','1',NULL,NULL,'0',NULL,'18277418951','2041905095@qq.com',NULL),(1577,'王文滔','201600213126','201600213126','1',NULL,NULL,'0',NULL,'18276410131','584373417@qq.com',NULL),(1578,'周林福','201600213132','201600213132','1',NULL,NULL,'0',NULL,'18775017243','2642951961@qq.com',NULL),(1579,'黄叶英','201600213138','201600213138','1',NULL,NULL,'0',NULL,'18278451613','1592257235@qq.com',NULL),(1580,'黄玉花','201600213139','201600213139','1',NULL,NULL,'0',NULL,'18878463792','2649722558@qq.com',NULL),(1581,'潘丽梅','201600213145','201600213145','1',NULL,NULL,'0',NULL,'18878461912','1844570685@qq.com',NULL),(1582,'唐艳妮','201600213148','201600213148','1',NULL,NULL,'0',NULL,'18269197327','2662954009@qq.com',NULL),(1583,'杨冬雪','201600213153','201600213153','1',NULL,NULL,'0',NULL,'17754583469','18176132473@qq.com',NULL),(1584,'游春兰 ','201600213155','201600213155','1',NULL,NULL,'0',NULL,'18897517253','2731938138@qq.com',NULL),(1585,'马欣廷','201600213215','201600213215','1',NULL,NULL,'0',NULL,'18207702336','115722537632@qq.com',NULL),(1586,'潘辉','201600213218','201600213218','1',NULL,NULL,'0',NULL,'18777843577','1905270669@qq.com',NULL),(1587,'宋楚皓','201600213220','201600213220','1',NULL,NULL,'0',NULL,'15777441585','2728659243@qq.com',NULL),(1588,'黄郁盛','201500208207','201500208207','1',NULL,NULL,'0',NULL,'','',NULL),(1589,'梁家琪','201500208218','201500208218','1',NULL,NULL,'0',NULL,'','',NULL),(1590,'沈嘉伟','201500208230','201500208230','1',NULL,NULL,'0',NULL,'','',NULL),(1591,'覃镜毓','201500208231','201500208231','1',NULL,NULL,'0',NULL,'','',NULL),(1592,'王志','201500208235','201500208235','1',NULL,NULL,'0',NULL,'','',NULL),(1593,'陈胜','20160020820\'1','20160020820\'1','1',NULL,NULL,'0',NULL,'19914987067‘','472010669@qq.com ',NULL),(1594,'杨长官','201600208230','201600208230','1',NULL,NULL,'0',NULL,'13557747691‘','1785868089@qq.com',NULL),(1595,'陈冬霞','201600208233‘','201600208233‘','1',NULL,NULL,'0',NULL,'18978489484‘','1149682393@qq.com',NULL),(1596,'程秀英','201600208234’','201600208234’','1',NULL,NULL,'0',NULL,'15878052273’','2536360208@qq.com',NULL),(1597,'李美琦','201600208236','201600208236','1',NULL,NULL,'0',NULL,'13507896865’','563732137@qq.com',NULL),(1598,'李逸','201600208237‘','201600208237‘','1',NULL,NULL,'0',NULL,'18208408054’','852561735@qq.com',NULL),(1599,'罗贺','201600208241‘','201600208241‘','1',NULL,NULL,'0',NULL,'18589840195’','956104201@qq.com',NULL),(1600,'孙少喜','201600208244’','201600208244’','1',NULL,NULL,'0',NULL,'13217747698/18898233096‘','1006450618@qq.com',NULL),(1601,'李海华','201600208408','201600208408','1',NULL,NULL,'0',NULL,'18376491975','2683794763@qq.com',NULL),(1602,'李善念','201600208409','201600208409','1',NULL,NULL,'0',NULL,'18078067215','2467167242@qq.com',NULL),(1603,'李天赐','201600208410','201600208410','1',NULL,NULL,'0',NULL,'18276407231','1455179754@qq.com',NULL),(1604,'覃威茗','201600208420','201600208420','1',NULL,NULL,'0',NULL,'15577152343','978250779@qq.com',NULL),(1605,'吴思敏','201600208427','201600208427','1',NULL,NULL,'0',NULL,'15077402099','875473947@qq.com',NULL),(1606,'杨健铭','201600208428','201600208428','1',NULL,NULL,'0',NULL,'18707742751','1612134732@qq.com',NULL),(1607,'郑宣贵','201600208430','201600208430','1',NULL,NULL,'0',NULL,'18907803595','1059570456@qq.com',NULL),(1608,'周杰威','201600208431','201600208431','1',NULL,NULL,'0',NULL,'15078168792','1575128896@qq.com',NULL),(1609,'池小媛','201600208435','201600208435','1',NULL,NULL,'0',NULL,'15078165967','1301801654@qq.com',NULL),(1610,'梁海玲','201600208439','201600208439','1',NULL,NULL,'0',NULL,'13457648052','1756350921@qq.com',NULL),(1611,'陈德培','201600213202','201600213202','1',NULL,NULL,'0',NULL,'18894637764','1622418364@qq.com',NULL),(1612,'陈永任','201600213203','201600213203','1',NULL,NULL,'0',NULL,'18176454130','1013184020@qq.com',NULL),(1613,'黄贻通','201600213210','201600213210','1',NULL,NULL,'0',NULL,'18176515068','2515830617@qq.com',NULL),(1614,'苏祖豪','201600213223','201600213223','1',NULL,NULL,'0',NULL,'18177404941','1137544509@qq.com',NULL),(1615,'黄慧君','201500208107','201500208107','1',NULL,NULL,'0',NULL,'','',NULL),(1616,'李睿','201500208317','201500208317','1',NULL,NULL,'0',NULL,'','',NULL),(1617,'梁皓','201500208318','201500208318','1',NULL,NULL,'0',NULL,'','',NULL),(1618,'陆权宁','201500208323','201500208323','1',NULL,NULL,'0',NULL,'','',NULL),(1619,'陈巨洁','201600208101','201600208101','1',NULL,NULL,'0',NULL,'13558240759','1024778645@qq.com',NULL),(1620,'蒋邦雄','201600208106','201600208106','1',NULL,NULL,'0',NULL,'13737370139','2240552076@qq.com',NULL),(1621,'李炳志','201600208108','201600208108','1',NULL,NULL,'0',NULL,'18376477800','1522436861@qq.com',NULL),(1622,'李宏伟','201600208109','201600208109','1',NULL,NULL,'0',NULL,'18587479941','1072204730@qq.com',NULL),(1623,'李杨','201600208112','201600208112','1',NULL,NULL,'0',NULL,'18276409600','961850649@qq.com',NULL),(1624,'李造','201600208113','201600208113','1',NULL,NULL,'0',NULL,'18577447368','1500062778@qq.com',NULL),(1625,'林家健','201600208114','201600208114','1',NULL,NULL,'0',NULL,'15907741682','1207798810@qq.com',NULL),(1626,'凌钦华','201600208115','201600208115','1',NULL,NULL,'0',NULL,'18577433282','1126021564@qq.com',NULL),(1627,'杨夕锋','201600208130','201600208130','1',NULL,NULL,'0',NULL,'18078067815','1453229971@qq.com',NULL),(1628,'曾波','201600208132','201600208132','1',NULL,NULL,'0',NULL,'13649448226','2209077910@qq.com',NULL),(1629,'董有宏','201600208203','201600208203','1',NULL,NULL,'0',NULL,'18577403934‘','577609286@qq.com',NULL),(1630,'蓝福','201600208207','201600208207','1',NULL,NULL,'0',NULL,'14796234245‘','936063161@qq.com',NULL),(1631,'李家荣','201600208209','201600208209','1',NULL,NULL,'0',NULL,'18276438252’','1203759782@qq.com',NULL),(1632,'刘维逸','201600208214','201600208214','1',NULL,NULL,'0',NULL,'15007840451','345618674@qq.com',NULL),(1633,'卢永贵','201600208215','201600208215','1',NULL,NULL,'0',NULL,'18776685317‘','2644049514@qq.com',NULL),(1634,'罗浩铨','201600208216‘','201600208216‘','1',NULL,NULL,'0',NULL,'18577420747’','1072450789@qq.com',NULL),(1635,'慕荣辉','201600208219','201600208219','1',NULL,NULL,'0',NULL,'18977409261’','1106856533@qq.com',NULL),(1636,'杨银燕','201600213154','201600213154','1',NULL,NULL,'0',NULL,'18376952971','18376952971@163.com',NULL),(1637,'黄鸿羲','201600213207','201600213207','1',NULL,NULL,'0',NULL,'18577407985','493798121@qq.com',NULL),(1638,'李汶霖','201600213213','201600213213','1',NULL,NULL,'0',NULL,'15278255913','1542897742@qq.com',NULL),(1639,'莫运平','201600213216','201600213216','1',NULL,NULL,'0',NULL,'18878463755','583311356@qq.com',NULL),(1640,'潘琦','201600213219','201600213219','1',NULL,NULL,'0',NULL,'13277796407','747685879@qq.com',NULL),(1641,'钟将','201600213232','201600213232','1',NULL,NULL,'0',NULL,'13471005219','1349280985@qq.com',NULL),(1642,'张超','201400213045','201400213045','1',NULL,NULL,'0',NULL,'','',NULL),(1643,'董振华','201500208305','201500208305','1',NULL,NULL,'0',NULL,'','',NULL),(1644,'陆宏安','201500208415','201500208415','1',NULL,NULL,'0',NULL,'','',NULL),(1645,'杨吉','201600208147','201600208147','1',NULL,NULL,'0',NULL,'18577423112','1311861142@qq.com',NULL),(1646,'颜阳','201600208229‘','201600208229‘','1',NULL,NULL,'0',NULL,'18277419479‘','1378116617@qq.com',NULL),(1647,'潘杏','201600208242‘','201600208242‘','1',NULL,NULL,'0',NULL,'15677540023‘','1106665834@qq.com',NULL),(1648,'陈春杨','201600208302','201600208302','1',NULL,NULL,'0',NULL,'13026948676','1047492790@qq.com',NULL),(1649,'梁艺耀','201600208313','201600208313','1',NULL,NULL,'0',NULL,'18577406440','1796689433@qq.com',NULL),(1650,'廖富光','201600208314','201600208314','1',NULL,NULL,'0',NULL,'15077518524','1552067371@qq.com',NULL),(1651,'叶子胜','201600208329','201600208329','1',NULL,NULL,'0',NULL,'18775751347','1415451651@qq.com',NULL),(1652,'周家财','201600208332','201600208332','1',NULL,NULL,'0',NULL,'15277331224','2458164829@qq.com',NULL),(1653,'陈紫丽','201600208336','201600208336','1',NULL,NULL,'0',NULL,'18587476974','969209706@qq.com',NULL),(1654,'李静','201600208339','201600208339','1',NULL,NULL,'0',NULL,'18172507886','2679324489@qq.com',NULL),(1655,'唐志晖','201600208424','201600208424','1',NULL,NULL,'0',NULL,'18978303784','11410253@qq.com',NULL),(1656,'杨顺海','201600208429','201600208429','1',NULL,NULL,'0',NULL,'18777427213','1359284798@qq.com',NULL),(1657,'刘玉霜','201600208442','201600208442','1',NULL,NULL,'0',NULL,'18178402371','1016958956@qq.com',NULL),(1658,'张中怡','201600208451','201600208451','1',NULL,NULL,'0',NULL,'13397840545','1144801348@qq.com',NULL),(1659,'陈艳艳','201600213236','201600213236','1',NULL,NULL,'0',NULL,'18377848554','1439148635@qq.com',NULL),(1660,'黄靖舒','201600213237','201600213237','1',NULL,NULL,'0',NULL,'13207741284','1097838588@qq.com',NULL),(1661,'黄柳条','201600213238','201600213238','1',NULL,NULL,'0',NULL,'18207747535','1993553621@qq.com',NULL),(1662,'江锦琦','201600213240','201600213240','1',NULL,NULL,'0',NULL,'15177689773','904407078@qq.com',NULL),(1663,'蓝金董','201600213241','201600213241','1',NULL,NULL,'0',NULL,'17878416736','1946541686@qq.com',NULL),(1664,'吕江','201600213245','201600213245','1',NULL,NULL,'0',NULL,'18707741877','1500411272@qq.com',NULL),(1665,'蒙丹','201600213246','201600213246','1',NULL,NULL,'0',NULL,'18207748401','1501429622@qq.com',NULL),(1666,'覃香群','201600213249','201600213249','1',NULL,NULL,'0',NULL,'18177854694','173608729@qq.com',NULL),(1667,'蔡昌志','201500213101','201500213101','1',NULL,NULL,'0',NULL,'','',NULL),(1668,'董世怡','201500213103','201500213103','1',NULL,NULL,'0',NULL,'','',NULL),(1669,'陶锐','201500213216','201500213216','1',NULL,NULL,'0',NULL,'','',NULL),(1670,'韦汀晏','201500213220','201500213220','1',NULL,NULL,'0',NULL,'','',NULL),(1671,'钟宾','201500213224','201500213224','1',NULL,NULL,'0',NULL,'','',NULL),(1672,'张翠玲','201600208148','201600208148','1',NULL,NULL,'0',NULL,'15507744515','1763062531@qq.com',NULL),(1673,'曹宸玮','201600208401','201600208401','1',NULL,NULL,'0',NULL,'15777445267','2508042890@qq.com',NULL),(1674,'韩鹏程','201600208406','201600208406','1',NULL,NULL,'0',NULL,'18858640815','937764586@qq.com',NULL),(1675,'刘柏池','201600208415','201600208415','1',NULL,NULL,'0',NULL,'15878057103','2013464099@qq.com',NULL),(1676,'阮民涛','201600208419','201600208419','1',NULL,NULL,'0',NULL,'18078060814','464330297@qq.com',NULL),(1677,'唐昊','201600208422','201600208422','1',NULL,NULL,'0',NULL,'18587472744','1148132975qq.com',NULL),(1678,'唐奕明','201600208423','201600208423','1',NULL,NULL,'0',NULL,'17878419207','270400250@qq.com',NULL),(1679,'韦永共','201600208425','201600208425','1',NULL,NULL,'0',NULL,'17707747546','2595665747qq.com',NULL),(1680,'丁婉朔','201600208436','201600208436','1',NULL,NULL,'0',NULL,'18278089517','2585425748@qq.com',NULL),(1681,'刘家倩','201600208441','201600208441','1',NULL,NULL,'0',NULL,'18777433789','2671003446@qq.com',NULL),(1682,'陈炳成','201600213101','201600213101','1',NULL,NULL,'0',NULL,'15278206029','2227331987@qq.com',NULL),(1683,'甘范名','201600213105','201600213105','1',NULL,NULL,'0',NULL,'15777444611','329446103@qq.com',NULL),(1684,'雷观昌','201600213111','201600213111','1',NULL,NULL,'0',NULL,'13557045210','1303585253@qq.com',NULL),(1685,'黎峻豪','201600213112','201600213112','1',NULL,NULL,'0',NULL,'13878407759','2428991161@qq.com',NULL),(1686,'刘冠宏','201600213118','201600213118','1',NULL,NULL,'0',NULL,'18277750692','1137241503@qq.com',NULL),(1687,'石宏磊','201600213124','201600213124','1',NULL,NULL,'0',NULL,'18529787572','634618338@qq.com',NULL),(1688,'谭建狄','201600213125','201600213125','1',NULL,NULL,'0',NULL,'18277499277','905076401@qq.com ',NULL),(1689,'韦歌迪','201600213127','201600213127','1',NULL,NULL,'0',NULL,'18775031081','863446895@qq.com',NULL),(1690,'朱华庭','201600213133','201600213133','1',NULL,NULL,'0',NULL,'15778664470','912728452@qq.com',NULL),(1691,'朱首彰','201600213134','201600213134','1',NULL,NULL,'0',NULL,'13347552466','2534670633@qq.com',NULL),(1692,'黄小梅','201600213239','201600213239','1',NULL,NULL,'0',NULL,'18278010804','1713668543@qq.com\n',NULL),(1693,'梁小英','201600213243','201600213243','1',NULL,NULL,'0',NULL,'15078431809','1799939949@qq.com',NULL),(1694,'覃萍','201600213248','201600213248','1',NULL,NULL,'0',NULL,'18176917595','2233897489@qq.com',NULL),(1695,'彭标','201500208123','201500208123','1',NULL,NULL,'0',NULL,'','',NULL),(1696,'韦增武','201500208128','201500208128','1',NULL,NULL,'0',NULL,'','',NULL),(1697,'闻丽媛','201500208129','201500208129','1',NULL,NULL,'0',NULL,'','',NULL),(1698,'傅宇华','201500208204','201500208204','1',NULL,NULL,'0',NULL,'','',NULL),(1699,'黄智中','201600208105','201600208105','1',NULL,NULL,'0',NULL,'18977055230','2367358345@qq.com',NULL),(1700,'潘宸','201600208118','201600208118','1',NULL,NULL,'0',NULL,'13877342926','1061656887@qq.com',NULL),(1701,'沈喜龙','201600208120','201600208120','1',NULL,NULL,'0',NULL,'15777406765','1158974225@qq.com',NULL),(1702,'司开元','201600208121','201600208121','1',NULL,NULL,'0',NULL,'18377457520','2393599234@qq.com',NULL),(1703,'王梓能','201600208124','201600208124','1',NULL,NULL,'0',NULL,'15188180515','1825178723@qq.com',NULL),(1704,'谢常繁','201600208128','201600208128','1',NULL,NULL,'0',NULL,'18587483684','739748823@qq.com',NULL),(1705,'黄滢','201600208135','201600208135','1',NULL,NULL,'0',NULL,'19976304091','961258946@qq.com',NULL),(1706,'蒋玉蓉','201600208136','201600208136','1',NULL,NULL,'0',NULL,'15331674002','2338664557@qq.com',NULL),(1707,'温晓怡','201600208145','201600208145','1',NULL,NULL,'0',NULL,'18577409465','1164037257@qq.com',NULL),(1708,'李锋','201600208208‘','201600208208‘','1',NULL,NULL,'0',NULL,'15878814272‘','48239446@qq.com',NULL),(1709,'王惠','201600208246’','201600208246’','1',NULL,NULL,'0',NULL,'18707799‘780','2015045336@qq.com',NULL),(1710,'张露丹','201600208249','201600208249','1',NULL,NULL,'0',NULL,'18579886479’','1972215027@qq.com',NULL),(1711,'曾小婷','201600208251','201600208251','1',NULL,NULL,'0',NULL,'13117749210’','1519107459@qq.com',NULL),(1712,'黄启东','201600208307','201600208307','1',NULL,NULL,'0',NULL,'18278959303','huangqidong2013@126.com',NULL),(1713,'阮春彪','201600208321','201600208321','1',NULL,NULL,'0',NULL,'15277916263','3096148788@qq.com',NULL),(1714,'盘美英','201600208345','201600208345','1',NULL,NULL,'0',NULL,'18589844025','1937599815qq.com',NULL),(1715,'范书豪','201600208404','201600208404','1',NULL,NULL,'0',NULL,'18407740954','873851622@qq.com',NULL),(1716,'廖树杰','201600208413','201600208413','1',NULL,NULL,'0',NULL,'13977013721','824709264@qq.com',NULL),(1717,'凌朝政','201600208414','201600208414','1',NULL,NULL,'0',NULL,'18878522710','331551083@qq.com',NULL),(1718,'潘登','201600208418','201600208418','1',NULL,NULL,'0',NULL,'13152672858','906332830@qq.com',NULL),(1719,'梁静华','201600208440','201600208440','1',NULL,NULL,'0',NULL,'18775042758','897860418@qq.com',NULL),(1720,'吴映辉','201600213128','201600213128','1',NULL,NULL,'0',NULL,'13977419796','2485167587@qq.com',NULL),(1721,'吴光辉','201600213227','201600213227','1',NULL,NULL,'0',NULL,'18377425309','1161699226@qq.com',NULL),(1722,'罗定友','201500208324','201500208324','1',NULL,NULL,'0',NULL,'','',NULL),(1723,'蒙伟森','201500208325','201500208325','1',NULL,NULL,'0',NULL,'','',NULL),(1724,'叶展鹏','201500208333','201500208333','1',NULL,NULL,'0',NULL,'','',NULL),(1725,'吴丹茗','201600208146','201600208146','1',NULL,NULL,'0',NULL,'19976304147','1402131129@qq.com',NULL),(1726,'刘上剑','201600208213','201600208213','1',NULL,NULL,'0',NULL,'18269446621’','863707090@qq.com',NULL),(1727,'庞桂花','201600208243','201600208243','1',NULL,NULL,'0',NULL,'19977264583','1612743874@qq.com',NULL),(1728,'朱美林','201600208250‘','201600208250‘','1',NULL,NULL,'0',NULL,'18894684161’','1685581920@qq.com',NULL),(1729,'曹鹏轩','201600208301','201600208301','1',NULL,NULL,'0',NULL,'15777406707','1139912591@qq.com',NULL),(1730,'黄世创','201600208309','201600208309','1',NULL,NULL,'0',NULL,'13457176612','1341630073@qq.com',NULL),(1731,'潘沛杰','201600208318','201600208318','1',NULL,NULL,'0',NULL,'13878454469','979775269@qq.com',NULL),(1732,'张恒','201600208330','201600208330','1',NULL,NULL,'0',NULL,'15777441007','1206366193@qq.com',NULL),(1733,'张积健','201600208331','201600208331','1',NULL,NULL,'0',NULL,'15289533192','1213312702@qq.com',NULL),(1734,'陈怡','201600208335','201600208335','1',NULL,NULL,'0',NULL,'18276419279','534886111@qq.com',NULL),(1735,'刘海帆','201600208340','201600208340','1',NULL,NULL,'0',NULL,'18707743057','1544172087@qq.com',NULL),(1736,'刘嘉嘉','201600208341','201600208341','1',NULL,NULL,'0',NULL,'15777403736','2916207007@qq.com',NULL),(1737,'罗颖玉','201600208344','201600208344','1',NULL,NULL,'0',NULL,'13367750234','1392642892@qq.com',NULL),(1738,'张晓君','201600208350','201600208350','1',NULL,NULL,'0',NULL,'18477403502','1341910139@qq.com',NULL),(1739,'陈震洺','201600208402','201600208402','1',NULL,NULL,'0',NULL,'18307853316','1986323702@qq.com',NULL),(1740,'邓彦松','201600208403','201600208403','1',NULL,NULL,'0',NULL,'13877499357','1940689003@qq.com',NULL),(1741,'梁海超','201600208412','201600208412','1',NULL,NULL,'0',NULL,'13557041170','984631527@qq.com',NULL),(1742,'魏祥','201600208426','201600208426','1',NULL,NULL,'0',NULL,'15878408793','1349239157@qq.com',NULL),(1743,'陈秋梅','201600208433','201600208433','1',NULL,NULL,'0',NULL,'18778719196','1796603504@qq.com',NULL),(1744,'李春梅','201600208438','201600208438','1',NULL,NULL,'0',NULL,'15777481527','3429920932@qq.com',NULL),(1745,'盛晓洁','201600208445','201600208445','1',NULL,NULL,'0',NULL,'15878079739','2635628347@qq.com',NULL),(1746,'韦露沐','201600213250','201600213250','1',NULL,NULL,'0',NULL,'18376487415','1584221714@qq.com',NULL),(1747,'陆兆民','201500208116','201500208116','1',NULL,NULL,'0',NULL,'','',NULL),(1748,'秦文兵','201500208421','201500208421','1',NULL,NULL,'0',NULL,'','',NULL),(1749,'陈龙','201600208102','201600208102','1',NULL,NULL,'0',NULL,'13324881646','1321570719@qq.com',NULL),(1750,'覃一鋆','201600208122','201600208122','1',NULL,NULL,'0',NULL,'18878155095','1017731265@qq.com',NULL),(1751,'和雪英','201600208133','201600208133','1',NULL,NULL,'0',NULL,'13627744623','2104513329@qq.com',NULL),(1752,'黄佩珍','201600208134','201600208134','1',NULL,NULL,'0',NULL,'18587489489','1807896298@qq.com',NULL),(1753,'莫小丽','201600208139','201600208139','1',NULL,NULL,'0',NULL,'15778691237','1439481102@qq.com',NULL),(1754,'欧榕坤','201600208140','201600208140','1',NULL,NULL,'0',NULL,'14795291929','1843216475@qq.com',NULL),(1755,'冉带素','201600208141','201600208141','1',NULL,NULL,'0',NULL,'18579881451','1771018632@qq.com',NULL),(1756,'邓扬殷','201600208202','201600208202','1',NULL,NULL,'0',NULL,'15777409426','407766289@we.com',NULL),(1757,'华孝鹏','201600208206','201600208206','1',NULL,NULL,'0',NULL,'15277416597','1023189105@qq.com',NULL),(1758,'廖桂生','201600208210','201600208210','1',NULL,NULL,'0',NULL,'18277600109','168543250@qq.com',NULL),(1759,'宋玉富','201600208224‘','201600208224‘','1',NULL,NULL,'0',NULL,'18776369093’','1450212241@qq.com',NULL),(1760,'唐民','201600208226','201600208226','1',NULL,NULL,'0',NULL,'15277414512','1009006463@qq.com',NULL),(1761,'周易源','201600208232’','201600208232’','1',NULL,NULL,'0',NULL,'15577579531’','1690409889@.qq.com',NULL),(1762,'赵迪','201500208136','201500208136','1',NULL,NULL,'0',NULL,'15277408983','1143508575@qq.com',NULL),(1763,'李昂','201600208311','201600208311','1',NULL,NULL,'0',NULL,'18587485156','3095582744@qq.com',NULL),(1764,'薛培星','201600208320','201600208320','1',NULL,NULL,'0',NULL,'18278058689','874470881@qq.com',NULL),(1765,'王晗','201600208323','201600208323','1',NULL,NULL,'0',NULL,'15665546587','1557180045@qq.com',NULL),(1766,'谢振威','201600208326','201600208326','1',NULL,NULL,'0',NULL,'15994430005','925323954@qq.com',NULL),(1767,'刘淋逸','201600213119','201600213119','1',NULL,NULL,'0',NULL,'14796063875','1394703577@qq.com',NULL),(1768,'蒙俐宏','201600213144','201600213144','1',NULL,NULL,'0',NULL,'','',NULL),(1769,'黄家理','201600213208','201600213208','1',NULL,NULL,'0',NULL,'15277571323','1359478672@qq.com',NULL),(1770,'雷文浩','201600213211','201600213211','1',NULL,NULL,'0',NULL,'18077511428','993328357@qq.com',NULL),(1771,'李家聪','201600213212','201600213212','1',NULL,NULL,'0',NULL,'18277511930','2195561242@qq.com',NULL),(1772,'黄妹','201601902132','201601902132','1',NULL,NULL,'0',NULL,'13878019439','1332352147@qq.com',NULL),(1773,'骆世嘉','201600208217','201600208217','1',NULL,NULL,'0',NULL,'18177406354‘','1130459793@qq.com',NULL),(1774,'蒙勇飞','201600208218','201600208218','1',NULL,NULL,'0',NULL,'18587678083','1162164202@qq.com',NULL),(1775,'庞彪','201600208221','201600208221','1',NULL,NULL,'0',NULL,'13677849326','741147406@qqcom',NULL),(1776,'司晓硕','201600208223','201600208223','1',NULL,NULL,'0',NULL,'18587480564’','1075662307@qq.com',NULL),(1777,'王洪升','201600208227','201600208227','1',NULL,NULL,'0',NULL,'18077453538’','2502008032@qq.com',NULL),(1778,'吴丽丽','201600208247‘','201600208247‘','1',NULL,NULL,'0',NULL,'18529780941’','1838830412@qq.com',NULL),(1779,'李国严','201600208312','201600208312','1',NULL,NULL,'0',NULL,'18815822941','2645154326@qq.com',NULL),(1780,'陆建宁','201600208316','201600208316','1',NULL,NULL,'0',NULL,'18277407986','2376571392@qq.com',NULL),(1781,'李汉彬','201600213114','201600213114','1',NULL,NULL,'0',NULL,'15778604464','906482416@qq.com',NULL),(1782,'梁林','201600213116','201600213116','1',NULL,NULL,'0',NULL,'18878515030','506457026@qq.com',NULL),(1783,'陈孔妙','201600213135','201600213135','1',NULL,NULL,'0',NULL,'15078121216','2558774873@qq.com',NULL),(1784,'黄安','201600213205','201600213205','1',NULL,NULL,'0',NULL,'13471402595','1109231162@QQ.com',NULL),(1785,'黄鸿庭','201600213206','201600213206','1',NULL,NULL,'0',NULL,'13471402595','1796098468@qq.com',NULL),(1786,'黄培彬','201600213209','201600213209','1',NULL,NULL,'0',NULL,'13471402595','642229776@qq.com',NULL),(1787,'罗明贵','201600213214','201600213214','1',NULL,NULL,'0',NULL,'13471402595','1035465851@qq.com',NULL),(1788,'农建泽','201600213217','201600213217','1',NULL,NULL,'0',NULL,'13471402595','6011658331@qq.com',NULL),(1789,'苏家卫','201600213221','201600213221','1',NULL,NULL,'0',NULL,'13471402595','1732486935@qq.com',NULL),(1790,'孙广进','201600213224','201600213224','1',NULL,NULL,'0',NULL,'13471402595','842936250@qq.com',NULL),(1791,'谭霁航','201600213225','201600213225','1',NULL,NULL,'0',NULL,'18007809821','614203787@qq.com',NULL),(1792,'周孔波','201600213233','201600213233','1',NULL,NULL,'0',NULL,'13471402595','1515964468@qq.com',NULL),(1793,'周华生','201500208337','201500208337','1',NULL,NULL,'0',NULL,'','',NULL),(1794,'陆月富','201500208417','201500208417','1',NULL,NULL,'0',NULL,'','',NULL),(1795,'孙亮','201500208426','201500208426','1',NULL,NULL,'0',NULL,'','',NULL),(1796,'吴煜辉','201500208431','201500208431','1',NULL,NULL,'0',NULL,'','',NULL),(1797,'邓彬胜','201600208103','201600208103','1',NULL,NULL,'0',NULL,'17607748805','1441855393@qq.com',NULL),(1798,'容宇轩','201600208119','201600208119','1',NULL,NULL,'0',NULL,'18579883178','1098385902@qq.com',NULL),(1799,'汪志明','201600208123','201600208123','1',NULL,NULL,'0',NULL,'15877029632','2247786052@qq.com',NULL),(1800,'温德尊','201600208126','201600208126','1',NULL,NULL,'0',NULL,'18174124169','798195570@qq.com',NULL),(1801,'高航涛','201600208405','201600208405','1',NULL,NULL,'0',NULL,'18587484804','40890768@qq.com',NULL),(1802,'陆正荣','201600208416','201600208416','1',NULL,NULL,'0',NULL,'15177066997','1606678391@qq.com',NULL),(1803,'黎艳芳','201600208437','201600208437','1',NULL,NULL,'0',NULL,'18777436573','2366844343@qq.com',NULL),(1804,'覃丽菊','201600208447','201600208447','1',NULL,NULL,'0',NULL,'13877495379','1279173055@qq.com',NULL),(1805,'邓祥鸿','201600213103','201600213103','1',NULL,NULL,'0',NULL,'18276412829','1517497965@qq.com',NULL),(1806,'郭天千','201600213107','201600213107','1',NULL,NULL,'0',NULL,'13877414921','1131615302@qq.com',NULL),(1807,'黄源松','201600213109','201600213109','1',NULL,NULL,'0',NULL,'13877419221','420844683@qq.com',NULL),(1808,'秦曼人','201600213123','201600213123','1',NULL,NULL,'0',NULL,'15277416531','913142189@qq.com',NULL),(1809,'谢惟朋','201600213130','201600213130','1',NULL,NULL,'0',NULL,'18775045602/18269676686','775622366@qq.com',NULL),(1810,'甘丽','201600213136','201600213136','1',NULL,NULL,'0',NULL,'15777423312','1812742693@qq.com',NULL),(1811,'何柳花','201600213137','201600213137','1',NULL,NULL,'0',NULL,'18778244153','2556398743@qq.com',NULL),(1812,'韦燕琳','201600213150','201600213150','1',NULL,NULL,'0',NULL,'18276417276','1425212042@qq.com',NULL),(1813,'叶炜','201600213230','201600213230','1',NULL,NULL,'0',NULL,'14795413020','983469420@qq.com',NULL),(1814,'陈贵连','201600213235','201600213235','1',NULL,NULL,'0',NULL,'18878277244','1487812572@qq.com',NULL),(1815,'廖小兰','201600213244','201600213244','1',NULL,NULL,'0',NULL,'14777147212','1910994973@qq.com',NULL),(1816,'莫佩凤','201600213247','201600213247','1',NULL,NULL,'0',NULL,'13471967794','710148944@qq.com',NULL),(1817,'赵春艳','201600213254','201600213254','1',NULL,NULL,'0',NULL,'18610629843','914844370@qq.com\n',NULL),(1818,'钟佳萍','201600213255','201600213255','1',NULL,NULL,'0',NULL,'13768128054','1051717348@qq.com',NULL),(1819,'陈石新','201500208103','201500208103','1',NULL,NULL,'0',NULL,'','',NULL),(1820,'黄荣春','201500208311','201500208311','1',NULL,NULL,'0',NULL,'','',NULL),(1821,'黄英强','201500208312','201500208312','1',NULL,NULL,'0',NULL,'','',NULL),(1822,'李权治','201500208316','201500208316','1',NULL,NULL,'0',NULL,'','',NULL),(1823,'周雯才','201600208131','201600208131','1',NULL,NULL,'0',NULL,'18977179408','1019931575@qq.com',NULL),(1824,'李碧静','201600208138','201600208138','1',NULL,NULL,'0',NULL,'15777328087','2396431127@qq.com',NULL),(1825,'谭月莲','201600208142','201600208142','1',NULL,NULL,'0',NULL,'15078111373','458387307@qq.com',NULL),(1826,'王娜','201600208143','201600208143','1',NULL,NULL,'0',NULL,'18172501857','1832968200@qq.com',NULL),(1827,'张楠','201600208149','201600208149','1',NULL,NULL,'0',NULL,'18577421040','1003405874@qq.com',NULL),(1828,'张旺珍','201600208150','201600208150','1',NULL,NULL,'0',NULL,'19976304023','2596795433@qq.com',NULL),(1829,'周丽鲜','201600208151','201600208151','1',NULL,NULL,'0',NULL,'19976304187','3188316741@qq.com',NULL),(1830,'刘清旭','201600208212','201600208212','1',NULL,NULL,'0',NULL,'18377480282','1870168644@qq.com',NULL),(1831,'孙艺','201600208225','201600208225','1',NULL,NULL,'0',NULL,'18276417233‘','1181823629@qq.com',NULL),(1832,'叶城廷','201600208231‘','201600208231‘','1',NULL,NULL,'0',NULL,'15177436102','395344467@qq.com',NULL),(1833,'廖梦青','201600208239’','201600208239’','1',NULL,NULL,'0',NULL,'18378016738‘','2671690670@qq.com',NULL),(1834,'刘春福','201600208315','201600208315','1',NULL,NULL,'0',NULL,'18577409493','429829320@qq.com',NULL),(1835,'陈宣媛','201600208334','201600208334','1',NULL,NULL,'0',NULL,'19127333480','1093869183@qq.com',NULL),(1836,'孔丽玲','201600208338','201600208338','1',NULL,NULL,'0',NULL,'18277403327','2662675272@qq.com',NULL),(1837,'刘禹含','201600208343','201600208343','1',NULL,NULL,'0',NULL,'17374843602','2099284432@qq.com',NULL),(1838,'覃荔靖','201600208346','201600208346','1',NULL,NULL,'0',NULL,'18276365213','2687834634@qq.com',NULL),(1839,'王菁颖','201600208348','201600208348','1',NULL,NULL,'0',NULL,'18777425659','1161463449@qq.com',NULL),(1840,'莫东林','201600208417','201600208417','1',NULL,NULL,'0',NULL,'18078062074','931668343@qq.com',NULL),(1841,'商文鑫','201600208444','201600208444','1',NULL,NULL,'0',NULL,'15777400781','1316521967@qq.com',NULL),(1842,'谈茵茵','201600208446','201600208446','1',NULL,NULL,'1',NULL,'158784278052','15866952842@qq.com',NULL),(1843,'李桂兰','201600213140','201600213140','1',NULL,NULL,'0',NULL,'15207840793','2561719281@qq.com',NULL),(1844,'魏钰','201600213151','201600213151','1',NULL,NULL,'0',NULL,'13557348039','1050332581@qq.com',NULL),(1845,'肖雨君','201600213152','201600213152','1',NULL,NULL,'0',NULL,'13649424680','978613018@qq.com',NULL),(1846,'何鹏程','201500213105','201500213105','1',NULL,NULL,'0',NULL,'','',NULL),(1847,'唐昌钰','201500213116','201500213116','1',NULL,NULL,'0',NULL,'','',NULL),(1848,'唐立','201500213117','201500213117','1',NULL,NULL,'0',NULL,'','',NULL),(1849,'钟明城','201500213126','201500213126','1',NULL,NULL,'0',NULL,'','',NULL),(1850,'李明清','201600208110','201600208110','1',NULL,NULL,'0',NULL,'18376477791','329031482@qq.com',NULL),(1851,'陆鹏祥','201600208116','201600208116','1',NULL,NULL,'0',NULL,'18775043257','1960262152@qq.com',NULL),(1852,'陆镇峰','201600208117','201600208117','1',NULL,NULL,'0',NULL,'18529780521','l516917774@qq.com',NULL),(1853,'黎军君','201600208137','201600208137','1',NULL,NULL,'0',NULL,'18278051926','1152097113@qq.com',NULL),(1854,'王研','201600208144','201600208144','1',NULL,NULL,'0',NULL,'14747509025','1479610934@qq.com',NULL),(1855,'梁容','201600208238','201600208238','1',NULL,NULL,'0',NULL,'15878059375‘','760718814@qq.com',NULL),(1856,'林远秋','201600208240’','201600208240’','1',NULL,NULL,'0',NULL,'13026947596‘','1577946543@qq.com',NULL),(1857,'郭家欣','201500208307','201500208307','1',NULL,NULL,'0',NULL,'18878578004','1272844493@qq.com',NULL),(1858,'廖家鹏','201500208410','201500208410','1',NULL,NULL,'0',NULL,'15717744021','1481537845@qq.com',NULL),(1859,'陈天艺','201600208303','201600208303','1',NULL,NULL,'0',NULL,'13878498531','1061318901@qq.com',NULL),(1860,'丁程强','201600208304','201600208304','1',NULL,NULL,'0',NULL,'18277480079','1009445881@qq.com',NULL),(1861,'董思源','201600208305','201600208305','1',NULL,NULL,'0',NULL,'18290124378','1370250496@qq.com',NULL),(1862,'黄庆港','201600208308','201600208308','1',NULL,NULL,'0',NULL,'15278359554','a9062058182qq.com@qq.com',NULL),(1863,'黄祖彬','201600208310','201600208310','1',NULL,NULL,'0',NULL,'15777588404','1730078542@qq.com',NULL),(1864,'覃悦','201600208322','201600208322','1',NULL,NULL,'0',NULL,'19968069458','122792840@qq.com',NULL),(1865,'叶国标','201600208328','201600208328','1',NULL,NULL,'0',NULL,'18577447845','1443372989@qq.com',NULL),(1866,'方丽萍','201600208337','201600208337','1',NULL,NULL,'0',NULL,'15777403561','1242649186@qq.com',NULL),(1867,'刘丽蓉','201600208342','201600208342','1',NULL,NULL,'0',NULL,'18276411572','1304313356@qq.com',NULL),(1868,'唐纤蓥','201600208347','201600208347','1',NULL,NULL,'0',NULL,'15078111541','1915420178@qq.com',NULL),(1869,'苏三明','201600213222','201600213222','1',NULL,NULL,'0',NULL,'18677546979','500607502@qq.com',NULL),(1870,'韦冠宇','201600213226','201600213226','1',NULL,NULL,'0',NULL,'13507743376','296712296@qq.com',NULL),(1871,'吴尚彬','201600213228','201600213228','1',NULL,NULL,'0',NULL,'18177405347','100504010@qq.com',NULL),(1872,'严荣','201600213229','201600213229','1',NULL,NULL,'1',NULL,'15778022959','185834022@qq.com',NULL),(1873,'梁鹏飞','201500208113','201500208113','1',NULL,NULL,'0',NULL,'','',NULL),(1874,'王玉华','201500208127','201500208127','1',NULL,NULL,'0',NULL,'','',NULL),(1875,'王嘉雯','201500208428','201500208428','1',NULL,NULL,'0',NULL,'','',NULL),(1876,'羊腾强','201600208129','201600208129','1',NULL,NULL,'0',NULL,'','',NULL),(1877,'莫冠华','201400213017','201400213017','1',NULL,NULL,'0',NULL,'13617743142','1648226142@qq.com',NULL),(1878,'霍胜权','201400213014','201400213014','1',NULL,NULL,'0',NULL,'','840526484@qq.com',NULL),(1879,'谢云','201400208223','201400208223','1',NULL,NULL,'0',NULL,'201400208223','1586695284@qq.com',NULL),(1880,'秦dd','232323','232323','1',NULL,NULL,'','','18276297824','',NULL),(1881,'asdsa','2323232','2323232','1',NULL,NULL,'','','18276297824','',NULL),(1882,'asdfasd','asdfas','asdfas','2','2019-11-10 11:14:53',NULL,'0','','18276297824','',NULL),(1883,'11111111','11111111','11111111','2','2019-11-10 11:41:33',NULL,'1','11111111','18276297824','11111111@qq.com','/attached/userImg/1F8C7C1A-CF25-4931-AE61-EB5F782B375D_bundle.jpg');
/*!40000 ALTER TABLE `user_hlep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `userHelpId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK143BF46AE75981AB` (`userHelpId`),
  KEY `FK143BF46A6F1ACE7F` (`roleId`),
  CONSTRAINT `FK143BF46A6F1ACE7F` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FK143BF46AE75981AB` FOREIGN KEY (`userHelpId`) REFERENCES `user_hlep` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1458 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (344,23,772),(1081,25,1509),(1082,25,1510),(1083,25,1511),(1084,25,1512),(1085,25,1513),(1086,25,1514),(1087,25,1515),(1088,25,1516),(1089,25,1517),(1090,25,1518),(1091,25,1519),(1092,25,1520),(1093,25,1521),(1094,25,1522),(1095,25,1523),(1096,25,1524),(1097,25,1525),(1098,25,1526),(1099,25,1527),(1100,25,1528),(1101,25,1529),(1102,25,1530),(1103,25,1531),(1105,25,1533),(1106,25,1534),(1107,25,1535),(1108,25,1536),(1109,25,1537),(1110,25,1538),(1111,25,1539),(1112,25,1540),(1113,25,1541),(1114,25,1542),(1115,25,1543),(1116,25,1544),(1117,25,1545),(1118,25,1546),(1119,25,1547),(1120,25,1548),(1121,25,1549),(1122,25,1550),(1123,25,1551),(1124,25,1552),(1125,25,1553),(1126,25,1554),(1127,25,1555),(1128,25,1556),(1129,25,1557),(1130,25,1558),(1131,25,1559),(1132,25,1560),(1133,25,1561),(1134,25,1562),(1135,25,1563),(1136,25,1564),(1137,25,1565),(1138,24,1566),(1139,24,1567),(1140,24,1568),(1141,24,1569),(1142,24,1570),(1143,24,1571),(1144,24,1572),(1145,24,1573),(1146,24,1574),(1147,24,1575),(1148,24,1576),(1149,24,1577),(1150,24,1578),(1151,24,1579),(1152,24,1580),(1153,24,1581),(1154,24,1582),(1155,24,1583),(1156,24,1584),(1157,24,1585),(1158,24,1586),(1159,24,1587),(1160,24,1588),(1161,24,1589),(1162,24,1590),(1163,24,1591),(1164,24,1592),(1165,24,1593),(1166,24,1594),(1167,24,1595),(1168,24,1596),(1169,24,1597),(1170,24,1598),(1171,24,1599),(1172,24,1600),(1173,24,1601),(1174,24,1602),(1175,24,1603),(1176,24,1604),(1177,24,1605),(1178,24,1606),(1179,24,1607),(1180,24,1608),(1181,24,1609),(1182,24,1610),(1183,24,1611),(1184,24,1612),(1185,24,1613),(1186,24,1614),(1187,24,1615),(1188,24,1616),(1189,24,1617),(1190,24,1618),(1191,24,1619),(1192,24,1620),(1193,24,1621),(1194,24,1622),(1195,24,1623),(1196,24,1624),(1197,24,1625),(1198,24,1626),(1199,24,1627),(1200,24,1628),(1201,24,1629),(1202,24,1630),(1203,24,1631),(1204,24,1632),(1205,24,1633),(1206,24,1634),(1207,24,1635),(1208,24,1636),(1209,24,1637),(1210,24,1638),(1211,24,1639),(1212,24,1640),(1213,24,1641),(1214,24,1642),(1215,24,1643),(1216,24,1644),(1217,24,1645),(1218,24,1646),(1219,24,1647),(1220,24,1648),(1221,24,1649),(1222,24,1650),(1223,24,1651),(1224,24,1652),(1225,24,1653),(1226,24,1654),(1227,24,1655),(1228,24,1656),(1229,24,1657),(1230,24,1658),(1231,24,1659),(1232,24,1660),(1233,24,1661),(1234,24,1662),(1235,24,1663),(1236,24,1664),(1237,24,1665),(1238,24,1666),(1239,24,1667),(1240,24,1668),(1241,24,1669),(1242,24,1670),(1243,24,1671),(1244,24,1672),(1245,24,1673),(1246,24,1674),(1247,24,1675),(1248,24,1676),(1249,24,1677),(1250,24,1678),(1251,24,1679),(1252,24,1680),(1253,24,1681),(1254,24,1682),(1255,24,1683),(1256,24,1684),(1257,24,1685),(1258,24,1686),(1259,24,1687),(1260,24,1688),(1261,24,1689),(1262,24,1690),(1263,24,1691),(1264,24,1692),(1265,24,1693),(1266,24,1694),(1267,24,1695),(1268,24,1696),(1269,24,1697),(1270,24,1698),(1271,24,1699),(1272,24,1700),(1273,24,1701),(1274,24,1702),(1275,24,1703),(1276,24,1704),(1277,24,1705),(1278,24,1706),(1279,24,1707),(1280,24,1708),(1281,24,1709),(1282,24,1710),(1283,24,1711),(1284,24,1712),(1285,24,1713),(1286,24,1714),(1287,24,1715),(1288,24,1716),(1289,24,1717),(1290,24,1718),(1291,24,1719),(1292,24,1720),(1293,24,1721),(1294,24,1722),(1295,24,1723),(1296,24,1724),(1297,24,1725),(1298,24,1726),(1299,24,1727),(1300,24,1728),(1301,24,1729),(1302,24,1730),(1303,24,1731),(1304,24,1732),(1305,24,1733),(1306,24,1734),(1307,24,1735),(1308,24,1736),(1309,24,1737),(1310,24,1738),(1311,24,1739),(1312,24,1740),(1313,24,1741),(1314,24,1742),(1315,24,1743),(1316,24,1744),(1317,24,1745),(1318,24,1746),(1319,24,1747),(1320,24,1748),(1321,24,1749),(1322,24,1750),(1323,24,1751),(1324,24,1752),(1325,24,1753),(1326,24,1754),(1327,24,1755),(1328,24,1756),(1329,24,1757),(1330,24,1758),(1331,24,1759),(1332,24,1760),(1333,24,1761),(1334,24,1762),(1335,24,1763),(1336,24,1764),(1337,24,1765),(1338,24,1766),(1339,24,1767),(1340,24,1768),(1341,24,1769),(1342,24,1770),(1343,24,1771),(1344,24,1772),(1345,24,1773),(1346,24,1774),(1347,24,1775),(1348,24,1776),(1349,24,1777),(1350,24,1778),(1351,24,1779),(1352,24,1780),(1353,24,1781),(1354,24,1782),(1355,24,1783),(1356,24,1784),(1357,24,1785),(1358,24,1786),(1359,24,1787),(1360,24,1788),(1361,24,1789),(1362,24,1790),(1363,24,1791),(1364,24,1792),(1365,24,1793),(1366,24,1794),(1367,24,1795),(1368,24,1796),(1369,24,1797),(1370,24,1798),(1371,24,1799),(1372,24,1800),(1373,24,1801),(1374,24,1802),(1375,24,1803),(1376,24,1804),(1377,24,1805),(1378,24,1806),(1379,24,1807),(1380,24,1808),(1381,24,1809),(1382,24,1810),(1383,24,1811),(1384,24,1812),(1385,24,1813),(1386,24,1814),(1387,24,1815),(1388,24,1816),(1389,24,1817),(1390,24,1818),(1391,24,1819),(1392,24,1820),(1393,24,1821),(1394,24,1822),(1395,24,1823),(1396,24,1824),(1397,24,1825),(1398,24,1826),(1399,24,1827),(1400,24,1828),(1401,24,1829),(1402,24,1830),(1403,24,1831),(1404,24,1832),(1405,24,1833),(1406,24,1834),(1407,24,1835),(1408,24,1836),(1409,24,1837),(1410,24,1838),(1411,24,1839),(1412,24,1840),(1413,24,1841),(1414,24,1842),(1415,24,1843),(1416,24,1844),(1417,24,1845),(1418,24,1846),(1419,24,1847),(1420,24,1848),(1421,24,1849),(1422,24,1850),(1423,24,1851),(1424,24,1852),(1425,24,1853),(1426,24,1854),(1427,24,1855),(1428,24,1856),(1429,24,1857),(1430,24,1858),(1431,24,1859),(1432,24,1860),(1433,24,1861),(1434,24,1862),(1435,24,1863),(1436,24,1864),(1437,24,1865),(1438,24,1866),(1439,24,1867),(1440,24,1868),(1441,24,1869),(1442,24,1870),(1443,24,1871),(1444,24,1872),(1445,24,1873),(1446,24,1874),(1447,24,1875),(1448,24,1876),(1449,24,1877),(1450,24,1878),(1451,24,1879),(1452,26,1532),(1453,25,1532),(1454,24,1880),(1455,24,1881),(1456,25,1882),(1457,25,1883);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-11  8:34:52
