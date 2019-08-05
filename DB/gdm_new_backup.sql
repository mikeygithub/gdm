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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allot_guide`
--

LOCK TABLES `allot_guide` WRITE;
/*!40000 ALTER TABLE `allot_guide` DISABLE KEYS */;
INSERT INTO `allot_guide` VALUES (1,433,3463,'2019-08-01 09:00:12',2019),(2,433,3462,NULL,2019),(3,429,3448,NULL,2019),(4,429,3461,NULL,2019),(5,429,3453,NULL,2019),(6,429,3438,NULL,2019),(8,431,3460,'2019-08-01 22:57:42',2019),(9,434,3443,'2019-08-03 08:42:50',2019);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_file`
--

LOCK TABLES `chat_file` WRITE;
/*!40000 ALTER TABLE `chat_file` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_info`
--

LOCK TABLES `chat_info` WRITE;
/*!40000 ALTER TABLE `chat_info` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defense_record`
--

LOCK TABLES `defense_record` WRITE;
/*!40000 ALTER TABLE `defense_record` DISABLE KEYS */;
INSERT INTO `defense_record` VALUES (2,'ssssssssssssssssssssssssssssssssssssssssssss',3461,429,2019),(3,'谈茵茵​答辩记录',3460,434,2019),(4,'	周杰威答辩记录',3448,429,2019),(5,'魏祥答辩纪录',3443,434,2019);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_allot`
--

LOCK TABLES `group_allot` WRITE;
/*!40000 ALTER TABLE `group_allot` DISABLE KEYS */;
INSERT INTO `group_allot` VALUES (2,'201700202',1,'2019-08-15 00:00:00','答辩二组','00','01',2019),(3,'201700202',19,'2019-08-31 00:00:00','答辩三组','00','01',2019),(4,'201700202',16,'2019-08-20 00:00:00','答辩一组','00','01',2019);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_defense_direction`
--

LOCK TABLES `group_defense_direction` WRITE;
/*!40000 ALTER TABLE `group_defense_direction` DISABLE KEYS */;
INSERT INTO `group_defense_direction` VALUES (2,2,4,2019),(3,3,4,2019),(4,4,4,2019);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_student`
--

LOCK TABLES `group_student` WRITE;
/*!40000 ALTER TABLE `group_student` DISABLE KEYS */;
INSERT INTO `group_student` VALUES (4,'201600208446',3460,2,429,'2019-08-01 22:58:05',2019),(5,'201600208447',3461,3,427,'2019-08-02 21:44:38',2019),(6,'201600208438',3453,3,436,'2019-08-02 21:44:45',2019),(7,'201600208431',3448,4,431,'2019-08-02 22:26:11',2019),(8,'201600208426',3443,3,432,'2019-08-03 09:31:16',2019);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_teacher`
--

LOCK TABLES `group_teacher` WRITE;
/*!40000 ALTER TABLE `group_teacher` DISABLE KEYS */;
INSERT INTO `group_teacher` VALUES (4,2,429,'2019-08-01 21:55:28',2019,'0'),(5,2,434,'2019-08-01 21:55:46',2019,'1'),(6,2,430,'2019-08-01 21:56:21',2019,'2'),(7,3,432,'2019-08-02 21:42:50',2019,'0'),(8,3,436,'2019-08-02 21:42:59',2019,'2'),(9,3,427,'2019-08-02 21:43:18',2019,'1'),(10,4,431,'2019-08-02 22:23:19',2019,'0'),(11,4,433,'2019-08-02 22:23:28',2019,'1'),(12,4,435,'2019-08-02 22:23:40',2019,'2');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide_count`
--

LOCK TABLES `guide_count` WRITE;
/*!40000 ALTER TABLE `guide_count` DISABLE KEYS */;
INSERT INTO `guide_count` VALUES (1,20,0,436,2019),(2,20,0,435,2019),(3,20,1,434,2019),(4,20,2,433,2019),(5,20,0,432,2019),(6,20,1,431,2019),(7,20,0,430,2019),(8,20,0,428,2019),(9,20,0,427,2019),(10,20,4,429,2019);
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
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_info`
--

LOCK TABLES `issue_info` WRITE;
/*!40000 ALTER TABLE `issue_info` DISABLE KEYS */;
INSERT INTO `issue_info` VALUES (1,3461,'66666666666','&3&_',2019,NULL),(2,3460,'谈茵茵课题','&3&_',2019,NULL),(3,3463,'黄妹课题信息','&2&_',2019,NULL),(4,3453,'李春梅课题','&2&_',2019,NULL),(5,3448,'周杰威课题','&2&_',2019,NULL),(6,3443,'魏祥课题','&2&_',2019,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_report`
--

LOCK TABLES `open_report` WRITE;
/*!40000 ALTER TABLE `open_report` DISABLE KEYS */;
INSERT INTO `open_report` VALUES (1,'<p>777777777777777777</p>','<p>777777777777777777</p>','<p>77777777777777</p>','<p>77777777777777777</p>',3461,429,2019,'01'),(5,'<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">谈茵茵</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 20px; text-align: center;\">开题报告</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">谈茵茵</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 20px; text-align: center;\">开题报告</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">谈茵茵</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 20px; text-align: center;\">开题报告</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">谈茵茵</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 20px; text-align: center;\">开题报告</span></p>',3460,434,2019,'01'),(6,'<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">黄妹任务书</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">黄妹任务书</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">黄妹任务书</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">黄妹任务书</span></p>',3463,433,2019,'01'),(7,'<p><span style=\"color: rgb(62, 175, 224); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; text-indent: 2px; background-color: rgb(229, 235, 238);\">李春梅</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 20px; text-align: center;\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 20px; text-align: center;\">开题报告</span></p>','<p><span style=\"color: rgb(62, 175, 224); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; text-indent: 2px; background-color: rgb(229, 235, 238);\">李春梅</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 20px; text-align: center;\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 20px; text-align: center;\">开题报告</span></p>','<p><span style=\"color: rgb(62, 175, 224); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; text-indent: 2px; background-color: rgb(229, 235, 238);\">李春梅</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 20px; text-align: center;\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 20px; text-align: center;\">开题报告</span></p>','<p><span style=\"color: rgb(62, 175, 224); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; text-indent: 2px; background-color: rgb(229, 235, 238);\">李春梅</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 20px; text-align: center;\"></span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 20px; text-align: center;\">开题报告</span></p>',3453,429,2019,'01'),(8,'<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">周杰威开题报告</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">周杰威开题报告</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">周杰威开题报告</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">周杰威开题报告</span></p>',3448,429,2019,'01'),(9,'<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">魏祥开题报告</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">魏祥开题报告</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">魏祥开题报告</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">魏祥开题报告</span></p>',3443,434,2019,'01');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_progress`
--

LOCK TABLES `plan_progress` WRITE;
/*!40000 ALTER TABLE `plan_progress` DISABLE KEYS */;
INSERT INTO `plan_progress` VALUES (1,'201700202',8,-1,'2019-07-29 08:25:23','2019-08-09 08:25:28',2019,'00',1),(2,'201700202',8,4,'2019-07-29 08:25:23','2019-08-09 08:25:28',2019,'00',1),(3,'201700202',8,-1,'2019-08-01 08:26:22','2019-08-09 08:25:28',2019,'01',1),(4,'201700202',8,4,'2019-08-01 08:26:22','2019-08-09 08:25:28',2019,'01',1),(5,'201700202',8,-1,'2019-08-01 08:26:44','2019-08-09 08:25:28',2019,'02',1),(6,'201700202',8,4,'2019-08-01 08:26:44','2019-08-09 08:25:28',2019,'02',1),(9,'201700202',8,-1,'2019-08-01 08:27:18','2019-08-09 08:25:28',2019,'03',1),(10,'201700202',8,4,'2019-08-01 08:27:18','2019-08-09 08:25:28',2019,'03',1),(11,'201700202',8,-1,'2019-08-01 08:28:22','2019-08-09 08:25:28',2019,'06',1),(12,'201700202',8,4,'2019-08-01 08:28:22','2019-08-09 08:25:28',2019,'06',1),(13,'201700202',8,-1,'2019-08-01 08:28:34','2019-08-09 08:25:28',2019,'07',1),(14,'201700202',8,4,'2019-08-01 08:28:34','2019-08-09 08:25:28',2019,'07',1),(15,'201700202',8,-1,'2019-08-01 08:28:43','2019-08-09 08:25:28',2019,'08',1),(16,'201700202',8,4,'2019-08-01 08:28:43','2019-08-09 08:25:28',2019,'08',1),(17,'201700202',8,-1,'2019-08-01 08:28:56','2019-08-09 08:25:28',2019,'05',1),(18,'201700202',8,4,'2019-08-01 08:28:56','2019-08-09 08:25:28',2019,'05',1),(19,'201700202',8,-1,'2019-08-01 08:29:08','2019-08-09 08:25:28',2019,'10',1),(20,'201700202',8,4,'2019-08-01 08:29:08','2019-08-09 08:25:28',2019,'10',1),(21,'201700202',8,-1,'2019-08-01 08:29:20','2019-08-09 08:25:28',2019,'11',1),(22,'201700202',8,4,'2019-08-01 08:29:20','2019-08-09 08:25:28',2019,'11',1),(23,'201700202',8,-1,'2019-08-01 08:29:30','2019-08-09 08:25:28',2019,'12',1),(24,'201700202',8,4,'2019-08-01 08:29:30','2019-08-09 08:25:28',2019,'12',1),(25,'201700202',8,-1,'2019-08-01 08:29:40','2019-08-09 08:25:28',2019,'13',1),(26,'201700202',8,4,'2019-08-01 08:29:40','2019-08-09 08:25:28',2019,'13',1),(27,'201700202',8,-1,'2019-08-01 08:29:51','2019-08-09 08:25:28',2019,'14',1),(28,'201700202',8,4,'2019-08-01 08:29:51','2019-08-09 08:25:28',2019,'14',1),(31,'201700202',8,-1,'2019-08-01 08:27:02','2019-08-09 08:25:28',2019,'04',1),(32,'201700202',8,4,'2019-08-01 08:27:02','2019-08-09 08:25:28',2019,'04',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_year`
--

LOCK TABLES `plan_year` WRITE;
/*!40000 ALTER TABLE `plan_year` DISABLE KEYS */;
INSERT INTO `plan_year` VALUES (7,201,'2019-07-31 11:59:58',2019);
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
INSERT INTO `progress_situ` VALUES (1,3461,429,'2019-08-01 10:15:10','888888888888888','888888888888888',2019),(2,3460,434,'2019-08-01 22:55:46','谈茵茵工作要求','谈茵茵进程记录',2019),(3,3453,429,'2019-08-02 21:49:02','李春梅进度情况','李春梅进度情况',2019),(4,3448,429,'2019-08-02 22:29:45','周杰威进度情况','周杰威进度情况',2019),(5,3443,434,'2019-08-03 08:44:18','  魏祥进度情况222hhhh','魏祥进度情况 333 ',2019);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply_score`
--

LOCK TABLES `reply_score` WRITE;
/*!40000 ALTER TABLE `reply_score` DISABLE KEYS */;
INSERT INTO `reply_score` VALUES (3,'魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟魏祥老弟',5,0,'请先评分',3443,2019,'00'),(4,'答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语答辩小组对毕业论文的答辩评定成绩及评语',93,0,'未评分',3460,2019,'00');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (5,3443,13,434,'111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111','01','01',2019,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_score`
--

LOCK TABLES `review_score` WRITE;
/*!40000 ALTER TABLE `review_score` DISABLE KEYS */;
INSERT INTO `review_score` VALUES (26,5,13,1,1,NULL,2019,NULL),(27,5,14,1,2,NULL,2019,NULL),(28,5,15,1,3,NULL,2019,NULL),(29,5,16,1,4,NULL,2019,NULL),(30,5,17,1,5,NULL,2019,NULL),(31,5,18,1,6,NULL,2019,NULL),(32,5,19,1,7,NULL,2019,NULL),(33,5,20,1,8,NULL,2019,NULL),(34,5,21,1,9,NULL,2019,NULL),(35,5,22,1,10,NULL,2019,NULL),(36,5,23,1,11,NULL,2019,NULL),(37,5,24,1,12,NULL,2019,NULL),(38,5,25,1,13,NULL,2019,NULL);
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
INSERT INTO `student_paper` VALUES (1,'ideapad.conf',3460,434,2019,'/upload/34340067-9BDD-4CBB-9071-3A4698B1D499_ideapad.conf',25,'00',NULL),(2,'0ca45fb7418b6aef9d253529c4f7bc37.jpg',3443,434,2019,'/upload/8C98DEAF-9F84-4F39-961B-229489BE264D_0ca45fb7418b6aef9d253529c4f7bc37.jpg',823608,'00',NULL),(3,'5a096bd4c19ef.jpg',3443,434,2019,'/upload/8FE48EFD-04F4-4FE7-8D1C-29562ADE8591_5a096bd4c19ef.jpg',378487,'00',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category`
--

LOCK TABLES `sys_category` WRITE;
/*!40000 ALTER TABLE `sys_category` DISABLE KEYS */;
INSERT INTO `sys_category` VALUES (3,'计算机类','201700201'),(4,'物联网类','201700202'),(5,'数字媒体类','201700202'),(6,'电子类','201700201'),(7,'数学类','201700201'),(8,'软件类','201700202'),(9,'计算机基础','201700202'),(10,'数学类','201700202'),(11,'数字媒体类','201700202');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_class`
--

LOCK TABLES `sys_class` WRITE;
/*!40000 ALTER TABLE `sys_class` DISABLE KEYS */;
INSERT INTO `sys_class` VALUES (17,NULL,'16软件工程中升本1班','201700202',4),(18,NULL,'16软件工程中升本2班','201700202',4),(19,NULL,'16软件工程1班','201700202',4),(20,NULL,'16软件工程2班','201700202',4),(21,NULL,'16软件工程3班','201700202',4),(22,NULL,'16软件工程4班','201700202',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_major`
--

LOCK TABLES `sys_major` WRITE;
/*!40000 ALTER TABLE `sys_major` DISABLE KEYS */;
INSERT INTO `sys_major` VALUES (4,'000','201700202',8,'软件工程','软件工程专业教研室'),(5,'001','201700202',9,'物联网工程','物联网工程专业教研室'),(6,'002','201700202',9,'计算机科学与技术','计算机科学与技术专业教研室'),(8,'004','201700201',6,'电子信息工程','电子信息工程专业教研室'),(9,'005','201700202',10,'数学与应用数学','数学与应用数学专业教研室'),(10,'006','201700201',6,'电子科学与技术','电子科学与技术专业教研室'),(11,'007','201700202',9,'信息与计算科学','信息与计算科学专业教研室'),(12,'008','201700202',9,'数字媒体应用技术','数字媒体应用技术实验室'),(13,NULL,'201700202',9,'计算机基础','计算机基础教研室');
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
  `notice_content` longtext COMMENT '公告内容',
  `notice_time` datetime DEFAULT NULL COMMENT '公告发布时间',
  `user_id` int(11) DEFAULT NULL COMMENT '公告发布者',
  `notice_path` varchar(255) DEFAULT NULL COMMENT '图片路径',
  `notice_type` int(11) DEFAULT NULL COMMENT '公告类型，1-文本 2-图片 3-文件',
  `dept_number` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL COMMENT '年度',
  `major_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (2,'关于开题报告地点更换通知','由于与老师课程时间冲突，将原定N202答辩地点改为S502，请同学相互通知！','2019-07-08 17:14:10',772,NULL,NULL,NULL,2019,-2),(3,'关于开题报告地点更换通知','由于与老师课程时间冲突，将原定N202答辩地点改为S502，请同学相互通知！','2019-08-08 17:14:10',772,NULL,NULL,NULL,2019,-2),(4,'关于开题报告地点更换通知','由于与老师课程时间冲突，将原定N202答辩地点改为S502，请同学相互通知！','2019-09-08 17:14:10',772,NULL,NULL,NULL,2019,-2),(5,'关于开题报告地点更换通知','由于与老师课程时间冲突，将原定N202答辩地点改为S502，请同学相互通知！','2019-07-08 17:14:10',772,NULL,NULL,NULL,2019,-2),(6,'关于开题报告地点更换通知','由于与老师课程时间冲突，将原定N202答辩地点改为S502，请同学相互通知！','2019-07-08 17:14:10',772,NULL,NULL,NULL,2019,-2),(7,'关于开题报告地点更换通知','由于与老师课程时间冲突，将原定N202答辩地点改为S502，请同学相互通知！','2019-07-08 17:14:10',772,NULL,NULL,NULL,2019,-2),(8,'关于开题报告地点更换通知','由于与老师课程时间冲突，将原定N202答辩地点改为S502，请同学相互通知！','2019-07-08 17:14:10',772,NULL,NULL,NULL,2019,-2),(9,'关于开题报告地点更换通知','由于与老师课程时间冲突，将原定N202答辩地点改为S502，请同学相互通知！','2019-07-08 17:14:10',772,NULL,NULL,NULL,2019,-2),(10,'关于开题报告地点更换通知关于开题报告地点更换通知关于开题报告地点更换通知关于开题报告地点更换通知关于开题报告地点更换通知','由于与老师课程时间冲突，将原定N202答辩地点改为S502，请同学相互通知！','2019-07-08 17:14:10',772,NULL,NULL,NULL,2019,-2),(11,'关于开题报告地点更换通知','由于与老师课程时间冲突，将原定N202答辩地点改为S502，请同学相互通知！','2019-07-08 17:14:10',772,NULL,NULL,NULL,2019,-2),(12,'关于开题报告地点更换通知','由于与老师课程时间冲突，将原定N202答辩地点改为S502，请同学相互通知！','2019-07-08 17:14:10',772,NULL,NULL,NULL,2019,-2),(13,'关于开题报告地点更换通知','由于与老师课程时间冲突，将原定N202答辩地点改为S502，请同学相互通知！','2019-07-08 17:14:10',772,NULL,NULL,NULL,2019,-2),(14,'莫智懿发布公告','莫智懿发布公告','2019-08-03 20:43:43',4056,NULL,NULL,201700202,2019,4),(15,'莫智懿发布公告','莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告莫智懿发布公告','2019-08-03 20:48:06',4056,NULL,NULL,201700202,2019,4),(16,'莫智懿发布公告','莫智懿发布公告','2019-08-03 20:43:43',4056,NULL,NULL,201700202,2019,4),(17,'莫智懿发布公告','莫智懿发布公告','2019-08-03 20:43:43',4056,NULL,NULL,201700202,2019,4),(18,'莫智懿发布公告','莫智懿发布公告','2019-08-03 20:43:43',4056,NULL,NULL,201700202,2019,4),(19,'莫智懿发布公告','莫智懿发布公告','2019-08-03 20:43:43',4056,NULL,NULL,201700202,2019,4),(20,'莫智懿发布公告','莫智懿发布公告','2019-08-03 20:43:43',4056,NULL,NULL,201700202,2019,4),(21,'莫智懿发布公告','莫智懿发布公告','2019-08-03 20:43:43',4056,NULL,NULL,201700202,2019,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=805 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission`
--

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
INSERT INTO `sys_permission` VALUES (185,'perm:myTopicInformation',24),(186,'perm:Personalnformation',24),(187,'perm:ProgressStatus',24),(188,'perm:Topic',24),(189,'perm:myPersonalInformation',24),(190,'perm:chooseTheInstructor',24),(191,'perm:TaskBook',24),(192,'perm:myTaskBook',24),(193,'perm:DefenseRecord',24),(194,'perm:myProgressStatus',24),(195,'perm:InstructionAllocation',24),(196,'perm:myDefenseRecord',24),(197,'perm:myPaper',24),(198,'perm:OpeningReport',24),(199,'perm:Dissertation',24),(200,'perm:myOpeningReport',24),(651,'perm:planGuide',26),(652,'perm:teacherInformation',26),(653,'perm:selectStudent',26),(654,'perm:Personalnformation',26),(655,'perm:reviewAssignInformation',26),(656,'perm:BasicInformation',26),(657,'perm:Schedule',26),(658,'perm:Topic',26),(659,'perm:classInformation',26),(660,'perm:majorInformation',26),(661,'perm:RecordEntryInformation',26),(662,'perm:reviewInformation',26),(663,'perm:enterTheTeacherGroup',26),(664,'perm:DefenseGrouplnformation',26),(665,'perm:InstructionAllocation',26),(666,'perm:ReviewDissertationlnformation',26),(667,'perm:GroupManagement',26),(668,'perm:enterTheStudentGroup',26),(669,'perm:topicInformation',26),(670,'perm:BasicInformation',26),(671,'perm:planProgress',26),(672,'perm:myPersonalInformation',26),(717,'perm:teacherInformation',23),(718,'perm:classrommInformation',23),(719,'perm:planProgress',23),(720,'perm:DefenseRecord',23),(721,'perm:ProgressStatus',23),(722,'perm:TaskBook',23),(723,'perm:topicInformation',23),(724,'perm:defenseRecord',23),(725,'perm:Dissertation',23),(726,'perm:userHelpManagement',23),(727,'perm:majorInformation',23),(728,'perm:reviewInformation',23),(729,'perm:issueTypeInformation',23),(730,'perm:Schedule',23),(731,'perm:categoryInformation',23),(732,'perm:departInformation',23),(733,'perm:ReviewDissertationlnformation',23),(734,'perm:myPersonalInformation',23),(735,'perm:RecordEntryInformation',23),(736,'perm:planYear',23),(737,'perm:BasicInformation',23),(738,'perm:directionsInformation',23),(739,'perm:myOpeningReport',23),(740,'perm:planGuide',23),(741,'perm:chooseTheInstructor',23),(742,'perm:classInformation',23),(743,'perm:myDefenseRecord',23),(744,'perm:replyScore',23),(745,'perm:selectStudent',23),(746,'perm:reviewAssignInformation',23),(747,'perm:typeStatistics',23),(748,'perm:BasicInformation',23),(749,'perm:GroupManagement',23),(750,'perm:studentTaskBook',23),(751,'perm:DefenseGrouplnformation',23),(752,'perm:InstructionAllocation',23),(753,'perm:enterTheStudentGroup',23),(754,'perm:myPaper',23),(755,'perm:fileTypeInformation',23),(756,'perm:studentOpeningReport',23),(757,'perm:myProgressStatus',23),(758,'perm:OpeningReport',23),(759,'perm:enterTheTeacherGroup',23),(760,'perm:SystemManagement',23),(761,'perm:Topic',23),(762,'perm:roleManagement',23),(763,'perm:positionInformation',23),(764,'perm:noticeInformation',23),(765,'perm:Personalnformation',23),(766,'perm:technicalInformation',23),(767,'perm:myTopicInformation',23),(768,'perm:myTaskBook',23),(769,'perm:studentPapers',23),(788,'perm:DefenseGrouplnformation',25),(789,'perm:enterTheTeacherGroup',25),(790,'perm:myPersonalInformation',25),(791,'perm:DefenseRecord',25),(792,'perm:RecordEntryInformation',25),(793,'perm:topicInformation',25),(794,'perm:selectStudent',25),(795,'perm:Topic',25),(796,'perm:reviewInformation',25),(797,'perm:InstructionAllocation',25),(798,'perm:ReviewDissertationlnformation',25),(799,'perm:replyScore',25),(800,'perm:defenseRecord',25),(801,'perm:reviewAssignInformation',25),(802,'perm:GroupManagement',25),(803,'perm:enterTheStudentGroup',25),(804,'perm:Personalnformation',25);
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
) ENGINE=InnoDB AUTO_INCREMENT=3464 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_student`
--

LOCK TABLES `sys_student` WRITE;
/*!40000 ALTER TABLE `sys_student` DISABLE KEYS */;
INSERT INTO `sys_student` VALUES (3213,'201400213018','廖克裕','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3787),(3214,'201600213103','邓祥鸿','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3788),(3215,'201600213104','甘德品','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3789),(3216,'201600213107','郭天千','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3790),(3217,'201600213108','黄依顺','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3791),(3218,'201600213109','黄源松','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3792),(3219,'201600213113','李春霖','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3793),(3220,'201600213114','李汉彬','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3794),(3221,'201600213115','李宗森','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3795),(3222,'201600213116','梁林','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3796),(3223,'201600213117','梁稳','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3797),(3224,'201600213119','刘淋逸','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3798),(3225,'201600213120','龙永亮','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3799),(3226,'201600213122','卢山盟','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3800),(3227,'201600213123','秦曼人','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3801),(3228,'201600213126','王文滔','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3802),(3229,'201600213128','吴映辉','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3803),(3230,'201600213130','谢惟朋','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3804),(3231,'201600213132','周林福','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3805),(3232,'201600213135','陈孔妙','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3806),(3233,'201600213136','甘丽','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3807),(3234,'201600213137','何柳花','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3808),(3235,'201600213138','黄叶英','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3809),(3236,'201600213139','黄玉花','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3810),(3237,'201600213140','李桂兰','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3811),(3238,'201600213141','李苑瑜','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3812),(3239,'201600213142','陆南梅','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3813),(3240,'201600213145','潘丽梅','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3814),(3241,'201600213148','唐艳妮','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3815),(3242,'201600213150','韦燕琳','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3816),(3243,'201600213151','魏钰','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3817),(3244,'201600213152','肖雨君','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3818),(3245,'201600213153','杨冬雪','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3819),(3246,'201600213154','杨银燕','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3820),(3247,'201600213155','游春兰 ','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3821),(3248,'201600213101','陈炳成','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3822),(3249,'201600213105','甘范名','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3823),(3250,'201600213111','雷观昌','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3824),(3251,'201600213112','黎峻豪','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3825),(3252,'201600213118','刘冠宏','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3826),(3253,'201600213124','石宏磊','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3827),(3254,'201600213125','谭建狄','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3828),(3255,'201600213127','韦歌迪','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3829),(3256,'201600213133','朱华庭','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3830),(3257,'201600213134','朱首彰','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3831),(3258,'201600213144','蒙俐宏','','','本科','4','2016-09-01','2016','201700202',NULL,4,17,3832),(3259,'201600213202','陈德培','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3833),(3260,'201600213203','陈永任','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3834),(3261,'201600213205','黄安','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3835),(3262,'201600213206','黄鸿庭','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3836),(3263,'201600213207','黄鸿羲','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3837),(3264,'201600213208','黄家理','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3838),(3265,'201600213209','黄培彬','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3839),(3266,'201600213210','黄贻通','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3840),(3267,'201600213211','雷文浩','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3841),(3268,'201600213212','李家聪','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3842),(3269,'201600213213','李汶霖','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3843),(3270,'201600213214','罗明贵','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3844),(3271,'201600213215','马欣廷','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3845),(3272,'201600213216','莫运平','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3846),(3273,'201600213217','农建泽','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3847),(3274,'201600213218','潘辉','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3848),(3275,'201600213219','潘琦','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3849),(3276,'201600213220','宋楚皓','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3850),(3277,'201600213221','苏家卫','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3851),(3278,'201600213222','苏三明','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3852),(3279,'201600213223','苏祖豪','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3853),(3280,'201600213224','孙广进','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3854),(3281,'201600213225','谭霁航','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3855),(3282,'201600213226','韦冠宇','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3856),(3283,'201600213227','吴光辉','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3857),(3284,'201600213228','吴尚彬','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3858),(3285,'201600213229','严荣','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3859),(3286,'201600213230','叶炜','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3860),(3287,'201600213232','钟将','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3861),(3288,'201600213233','周孔波','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3862),(3289,'201600213235','陈贵连','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3863),(3290,'201600213236','陈艳艳','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3864),(3291,'201600213237','黄靖舒','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3865),(3292,'201600213238','黄柳条','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3866),(3293,'201600213239','黄小梅','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3867),(3294,'201600213240','江锦琦','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3868),(3295,'201600213241','蓝金董','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3869),(3296,'201600213243','梁小英','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3870),(3297,'201600213244','廖小兰','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3871),(3298,'201600213245','吕江','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3872),(3299,'201600213246','蒙丹','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3873),(3300,'201600213247','莫佩凤','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3874),(3301,'201600213248','覃萍','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3875),(3302,'201600213249','覃香群','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3876),(3303,'201600213250','韦露沐','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3877),(3304,'201600213254','赵春艳','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3878),(3305,'201600213255','钟佳萍','','','本科','4','2016-09-01','2016','201700202',NULL,4,18,3879),(3306,'201600208101','陈巨洁','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3880),(3307,'201600208102','陈龙','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3881),(3308,'201600208103','邓彬胜','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3882),(3309,'201600208105','黄智中','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3883),(3310,'201600208106','蒋邦雄','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3884),(3311,'201600208108','李炳志','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3885),(3312,'201600208109','李宏伟','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3886),(3313,'201600208112','李杨','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3887),(3314,'201600208113','李造','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3888),(3315,'201600208114','林家健','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3889),(3316,'201600208115','凌钦华','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3890),(3317,'201600208118','潘宸','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3891),(3318,'201600208119','容宇轩','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3892),(3319,'201600208120','沈喜龙','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3893),(3320,'201600208121','司开元','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3894),(3321,'201600208123','汪志明','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3895),(3322,'201600208124','王梓能','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3896),(3323,'201600208126','温德尊','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3897),(3324,'201600208128','谢常繁','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3898),(3325,'201600208130','杨夕锋','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3899),(3326,'201600208131','周雯才','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3900),(3327,'201600208132','曾波','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3901),(3328,'201600208133','和雪英','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3902),(3329,'201600208134','黄佩珍','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3903),(3330,'201600208135','黄滢','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3904),(3331,'201600208136','蒋玉蓉','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3905),(3332,'201600208137','黎军君','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3906),(3333,'201600208138','李碧静','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3907),(3334,'201600208139','莫小丽','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3908),(3335,'201600208140','欧榕坤','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3909),(3336,'201600208141','冉带素','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3910),(3337,'201600208142','谭月莲','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3911),(3338,'201600208143','王娜','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3912),(3339,'201600208144','王研','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3913),(3340,'201600208145','温晓怡','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3914),(3341,'201600208146','吴丹茗','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3915),(3342,'201600208147','杨吉','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3916),(3343,'201600208148','张翠玲','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3917),(3344,'201600208149','张楠','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3918),(3345,'201600208150','张旺珍','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3919),(3346,'201600208151','周丽鲜','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,3920),(3347,'201600208213','刘上剑','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3921),(3348,'201600208225','孙艺','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3922),(3349,'201600208236','李美琦','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3923),(3350,'201600208207','蓝福','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3924),(3351,'201600208209','李家荣','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3925),(3352,'201600208217','骆世嘉','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3926),(3353,'201600208223','司晓硕','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3927),(3354,'201600208203','董有宏','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3928),(3355,'201600208247‘','吴丽丽','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3929),(3356,'201600208208‘','李锋','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3930),(3357,'201600208249’','张露丹','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3931),(3358,'201600208246’','王惠','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3932),(3359,'201600208249','张露丹','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3933),(3360,'201600208229‘','颜阳','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3934),(3361,'201600208251’','曾小婷','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3935),(3362,'201600208242‘','潘杏','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3936),(3363,'201600208234’','程秀英','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3937),(3364,'201600208224‘','宋玉富','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3938),(3365,'201600208239’','廖梦青','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3939),(3366,'201600208219','慕荣辉','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3940),(3367,'201600208215','卢永贵','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3941),(3368,'201600208216','罗浩铨','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3942),(3369,'201600208244','孙少喜','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3943),(3370,'201600208231','叶城廷','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3944),(3371,'201600208250','朱美林','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3945),(3372,'201600208232','周易源','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3946),(3373,'201600208241','罗贺','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3947),(3374,'201600208233','陈冬霞','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3948),(3375,'201600208237','李逸','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3949),(3376,'201600208230','杨长官','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3950),(3377,'201600208227','王洪升','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3951),(3378,'20160020820\'1','陈胜','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3952),(3379,'201600208251','曾小婷','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3953),(3380,'201600208240’','林远秋','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3954),(3381,'201600208238','梁容','','','本科','4','2016-09-01','2016','201700202',NULL,4,20,3955),(3382,'201500208307','郭家欣','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3956),(3383,'201500208410','廖家鹏','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3957),(3384,'201600208301','曹鹏轩','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3958),(3385,'201600208303','陈天艺','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3959),(3386,'201600208304','丁程强','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3960),(3387,'201600208305','董思源','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3961),(3388,'201600208307','黄启东','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3962),(3389,'201600208308','黄庆港','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3963),(3390,'201600208309','黄世创','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3964),(3391,'201600208310','黄祖彬','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3965),(3392,'201600208312','李国严','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3966),(3393,'201600208313','梁艺耀','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3967),(3394,'201600208314','廖富光','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3968),(3395,'201600208315','刘春福','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3969),(3396,'201600208316','陆建宁','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3970),(3397,'201600208318','潘沛杰','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3971),(3398,'201600208320','秦松','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3972),(3399,'201600208321','阮春彪','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3973),(3400,'201600208322','覃悦','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3974),(3401,'201600208328','叶国标','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3975),(3402,'201600208329','叶子胜','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3976),(3403,'201600208330','张恒','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3977),(3404,'201600208331','张积建','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3978),(3405,'201600208334','陈宣媛','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3979),(3406,'201600208335','陈怡','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3980),(3407,'201600208336','陈紫丽','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3981),(3408,'201600208337','方丽萍','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3982),(3409,'201600208338','孔丽玲','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3983),(3410,'201600208339','李静','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3984),(3411,'201600208340','刘海帆','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3985),(3412,'201600208341','刘嘉嘉','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3986),(3413,'201600208342','刘丽蓉','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3987),(3414,'201600208343','刘禹含','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3988),(3415,'201600208344','罗颖玉','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3989),(3416,'201600208345','盘美英','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3990),(3417,'201600208346','覃荔靖','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3991),(3418,'201600208347','唐纤蓥','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3992),(3419,'201600208348','王菁颖','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3993),(3420,'201600208350','张晓君','','','本科','4','2016-09-01','2016','201700202',NULL,4,21,3994),(3421,'201600208401','曹宸玮','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,3995),(3422,'201600208402','陈震洺','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,3996),(3423,'201600208403','邓彦松','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,3997),(3424,'201600208404','范书豪','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,3998),(3425,'201600208405','高航涛','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,3999),(3426,'201600208406','韩鹏程','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4000),(3427,'201600208408','李海华','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4001),(3428,'201600208409','李善念','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4002),(3429,'201600208410','李天赐','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4003),(3430,'201600208412','梁海超','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4004),(3431,'201600208413','廖树杰','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4005),(3432,'201600208414','凌朝政','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4006),(3433,'201600208415','刘柏池','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4007),(3434,'201600208416','陆正荣','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4008),(3435,'201600208417','莫东林','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4009),(3436,'201600208418','潘登','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4010),(3437,'201600208419','阮民涛','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4011),(3438,'201600208420','覃威茗','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4012),(3439,'201600208422','唐昊','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4013),(3440,'201600208423','唐奕明','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4014),(3441,'201600208424','唐志晖','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4015),(3442,'201600208425','韦永共','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4016),(3443,'201600208426','魏祥','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4017),(3444,'201600208427','吴思敏','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4018),(3445,'201600208428','杨健铭','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4019),(3446,'201600208429','杨顺海','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4020),(3447,'201600208430','郑宣贵','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4021),(3448,'201600208431','周杰威','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4022),(3449,'201600208433','陈秋梅','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4023),(3450,'201600208435','池小媛','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4024),(3451,'201600208436','丁婉朔','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4025),(3452,'201600208437','黎艳芳','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4026),(3453,'201600208438','李春梅','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4027),(3454,'201600208439','梁海玲','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4028),(3455,'201600208440','梁静华','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4029),(3456,'201600208441','刘家倩','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4030),(3457,'201600208442','刘玉霜','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4031),(3458,'201600208444','商文鑫','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4032),(3459,'201600208445','盛晓洁','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4033),(3460,'201600208446','谈茵茵','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4034),(3461,'201600208447','覃丽菊','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4035),(3462,'201600208451','张中怡','','','本科','4','2016-09-01','2016','201700202',NULL,4,22,4036),(3463,'201601902132','黄妹','','','本科','4','2016-09-01','2016','201700202',NULL,4,19,4037);
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
) ENGINE=InnoDB AUTO_INCREMENT=463 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_teacher`
--

LOCK TABLES `sys_teacher` WRITE;
/*!40000 ALTER TABLE `sys_teacher` DISABLE KEYS */;
INSERT INTO `sys_teacher` VALUES (201,'admin','admin','201700201',NULL,NULL,213,'24',772),(411,'17049','汪梅','201700202',9,13,214,NULL,4038),(412,'17020','李健','201700202',9,13,213,NULL,4039),(413,'17011','陈佳','201700202',9,13,214,NULL,4040),(414,'17022','黄洁明','201700202',9,13,213,NULL,4041),(415,'27013','梁朝湘','201700202',9,13,214,NULL,4042),(416,'17064','吴芳','201700202',9,13,213,NULL,4043),(417,'17018','代丽娴','201700202',9,6,213,NULL,4044),(418,'07003','黄宏本','201700202',9,6,214,NULL,4045),(419,'17037','梁菁','201700202',9,6,213,NULL,4046),(420,'31047','李宗妮','201700202',9,6,213,NULL,4047),(421,'17202','农健','201700202',9,6,217,NULL,4048),(422,'17132','卿海军','201700202',9,6,213,NULL,4049),(423,'17039','陈聪','201700202',9,6,214,NULL,4050),(424,'17038','卢雪燕','201700202',9,6,214,NULL,4051),(425,'17133','黄寄洪','201700202',9,6,216,NULL,4052),(426,'17213','郑明','201700202',9,6,219,NULL,4053),(427,'21110','张东月','201700202',8,4,213,NULL,4054),(428,'31046','何希','201700202',8,4,213,NULL,4055),(429,'17041','莫智懿','201700202',8,4,216,NULL,4056),(430,'17025','吴炎桃','201700202',8,4,213,NULL,4057),(431,'17221','陈悦','201700202',8,4,213,NULL,4058),(432,'17134','冀肖榆','201700202',8,4,214,NULL,4059),(433,'27105','许传本','201700202',8,4,212,NULL,4060),(434,'17224','朱肖颖','201700202',8,4,213,NULL,4061),(435,'17074','庞光垚','201700202',8,4,213,NULL,4062),(436,'17701','蒲保兴','201700202',8,4,215,NULL,4063),(437,'21016','覃学文','201700202',10,9,214,NULL,4064),(438,'30011','赵春茹','201700202',10,9,214,NULL,4065),(439,'21022','覃桂茳','201700202',10,9,213,NULL,4066),(440,'21011','刘敏捷','201700202',10,9,214,NULL,4067),(441,'21054','杨甲山','201700202',10,9,215,NULL,4068),(442,'21012','黄劲','201700202',10,9,213,NULL,4069),(443,'28009','胡庆席','201700202',10,9,213,NULL,4070),(444,'21005','李连芬','201700202',10,9,213,NULL,4071),(445,'21014','石向东','201700202',10,9,214,NULL,4072),(446,'30013','涂井先','201700202',10,9,213,NULL,4073),(447,'06003','陈红','201700202',10,9,215,NULL,4074),(448,'21018','李志军','201700202',10,9,214,NULL,4075),(449,'21017','许成章','201700202',10,9,214,NULL,4076),(450,'23098','吴飞燕','201700202',9,13,213,NULL,4077),(451,'17010','贺杰','201700202',9,13,215,NULL,4078),(452,'17044','宫海晓','201700202',9,13,213,NULL,4079),(453,'17062','邸臻炜','201700202',9,13,213,NULL,4080),(454,'17031','李翊','201700202',9,13,213,NULL,4081),(455,'17033','黄筱佟','201700202',9,13,213,NULL,4082),(456,'17214','杨秋慧','201700202',9,13,213,NULL,4083),(457,'17046','何高明','201700202',4,5,214,NULL,4084),(458,'17027','蒋琳琼','201700202',4,5,214,NULL,4085),(459,'17019','李海英','201700202',4,5,213,NULL,4086),(460,'17021','李军','201700202',4,5,218,NULL,4087),(461,'21010','苏芳','201700202',9,11,213,NULL,4088),(462,'21019','赵贤','201700202',9,11,213,NULL,4089);
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
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_technical`
--

LOCK TABLES `sys_technical` WRITE;
/*!40000 ALTER TABLE `sys_technical` DISABLE KEYS */;
INSERT INTO `sys_technical` VALUES (212,'01','助教'),(213,'02','讲师'),(214,'03','副教授'),(215,'04','教授'),(216,'05','高级工程师'),(217,'6','系统分析师'),(218,'7','高级实验师'),(219,'8','副研究员');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_book`
--

LOCK TABLES `task_book` WRITE;
/*!40000 ALTER TABLE `task_book` DISABLE KEYS */;
INSERT INTO `task_book` VALUES (1,'<p>666666666666666666</p>','<p>66666666666666666666</p>','<p>666666666666666666666</p>',3461,429,2019),(2,'<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">谈茵茵任务书</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">谈茵茵任务书</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">谈茵茵任务书</span></p>',3460,434,2019),(3,'<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">黄妹任务书</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">黄妹任务书</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">黄妹任务书</span></p>',3463,433,2019),(4,'<p><span style=\"color: rgb(62, 175, 224); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; text-indent: 2px; background-color: rgb(229, 235, 238);\">李春梅</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 20px; text-align: center;\">任务书</span></p>','<p><span style=\"color: rgb(62, 175, 224); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; text-indent: 2px; background-color: rgb(229, 235, 238);\">李春梅</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 20px; text-align: center;\">任务书</span></p>','<p><span style=\"color: rgb(62, 175, 224); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; text-indent: 2px; background-color: rgb(229, 235, 238);\">李春梅</span><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 20px; text-align: center;\">任务书</span></p>',3453,429,2019),(5,'<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">周杰威任务书</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">周杰威任务书</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">周杰威任务书</span></p>',3448,429,2019),(6,'<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">魏祥任务书1</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">魏祥任务书1</span></p>','<p><span style=\"font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; font-size: 14px;\">魏祥任务书1</span></p>',3443,434,2019);
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
INSERT INTO `teacher_directions` VALUES (1,1,431,2019),(2,5,436,2019),(3,3,435,2019),(4,4,434,2019),(5,1,425,2019),(6,1,429,2019),(7,1,432,2019);
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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_major`
--

LOCK TABLES `teacher_major` WRITE;
/*!40000 ALTER TABLE `teacher_major` DISABLE KEYS */;
INSERT INTO `teacher_major` VALUES (80,272,4,2019),(81,433,4,2019),(82,436,4,2019),(83,434,4,2019),(84,435,4,2019),(85,432,4,2019),(86,428,4,2019),(87,427,4,2019),(88,430,4,2019),(89,431,4,2019),(90,429,4,2019),(91,425,6,2019);
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
) ENGINE=InnoDB AUTO_INCREMENT=4090 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hlep`
--

LOCK TABLES `user_hlep` WRITE;
/*!40000 ALTER TABLE `user_hlep` DISABLE KEYS */;
INSERT INTO `user_hlep` VALUES (772,'admin','admin','admin','3','2017-09-30 11:31:23',NULL,'1','12','13507749831','11547830091@qq.com','/attached/userImg/CCAD0D4E-5829-4FF1-AB53-0583285F18BD_v2-7a0ed867539f2c26920568f22a50a261_hd.jpg'),(3787,'廖克裕','201400213018','201400213018','1',NULL,NULL,NULL,NULL,'15177400717','1254567951@qq.com',NULL),(3788,'邓祥鸿','201600213103','201600213103','1',NULL,NULL,NULL,NULL,'18276412829','1517497965@qq.com',NULL),(3789,'甘德品','201600213104','201600213104','1',NULL,NULL,NULL,NULL,'15277479500','1304899107@qq.com',NULL),(3790,'郭天千','201600213107','201600213107','1',NULL,NULL,NULL,NULL,'13877414921','1131615302@qq.com',NULL),(3791,'黄依顺','201600213108','201600213108','1',NULL,NULL,NULL,NULL,'13324704970','1770219081@qq.com',NULL),(3792,'黄源松','201600213109','201600213109','1',NULL,NULL,NULL,NULL,'13877419221','420844683@qq.com',NULL),(3793,'李春霖','201600213113','201600213113','1',NULL,NULL,NULL,NULL,'13132756595','84345886@qq.com',NULL),(3794,'李汉彬','201600213114','201600213114','1',NULL,NULL,NULL,NULL,'15778604464','906482416@qq.com',NULL),(3795,'李宗森','201600213115','201600213115','1',NULL,NULL,NULL,NULL,'18277415630','1247502122@qq.com',NULL),(3796,'梁林','201600213116','201600213116','1',NULL,NULL,NULL,NULL,'18878515030','506457026@qq.com',NULL),(3797,'梁稳','201600213117','201600213117','1',NULL,NULL,NULL,NULL,'18377873304','2711127630@qq.com',NULL),(3798,'刘淋逸','201600213119','201600213119','1',NULL,NULL,NULL,NULL,'14796063875','1394703577@qq.com',NULL),(3799,'龙永亮','201600213120','201600213120','1',NULL,NULL,NULL,NULL,'18577429460','1436036517@qq.com',NULL),(3800,'卢山盟','201600213122','201600213122','1',NULL,NULL,NULL,NULL,'18277418951','2041905095@qq.com',NULL),(3801,'秦曼人','201600213123','201600213123','1',NULL,NULL,NULL,NULL,'15277416531','913142189@qq.com',NULL),(3802,'王文滔','201600213126','201600213126','1',NULL,NULL,NULL,NULL,'18276410131','584373417@qq.com',NULL),(3803,'吴映辉','201600213128','201600213128','1',NULL,NULL,NULL,NULL,'13977419796','2485167587@qq.com',NULL),(3804,'谢惟朋','201600213130','201600213130','1',NULL,NULL,NULL,NULL,'18775045602/18269676686','775622366@qq.com',NULL),(3805,'周林福','201600213132','201600213132','1',NULL,NULL,NULL,NULL,'18775017243','2642951961@qq.com',NULL),(3806,'陈孔妙','201600213135','201600213135','1',NULL,NULL,NULL,NULL,'15078121216','2558774873@qq.com',NULL),(3807,'甘丽','201600213136','201600213136','1',NULL,NULL,NULL,NULL,'15777423312','1812742693@qq.com',NULL),(3808,'何柳花','201600213137','201600213137','1',NULL,NULL,NULL,NULL,'18778244153','2556398743@qq.com',NULL),(3809,'黄叶英','201600213138','201600213138','1',NULL,NULL,NULL,NULL,'18278451613','1592257235@qq.com',NULL),(3810,'黄玉花','201600213139','201600213139','1',NULL,NULL,NULL,NULL,'18878463792','2649722558@qq.com',NULL),(3811,'李桂兰','201600213140','201600213140','1',NULL,NULL,NULL,NULL,'15207840793','2561719281@qq.com',NULL),(3812,'李苑瑜','201600213141','201600213141','1',NULL,NULL,NULL,NULL,'18977460345','850611863@qq.com',NULL),(3813,'陆南梅','201600213142','201600213142','1',NULL,NULL,NULL,NULL,'18977418562','1945401687@qq.com',NULL),(3814,'潘丽梅','201600213145','201600213145','1',NULL,NULL,NULL,NULL,'18878461912','1844570685@qq.com',NULL),(3815,'唐艳妮','201600213148','201600213148','1',NULL,NULL,NULL,NULL,'18269197327','2662954009@qq.com',NULL),(3816,'韦燕琳','201600213150','201600213150','1',NULL,NULL,NULL,NULL,'18276417276','1425212042@qq.com',NULL),(3817,'魏钰','201600213151','201600213151','1',NULL,NULL,NULL,NULL,'13557348039','1050332581@qq.com',NULL),(3818,'肖雨君','201600213152','201600213152','1',NULL,NULL,NULL,NULL,'13649424680','978613018@qq.com',NULL),(3819,'杨冬雪','201600213153','201600213153','1',NULL,NULL,NULL,NULL,'17754583469','18176132473@qq.com',NULL),(3820,'杨银燕','201600213154','201600213154','1',NULL,NULL,NULL,NULL,'18376952971','18376952971@163.com',NULL),(3821,'游春兰 ','201600213155','201600213155','1',NULL,NULL,NULL,NULL,'18897517253','2731938138@qq.com',NULL),(3822,'陈炳成','201600213101','201600213101','1',NULL,NULL,NULL,NULL,'','',NULL),(3823,'甘范名','201600213105','201600213105','1',NULL,NULL,NULL,NULL,'','',NULL),(3824,'雷观昌','201600213111','201600213111','1',NULL,NULL,NULL,NULL,'','',NULL),(3825,'黎峻豪','201600213112','201600213112','1',NULL,NULL,NULL,NULL,'','',NULL),(3826,'刘冠宏','201600213118','201600213118','1',NULL,NULL,NULL,NULL,'','',NULL),(3827,'石宏磊','201600213124','201600213124','1',NULL,NULL,NULL,NULL,'','',NULL),(3828,'谭建狄','201600213125','201600213125','1',NULL,NULL,NULL,NULL,'','',NULL),(3829,'韦歌迪','201600213127','201600213127','1',NULL,NULL,NULL,NULL,'','',NULL),(3830,'朱华庭','201600213133','201600213133','1',NULL,NULL,NULL,NULL,'','',NULL),(3831,'朱首彰','201600213134','201600213134','1',NULL,NULL,NULL,NULL,'','',NULL),(3832,'蒙俐宏','201600213144','201600213144','1',NULL,NULL,NULL,NULL,'','',NULL),(3833,'陈德培','201600213202','201600213202','1',NULL,NULL,NULL,NULL,'18894637764','1622418364@qq.com',NULL),(3834,'陈永任','201600213203','201600213203','1',NULL,NULL,NULL,NULL,'18176454130','1013184020@qq.com',NULL),(3835,'黄安','201600213205','201600213205','1',NULL,NULL,NULL,NULL,'13471402595','1109231162@QQ.com',NULL),(3836,'黄鸿庭','201600213206','201600213206','1',NULL,NULL,NULL,NULL,'13471402595','1796098468@qq.com',NULL),(3837,'黄鸿羲','201600213207','201600213207','1',NULL,NULL,NULL,NULL,'18577407985','493798121@qq.com',NULL),(3838,'黄家理','201600213208','201600213208','1',NULL,NULL,NULL,NULL,'15277571323','1359478672@qq.com',NULL),(3839,'黄培彬','201600213209','201600213209','1',NULL,NULL,NULL,NULL,'13471402595','642229776@qq.com',NULL),(3840,'黄贻通','201600213210','201600213210','1',NULL,NULL,NULL,NULL,'18176515068','2515830617@qq.com',NULL),(3841,'雷文浩','201600213211','201600213211','1',NULL,NULL,NULL,NULL,'18077511428','993328357@qq.com',NULL),(3842,'李家聪','201600213212','201600213212','1',NULL,NULL,NULL,NULL,'18277511930','2195561242@qq.com',NULL),(3843,'李汶霖','201600213213','201600213213','1',NULL,NULL,NULL,NULL,'15278255913','1542897742@qq.com',NULL),(3844,'罗明贵','201600213214','201600213214','1',NULL,NULL,NULL,NULL,'13471402595','1035465851@qq.com',NULL),(3845,'马欣廷','201600213215','201600213215','1',NULL,NULL,NULL,NULL,'18207702336','115722537632@qq.com',NULL),(3846,'莫运平','201600213216','201600213216','1',NULL,NULL,NULL,NULL,'18878463755','583311356@qq.com',NULL),(3847,'农建泽','201600213217','201600213217','1',NULL,NULL,NULL,NULL,'13471402595','6011658331@qq.com',NULL),(3848,'潘辉','201600213218','201600213218','1',NULL,NULL,NULL,NULL,'18777843577','1905270669@qq.com',NULL),(3849,'潘琦','201600213219','201600213219','1',NULL,NULL,NULL,NULL,'13277796407','747685879@qq.com',NULL),(3850,'宋楚皓','201600213220','201600213220','1',NULL,NULL,NULL,NULL,'15777441585','2728659243@qq.com',NULL),(3851,'苏家卫','201600213221','201600213221','1',NULL,NULL,NULL,NULL,'13471402595','1732486935@qq.com',NULL),(3852,'苏三明','201600213222','201600213222','1',NULL,NULL,NULL,NULL,'18677546979','500607502@qq.com',NULL),(3853,'苏祖豪','201600213223','201600213223','1',NULL,NULL,NULL,NULL,'18177404941','1137544509@qq.com',NULL),(3854,'孙广进','201600213224','201600213224','1',NULL,NULL,NULL,NULL,'13471402595','842936250@qq.com',NULL),(3855,'谭霁航','201600213225','201600213225','1',NULL,NULL,NULL,NULL,'18007809821','614203787@qq.com',NULL),(3856,'韦冠宇','201600213226','201600213226','1',NULL,NULL,NULL,NULL,'13507743376','296712296@qq.com',NULL),(3857,'吴光辉','201600213227','201600213227','1',NULL,NULL,NULL,NULL,'18377425309','1161699226@qq.com',NULL),(3858,'吴尚彬','201600213228','201600213228','1',NULL,NULL,NULL,NULL,'18177405347','100504010@qq.com',NULL),(3859,'严荣','201600213229','201600213229','1',NULL,NULL,NULL,NULL,'15778022959','185834022@qq.com',NULL),(3860,'叶炜','201600213230','201600213230','1',NULL,NULL,NULL,NULL,'14795413020','983469420@qq.com',NULL),(3861,'钟将','201600213232','201600213232','1',NULL,NULL,NULL,NULL,'13471005219','1349280985@qq.com',NULL),(3862,'周孔波','201600213233','201600213233','1',NULL,NULL,NULL,NULL,'13471402595','1515964468@qq.com',NULL),(3863,'陈贵连','201600213235','201600213235','1',NULL,NULL,NULL,NULL,'18878277244','1487812572@qq.com',NULL),(3864,'陈艳艳','201600213236','201600213236','1',NULL,NULL,NULL,NULL,'18377848554','1439148635@qq.com',NULL),(3865,'黄靖舒','201600213237','201600213237','1',NULL,NULL,NULL,NULL,'13207741284','1097838588@qq.com',NULL),(3866,'黄柳条','201600213238','201600213238','1',NULL,NULL,NULL,NULL,'18207747535','1993553621@qq.com',NULL),(3867,'黄小梅','201600213239','201600213239','1',NULL,NULL,NULL,NULL,'18278010804','1713668543@qq.com\n',NULL),(3868,'江锦琦','201600213240','201600213240','1',NULL,NULL,NULL,NULL,'15177689773','904407078@qq.com',NULL),(3869,'蓝金董','201600213241','201600213241','1',NULL,NULL,NULL,NULL,'17878416736','1946541686@qq.com',NULL),(3870,'梁小英','201600213243','201600213243','1',NULL,NULL,NULL,NULL,'15078431809','1799939949@qq.com',NULL),(3871,'廖小兰','201600213244','201600213244','1',NULL,NULL,NULL,NULL,'14777147212','1910994973@qq.com',NULL),(3872,'吕江','201600213245','201600213245','1',NULL,NULL,NULL,NULL,'18707741877','1500411272@qq.com',NULL),(3873,'蒙丹','201600213246','201600213246','1',NULL,NULL,NULL,NULL,'18207748401','1501429622@qq.com',NULL),(3874,'莫佩凤','201600213247','201600213247','1',NULL,NULL,NULL,NULL,'13471967794','710148944@qq.com',NULL),(3875,'覃萍','201600213248','201600213248','1',NULL,NULL,NULL,NULL,'18176917595','2233897489@qq.com',NULL),(3876,'覃香群','201600213249','201600213249','1',NULL,NULL,NULL,NULL,'18177854694','173608729@qq.com',NULL),(3877,'韦露沐','201600213250','201600213250','1',NULL,NULL,NULL,NULL,'18376487415','1584221714@qq.com',NULL),(3878,'赵春艳','201600213254','201600213254','1',NULL,NULL,NULL,NULL,'18610629843','914844370@qq.com\n',NULL),(3879,'钟佳萍','201600213255','201600213255','1',NULL,NULL,NULL,NULL,'13768128054','1051717348@qq.com',NULL),(3880,'陈巨洁','201600208101','201600208101','1',NULL,NULL,NULL,NULL,'13558240759','1024778645@qq.com',NULL),(3881,'陈龙','201600208102','201600208102','1',NULL,NULL,NULL,NULL,'13324881646','1321570719@qq.com',NULL),(3882,'邓彬胜','201600208103','201600208103','1',NULL,NULL,NULL,NULL,'17607748805','1441855393@qq.com',NULL),(3883,'黄智中','201600208105','201600208105','1',NULL,NULL,NULL,NULL,'18977055230','2367358345@qq.com',NULL),(3884,'蒋邦雄','201600208106','201600208106','1',NULL,NULL,NULL,NULL,'13737370139','2240552076@qq.com',NULL),(3885,'李炳志','201600208108','201600208108','1',NULL,NULL,NULL,NULL,'18376477800','1522436861@qq.com',NULL),(3886,'李宏伟','201600208109','201600208109','1',NULL,NULL,NULL,NULL,'18587479941','1072204730@qq.com',NULL),(3887,'李杨','201600208112','201600208112','1',NULL,NULL,NULL,NULL,'18276409600','961850649@qq.com',NULL),(3888,'李造','201600208113','201600208113','1',NULL,NULL,NULL,NULL,'18577447368','1500062778@qq.com',NULL),(3889,'林家健','201600208114','201600208114','1',NULL,NULL,NULL,NULL,'15907741682','1207798810@qq.com',NULL),(3890,'凌钦华','201600208115','201600208115','1',NULL,NULL,NULL,NULL,'18577433282','1126021564@qq.com',NULL),(3891,'潘宸','201600208118','201600208118','1',NULL,NULL,NULL,NULL,'13877342926','1061656887@qq.com',NULL),(3892,'容宇轩','201600208119','201600208119','1',NULL,NULL,NULL,NULL,'18579883178','1098385902@qq.com',NULL),(3893,'沈喜龙','201600208120','201600208120','1',NULL,NULL,NULL,NULL,'15777406765','1158974225@qq.com',NULL),(3894,'司开元','201600208121','201600208121','1',NULL,NULL,NULL,NULL,'18377457520','2393599234@qq.com',NULL),(3895,'汪志明','201600208123','201600208123','1',NULL,NULL,NULL,NULL,'15877029632','2247786052@qq.com',NULL),(3896,'王梓能','201600208124','201600208124','1',NULL,NULL,NULL,NULL,'15188180515','1825178723@qq.com',NULL),(3897,'温德尊','201600208126','201600208126','1',NULL,NULL,NULL,NULL,'18174124169','798195570@qq.com',NULL),(3898,'谢常繁','201600208128','201600208128','1',NULL,NULL,NULL,NULL,'18587483684','739748823@qq.com',NULL),(3899,'杨夕锋','201600208130','201600208130','1',NULL,NULL,NULL,NULL,'18078067815','1453229971@qq.com',NULL),(3900,'周雯才','201600208131','201600208131','1',NULL,NULL,NULL,NULL,'18977179408','1019931575@qq.com',NULL),(3901,'曾波','201600208132','201600208132','1',NULL,NULL,NULL,NULL,'13649448226','2209077910@qq.com',NULL),(3902,'和雪英','201600208133','201600208133','1',NULL,NULL,NULL,NULL,'13627744623','2104513329@qq.com',NULL),(3903,'黄佩珍','201600208134','201600208134','1',NULL,NULL,NULL,NULL,'18587489489','1807896298@qq.com',NULL),(3904,'黄滢','201600208135','201600208135','1',NULL,NULL,NULL,NULL,'19976304091','961258946@qq.com',NULL),(3905,'蒋玉蓉','201600208136','201600208136','1',NULL,NULL,NULL,NULL,'15331674002','2338664557@qq.com',NULL),(3906,'黎军君','201600208137','201600208137','1',NULL,NULL,NULL,NULL,'18278051926','1152097113@qq.com',NULL),(3907,'李碧静','201600208138','201600208138','1',NULL,NULL,NULL,NULL,'15777328087','2396431127@qq.com',NULL),(3908,'莫小丽','201600208139','201600208139','1',NULL,NULL,NULL,NULL,'15778691237','1439481102@qq.com',NULL),(3909,'欧榕坤','201600208140','201600208140','1',NULL,NULL,NULL,NULL,'14795291929','1843216475@qq.com',NULL),(3910,'冉带素','201600208141','201600208141','1',NULL,NULL,NULL,NULL,'18579881451','1771018632@qq.com',NULL),(3911,'谭月莲','201600208142','201600208142','1',NULL,NULL,NULL,NULL,'15078111373','458387307@qq.com',NULL),(3912,'王娜','201600208143','201600208143','1',NULL,NULL,NULL,NULL,'18172501857','1832968200@qq.com',NULL),(3913,'王研','201600208144','201600208144','1',NULL,NULL,NULL,NULL,'14747509025','1479610934@qq.com',NULL),(3914,'温晓怡','201600208145','201600208145','1',NULL,NULL,NULL,NULL,'18577409465','1164037257@qq.com',NULL),(3915,'吴丹茗','201600208146','201600208146','1',NULL,NULL,NULL,NULL,'19976304147','1402131129@qq.com',NULL),(3916,'杨吉','201600208147','201600208147','1',NULL,NULL,NULL,NULL,'18577423112','1311861142@qq.com',NULL),(3917,'张翠玲','201600208148','201600208148','1',NULL,NULL,NULL,NULL,'15507744515','1763062531@qq.com',NULL),(3918,'张楠','201600208149','201600208149','1',NULL,NULL,NULL,NULL,'18577421040','1003405874@qq.com',NULL),(3919,'张旺珍','201600208150','201600208150','1',NULL,NULL,NULL,NULL,'19976304023','2596795433@qq.com',NULL),(3920,'周丽鲜','201600208151','201600208151','1',NULL,NULL,NULL,NULL,'19976304187','3188316741@qq.com',NULL),(3921,'刘上剑','201600208213','201600208213','1',NULL,NULL,NULL,NULL,'18269446621','863707090@qq.com',NULL),(3922,'孙艺','201600208225','201600208225','1',NULL,NULL,NULL,NULL,'18276417233','1181823629@qq.com',NULL),(3923,'李美琦','201600208236','201600208236','1',NULL,NULL,NULL,NULL,'13507896865','563732137@qq.com',NULL),(3924,'蓝福','201600208207','201600208207','1',NULL,NULL,NULL,NULL,'14796234245','936063161@qq.com',NULL),(3925,'李家荣','201600208209','201600208209','1',NULL,NULL,NULL,NULL,'18276438252','1203759782@qq.com',NULL),(3926,'骆世嘉','201600208217','201600208217','1',NULL,NULL,NULL,NULL,'18177406354','1130459793@qq.com',NULL),(3927,'司晓硕','201600208223','201600208223','1',NULL,NULL,NULL,NULL,'18587480564','1075662307@qq.com',NULL),(3928,'董有宏','201600208203','201600208203','1',NULL,NULL,NULL,NULL,'18577403934','577609286@qq.com',NULL),(3929,'吴丽丽','201600208247‘','201600208247‘','1',NULL,NULL,NULL,NULL,'18529780941','1838830412@qq.com',NULL),(3930,'李锋','201600208208‘','201600208208‘','1',NULL,NULL,NULL,NULL,'15878814272','8239446@qq.com',NULL),(3931,'张露丹','201600208249’','201600208249’','1',NULL,NULL,NULL,NULL,'18579886479','1972215027@qq.com',NULL),(3932,'王惠','201600208246’','201600208246’','1',NULL,NULL,NULL,NULL,'18707799780','2015045336@qq.com',NULL),(3933,'张露丹','201600208249','201600208249','1',NULL,NULL,NULL,NULL,'18579886479','1972215027@qq.com',NULL),(3934,'颜阳','201600208229‘','201600208229‘','1',NULL,NULL,NULL,NULL,'18277419479','1378116617@qq.com',NULL),(3935,'曾小婷','201600208251’','201600208251’','1',NULL,NULL,NULL,NULL,'13117749210','1519107459@qq.com',NULL),(3936,'潘杏','201600208242‘','201600208242‘','1',NULL,NULL,NULL,NULL,'15677540023','1106665834@qq.com',NULL),(3937,'程秀英','201600208234’','201600208234’','1',NULL,NULL,NULL,NULL,'15878052273','2536360208@qq.com',NULL),(3938,'宋玉富','201600208224‘','201600208224‘','1',NULL,NULL,NULL,NULL,'18776369093','1450212241@qq.com',NULL),(3939,'廖梦青','201600208239’','201600208239’','1',NULL,NULL,NULL,NULL,'18378016738','2671690670@qq.com',NULL),(3940,'慕荣辉','201600208219','201600208219','1',NULL,NULL,NULL,NULL,'18977409261','1106856533@qq.com',NULL),(3941,'卢永贵','201600208215','201600208215','1',NULL,NULL,NULL,NULL,'18776685317','2644049514@qq.com',NULL),(3942,'罗浩铨','201600208216','201600208216','1',NULL,NULL,NULL,NULL,'18577420747','1072450789@qq.com',NULL),(3943,'孙少喜','201600208244','201600208244','1',NULL,NULL,NULL,NULL,'13217747698/18898233096','1006450618@qq.com',NULL),(3944,'叶城廷','201600208231','201600208231','1',NULL,NULL,NULL,NULL,'15177436102','395344467@qq.com',NULL),(3945,'朱美林','201600208250','201600208250','1',NULL,NULL,NULL,NULL,'18894684161','1685581920@qq.com',NULL),(3946,'周易源','201600208232','201600208232','1',NULL,NULL,NULL,NULL,'15577579531','1690409889@.qq.com',NULL),(3947,'罗贺','201600208241','201600208241','1',NULL,NULL,NULL,NULL,'18589840195','956104201@qq.com',NULL),(3948,'陈冬霞','201600208233','201600208233','1',NULL,NULL,NULL,NULL,'18978489484','1149682393@qq.com',NULL),(3949,'李逸','201600208237','201600208237','1',NULL,NULL,NULL,NULL,'18208408054','852561735@qq.com',NULL),(3950,'杨长官','201600208230','201600208230','1',NULL,NULL,NULL,NULL,'13557747691','1785868089@qq.com',NULL),(3951,'王洪升','201600208227','201600208227','1',NULL,NULL,NULL,NULL,'18077453538','2502008032@qq.com',NULL),(3952,'陈胜','20160020820\'1','20160020820\'1','1',NULL,NULL,NULL,NULL,'19914987067','472010669@qq.com ',NULL),(3953,'曾小婷','201600208251','201600208251','1',NULL,NULL,NULL,NULL,'13117749210','1519107459@qq.com',NULL),(3954,'林远秋','201600208240’','201600208240’','1',NULL,NULL,NULL,NULL,'13026947596','1577946543@qq.com',NULL),(3955,'梁容','201600208238','201600208238','1',NULL,NULL,NULL,NULL,'15878059375','760718814@qq.com',NULL),(3956,'郭家欣','201500208307','201500208307','1',NULL,NULL,NULL,NULL,'18878578004','1272844493@qq.com',NULL),(3957,'廖家鹏','201500208410','201500208410','1',NULL,NULL,NULL,NULL,'15717744021','1481537845@qq.com',NULL),(3958,'曹鹏轩','201600208301','201600208301','1',NULL,NULL,NULL,NULL,'15777406707','1139912591@qq.com',NULL),(3959,'陈天艺','201600208303','201600208303','1',NULL,NULL,NULL,NULL,'13878498531','1061318901@qq.com',NULL),(3960,'丁程强','201600208304','201600208304','1',NULL,NULL,NULL,NULL,'18277480079','1009445881@qq.com',NULL),(3961,'董思源','201600208305','201600208305','1',NULL,NULL,NULL,NULL,'18290124378','1370250496@qq.com',NULL),(3962,'黄启东','201600208307','201600208307','1',NULL,NULL,NULL,NULL,'18278959030','huangqidong2013@126.com',NULL),(3963,'黄庆港','201600208308','201600208308','1',NULL,NULL,NULL,NULL,'15278359554','a9062058182qq.com@qq.com',NULL),(3964,'黄世创','201600208309','201600208309','1',NULL,NULL,NULL,NULL,'13457176612','1341630073@qq.com',NULL),(3965,'黄祖彬','201600208310','201600208310','1',NULL,NULL,NULL,NULL,'15777588404','1730078542@qq.com',NULL),(3966,'李国严','201600208312','201600208312','1',NULL,NULL,NULL,NULL,'18815822941','2645154326@qq.com',NULL),(3967,'梁艺耀','201600208313','201600208313','1',NULL,NULL,NULL,NULL,'18577406440','1796689433@qq.com',NULL),(3968,'廖富光','201600208314','201600208314','1',NULL,NULL,NULL,NULL,'15077518524','1552067371@qq.com',NULL),(3969,'刘春福','201600208315','201600208315','1',NULL,NULL,NULL,NULL,'18577409493','429829320@qq.com',NULL),(3970,'陆建宁','201600208316','201600208316','1',NULL,NULL,NULL,NULL,'18277407986','2376571392@qq.com',NULL),(3971,'潘沛杰','201600208318','201600208318','1',NULL,NULL,NULL,NULL,'13878454469','979775269@qq.com',NULL),(3972,'秦松','201600208320','201600208320','1',NULL,NULL,NULL,NULL,'15295993936','1669649137@qq.com',NULL),(3973,'阮春彪','201600208321','201600208321','1',NULL,NULL,NULL,NULL,'15277916263','3096148788@qq.com',NULL),(3974,'覃悦','201600208322','201600208322','1',NULL,NULL,NULL,NULL,'19968069458','122792840@qq.com',NULL),(3975,'叶国标','201600208328','201600208328','1',NULL,NULL,NULL,NULL,'18577447845','1443372989@qq.com',NULL),(3976,'叶子胜','201600208329','201600208329','1',NULL,NULL,NULL,NULL,'18775751347','1415451651@qq.com',NULL),(3977,'张恒','201600208330','201600208330','1',NULL,NULL,NULL,NULL,'15777441007','1206366193@qq.com',NULL),(3978,'张积建','201600208331','201600208331','1',NULL,NULL,NULL,NULL,'15289533192','1213312702@qq.com',NULL),(3979,'陈宣媛','201600208334','201600208334','1',NULL,NULL,NULL,NULL,'19127333480','1093869183@qq.com',NULL),(3980,'陈怡','201600208335','201600208335','1',NULL,NULL,NULL,NULL,'18276419279','534886111@qq.com',NULL),(3981,'陈紫丽','201600208336','201600208336','1',NULL,NULL,NULL,NULL,'18587476974','969209706@qq.com',NULL),(3982,'方丽萍','201600208337','201600208337','1',NULL,NULL,NULL,NULL,'15777403561','1242649186@qq.com',NULL),(3983,'孔丽玲','201600208338','201600208338','1',NULL,NULL,NULL,NULL,'18277403327','2662675272@qq.com',NULL),(3984,'李静','201600208339','201600208339','1',NULL,NULL,NULL,NULL,'18172507886','2679324489@qq.com',NULL),(3985,'刘海帆','201600208340','201600208340','1',NULL,NULL,NULL,NULL,'18707743057','1544172087@qq.com',NULL),(3986,'刘嘉嘉','201600208341','201600208341','1',NULL,NULL,NULL,NULL,'15777403736','2916207007@qq.com',NULL),(3987,'刘丽蓉','201600208342','201600208342','1',NULL,NULL,NULL,NULL,'18276411572','1304313356@qq.com',NULL),(3988,'刘禹含','201600208343','201600208343','1',NULL,NULL,NULL,NULL,'17374843602','2099284432@qq.com',NULL),(3989,'罗颖玉','201600208344','201600208344','1',NULL,NULL,NULL,NULL,'13367750234','1392642892@qq.com',NULL),(3990,'盘美英','201600208345','201600208345','1',NULL,NULL,NULL,NULL,'18589844025','1937599815qq.com',NULL),(3991,'覃荔靖','201600208346','201600208346','1',NULL,NULL,NULL,NULL,'18276365213','2687834634@qq.com',NULL),(3992,'唐纤蓥','201600208347','201600208347','1',NULL,NULL,NULL,NULL,'15078111541','1915420178@qq.com',NULL),(3993,'王菁颖','201600208348','201600208348','1',NULL,NULL,NULL,NULL,'18777425659','1161463449@qq.com',NULL),(3994,'张晓君','201600208350','201600208350','1',NULL,NULL,NULL,NULL,'18477403502','1341910139@qq.com',NULL),(3995,'曹宸玮','201600208401','201600208401','1',NULL,NULL,NULL,NULL,'15777445267','2508042890@qq.com',NULL),(3996,'陈震洺','201600208402','201600208402','1',NULL,NULL,NULL,NULL,'18307853316','1986323702@qq.com',NULL),(3997,'邓彦松','201600208403','201600208403','1',NULL,NULL,NULL,NULL,'13877499357','1940689003@qq.com',NULL),(3998,'范书豪','201600208404','201600208404','1',NULL,NULL,NULL,NULL,'18407740954','873851622@qq.com',NULL),(3999,'高航涛','201600208405','201600208405','1',NULL,NULL,NULL,NULL,'18587484804','40890768@qq.com',NULL),(4000,'韩鹏程','201600208406','201600208406','1',NULL,NULL,NULL,NULL,'','937764586@qq.com',NULL),(4001,'李海华','201600208408','201600208408','1',NULL,NULL,NULL,NULL,'18376491975','2683794763@qq.com',NULL),(4002,'李善念','201600208409','201600208409','1',NULL,NULL,NULL,NULL,'18078067215','2467167242@qq.com',NULL),(4003,'李天赐','201600208410','201600208410','1',NULL,NULL,NULL,NULL,'18276407231','1455179754@qq.com',NULL),(4004,'梁海超','201600208412','201600208412','1',NULL,NULL,NULL,NULL,'13557041170','984631527@qq.com',NULL),(4005,'廖树杰','201600208413','201600208413','1',NULL,NULL,NULL,NULL,'13977013721','824709264@qq.com',NULL),(4006,'凌朝政','201600208414','201600208414','1',NULL,NULL,NULL,NULL,'18878522710','331551083@qq.com',NULL),(4007,'刘柏池','201600208415','201600208415','1',NULL,NULL,NULL,NULL,'','',NULL),(4008,'陆正荣','201600208416','201600208416','1',NULL,NULL,NULL,NULL,'15177066997','1606678391@qq.com',NULL),(4009,'莫东林','201600208417','201600208417','1',NULL,NULL,NULL,NULL,'18078062074','931668343@qq.com',NULL),(4010,'潘登','201600208418','201600208418','1',NULL,NULL,NULL,NULL,'13152672858','906332830@qq.com',NULL),(4011,'阮民涛','201600208419','201600208419','1',NULL,NULL,NULL,NULL,'18078060814','464330297@qq.com',NULL),(4012,'覃威茗','201600208420','201600208420','1',NULL,NULL,NULL,NULL,'15577152343','978250779@qq.com',NULL),(4013,'唐昊','201600208422','201600208422','1',NULL,NULL,NULL,NULL,'','1148132975qq.com',NULL),(4014,'唐奕明','201600208423','201600208423','1',NULL,NULL,NULL,NULL,'17878419207','270400250@qq.com',NULL),(4015,'唐志晖','201600208424','201600208424','1',NULL,NULL,NULL,NULL,'18978303784','11410253@qq.com',NULL),(4016,'韦永共','201600208425','201600208425','1',NULL,NULL,NULL,NULL,'17707747546','2595665747qq.com',NULL),(4017,'魏祥','201600208426','201600208426','1',NULL,NULL,'1',NULL,'15878408793','1349239157@qq.com',NULL),(4018,'吴思敏','201600208427','201600208427','1',NULL,NULL,NULL,NULL,'15077402099','875473947@qq.com',NULL),(4019,'杨健铭','201600208428','201600208428','1',NULL,NULL,NULL,NULL,'18707742751','1612134732@qq.com',NULL),(4020,'杨顺海','201600208429','201600208429','1',NULL,NULL,NULL,NULL,'18777427213','1359284798@qq.com',NULL),(4021,'郑宣贵','201600208430','201600208430','1',NULL,NULL,NULL,NULL,'18907803595','1059570456@qq.com',NULL),(4022,'周杰威','201600208431','201600208431','1',NULL,NULL,NULL,NULL,'15078168792','1575128896@qq.com',NULL),(4023,'陈秋梅','201600208433','201600208433','1',NULL,NULL,NULL,NULL,'18778719196','1796603504@qq.com',NULL),(4024,'池小媛','201600208435','201600208435','1',NULL,NULL,NULL,NULL,'15078165967','1301801654@qq.com',NULL),(4025,'丁婉朔','201600208436','201600208436','1',NULL,NULL,NULL,NULL,'18278089517','2585425748@qq.com',NULL),(4026,'黎艳芳','201600208437','201600208437','1',NULL,NULL,NULL,NULL,'18777436573','2366844343@qq.com',NULL),(4027,'李春梅','201600208438','201600208438','1',NULL,NULL,NULL,NULL,'15777481527','3429920932@qq.com',NULL),(4028,'梁海玲','201600208439','201600208439','1',NULL,NULL,NULL,NULL,'13457648052','1756350921@qq.com',NULL),(4029,'梁静华','201600208440','201600208440','1',NULL,NULL,NULL,NULL,'18775042758','897860418@qq.com',NULL),(4030,'刘家倩','201600208441','201600208441','1',NULL,NULL,NULL,NULL,'18777433789','2671003446@qq.com',NULL),(4031,'刘玉霜','201600208442','201600208442','1',NULL,NULL,NULL,NULL,'18178402371','1016958956@qq.com',NULL),(4032,'商文鑫','201600208444','201600208444','1',NULL,NULL,NULL,NULL,'15777400781','1316521967@qq.com',NULL),(4033,'盛晓洁','201600208445','201600208445','1',NULL,NULL,NULL,NULL,'15878079739','2635628347@qq.com',NULL),(4034,'谈茵茵','201600208446','201600208446','1',NULL,NULL,NULL,NULL,'15878427805','1586695284@qq.com',NULL),(4035,'覃丽菊','201600208447','201600208447','1',NULL,NULL,NULL,NULL,'13877495379','1279173055@qq.com',NULL),(4036,'张中怡','201600208451','201600208451','1',NULL,NULL,NULL,NULL,'13397840545','1144801348@qq.com',NULL),(4037,'黄妹','201601902132','201601902132','1',NULL,NULL,NULL,NULL,'13878019439','1332352147@qq.com',NULL),(4038,'汪梅','17049','17049','2','2019-07-31 21:42:25',NULL,'1','','','',NULL),(4039,'李健','17020','17020','2','2019-07-31 21:42:25',NULL,'0','','','',NULL),(4040,'陈佳','17011','17011','2','2019-07-31 21:42:25',NULL,'1','','','',NULL),(4041,'黄洁明','17022','17022','2','2019-07-31 21:42:25',NULL,'0','','','',NULL),(4042,'梁朝湘','27013','27013','2','2019-07-31 21:42:25',NULL,'0','','','',NULL),(4043,'吴芳','17064','17064','2','2019-07-31 21:42:25',NULL,'1','','','',NULL),(4044,'代丽娴','17018','17018','2','2019-07-31 21:42:25',NULL,'1','','','',NULL),(4045,'黄宏本','07003','07003','2','2019-07-31 21:42:25',NULL,'0','','','',NULL),(4046,'梁菁','17037','17037','2','2019-07-31 21:42:25',NULL,'1','','','',NULL),(4047,'李宗妮','31047','31047','2','2019-07-31 21:42:25',NULL,'1','','','',NULL),(4048,'农健','17202','17202','2','2019-07-31 21:42:25',NULL,'0','','','',NULL),(4049,'卿海军','17132','17132','2','2019-07-31 21:42:25',NULL,'0','','','',NULL),(4050,'陈聪','17039','17039','2','2019-07-31 21:42:25',NULL,'0','','','',NULL),(4051,'卢雪燕','17038','17038','2','2019-07-31 21:42:25',NULL,'1','','','',NULL),(4052,'黄寄洪','17133','17133','2','2019-07-31 21:42:25',NULL,'1','','17133','',NULL),(4053,'郑明','17213','17213','2','2019-07-31 21:42:25',NULL,'0','','','',NULL),(4054,'张东月','21110','21110','2','2019-07-31 21:42:25',NULL,'0','','','',NULL),(4055,'何希','31046','31046','2','2019-07-31 21:42:25',NULL,'0','','','',NULL),(4056,'莫智懿','17041','17041','2','2019-07-31 21:42:25',NULL,'1','','17041','110',NULL),(4057,'吴炎桃','17025','17025','2','2019-07-31 21:42:25',NULL,'1','','','',NULL),(4058,'陈悦','17221','17221','2','2019-07-31 21:42:25',NULL,'0','','','',NULL),(4059,'冀肖榆','17134','17134','2','2019-07-31 21:42:25',NULL,'1','','17134','',NULL),(4060,'许传本','27105','27105','2','2019-07-31 21:42:26',NULL,'0','','','',NULL),(4061,'朱肖颖','17224','17224','2','2019-07-31 21:42:26',NULL,'1','','','',NULL),(4062,'庞光垚','17074','17074','2','2019-07-31 21:42:26',NULL,'0','','','',NULL),(4063,'蒲保兴','17701','17701','2','2019-07-31 21:42:26',NULL,'0','','','',NULL),(4064,'覃学文','21016','21016','2','2019-07-31 21:42:26',NULL,'1','','','',NULL),(4065,'赵春茹','30011','30011','2','2019-07-31 21:42:26',NULL,'1','','','',NULL),(4066,'覃桂茳','21022','21022','2','2019-07-31 21:42:26',NULL,'0','','','',NULL),(4067,'刘敏捷','21011','21011','2','2019-07-31 21:42:26',NULL,'1','','','',NULL),(4068,'杨甲山','21054','21054','2','2019-07-31 21:42:26',NULL,'0','','','',NULL),(4069,'黄劲','21012','21012','2','2019-07-31 21:42:26',NULL,'0','','','',NULL),(4070,'胡庆席','28009','28009','2','2019-07-31 21:42:26',NULL,'0','','','',NULL),(4071,'李连芬','21005','21005','2','2019-07-31 21:42:26',NULL,'1','','','',NULL),(4072,'石向东','21014','21014','2','2019-07-31 21:42:26',NULL,'0','','','',NULL),(4073,'涂井先','30013','30013','2','2019-07-31 21:42:26',NULL,'0','','','',NULL),(4074,'陈红','06003','06003','2','2019-07-31 21:42:26',NULL,'1','','','',NULL),(4075,'李志军','21018','21018','2','2019-07-31 21:42:26',NULL,'0','','','',NULL),(4076,'许成章','21017','21017','2','2019-07-31 21:42:26',NULL,'0','','','',NULL),(4077,'吴飞燕','23098','23098','2','2019-07-31 21:42:26',NULL,'1','','','',NULL),(4078,'贺杰','17010','17010','2','2019-07-31 21:42:26',NULL,'0','','','',NULL),(4079,'宫海晓','17044','17044','2','2019-07-31 21:42:26',NULL,'0','','','',NULL),(4080,'邸臻炜','17062','17062','2','2019-07-31 21:42:26',NULL,'1','','','',NULL),(4081,'李翊','17031','17031','2','2019-07-31 21:42:26',NULL,'0','','','',NULL),(4082,'黄筱佟','17033','17033','2','2019-07-31 21:42:26',NULL,'1','','','',NULL),(4083,'杨秋慧','17214','17214','2','2019-07-31 21:42:26',NULL,'1','','','',NULL),(4084,'何高明','17046','17046','2','2019-07-31 21:42:26',NULL,'0','','','',NULL),(4085,'蒋琳琼','17027','17027','2','2019-07-31 21:42:26',NULL,'1','','','',NULL),(4086,'李海英','17019','17019','2','2019-07-31 21:42:26',NULL,'1','','','',NULL),(4087,'李军','17021','17021','2','2019-07-31 21:42:27',NULL,'0','','','',NULL),(4088,'苏芳','21010','21010','2','2019-07-31 21:42:27',NULL,'1','','','',NULL),(4089,'赵贤','21019','21019','2','2019-07-31 21:42:27',NULL,'1','','','',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3318 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (344,23,772),(3013,24,3787),(3014,24,3788),(3015,24,3789),(3016,24,3790),(3017,24,3791),(3018,24,3792),(3019,24,3793),(3020,24,3794),(3021,24,3795),(3022,24,3796),(3023,24,3797),(3024,24,3798),(3025,24,3799),(3026,24,3800),(3027,24,3801),(3028,24,3802),(3029,24,3803),(3030,24,3804),(3031,24,3805),(3032,24,3806),(3033,24,3807),(3034,24,3808),(3035,24,3809),(3036,24,3810),(3037,24,3811),(3038,24,3812),(3039,24,3813),(3040,24,3814),(3041,24,3815),(3042,24,3816),(3043,24,3817),(3044,24,3818),(3045,24,3819),(3046,24,3820),(3047,24,3821),(3048,24,3822),(3049,24,3823),(3050,24,3824),(3051,24,3825),(3052,24,3826),(3053,24,3827),(3054,24,3828),(3055,24,3829),(3056,24,3830),(3057,24,3831),(3058,24,3832),(3059,24,3833),(3060,24,3834),(3061,24,3835),(3062,24,3836),(3063,24,3837),(3064,24,3838),(3065,24,3839),(3066,24,3840),(3067,24,3841),(3068,24,3842),(3069,24,3843),(3070,24,3844),(3071,24,3845),(3072,24,3846),(3073,24,3847),(3074,24,3848),(3075,24,3849),(3076,24,3850),(3077,24,3851),(3078,24,3852),(3079,24,3853),(3080,24,3854),(3081,24,3855),(3082,24,3856),(3083,24,3857),(3084,24,3858),(3085,24,3859),(3086,24,3860),(3087,24,3861),(3088,24,3862),(3089,24,3863),(3090,24,3864),(3091,24,3865),(3092,24,3866),(3093,24,3867),(3094,24,3868),(3095,24,3869),(3096,24,3870),(3097,24,3871),(3098,24,3872),(3099,24,3873),(3100,24,3874),(3101,24,3875),(3102,24,3876),(3103,24,3877),(3104,24,3878),(3105,24,3879),(3106,24,3880),(3107,24,3881),(3108,24,3882),(3109,24,3883),(3110,24,3884),(3111,24,3885),(3112,24,3886),(3113,24,3887),(3114,24,3888),(3115,24,3889),(3116,24,3890),(3117,24,3891),(3118,24,3892),(3119,24,3893),(3120,24,3894),(3121,24,3895),(3122,24,3896),(3123,24,3897),(3124,24,3898),(3125,24,3899),(3126,24,3900),(3127,24,3901),(3128,24,3902),(3129,24,3903),(3130,24,3904),(3131,24,3905),(3132,24,3906),(3133,24,3907),(3134,24,3908),(3135,24,3909),(3136,24,3910),(3137,24,3911),(3138,24,3912),(3139,24,3913),(3140,24,3914),(3141,24,3915),(3142,24,3916),(3143,24,3917),(3144,24,3918),(3145,24,3919),(3146,24,3920),(3147,24,3921),(3148,24,3922),(3149,24,3923),(3150,24,3924),(3151,24,3925),(3152,24,3926),(3153,24,3927),(3154,24,3928),(3155,24,3929),(3156,24,3930),(3157,24,3931),(3158,24,3932),(3159,24,3933),(3160,24,3934),(3161,24,3935),(3162,24,3936),(3163,24,3937),(3164,24,3938),(3165,24,3939),(3166,24,3940),(3167,24,3941),(3168,24,3942),(3169,24,3943),(3170,24,3944),(3171,24,3945),(3172,24,3946),(3173,24,3947),(3174,24,3948),(3175,24,3949),(3176,24,3950),(3177,24,3951),(3178,24,3952),(3179,24,3953),(3180,24,3954),(3181,24,3955),(3182,24,3956),(3183,24,3957),(3184,24,3958),(3185,24,3959),(3186,24,3960),(3187,24,3961),(3188,24,3962),(3189,24,3963),(3190,24,3964),(3191,24,3965),(3192,24,3966),(3193,24,3967),(3194,24,3968),(3195,24,3969),(3196,24,3970),(3197,24,3971),(3198,24,3972),(3199,24,3973),(3200,24,3974),(3201,24,3975),(3202,24,3976),(3203,24,3977),(3204,24,3978),(3205,24,3979),(3206,24,3980),(3207,24,3981),(3208,24,3982),(3209,24,3983),(3210,24,3984),(3211,24,3985),(3212,24,3986),(3213,24,3987),(3214,24,3988),(3215,24,3989),(3216,24,3990),(3217,24,3991),(3218,24,3992),(3219,24,3993),(3220,24,3994),(3221,24,3995),(3222,24,3996),(3223,24,3997),(3224,24,3998),(3225,24,3999),(3226,24,4000),(3227,24,4001),(3228,24,4002),(3229,24,4003),(3230,24,4004),(3231,24,4005),(3232,24,4006),(3233,24,4007),(3234,24,4008),(3235,24,4009),(3236,24,4010),(3237,24,4011),(3238,24,4012),(3239,24,4013),(3240,24,4014),(3241,24,4015),(3242,24,4016),(3243,24,4017),(3244,24,4018),(3245,24,4019),(3246,24,4020),(3247,24,4021),(3248,24,4022),(3249,24,4023),(3250,24,4024),(3251,24,4025),(3252,24,4026),(3253,24,4027),(3254,24,4028),(3255,24,4029),(3256,24,4030),(3257,24,4031),(3258,24,4032),(3259,24,4033),(3260,24,4034),(3261,24,4035),(3262,24,4036),(3263,24,4037),(3264,25,4038),(3265,25,4039),(3266,25,4040),(3267,25,4041),(3268,25,4042),(3269,25,4043),(3270,25,4044),(3271,25,4045),(3272,25,4046),(3273,25,4047),(3274,25,4048),(3275,25,4049),(3276,25,4050),(3277,25,4051),(3278,25,4052),(3279,25,4053),(3280,25,4054),(3281,25,4055),(3283,25,4057),(3284,25,4058),(3285,25,4059),(3286,25,4060),(3287,25,4061),(3288,25,4062),(3289,25,4063),(3290,25,4064),(3291,25,4065),(3292,25,4066),(3293,25,4067),(3294,25,4068),(3295,25,4069),(3296,25,4070),(3297,25,4071),(3298,25,4072),(3299,25,4073),(3300,25,4074),(3301,25,4075),(3302,25,4076),(3303,25,4077),(3304,25,4078),(3305,25,4079),(3306,25,4080),(3307,25,4081),(3308,25,4082),(3309,25,4083),(3310,25,4084),(3311,25,4085),(3312,25,4086),(3313,25,4087),(3314,25,4088),(3315,25,4089),(3316,25,4056),(3317,26,4056);
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

-- Dump completed on 2019-08-05 17:43:04
