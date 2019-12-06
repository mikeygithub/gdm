-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: gdm
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allot_guide`
--

LOCK TABLES `allot_guide` WRITE;
/*!40000 ALTER TABLE `allot_guide` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defense_record`
--

LOCK TABLES `defense_record` WRITE;
/*!40000 ALTER TABLE `defense_record` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_allot`
--

LOCK TABLES `group_allot` WRITE;
/*!40000 ALTER TABLE `group_allot` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_defense_direction`
--

LOCK TABLES `group_defense_direction` WRITE;
/*!40000 ALTER TABLE `group_defense_direction` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_student`
--

LOCK TABLES `group_student` WRITE;
/*!40000 ALTER TABLE `group_student` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_teacher`
--

LOCK TABLES `group_teacher` WRITE;
/*!40000 ALTER TABLE `group_teacher` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide_count`
--

LOCK TABLES `guide_count` WRITE;
/*!40000 ALTER TABLE `guide_count` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_info`
--

LOCK TABLES `issue_info` WRITE;
/*!40000 ALTER TABLE `issue_info` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_report`
--

LOCK TABLES `open_report` WRITE;
/*!40000 ALTER TABLE `open_report` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_progress`
--

LOCK TABLES `plan_progress` WRITE;
/*!40000 ALTER TABLE `plan_progress` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_year`
--

LOCK TABLES `plan_year` WRITE;
/*!40000 ALTER TABLE `plan_year` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress_situ`
--

LOCK TABLES `progress_situ` WRITE;
/*!40000 ALTER TABLE `progress_situ` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply_score`
--

LOCK TABLES `reply_score` WRITE;
/*!40000 ALTER TABLE `reply_score` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_score`
--

LOCK TABLES `review_score` WRITE;
/*!40000 ALTER TABLE `review_score` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_paper`
--

LOCK TABLES `student_paper` WRITE;
/*!40000 ALTER TABLE `student_paper` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
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
INSERT INTO `sys_group` VALUES (49,'用户管理','perm:userHelpManagement',16,1,'/sys/userHelp_list.action?view=list'),(50,'角色管理','perm:roleManagement',16,2,'/sys/sysRole_list.action?view=list'),(51,'我的毕业课题','perm:myTopicInformation',27,1,'/biz/materialInfo_info.action?view=info'),(52,'我的个人资料','perm:myPersonalInformation',28,1,'/sys/userHelp_openUserInfo.action?view=userInfo'),(53,'我的任务书','perm:myTaskBook',26,1,'/biz/materialInfo_info.action?view=info&mark=taskBook&flag=03'),(54,'选择指导老师','perm:chooseTheInstructor',20,1,'/biz/allotGuide_allotTeacherList.action?view=teacher_list&flag=01'),(55,'我的开题报告','perm:myOpeningReport',25,1,'/biz/materialInfo_info.action?view=info&mark=openingReport&flag=04'),(56,'我的进度情况','perm:myProgressStatus',24,1,'/biz/materialInfo_info.action?view=info&mark=progressStatus&flag=05'),(57,'学生答辩记录','perm:myDefenseRecord',21,1,'/biz/materialInfo_info.action?view=info'),(58,'我的论文','perm:myPaper',29,1,'/biz/materialInfo_info.action?view=uploadFile&tabFlag=04'),(59,'学生信息','perm:BasicInformation',17,1,'/sys/student_list.action?view=list'),(60,'学生课题信息','perm:topicInformation',27,2,'/biz/materialInfo_guideStudentList.action?view=guide_student_list&flag=13'),(61,'选择所带学生','perm:selectStudent',20,2,'/biz/allotGuide_allotStudentList.action?view=student_list&flag=01'),(62,'老师分组','perm:enterTheTeacherGroup',19,1,'/biz/GroupTeacher_list.action?view=teacher_list&flag=08'),(63,'学生分组','perm:enterTheStudentGroup',19,2,'/biz/GroupStudent_list.action?view=student_list&flag=08'),(64,'学生任务书','perm:studentTaskBook',26,1,'/biz/taskBook_openAdd.action?view=detail'),(65,'学生开题报告','perm:studentOpeningReport',25,1,'/biz/materialInfo_guideStudentList.action?view=guide_student_list&flag=13'),(66,'进度计划','perm:planProgress',18,2,'/biz/PlanProgress_list.action?view=progress_list&tabFlag=01'),(67,'年度计划','perm:planYear',18,1,'/biz/PlanYear_list.action?view=year_list&tabFlag=00'),(68,'指导人数安排','perm:planGuide',18,3,'/biz/PlanGuide_list.action?view=guide_list&tabFlag=02'),(69,'答辩过程记录','perm:defenseRecord',21,1,'/biz/defenseRecord_groupAllStudentList.action?view=groupAllStudentList&flag=12&thisReplyType=00'),(70,'成绩及评阅','perm:replyScore',21,2,'/biz/replyScore_list.action?view=list&flag=12&thisReplyType=00'),(73,'学生论文','perm:studentPapers',29,1,'/biz/materialInfo_info.action?view=info&mark=paper'),(74,'老师信息','perm:teacherInformation',17,2,'/sys/teacher_list.action?view=list'),(75,'班级信息','perm:classInformation',17,5,'/sys/classes_list.action?view=list'),(76,'学院信息','perm:departInformation',17,3,'/sys/department_list.action?view=list'),(77,'专业信息','perm:majorInformation',17,4,'/sys/major_list.action?view=list'),(78,'教室管理','perm:classrommInformation',17,6,'/sys/classroom_list.action?view=list'),(80,'职称管理','perm:technicalInformation',17,8,'/sys/technical_list.action?view=list'),(81,'大类信息','perm:categoryInformation',17,9,'/sys/category_list.action?view=list'),(82,'研究方向信息','perm:directionsInformation',17,10,'/sys/directions_list.action?view=list'),(83,'职务信息','perm:positionInformation',17,11,'/sys/duties_list.action?view=list'),(84,'课题类型信息','perm:issueTypeInformation',17,12,'/sys/issueType_list.action?view=list'),(85,'成绩录入','perm:RecordEntryInformation',21,1,'/biz/materialInfo_groupStudentList.action?view=recordEntry&flag=13&thisReplyType=00'),(86,'评阅分配','perm:reviewAssignInformation',30,2,'/biz/materialInfo_groupDefenseStudentList.action?view=defense_student_list&flag=13&thisReplyType=00'),(87,'文件类型信息','perm:fileTypeInformation',17,13,'/sys/fileType_list.action?view=list'),(88,'公告信息','perm:noticeInformation',17,14,'/sys/notice_list.action?view=list'),(90,'评阅信息','perm:reviewInformation',31,1,'/biz/materialInfo_groupDefenseStudentList.action?view=reviewDissertation&flag=13&thisReplyType=00'),(91,'导师课题信息','perm:projectInformation',27,1,'/biz/teacherProject_list.action?view=list'),(92,'我的导师课题','perm:myTeaProInformation',27,2,'/biz/teacherProject_detail.action?view=detail'),(93,'课题类型统计','perm:typeStatistics',27,3,'/biz/issueInfo_openChart.action?view=statistics');
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
) ENGINE=InnoDB AUTO_INCREMENT=1198 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_student`
--

LOCK TABLES `sys_student` WRITE;
/*!40000 ALTER TABLE `sys_student` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=490 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_teacher`
--

LOCK TABLES `sys_teacher` WRITE;
/*!40000 ALTER TABLE `sys_teacher` DISABLE KEYS */;
INSERT INTO `sys_teacher` VALUES (201,'admin','admin','201700201',NULL,NULL,213,'24',772);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_book`
--

LOCK TABLES `task_book` WRITE;
/*!40000 ALTER TABLE `task_book` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_directions`
--

LOCK TABLES `teacher_directions` WRITE;
/*!40000 ALTER TABLE `teacher_directions` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_major`
--

LOCK TABLES `teacher_major` WRITE;
/*!40000 ALTER TABLE `teacher_major` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2258 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hlep`
--

LOCK TABLES `user_hlep` WRITE;
/*!40000 ALTER TABLE `user_hlep` DISABLE KEYS */;
INSERT INTO `user_hlep` VALUES (1,'admin','admin','admin','3','2019-12-06 00:49:11',NULL,'1','12','13507749831','11547830091@qq.com',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=1834 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,23,1);
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

-- Dump completed on 2019-12-06  8:50:08
set global sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
set session sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
