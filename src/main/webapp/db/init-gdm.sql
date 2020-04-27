-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: gdm
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
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
  `reply_link` varchar(255) DEFAULT NULL COMMENT '是否通过答辩环节：00-未审批 01-是 02否',
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_year`
--

LOCK TABLES `plan_year` WRITE;
/*!40000 ALTER TABLE `plan_year` DISABLE KEYS */;
INSERT INTO `plan_year` VALUES (1,1,'2020-04-21 15:07:37',2020);
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
  `progress_work` varchar(5000) DEFAULT NULL COMMENT '工作要求',
  `progress_record` varchar(5000) DEFAULT NULL COMMENT '进程记录',
  `year` int(11) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`progress_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
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
INSERT INTO `sys_category` VALUES (3,'计算机类','201700202'),(4,'物联网类','201700202'),(5,'数字媒体类','201700202'),(6,'电子类','201700201'),(7,'数学类','201700202'),(8,'软件类','201700202'),(9,'行政','201700202'),(10,'计算机基础','201700202');
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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_class`
--

LOCK TABLES `sys_class` WRITE;
/*!40000 ALTER TABLE `sys_class` DISABLE KEYS */;
INSERT INTO `sys_class` VALUES (23,NULL,'14软件工程班','201700202',4),(25,NULL,'14软件工程中升本','201700202',4),(26,NULL,'15软件工程1班','201700202',4),(27,NULL,'15软件工程2班','201700202',4),(28,NULL,'15软件工程3班','201700202',4),(29,NULL,'15软件工程4班','201700202',4),(30,NULL,'15软件工程中升本班','201700202',4),(32,NULL,'16软件工程1班','201700202',4),(33,NULL,'16软件工程2班','201700202',4),(34,NULL,'16软件工程3班','201700202',4),(35,NULL,'16软件工程4班','201700202',4),(36,NULL,'16软件工程中升本1班','201700202',4),(37,NULL,'16软件工程中升本2班','201700202',4),(38,NULL,'17软件工程1班','201700202',5),(39,NULL,'17软件工程2班','201700202',4),(40,NULL,'17软件工程3班','201700202',4),(41,NULL,'17软件工程4班','201700202',4),(42,NULL,'17软件工程5班','201700202',4),(43,NULL,'17软件工程6班','201700202',4),(46,NULL,'19数据科学与大数据技术1','201700202',14),(47,NULL,'19数据科学与大数据技术２','201700202',14),(48,NULL,'14信息与计算科学','201700202',11),(49,NULL,'15数学与应用数学','201700202',12),(50,NULL,'15物联网工程','201700202',5),(51,NULL,'14物联网工程','201700202',5),(52,NULL,'15数字媒体技术','201700202',12),(53,NULL,'14数字媒体技术','201700202',12),(54,NULL,'15计算机科学与技术','201700202',6),(55,NULL,'14计算机科学与技术','201700202',6),(56,NULL,'19物联网工程专升本','201700202',5),(58,NULL,'17计算机应用技术班','201700202',6),(60,NULL,'17数学与应用数学班','201700202',9),(61,NULL,'17信息与计算科学班','201700202',11),(62,NULL,'17物联网工程班','201700202',5),(63,NULL,'17软件工程中职升本班','201700202',4),(64,NULL,'17数字媒体技术班','201700202',12),(65,NULL,'17计算机科学与技术','201700202',6),(66,NULL,'18计算机应用技术','201700202',15),(67,NULL,'18信息与计算科学','201700202',11),(68,NULL,'18数学与应用数学','201700202',9),(69,NULL,'18物联网工程','201700202',5),(70,NULL,'18数字媒体技术2','201700202',12),(71,NULL,'18数字媒体技术1','201700202',12),(72,NULL,'18计算机科学与技术','201700202',6),(73,NULL,'18软件工程6','201700202',4),(74,NULL,'18软件工程5','201700202',4),(75,NULL,'18软件工程4','201700202',4),(76,NULL,'18软件工程3','201700202',4),(77,NULL,'18软件工程2','201700202',4),(78,NULL,'18软件工程1','201700202',4),(79,NULL,'19数学与应用数学','201700202',9),(80,NULL,'19物联网工程','201700202',5),(81,NULL,'19数据科学与大数据技术2','201700202',14),(82,NULL,'19数据科学与大数据技术1','201700202',14),(83,NULL,'19数字媒体技术2','201700202',12),(84,NULL,'19数字媒体技术1','201700202',12),(85,NULL,'19计算机科学与技术2','201700202',6),(86,NULL,'19计算机科学与技术1','201700202',6),(87,NULL,'19软件工程2','201700202',4),(88,NULL,'19软件工程1','201700202',4),(89,NULL,'16信息与计算科学','201700202',11),(90,NULL,'16数学与应用数学','201700202',9),(91,NULL,'16物联网工程','201700202',5),(92,NULL,'16数字媒体技术','201700202',12),(93,NULL,'16计算机科学与技术','201700202',6);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_directions`
--

LOCK TABLES `sys_directions` WRITE;
/*!40000 ALTER TABLE `sys_directions` DISABLE KEYS */;
INSERT INTO `sys_directions` VALUES (1,'软件开发'),(2,'AR技术'),(3,'网络安全'),(4,'UI设计'),(5,'软件测试'),(8,'物联网');
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
INSERT INTO `sys_group` VALUES (49,'用户管理','perm:userHelpManagement',16,1,'/sys/userHelp_list.action?view=list'),(50,'角色管理','perm:roleManagement',16,2,'/sys/sysRole_list.action?view=list'),(51,'我的毕业课题','perm:myTopicInformation',27,1,'/biz/materialInfo_info.action?view=info'),(52,'我的个人资料','perm:myPersonalInformation',28,1,'/sys/userHelp_openUserInfo.action?view=userInfo'),(53,'我的任务书','perm:myTaskBook',26,1,'/biz/materialInfo_info.action?view=info&mark=taskBook&flag=03'),(54,'选择指导老师','perm:chooseTheInstructor',20,1,'/biz/allotGuide_allotTeacherList.action?view=teacher_list&flag=01'),(55,'我的开题报告','perm:myOpeningReport',25,1,'/biz/materialInfo_info.action?view=info&mark=openingReport&flag=04'),(56,'我的进度情况','perm:myProgressStatus',24,1,'/biz/materialInfo_info.action?view=info&mark=progressStatus&flag=05'),(57,'学生答辩记录','perm:myDefenseRecord',21,1,'/biz/materialInfo_progressSitu.action?view=progressSitu&tabFlag=03'),(58,'我的论文','perm:myPaper',29,1,'/biz/materialInfo_info.action?view=uploadFile&tabFlag=04'),(59,'学生信息','perm:BasicInformation',17,1,'/sys/student_list.action?view=list'),(60,'学生课题信息','perm:topicInformation',27,2,'/biz/materialInfo_list.action?view=guide_student_list&flag=13'),(61,'选择所带学生','perm:selectStudent',20,2,'/biz/allotGuide_allotStudentList.action?view=student_list&flag=01&tabFlag=00'),(62,'老师分组','perm:enterTheTeacherGroup',19,1,'/biz/GroupTeacher_list.action?view=teacher_list&flag=08'),(63,'学生分组','perm:enterTheStudentGroup',19,2,'/biz/GroupStudent_list.action?view=student_list&flag=08'),(64,'学生任务书','perm:studentTaskBook',26,1,'/biz/taskBook_openAdd.action?view=detail'),(65,'学生开题报告','perm:studentOpeningReport',25,1,'/biz/materialInfo_guideStudentList.action?view=guide_student_list&flag=13'),(66,'进度计划','perm:planProgress',18,2,'/biz/PlanProgress_list.action?view=progress_list&tabFlag=01'),(67,'年度计划','perm:planYear',18,1,'/biz/PlanYear_list.action?view=year_list&tabFlag=00'),(68,'指导人数安排','perm:planGuide',18,3,'/biz/PlanGuide_list.action?view=guide_list&tabFlag=02'),(69,'答辩过程记录','perm:defenseRecord',21,2,'/biz/defenseRecord_groupAllStudentList.action?view=groupAllStudentList&flag=12&thisReplyType=00'),(70,'成绩及评阅','perm:replyScore',21,1,'/biz/replyScore_list.action?view=list&flag=12&thisReplyType=00'),(73,'学生论文','perm:studentPapers',29,1,'/biz/materialInfo_info.action?view=info&mark=paper'),(74,'老师信息','perm:teacherInformation',17,2,'/sys/teacher_list.action?view=list'),(75,'班级信息','perm:classInformation',17,5,'/sys/classes_list.action?view=list'),(76,'学院信息','perm:departInformation',17,3,'/sys/department_list.action?view=list'),(77,'专业信息','perm:majorInformation',17,4,'/sys/major_list.action?view=list'),(78,'教室管理','perm:classrommInformation',17,6,'/sys/classroom_list.action?view=list'),(80,'职称管理','perm:technicalInformation',17,8,'/sys/technical_list.action?view=list'),(81,'大类信息','perm:categoryInformation',17,9,'/sys/category_list.action?view=list'),(82,'研究方向信息','perm:directionsInformation',17,10,'/sys/directions_list.action?view=list'),(83,'职务信息','perm:positionInformation',17,11,'/sys/duties_list.action?view=list'),(84,'课题类型信息','perm:issueTypeInformation',17,12,'/sys/issueType_list.action?view=list'),(85,'成绩录入','perm:RecordEntryInformation',21,1,'/biz/materialInfo_groupStudentList.action?view=recordEntry&flag=13&thisReplyType=00'),(86,'评阅分配','perm:reviewAssignInformation',30,2,'/biz/materialInfo_groupDefenseStudentList.action?view=defense_student_list&flag=13&thisReplyType=00'),(87,'文件类型信息','perm:fileTypeInformation',17,13,'/sys/fileType_list.action?view=list'),(88,'公告信息','perm:noticeInformation',17,14,'/sys/notice_list.action?view=list'),(90,'评阅信息','perm:reviewInformation',31,1,'/biz/materialInfo_groupDefenseStudentList.action?view=reviewDissertation&flag=13&thisReplyType=00'),(91,'导师课题信息','perm:projectInformation',27,1,'/biz/teacherProject_list.action?view=list'),(92,'我的导师课题','perm:myTeaProInformation',27,2,'/biz/teacherProject_detail.action?view=detail'),(93,'课题类型统计','perm:typeStatistics',27,3,'/biz/issueInfo_openChart.action?view=statistics');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_major`
--

LOCK TABLES `sys_major` WRITE;
/*!40000 ALTER TABLE `sys_major` DISABLE KEYS */;
INSERT INTO `sys_major` VALUES (4,'000','201700202',8,'软件工程','软件工程专业教研室'),(5,'001','201700202',4,'物联网工程','物联网工程专业教研室'),(6,'002','201700202',3,'计算机科学与技术','计算机科学与技术专业教研室'),(9,'005','201700202',7,'数学与应用数学','数学与应用数学专业教研室'),(10,'006','201700201',6,'电子科学与技术','电子科学与技术专业教研室'),(11,'007','201700202',10,'信息与计算科学','信息与计算科学专业教研室'),(12,'008','201700202',10,'数字媒体技术','数字媒体技术实验室'),(14,'','201700202',3,'数据科学与大数据技术','数据科学与大数据技术'),(15,NULL,'201700202',3,'计算机应用技术','计算机应用技术教研室');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'关于系统使用通知','用户登入系统后，请第一时间完成个人信息修改，方可使用。','2020-04-21 12:53:46',1,NULL,NULL,NULL,NULL,-2);
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
) ENGINE=InnoDB AUTO_INCREMENT=1085 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_student`
--

LOCK TABLES `sys_student` WRITE;
/*!40000 ALTER TABLE `sys_student` DISABLE KEYS */;
INSERT INTO `sys_student` VALUES (543,'201700201101','陈海洋',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,648),(544,'201700201103','樊欣亚',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,649),(545,'201700201104','花富階',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,650),(546,'201700201105','黄朝创',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,651),(547,'201700201106','黄泽灿',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,652),(548,'201700201107','黄志仁',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,653),(549,'201700201108','姜昊',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,654),(550,'201700201109','金鹏',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,655),(551,'201700201110','赖有鹏',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,656),(552,'201700201111','梁存富',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,657),(553,'201700201112','梁建钊',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,658),(554,'201700201113','梁明水',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,659),(555,'201700201114','林德佑',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,660),(556,'201700201115','林声深',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,661),(557,'201700201116','林源',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,662),(558,'201700201117','刘华康',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,663),(559,'201700201118','卢坚源',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,664),(560,'201700201119','鲁昊',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,665),(561,'201700201120','罗智超',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,666),(562,'201700201121','潘启源',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,667),(563,'201700201122','石常鉴',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,668),(564,'201700201124','苏旭晴',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,669),(565,'201700201125','王昌元',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,670),(566,'201700201126','王永盛',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,671),(567,'201700201127','王钰',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,672),(568,'201700201128','余金明',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,673),(569,'201700201129','张鸿飞',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,674),(570,'201700201130','张明天',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,675),(571,'201700201131','钟东强',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,676),(572,'201700201132','周斌',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,677),(573,'201700201133','周文雷',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,678),(574,'201700201135','甘雄清',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,679),(575,'201700201136','黄丽娜',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,680),(576,'201700201137','黄清群',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,681),(577,'201700201140','李彩华',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,682),(578,'201700201141','李夏玮',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,683),(579,'201700201144','刘殿娥',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,684),(580,'201700201145','蒙晓凤',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,685),(581,'201700201146','欧秋月',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,686),(582,'201700201147','苏金静',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,687),(583,'201700201148','覃钰莹',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,688),(584,'201700201150','熊翠香',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,689),(585,'201700201151','张颖',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,690),(586,'201700602123','叶智崇',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,691),(587,'201701902230','陈检',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,692),(588,'201700602121','冼乐华',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,693),(589,'201700602112','刘军成',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,6,NULL,694),(590,'201700208102','陈瀚文',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,695),(591,'201700208103','陈天昊',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,696),(592,'201700208104','崔秀',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,697),(593,'201700208105','邓开荣',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,698),(594,'201700208106','方钦球',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,699),(595,'201700208107','郭确宁',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,700),(596,'201700208108','黄富森',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,701),(597,'201700208109','黄建柱',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,702),(598,'201700208110','黄增送',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,703),(599,'201700208112','李波',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,704),(600,'201700208114','梁斌斌',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,705),(601,'201700208115','梁展铭',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,706),(602,'201700208116','廖东华',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,707),(603,'201700208117','刘军保',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,708),(604,'201700208119','卢品良',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,709),(605,'201700208120','农德森',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,710),(606,'201700208121','潘毅',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,711),(607,'201700208122','苏泓瑞',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,712),(608,'201700208123','谭锦意',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,713),(609,'201700208125','魏宏宇',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,714),(610,'201700208126','谢洪',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,715),(611,'201700208127','杨洪璋',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,716),(612,'201700208128','袁力航',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,717),(613,'201700208129','张世贵',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,718),(614,'201700208130','赵海博',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,719),(615,'201700208131','周日月',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,720),(616,'201700208132','陈家燕',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,721),(617,'201700208133','董冰雪',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,722),(618,'201700208134','冯莲',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,723),(619,'201700208136','赖锦威',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,724),(620,'201700208137','兰文静',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,725),(621,'201700208138','凌丽华',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,726),(622,'201700208139','罗珍梅',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,727),(623,'201700208140','莫思',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,728),(624,'201700208141','齐美琳',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,729),(625,'201700208142','覃浩容',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,730),(626,'201700208143','谢江英',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,731),(627,'201700208144','叶诗瑶',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,732),(628,'201700208145','叶婷',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,733),(629,'201700208146','张芬',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,734),(630,'201700208147','朱美锦',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,735),(631,'201700208148','蒂安娜',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,736),(632,'201701901302','陈勉军',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,737),(633,'201701817127','黄俊',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,738),(634,'201700806150','冉冉',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,739),(635,'201701901437','吕梓萌',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,38,740),(636,'201700208201','陈思扬',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,741),(637,'201700208202','崔锦',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,742),(638,'201700208203','黄结',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,743),(639,'201700208204','黄俊玮',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,744),(640,'201700208205','黄盛军',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,745),(641,'201700208206','季宏',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,746),(642,'201700208207','劳奕谋',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,747),(643,'201700208208','李日鑫',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,748),(644,'201700208209','廖正灵',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,749),(645,'201700208210','林明君',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,750),(646,'201700208211','林已弄',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,751),(647,'201700208212','林志海',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,752),(648,'201700208213','林忠陆',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,753),(649,'201700208215','卢森柱',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,754),(650,'201700208216','马里弟',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,755),(651,'201700208217','苏小锋',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,756),(652,'201700208218','覃彬烘',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,757),(653,'201700208220','汤海明',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,758),(654,'201700208221','王海明',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,759),(655,'201700208222','韦永恒',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,760),(656,'201700208223','卫星桦',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,761),(657,'201700208224','夏祥瑞',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,762),(658,'201700208225','颜佩辛',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,763),(659,'201700208226','姚智',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,764),(660,'201700208227','曾家伟',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,765),(661,'201700208228','张钦',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,766),(662,'201700208229','郑俊彬',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,767),(663,'201700208230','朱桓博',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,768),(664,'201700208231','左丰维',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,769),(665,'201700208232','陈晓娜',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,770),(666,'201700208233','方小深',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,771),(667,'201700208234','何燕玲',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,772),(668,'201700208235','黄彩玉',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,773),(669,'201700208237','莫淋茸',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,774),(670,'201700208238','莫珊珊',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,775),(671,'201700208239','孙清梅',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,776),(672,'201700208240','孙士杰',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,777),(673,'201700208241','滕玉玲',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,778),(674,'201700208242','王小莉',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,779),(675,'201700208243','吴方梅',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,780),(676,'201700208244','吴水玲',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,781),(677,'201700208245','杨惠如',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,782),(678,'201700208246','周柔余',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,39,783),(679,'201700208301','陈春胜',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,784),(680,'201700208302','陈科锋',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,785),(681,'201700208303','陈世乾',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,786),(682,'201700208304','陈裕淇',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,787),(683,'201700208305','符隆权',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,788),(684,'201700208306','黄运康',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,789),(685,'201700208307','黄志伟',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,790),(686,'201700208308','蓝永锋',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,791),(687,'201700208309','李佳杰',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,792),(688,'201700208310','梁寿江',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,793),(689,'201700208311','梁树鹏',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,794),(690,'201700208312','梁伟钊',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,795),(691,'201700208313','刘浩南',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,796),(692,'201700208314','刘健旭',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,797),(693,'201700208315','刘天龙',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,798),(694,'201700208316','卢永恒',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,799),(695,'201700208317','卢泳宏',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,800),(696,'201700208318','马斌基',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,801),(697,'201700208319','彭宣瑞',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,802),(698,'201700208320','祁发宏',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,803),(699,'201700208321','王必标',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,804),(700,'201700208322','王佳辉',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,805),(701,'201700208323','王崎',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,806),(702,'201700208325','易洪升',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,807),(703,'201700208326','张松',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,808),(704,'201700208327','张艺昌',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,809),(705,'201700208328','钟蔼焕',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,810),(706,'201700208329','钟国财',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,811),(707,'201700208330','周加勇',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,812),(708,'201700208331','周业鸿',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,813),(709,'201700208332','鲍厚丽',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,814),(710,'201700208333','陈晶晶',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,815),(711,'201700208334','陈小艳',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,816),(712,'201700208335','陈馨',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,817),(713,'201700208336','段伶',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,818),(714,'201700208337','李秋蓉',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,819),(715,'201700208338','李小波',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,820),(716,'201700208339','卢小林',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,821),(717,'201700208340','吕美琴',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,822),(718,'201700208342','谭文小',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,823),(719,'201700208343','韦金玉',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,824),(720,'201700208344','魏宇雪',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,825),(721,'201700208345','吴预嫩',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,826),(722,'201700208346','谢丹妮',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,40,827),(723,'201700208401','保旻',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,828),(724,'201700208402','陈楚文',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,829),(725,'201700208403','陈松松',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,830),(726,'201700208404','陈熙官',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,831),(727,'201700208405','陈俞可',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,832),(728,'201700208406','杜威征',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,833),(729,'201700208407','方乾',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,834),(730,'201700208408','甘绍宽',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,835),(731,'201700208409','扈北泉',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,836),(732,'201700208410','黄崇爱',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,837),(733,'201700208411','黄垂明',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,838),(734,'201700208412','黄海浪',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,839),(735,'201700208413','黄华露',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,840),(736,'201700208414','黄森',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,841),(737,'201700208415','黎文泉',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,842),(738,'201700208416','李春金',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,843),(739,'201700208417','李范钊',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,844),(740,'201700208418','李佳星',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,845),(741,'201700208419','李培玉',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,846),(742,'201700208420','龙家林',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,847),(743,'201700208421','陆昌志',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,848),(744,'201700208422','陆建兵',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,849),(745,'201700208423','陆晓飞',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,850),(746,'201700208424','莫智帆',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,851),(747,'201700208425','潘柏钦',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,852),(748,'201700208426','覃能健',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,853),(749,'201700208427','唐广德',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,854),(750,'201700208428','吴顺东',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,855),(751,'201700208430','杨松',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,856),(752,'201700208431','周军',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,857),(753,'201700208432','包建宏',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,858),(754,'201700208433','蔡晓梅',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,859),(755,'201700208434','戴艳冰',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,860),(756,'201700208435','蒋冬梅',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,861),(757,'201700208436','赖秋帆',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,862),(758,'201700208437','兰云',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,863),(759,'201700208438','刘俊婷',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,864),(760,'201700208439','卢美艳',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,865),(761,'201700208441','覃寿兰',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,866),(762,'201700208442','杨连英',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,867),(763,'201700208443','杨秋月',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,868),(764,'201700208444','赵晓漫',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,869),(765,'201700208445','郑秋梅',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,870),(766,'201700208446','周丽云',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,41,871),(767,'201700208501','蔡奇峰',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,872),(768,'201700208502','陈昱全',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,873),(769,'201700208503','冯榆',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,874),(770,'201700208504','符恒',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,875),(771,'201700208505','黄开林',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,876),(772,'201700208506','李善奇',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,877),(773,'201700208507','李彦朋',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,878),(774,'201700208508','廖湘伟',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,879),(775,'201700208509','刘牌',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,880),(776,'201700208510','罗凤宽',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,881),(777,'201700208512','莫一威',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,882),(778,'201700208513','宁锦邦',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,883),(779,'201700208514','彭佳豪',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,884),(780,'201700208517','谭卢钢',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,885),(781,'201700208518','谭炫',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,886),(782,'201700208519','韦昌泽',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,887),(783,'201700208520','韦锰宝',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,888),(784,'201700208521','韦裕波',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,889),(785,'201700208522','夏维',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,890),(786,'201700208523','肖楚亮',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,891),(787,'201700208524','杨彪',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,892),(788,'201700208525','袁智彪',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,893),(789,'201700208526','张广辉',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,894),(790,'201700208527','张起斌',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,895),(791,'201700208528','张志豪',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,896),(792,'201700208529','赵恒',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,897),(793,'201700208530','郑乾威',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,898),(794,'201700208531','陈少云',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,899),(795,'201700208532','陈水兰',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,900),(796,'201700208533','代红玉',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,901),(797,'201700208534','董丽凤',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,902),(798,'201700208535','窦禹雪',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,903),(799,'201700208538','金晓凌',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,904),(800,'201700208539','李雪莲',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,905),(801,'201700208540','廖晓晴',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,906),(802,'201700208541','卢海铃',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,907),(803,'201700208543','杨文清',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,908),(804,'201700208544','叶显守',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,909),(805,'201700208546','周晓梅',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,42,910),(806,'201700208602','冯其江',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,911),(807,'201700208603','何文良',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,912),(808,'201700208605','蒋世凯',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,913),(809,'201700208606','林才楗',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,914),(810,'201700208607','陆柏成',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,915),(811,'201700208608','陆泓君',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,916),(812,'201700208609','吕成龙',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,917),(813,'201700208610','马晓龙',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,918),(814,'201700208611','宁柄嵛',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,919),(815,'201700208612','潘先源',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,920),(816,'201700208613','曲建国',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,921),(817,'201700208614','石艳鹏',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,922),(818,'201700208615','宋华健',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,923),(819,'201700208618','王玉祥',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,924),(820,'201700208619','韦家聪',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,925),(821,'201700208620','吴洪伟',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,926),(822,'201700208621','吴伟东',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,927),(823,'201700208622','许多',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,928),(824,'201700208624','杨香华',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,929),(825,'201700208625','叶成德',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,930),(826,'201700208626','余振涛',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,931),(827,'201700208627','曾达江',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,932),(828,'201700208628','曾伟旗',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,933),(829,'201700208629','张治国',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,934),(830,'201700208630','周子毅',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,935),(831,'201700208631','包晚平',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,936),(832,'201700208632','陈利琛',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,937),(833,'201700208633','陈荣燕',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,938),(834,'201700208634','陈燕梅',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,939),(835,'201700208635','方莉鑫',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,940),(836,'201700208637','梁宇兰',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,941),(837,'201700208638','刘贵媛',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,942),(838,'201700208639','刘欣',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,943),(839,'201700208640','龙凤鸾',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,944),(840,'201700208641','麦嘉宜',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,945),(841,'201700208642','彭小筱',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,946),(842,'201700208643','王芷芬',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,947),(843,'201700208644','肖长青',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,948),(844,'201700208646','祝善迹',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,43,949),(845,'201500213209','梁方华',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,63,950),(846,'201500213121','吴子平',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,4,63,951),(847,'201700213101','陈勇',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,952),(848,'201700213102','党勇辉',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,953),(849,'201700213103','董晋夤',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,954),(850,'201700213104','董兆丰',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,955),(851,'201700213105','冯宁阳',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,956),(852,'201700213106','付升',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,957),(853,'201700213107','何武达',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,958),(854,'201700213110','兰国庆',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,959),(855,'201700213111','兰小东',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,960),(856,'201700213112','李统方',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,961),(857,'201700213114','林孝君',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,962),(858,'201700213115','刘尚隆',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,963),(859,'201700213116','刘永渝',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,964),(860,'201700213117','卢文钦',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,965),(861,'201700213118','陆炳新',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,966),(862,'201700213119','陆建彬',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,967),(863,'201700213120','罗序照',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,968),(864,'201700213121','罗远迪',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,969),(865,'201700213122','麦凯',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,970),(866,'201700213123','蒙祥庚',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,971),(867,'201700213124','饶炳基',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,972),(868,'201700213125','韦优东',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,973),(869,'201700213126','谢振高',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,974),(870,'201700213127','颜晓明',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,975),(871,'201700213128','杨景琦',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,976),(872,'201700213129','杨胜涛',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,977),(873,'201700213130','周星全',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,978),(874,'201700213131','陈金惠',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,979),(875,'201700213132','陈秋焕',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,980),(876,'201700213133','程木媛',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,981),(877,'201700213134','葛美伶',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,982),(878,'201700213135','黄北兰',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,983),(879,'201700213136','黄海妮',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,984),(880,'201700213137','李清燕',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,985),(881,'201700213138','梁炜',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,986),(882,'201700213139','梁璇',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,987),(883,'201700213141','刘宇萍',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,988),(884,'201700213143','罗小佩',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,989),(885,'201700213144','苏英',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,990),(886,'201700213145','谢焕',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,991),(887,'201700213146','严柱玲',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,992),(888,'201700213147','余超惠',NULL,NULL,'中职升本科','4年',NULL,'2017','201700202',NULL,4,63,993),(889,'201700213148','张雪琳',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,994),(890,'201700213149','张燕秋',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,995),(891,'201700213150','朱春蓉',NULL,NULL,'中职升本科','4',NULL,'2017','201700202',NULL,4,63,996),(892,'201500601130','潘勇',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,997),(893,'201700601101','岑兴宝',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,998),(894,'201700601102','陈广荣',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,999),(895,'201700601105','戴载贤',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1000),(896,'201700601106','甘卯光',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1001),(897,'201700601108','赖世镍',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1002),(898,'201700601109','李松泽',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1003),(899,'201700601110','李松泽',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1004),(900,'201700601111','卢显信',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1005),(901,'201700601113','莫增祥',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1006),(902,'201700601114','谢承泰',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1007),(903,'201700601115','杨发威',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1008),(904,'201700601116','杨洪懿',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1009),(905,'201700601117','杨志意',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1010),(906,'201700601118','赵万鑫',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1011),(907,'201700601119','钟春才',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1012),(908,'201700601120','周利邦',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1013),(909,'201700601122','包美芳',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1014),(910,'201700601123','贝秋燕',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1015),(911,'201700601124','邓文艳',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1016),(912,'201700601125','黄帮',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1017),(913,'201700601126','黄春燕',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1018),(914,'201700601127','黄凤兰',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1019),(915,'201700601128','黄兴妮',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1020),(916,'201700601129','黄业连',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1021),(917,'201700601130','黎美玲',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1022),(918,'201700601131','李玉凤',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1023),(919,'201700601132','李卓霞',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1024),(920,'201700601133','梁锦蕊',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1025),(921,'201700601134','廖美娟',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1026),(922,'201700601135','林祖莲',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1027),(923,'201700601136','刘丹琳',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1028),(924,'201700601137','卢美玲',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1029),(925,'201700601138','卢月明',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1030),(926,'201700601139','罗娜',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1031),(927,'201700601140','麻春燕',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1032),(928,'201700601141','蒙春柳',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1033),(929,'201700601142','覃珍妮',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1034),(930,'201700601143','吴秀花',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1035),(931,'201700601144','肖莉芳',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1036),(932,'201700601145','谢绚',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1037),(933,'201700601146','胥斯',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1038),(934,'201700601147','徐燕春',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1039),(935,'201700601148','余永妙',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1040),(936,'201700601149','周荔杏',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1041),(937,'201700601150','朱水秀',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1042),(938,'201709706140','韦翠菊',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,9,60,1043),(939,'201709706120','李媚',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1044),(940,'201700211102','崔基志',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1045),(941,'201700211104','侯昊烨',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1046),(942,'201700211105','黄晋杰',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1047),(943,'201700211106','姜燕和',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1048),(944,'201700211107','黎章辉',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1049),(945,'201700211108','李俊',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1050),(946,'201700211109','廖鸿钧',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1051),(947,'201700211110','廖瑞勇',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1052),(948,'201700211111','林海欢',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1053),(949,'201700211112','卢杰平',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1054),(950,'201700211113','吴桂海',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1055),(951,'201700211114','余华春',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1056),(952,'201700211115','玉玄达',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1057),(953,'201700211116','袁浩竣',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1058),(954,'201700211117','詹海秋',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1059),(955,'201700211119','周志杰',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1060),(956,'201700211120','陈海湘',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1061),(957,'201700211121','陈婧璇',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1062),(958,'201700211122','邓秋凤',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1063),(959,'201700211123','冯惠心',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1064),(960,'201700211124','冯丽梅',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1065),(961,'201700211125','黄海璇',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1066),(962,'201700211126','黄鹂',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1067),(963,'201700211127','霍金清',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1068),(964,'201700211128','黎芳荣',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1069),(965,'201700211129','李永馨',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1070),(966,'201700211130','林水凤',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1071),(967,'201700211131','刘晓钰',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1072),(968,'201700211132','陆红艳',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1073),(969,'201700211133','梅明羽',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1074),(970,'201700211134','莫金迎',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1075),(971,'201700211135','宁玲',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1076),(972,'201700211136','孙亚楠',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1077),(973,'201700211138','王金焕',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1078),(974,'201700211139','王芊茜',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1079),(975,'201700211140','韦可儿',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1080),(976,'201700211141','韦妹',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1081),(977,'201700211142','吴燕霞',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1082),(978,'201700211143','谢婷婷',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1083),(979,'201700211144','许方芳',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1084),(980,'201700211146','阳小媛',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1085),(981,'201700211147','曾鸿露',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1086),(982,'201700211148','张梅娟',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1087),(983,'201700211149','张雨红',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1088),(984,'201700211150','郑佳凤',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1089),(985,'201700211151','郑雨',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1090),(986,'201700211152','周菊',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1091),(987,'201700211153','朱麒蓉',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1092),(988,'201700602114','农享学',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,12,64,1093),(989,'201600210117','普泽擎乾',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1094),(990,'201700210101','陈昶文',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1095),(991,'201700210103','甘香智',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1096),(992,'201700210104','何国祖','','梧州学院','本科','4',NULL,'2017','201700202',4,5,62,1097),(993,'201700210106','黄建阳',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1098),(994,'201700210107','黄锦宗',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1099),(995,'201700210108','黄凯',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1100),(996,'201700210109','黄万词',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1101),(997,'201700210110','蓝勇胜',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1102),(998,'201700210111','李金明',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1103),(999,'201700210112','李茂',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1104),(1000,'201700210113','李业峰',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1105),(1001,'201700210114','梁中满',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1106),(1002,'201700210115','林朝元',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1107),(1003,'201700210116','林恒宇',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1108),(1004,'201700210117','刘绪泽',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1109),(1005,'201700210118','刘镇钟',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1110),(1006,'201700210119','陆增培',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1111),(1007,'201700210120','孟玺',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1112),(1008,'201700210122','农建政',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1113),(1009,'201700210123','农冕',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1114),(1010,'201700210124','秦滔',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1115),(1011,'201700210125','任坤',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1116),(1012,'201700210126','施宇',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1117),(1013,'201700210127','韦保蔚',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1118),(1014,'201700210128','温思奇',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1119),(1015,'201700210129','吴高强',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1120),(1016,'201700210130','吴瑞平',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1121),(1017,'201700210131','严汝宁',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1122),(1018,'201700210132','易明瑞',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1123),(1019,'201700210133','曾立斌',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1124),(1020,'201700210134','周益杰',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1125),(1021,'201700210135','董小翠',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1126),(1022,'201700210136','黄芳妹',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1127),(1023,'201700210137','黄慧谊',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1128),(1024,'201700210138','李慧珊',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1129),(1025,'201700210139','卢燕琼',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1130),(1026,'201700210140','罗梦妮',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1131),(1027,'201700210141','韦婕',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1132),(1028,'201700210143','韦明曼',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1133),(1029,'201700210144','吴莹莹',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1134),(1030,'201700210145','吴志欣',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1135),(1031,'201700210146','谢韵冬',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1136),(1032,'201700210147','杨清媚',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1137),(1033,'201700210148','占梦全',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1138),(1034,'201700210149','张华艳',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1139),(1035,'201700210150','张熔',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1140),(1036,'201600210124','徐志强',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1141),(1037,'201500210112','董国航',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,5,62,1142),(1038,'201929530101','江盛源',NULL,NULL,'本科','2',NULL,'2017','201700202',NULL,5,62,1143),(1039,'201929530103','罗伟',NULL,NULL,'本科','2',NULL,'2017','201700202',NULL,5,62,1144),(1040,'201929530104','李冬多',NULL,NULL,'本科','2',NULL,'2017','201700202',NULL,5,62,1145),(1041,'201929530105','唐交棋',NULL,NULL,'本科','2',NULL,'2017','201700202',NULL,5,62,1146),(1042,'201929530106','岑家慧',NULL,NULL,'本科','2',NULL,'2017','201700202',NULL,5,62,1147),(1043,'201929530107','黄芳露',NULL,NULL,'本科','2',NULL,'2017','201700202',NULL,5,62,1148),(1044,'201700602101','郭耿',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1149),(1045,'201700602102','何金胜',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1150),(1046,'201700602104','黄准',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1151),(1047,'201700602105','李河发',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1152),(1048,'201700602106','李欢阳',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1153),(1049,'201700602108','李虔瑶',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1154),(1050,'201700602109','李永书',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1155),(1051,'201700602111','凌达立',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1156),(1052,'201700602113','罗海祥',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1157),(1053,'201700602116','庞鸿宇',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1158),(1054,'201700602117','柒耀新',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1159),(1055,'201700602118','王鸿志',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1160),(1056,'201700602119','王日超',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1161),(1057,'201700602120','韦学明',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1162),(1058,'201700602122','杨章欧',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1163),(1059,'201700602125','张庆林',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1164),(1060,'201700602126','周诗蒙',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1165),(1061,'201700602127','朱楷',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1166),(1062,'201700602128','陈慧玲',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1167),(1063,'201700602129','邓广燕',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1168),(1064,'201700602130','甘梅凤',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1169),(1065,'201700602131','顾彩凤',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1170),(1066,'201700602132','韩冬妮',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1171),(1067,'201700602133','何妍珍',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1172),(1068,'201700602134','黄彩回',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1173),(1069,'201700602135','蓝丹妮',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1174),(1070,'201700602136','李明俐',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1175),(1071,'201700602137','李文香',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1176),(1072,'201700602138','李怡婷',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1177),(1073,'201700602139','梁茴茴',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1178),(1074,'201700602140','廖秀丽',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1179),(1075,'201700602141','凌梅艳',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1180),(1076,'201700602142','米静',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1181),(1077,'201700602143','覃宇洁',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1182),(1078,'201700602144','唐慧玲',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1183),(1079,'201700602145','韦梦娟',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1184),(1080,'201700602146','谢小晴',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1185),(1081,'201700602147','杨道研',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1186),(1082,'201700602148','杨霞',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1187),(1083,'201700602149','张熔',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1188),(1084,'201700602150','钟奕玲',NULL,NULL,'本科','4',NULL,'2017','201700202',NULL,11,61,1189);
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
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_teacher`
--

LOCK TABLES `sys_teacher` WRITE;
/*!40000 ALTER TABLE `sys_teacher` DISABLE KEYS */;
INSERT INTO `sys_teacher` VALUES (1,'admin','admin','201700201',NULL,NULL,213,'24',1),(254,'21010','苏芳',NULL,NULL,NULL,NULL,NULL,596),(255,'07003','黄宏本','201700201',3,4,212,'00',597),(256,'17039','陈聪','201700202',3,6,NULL,NULL,598),(257,'17018','代丽娴','201700202',3,6,NULL,NULL,599),(258,'17037','梁菁','201700202',3,6,NULL,NULL,600),(259,'17038','卢雪燕','201700202',3,6,NULL,NULL,601),(260,'17132','卿海军','201700202',3,6,NULL,NULL,602),(261,'17202','农健','201700202',3,6,NULL,NULL,603),(262,'17076','李宗妮','201700202',3,6,NULL,NULL,604),(263,'17022','黄洁明','201700202',3,6,NULL,NULL,605),(264,'27013','梁朝湘','201700202',8,4,NULL,NULL,606),(265,'17011','陈佳','201700202',8,4,NULL,NULL,607),(266,'17041','莫智懿','201700202',8,4,216,'00',608),(267,'17025','吴炎桃','201700202',8,4,NULL,NULL,609),(268,'27105','许传本','201700202',8,4,NULL,NULL,610),(269,'17074','庞光垚','201700202',8,4,215,'05',611),(270,'17224','朱肖颖','201700202',8,4,NULL,NULL,612),(271,'17221','陈悦','201700202',8,4,NULL,NULL,613),(272,'17075','何希','201700202',8,4,NULL,NULL,614),(273,'17079','蒲保兴','201700202',8,4,NULL,NULL,615),(274,'17007','陆科达','201700202',8,4,215,'02',616),(275,'21022','覃桂茳','201700202',7,9,NULL,NULL,617),(276,'17049','汪梅','201700202',3,6,NULL,NULL,618),(277,'17134','冀肖榆','201700202',3,14,NULL,NULL,619),(278,'21005','李连芬','201700202',3,14,NULL,NULL,620),(279,'21016','覃学文','201700202',7,9,NULL,NULL,621),(280,'21080','李岚','201700202',7,9,NULL,NULL,622),(281,'28009','胡庆席','201700202',7,9,NULL,NULL,623),(282,'21014','石向东','201700202',7,9,NULL,NULL,624),(283,'21017','许成章','201700202',7,9,NULL,NULL,625),(284,'21019','赵贤','201700202',7,9,NULL,NULL,626),(285,'21054','杨甲山','201700202',7,9,NULL,NULL,627),(286,'30011','赵春茹','201700202',7,9,NULL,NULL,628),(287,'21001','谭伟明','201700202',7,9,NULL,NULL,629),(288,'17020','李健','201700202',10,12,NULL,NULL,630),(289,'30003','吴飞燕','201700202',10,12,NULL,NULL,631),(290,'17254','张东月','201700202',3,14,NULL,NULL,632),(291,'17010','贺杰','201700202',10,12,NULL,NULL,633),(292,'17062','邸臻炜','201700202',10,12,NULL,NULL,634),(293,'17044','宫海晓','201700202',10,12,NULL,NULL,635),(294,'17033','黄筱佟','201700202',10,12,NULL,NULL,636),(295,'17031','李翊','201700202',10,12,NULL,NULL,637),(296,'17213','郑明','201700202',10,12,NULL,NULL,638),(297,'17214','杨秋慧','201700202',10,12,NULL,NULL,639),(298,'17046','何高明','201700202',4,5,212,'00',640),(299,'17027','蒋琳琼','201700202',4,5,NULL,NULL,641),(300,'17019','李海英','201700202',4,5,213,'22',642),(301,'21013','莫协强','201700202',7,9,NULL,NULL,643),(302,'06003','陈红','201700202',10,11,NULL,NULL,644),(303,'21012','黄劲','201700202',10,11,NULL,NULL,645),(304,'21011','刘敏捷','201700202',10,11,NULL,NULL,646),(305,'30013','涂井先','201700202',10,11,NULL,NULL,647);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_directions`
--

LOCK TABLES `teacher_directions` WRITE;
/*!40000 ALTER TABLE `teacher_directions` DISABLE KEYS */;
INSERT INTO `teacher_directions` VALUES (1,1,266,2020),(3,3,266,2020),(4,8,298,2020),(5,8,300,2020),(6,1,274,2020),(7,3,274,2020),(8,3,269,2020),(9,1,269,2020);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_major`
--

LOCK TABLES `teacher_major` WRITE;
/*!40000 ALTER TABLE `teacher_major` DISABLE KEYS */;
INSERT INTO `teacher_major` VALUES (1,266,4,2020),(2,266,15,2020),(3,266,14,2020),(4,266,11,2020),(5,298,5,2020),(6,300,5,2020),(7,300,6,2020),(8,274,14,2020),(9,274,4,2020),(10,269,9,2020),(11,269,5,2020),(12,269,4,2020),(13,269,15,2020);
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
) ENGINE=InnoDB AUTO_INCREMENT=1190 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hlep`
--

LOCK TABLES `user_hlep` WRITE;
/*!40000 ALTER TABLE `user_hlep` DISABLE KEYS */;
INSERT INTO `user_hlep` VALUES (1,'admin','admin','admin','3','2019-12-06 00:49:11',NULL,'0','12','13507749831','11547830091@qq.com','/attached/userImg/2C285D38-F622-437E-B2B7-6CF026C1FEC4_head.jpg'),(596,'苏芳','21010','21010','2','2020-04-21 14:47:37',NULL,'0','','','',NULL),(597,'黄宏本','07003','07003','2','2020-04-21 14:47:37',NULL,'1','','18276297824','1625017540@qq.com','/attached/userImg/6E28A4A4-A6B5-4E1F-91D1-E4C03212640E_5-160401142549.jpg'),(598,'陈聪','17039','17039','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(599,'代丽娴','17018','17018','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(600,'梁菁','17037','17037','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(601,'卢雪燕','17038','17038','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(602,'卿海军','17132','17132','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(603,'农健','17202','17202','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(604,'李宗妮','17076','17076','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(605,'黄洁明','17022','17022','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(606,'梁朝湘','27013','27013','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(607,'陈佳','17011','17011','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(608,'莫智懿','17041','17041','2','2020-04-21 14:51:31',NULL,'1','','18276297824','798890810@qq.com',NULL),(609,'吴炎桃','17025','17025','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(610,'许传本','27105','27105','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(611,'庞光垚','17074','17074','2','2020-04-21 14:51:31',NULL,'1','','18276297824','1035807396@qq.com',NULL),(612,'朱肖颖','17224','17224','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(613,'陈悦','17221','17221','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(614,'何希','17075','17075','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(615,'蒲保兴','17079','17079','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(616,'陆科达','17007','17007','2','2020-04-21 14:51:31',NULL,'1','','18276297824','1586695284@qq.com',NULL),(617,'覃桂茳','21022','21022','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(618,'汪梅','17049','17049','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(619,'冀肖榆','17134','17134','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(620,'李连芬','21005','21005','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(621,'覃学文','21016','21016','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(622,'李岚','21080','21080','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(623,'胡庆席','28009','28009','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(624,'石向东','21014','21014','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(625,'许成章','21017','21017','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(626,'赵贤','21019','21019','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(627,'杨甲山','21054','21054','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(628,'赵春茹','30011','30011','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(629,'谭伟明','21001','21001','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(630,'李健','17020','17020','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(631,'吴飞燕','30003','30003','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(632,'张东月','17254','17254','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(633,'贺杰','17010','17010','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(634,'邸臻炜','17062','17062','2','2020-04-21 14:51:31',NULL,'0','','','',NULL),(635,'宫海晓','17044','17044','2','2020-04-21 14:51:32',NULL,'0','','','',NULL),(636,'黄筱佟','17033','17033','2','2020-04-21 14:51:32',NULL,'0','','','',NULL),(637,'李翊','17031','17031','2','2020-04-21 14:51:32',NULL,'0','','','',NULL),(638,'郑明','17213','17213','2','2020-04-21 14:51:32',NULL,'0','','','',NULL),(639,'杨秋慧','17214','17214','2','2020-04-21 14:51:32',NULL,'0','','','',NULL),(640,'何高明','17046','17046','2','2020-04-21 14:51:32',NULL,'1','','18276297824','15866952842@qq.com',NULL),(641,'蒋琳琼','17027','17027','2','2020-04-21 14:51:32',NULL,'0','','','',NULL),(642,'李海英','17019','17019','2','2020-04-21 14:51:32',NULL,'0','','18276297824','1625017540@qq.com',NULL),(643,'莫协强','21013','21013','2','2020-04-21 14:51:32',NULL,'0','','','',NULL),(644,'陈红','06003','06003','2','2020-04-21 14:51:32',NULL,'0','','','',NULL),(645,'黄劲','21012','21012','2','2020-04-21 14:51:32',NULL,'0','','','',NULL),(646,'刘敏捷','21011','21011','2','2020-04-21 14:51:32',NULL,'0','','','',NULL),(647,'涂井先','30013','30013','2','2020-04-21 14:51:32',NULL,'0','','','',NULL),(648,'陈海洋','201700201101','201700201101','1',NULL,NULL,'0',NULL,'15777503219','975426267@qq.com',NULL),(649,'樊欣亚','201700201103','201700201103','1',NULL,NULL,'0',NULL,'13297748895','1304476503@qq.com',NULL),(650,'花富階','201700201104','201700201104','1',NULL,NULL,'0',NULL,'15777081167','923856614@qq.com',NULL),(651,'黄朝创','201700201105','201700201105','1',NULL,NULL,'0',NULL,'15277424039','1472323032@qq.co',NULL),(652,'黄泽灿','201700201106','201700201106','1',NULL,NULL,'0',NULL,'18078075654','2464713689@qq.com',NULL),(653,'黄志仁','201700201107','201700201107','1',NULL,NULL,'0',NULL,'13788103125','568428432@qq.com',NULL),(654,'姜昊','201700201108','201700201108','1',NULL,NULL,'0',NULL,'15877009417','2694087854@qq.com',NULL),(655,'金鹏','201700201109','201700201109','1',NULL,NULL,'0',NULL,'18107749267','2487016387@qq.com',NULL),(656,'赖有鹏','201700201110','201700201110','1',NULL,NULL,'0',NULL,'18169647300','1136982579@qq.com',NULL),(657,'梁存富','201700201111','201700201111','1',NULL,NULL,'0',NULL,'13978578242','646403398@qq.com',NULL),(658,'梁建钊','201700201112','201700201112','1',NULL,NULL,'0',NULL,'18977952940','1013697862@qq.com',NULL),(659,'梁明水','201700201113','201700201113','1',NULL,NULL,'0',NULL,'17878414875','1315762039@qq.com',NULL),(660,'林德佑','201700201114','201700201114','1',NULL,NULL,'0',NULL,'13026957530','1643335419@qq.com',NULL),(661,'林声深','201700201115','201700201115','1',NULL,NULL,'0',NULL,'13519864421','1643335419@qq.com',NULL),(662,'林源','201700201116','201700201116','1',NULL,NULL,'0',NULL,'17687557394','354161217@qq.com',NULL),(663,'刘华康','201700201117','201700201117','1',NULL,NULL,'0',NULL,'13197583329','',NULL),(664,'卢坚源','201700201118','201700201118','1',NULL,NULL,'0',NULL,'18278595594','1747164904@qq.com',NULL),(665,'鲁昊','201700201119','201700201119','1',NULL,NULL,'0',NULL,'17095699857','2488466216@qq.com',NULL),(666,'罗智超','201700201120','201700201120','1',NULL,NULL,'0',NULL,'18777215783','',NULL),(667,'潘启源','201700201121','201700201121','1',NULL,NULL,'0',NULL,'17878542301','1160759412@qq.com',NULL),(668,'石常鉴','201700201122','201700201122','1',NULL,NULL,'0',NULL,'13687714562','1281092849@qq.com',NULL),(669,'苏旭晴','201700201124','201700201124','1',NULL,NULL,'0',NULL,'18649445217','1492820029@qq.com',NULL),(670,'王昌元','201700201125','201700201125','1',NULL,NULL,'0',NULL,'13557770019','1185540784@qq.com',NULL),(671,'王永盛','201700201126','201700201126','1',NULL,NULL,'0',NULL,'18078765912','756015342@qq.com',NULL),(672,'王钰','201700201127','201700201127','1',NULL,NULL,'0',NULL,'13123541619','1907814275@qq.com',NULL),(673,'余金明','201700201128','201700201128','1',NULL,NULL,'0',NULL,'15678562651','2296997923@qq.com',NULL),(674,'张鸿飞','201700201129','201700201129','1',NULL,NULL,'0',NULL,'13071714418','2539801110@qq.com',NULL),(675,'张明天','201700201130','201700201130','1',NULL,NULL,'0',NULL,'19127332144','mycraft.zhang@foxmail.com',NULL),(676,'钟东强','201700201131','201700201131','1',NULL,NULL,'0',NULL,'18977559951','1356353281@qq.com',NULL),(677,'周斌','201700201132','201700201132','1',NULL,NULL,'0',NULL,'18697951458','1104335877@qq.com',NULL),(678,'周文雷','201700201133','201700201133','1',NULL,NULL,'0',NULL,'18876772434','2356983281@qq.com',NULL),(679,'甘雄清','201700201135','201700201135','1',NULL,NULL,'1',NULL,'19127332143','2585049335@qq.com',NULL),(680,'黄丽娜','201700201136','201700201136','1',NULL,NULL,'1',NULL,'13036948535','2932423827@qq.com',NULL),(681,'黄清群','201700201137','201700201137','1',NULL,NULL,'1',NULL,'18894843903','1337935911@qq.com',NULL),(682,'李彩华','201700201140','201700201140','1',NULL,NULL,'1',NULL,'18207851006','1520317641@qq.com',NULL),(683,'李夏玮','201700201141','201700201141','1',NULL,NULL,'1',NULL,'15278311998','1124821834@qq.com',NULL),(684,'刘殿娥','201700201144','201700201144','1',NULL,NULL,'1',NULL,'13978537870','1102116169@qq.com',NULL),(685,'蒙晓凤','201700201145','201700201145','1',NULL,NULL,'1',NULL,'18378727340','2740298069@qq.com',NULL),(686,'欧秋月','201700201146','201700201146','1',NULL,NULL,'1',NULL,'13481779003','2979455650@qq. com',NULL),(687,'苏金静','201700201147','201700201147','1',NULL,NULL,'1',NULL,'18377867841','1987113899@qq.com',NULL),(688,'覃钰莹','201700201148','201700201148','1',NULL,NULL,'1',NULL,'18078788613','742315491@qq.com',NULL),(689,'熊翠香','201700201150','201700201150','1',NULL,NULL,'1',NULL,'18376878217','1431804387@qq.com',NULL),(690,'张颖','201700201151','201700201151','1',NULL,NULL,'1',NULL,'15777708125','1134491954@qq.com',NULL),(691,'叶智崇','201700602123','201700602123','1',NULL,NULL,'0',NULL,'18707853689','',NULL),(692,'陈检','201701902230','201701902230','1',NULL,NULL,'1',NULL,'13878467462','2374330850@qq.com',NULL),(693,'冼乐华','201700602121','201700602121','1',NULL,NULL,'0',NULL,'15777454383','352068815@qq.com',NULL),(694,'刘军成','201700602112','201700602112','1',NULL,NULL,'0',NULL,'14777624391','1873987938@qq.com',NULL),(695,'陈瀚文','201700208102','201700208102','1',NULL,NULL,'0',NULL,'15107796258','602888783qq.com',NULL),(696,'陈天昊','201700208103','201700208103','1',NULL,NULL,'0',NULL,'13367625025','1561521801qq.com',NULL),(697,'崔秀','201700208104','201700208104','1',NULL,NULL,'0',NULL,'13558349755','1768776298qq.com',NULL),(698,'邓开荣','201700208105','201700208105','1',NULL,NULL,'0',NULL,'18894711225','1270795825qq.com',NULL),(699,'方钦球','201700208106','201700208106','1',NULL,NULL,'0',NULL,'18877027132','2998657166qq.com',NULL),(700,'郭确宁','201700208107','201700208107','1',NULL,NULL,'0',NULL,'18707815015','1975932346qq.com',NULL),(701,'黄富森','201700208108','201700208108','1',NULL,NULL,'0',NULL,'13471637408','737708369qq.com',NULL),(702,'黄建柱','201700208109','201700208109','1',NULL,NULL,'0',NULL,'18777612652','1422292586qq.com',NULL),(703,'黄增送','201700208110','201700208110','1',NULL,NULL,'0',NULL,'18276945520','2636337353qq.com',NULL),(704,'李波','201700208112','201700208112','1',NULL,NULL,'0',NULL,'15909558287','1031150034qq.com',NULL),(705,'梁斌斌','201700208114','201700208114','1',NULL,NULL,'0',NULL,'15678665213','763217784qq.com',NULL),(706,'梁展铭','201700208115','201700208115','1',NULL,NULL,'0',NULL,'18278577450','',NULL),(707,'廖东华','201700208116','201700208116','1',NULL,NULL,'0',NULL,'13014826654','396995156qq.com',NULL),(708,'刘军保','201700208117','201700208117','1',NULL,NULL,'0',NULL,'13014951754','1304612139qq.com',NULL),(709,'卢品良','201700208119','201700208119','1',NULL,NULL,'0',NULL,'1363521231','850256142qq.com',NULL),(710,'农德森','201700208120','201700208120','1',NULL,NULL,'0',NULL,'18377715119','1061532878qq.com',NULL),(711,'潘毅','201700208121','201700208121','1',NULL,NULL,'0',NULL,'15778408282','903896682qq.com',NULL),(712,'苏泓瑞','201700208122','201700208122','1',NULL,NULL,'0',NULL,'18203018139','1270906834qq.com',NULL),(713,'谭锦意','201700208123','201700208123','1',NULL,NULL,'0',NULL,'15977985872','1124077355qq.com',NULL),(714,'魏宏宇','201700208125','201700208125','1',NULL,NULL,'0',NULL,'15211307118','838381550qq.com',NULL),(715,'谢洪','201700208126','201700208126','1',NULL,NULL,'0',NULL,'13207891020','744478068qq.com',NULL),(716,'杨洪璋','201700208127','201700208127','1',NULL,NULL,'0',NULL,'18477066833','2419922478qq.com',NULL),(717,'袁力航','201700208128','201700208128','1',NULL,NULL,'0',NULL,'15017144850','1529981928qq.com',NULL),(718,'张世贵','201700208129','201700208129','1',NULL,NULL,'0',NULL,'18894696077','564314839qq.com',NULL),(719,'赵海博','201700208130','201700208130','1',NULL,NULL,'0',NULL,'15593179515','1975737676qq.com',NULL),(720,'周日月','201700208131','201700208131','1',NULL,NULL,'0',NULL,'18307884396','1742204618qq.com',NULL),(721,'陈家燕','201700208132','201700208132','1',NULL,NULL,'1',NULL,'15678096756','2223611488qq.com',NULL),(722,'董冰雪','201700208133','201700208133','1',NULL,NULL,'1',NULL,'13005971613','2639181852qq.com',NULL),(723,'冯莲','201700208134','201700208134','1',NULL,NULL,'1',NULL,'18176650870','1252493400qq.com',NULL),(724,'赖锦威','201700208136','201700208136','1',NULL,NULL,'1',NULL,'18688845764','2453552142qq.com',NULL),(725,'兰文静','201700208137','201700208137','1',NULL,NULL,'1',NULL,'18725726759','2449332443qq.com',NULL),(726,'凌丽华','201700208138','201700208138','1',NULL,NULL,'1',NULL,'18269208923','1032160439qq.com',NULL),(727,'罗珍梅','201700208139','201700208139','1',NULL,NULL,'1',NULL,'15878425470','1602706170qq.com',NULL),(728,'莫思','201700208140','201700208140','1',NULL,NULL,'1',NULL,'15777288825','1184688385qq.com',NULL),(729,'齐美琳','201700208141','201700208141','1',NULL,NULL,'1',NULL,'15620223084','1159356454qq.com',NULL),(730,'覃浩容','201700208142','201700208142','1',NULL,NULL,'1',NULL,'18107783350','1056899579qq.com',NULL),(731,'谢江英','201700208143','201700208143','1',NULL,NULL,'1',NULL,'18776673217','1416300651qq.com',NULL),(732,'叶诗瑶','201700208144','201700208144','1',NULL,NULL,'1',NULL,'15878057496','1750370228qq.com',NULL),(733,'叶婷','201700208145','201700208145','1',NULL,NULL,'1',NULL,'18178699373','869619297qq.com',NULL),(734,'张芬','201700208146','201700208146','1',NULL,NULL,'1',NULL,'13677830532','2251863318qq.com',NULL),(735,'朱美锦','201700208147','201700208147','1',NULL,NULL,'1',NULL,'15778780549','923503366@qq.com',NULL),(736,'蒂安娜','201700208148','201700208148','1',NULL,NULL,'1',NULL,'13217747893','3208520937QQ.com',NULL),(737,'陈勉军','201701901302','201701901302','1',NULL,NULL,'0',NULL,'18555393056','2945388804@qq.com',NULL),(738,'黄俊','201701817127','201701817127','1',NULL,NULL,'1',NULL,'13667846694','2944815430@qq.com',NULL),(739,'冉冉','201700806150','201700806150','1',NULL,NULL,'1',NULL,'19977445664','1668217493@qq.com',NULL),(740,'吕梓萌','201701901437','201701901437','1',NULL,NULL,'1',NULL,'13263869830','1164435636@qq.com',NULL),(741,'陈思扬','201700208201','201700208201','1',NULL,NULL,'0',NULL,'13737558249','',NULL),(742,'崔锦','201700208202','201700208202','1',NULL,NULL,'0',NULL,'15091979682','',NULL),(743,'黄结','201700208203','201700208203','1',NULL,NULL,'0',NULL,'18277404022','',NULL),(744,'黄俊玮','201700208204','201700208204','1',NULL,NULL,'0',NULL,'15778604301','',NULL),(745,'黄盛军','201700208205','201700208205','1',NULL,NULL,'0',NULL,'18776633690','',NULL),(746,'季宏','201700208206','201700208206','1',NULL,NULL,'0',NULL,'15547151203','',NULL),(747,'劳奕谋','201700208207','201700208207','1',NULL,NULL,'0',NULL,'15777795312','',NULL),(748,'李日鑫','201700208208','201700208208','1',NULL,NULL,'0',NULL,'18707740029','',NULL),(749,'廖正灵','201700208209','201700208209','1',NULL,NULL,'0',NULL,'15278146753','',NULL),(750,'林明君','201700208210','201700208210','1',NULL,NULL,'0',NULL,'17677360480','',NULL),(751,'林已弄','201700208211','201700208211','1',NULL,NULL,'0',NULL,'15277077683','',NULL),(752,'林志海','201700208212','201700208212','1',NULL,NULL,'0',NULL,'15577179357','',NULL),(753,'林忠陆','201700208213','201700208213','1',NULL,NULL,'0',NULL,'13005977502','',NULL),(754,'卢森柱','201700208215','201700208215','1',NULL,NULL,'0',NULL,'18814483324','',NULL),(755,'马里弟','201700208216','201700208216','1',NULL,NULL,'0',NULL,'19127332994','',NULL),(756,'苏小锋','201700208217','201700208217','1',NULL,NULL,'0',NULL,'13132749312','',NULL),(757,'覃彬烘','201700208218','201700208218','1',NULL,NULL,'0',NULL,'18278539752','',NULL),(758,'汤海明','201700208220','201700208220','1',NULL,NULL,'0',NULL,'14795284248','',NULL),(759,'王海明','201700208221','201700208221','1',NULL,NULL,'0',NULL,'14795383375','',NULL),(760,'韦永恒','201700208222','201700208222','1',NULL,NULL,'0',NULL,'18776676765','',NULL),(761,'卫星桦','201700208223','201700208223','1',NULL,NULL,'0',NULL,'13878923202','',NULL),(762,'夏祥瑞','201700208224','201700208224','1',NULL,NULL,'0',NULL,'18325036347','',NULL),(763,'颜佩辛','201700208225','201700208225','1',NULL,NULL,'0',NULL,'18304209023','',NULL),(764,'姚智','201700208226','201700208226','1',NULL,NULL,'0',NULL,'18277406896','',NULL),(765,'曾家伟','201700208227','201700208227','1',NULL,NULL,'0',NULL,'17677308497','',NULL),(766,'张钦','201700208228','201700208228','1',NULL,NULL,'0',NULL,'15177538011','',NULL),(767,'郑俊彬','201700208229','201700208229','1',NULL,NULL,'0',NULL,'13768199079','',NULL),(768,'朱桓博','201700208230','201700208230','1',NULL,NULL,'0',NULL,'15907740369','',NULL),(769,'左丰维','201700208231','201700208231','1',NULL,NULL,'0',NULL,'18376372602','',NULL),(770,'陈晓娜','201700208232','201700208232','1',NULL,NULL,'1',NULL,'15041118522','',NULL),(771,'方小深','201700208233','201700208233','1',NULL,NULL,'1',NULL,'13517646049','',NULL),(772,'何燕玲','201700208234','201700208234','1',NULL,NULL,'1',NULL,'15878058471','',NULL),(773,'黄彩玉','201700208235','201700208235','1',NULL,NULL,'1',NULL,'15278652207','',NULL),(774,'莫淋茸','201700208237','201700208237','1',NULL,NULL,'1',NULL,'15777355490','',NULL),(775,'莫珊珊','201700208238','201700208238','1',NULL,NULL,'1',NULL,'18107749075','',NULL),(776,'孙清梅','201700208239','201700208239','1',NULL,NULL,'1',NULL,'18074969320','',NULL),(777,'孙士杰','201700208240','201700208240','1',NULL,NULL,'1',NULL,'15894883623','',NULL),(778,'滕玉玲','201700208241','201700208241','1',NULL,NULL,'1',NULL,'18775030621','',NULL),(779,'王小莉','201700208242','201700208242','1',NULL,NULL,'1',NULL,'18276404472','',NULL),(780,'吴方梅','201700208243','201700208243','1',NULL,NULL,'1',NULL,'18077756007','',NULL),(781,'吴水玲','201700208244','201700208244','1',NULL,NULL,'1',NULL,'13617849421','',NULL),(782,'杨惠如','201700208245','201700208245','1',NULL,NULL,'1',NULL,'15977798969','',NULL),(783,'周柔余','201700208246','201700208246','1',NULL,NULL,'1',NULL,'15506896930','',NULL),(784,'陈春胜','201700208301','201700208301','1',NULL,NULL,'0',NULL,'18376476200','2650811721@qq.com',NULL),(785,'陈科锋','201700208302','201700208302','1',NULL,NULL,'0',NULL,'15278752593','1479150664@qq.com',NULL),(786,'陈世乾','201700208303','201700208303','1',NULL,NULL,'0',NULL,'18278589307','1531627526@qq.com',NULL),(787,'陈裕淇','201700208304','201700208304','1',NULL,NULL,'0',NULL,'13457709031','814685390@qq.com',NULL),(788,'符隆权','201700208305','201700208305','1',NULL,NULL,'0',NULL,'18177446097','486100068@qq.com',NULL),(789,'黄运康','201700208306','201700208306','1',NULL,NULL,'0',NULL,'14736299101','1097314407@qq.com',NULL),(790,'黄志伟','201700208307','201700208307','1',NULL,NULL,'0',NULL,'15578505226','485484966@qq.com',NULL),(791,'蓝永锋','201700208308','201700208308','1',NULL,NULL,'0',NULL,'18977495963','767224281@qq.com',NULL),(792,'李佳杰','201700208309','201700208309','1',NULL,NULL,'0',NULL,'13977174486','1942524157@qq.com',NULL),(793,'梁寿江','201700208310','201700208310','1',NULL,NULL,'0',NULL,'13132844537','1432467846@qq.com',NULL),(794,'梁树鹏','201700208311','201700208311','1',NULL,NULL,'0',NULL,'13087985035','545629073@qq.com',NULL),(795,'梁伟钊','201700208312','201700208312','1',NULL,NULL,'0',NULL,'18977408872','466379650@qq.com',NULL),(796,'刘浩南','201700208313','201700208313','1',NULL,NULL,'0',NULL,'15109130240','1771189409@qq.com',NULL),(797,'刘健旭','201700208314','201700208314','1',NULL,NULL,'0',NULL,'13087986082','1473990960@qq.com',NULL),(798,'刘天龙','201700208315','201700208315','1',NULL,NULL,'0',NULL,'15778256414','1327462549@qq.com',NULL),(799,'卢永恒','201700208316','201700208316','1',NULL,NULL,'0',NULL,'15907890121','1442770200@qq.com',NULL),(800,'卢泳宏','201700208317','201700208317','1',NULL,NULL,'0',NULL,'13025983768','2396402882@qq.com',NULL),(801,'马斌基','201700208318','201700208318','1',NULL,NULL,'0',NULL,'15177973486','2951317689@qq.com',NULL),(802,'彭宣瑞','201700208319','201700208319','1',NULL,NULL,'0',NULL,'13657746800','2545418517@qq.com',NULL),(803,'祁发宏','201700208320','201700208320','1',NULL,NULL,'0',NULL,'15500519449','1121335802@qq.com',NULL),(804,'王必标','201700208321','201700208321','1',NULL,NULL,'0',NULL,'18277807107','2285400978@qq.com',NULL),(805,'王佳辉','201700208322','201700208322','1',NULL,NULL,'0',NULL,'18258362127','799919338@qq.com',NULL),(806,'王崎','201700208323','201700208323','1',NULL,NULL,'0',NULL,'18789910595','1014196712@qq.com',NULL),(807,'易洪升','201700208325','201700208325','1',NULL,NULL,'0',NULL,'15777786151','764373897@qq.com',NULL),(808,'张松','201700208326','201700208326','1',NULL,NULL,'0',NULL,'18230901173','2411845404@qq.com',NULL),(809,'张艺昌','201700208327','201700208327','1',NULL,NULL,'0',NULL,'18578973879','1037763357@qq.com',NULL),(810,'钟蔼焕','201700208328','201700208328','1',NULL,NULL,'0',NULL,'15278381738','2401510949@qq.com',NULL),(811,'钟国财','201700208329','201700208329','1',NULL,NULL,'0',NULL,'13737802050','1920836710@qq.com',NULL),(812,'周加勇','201700208330','201700208330','1',NULL,NULL,'0',NULL,'18376491299','1803520848@qq.com',NULL),(813,'周业鸿','201700208331','201700208331','1',NULL,NULL,'0',NULL,'15578402443','807195052@qq.com',NULL),(814,'鲍厚丽','201700208332','201700208332','1',NULL,NULL,'1',NULL,'15777614285','2539449529@qq.com',NULL),(815,'陈晶晶','201700208333','201700208333','1',NULL,NULL,'1',NULL,'15977546734','1011884302@qq.com',NULL),(816,'陈小艳','201700208334','201700208334','1',NULL,NULL,'1',NULL,'13557249469','2274976805@qq.com',NULL),(817,'陈馨','201700208335','201700208335','1',NULL,NULL,'1',NULL,'13627862475','1609012483@qq.com',NULL),(818,'段伶','201700208336','201700208336','1',NULL,NULL,'1',NULL,'18088200886','2929681854@qq.com',NULL),(819,'李秋蓉','201700208337','201700208337','1',NULL,NULL,'1',NULL,'18878799707','2431149269@qq.com',NULL),(820,'李小波','201700208338','201700208338','1',NULL,NULL,'1',NULL,'18707897012','1974155177@qq.com',NULL),(821,'卢小林','201700208339','201700208339','1',NULL,NULL,'1',NULL,'18775678450','1679832478@qq.com',NULL),(822,'吕美琴','201700208340','201700208340','1',NULL,NULL,'1',NULL,'13877415276','1713312807@qq.com',NULL),(823,'谭文小','201700208342','201700208342','1',NULL,NULL,'1',NULL,'18897872521','2223004421@qq.com',NULL),(824,'韦金玉','201700208343','201700208343','1',NULL,NULL,'1',NULL,'18778914710','764268808@qq.com',NULL),(825,'魏宇雪','201700208344','201700208344','1',NULL,NULL,'1',NULL,'18713105390','1050683938@qq.com',NULL),(826,'吴预嫩','201700208345','201700208345','1',NULL,NULL,'1',NULL,'18276488976','3229407921@qq.com',NULL),(827,'谢丹妮','201700208346','201700208346','1',NULL,NULL,'1',NULL,'18276143221','601798268@qq.com',NULL),(828,'保旻','201700208401','201700208401','1',NULL,NULL,'0',NULL,'18297222021','120551137@qq.com',NULL),(829,'陈楚文','201700208402','201700208402','1',NULL,NULL,'0',NULL,'18278546112','1277100764@qq.com',NULL),(830,'陈松松','201700208403','201700208403','1',NULL,NULL,'0',NULL,'18376476233','2235652218@qq.com',NULL),(831,'陈熙官','201700208404','201700208404','1',NULL,NULL,'0',NULL,'15278317057','1209238168@qq.com',NULL),(832,'陈俞可','201700208405','201700208405','1',NULL,NULL,'0',NULL,'15777625081','2443547124@qq.com',NULL),(833,'杜威征','201700208406','201700208406','1',NULL,NULL,'0',NULL,'15906421311','1165047191@qq.com',NULL),(834,'方乾','201700208407','201700208407','1',NULL,NULL,'0',NULL,'18076369135','825061698@qq.com',NULL),(835,'甘绍宽','201700208408','201700208408','1',NULL,NULL,'0',NULL,'18477110952','1950664788@qq.com',NULL),(836,'扈北泉','201700208409','201700208409','1',NULL,NULL,'0',NULL,'15278345338','1761753003@qq.com',NULL),(837,'黄崇爱','201700208410','201700208410','1',NULL,NULL,'0',NULL,'14777106569','1007526263@qq.com',NULL),(838,'黄垂明','201700208411','201700208411','1',NULL,NULL,'0',NULL,'18289260383','1750562592@qq.com',NULL),(839,'黄海浪','201700208412','201700208412','1',NULL,NULL,'0',NULL,'15778398060','1306994135@qq.com',NULL),(840,'黄华露','201700208413','201700208413','1',NULL,NULL,'0',NULL,'18078520346','858765507@qq.com',NULL),(841,'黄森','201700208414','201700208414','1',NULL,NULL,'0',NULL,'15778567028','1791395052@qq.com',NULL),(842,'黎文泉','201700208415','201700208415','1',NULL,NULL,'0',NULL,'13627741016','963520497@qq.com',NULL),(843,'李春金','201700208416','201700208416','1',NULL,NULL,'0',NULL,'17687457127','2236898673@qq.com',NULL),(844,'李范钊','201700208417','201700208417','1',NULL,NULL,'0',NULL,'18897598747','1835543303@qq.com',NULL),(845,'李佳星','201700208418','201700208418','1',NULL,NULL,'0',NULL,'15078167125','1832563315@qq.com',NULL),(846,'李培玉','201700208419','201700208419','1',NULL,NULL,'0',NULL,'13978966744','1754977801@qq.com',NULL),(847,'龙家林','201700208420','201700208420','1',NULL,NULL,'0',NULL,'15077575779','984172161@qq.com',NULL),(848,'陆昌志','201700208421','201700208421','1',NULL,NULL,'0',NULL,'13627744451','3048463793@qq.com',NULL),(849,'陆建兵','201700208422','201700208422','1',NULL,NULL,'0',NULL,'13737871732','',NULL),(850,'陆晓飞','201700208423','201700208423','1',NULL,NULL,'0',NULL,'13737880084','673097994@qq.com',NULL),(851,'莫智帆','201700208424','201700208424','1',NULL,NULL,'0',NULL,'18776006499','1217567927@qq.com',NULL),(852,'潘柏钦','201700208425','201700208425','1',NULL,NULL,'0',NULL,'18269482972','1718200217@qq.com',NULL),(853,'覃能健','201700208426','201700208426','1',NULL,NULL,'0',NULL,'15224634378','2898772052@qq.com',NULL),(854,'唐广德','201700208427','201700208427','1',NULL,NULL,'0',NULL,'18172596601','1661373670@qq.com',NULL),(855,'吴顺东','201700208428','201700208428','1',NULL,NULL,'0',NULL,'18778738251','1670273914@qq.com',NULL),(856,'杨松','201700208430','201700208430','1',NULL,NULL,'0',NULL,'13117749446','song4828@qq.com',NULL),(857,'周军','201700208431','201700208431','1',NULL,NULL,'0',NULL,'18376943301','2313273074@qq.com',NULL),(858,'包建宏','201700208432','201700208432','1',NULL,NULL,'1',NULL,'13557748470','1264853392@qq.com',NULL),(859,'蔡晓梅','201700208433','201700208433','1',NULL,NULL,'1',NULL,'17807775070','2513018185@qq.com',NULL),(860,'戴艳冰','201700208434','201700208434','1',NULL,NULL,'1',NULL,'18172130266','1932759432@qq.com',NULL),(861,'蒋冬梅','201700208435','201700208435','1',NULL,NULL,'1',NULL,'15078387140','2576424073@qq.com',NULL),(862,'赖秋帆','201700208436','201700208436','1',NULL,NULL,'1',NULL,'13878417396','1014232755@qq.com',NULL),(863,'兰云','201700208437','201700208437','1',NULL,NULL,'1',NULL,'13407771595','644640052@qq.com',NULL),(864,'刘俊婷','201700208438','201700208438','1',NULL,NULL,'1',NULL,'18648846496','1965414516@qq.com',NULL),(865,'卢美艳','201700208439','201700208439','1',NULL,NULL,'1',NULL,'18377457173','1215240465@qq.com',NULL),(866,'覃寿兰','201700208441','201700208441','1',NULL,NULL,'1',NULL,'18207749455','1963267497@qq.com',NULL),(867,'杨连英','201700208442','201700208442','1',NULL,NULL,'1',NULL,'18276264367','3143956224@qq.com',NULL),(868,'杨秋月','201700208443','201700208443','1',NULL,NULL,'1',NULL,'13471803862','3210981191@qq.com',NULL),(869,'赵晓漫','201700208444','201700208444','1',NULL,NULL,'1',NULL,'13025977718','2390957628@qq.com',NULL),(870,'郑秋梅','201700208445','201700208445','1',NULL,NULL,'1',NULL,'18477029080','1739579736@qq.com',NULL),(871,'周丽云','201700208446','201700208446','1',NULL,NULL,'1',NULL,'18648840830','1486201775@qq.com',NULL),(872,'蔡奇峰','201700208501','201700208501','1',NULL,NULL,'0',NULL,'18377507533','1748672727@qq.com',NULL),(873,'陈昱全','201700208502','201700208502','1',NULL,NULL,'0',NULL,'13097949018','1098085284@qq.com',NULL),(874,'冯榆','201700208503','201700208503','1',NULL,NULL,'0',NULL,'18776598909','346382069@qq.com',NULL),(875,'符恒','201700208504','201700208504','1',NULL,NULL,'0',NULL,'14777711826',' 2270878082@qq.com',NULL),(876,'黄开林','201700208505','201700208505','1',NULL,NULL,'0',NULL,'15278475734','2413141267@qq.com',NULL),(877,'李善奇','201700208506','201700208506','1',NULL,NULL,'0',NULL,'18776058850','1871892183@qq.com',NULL),(878,'李彦朋','201700208507','201700208507','1',NULL,NULL,'0',NULL,'17660821182','945380970@qq.com',NULL),(879,'廖湘伟','201700208508','201700208508','1',NULL,NULL,'0',NULL,'18177405623','1474139517@qq.com',NULL),(880,'刘牌','201700208509','201700208509','1',NULL,NULL,'0',NULL,'13657746155','2319492349@qq.com',NULL),(881,'罗凤宽','201700208510','201700208510','1',NULL,NULL,'0',NULL,'13558346086','1416765585@qq.com',NULL),(882,'莫一威','201700208512','201700208512','1',NULL,NULL,'0',NULL,'18377441681','1763337625@qq.com',NULL),(883,'宁锦邦','201700208513','201700208513','1',NULL,NULL,'0',NULL,'15807870050','1239814150@qq.com',NULL),(884,'彭佳豪','201700208514','201700208514','1',NULL,NULL,'0',NULL,'13315489972','1092778794@qq.com',NULL),(885,'谭卢钢','201700208517','201700208517','1',NULL,NULL,'0',NULL,'13617786374','',NULL),(886,'谭炫','201700208518','201700208518','1',NULL,NULL,'0',NULL,'18574736474','2801733070@qq.com',NULL),(887,'韦昌泽','201700208519','201700208519','1',NULL,NULL,'0',NULL,'13471939605','1340743099@qq.com',NULL),(888,'韦锰宝','201700208520','201700208520','1',NULL,NULL,'0',NULL,'15177388915','1252571360@qq.com',NULL),(889,'韦裕波','201700208521','201700208521','1',NULL,NULL,'0',NULL,'14777596332','1904469081@qq.com',NULL),(890,'夏维','201700208522','201700208522','1',NULL,NULL,'0',NULL,'18577324813','1069627658@qq.com',NULL),(891,'肖楚亮','201700208523','201700208523','1',NULL,NULL,'0',NULL,'15826933325','2810281841@qq.com',NULL),(892,'杨彪','201700208524','201700208524','1',NULL,NULL,'0',NULL,'18276297824','1625017540@qq.com',NULL),(893,'袁智彪','201700208525','201700208525','1',NULL,NULL,'0',NULL,'19976303829','1035807396@qq.com',NULL),(894,'张广辉','201700208526','201700208526','1',NULL,NULL,'0',NULL,'18169698024','920914961@qq.com',NULL),(895,'张起斌','201700208527','201700208527','1',NULL,NULL,'0',NULL,'18607745749','277630636@qq.com',NULL),(896,'张志豪','201700208528','201700208528','1',NULL,NULL,'0',NULL,'13566815778','853712933@qq.com',NULL),(897,'赵恒','201700208529','201700208529','1',NULL,NULL,'0',NULL,'13557404419','1181831972@qq.com',NULL),(898,'郑乾威','201700208530','201700208530','1',NULL,NULL,'0',NULL,'18587470710','798890810@qq.com',NULL),(899,'陈少云','201700208531','201700208531','1',NULL,NULL,'1',NULL,'18697949601','330095246@qq.com',NULL),(900,'陈水兰','201700208532','201700208532','1',NULL,NULL,'1',NULL,'13557249563','1134071488@qq.com',NULL),(901,'代红玉','201700208533','201700208533','1',NULL,NULL,'1',NULL,'18376359954','1305861437@qq.com',NULL),(902,'董丽凤','201700208534','201700208534','1',NULL,NULL,'1',NULL,'18587425202','1370860262@qq.com',NULL),(903,'窦禹雪','201700208535','201700208535','1',NULL,NULL,'1',NULL,'15078019343','2292547145@qq.com',NULL),(904,'金晓凌','201700208538','201700208538','1',NULL,NULL,'1',NULL,'15278951351','2438197508@qq.com',NULL),(905,'李雪莲','201700208539','201700208539','1',NULL,NULL,'1',NULL,'15077644660','1370042656@qq.com',NULL),(906,'廖晓晴','201700208540','201700208540','1',NULL,NULL,'1',NULL,'15878055426','529869622@qq.com',NULL),(907,'卢海铃','201700208541','201700208541','1',NULL,NULL,'1',NULL,'13878973180','1286924702@qq.com',NULL),(908,'杨文清','201700208543','201700208543','1',NULL,NULL,'1',NULL,'13197585389','3461578059@qq.com',NULL),(909,'叶显守','201700208544','201700208544','1',NULL,NULL,'1',NULL,'15777443381','',NULL),(910,'周晓梅','201700208546','201700208546','1',NULL,NULL,'1',NULL,'13978909592','',NULL),(911,'冯其江','201700208602','201700208602','1',NULL,NULL,'0',NULL,'18386247745','1679308514@qq.com',NULL),(912,'何文良','201700208603','201700208603','1',NULL,NULL,'0',NULL,'17677029850','1037788905@qq.com',NULL),(913,'蒋世凯','201700208605','201700208605','1',NULL,NULL,'0',NULL,'18775072195','543187005@qq.com',NULL),(914,'林才楗','201700208606','201700208606','1',NULL,NULL,'0',NULL,'15777719573','1552307472@qq.com',NULL),(915,'陆柏成','201700208607','201700208607','1',NULL,NULL,'0',NULL,'18077449720','767702467@QQ.com',NULL),(916,'陆泓君','201700208608','201700208608','1',NULL,NULL,'0',NULL,'15778510134','1448974725@qq.com',NULL),(917,'吕成龙','201700208609','201700208609','1',NULL,NULL,'0',NULL,'13289096371','945913857@qq.com',NULL),(918,'马晓龙','201700208610','201700208610','1',NULL,NULL,'0',NULL,'18277414709','1518315916@qq.com',NULL),(919,'宁柄嵛','201700208611','201700208611','1',NULL,NULL,'0',NULL,'17878003407','1023252492@qq.com',NULL),(920,'潘先源','201700208612','201700208612','1',NULL,NULL,'0',NULL,'18507829097','756680088@qq.com',NULL),(921,'曲建国','201700208613','201700208613','1',NULL,NULL,'0',NULL,'17631454093','1721973504@qq.com',NULL),(922,'石艳鹏','201700208614','201700208614','1',NULL,NULL,'0',NULL,'14795907041','642242698@qq.com',NULL),(923,'宋华健','201700208615','201700208615','1',NULL,NULL,'0',NULL,'18707749701','532504772@qq.com',NULL),(924,'王玉祥','201700208618','201700208618','1',NULL,NULL,'0',NULL,'18866712691','176237628@qq.com',NULL),(925,'韦家聪','201700208619','201700208619','1',NULL,NULL,'0',NULL,'13558349095','2473951862@qq.com',NULL),(926,'吴洪伟','201700208620','201700208620','1',NULL,NULL,'0',NULL,'18154662075','1405834045@qq.com',NULL),(927,'吴伟东','201700208621','201700208621','1',NULL,NULL,'0',NULL,'18377091103','ww55miracle@163.com',NULL),(928,'许多','201700208622','201700208622','1',NULL,NULL,'0',NULL,'13627744495','1967704805@qq.com',NULL),(929,'杨香华','201700208624','201700208624','1',NULL,NULL,'0',NULL,'18269492504','2533788604@qq.com',NULL),(930,'叶成德','201700208625','201700208625','1',NULL,NULL,'0',NULL,'13647778835','1123603741@qq.com',NULL),(931,'余振涛','201700208626','201700208626','1',NULL,NULL,'0',NULL,'13878552675','1814860910@qq.com',NULL),(932,'曾达江','201700208627','201700208627','1',NULL,NULL,'0',NULL,'15878058779','1241441387@qq.com',NULL),(933,'曾伟旗','201700208628','201700208628','1',NULL,NULL,'0',NULL,'18278592486','2383612239@qq.com',NULL),(934,'张治国','201700208629','201700208629','1',NULL,NULL,'0',NULL,'17877107035','1299296260@qq.com',NULL),(935,'周子毅','201700208630','201700208630','1',NULL,NULL,'0',NULL,'18571683406','920293950@qq.com',NULL),(936,'包晚平','201700208631','201700208631','1',NULL,NULL,'1',NULL,'15878424399','1737048925@qq.com',NULL),(937,'陈利琛','201700208632','201700208632','1',NULL,NULL,'1',NULL,'19897823247','2372681409@qq.com',NULL),(938,'陈荣燕','201700208633','201700208633','1',NULL,NULL,'1',NULL,'13977984704','2768268315@qq.com',NULL),(939,'陈燕梅','201700208634','201700208634','1',NULL,NULL,'1',NULL,'13627852754','2273578509@qq.com',NULL),(940,'方莉鑫','201700208635','201700208635','1',NULL,NULL,'1',NULL,'13557149493','1362340760@qq.com',NULL),(941,'梁宇兰','201700208637','201700208637','1',NULL,NULL,'1',NULL,'15878424226','2105235275@qq.com',NULL),(942,'刘贵媛','201700208638','201700208638','1',NULL,NULL,'1',NULL,'13558492726','1084460208@qq.com',NULL),(943,'刘欣','201700208639','201700208639','1',NULL,NULL,'1',NULL,'18172508644','2012305001@qq.com',NULL),(944,'龙凤鸾','201700208640','201700208640','1',NULL,NULL,'1',NULL,'13768423708','1661863963@qq.com',NULL),(945,'麦嘉宜','201700208641','201700208641','1',NULL,NULL,'1',NULL,'15878054852','1367329157@qq.com',NULL),(946,'彭小筱','201700208642','201700208642','1',NULL,NULL,'1',NULL,'13317745747','1647311193@qq.com',NULL),(947,'王芷芬','201700208643','201700208643','1',NULL,NULL,'1',NULL,'13132740960','2417567724@qq.com',NULL),(948,'肖长青','201700208644','201700208644','1',NULL,NULL,'1',NULL,'19897823136','1730227006@qq.com曾任',NULL),(949,'祝善迹','201700208646','201700208646','1',NULL,NULL,'1',NULL,'18977482693','291071347@qq.com',NULL),(950,'梁方华','201500213209','201500213209','1',NULL,NULL,'1',NULL,'18575276708','l2013126@126.com',NULL),(951,'吴子平','201500213121','201500213121','1',NULL,NULL,'0',NULL,'18777943983','1332911858@qq.com',NULL),(952,'陈勇','201700213101','201700213101','1',NULL,NULL,'0',NULL,'15177584172','1343888646@qq.com',NULL),(953,'党勇辉','201700213102','201700213102','1',NULL,NULL,'0',NULL,'18269164761','1945821212@qq.com',NULL),(954,'董晋夤','201700213103','201700213103','1',NULL,NULL,'0',NULL,'15278404205','908616673@qq.com',NULL),(955,'董兆丰','201700213104','201700213104','1',NULL,NULL,'0',NULL,'19977759193','483326915@qq.com',NULL),(956,'冯宁阳','201700213105','201700213105','1',NULL,NULL,'0',NULL,'13297743005','1989986800@qq.com',NULL),(957,'付升','201700213106','201700213106','1',NULL,NULL,'0',NULL,'13737207428','152759906@qq.com',NULL),(958,'何武达','201700213107','201700213107','1',NULL,NULL,'0',NULL,'18277765620','youshmily@vip.qq.com',NULL),(959,'兰国庆','201700213110','201700213110','1',NULL,NULL,'0',NULL,'15994565623','1545307400@qq.com',NULL),(960,'兰小东','201700213111','201700213111','1',NULL,NULL,'0',NULL,'18776822881','2730049689@qq.com',NULL),(961,'李统方','201700213112','201700213112','1',NULL,NULL,'0',NULL,'15778515865','443690218@qq.com',NULL),(962,'林孝君','201700213114','201700213114','1',NULL,NULL,'0',NULL,'18777105450','461031584@qq.com',NULL),(963,'刘尚隆','201700213115','201700213115','1',NULL,NULL,'0',NULL,'18587765426','1219528581@qq.com',NULL),(964,'刘永渝','201700213116','201700213116','1',NULL,NULL,'0',NULL,'15278224748','2334494445@qq.com',NULL),(965,'卢文钦','201700213117','201700213117','1',NULL,NULL,'0',NULL,'15577550635','1020505418@qq.com',NULL),(966,'陆炳新','201700213118','201700213118','1',NULL,NULL,'0',NULL,'18376884619','1251640979@qq.com',NULL),(967,'陆建彬','201700213119','201700213119','1',NULL,NULL,'0',NULL,'18377765755','609508958@qq.com',NULL),(968,'罗序照','201700213120','201700213120','1',NULL,NULL,'0',NULL,'15007881603','960813602@qq.com',NULL),(969,'罗远迪','201700213121','201700213121','1',NULL,NULL,'0',NULL,'13557525057','1043875292@qq.com',NULL),(970,'麦凯','201700213122','201700213122','1',NULL,NULL,'0',NULL,'18177173367','247516614@qq.com',NULL),(971,'蒙祥庚','201700213123','201700213123','1',NULL,NULL,'0',NULL,'13457893893','1092834535@qq.com',NULL),(972,'饶炳基','201700213124','201700213124','1',NULL,NULL,'0',NULL,'18776316431','2316154461@qq.com',NULL),(973,'韦优东','201700213125','201700213125','1',NULL,NULL,'0',NULL,'17677245505','313638057@qq.com',NULL),(974,'谢振高','201700213126','201700213126','1',NULL,NULL,'0',NULL,'18877262304','760478350@qq.com',NULL),(975,'颜晓明','201700213127','201700213127','1',NULL,NULL,'0',NULL,'18277956642','1462599907@qq.com',NULL),(976,'杨景琦','201700213128','201700213128','1',NULL,NULL,'0',NULL,'18867030628','1076789319@qq.com',NULL),(977,'杨胜涛','201700213129','201700213129','1',NULL,NULL,'0',NULL,'18677894712','y124452610@163.com',NULL),(978,'周星全','201700213130','201700213130','1',NULL,NULL,'0',NULL,'13367706883','120855824@qq.com',NULL),(979,'陈金惠','201700213131','201700213131','1',NULL,NULL,'1',NULL,'18477400142','1427351688@qq.com ',NULL),(980,'陈秋焕','201700213132','201700213132','1',NULL,NULL,'1',NULL,'13297746617','1805146295@qq.com',NULL),(981,'程木媛','201700213133','201700213133','1',NULL,NULL,'1',NULL,'18276438704','2767726366@qq.com',NULL),(982,'葛美伶','201700213134','201700213134','1',NULL,NULL,'1',NULL,'13788048790','2810699547@qq.com',NULL),(983,'黄北兰','201700213135','201700213135','1',NULL,NULL,'1',NULL,'18815870527','1971137721@qq.com',NULL),(984,'黄海妮','201700213136','201700213136','1',NULL,NULL,'1',NULL,'15077462499','1637169930@qq.com',NULL),(985,'李清燕','201700213137','201700213137','1',NULL,NULL,'1',NULL,'18377451570','973968774@qq.com',NULL),(986,'梁炜','201700213138','201700213138','1',NULL,NULL,'1',NULL,'18775119445','1620769241@qq.com',NULL),(987,'梁璇','201700213139','201700213139','1',NULL,NULL,'1',NULL,'18269591993','1610170232@qq.com',NULL),(988,'刘宇萍','201700213141','201700213141','1',NULL,NULL,'1',NULL,'15240682866','2642200701@qq.com',NULL),(989,'罗小佩','201700213143','201700213143','1',NULL,NULL,'1',NULL,'15078455313','2321178701\n@qq.com',NULL),(990,'苏英','201700213144','201700213144','1',NULL,NULL,'1',NULL,'18777548336','2609004969@qq.com',NULL),(991,'谢焕','201700213145','201700213145','1',NULL,NULL,'1',NULL,'13471972635','1501164389@qq .com ',NULL),(992,'严柱玲','201700213146','201700213146','1',NULL,NULL,'1',NULL,'18477401187','2602658791@qq.com',NULL),(993,'余超惠','201700213147','201700213147','1',NULL,NULL,'1',NULL,'18775043753','1154427469@qq.com',NULL),(994,'张雪琳','201700213148','201700213148','1',NULL,NULL,'1',NULL,'18276018906','1209804916@qq.com',NULL),(995,'张燕秋','201700213149','201700213149','1',NULL,NULL,'1',NULL,'13297746862','1005749343@qq.com',NULL),(996,'朱春蓉','201700213150','201700213150','1',NULL,NULL,'1',NULL,'18777102490','1134947653@qq.com',NULL),(997,'潘勇','201500601130','201500601130','1',NULL,NULL,'0',NULL,'18775025400','2250813341@qq.com',NULL),(998,'岑兴宝','201700601101','201700601101','1',NULL,NULL,'0',NULL,'13657748665','1204433139@qq.com',NULL),(999,'陈广荣','201700601102','201700601102','1',NULL,NULL,'0',NULL,'15678658502','1909655200@qq.com',NULL),(1000,'戴载贤','201700601105','201700601105','1',NULL,NULL,'0',NULL,'18378525410','1936047837@qq.com',NULL),(1001,'甘卯光','201700601106','201700601106','1',NULL,NULL,'0',NULL,'18275992889','2839259134@qq.com',NULL),(1002,'赖世镍','201700601108','201700601108','1',NULL,NULL,'0',NULL,'18378119554','1436461505@qq.com',NULL),(1003,'李松泽','201700601109','201700601109','1',NULL,NULL,'0',NULL,'13263763132','1284190640@qq.com',NULL),(1004,'李松泽','201700601110','201700601110','1',NULL,NULL,'0',NULL,'15108050840','3238835956@qq.com',NULL),(1005,'卢显信','201700601111','201700601111','1',NULL,NULL,'0',NULL,'18269224491','413701091@qq.com',NULL),(1006,'莫增祥','201700601113','201700601113','1',NULL,NULL,'0',NULL,'15207834320','1031292353@qq.com',NULL),(1007,'谢承泰','201700601114','201700601114','1',NULL,NULL,'0',NULL,'13132671271','1391904167@qq.com',NULL),(1008,'杨发威','201700601115','201700601115','1',NULL,NULL,'0',NULL,'18775036547','1967659638@qq.com',NULL),(1009,'杨洪懿','201700601116','201700601116','1',NULL,NULL,'0',NULL,'13481828797','1914392081@qq.com',NULL),(1010,'杨志意','201700601117','201700601117','1',NULL,NULL,'0',NULL,'13557746093','1848322257@qq.com',NULL),(1011,'赵万鑫','201700601118','201700601118','1',NULL,NULL,'0',NULL,'13321706610','3315306556@qq.com',NULL),(1012,'钟春才','201700601119','201700601119','1',NULL,NULL,'0',NULL,'15778427841','2293828202@qq.com',NULL),(1013,'周利邦','201700601120','201700601120','1',NULL,NULL,'0',NULL,'18377415195','1426753414@qq.com',NULL),(1014,'包美芳','201700601122','201700601122','1',NULL,NULL,'1',NULL,'13978916704','1044029312@qq.com',NULL),(1015,'贝秋燕','201700601123','201700601123','1',NULL,NULL,'1',NULL,'13687748422','564037674@qq.com',NULL),(1016,'邓文艳','201700601124','201700601124','1',NULL,NULL,'1',NULL,'18807834867','3064109203@qq.com',NULL),(1017,'黄帮','201700601125','201700601125','1',NULL,NULL,'1',NULL,'18107748994','1070455716@qq.com',NULL),(1018,'黄春燕','201700601126','201700601126','1',NULL,NULL,'1',NULL,'18277140442','2955172667@qq.com',NULL),(1019,'黄凤兰','201700601127','201700601127','1',NULL,NULL,'1',NULL,'18178770186','2609480104@qq.com',NULL),(1020,'黄兴妮','201700601128','201700601128','1',NULL,NULL,'1',NULL,'18076623036','823970004@qq.com',NULL),(1021,'黄业连','201700601129','201700601129','1',NULL,NULL,'1',NULL,'13788276449','1799518578@qq.com',NULL),(1022,'黎美玲','201700601130','201700601130','1',NULL,NULL,'1',NULL,'18778452005','2530361451@qq.com',NULL),(1023,'李玉凤','201700601131','201700601131','1',NULL,NULL,'1',NULL,'15878424159','2064865912qq.com',NULL),(1024,'李卓霞','201700601132','201700601132','1',NULL,NULL,'1',NULL,'18776410377','2537221379@qq.com',NULL),(1025,'梁锦蕊','201700601133','201700601133','1',NULL,NULL,'1',NULL,'18107748554','2224925793@qq.com',NULL),(1026,'廖美娟','201700601134','201700601134','1',NULL,NULL,'1',NULL,'15707747954','1145730321@qq.com',NULL),(1027,'林祖莲','201700601135','201700601135','1',NULL,NULL,'1',NULL,'18377459355','1967910665@qq.com',NULL),(1028,'刘丹琳','201700601136','201700601136','1',NULL,NULL,'1',NULL,'18877503379','',NULL),(1029,'卢美玲','201700601137','201700601137','1',NULL,NULL,'1',NULL,'13657741475','2906564346@qq.com',NULL),(1030,'卢月明','201700601138','201700601138','1',NULL,NULL,'1',NULL,'18776651574','1142265448@qq.com',NULL),(1031,'罗娜','201700601139','201700601139','1',NULL,NULL,'1',NULL,'15977421106','1875706545@qq.com',NULL),(1032,'麻春燕','201700601140','201700601140','1',NULL,NULL,'1',NULL,'18775966632','1539849059@qq.com',NULL),(1033,'蒙春柳','201700601141','201700601141','1',NULL,NULL,'1',NULL,'15177027943','1697482091@qq.com',NULL),(1034,'覃珍妮','201700601142','201700601142','1',NULL,NULL,'1',NULL,'17758581782','1062457160@qq.com',NULL),(1035,'吴秀花','201700601143','201700601143','1',NULL,NULL,'1',NULL,'13481773551','1058653960@qq.com',NULL),(1036,'肖莉芳','201700601144','201700601144','1',NULL,NULL,'1',NULL,'18877663640','2461515986@qq.com',NULL),(1037,'谢绚','201700601145','201700601145','1',NULL,NULL,'1',NULL,'15078117351','1037752508@qq.com',NULL),(1038,'胥斯','201700601146','201700601146','1',NULL,NULL,'1',NULL,'13667840489','1399575758@qq.com',NULL),(1039,'徐燕春','201700601147','201700601147','1',NULL,NULL,'1',NULL,'18269479217','1429951530@qq.com',NULL),(1040,'余永妙','201700601148','201700601148','1',NULL,NULL,'1',NULL,'19943030539','2464966175@qq.com',NULL),(1041,'周荔杏','201700601149','201700601149','1',NULL,NULL,'1',NULL,'18078721520','2716980089@qq.com',NULL),(1042,'朱水秀','201700601150','201700601150','1',NULL,NULL,'1',NULL,'18174769806','18174769806@163.com',NULL),(1043,'韦翠菊','201709706140','201709706140','1',NULL,NULL,'1',NULL,'18878917926','1013886540@qq.om',NULL),(1044,'李媚','201709706120','201709706120','1',NULL,NULL,'1',NULL,'18878159802','3379044727@qq.com',NULL),(1045,'崔基志','201700211102','201700211102','1',NULL,NULL,'0',NULL,'18218160610','1437620205@qq.com',NULL),(1046,'侯昊烨','201700211104','201700211104','1',NULL,NULL,'0',NULL,'13624578623','985723088@qq.com',NULL),(1047,'黄晋杰','201700211105','201700211105','1',NULL,NULL,'0',NULL,'18128766016','372090955@qq.com',NULL),(1048,'姜燕和','201700211106','201700211106','1',NULL,NULL,'0',NULL,'15878063179','1165147697@qq.com',NULL),(1049,'黎章辉','201700211107','201700211107','1',NULL,NULL,'0',NULL,'13627741465','1310589457@qq.com',NULL),(1050,'李俊','201700211108','201700211108','1',NULL,NULL,'0',NULL,'18777977514','635803151@qq.com',NULL),(1051,'廖鸿钧','201700211109','201700211109','1',NULL,NULL,'0',NULL,'15777573991','2326014663@qq.com',NULL),(1052,'廖瑞勇','201700211110','201700211110','1',NULL,NULL,'0',NULL,'18172616213','2909485339@qq.com',NULL),(1053,'林海欢','201700211111','201700211111','1',NULL,NULL,'0',NULL,'18169780302','958987249@qq.com',NULL),(1054,'卢杰平','201700211112','201700211112','1',NULL,NULL,'0',NULL,'18978961482','1143017020@qq.com',NULL),(1055,'吴桂海','201700211113','201700211113','1',NULL,NULL,'0',NULL,'13132742512','1271694450@qq.com',NULL),(1056,'余华春','201700211114','201700211114','1',NULL,NULL,'0',NULL,'18877968468','1278565358@qq.com',NULL),(1057,'玉玄达','201700211115','201700211115','1',NULL,NULL,'0',NULL,'15240657633','918837541@qq.com',NULL),(1058,'袁浩竣','201700211116','201700211116','1',NULL,NULL,'0',NULL,'18707741280','729109259@qq.com',NULL),(1059,'詹海秋','201700211117','201700211117','1',NULL,NULL,'0',NULL,'18316296139','2352341457@qq.com',NULL),(1060,'周志杰','201700211119','201700211119','1',NULL,NULL,'0',NULL,'18376205615','1354069895@qq.com',NULL),(1061,'陈海湘','201700211120','201700211120','1',NULL,NULL,'1',NULL,'13687846493','1056989714@qq.com',NULL),(1062,'陈婧璇','201700211121','201700211121','1',NULL,NULL,'1',NULL,'17878667458','1449183958@qq.com',NULL),(1063,'邓秋凤','201700211122','201700211122','1',NULL,NULL,'1',NULL,'13878484797','2419043803@qq.com',NULL),(1064,'冯惠心','201700211123','201700211123','1',NULL,NULL,'1',NULL,'18276524077','1429939619@qq.com',NULL),(1065,'冯丽梅','201700211124','201700211124','1',NULL,NULL,'1',NULL,'13036848385','1272220996@qq.com',NULL),(1066,'黄海璇','201700211125','201700211125','1',NULL,NULL,'1',NULL,'18269626392','2049559146@qq.com',NULL),(1067,'黄鹂','201700211126','201700211126','1',NULL,NULL,'1',NULL,'13471733154','250019921@qq.com',NULL),(1068,'霍金清','201700211127','201700211127','1',NULL,NULL,'1',NULL,'15878408376','1143280037@qq.com',NULL),(1069,'黎芳荣','201700211128','201700211128','1',NULL,NULL,'1',NULL,'13788244042','13788244042@163.com',NULL),(1070,'李永馨','201700211129','201700211129','1',NULL,NULL,'1',NULL,'18277942591','624984714@qq.com',NULL),(1071,'林水凤','201700211130','201700211130','1',NULL,NULL,'1',NULL,'13677749429','958394702@qq.com',NULL),(1072,'刘晓钰','201700211131','201700211131','1',NULL,NULL,'1',NULL,'18290062634','1642044752@qq.com',NULL),(1073,'陆红艳','201700211132','201700211132','1',NULL,NULL,'1',NULL,'19167512050','1390814532@qq.com',NULL),(1074,'梅明羽','201700211133','201700211133','1',NULL,NULL,'1',NULL,'17878851882','1020420323@qq.com',NULL),(1075,'莫金迎','201700211134','201700211134','1',NULL,NULL,'1',NULL,'13397819755','1920796667@qq.com',NULL),(1076,'宁玲','201700211135','201700211135','1',NULL,NULL,'1',NULL,'13471271199','179823776@qq.com',NULL),(1077,'孙亚楠','201700211136','201700211136','1',NULL,NULL,'1',NULL,'18246984787','1471944500@qq.com',NULL),(1078,'王金焕','201700211138','201700211138','1',NULL,NULL,'1',NULL,'18815838071','729978063@qq.com',NULL),(1079,'王芊茜','201700211139','201700211139','1',NULL,NULL,'1',NULL,'18677632239','2667236021@qq.com',NULL),(1080,'韦可儿','201700211140','201700211140','1',NULL,NULL,'1',NULL,'18776384317','ke437096661@qq.com',NULL),(1081,'韦妹','201700211141','201700211141','1',NULL,NULL,'1',NULL,'13557501901','3014037185@qq.com',NULL),(1082,'吴燕霞','201700211142','201700211142','1',NULL,NULL,'1',NULL,'18775734189','2793038039@qq.com',NULL),(1083,'谢婷婷','201700211143','201700211143','1',NULL,NULL,'1',NULL,'13036942790','919019758@qq.com',NULL),(1084,'许方芳','201700211144','201700211144','1',NULL,NULL,'1',NULL,'18277681804','1812163471@qq.com',NULL),(1085,'阳小媛','201700211146','201700211146','1',NULL,NULL,'1',NULL,'13367537086','1404323277@qq.com',NULL),(1086,'曾鸿露','201700211147','201700211147','1',NULL,NULL,'1',NULL,'17677077465','3184650440@qq.com',NULL),(1087,'张梅娟','201700211148','201700211148','1',NULL,NULL,'1',NULL,'15878062702','2591982041@qq.com',NULL),(1088,'张雨红','201700211149','201700211149','1',NULL,NULL,'1',NULL,'19127402247','1543609046@qq.com',NULL),(1089,'郑佳凤','201700211150','201700211150','1',NULL,NULL,'1',NULL,'13557148419','1456935540@qq.com',NULL),(1090,'郑雨','201700211151','201700211151','1',NULL,NULL,'1',NULL,'15878055796','1491572387@qq.com',NULL),(1091,'周菊','201700211152','201700211152','1',NULL,NULL,'1',NULL,'15177091422','1747300273@qq.com',NULL),(1092,'朱麒蓉','201700211153','201700211153','1',NULL,NULL,'1',NULL,'18269473611','616550268@qq.com',NULL),(1093,'农享学','201700602114','201700602114','1',NULL,NULL,'0',NULL,'15296578516','1972315754@qq.com',NULL),(1094,'普泽擎乾','201600210117','201600210117','1',NULL,NULL,'0',NULL,'18988065221','',NULL),(1095,'陈昶文','201700210101','201700210101','1',NULL,NULL,'0',NULL,'18177427159','',NULL),(1096,'甘香智','201700210103','201700210103','1',NULL,NULL,'0',NULL,'15878785850','',NULL),(1097,'何国祖','201700210104','201700210104','1',NULL,NULL,'1',NULL,'15878424170','1625017540@qq.com',NULL),(1098,'黄建阳','201700210106','201700210106','1',NULL,NULL,'0',NULL,'13669468900','',NULL),(1099,'黄锦宗','201700210107','201700210107','1',NULL,NULL,'0',NULL,'18376593847','',NULL),(1100,'黄凯','201700210108','201700210108','1',NULL,NULL,'0',NULL,'07713630786','',NULL),(1101,'黄万词','201700210109','201700210109','1',NULL,NULL,'0',NULL,'15878054629','',NULL),(1102,'蓝勇胜','201700210110','201700210110','1',NULL,NULL,'0',NULL,'13768490542','',NULL),(1103,'李金明','201700210111','201700210111','1',NULL,NULL,'0',NULL,'18269322799','',NULL),(1104,'李茂','201700210112','201700210112','1',NULL,NULL,'0',NULL,'18777434963','',NULL),(1105,'李业峰','201700210113','201700210113','1',NULL,NULL,'0',NULL,'18176425236','',NULL),(1106,'梁中满','201700210114','201700210114','1',NULL,NULL,'0',NULL,'14777742607','',NULL),(1107,'林朝元','201700210115','201700210115','1',NULL,NULL,'0',NULL,'18177109391','',NULL),(1108,'林恒宇','201700210116','201700210116','1',NULL,NULL,'0',NULL,'18775565757','',NULL),(1109,'刘绪泽','201700210117','201700210117','1',NULL,NULL,'0',NULL,'15878056526','',NULL),(1110,'刘镇钟','201700210118','201700210118','1',NULL,NULL,'0',NULL,'18777743172','',NULL),(1111,'陆增培','201700210119','201700210119','1',NULL,NULL,'0',NULL,'18378394707','',NULL),(1112,'孟玺','201700210120','201700210120','1',NULL,NULL,'0',NULL,'15974579396','',NULL),(1113,'农建政','201700210122','201700210122','1',NULL,NULL,'0',NULL,'13058330748','',NULL),(1114,'农冕','201700210123','201700210123','1',NULL,NULL,'0',NULL,'18878005446','',NULL),(1115,'秦滔','201700210124','201700210124','1',NULL,NULL,'0',NULL,'15277227797','',NULL),(1116,'任坤','201700210125','201700210125','1',NULL,NULL,'0',NULL,'18972081705','',NULL),(1117,'施宇','201700210126','201700210126','1',NULL,NULL,'0',NULL,'13324881575','',NULL),(1118,'韦保蔚','201700210127','201700210127','1',NULL,NULL,'0',NULL,'13207749695','',NULL),(1119,'温思奇','201700210128','201700210128','1',NULL,NULL,'0',NULL,'15907873436','',NULL),(1120,'吴高强','201700210129','201700210129','1',NULL,NULL,'0',NULL,'17878297909','',NULL),(1121,'吴瑞平','201700210130','201700210130','1',NULL,NULL,'0',NULL,'14796275651','',NULL),(1122,'严汝宁','201700210131','201700210131','1',NULL,NULL,'0',NULL,'18778766462','',NULL),(1123,'易明瑞','201700210132','201700210132','1',NULL,NULL,'0',NULL,'15717731418','',NULL),(1124,'曾立斌','201700210133','201700210133','1',NULL,NULL,'0',NULL,'17776305256','',NULL),(1125,'周益杰','201700210134','201700210134','1',NULL,NULL,'0',NULL,'13878488807','',NULL),(1126,'董小翠','201700210135','201700210135','1',NULL,NULL,'1',NULL,'18307845630','',NULL),(1127,'黄芳妹','201700210136','201700210136','1',NULL,NULL,'1',NULL,'15224643630','',NULL),(1128,'黄慧谊','201700210137','201700210137','1',NULL,NULL,'1',NULL,'18776254121','',NULL),(1129,'李慧珊','201700210138','201700210138','1',NULL,NULL,'1',NULL,'18206965363','',NULL),(1130,'卢燕琼','201700210139','201700210139','1',NULL,NULL,'1',NULL,'18377242240','',NULL),(1131,'罗梦妮','201700210140','201700210140','1',NULL,NULL,'1',NULL,'18775038232','',NULL),(1132,'韦婕','201700210141','201700210141','1',NULL,NULL,'1',NULL,'18587903703','',NULL),(1133,'韦明曼','201700210143','201700210143','1',NULL,NULL,'1',NULL,'15177497106','',NULL),(1134,'吴莹莹','201700210144','201700210144','1',NULL,NULL,'1',NULL,'18894781892','',NULL),(1135,'吴志欣','201700210145','201700210145','1',NULL,NULL,'1',NULL,'13324881670','',NULL),(1136,'谢韵冬','201700210146','201700210146','1',NULL,NULL,'1',NULL,'17687240616','',NULL),(1137,'杨清媚','201700210147','201700210147','1',NULL,NULL,'1',NULL,'18877712374','',NULL),(1138,'占梦全','201700210148','201700210148','1',NULL,NULL,'1',NULL,'13097893995','',NULL),(1139,'张华艳','201700210149','201700210149','1',NULL,NULL,'1',NULL,'15878680432','',NULL),(1140,'张熔','201700210150','201700210150','1',NULL,NULL,'1',NULL,'15878193071','',NULL),(1141,'徐志强','201600210124','201600210124','1',NULL,NULL,'0',NULL,'18172507049','',NULL),(1142,'董国航','201500210112','201500210112','1',NULL,NULL,'0',NULL,'13108672178','',NULL),(1143,'江盛源','201929530101','201929530101','1',NULL,NULL,'0',NULL,'14777210435','',NULL),(1144,'罗伟','201929530103','201929530103','1',NULL,NULL,'0',NULL,'18579933173','',NULL),(1145,'李冬多','201929530104','201929530104','1',NULL,NULL,'0',NULL,'13109487015','',NULL),(1146,'唐交棋','201929530105','201929530105','1',NULL,NULL,'0',NULL,'13517808597','',NULL),(1147,'岑家慧','201929530106','201929530106','1',NULL,NULL,'1',NULL,'15278434202','',NULL),(1148,'黄芳露','201929530107','201929530107','1',NULL,NULL,'1',NULL,'18775819107','',NULL),(1149,'郭耿','201700602101','201700602101','1',NULL,NULL,'0',NULL,'13877779187','',NULL),(1150,'何金胜','201700602102','201700602102','1',NULL,NULL,'0',NULL,'18776301082','',NULL),(1151,'黄准','201700602104','201700602104','1',NULL,NULL,'0',NULL,'18778216439','',NULL),(1152,'李河发','201700602105','201700602105','1',NULL,NULL,'0',NULL,'14777740157','',NULL),(1153,'李欢阳','201700602106','201700602106','1',NULL,NULL,'0',NULL,'18877589127','',NULL),(1154,'李虔瑶','201700602108','201700602108','1',NULL,NULL,'0',NULL,'18777430785','',NULL),(1155,'李永书','201700602109','201700602109','1',NULL,NULL,'0',NULL,'15807744260','',NULL),(1156,'凌达立','201700602111','201700602111','1',NULL,NULL,'0',NULL,'18278298752','',NULL),(1157,'罗海祥','201700602113','201700602113','1',NULL,NULL,'0',NULL,'18377563438','',NULL),(1158,'庞鸿宇','201700602116','201700602116','1',NULL,NULL,'0',NULL,'13132746092','',NULL),(1159,'柒耀新','201700602117','201700602117','1',NULL,NULL,'0',NULL,'18177449104','',NULL),(1160,'王鸿志','201700602118','201700602118','1',NULL,NULL,'0',NULL,'17878607797','',NULL),(1161,'王日超','201700602119','201700602119','1',NULL,NULL,'0',NULL,'18777333709','',NULL),(1162,'韦学明','201700602120','201700602120','1',NULL,NULL,'0',NULL,'18077461406','',NULL),(1163,'杨章欧','201700602122','201700602122','1',NULL,NULL,'0',NULL,'18107745354','',NULL),(1164,'张庆林','201700602125','201700602125','1',NULL,NULL,'0',NULL,'17687453434','',NULL),(1165,'周诗蒙','201700602126','201700602126','1',NULL,NULL,'0',NULL,'13100472510','',NULL),(1166,'朱楷','201700602127','201700602127','1',NULL,NULL,'0',NULL,'18278206045','',NULL),(1167,'陈慧玲','201700602128','201700602128','1',NULL,NULL,'1',NULL,'15777443966','',NULL),(1168,'邓广燕','201700602129','201700602129','1',NULL,NULL,'1',NULL,'15777538723','',NULL),(1169,'甘梅凤','201700602130','201700602130','1',NULL,NULL,'1',NULL,'18178001176','',NULL),(1170,'顾彩凤','201700602131','201700602131','1',NULL,NULL,'1',NULL,'15778542957','',NULL),(1171,'韩冬妮','201700602132','201700602132','1',NULL,NULL,'1',NULL,'18277882576','',NULL),(1172,'何妍珍','201700602133','201700602133','1',NULL,NULL,'1',NULL,'15777023601','',NULL),(1173,'黄彩回','201700602134','201700602134','1',NULL,NULL,'1',NULL,'17776169344','',NULL),(1174,'蓝丹妮','201700602135','201700602135','1',NULL,NULL,'1',NULL,'13978684483','',NULL),(1175,'李明俐','201700602136','201700602136','1',NULL,NULL,'1',NULL,'13977093527','',NULL),(1176,'李文香','201700602137','201700602137','1',NULL,NULL,'1',NULL,'17878732851','',NULL),(1177,'李怡婷','201700602138','201700602138','1',NULL,NULL,'1',NULL,'18878274132','',NULL),(1178,'梁茴茴','201700602139','201700602139','1',NULL,NULL,'1',NULL,'15723936113','',NULL),(1179,'廖秀丽','201700602140','201700602140','1',NULL,NULL,'1',NULL,'13132676064','',NULL),(1180,'凌梅艳','201700602141','201700602141','1',NULL,NULL,'1',NULL,'18777717322','',NULL),(1181,'米静','201700602142','201700602142','1',NULL,NULL,'1',NULL,'18807873976','',NULL),(1182,'覃宇洁','201700602143','201700602143','1',NULL,NULL,'1',NULL,'15207840242','',NULL),(1183,'唐慧玲','201700602144','201700602144','1',NULL,NULL,'1',NULL,'18775033719','',NULL),(1184,'韦梦娟','201700602145','201700602145','1',NULL,NULL,'1',NULL,'15078137326','',NULL),(1185,'谢小晴','201700602146','201700602146','1',NULL,NULL,'1',NULL,'18378459861','',NULL),(1186,'杨道研','201700602147','201700602147','1',NULL,NULL,'1',NULL,'15077611273','',NULL),(1187,'杨霞','201700602148','201700602148','1',NULL,NULL,'1',NULL,'13657746477','',NULL),(1188,'张熔','201700602149','201700602149','1',NULL,NULL,'1',NULL,'18776326312','',NULL),(1189,'钟奕玲','201700602150','201700602150','1',NULL,NULL,'1',NULL,'18178209652','',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=1199 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,23,1),(596,25,596),(597,25,597),(598,25,598),(599,25,599),(600,25,600),(601,25,601),(602,25,602),(603,25,603),(604,25,604),(605,25,605),(606,25,606),(607,25,607),(609,25,609),(610,25,610),(611,25,611),(612,25,612),(613,25,613),(614,25,614),(615,25,615),(616,25,616),(617,25,617),(618,25,618),(619,25,619),(620,25,620),(621,25,621),(622,25,622),(623,25,623),(624,25,624),(625,25,625),(626,25,626),(627,25,627),(628,25,628),(629,25,629),(630,25,630),(631,25,631),(632,25,632),(633,25,633),(634,25,634),(635,25,635),(636,25,636),(637,25,637),(638,25,638),(639,25,639),(641,25,641),(642,25,642),(643,25,643),(644,25,644),(645,25,645),(646,25,646),(647,25,647),(648,24,648),(649,24,649),(650,24,650),(651,24,651),(652,24,652),(653,24,653),(654,24,654),(655,24,655),(656,24,656),(657,24,657),(658,24,658),(659,24,659),(660,24,660),(661,24,661),(662,24,662),(663,24,663),(664,24,664),(665,24,665),(666,24,666),(667,24,667),(668,24,668),(669,24,669),(670,24,670),(671,24,671),(672,24,672),(673,24,673),(674,24,674),(675,24,675),(676,24,676),(677,24,677),(678,24,678),(679,24,679),(680,24,680),(681,24,681),(682,24,682),(683,24,683),(684,24,684),(685,24,685),(686,24,686),(687,24,687),(688,24,688),(689,24,689),(690,24,690),(691,24,691),(692,24,692),(693,24,693),(694,24,694),(695,24,695),(696,24,696),(697,24,697),(698,24,698),(699,24,699),(700,24,700),(701,24,701),(702,24,702),(703,24,703),(704,24,704),(705,24,705),(706,24,706),(707,24,707),(708,24,708),(709,24,709),(710,24,710),(711,24,711),(712,24,712),(713,24,713),(714,24,714),(715,24,715),(716,24,716),(717,24,717),(718,24,718),(719,24,719),(720,24,720),(721,24,721),(722,24,722),(723,24,723),(724,24,724),(725,24,725),(726,24,726),(727,24,727),(728,24,728),(729,24,729),(730,24,730),(731,24,731),(732,24,732),(733,24,733),(734,24,734),(735,24,735),(736,24,736),(737,24,737),(738,24,738),(739,24,739),(740,24,740),(741,24,741),(742,24,742),(743,24,743),(744,24,744),(745,24,745),(746,24,746),(747,24,747),(748,24,748),(749,24,749),(750,24,750),(751,24,751),(752,24,752),(753,24,753),(754,24,754),(755,24,755),(756,24,756),(757,24,757),(758,24,758),(759,24,759),(760,24,760),(761,24,761),(762,24,762),(763,24,763),(764,24,764),(765,24,765),(766,24,766),(767,24,767),(768,24,768),(769,24,769),(770,24,770),(771,24,771),(772,24,772),(773,24,773),(774,24,774),(775,24,775),(776,24,776),(777,24,777),(778,24,778),(779,24,779),(780,24,780),(781,24,781),(782,24,782),(783,24,783),(784,24,784),(785,24,785),(786,24,786),(787,24,787),(788,24,788),(789,24,789),(790,24,790),(791,24,791),(792,24,792),(793,24,793),(794,24,794),(795,24,795),(796,24,796),(797,24,797),(798,24,798),(799,24,799),(800,24,800),(801,24,801),(802,24,802),(803,24,803),(804,24,804),(805,24,805),(806,24,806),(807,24,807),(808,24,808),(809,24,809),(810,24,810),(811,24,811),(812,24,812),(813,24,813),(814,24,814),(815,24,815),(816,24,816),(817,24,817),(818,24,818),(819,24,819),(820,24,820),(821,24,821),(822,24,822),(823,24,823),(824,24,824),(825,24,825),(826,24,826),(827,24,827),(828,24,828),(829,24,829),(830,24,830),(831,24,831),(832,24,832),(833,24,833),(834,24,834),(835,24,835),(836,24,836),(837,24,837),(838,24,838),(839,24,839),(840,24,840),(841,24,841),(842,24,842),(843,24,843),(844,24,844),(845,24,845),(846,24,846),(847,24,847),(848,24,848),(849,24,849),(850,24,850),(851,24,851),(852,24,852),(853,24,853),(854,24,854),(855,24,855),(856,24,856),(857,24,857),(858,24,858),(859,24,859),(860,24,860),(861,24,861),(862,24,862),(863,24,863),(864,24,864),(865,24,865),(866,24,866),(867,24,867),(868,24,868),(869,24,869),(870,24,870),(871,24,871),(872,24,872),(873,24,873),(874,24,874),(875,24,875),(876,24,876),(877,24,877),(878,24,878),(879,24,879),(880,24,880),(881,24,881),(882,24,882),(883,24,883),(884,24,884),(885,24,885),(886,24,886),(887,24,887),(888,24,888),(889,24,889),(890,24,890),(891,24,891),(892,24,892),(893,24,893),(894,24,894),(895,24,895),(896,24,896),(897,24,897),(898,24,898),(899,24,899),(900,24,900),(901,24,901),(902,24,902),(903,24,903),(904,24,904),(905,24,905),(906,24,906),(907,24,907),(908,24,908),(909,24,909),(910,24,910),(911,24,911),(912,24,912),(913,24,913),(914,24,914),(915,24,915),(916,24,916),(917,24,917),(918,24,918),(919,24,919),(920,24,920),(921,24,921),(922,24,922),(923,24,923),(924,24,924),(925,24,925),(926,24,926),(927,24,927),(928,24,928),(929,24,929),(930,24,930),(931,24,931),(932,24,932),(933,24,933),(934,24,934),(935,24,935),(936,24,936),(937,24,937),(938,24,938),(939,24,939),(940,24,940),(941,24,941),(942,24,942),(943,24,943),(944,24,944),(945,24,945),(946,24,946),(947,24,947),(948,24,948),(949,24,949),(950,24,950),(951,24,951),(952,24,952),(953,24,953),(954,24,954),(955,24,955),(956,24,956),(957,24,957),(958,24,958),(959,24,959),(960,24,960),(961,24,961),(962,24,962),(963,24,963),(964,24,964),(965,24,965),(966,24,966),(967,24,967),(968,24,968),(969,24,969),(970,24,970),(971,24,971),(972,24,972),(973,24,973),(974,24,974),(975,24,975),(976,24,976),(977,24,977),(978,24,978),(979,24,979),(980,24,980),(981,24,981),(982,24,982),(983,24,983),(984,24,984),(985,24,985),(986,24,986),(987,24,987),(988,24,988),(989,24,989),(990,24,990),(991,24,991),(992,24,992),(993,24,993),(994,24,994),(995,24,995),(996,24,996),(997,24,997),(998,24,998),(999,24,999),(1000,24,1000),(1001,24,1001),(1002,24,1002),(1003,24,1003),(1004,24,1004),(1005,24,1005),(1006,24,1006),(1007,24,1007),(1008,24,1008),(1009,24,1009),(1010,24,1010),(1011,24,1011),(1012,24,1012),(1013,24,1013),(1014,24,1014),(1015,24,1015),(1016,24,1016),(1017,24,1017),(1018,24,1018),(1019,24,1019),(1020,24,1020),(1021,24,1021),(1022,24,1022),(1023,24,1023),(1024,24,1024),(1025,24,1025),(1026,24,1026),(1027,24,1027),(1028,24,1028),(1029,24,1029),(1030,24,1030),(1031,24,1031),(1032,24,1032),(1033,24,1033),(1034,24,1034),(1035,24,1035),(1036,24,1036),(1037,24,1037),(1038,24,1038),(1039,24,1039),(1040,24,1040),(1041,24,1041),(1042,24,1042),(1043,24,1043),(1044,24,1044),(1045,24,1045),(1046,24,1046),(1047,24,1047),(1048,24,1048),(1049,24,1049),(1050,24,1050),(1051,24,1051),(1052,24,1052),(1053,24,1053),(1054,24,1054),(1055,24,1055),(1056,24,1056),(1057,24,1057),(1058,24,1058),(1059,24,1059),(1060,24,1060),(1061,24,1061),(1062,24,1062),(1063,24,1063),(1064,24,1064),(1065,24,1065),(1066,24,1066),(1067,24,1067),(1068,24,1068),(1069,24,1069),(1070,24,1070),(1071,24,1071),(1072,24,1072),(1073,24,1073),(1074,24,1074),(1075,24,1075),(1076,24,1076),(1077,24,1077),(1078,24,1078),(1079,24,1079),(1080,24,1080),(1081,24,1081),(1082,24,1082),(1083,24,1083),(1084,24,1084),(1085,24,1085),(1086,24,1086),(1087,24,1087),(1088,24,1088),(1089,24,1089),(1090,24,1090),(1091,24,1091),(1092,24,1092),(1093,24,1093),(1094,24,1094),(1095,24,1095),(1096,24,1096),(1097,24,1097),(1098,24,1098),(1099,24,1099),(1100,24,1100),(1101,24,1101),(1102,24,1102),(1103,24,1103),(1104,24,1104),(1105,24,1105),(1106,24,1106),(1107,24,1107),(1108,24,1108),(1109,24,1109),(1110,24,1110),(1111,24,1111),(1112,24,1112),(1113,24,1113),(1114,24,1114),(1115,24,1115),(1116,24,1116),(1117,24,1117),(1118,24,1118),(1119,24,1119),(1120,24,1120),(1121,24,1121),(1122,24,1122),(1123,24,1123),(1124,24,1124),(1125,24,1125),(1126,24,1126),(1127,24,1127),(1128,24,1128),(1129,24,1129),(1130,24,1130),(1131,24,1131),(1132,24,1132),(1133,24,1133),(1134,24,1134),(1135,24,1135),(1136,24,1136),(1137,24,1137),(1138,24,1138),(1139,24,1139),(1140,24,1140),(1141,24,1141),(1142,24,1142),(1143,24,1143),(1144,24,1144),(1145,24,1145),(1146,24,1146),(1147,24,1147),(1148,24,1148),(1149,24,1149),(1150,24,1150),(1151,24,1151),(1152,24,1152),(1153,24,1153),(1154,24,1154),(1155,24,1155),(1156,24,1156),(1157,24,1157),(1158,24,1158),(1159,24,1159),(1160,24,1160),(1161,24,1161),(1162,24,1162),(1163,24,1163),(1164,24,1164),(1165,24,1165),(1166,24,1166),(1167,24,1167),(1168,24,1168),(1169,24,1169),(1170,24,1170),(1171,24,1171),(1172,24,1172),(1173,24,1173),(1174,24,1174),(1175,24,1175),(1176,24,1176),(1177,24,1177),(1178,24,1178),(1179,24,1179),(1180,24,1180),(1181,24,1181),(1182,24,1182),(1183,24,1183),(1184,24,1184),(1185,24,1185),(1186,24,1186),(1187,24,1187),(1188,24,1188),(1189,24,1189),(1195,25,608),(1196,26,608),(1197,25,640),(1198,26,640);
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

-- Dump completed on 2020-04-23 20:59:52
set global sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
set session sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
