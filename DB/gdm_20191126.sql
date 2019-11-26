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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allot_guide`
--

LOCK TABLES `allot_guide` WRITE;
/*!40000 ALTER TABLE `allot_guide` DISABLE KEYS */;
INSERT INTO `allot_guide` VALUES (27,455,1197,NULL,2019),(28,455,1190,NULL,2019),(29,455,1181,NULL,2019),(30,454,1183,NULL,2019),(31,455,1189,NULL,2019),(32,455,1178,NULL,2019),(33,455,1172,NULL,2019);
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
INSERT INTO `defense_record` VALUES (29,'1．问：如何获取药检所的具体业务流程？\r\n答：通过去广西梧州药检所实地考察，询问该所的工作人员基本流程的操作和具体的工作内容，整理成需求文档。 \r\n2．问：岗位自动流转是如何实现的？\r\n答：通过后台代码自定义固定的流程，具体是用了判断的语句，当用户登录系统，通过用户编号读取岗位编号和所在科室；根据待办编号读取待办记录，如果该岗位没有这项待办事项，系统自动添加一项待办事项。工作人员完成待办事项提交任务到下一岗位，添加一天工作事项到下一岗位。\r\n3．问：报告书的在线编辑如何实现？\r\n   答：运用了百度编辑器Ueditor实现，在网上下载需要的包，引用Ueditor的jar包。\r\n4．问：报告书模板的定制如何操作？\r\n   答：工作人员选择新增模板后，系统会新增一个模板编号，工作人员选择该模板中需要检测的项目添加，即可得到对应的报告书模板。',1197,455,2019),(30,'答辩小组（系答辩委员会）对学生毕业论文提问及学生的回答情况\r\n1．问：项目管理过程中完整业务流程如何在系统体现的？ \r\n答：系统主要从项目立项开始然后到过程监管，最后到项目的竣工。项目设计的重点放在项目过程监管中，而其中包含了项目责任人分配、项目进度汇报、资金使用进度、项目问题汇报、领导批示、项目关联。\r\n2. 问：该系统如何解决项目汇报实时性和形象性问题？\r\n答：在项目汇报实时性问题上，系统利用手机移动端采集数据和图片的便捷性，用户可以在手机端上进行项目的汇报的工作并且可以利用手机相机进行图片的上传，针对形象性的问题效仿于朋友圈的方式进行项目汇报的图文显示。\r\n3.问：项目批示工作中在手机端是如何体现的？\r\n  答：项目的批示工作采用朋友圈动态里面的评论功能进行实现，汇报进度信息放在首页上，当用户选择某一项汇报信息进入到相应的汇报进度的详细信息中，当用户点某一项信息下方法的评论框时需要用户登录后并且是相关领导才可以进行项目进度进度汇报信息的批示。',1190,455,2019);
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
INSERT INTO `group_allot` VALUES (5,'201700202',9,'2019-11-13 00:00:00','答辩一组','00','01',2019),(6,'201700202',1,'2019-11-13 00:00:00','大组一组','01','00',2019),(7,'201700202',2,'2019-11-13 13:45:23','答辩二组','00','01',2019),(8,'201700202',NULL,NULL,'答辩三组','00','01',2019);
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
INSERT INTO `group_defense_direction` VALUES (12,5,4,2019),(13,6,4,2019),(14,7,4,2019),(15,8,4,2019);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_student`
--

LOCK TABLES `group_student` WRITE;
/*!40000 ALTER TABLE `group_student` DISABLE KEYS */;
INSERT INTO `group_student` VALUES (6,'201400208223',1197,5,454,'2019-11-13 15:36:52',2019),(7,'201600213229',1190,5,458,'2019-11-13 15:37:07',2019),(8,'201600208310',1181,5,459,'2019-11-13 15:37:20',2019),(9,'201600208328',1183,7,455,'2019-11-13 15:58:04',2019),(11,'201400208223',1197,6,457,'2019-11-13 20:54:26',2019),(12,'201600213228',1189,8,456,'2019-11-13 21:50:39',2019),(13,'201600208304',1178,8,460,'2019-11-13 21:50:50',2019),(14,'201600208144',1172,8,457,'2019-11-13 21:51:01',2019),(15,'201600213229',1190,6,457,'2019-11-26 09:07:21',2019);
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
INSERT INTO `group_teacher` VALUES (14,5,459,'2019-11-13 15:33:08',2019,'1'),(15,5,458,'2019-11-13 15:33:26',2019,'2'),(16,5,454,'2019-11-13 15:34:51',2019,'0'),(18,6,454,'2019-11-13 15:35:59',2019,'1'),(19,6,458,'2019-11-13 15:36:15',2019,'2'),(20,7,455,'2019-11-13 15:57:30',2019,'0'),(21,7,462,'2019-11-13 15:57:37',2019,'1'),(22,7,461,'2019-11-13 15:57:42',2019,'2'),(23,6,457,'2019-11-13 20:29:46',2019,'0'),(24,6,461,'2019-11-13 21:06:41',2019,'1'),(25,8,457,'2019-11-13 21:49:10',2019,'0'),(26,8,460,'2019-11-13 21:49:15',2019,'1'),(27,8,456,'2019-11-13 21:49:22',2019,'2');
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
INSERT INTO `guide_count` VALUES (5,26,6,455,2019),(6,12,1,454,2019),(7,4,0,457,2019),(8,6,0,459,2019);
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
INSERT INTO `issue_info` VALUES (5,1197,'广西梧州食品药品检验所检验报告系统的设计与实现','&3&_&4&_',2019,NULL,NULL),(6,1190,'贵港市港北区项目建设协同数据平台的设计与实现 ','&3&_',2019,NULL,NULL);
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
INSERT INTO `open_report` VALUES (5,'<p><span style=\"font-family: SimSun;\">一、背景</span></p><p style=\"margin-top:7px;margin-bottom:7px;margin-top:auto;margin-bottom:auto;text-indent:16px;line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">广西梧州食品药品检验所检验报告书的出具过程仍采用手工方式，还没有实现流程电子化</span></span><span style=\"font-family: SimSun;line-height: 125%;font-size: 16px\"><span style=\"font-family:SimSun\">。检验流程涉及到科室的协作和人员的协作，按科室来分，检验流程涉及业务科以及实验室；按工作角色来分，涉及业务科收样登记员、实验室主任、检验员、复核人、跟签人、业务科报告审核员、业务科主任、授权签字人。目前的检验流程以检品登记</span>A<span style=\"font-family:SimSun\">卡、</span><span style=\"font-family:Times New Roman\">B</span><span style=\"font-family:SimSun\">卡作为任务卡在不同科室之间流转的方式进行，这样的人工处理方式存在以下不合理的或不规范的现象：</span></span></p><p style=\"text-indent:64px;line-height:24px\"><span style=\"font-family: SimSun;font-size: 16px\"><span style=\"font-family:SimSun\">（</span>1<span style=\"font-family:SimSun\">）科室不能协作，即科室不能同时开展本科室的检验工作。</span></span></p><p style=\"text-indent:64px;line-height:24px\"><span style=\"font-family: SimSun;font-size: 16px\"><span style=\"font-family:SimSun\">（</span>2<span style=\"font-family:SimSun\">）不能实时了解检品的完成进度情况。</span></span></p><p style=\"text-indent:64px;line-height:24px\"><span style=\"font-family: SimSun;font-size: 16px\"><span style=\"font-family:SimSun\">（</span>3<span style=\"font-family:SimSun\">）报告格式种类繁多，报告模板需经常调整；</span></span></p><p style=\"text-indent:64px;line-height:24px\"><span style=\"font-family: SimSun;font-size: 16px\"><span style=\"font-family:SimSun\">（</span>4<span style=\"font-family:SimSun\">）出具报告的软件自动化程度低，大量需要人工录入；</span></span></p><p style=\"text-indent:64px;line-height:24px\"><span style=\"font-family: SimSun;font-size: 16px\"><span style=\"font-family:SimSun\">（</span>5<span style=\"font-family:SimSun\">）检验标准管理难、不能充分保证时效性。</span></span></p><p style=\"line-height:24px\"><span style=\"font-family: SimSun;font-size: 16px\"><span style=\"font-family:SimSun\">二、意义</span></span></p><p><span style=\"font-family: SimSun;font-size: 16px\"><span style=\"font-family:SimSun\">信息技术的进步为</span></span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">梧州食品药品检验所检验报告系统提供了先进的技术平台和实现手段。根据食品药品标准化检验流程，设计一套检验报告书协同处理系统，不但减轻了药检所工作人员的工作量，提高了药检所的检验效率，有望实现梧州食品药品检验所检验报告系统的完全自动化，而且也为各级领导提供了方便、快捷的辅助决策信息，使得该系统更加的科学化、规范化、便捷化，同时也可以更好地为科研工作服务，为社会民众服务。</span></span></p>','<p><span style=\"font-family: SimSun;\">一、研究内容</span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">本课题研究设计一套满足梧州食品药品检验所样品检验业务流程的检验报告系统。系统功能列表如下：</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\";font-family:SimSun;font-size:16px\">1<span style=\"font-family:SimSun\">、样品登记</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">委托客户提出样品委托检测申请，业务科人员填写送检单信息登记录入系统并形成申请表，打印申请表给客户；业务科人员安排检验任务，并把检品项目分发至不同检验科室。</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family:SimSun;font-size:16px\">2、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">实验主任分配检验任务</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">检验科室的实验室主任接收到任务安排后，对样品的项目指定不同的检验员、复核人、跟签人。指定方式分为两种方式：第一种方式是对单个检品指定检验员、复核人、跟签人；第二种方式是多个检品，按照项目分类指定检验员、复核人、跟签人。多个检品对应一个复核人，一个检验员可以检验多个项目。</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family:SimSun;font-size:16px\">3、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">检验员</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">检验员接收到项目检验任务后，根据实验室现有的实验条件是否达到项目的检验的要求，如果不具备开展实验的要求，检验员可以将项目回退给实验室主任，由实验室进行处理；如果具备条件，检验员在做完实验后，在报告书系统中录入实验的结果、实验对照品的使用信息以及上传实验底稿。填写方式分为两种方式：第一种方式是填写单个检品的项目的实验内容；第二种方式是批量填写多个检品的项目的实验内容。检验员填写完毕把检品报告提交给复核人复核。</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family:SimSun;font-size:16px\">4、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">复核人</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">复核人根据检验员填写报告的次序，逐项审核报告结果，复核方式分为两种方式：第一种方式是复核单检品报告；第二种方式是批量复核检品报告。若检品报告有问题，复核人可回退检验员；若无问题复核人提交复核结果给实验室主任进行审核。</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family:SimSun;font-size:16px\">5、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">实验室主任审核</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">实验室主任收到检品报告后，按单个检品审核，若有不合格项目，可以三种方式处理检品报告：第一种方式是同科室复检，指定复检项目的检验员、复核人，完成同科室复检后，由实验室主任提交项目给业务科进行审核；第二种方式是外科室复检，指定复检科室，由外科室完成复检项目的检验流程，在外科室复检流程完成后，由发起复检科室的实验室主任，提交项目给业务科进行审核；第三种方式是不复检，提交业务科审核；若无不合格项目，将实验室审核结果提交给业务科审核。</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family:SimSun;font-size:16px\">6、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">业务科审核报告</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">业务科人员可以查看检品的信息，审核项目的检验依据、评价依据、限度要求是否准备，实验结论是否准确，如果不准确，可以对项目各项信息</span>(<span style=\"font-family:SimSun\">检验依据、评价依据</span><span style=\"font-family:Times New Roman\">)</span><span style=\"font-family:SimSun\">以及实验结论进行修改。待各实验室完成该检品的所有项目后，经业务科审核人员确认无误后，提交给下一岗，如果检品合格，提交给授权签字人签字；如果不合格，提交业务科主任审核，再由业务科主任提交给授权签字人签字。</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family:SimSun;font-size:16px\">7、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">授权签字人</span></span></p><p style=\"line-height:24px\"><span style=\";font-family:SimSun;font-size:16px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\";font-family:SimSun;font-size:16px\">&nbsp;&nbsp;<span style=\"font-family:SimSun\">授权签字人对检品报告进行电子盖章后，将报告书提交给业务科人员打印。</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family:SimSun;font-size:16px\">8、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">报告打印与存档</span></span></p><p style=\"text-indent:64px;line-height:24px\"><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">已签发报告保存在系统中，工作人员可打开浏览或打印；打印报告时，自动关联打印信息，如检验员、复核人、实验室主任等；报告可转换成</span>PDF格式。</span></p><p style=\"line-height:24px\"><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">二、拟解决的主要问题</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\";font-family:SimSun;font-size:16px\">1、检品协检流程模型的构建</span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\";font-family:SimSun;font-size:16px\">2、实验底稿的修改痕迹追踪</span></p><p><span style=\";font-family:SimSun;font-size:16px\">3、报告书模板动态管理</span></p><p><br/></p>','<p><span style=\"font-family: SimSun;\">一、研究方法</span></p><p style=\"margin-left:32px;line-height:24px\"><span style=\"font-family: SimSun;font-size: 16px\">1.查找有关食品药品检测的文献资料，为构建系统主要模块做资料参考；</span></p><p style=\"margin-left:32px;line-height:24px\"><span style=\"font-family: SimSun;font-size: 16px\">2.动手设计并实现系统；</span></p><p style=\"margin-left:32px;line-height:24px\"><span style=\"font-family: SimSun;font-size: 16px\">3.测试系统功能，并加以修改和完善，完成研究内容。</span></p><p style=\"line-height:24px\"><span style=\"font-family: SimSun;font-size: 16px\"><span style=\"font-family:SimSun\">二、研究步骤及措施</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family: SimSun;font-size: 16px\">1.阅读相关政策文件及论文，定期实地调研相关单位的实际要求，对食品药品检测业务流程进行了解；</span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family: SimSun;font-size: 16px\">2.搜索国内国外相关食品药品检测的系统进行参考；</span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family: SimSun;font-size: 16px\">3.进行检验报告系统的功能分析，确定系统的主要功能，初步画出功能模块图；</span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family: SimSun;font-size: 16px\">4.进行详细设计；</span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family: SimSun;font-size: 16px\">5.编写代码，进行食品药品检测检验系统的正式开发；</span></p><p style=\"text-indent: 32px; line-height: 24px;\"><span style=\"font-family: SimSun;font-size: 16px\">6.反复测试修改，完善系统的各个细节，并完成论文。</span></p>','<p><span style=\"font-family: SimSun;\">[1]林伟强.广东省药品检验所LIMS应用[J].今日药学,2008,(04):88-90.</span></p><p style=\"line-height:150%\"><span style=\";font-family:SimSun;line-height:150%;font-size:16px\">[2]邓元果.符合GLP标准的LIMS系统的设计与实现[D].电子科技大学,2010.</span></p><p style=\"line-height:150%\"><span style=\";font-family:SimSun;line-height:150%;font-size:16px\">[3]沈怡,汪雪君,杨慧元.LIMS在食品药品检验实验室成功实施因素的探讨[J].中国药事,2015,(03):287-292.</span></p><p style=\"line-height:150%\"><span style=\";font-family:SimSun;line-height:150%;font-size:16px\">[</span><span style=\";font-family:SimSun;line-height:150%;font-size:16px\">4</span><span style=\";font-family:SimSun;line-height:150%;font-size:16px\">]王洪楠.通用报表工具导出系统设计与实现[D].吉林大学,2012.</span></p><p style=\"line-height:150%\"><span style=\";font-family:SimSun;line-height:150%;font-size:16px\">[5]于金辉.食品样品检验流程优化设计与管理技术分析[J].食品安全导刊,2016,(15):90.</span></p><p><span style=\";font-family:SimSun;font-size:16px\">[6]张磊.药品检测行业实验室信息管理系统的设计与实现[D].北京邮电大学,2010.</span></p>',1197,455,2019,'01'),(6,'<p><span style=\"font-family: SimSun; font-size: 14px;\">一、课题研究的背景介绍：</span></p><p style=\"line-height:24px\"><span style=\";font-family:SimSun;font-size:14px\">&nbsp;&nbsp;&nbsp;<span style=\"font-family:SimSun\">该项目是基于贵港市港北区对所辖区域内项目建设管理具体需求而设计的软件平台。剧调查，目前港北区项目建设管理存在如下问题：</span></span></p><p style=\"line-height:24px\"><span style=\";font-family:SimSun;font-size:14px\">&nbsp;&nbsp;&nbsp;1<span style=\"font-family:SimSun\">、项目建设进度靠开会汇报方式。该方式严重制约了政府主管部门和领导对项目建设进度的掌控，所掌握的进度往往存在较为严重的延时，也不能及时的发现问题和解决问题，无法对目前的情况作出及时的决策；</span></span></p><p style=\"line-height:24px\"><span style=\";font-family:SimSun;font-size:14px\">&nbsp;&nbsp;&nbsp;2<span style=\"font-family:SimSun\">、基层工作人员和项目干系人无法及时汇报项目建设过程中的问题，目前采用的方式是层层汇报的方式，该方式往往造成汇报延时和信息失真；</span></span></p><p style=\"line-height:24px\"><span style=\";font-family:SimSun;font-size:14px\">&nbsp;&nbsp;&nbsp;3<span style=\"font-family:SimSun\">、政府主管部门和领导无法实时掌控项目的全局情况，目前采用手工报表和下级领导的汇报方式，即使采用这种方式，也无法完全或者无法形象的了解工程情况；</span></span></p><p style=\"line-height:24px\"><span style=\";font-family:SimSun;font-size:14px\">&nbsp;&nbsp;&nbsp;4<span style=\"font-family:SimSun\">、项目所反馈的问题和进度不具体不形象，目前采用的方式是实地开现场会的方式来完成对项目的形象了解，但一个县市区的项目往往在上百个，即使一天一个现场会也无法完成全部的工作，造成项目失控。 </span></span></p><p style=\"line-height:24px\"><span style=\";font-family:SimSun;font-size:14px\">&nbsp;&nbsp;&nbsp;<span style=\"font-family:SimSun\">综上，港北区急需一套软件解决上述问题。</span> &nbsp;&nbsp;&nbsp;</span></p><p style=\"line-height:24px\"><span style=\";font-family:SimSun;font-size:14px\"><span style=\"font-family:SimSun\">二、课题研究的意义：</span></span></p><p style=\"line-height:24px\"><span style=\";font-family:SimSun;font-size:14px\">&nbsp;&nbsp;<span style=\"font-family:SimSun\">该项目的设计与实施能最大程度解决目前港北区的项目管理困局，其意义如下：</span></span></p><p style=\"line-height:24px\"><span style=\";font-family:SimSun;font-size:14px\">&nbsp;&nbsp;1<span style=\"font-family:SimSun\">、有利于各级领导及时掌握目前所有项目的进展情况和项目建设中存在的问题，并能通过现场照片的形式形象的了解项目信息；</span></span></p><p style=\"line-height:24px\"><span style=\";font-family:SimSun;font-size:14px\">&nbsp;&nbsp;2<span style=\"font-family:SimSun\">、有利于项目问题和项目进度的实时反馈，通过移动终端应用项目干系人和项目负责人能实时反馈项目的问题和进度，解决层层汇报带来的项目信息失真，并简化了汇报流程，实现项目汇报的扁平化管理；</span></span></p><p style=\"line-height:24px\"><span style=\";font-family:SimSun;font-size:14px\">&nbsp;&nbsp;3<span style=\"font-family:SimSun\">、有利于领导对项目中存在的问题及时作出决策，由于项目问题和进度采用实时汇报的方式，领导能及时掌握相关情况并及时作出决策，有利于项目的顺利开展和有效监督；</span></span></p><p><br/></p>','<p><span style=\"font-family: SimSun;\">一、</span><span style=\"font-family: SimSun;\">研究内容：</span></p><p><span style=\";font-family:SimSun;font-size:16px\">&nbsp;&nbsp;&nbsp;<span style=\"font-family:SimSun\">通过设计并实现，主要通过研究如下内容来设计并实现项目管理协同平台：</span></span></p><p><span style=\";font-family:SimSun;font-size:16px\">&nbsp;&nbsp;&nbsp;1<span style=\"font-family:SimSun\">、研究港北区项目信息特点，建立项目综合信息管理方式和方法，如项目基本信息、项目类型、项目干系人、项目地理位置形象表述等方面；</span></span></p><p><span style=\";font-family:SimSun;font-size:16px\">&nbsp;&nbsp;&nbsp;2<span style=\"font-family:SimSun\">、研究项目管理过程中形象反应项目进度和项目问题的方式和方法，研究解决项目过程扁平化管理的相关问题；</span></span></p><p><span style=\";font-family:SimSun;font-size:16px\">&nbsp;&nbsp;&nbsp;3<span style=\"font-family:SimSun\">、研究项目管理过程中领导及时对项目过程中反应的问题作出批示的方式和方法；</span></span></p><p><span style=\";font-family:SimSun;font-size:16px\">&nbsp;&nbsp;&nbsp;4<span style=\"font-family:SimSun\">、研究对现有建设项目的分类以及项目与征地之间的关联关系，并通过某种途径来快速管理该关联关系；</span></span></p><p><span style=\";font-family:SimSun;font-size:16px\">&nbsp;&nbsp;&nbsp;5<span style=\"font-family:SimSun\">、研究并实现以移动终端为载体的方式完成上述研究中研究出的方式和方法，形成一套项目管理软件并使得该软件具备通用性；</span></span></p><p><span style=\"font-size: 16px\">&nbsp;</span></p><p><span style=\"font-family:SimSun;font-size:16px\">二、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">拟解决的主要问题：</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family:SimSun;font-size:16px\">1、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">项目分类管理问题，包括根据不同层级项目与不同类型项目的统一管理，并设定相关干系人，干系领导和县级及厅级领导；</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family:SimSun;font-size:16px\">2、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">项目形象地址问题，基于百度地图接口，能完成对项目地址的设定，地址区域大小设置及通过百度地图形象表述和访问项目相关信息；</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family:SimSun;font-size:16px\">3、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">设计移动终端，仿效大众熟知的微信朋友圈的方式完成项目的进度汇报和问题反馈；并仿效朋友圈评论方式解决项目批示问题；</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family:SimSun;font-size:16px\">4、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">设计系统平台角色，有效控制访问；</span></span></p><p style=\"text-indent:32px;line-height:24px\"><span style=\"font-family:SimSun;font-size:16px\">5、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">能快速查找登录用户所管理项目并汇报项目进度和项目问题；</span></span></p><p><br/></p>','<p><span style=\"font-family: SimSun;\">一、</span><span style=\"font-family: SimSun;\">研究方法：</span></p><p style=\"text-indent:32px;text-align:left;line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">通过网络</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">跟图书</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">等方式深入了解</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">课题</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">，</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">参照</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">国内</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">外现有</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">的系统</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">进行分析</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">并学习</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">，</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">参考各种期刊或论文对</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">这</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">方面的研究，综合分析总结，确定</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">课题主要</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">功能及</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">所使用</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">框架及技术，</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">并</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">深入学习，对</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">每个</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">功能每项技术</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">逐一实现</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">和运用，从实践中发现问题</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">并不断</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">测试</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">校验</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">，</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">逐步</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">完善系统</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">。</span></span></p><p style=\"text-indent:32px;text-align:left;line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">&nbsp;</span></p><p style=\"line-height:24px\"><span style=\"font-family: SimSun;font-size: 16px\"><span style=\"font-family:SimSun\">二、研究步骤措施：</span></span></p><p style=\"text-indent:32px;line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">1. <span style=\"font-family:SimSun\">通过</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">查找资料、方案和查阅相关文献，初步了解课题的开发方向和研究现状。</span></span></p><p style=\"text-indent:32px;line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">2. <span style=\"font-family:SimSun\">学习国内外现有</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">的系统，并从中分析总结</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">，</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">对其结构、功能、实现技术进行剖析。</span></span></p><p style=\"text-indent:32px;line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">3. <span style=\"font-family:SimSun\">对</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">课题研究进行可行性分析，确定研究课题。</span></span></p><p style=\"text-indent:32px;line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">4<span style=\"font-family:SimSun\">．对研究</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">的</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">课题进行</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">需求分析，确定课题</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">主要</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">功能</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">。</span></span></p><p style=\"text-indent:32px;line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">5</span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">. <span style=\"font-family:SimSun\">对</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">国内外对该系统使用的现有技术和框架进行分析，确定研究课题</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">所</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">运用</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">的框架</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">和技术，</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">做出</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">总体设计。</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">&nbsp;</span></p><p style=\"text-indent:32px;line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">6</span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">. <span style=\"font-family:SimSun\">对系统</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">进行详细设计，完善</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">要</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">做的各个模块</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">功能</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">点。</span></span></p><p style=\"text-indent:32px;line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">7</span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">. </span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">对系统进行编码</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">实现主要</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">功能。</span></span></p><p style=\"text-indent:32px;line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">8</span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">. </span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">对系统</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">编写</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">用例文档进行测试，并完成测试文档</span></span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\"><span style=\"font-family:SimSun\">。</span></span></p><p style=\"line-height:24px\"><span style=\";font-family:SimSun;font-size:16px\">9<span style=\"font-family:SimSun\">．</span></span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">整理各阶段的设计记录文档，形成论文稿。</span></span></p><p><br/></p>','<p><span style=\"font-family: SimSun;\">[1]</span><span style=\"font-family: SimSun;\">陈守贵</span><span style=\"font-family: SimSun;\">,</span><span style=\"font-family: SimSun;\">赵亭怀</span><span style=\"font-family: SimSun;\">,</span><span style=\"font-family: SimSun;\">赵杰</span><span style=\"font-family: SimSun;\">. </span><span style=\"font-family: SimSun;\">基于国际先进项目管理理念的设计项目管理系统应用</span><span style=\"font-family: SimSun;\">[J]. </span><span style=\"font-family: SimSun;\">中国勘察设计</span><span style=\"font-family: SimSun;\">,2009,(03):40-43.</span></p><p style=\"line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">[2]<span style=\"font-family:SimSun\">欧阳真</span><span style=\"font-family:SimSun\">. </span><span style=\"font-family:SimSun\">工程项目管理信息化系统现状和发展趋势</span><span style=\"font-family:SimSun\">[J]. </span><span style=\"font-family:SimSun\">有色冶金设计与研究</span><span style=\"font-family:SimSun\">,2011,(01):50-53.</span></span></p><p style=\"line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">[3]<span style=\"font-family:SimSun\">毕宇清</span><span style=\"font-family:SimSun\">,</span><span style=\"font-family:SimSun\">申琪玉</span><span style=\"font-family:SimSun\">,</span><span style=\"font-family:SimSun\">郭兵</span><span style=\"font-family:SimSun\">. </span><span style=\"font-family:SimSun\">基于协同工作平台的市政工程项目管理系统分析</span><span style=\"font-family:SimSun\">[J]. </span><span style=\"font-family:SimSun\">施工技术</span><span style=\"font-family:SimSun\">,2015,(18):77-80+85.</span></span></p><p style=\"line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">[4]<span style=\"font-family:SimSun\">常虹</span><span style=\"font-family:SimSun\">. </span><span style=\"font-family:SimSun\">工程项目管理中的信息管理系统应用探微</span><span style=\"font-family:SimSun\">[J]. </span><span style=\"font-family:SimSun\">科技展望</span><span style=\"font-family:SimSun\">,2015,(02):1+3.</span></span></p><p style=\"line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">[5]<span style=\"font-family:SimSun\">胡忠望</span><span style=\"font-family:SimSun\">,</span><span style=\"font-family:SimSun\">莫家庆</span><span style=\"font-family:SimSun\">. </span><span style=\"font-family:SimSun\">基于</span><span style=\"font-family:SimSun\">Android</span><span style=\"font-family:SimSun\">的移动应用开发研究</span><span style=\"font-family:SimSun\">[J/OL]. </span><span style=\"font-family:SimSun\">软件导刊</span><span style=\"font-family:SimSun\">,2014,(11):18-20.</span></span></p><p style=\"line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">[6]<span style=\"font-family:SimSun\">陈皎</span><span style=\"font-family:SimSun\">. </span><span style=\"font-family:SimSun\">基于</span><span style=\"font-family:SimSun\">B/S</span><span style=\"font-family:SimSun\">架构的项目管理系统的设计与实现</span><span style=\"font-family:SimSun\">[D].</span><span style=\"font-family:SimSun\">山东大学</span><span style=\"font-family:SimSun\">,2014.</span></span></p><p style=\"line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">[7]<span style=\"font-family:SimSun\">林一冰</span><span style=\"font-family:SimSun\">. </span><span style=\"font-family:SimSun\">基于移动终端的项目管理系统的研究与实现</span><span style=\"font-family:SimSun\">[D].</span><span style=\"font-family:SimSun\">华南理工大学</span><span style=\"font-family:SimSun\">,2014.</span></span></p><p><br/></p>',1190,455,2019,'01');
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
INSERT INTO `plan_progress` VALUES (32,'201700202',8,4,'2019-11-13 11:29:38','2019-12-07 11:29:41',2019,'00',1),(33,'201700202',8,4,'2019-11-13 11:29:53','2019-11-23 11:29:56',2019,'01',1),(34,'201700202',8,4,'2019-11-13 11:31:03','2019-11-23 11:31:05',2019,'02',1),(35,'201700202',8,4,'2019-11-07 11:31:13','2019-11-30 11:31:16',2019,'04',1),(36,'201700202',8,4,'2019-11-13 11:31:23','2019-11-29 11:31:25',2019,'03',1),(37,'201700202',8,4,'2019-11-13 11:36:26','2019-11-29 11:36:30',2019,'06',1),(38,'201700202',8,4,'2019-11-13 14:59:46','2019-11-29 14:59:48',2019,'07',1),(39,'201700202',8,4,'2019-11-13 14:59:57','2019-12-06 15:00:00',2019,'08',1),(40,'201700202',8,4,'2019-11-13 15:00:09','2019-11-15 15:00:12',2019,'05',1),(41,'201700202',8,4,'2019-11-13 15:00:20','2019-11-29 15:00:23',2019,'10',1),(42,'201700202',8,4,'2019-11-13 15:00:31','2019-11-30 15:00:33',2019,'11',1),(43,'201700202',8,4,'2019-11-06 15:00:40','2019-11-30 15:00:43',2019,'12',1),(44,'201700202',8,4,'2019-11-12 15:00:51','2019-11-30 15:00:55',2019,'13',1),(45,'201700202',8,4,'2019-11-12 15:01:02','2019-11-30 15:01:05',2019,'14',1);
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
INSERT INTO `plan_year` VALUES (4,201,'2019-11-13 11:24:48',2019);
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
INSERT INTO `progress_situ` VALUES (11,1197,455,'2019-11-13 15:17:40','1．选题 \r\n2．检索文献\r\n3．调查研究\r\n4.下达任务书','1.拟定毕业设计题目的大概范围。\r\n2.在网上查找相关资料和文献。\r\n3.与指导老师沟通并初步确定毕业设计题目。\r\n4.完成任务书的撰写。',2019),(12,1197,455,'2019-11-13 15:17:58','1.拟定题目；\r\n2.构思大纲；\r\n3.撰写开题报告；\r\n4.进行开题','1．确定毕业设计题目。\r\n2．查阅相关文献资料，拟定论文提纲。\r\n3．完成毕业论文开题报告的撰写。\r\n4．进行开题答辩。',2019),(13,1197,455,'2019-11-13 15:18:12','1.撰写初稿；\r\n2.检查、修改初稿','1．对系统进行需求分析和可行性研究。\r\n2．对系统进行概要设计和详细设计。\r\n3．分析系统的总体框架和总体功能模块。',2019),(14,1197,455,'2019-11-13 15:18:27','1.定稿；\r\n2.答辩准备','1．对系统进行测试以及发布\r\n2．完成整个毕业设计，撰写论文\r\n3．初步完成论文的撰写工作，与指导老师交流完善论文。',2019),(15,1197,455,'2019-11-13 15:18:40','答辩','1．根据梧州学院本科论文的格式要求对毕业论文进行最后的检查和修改工作。\r\n2．整理好毕业设计和论文，等待答辩。\r\n3．进行毕业答辩。',2019),(16,1190,455,'2019-11-26 08:20:20','1．选题 \r\n2．检索文献\r\n3．调查研究\r\n4.下达任务书','1．拟定论文研究课题的大概范围。\r\n2．通过网上查找相关资料和论文文献。\r\n3．与指导老师交流研究该课题的可行性。\r\n4．完成任务书的撰写。',2019),(17,1190,455,'2019-11-26 08:20:36','1.拟定题目；\r\n2.构思大纲；\r\n3.撰写开题报告；\r\n4.进行开题','1．确定论文研究课题。\r\n2．查阅相关文献资料，确定其需求，拟定毕业设计架构和论文提纲。\r\n3．完成毕业论文开题报告的撰写。\r\n4．进行开题答辩。',2019),(18,1190,455,'2019-11-26 08:20:51','1.撰写初稿；\r\n2.检查、修改初稿','1．对毕业设计进行总体设计和详细设计。\r\n2．搭建毕业设计框架并根据需求实现系统。\r\n3．根据毕业设计情况撰写初稿。\r\n4．与指导老师一起交流改进论文。',2019),(19,1190,455,'2019-11-26 08:21:04','1.定稿；\r\n2.答辩准备','1．逐步完善毕业设计和论文。\r\n2．整理好毕业设计和论文，制作介绍系统和论文的PPT，等待答辩。',2019),(20,1190,455,'2019-11-26 08:21:18','答辩','答辩并完成相关文档整理提交',2019);
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
INSERT INTO `reply_score` VALUES (6,'该同学设计的 广西梧州食品药品检验所检验报告系统在答辩过程中使用的是来自项目的实时数据，答辩时自述阶段条理清晰，设计目的明确，运用技术得当，作品演示无错误，从项目的实际意义来看，该生的设计作品具备了软件产品的特性，能在其他检验所推广使用。在答辩环节回答问题准确，对所提问题有较为深入的理解，答辩过程流畅，同时也反映出该作品确为本人所设计。本组依据其作品工作量和答辩过程答辩小组给定分数为91分。',91,91,'优',1197,2019,'00'),(7,'SELECT * FROM (SELECT  st.*,  up.userSex,up.userAge,up.userEmail,up.userTel,up.userImg,up.userType,  sdt.dept_name,scy.category_name,smr.major_name,scs.class_name,  age.teacher_id ,str.teacher_name ,gst.id,gst.group_allot_id, gat.group_name,gst.`year`,  ifo.issue_name ,ifo.issue_type,gat.group_type ,gst.defense_teacher_id,rse.reply_score_finish,rse.reply_type FROM sys_student st  INNER JOIN user_hlep up ON st.user_id = up.id  LEFT OUTER JOIN sys_department sdt ON st.dept_number = sdt.dept_number  LEFT OUTER JOIN sys_category scy ON st.category_id = scy.category_id  LEFT OUTER JOIN sys_major smr ON st.major_id =smr.major_id  LEFT OUTER JOIN sys_class scs ON st.class_id = scs.class_id  LEFT OUTER JOIN allot_guide age ON st.stu_id = age.stu_id  LEFT OUTER JOIN sys_teacher str ON age.teacher_id = str.teacher_id LEFT OUTER JOIN group_student gst ON st.stu_id = gst.student_id and age.`year` = gst.`year`  LEFT OUTER JOIN issue_info ifo ON st.stu_id = ifo.stu_id and   age.`year` = ifo.`year`  LEFT OUTER JOIN group_allot gat ON gst.group_allot_id = gat.group_id and gst.year = gat.year  LEFT OUTER JOIN reply_score rse ON st.stu_id = rse.stu_id and   age.`year` = rse.`year`  WHERE gst.group_allot_id is not null  ) AS model WHERE 1 = 1  and model.group_allot_id = ?  and model.year = ? ',2,69,NULL,1197,2019,'01'),(8,'该同学设计的广西贵港市港北区项目综合管理信息系统在答辩过程中使用的是来自项目的实时数据，答辩时自述阶段条理清晰，设计目的明确，运用技术得当，作品演示无错误，从项目的实际意义来看，该生的设计作品具备了软件产品的特性，并已推广使用。在答辩环节回答问题准确，对所提问题有较为深入的理解，答辩过程流畅，同时也反映出该作品确为本人所设计，该生是本答辩组中技术能力最好的之一，希望以后加强口头表达能力。本组依据其作品工作量和答辩过程答辩小组给定分数为94分。',94,95,'优',1190,2019,'00'),(9,'该生毕业设计作品是一个实际投入使用并已推广的项目，符合我院应用型人\n才培养目标，从答辩过程看，该生能准确回答答辩组所提出的问题，该生毕业\n设计作品工作量适中，主要技术难度体现在实际使用上的细节把控和设计约束，\n该生答辩过程流畅，毕业设计作品运用技术得当，并取得了良好的效果。\n从论文来看，该生论文结构合理、逻辑条理清楚，能深入理解软件工程过程，\n论文能较好反映出该生的水平和综合运用知识的能力。具备运用所学知识进行科\n学研究和开发软件的能力。达到毕业论文优秀要求。',94,95,'优',1190,2019,'01');
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
INSERT INTO `review` VALUES (24,1197,91,455,'无','02',NULL,2019,NULL),(25,1197,92,455,'  该项目是教师横向科研项目，该生一直作为主要设计人员参与该项目，项目以广西梧州食品药品检验所的自动报告书系统设计为设计目的，该生在该项目中主要完成了检品协检流程模型的构建、实验底稿的修改痕迹追踪和报告书模板动态管理模块，从完成的实际情况看，该生软件技术以及综合能力达到一定的水准。\r\n从论文来看，该生论文结构合理、逻辑条理清楚，能深入理解软件工程过程。从组织纪律看，该同学能按时参加毕业设计小组会议，能按时完成阶段任务，在毕业设计小组中，能积极组织同组同学讲授和指导相关技术问题，并能积极配合指导老师指导其他同学的遇到的技术问题和困难，在软件技术上成熟度较高，能单独应对软件项目的技术问题和组织开发过程。\r\n综上，该同学具备运用所学知识进行科学研究和开发软件的能力。该同学的毕业论文达到本科毕业生水平，同意参加答辩。','00','01',2019,NULL),(26,1197,90,455,'韦东连同学运用基于MVC模式的SSH框架技术，开发出广西梧州食品药品检验所检验报告系统，选题符合软件工程专业培养目标，需求较为复杂，工作量大，课题的实用性强，课题意义重大。\r\n从论文内容来看，论文以软件工程过程来叙述毕业设计作品的开发过程，写作过程中能综合运用软件工程方面的知识，从软件需求分析到软件设计及实现能深入调研梧州药检所样品检验流程，设计一个满足实际业务要求的检验报告系统从而实现业务科与实验室协同工作及检品过程监督；为检验检品人员提供了便捷、高效、精确的服务，从而保证检品检验过程中的标准规范，避免在人工操作中存在的问题和弊端。综合作品和论文来看，该同学运用知识能力较强，设计思路清晰，能综合运用所学知识解决实际中的问题，能力较为突出。文章篇幅完全符合学院规定，内容较为完整，层次结构安排科学，主要观点突出，逻辑关系清楚。\r\n综上所述，该生毕业论文符合梧州学院毕业论文要求，同意参加毕业答辩。','01','01',2019,NULL),(27,1190,96,455,'	严荣同学的毕业设计课题来自指导教师的委托项目，由广西贵港市港北区发改局委托开发的港北区项目管理系统，该系统主要使用Android及SSH框架技术，选题符合软件工程专业培养目标，工作量适中，该系统目前已经在广西贵港市港北区正式运行并推广到梧州市苍梧县、贵港市平南县等县市使用。\r\n从论文来看，该生论文结构合理、逻辑条理清楚，能深入理解软件工程过程。从组织纪律看，该同学能按时参加毕业设计小组会议，能按时完成阶段任务，在毕业设计小组中，能积极组织同组同学讲授和指导相关技术问题，并能积极配合指导老师指导其他同学的遇到的技术问题和困难，在软件技术上成熟度较高，能单独应对软件项目的技术问题和组织开发过程。\r\n综上，该同学具备运用所学知识进行科学研究和开发软件的能力。该同学的毕业论文达到本科毕业生水平，同意参加答辩。','00','01',2019,NULL),(28,1190,96,455,'无','02',NULL,2019,NULL),(29,1190,94,455,'何志明同学运用Android及SSH框架技术，开发出贵港市港北区项目建设协同数据平台，选题符合软件工程专业培养目标，工作量适中，课题的实用性强，课题意义重大。\r\n从论文内容来看，论文以软件工程过程来叙述毕业设计作品的开发过程，写作过程中能综合运用软件工程方面的知识，从软件需求分析到软件设计及实现全面分析项目管理系统利用手机端采集项目进度数据问题，并具体针对项目建设实施过程中的进度汇报、资金使用监管、实施过程中存在问题及时反馈及项目主管部门和主管领导实时批示等问题以及其解决方式和方法进行了详细介绍。切实解决了港北区主管部门和主管领导到项目过程的实时监控和项目情况的实时掌握，也加强了主管部门和主管领导与项目干系人的无缝对接，采用文字、现场图片和现场视频的方式解决了主管领导与主管部门对项目工程进度的形象掌握。综合作品和论文来看，该同学运用知识能力较强，设计思路清晰，能综合运用所学知识解决实际中的问题，能力较为突出。文章篇幅完全符合学院规定，内容较为完整，层次结构安排科学，主要观点突出，逻辑关系清楚。\r\n综上所述，该生毕业论文符合梧州学院毕业论文要求，同意参加毕业答辩。','01','01',2019,NULL);
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
INSERT INTO `review_score` VALUES (87,24,26,9,1,NULL,2019,'2019-11-13 15:48:07'),(88,24,27,10,2,NULL,2019,'2019-11-13 15:48:07'),(89,24,28,18,3,NULL,2019,'2019-11-13 15:48:07'),(90,24,29,9,4,NULL,2019,'2019-11-13 15:48:07'),(91,24,30,18,5,NULL,2019,'2019-11-13 15:48:07'),(92,24,31,27,6,NULL,2019,'2019-11-13 15:48:07'),(93,25,1,7,1,NULL,2019,'2019-11-13 15:49:27'),(94,25,2,7,2,NULL,2019,'2019-11-13 15:49:27'),(95,25,3,6,3,NULL,2019,'2019-11-13 15:49:27'),(96,25,4,10,4,NULL,2019,'2019-11-13 15:49:27'),(97,25,5,10,5,NULL,2019,'2019-11-13 15:49:27'),(98,25,6,9,6,NULL,2019,'2019-11-13 15:49:27'),(99,25,7,9,7,NULL,2019,'2019-11-13 15:49:27'),(100,25,8,6,8,NULL,2019,'2019-11-13 15:49:27'),(101,25,9,8,9,NULL,2019,'2019-11-13 15:49:27'),(102,25,10,5,10,NULL,2019,'2019-11-13 15:49:27'),(103,25,11,5,11,NULL,2019,'2019-11-13 15:49:27'),(104,25,12,10,12,NULL,2019,'2019-11-13 15:49:27'),(105,26,13,5,1,NULL,2019,'2019-11-13 16:14:17'),(106,26,14,5,2,NULL,2019,'2019-11-13 16:14:17'),(107,26,15,5,3,NULL,2019,'2019-11-13 16:14:17'),(108,26,16,5,4,NULL,2019,'2019-11-13 16:14:17'),(109,26,17,7,5,NULL,2019,'2019-11-13 16:14:17'),(110,26,18,7,6,NULL,2019,'2019-11-13 16:14:17'),(111,26,19,7,7,NULL,2019,'2019-11-13 16:14:17'),(112,26,20,8,8,NULL,2019,'2019-11-13 16:14:17'),(113,26,21,6,9,NULL,2019,'2019-11-13 16:14:17'),(114,26,22,10,10,NULL,2019,'2019-11-13 16:14:17'),(115,26,23,6,11,NULL,2019,'2019-11-13 16:14:17'),(116,26,24,8,12,NULL,2019,'2019-11-13 16:14:17'),(117,26,25,11,13,NULL,2019,'2019-11-13 16:14:17'),(118,27,1,7,1,NULL,2019,'2019-11-26 08:23:12'),(119,27,2,7,2,NULL,2019,'2019-11-26 08:23:12'),(120,27,3,6,3,NULL,2019,'2019-11-26 08:23:12'),(121,27,4,9,4,NULL,2019,'2019-11-26 08:23:12'),(122,27,5,10,5,NULL,2019,'2019-11-26 08:23:12'),(123,27,6,10,6,NULL,2019,'2019-11-26 08:23:12'),(124,27,7,10,7,NULL,2019,'2019-11-26 08:23:12'),(125,27,8,8,8,NULL,2019,'2019-11-26 08:23:12'),(126,27,9,9,9,NULL,2019,'2019-11-26 08:23:12'),(127,27,10,5,10,NULL,2019,'2019-11-26 08:23:12'),(128,27,11,5,11,NULL,2019,'2019-11-26 08:23:12'),(129,27,12,10,12,NULL,2019,'2019-11-26 08:23:12'),(130,28,26,10,1,NULL,2019,'2019-11-26 08:24:31'),(131,28,27,10,2,NULL,2019,'2019-11-26 08:24:31'),(132,28,28,20,3,NULL,2019,'2019-11-26 08:24:31'),(133,28,29,9,4,NULL,2019,'2019-11-26 08:24:31'),(134,28,30,20,5,NULL,2019,'2019-11-26 08:24:31'),(135,28,31,27,6,NULL,2019,'2019-11-26 08:24:31'),(136,29,13,5,1,NULL,2019,'2019-11-26 09:05:03'),(137,29,14,5,2,NULL,2019,'2019-11-26 09:05:03'),(138,29,15,5,3,NULL,2019,'2019-11-26 09:05:03'),(139,29,16,5,4,NULL,2019,'2019-11-26 09:05:03'),(140,29,17,6,5,NULL,2019,'2019-11-26 09:05:03'),(141,29,18,8,6,NULL,2019,'2019-11-26 09:05:03'),(142,29,19,8,7,NULL,2019,'2019-11-26 09:05:03'),(143,29,20,8,8,NULL,2019,'2019-11-26 09:05:03'),(144,29,21,6,9,NULL,2019,'2019-11-26 09:05:03'),(145,29,22,10,10,NULL,2019,'2019-11-26 09:05:03'),(146,29,23,8,11,NULL,2019,'2019-11-26 09:05:03'),(147,29,24,8,12,NULL,2019,'2019-11-26 09:05:03'),(148,29,25,12,13,NULL,2019,'2019-11-26 09:05:03');
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
INSERT INTO `student_paper` VALUES (8,'00.jpg',1197,455,2019,'/upload/E2D95982-DE26-4C23-810D-D64158AE74F8_00.jpg',3284,'00',NULL),(9,'charqun.jpg',1197,455,2019,'/upload/C5DE4DBB-4AE6-4D40-83A7-F43C731B0BD8_charqun.jpg',23543,'01',NULL),(10,'weclome.png',1197,455,2019,'/upload/1164FA79-57C2-4683-8CEB-493AAFC34E8D_weclome.png',554437,'02',NULL),(11,'charqun.jpg',1190,455,2019,'/upload/C035CE41-36B8-41F1-BB56-74AF5C7F21EF_charqun.jpg',23543,'01',NULL),(12,'close.png',1190,455,2019,'/upload/5D701E48-98E2-429D-B5CD-B4E0E592B6FD_close.png',3427,'00',NULL),(13,'00.jpg',1190,455,2019,'/upload/216F3B5C-EFFD-484C-A5BF-1E02F4C85F32_00.jpg',3284,'00',NULL),(14,'f05.png',1190,455,2019,'/upload/E1C594CD-8125-4214-AE6E-F1C2C9B6F5E7_f05.png',3351,'02',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=1198 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_student`
--

LOCK TABLES `sys_student` WRITE;
/*!40000 ALTER TABLE `sys_student` DISABLE KEYS */;
INSERT INTO `sys_student` VALUES (884,'201600208104','何盛万','20170001','梧州学院','本科','4','2016-09-07','2016','201700202',NULL,4,32,1943),(885,'201600213141','李苑瑜','20170001','梧州学院','本科','4','2016-09-08','2016','201700202',NULL,4,36,1944),(886,'201600213142','陆南梅','20170001','梧州学院','本科','4','2016-09-09','2016','201700202',NULL,4,36,1945),(887,'201400213018','廖克裕','20170001','梧州学院','本科','4','2016-09-10','2016','201700202',NULL,4,36,1946),(888,'201600213104','甘德品','20170001','梧州学院','本科','4','2016-09-11','2016','201700202',NULL,4,36,1947),(889,'201600213108','黄依顺','20170001','梧州学院','本科','4','2016-09-12','2016','201700202',NULL,4,36,1948),(890,'201600213113','李春霖','20170001','梧州学院','本科','4','2016-09-13','2016','201700202',NULL,4,36,1949),(891,'201600213115','李宗森','20170001','梧州学院','本科','4','2016-09-14','2016','201700202',NULL,4,36,1950),(892,'201600213117','梁稳','20170001','梧州学院','本科','4','2016-09-15','2016','201700202',NULL,4,36,1951),(893,'201600213120','龙永亮','20170001','梧州学院','本科','4','2016-09-16','2016','201700202',NULL,4,36,1952),(894,'201600213122','卢山盟','20170001','梧州学院','本科','4','2016-09-17','2016','201700202',NULL,4,36,1953),(895,'201600213126','王文滔','20170001','梧州学院','本科','4','2016-09-18','2016','201700202',NULL,4,36,1954),(896,'201600213132','周林福','20170001','梧州学院','本科','4','2016-09-19','2016','201700202',NULL,4,36,1955),(897,'201600213138','黄叶英','20170001','梧州学院','本科','4','2016-09-20','2016','201700202',NULL,4,36,1956),(898,'201600213139','黄玉花','20170001','梧州学院','本科','4','2016-09-21','2016','201700202',NULL,4,36,1957),(899,'201600213145','潘丽梅','20170001','梧州学院','本科','4','2016-09-22','2016','201700202',NULL,4,36,1958),(900,'201600213148','唐艳妮','20170001','梧州学院','本科','4','2016-09-23','2016','201700202',NULL,4,36,1959),(901,'201600213153','杨冬雪','20170001','梧州学院','本科','4','2016-09-24','2016','201700202',NULL,4,36,1960),(902,'201600213155','游春兰 ','20170001','梧州学院','本科','4','2016-09-25','2016','201700202',NULL,4,36,1961),(903,'201600213215','马欣廷','20170001','梧州学院','本科','4','2016-09-26','2016','201700202',NULL,4,37,1962),(904,'201600213218','潘辉','20170001','梧州学院','本科','4','2016-09-27','2016','201700202',NULL,4,37,1963),(905,'201600213220','宋楚皓','20170001','梧州学院','本科','4','2016-09-28','2016','201700202',NULL,4,37,1964),(906,'201500208207','黄郁盛','20170001','梧州学院','本科','4','2016-09-29','2015','201700202',NULL,4,NULL,1965),(907,'201500208218','梁家琪','20170001','梧州学院','本科','4','2016-09-30','2015','201700202',NULL,4,NULL,1966),(908,'201500208230','沈嘉伟','20170001','梧州学院','本科','4','2016-10-01','2015','201700202',NULL,4,NULL,1967),(909,'201500208231','覃镜毓','20170001','梧州学院','本科','4','2016-10-02','2015','201700202',NULL,4,NULL,1968),(910,'201500208235','王志','20170001','梧州学院','本科','4','2016-10-03','2015','201700202',NULL,4,NULL,1969),(911,'20160020820\'1','陈胜','20170001','梧州学院','本科','4','2016-10-04','2016','201700202',NULL,4,33,1970),(912,'201600208230','杨长官','20170001','梧州学院','本科','4','2016-10-05','2016','201700202',NULL,4,33,1971),(913,'201600208233‘','陈冬霞','20170001','梧州学院','本科','4','2016-10-06','2016','201700202',NULL,4,33,1972),(914,'201600208234’','程秀英','20170001','梧州学院','本科','4','2016-10-07','2016','201700202',NULL,4,33,1973),(915,'201600208236','李美琦','20170001','梧州学院','本科','4','2016-10-08','2016','201700202',NULL,4,33,1974),(916,'201600208237‘','李逸','20170001','梧州学院','本科','4','2016-10-09','2016','201700202',NULL,4,33,1975),(917,'201600208241‘','罗贺','20170001','梧州学院','本科','4','2016-10-10','2016','201700202',NULL,4,33,1976),(918,'201600208244’','孙少喜','20170001','梧州学院','本科','4','2016-10-11','2016','201700202',NULL,4,33,1977),(919,'201600208408','李海华','20170001','梧州学院','本科','4','2016-10-12','2016','201700202',NULL,4,35,1978),(920,'201600208409','李善念','20170001','梧州学院','本科','4','2016-10-13','2016','201700202',NULL,4,35,1979),(921,'201600208410','李天赐','20170001','梧州学院','本科','4','2016-10-14','2016','201700202',NULL,4,35,1980),(922,'201600208420','覃威茗','20170001','梧州学院','本科','4','2016-10-15','2016','201700202',NULL,4,35,1981),(923,'201600208427','吴思敏','20170001','梧州学院','本科','4','2016-10-16','2016','201700202',NULL,4,35,1982),(924,'201600208428','杨健铭','20170001','梧州学院','本科','4','2016-10-17','2016','201700202',NULL,4,35,1983),(925,'201600208430','郑宣贵','20170001','梧州学院','本科','4','2016-10-18','2016','201700202',NULL,4,35,1984),(926,'201600208431','周杰威','20170001','梧州学院','本科','4','2016-10-19','2016','201700202',NULL,4,35,1985),(927,'201600208435','池小媛','20170001','梧州学院','本科','4','2016-10-20','2016','201700202',NULL,4,35,1986),(928,'201600208439','梁海玲','20170001','梧州学院','本科','4','2016-10-21','2016','201700202',NULL,4,35,1987),(929,'201600213202','陈德培','20170001','梧州学院','本科','4','2016-10-22','2016','201700202',NULL,4,37,1988),(930,'201600213203','陈永任','20170001','梧州学院','本科','4','2016-10-23','2016','201700202',NULL,4,37,1989),(931,'201600213210','黄贻通','20170001','梧州学院','本科','4','2016-10-24','2016','201700202',NULL,4,37,1990),(932,'201600213223','苏祖豪','20170001','梧州学院','本科','4','2016-10-25','2016','201700202',NULL,4,37,1991),(933,'201500208107','黄慧君','20170001','梧州学院','本科','4','2016-10-26','2015','201700202',NULL,4,NULL,1992),(934,'201500208317','李睿','20170001','梧州学院','本科','4','2016-10-27','2015','201700202',NULL,4,NULL,1993),(935,'201500208318','梁皓','20170001','梧州学院','本科','4','2016-10-28','2015','201700202',NULL,4,NULL,1994),(936,'201500208323','陆权宁','20170001','梧州学院','本科','4','2016-10-29','2015','201700202',NULL,4,NULL,1995),(937,'201600208101','陈巨洁','20170001','梧州学院','本科','4','2016-10-30','2016','201700202',NULL,4,32,1996),(938,'201600208106','蒋邦雄','20170001','梧州学院','本科','4','2016-10-31','2016','201700202',NULL,4,32,1997),(939,'201600208108','李炳志','20170001','梧州学院','本科','4','2016-11-01','2016','201700202',NULL,4,32,1998),(940,'201600208109','李宏伟','20170001','梧州学院','本科','4','2016-11-02','2016','201700202',NULL,4,32,1999),(941,'201600208112','李杨','20170001','梧州学院','本科','4','2016-11-03','2016','201700202',NULL,4,32,2000),(942,'201600208113','李造','20170001','梧州学院','本科','4','2016-11-04','2016','201700202',NULL,4,32,2001),(943,'201600208114','林家健','20170001','梧州学院','本科','4','2016-11-05','2016','201700202',NULL,4,32,2002),(944,'201600208115','凌钦华','20170001','梧州学院','本科','4','2016-11-06','2016','201700202',NULL,4,32,2003),(945,'201600208130','杨夕锋','20170001','梧州学院','本科','4','2016-11-07','2016','201700202',NULL,4,32,2004),(946,'201600208132','曾波','20170001','梧州学院','本科','4','2016-11-08','2016','201700202',NULL,4,32,2005),(947,'201600208203','董有宏','20170001','梧州学院','本科','4','2016-11-09','2016','201700202',NULL,4,33,2006),(948,'201600208207','蓝福','20170001','梧州学院','本科','4','2016-11-10','2016','201700202',NULL,4,33,2007),(949,'201600208209','李家荣','20170001','梧州学院','本科','4','2016-11-11','2016','201700202',NULL,4,33,2008),(950,'201600208214','刘维逸','20170001','梧州学院','本科','4','2016-11-12','2016','201700202',NULL,4,33,2009),(951,'201600208215','卢永贵','20170001','梧州学院','本科','4','2016-11-13','2016','201700202',NULL,4,33,2010),(952,'201600208216‘','罗浩铨','20170001','梧州学院','本科','4','2016-11-14','2016','201700202',NULL,4,33,2011),(953,'201600208219','慕荣辉','20170001','梧州学院','本科','4','2016-11-15','2016','201700202',NULL,4,33,2012),(954,'201600213154','杨银燕','20170001','梧州学院','本科','4','2016-11-16','2016','201700202',NULL,4,36,2013),(955,'201600213207','黄鸿羲','20170001','梧州学院','本科','4','2016-11-17','2016','201700202',NULL,4,37,2014),(956,'201600213213','李汶霖','20170001','梧州学院','本科','4','2016-11-18','2016','201700202',NULL,4,37,2015),(957,'201600213216','莫运平','20170001','梧州学院','本科','4','2016-11-19','2016','201700202',NULL,4,37,2016),(958,'201600213219','潘琦','20170001','梧州学院','本科','4','2016-11-20','2016','201700202',NULL,4,37,2017),(959,'201600213232','钟将','20170001','梧州学院','本科','4','2016-11-21','2016','201700202',NULL,4,37,2018),(960,'201400213045','张超','20170001','梧州学院','本科','4','2016-11-22','2014','201700202',NULL,4,25,2019),(961,'201500208305','董振华','20170001','梧州学院','本科','4','2016-11-23','2015','201700202',NULL,4,NULL,2020),(962,'201500208415','陆宏安','20170001','梧州学院','本科','4','2016-11-24','2015','201700202',NULL,4,NULL,2021),(963,'201600208147','杨吉','20170001','梧州学院','本科','4','2016-11-25','2016','201700202',NULL,4,32,2022),(964,'201600208229‘','颜阳','20170001','梧州学院','本科','4','2016-11-26','2016','201700202',NULL,4,33,2023),(965,'201600208242‘','潘杏','20170001','梧州学院','本科','4','2016-11-27','2016','201700202',NULL,4,33,2024),(966,'201600208302','陈春杨','20170001','梧州学院','本科','4','2016-11-28','2016','201700202',NULL,4,34,2025),(967,'201600208313','梁艺耀','20170001','梧州学院','本科','4','2016-11-29','2016','201700202',NULL,4,34,2026),(968,'201600208314','廖富光','20170001','梧州学院','本科','4','2016-11-30','2016','201700202',NULL,4,34,2027),(969,'201600208329','叶子胜','20170001','梧州学院','本科','4','2016-12-01','2016','201700202',NULL,4,34,2028),(970,'201600208332','周家财','20170001','梧州学院','本科','4','2016-12-02','2016','201700202',NULL,4,34,2029),(971,'201600208336','陈紫丽','20170001','梧州学院','本科','4','2016-12-03','2016','201700202',NULL,4,34,2030),(972,'201600208339','李静','20170001','梧州学院','本科','4','2016-12-04','2016','201700202',NULL,4,34,2031),(973,'201600208424','唐志晖','20170001','梧州学院','本科','4','2016-12-05','2016','201700202',NULL,4,35,2032),(974,'201600208429','杨顺海','20170001','梧州学院','本科','4','2016-12-06','2016','201700202',NULL,4,35,2033),(975,'201600208442','刘玉霜','20170001','梧州学院','本科','4','2016-12-07','2016','201700202',NULL,4,35,2034),(976,'201600208451','张中怡','20170001','梧州学院','本科','4','2016-12-08','2016','201700202',NULL,4,35,2035),(977,'201600213236','陈艳艳','20170001','梧州学院','本科','4','2016-12-09','2016','201700202',NULL,4,37,2036),(978,'201600213237','黄靖舒','20170001','梧州学院','本科','4','2016-12-10','2016','201700202',NULL,4,37,2037),(979,'201600213238','黄柳条','20170001','梧州学院','本科','4','2016-12-11','2016','201700202',NULL,4,37,2038),(980,'201600213240','江锦琦','20170001','梧州学院','本科','4','2016-12-12','2016','201700202',NULL,4,37,2039),(981,'201600213241','蓝金董','20170001','梧州学院','本科','4','2016-12-13','2016','201700202',NULL,4,37,2040),(982,'201600213245','吕江','20170001','梧州学院','本科','4','2016-12-14','2016','201700202',NULL,4,37,2041),(983,'201600213246','蒙丹','20170001','梧州学院','本科','4','2016-12-15','2016','201700202',NULL,4,37,2042),(984,'201600213249','覃香群','20170001','梧州学院','本科','4','2016-12-16','2016','201700202',NULL,4,37,2043),(985,'201500213101','蔡昌志','20170001','梧州学院','本科','4','2016-12-17','2015','201700202',NULL,4,NULL,2044),(986,'201500213103','董世怡','20170001','梧州学院','本科','4','2016-12-18','2015','201700202',NULL,4,NULL,2045),(987,'201500213216','陶锐','20170001','梧州学院','本科','4','2016-12-19','2015','201700202',NULL,4,NULL,2046),(988,'201500213220','韦汀晏','20170001','梧州学院','本科','4','2016-12-20','2015','201700202',NULL,4,NULL,2047),(989,'201500213224','钟宾','20170001','梧州学院','本科','4','2016-12-21','2015','201700202',NULL,4,NULL,2048),(990,'201600208148','张翠玲','20170001','梧州学院','本科','4','2016-12-22','2016','201700202',NULL,4,32,2049),(991,'201600208401','曹宸玮','20170001','梧州学院','本科','4','2016-12-23','2016','201700202',NULL,4,35,2050),(992,'201600208406','韩鹏程','20170001','梧州学院','本科','4','2016-12-24','2016','201700202',NULL,4,35,2051),(993,'201600208415','刘柏池','20170001','梧州学院','本科','4','2016-12-25','2016','201700202',NULL,4,35,2052),(994,'201600208419','阮民涛','20170001','梧州学院','本科','4','2016-12-26','2016','201700202',NULL,4,35,2053),(995,'201600208422','唐昊','20170001','梧州学院','本科','4','2016-12-27','2016','201700202',NULL,4,35,2054),(996,'201600208423','唐奕明','20170001','梧州学院','本科','4','2016-12-28','2016','201700202',NULL,4,35,2055),(997,'201600208425','韦永共','20170001','梧州学院','本科','4','2016-12-29','2016','201700202',NULL,4,35,2056),(998,'201600208436','丁婉朔','20170001','梧州学院','本科','4','2016-12-30','2016','201700202',NULL,4,35,2057),(999,'201600208441','刘家倩','20170001','梧州学院','本科','4','2016-12-31','2016','201700202',NULL,4,35,2058),(1000,'201600213101','陈炳成','20170001','梧州学院','本科','4','2017-01-01','2016','201700202',NULL,4,36,2059),(1001,'201600213105','甘范名','20170001','梧州学院','本科','4','2017-01-02','2016','201700202',NULL,4,36,2060),(1002,'201600213111','雷观昌','20170001','梧州学院','本科','4','2017-01-03','2016','201700202',NULL,4,36,2061),(1003,'201600213112','黎峻豪','20170001','梧州学院','本科','4','2017-01-04','2016','201700202',NULL,4,36,2062),(1004,'201600213118','刘冠宏','20170001','梧州学院','本科','4','2017-01-05','2016','201700202',NULL,4,36,2063),(1005,'201600213124','石宏磊','20170001','梧州学院','本科','4','2017-01-06','2016','201700202',NULL,4,36,2064),(1006,'201600213125','谭建狄','20170001','梧州学院','本科','4','2017-01-07','2016','201700202',NULL,4,36,2065),(1007,'201600213127','韦歌迪','20170001','梧州学院','本科','4','2017-01-08','2016','201700202',NULL,4,36,2066),(1008,'201600213133','朱华庭','20170001','梧州学院','本科','4','2017-01-09','2016','201700202',NULL,4,36,2067),(1009,'201600213134','朱首彰','20170001','梧州学院','本科','4','2017-01-10','2016','201700202',NULL,4,36,2068),(1010,'201600213239','黄小梅','20170001','梧州学院','本科','4','2017-01-11','2016','201700202',NULL,4,37,2069),(1011,'201600213243','梁小英','20170001','梧州学院','本科','4','2017-01-12','2016','201700202',NULL,4,37,2070),(1012,'201600213248','覃萍','20170001','梧州学院','本科','4','2017-01-13','2016','201700202',NULL,4,37,2071),(1013,'201500208123','彭标','20170001','梧州学院','本科','4','2017-01-14','2015','201700202',NULL,4,NULL,2072),(1014,'201500208128','韦增武','20170001','梧州学院','本科','4','2017-01-15','2015','201700202',NULL,4,NULL,2073),(1015,'201500208129','闻丽媛','20170001','梧州学院','本科','4','2017-01-16','2015','201700202',NULL,4,NULL,2074),(1016,'201500208204','傅宇华','20170001','梧州学院','本科','4','2017-01-17','2015','201700202',NULL,4,NULL,2075),(1017,'201600208105','黄智中','20170001','梧州学院','本科','4','2017-01-18','2016','201700202',NULL,4,32,2076),(1018,'201600208118','潘宸','20170001','梧州学院','本科','4','2017-01-19','2016','201700202',NULL,4,32,2077),(1019,'201600208120','沈喜龙','20170001','梧州学院','本科','4','2017-01-20','2016','201700202',NULL,4,32,2078),(1020,'201600208121','司开元','20170001','梧州学院','本科','4','2017-01-21','2016','201700202',NULL,4,32,2079),(1021,'201600208124','王梓能','20170001','梧州学院','本科','4','2017-01-22','2016','201700202',NULL,4,32,2080),(1022,'201600208128','谢常繁','20170001','梧州学院','本科','4','2017-01-23','2016','201700202',NULL,4,32,2081),(1023,'201600208135','黄滢','20170001','梧州学院','本科','4','2017-01-24','2016','201700202',NULL,4,32,2082),(1024,'201600208136','蒋玉蓉','20170001','梧州学院','本科','4','2017-01-25','2016','201700202',NULL,4,32,2083),(1025,'201600208145','温晓怡','20170001','梧州学院','本科','4','2017-01-26','2016','201700202',NULL,4,32,2084),(1026,'201600208208‘','李锋','20170001','梧州学院','本科','4','2017-01-27','2016','201700202',NULL,4,33,2085),(1027,'201600208246’','王惠','20170001','梧州学院','本科','4','2017-01-28','2016','201700202',NULL,4,33,2086),(1028,'201600208249','张露丹','20170001','梧州学院','本科','4','2017-01-29','2016','201700202',NULL,4,33,2087),(1029,'201600208251','曾小婷','20170001','梧州学院','本科','4','2017-01-30','2016','201700202',NULL,4,33,2088),(1030,'201600208307','黄启东','20170001','梧州学院','本科','4','2017-01-31','2016','201700202',NULL,4,34,2089),(1031,'201600208321','阮春彪','20170001','梧州学院','本科','4','2017-02-01','2016','201700202',NULL,4,34,2090),(1032,'201600208345','盘美英','20170001','梧州学院','本科','4','2017-02-02','2016','201700202',NULL,4,34,2091),(1033,'201600208404','范书豪','20170001','梧州学院','本科','4','2017-02-03','2016','201700202',NULL,4,35,2092),(1034,'201600208413','廖树杰','20170001','梧州学院','本科','4','2017-02-04','2016','201700202',NULL,4,35,2093),(1035,'201600208414','凌朝政','20170001','梧州学院','本科','4','2017-02-05','2016','201700202',NULL,4,35,2094),(1036,'201600208418','潘登','20170001','梧州学院','本科','4','2017-02-06','2016','201700202',NULL,4,35,2095),(1037,'201600208440','梁静华','20170001','梧州学院','本科','4','2017-02-07','2016','201700202',NULL,4,35,2096),(1038,'201600213128','吴映辉','20170001','梧州学院','本科','4','2017-02-08','2016','201700202',NULL,4,36,2097),(1039,'201600213227','吴光辉','20170001','梧州学院','本科','4','2017-02-09','2016','201700202',NULL,4,37,2098),(1040,'201500208324','罗定友','20170001','梧州学院','本科','4','2017-02-10','2015','201700202',NULL,4,NULL,2099),(1041,'201500208325','蒙伟森','20170001','梧州学院','本科','4','2017-02-11','2015','201700202',NULL,4,NULL,2100),(1042,'201500208333','叶展鹏','20170001','梧州学院','本科','4','2017-02-12','2015','201700202',NULL,4,NULL,2101),(1043,'201600208146','吴丹茗','20170001','梧州学院','本科','4','2017-02-13','2016','201700202',NULL,4,32,2102),(1044,'201600208213','刘上剑','20170001','梧州学院','本科','4','2017-02-14','2016','201700202',NULL,4,33,2103),(1045,'201600208243','庞桂花','20170002','梧州学院','本科','4','2017-02-15','2016','201700202',NULL,4,33,2104),(1046,'201600208250‘','朱美林','20170003','梧州学院','本科','4','2017-02-16','2016','201700202',NULL,4,33,2105),(1047,'201600208301','曹鹏轩','20170004','梧州学院','本科','4','2017-02-17','2016','201700202',NULL,4,34,2106),(1048,'201600208309','黄世创','20170005','梧州学院','本科','4','2017-02-18','2016','201700202',NULL,4,34,2107),(1049,'201600208318','潘沛杰','20170006','梧州学院','本科','4','2017-02-19','2016','201700202',NULL,4,34,2108),(1050,'201600208330','张恒','20170007','梧州学院','本科','4','2017-02-20','2016','201700202',NULL,4,34,2109),(1051,'201600208331','张积健','20170008','梧州学院','本科','4','2017-02-21','2016','201700202',NULL,4,34,2110),(1052,'201600208335','陈怡','20170009','梧州学院','本科','4','2017-02-22','2016','201700202',NULL,4,34,2111),(1053,'201600208340','刘海帆','20170010','梧州学院','本科','4','2017-02-23','2016','201700202',NULL,4,34,2112),(1054,'201600208341','刘嘉嘉','20170011','梧州学院','本科','4','2017-02-24','2016','201700202',NULL,4,34,2113),(1055,'201600208344','罗颖玉','20170012','梧州学院','本科','4','2017-02-25','2016','201700202',NULL,4,34,2114),(1056,'201600208350','张晓君','20170013','梧州学院','本科','4','2017-02-26','2016','201700202',NULL,4,34,2115),(1057,'201600208402','陈震洺','20170014','梧州学院','本科','4','2017-02-27','2016','201700202',NULL,4,35,2116),(1058,'201600208403','邓彦松','20170015','梧州学院','本科','4','2017-02-28','2016','201700202',NULL,4,35,2117),(1059,'201600208412','梁海超','20170016','梧州学院','本科','4','2017-03-01','2016','201700202',NULL,4,35,2118),(1060,'201600208426','魏祥','20170017','梧州学院','本科','4','2017-03-02','2016','201700202',NULL,4,35,2119),(1061,'201600208433','陈秋梅','20170018','梧州学院','本科','4','2017-03-03','2016','201700202',NULL,4,35,2120),(1062,'201600208438','李春梅','20170019','梧州学院','本科','4','2017-03-04','2016','201700202',NULL,4,35,2121),(1063,'201600208445','盛晓洁','20170020','梧州学院','本科','4','2017-03-05','2016','201700202',NULL,4,35,2122),(1064,'201600213250','韦露沐','20170021','梧州学院','本科','4','2017-03-06','2016','201700202',NULL,4,37,2123),(1065,'201500208116','陆兆民','20170022','梧州学院','本科','4','2017-03-07','2015','201700202',NULL,4,NULL,2124),(1066,'201500208421','秦文兵','20170023','梧州学院','本科','4','2017-03-08','2015','201700202',NULL,4,NULL,2125),(1067,'201600208102','陈龙','20170026','梧州学院','本科','4','2017-03-09','2016','201700202',NULL,4,32,2126),(1068,'201600208122','覃一鋆','20170027','梧州学院','本科','4','2017-03-10','2016','201700202',NULL,4,32,2127),(1069,'201600208133','和雪英','20170028','梧州学院','本科','4','2017-03-11','2016','201700202',NULL,4,32,2128),(1070,'201600208134','黄佩珍','20170029','梧州学院','本科','4','2017-03-12','2016','201700202',NULL,4,32,2129),(1071,'201600208139','莫小丽','20170030','梧州学院','本科','4','2017-03-13','2016','201700202',NULL,4,32,2130),(1072,'201600208140','欧榕坤','20170031','梧州学院','本科','4','2017-03-14','2016','201700202',NULL,4,32,2131),(1073,'201600208141','冉带素','20170032','梧州学院','本科','4','2017-03-15','2016','201700202',NULL,4,32,2132),(1074,'201600208202','邓扬殷','20170033','梧州学院','本科','4','2017-03-16','2016','201700202',NULL,4,33,2133),(1075,'201600208206','华孝鹏','20170034','梧州学院','本科','4','2017-03-17','2016','201700202',NULL,4,33,2134),(1076,'201600208210','廖桂生','20170035','梧州学院','本科','4','2017-03-18','2016','201700202',NULL,4,33,2135),(1077,'201600208224‘','宋玉富','20170036','梧州学院','本科','4','2017-03-19','2016','201700202',NULL,4,33,2136),(1078,'201600208226','唐民','20170037','梧州学院','本科','4','2017-03-20','2016','201700202',NULL,4,33,2137),(1079,'201600208232’','周易源','20170038','梧州学院','本科','4','2017-03-21','2016','201700202',NULL,4,33,2138),(1080,'201500208136','赵迪','20170039','梧州学院','本科','4','2017-03-22','2016','201700202',NULL,4,34,2139),(1081,'201600208311','李昂','20170040','梧州学院','本科','4','2017-03-23','2016','201700202',NULL,4,34,2140),(1082,'201600208320','薛培星','20170041','梧州学院','本科','4','2017-03-24','2016','201700202',NULL,4,34,2141),(1083,'201600208323','王晗','20170042','梧州学院','本科','4','2017-03-25','2016','201700202',NULL,4,34,2142),(1084,'201600208326','谢振威','20170043','梧州学院','本科','4','2017-03-26','2016','201700202',NULL,4,34,2143),(1085,'201600213119','刘淋逸','20170044','梧州学院','本科','4','2017-03-27','2016','201700202',NULL,4,36,2144),(1086,'201600213144','蒙俐宏','20170045','梧州学院','本科','4','2017-03-28','2016','201700202',NULL,4,36,2145),(1087,'201600213208','黄家理','20170046','梧州学院','本科','4','2017-03-29','2016','201700202',NULL,4,37,2146),(1088,'201600213211','雷文浩','20170047','梧州学院','本科','4','2017-03-30','2016','201700202',NULL,4,37,2147),(1089,'201600213212','李家聪','20170048','梧州学院','本科','4','2017-03-31','2016','201700202',NULL,4,37,2148),(1090,'201601902132','黄妹','20170051','梧州学院','本科','4','2017-04-01','2016','201700202',NULL,4,32,2149),(1091,'201600208217','骆世嘉','20170052','梧州学院','本科','4','2017-04-02','2016','201700202',NULL,4,33,2150),(1092,'201600208218','蒙勇飞','20170053','梧州学院','本科','4','2017-04-03','2016','201700202',NULL,4,33,2151),(1093,'201600208221','庞彪','20170054','梧州学院','本科','4','2017-04-04','2016','201700202',NULL,4,33,2152),(1094,'201600208223','司晓硕','20170055','梧州学院','本科','4','2017-04-05','2016','201700202',NULL,4,33,2153),(1095,'201600208227','王洪升','20170056','梧州学院','本科','4','2017-04-06','2016','201700202',NULL,4,33,2154),(1096,'201600208247‘','吴丽丽','20170057','梧州学院','本科','4','2017-04-07','2016','201700202',NULL,4,33,2155),(1097,'201600208312','李国严','20170058','梧州学院','本科','4','2017-04-08','2016','201700202',NULL,4,34,2156),(1098,'201600208316','陆建宁','20170059','梧州学院','本科','4','2017-04-09','2016','201700202',NULL,4,34,2157),(1099,'201600213114','李汉彬','20170061','梧州学院','本科','4','2017-04-11','2016','201700202',NULL,4,36,2158),(1100,'201600213116','梁林','20170062','梧州学院','本科','4','2017-04-12','2016','201700202',NULL,4,36,2159),(1101,'201600213135','陈孔妙','20170063','梧州学院','本科','4','2017-04-13','2016','201700202',NULL,4,36,2160),(1102,'201600213205','黄安','20170064','梧州学院','本科','4','2017-04-14','2016','201700202',NULL,4,37,2161),(1103,'201600213206','黄鸿庭','20170065','梧州学院','本科','4','2017-04-15','2016','201700202',NULL,4,37,2162),(1104,'201600213209','黄培彬','20170066','梧州学院','本科','4','2017-04-16','2016','201700202',NULL,4,37,2163),(1105,'201600213214','罗明贵','20170067','梧州学院','本科','4','2017-04-17','2016','201700202',NULL,4,37,2164),(1106,'201600213217','农建泽','20170068','梧州学院','本科','4','2017-04-18','2016','201700202',NULL,4,37,2165),(1107,'201600213221','苏家卫','20170069','梧州学院','本科','4','2017-04-19','2016','201700202',NULL,4,37,2166),(1108,'201600213224','孙广进','20170070','梧州学院','本科','4','2017-04-20','2016','201700202',NULL,4,37,2167),(1109,'201600213225','谭霁航','20170071','梧州学院','本科','4','2017-04-21','2016','201700202',NULL,4,37,2168),(1110,'201600213233','周孔波','20170072','梧州学院','本科','4','2017-04-22','2016','201700202',NULL,4,37,2169),(1111,'201500208337','周华生','20170073','梧州学院','本科','4','2017-04-23','2015','201700202',NULL,4,NULL,2170),(1112,'201500208417','陆月富','20170074','梧州学院','本科','4','2017-04-24','2015','201700202',NULL,4,NULL,2171),(1113,'201500208426','孙亮','20170075','梧州学院','本科','4','2017-04-25','2015','201700202',NULL,4,NULL,2172),(1114,'201500208431','吴煜辉','20170076','梧州学院','本科','4','2017-04-26','2015','201700202',NULL,4,NULL,2173),(1115,'201600208103','邓彬胜','20170077','梧州学院','本科','4','2017-04-27','2016','201700202',NULL,4,32,2174),(1116,'201600208119','容宇轩','20170078','梧州学院','本科','4','2017-04-28','2016','201700202',NULL,4,32,2175),(1117,'201600208123','汪志明','20170079','梧州学院','本科','4','2017-04-29','2016','201700202',NULL,4,32,2176),(1118,'201600208126','温德尊','20170080','梧州学院','本科','4','2017-04-30','2016','201700202',NULL,4,32,2177),(1119,'201600208405','高航涛','20170081','梧州学院','本科','4','2017-05-01','2016','201700202',NULL,4,35,2178),(1120,'201600208416','陆正荣','20170082','梧州学院','本科','4','2017-05-02','2016','201700202',NULL,4,35,2179),(1121,'201600208437','黎艳芳','20170083','梧州学院','本科','4','2017-05-03','2016','201700202',NULL,4,35,2180),(1122,'201600208447','覃丽菊','20170084','梧州学院','本科','4','2017-05-04','2016','201700202',NULL,4,35,2181),(1123,'201600213103','邓祥鸿','20170085','梧州学院','本科','4','2017-05-05','2016','201700202',NULL,4,36,2182),(1124,'201600213107','郭天千','20170086','梧州学院','本科','4','2017-05-06','2016','201700202',NULL,4,36,2183),(1125,'201600213109','黄源松','20170087','梧州学院','本科','4','2017-05-07','2016','201700202',NULL,4,36,2184),(1126,'201600213123','秦曼人','20170088','梧州学院','本科','4','2017-05-08','2016','201700202',NULL,4,36,2185),(1127,'201600213130','谢惟朋','20170089','梧州学院','本科','4','2017-05-09','2016','201700202',NULL,4,36,2186),(1128,'201600213136','甘丽','20170090','梧州学院','本科','4','2017-05-10','2016','201700202',NULL,4,36,2187),(1129,'201600213137','何柳花','20170091','梧州学院','本科','4','2017-05-11','2016','201700202',NULL,4,36,2188),(1130,'201600213150','韦燕琳','20170092','梧州学院','本科','4','2017-05-12','2016','201700202',NULL,4,36,2189),(1131,'201600213230','叶炜','20170093','梧州学院','本科','4','2017-05-13','2016','201700202',NULL,4,37,2190),(1132,'201600213235','陈贵连','20170094','梧州学院','本科','4','2017-05-14','2016','201700202',NULL,4,37,2191),(1133,'201600213244','廖小兰','20170095','梧州学院','本科','4','2017-05-15','2016','201700202',NULL,4,37,2192),(1134,'201600213247','莫佩凤','20170096','梧州学院','本科','4','2017-05-16','2016','201700202',NULL,4,37,2193),(1135,'201600213254','赵春艳','20170097','梧州学院','本科','4','2017-05-17','2016','201700202',NULL,4,37,2194),(1136,'201600213255','钟佳萍','20170098','梧州学院','本科','4','2017-05-18','2016','201700202',NULL,4,37,2195),(1137,'201500208103','陈石新','20170099','梧州学院','本科','4','2017-05-19','2015','201700202',NULL,4,NULL,2196),(1138,'201500208311','黄荣春','20170100','梧州学院','本科','4','2017-05-20','2015','201700202',NULL,4,NULL,2197),(1139,'201500208312','黄英强','20170101','梧州学院','本科','4','2017-05-21','2015','201700202',NULL,4,NULL,2198),(1140,'201500208316','李权治','20170102','梧州学院','本科','4','2017-05-22','2015','201700202',NULL,4,NULL,2199),(1141,'201600208131','周雯才','20170104','梧州学院','本科','4','2017-05-23','2016','201700202',NULL,4,32,2200),(1142,'201600208138','李碧静','20170105','梧州学院','本科','4','2017-05-24','2016','201700202',NULL,4,32,2201),(1143,'201600208142','谭月莲','20170106','梧州学院','本科','4','2017-05-25','2016','201700202',NULL,4,32,2202),(1144,'201600208143','王娜','20170107','梧州学院','本科','4','2017-05-26','2016','201700202',NULL,4,32,2203),(1145,'201600208149','张楠','20170108','梧州学院','本科','4','2017-05-27','2016','201700202',NULL,4,32,2204),(1146,'201600208150','张旺珍','20170109','梧州学院','本科','4','2017-05-28','2016','201700202',NULL,4,32,2205),(1147,'201600208151','周丽鲜','20170110','梧州学院','本科','4','2017-05-29','2016','201700202',NULL,4,32,2206),(1148,'201600208212','刘清旭','20170111','梧州学院','本科','4','2017-05-30','2016','201700202',NULL,4,33,2207),(1149,'201600208225','孙艺','20170112','梧州学院','本科','4','2017-05-31','2016','201700202',NULL,4,33,2208),(1150,'201600208231‘','叶城廷','20170113','梧州学院','本科','4','2017-06-01','2016','201700202',NULL,4,33,2209),(1151,'201600208239’','廖梦青','20170114','梧州学院','本科','4','2017-06-02','2016','201700202',NULL,4,33,2210),(1152,'201600208315','刘春福','20170115','梧州学院','本科','4','2017-06-03','2016','201700202',NULL,4,34,2211),(1153,'201600208334','陈宣媛','20170116','梧州学院','本科','4','2017-06-04','2016','201700202',NULL,4,34,2212),(1154,'201600208338','孔丽玲','20170117','梧州学院','本科','4','2017-06-05','2016','201700202',NULL,4,34,2213),(1155,'201600208343','刘禹含','20170118','梧州学院','本科','4','2017-06-06','2016','201700202',NULL,4,34,2214),(1156,'201600208346','覃荔靖','20170119','梧州学院','本科','4','2017-06-07','2016','201700202',NULL,4,34,2215),(1157,'201600208348','王菁颖','20170120','梧州学院','本科','4','2017-06-08','2016','201700202',NULL,4,34,2216),(1158,'201600208417','莫东林','20170121','梧州学院','本科','4','2017-06-09','2016','201700202',NULL,4,35,2217),(1159,'201600208444','商文鑫','20170122','梧州学院','本科','4','2017-06-10','2016','201700202',NULL,4,35,2218),(1160,'201600208446','谈茵茵','20170123','梧州学院','本科','4','2017-06-11','2016','201700202',NULL,4,35,2219),(1161,'201600213140','李桂兰','20170124','梧州学院','本科','4','2017-06-12','2016','201700202',NULL,4,36,2220),(1162,'201600213151','魏钰','20170125','梧州学院','本科','4','2017-06-13','2016','201700202',NULL,4,36,2221),(1163,'201600213152','肖雨君','20170126','梧州学院','本科','4','2017-06-14','2016','201700202',NULL,4,36,2222),(1164,'201500213105','何鹏程','20170127','梧州学院','本科','4','2017-06-15','2015','201700202',NULL,4,NULL,2223),(1165,'201500213116','唐昌钰','20170128','梧州学院','本科','4','2017-06-16','2015','201700202',NULL,4,NULL,2224),(1166,'201500213117','唐立','20170129','梧州学院','本科','4','2017-06-17','2015','201700202',NULL,4,NULL,2225),(1167,'201500213126','钟明城','20170130','梧州学院','本科','4','2017-06-18','2015','201700202',NULL,4,NULL,2226),(1168,'201600208110','李明清','20170131','梧州学院','本科','4','2017-06-19','2016','201700202',NULL,4,32,2227),(1169,'201600208116','陆鹏祥','20170132','梧州学院','本科','4','2017-06-20','2016','201700202',NULL,4,32,2228),(1170,'201600208117','陆镇峰','20170133','梧州学院','本科','4','2017-06-21','2016','201700202',NULL,4,32,2229),(1171,'201600208137','黎军君','20170134','梧州学院','本科','4','2017-06-22','2016','201700202',NULL,4,32,2230),(1172,'201600208144','王研','20170135','梧州学院','本科','4','2017-06-23','2016','201700202',NULL,4,32,2231),(1173,'201600208238','梁容','20170136','梧州学院','本科','4','2017-06-24','2016','201700202',NULL,4,33,2232),(1174,'201600208240’','林远秋','20170137','梧州学院','本科','4','2017-06-25','2016','201700202',NULL,4,33,2233),(1175,'201500208307','郭家欣','20170138','梧州学院','本科','4','2017-06-26','2016','201700202',NULL,4,34,2234),(1176,'201500208410','廖家鹏','20170139','梧州学院','本科','4','2017-06-27','2016','201700202',NULL,4,34,2235),(1177,'201600208303','陈天艺','20170140','梧州学院','本科','4','2017-06-28','2016','201700202',NULL,4,34,2236),(1178,'201600208304','丁程强','20170141','梧州学院','本科','4','2017-06-29','2016','201700202',NULL,4,34,2237),(1179,'201600208305','董思源','20170142','梧州学院','本科','4','2017-06-30','2016','201700202',NULL,4,34,2238),(1180,'201600208308','黄庆港','20170143','梧州学院','本科','4','2017-07-01','2016','201700202',NULL,4,34,2239),(1181,'201600208310','黄祖彬','20170144','梧州学院','本科','4','2017-07-02','2016','201700202',NULL,4,34,2240),(1182,'201600208322','覃悦','20170145','梧州学院','本科','4','2017-07-03','2016','201700202',NULL,4,34,2241),(1183,'201600208328','叶国标','20170146','梧州学院','本科','4','2017-07-04','2016','201700202',NULL,4,34,2242),(1184,'201600208337','方丽萍','20170147','梧州学院','本科','4','2017-07-05','2016','201700202',NULL,4,34,2243),(1185,'201600208342','刘丽蓉','20170148','梧州学院','本科','4','2017-07-06','2016','201700202',NULL,4,34,2244),(1186,'201600208347','唐纤蓥','20170149','梧州学院','本科','4','2017-07-07','2016','201700202',NULL,4,34,2245),(1187,'201600213222','苏三明','20170150','梧州学院','本科','4','2017-07-08','2016','201700202',NULL,4,37,2246),(1188,'201600213226','韦冠宇','20170151','梧州学院','本科','4','2017-07-09','2016','201700202',NULL,4,37,2247),(1189,'201600213228','吴尚彬','20170152','梧州学院','本科','4','2017-07-10','2016','201700202',NULL,4,37,2248),(1190,'201600213229','严荣','20170153','梧州学院','本科','4','2017-07-11','2016','201700202',NULL,4,37,2249),(1191,'201500208113','梁鹏飞','20170154','梧州学院','本科','4','2017-07-12','2015','201700202',NULL,4,NULL,2250),(1192,'201500208127','王玉华','20170155','梧州学院','本科','4','2017-07-13','2015','201700202',NULL,4,NULL,2251),(1193,'201500208428','王嘉雯','20170156','梧州学院','本科','4','2017-07-14','2015','201700202',NULL,4,NULL,2252),(1194,'201600208129','羊腾强','20170157','梧州学院','本科','4','2017-07-15','2016','201700202',NULL,4,32,2253),(1195,'201400213017','莫冠华','20170158','梧州学院','本科','4','2017-07-16','2014','201700202',NULL,4,25,2254),(1196,'201400213014','霍胜权','20170159','梧州学院','本科','4','2017-07-17','2014','201700202',NULL,4,25,2255),(1197,'201400208223','谢云','20170160','梧州学院','本科','4','2017-07-18','2014','201700202',8,4,23,2256);
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
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_teacher`
--

LOCK TABLES `sys_teacher` WRITE;
/*!40000 ALTER TABLE `sys_teacher` DISABLE KEYS */;
INSERT INTO `sys_teacher` VALUES (201,'admin','admin','201700201',NULL,NULL,213,'24',772),(432,'18074','龚红梅','201700202',NULL,NULL,NULL,NULL,1886),(433,'17005','吴燕端','201700202',NULL,NULL,NULL,NULL,1887),(434,'30008','刘树先','201700202',NULL,NULL,NULL,NULL,1888),(435,'17702','邵晋芳','201700202',NULL,NULL,NULL,NULL,1889),(436,'17703','蔡敏仪','201700202',NULL,NULL,NULL,NULL,1890),(437,'17704','曾雨珊','201700202',NULL,NULL,NULL,NULL,1891),(438,'17049','汪梅','201700202',10,13,NULL,NULL,1892),(439,'17020','李健','201700202',10,13,NULL,NULL,1893),(440,'17011','陈佳','201700202',10,13,NULL,NULL,1894),(441,'17022','黄洁明','201700202',10,13,NULL,NULL,1895),(442,'27013','梁朝湘','201700202',10,13,NULL,NULL,1896),(443,'17064','吴芳','201700202',10,13,NULL,NULL,1897),(444,'17018','代丽娴','201700202',3,6,NULL,NULL,1898),(445,'07003','黄宏本','201700202',3,6,NULL,NULL,1899),(446,'17037','梁菁','201700202',3,6,NULL,NULL,1900),(447,'31047','李宗妮','201700202',3,6,NULL,NULL,1901),(448,'17202','农健','201700202',3,6,NULL,NULL,1902),(449,'17132','卿海军','201700202',3,6,NULL,NULL,1903),(450,'17039','陈聪','201700202',3,6,NULL,NULL,1904),(451,'17038','卢雪燕','201700202',3,6,NULL,NULL,1905),(452,'17133','黄寄洪','201700202',3,6,NULL,NULL,1906),(453,'17213','郑明','201700202',3,6,NULL,NULL,1907),(454,'31046','何希','201700202',8,4,213,'22',1908),(455,'17041','莫智懿','201700202',8,4,216,'00',1909),(456,'17025','吴炎桃','201700202',8,4,NULL,NULL,1910),(457,'17221','陈悦','201700202',8,4,212,'00',1911),(458,'17134','冀肖榆','201700202',8,4,NULL,NULL,1912),(459,'27105','许传本','201700202',8,4,212,'00',1913),(460,'17224','朱肖颖','201700202',8,4,NULL,NULL,1914),(461,'17074','庞光垚','201700202',8,4,NULL,NULL,1915),(462,'17701','蒲保兴','201700202',8,4,NULL,NULL,1916),(463,'21016','覃学文','201700202',7,9,NULL,NULL,1917),(464,'30011','赵春茹','201700202',7,9,NULL,NULL,1918),(465,'21022','覃桂茳','201700202',7,9,NULL,NULL,1919),(466,'21011','刘敏捷','201700202',7,9,NULL,NULL,1920),(467,'21054','杨甲山','201700202',7,9,NULL,NULL,1921),(468,'21012','黄劲','201700202',7,9,NULL,NULL,1922),(469,'28009','胡庆席','201700202',7,9,NULL,NULL,1923),(470,'21005','李连芬','201700202',7,9,NULL,NULL,1924),(471,'21014','石向东','201700202',7,9,NULL,NULL,1925),(472,'30013','涂井先','201700202',7,9,NULL,NULL,1926),(473,'06003','陈红','201700202',7,9,NULL,NULL,1927),(474,'21018','李志军','201700202',7,9,NULL,NULL,1928),(475,'21017','许成章','201700202',7,9,NULL,NULL,1929),(476,'23098','吴飞燕','201700202',10,13,NULL,NULL,1930),(477,'17010','贺杰','201700202',10,13,NULL,NULL,1931),(478,'17044','宫海晓','201700202',10,13,NULL,NULL,1932),(479,'17062','邸臻炜','201700202',10,13,NULL,NULL,1933),(480,'17031','李翊','201700202',10,13,NULL,NULL,1934),(481,'17033','黄筱佟','201700202',10,13,NULL,NULL,1935),(482,'17214','杨秋慧','201700202',10,13,NULL,NULL,1936),(483,'17046','何高明','201700202',4,5,NULL,NULL,1937),(484,'17027','蒋琳琼','201700202',4,5,NULL,NULL,1938),(485,'17019','李海英','201700202',4,5,NULL,NULL,1939),(486,'17021','李军','201700202',4,5,NULL,NULL,1940),(487,'21010','苏芳','201700202',10,11,NULL,NULL,1941),(488,'21019','赵贤','201700202',10,11,NULL,NULL,1942);
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
INSERT INTO `task_book` VALUES (8,'<p><span style=\"font-family: SimSun;\">本课题以广西梧州食品药品检验所报告书系统项目为背景，根据广西梧州药检所样品检验流程，按照软件工程的规范，设计一个满足实际业务要求的检验报告系统，从而实现业务科与实验室协同工作以及检品过程监督，具体内容要求如下：</span></p><p>1、&nbsp;<span style=\"font-family: SimSun;\">查阅实验室信息管理系统(LIMS)相关文献资料，了解相关技术。</span></p><p>2、&nbsp;<span style=\"font-family: SimSun;\">在毕业设计周期内，定期实地调研相关单位的实际需求。</span></p><p>3、&nbsp;<span style=\"font-family: SimSun;\">整理系统的需求并形成技术解决方案；</span></p><p>4、&nbsp;<span style=\"font-family: SimSun;\">根据需求规格文档开展系统功能设计与实现；</span></p><p>5、&nbsp;<span style=\"font-family: SimSun;\">按梧州学院毕业论文格式撰写毕业论文；</span></p><p><br/></p>','<p><span style=\"font-family: SimSun;\">1、第一阶段：查阅资料，了解梧州食品药品检验所对样品检测的相关政策文件，了解国内外相关的食品药品检测现状。</span></p><p><span style=\";font-family:SimSun;font-size:16px\">2、第二阶段：应用第一阶段收集和整理的资料，并着手进行需求分析。</span></p><p><span style=\";font-family:SimSun;font-size:16px\">3、第三阶段：完成系统设计、编码与测试。</span></p><p><span style=\";font-family:SimSun;font-size:16px\">4、第四阶段：根据以上三个阶段完成的任务和积累的相关文档草拟论文提纲并提交指导老师审阅。</span></p><p><span style=\";font-family:SimSun;font-size:16px\">5、第五阶段：撰写毕业论文并提交指导老师审阅。</span></p><p><span style=\";font-family:SimSun;font-size:16px\">6、第六阶段：答辩、再次整理论文和作品相关资料、归档和提交指导老师。</span></p><p><br/></p>','<p><span style=\"font-family: SimSun; line-height: 125%;\">[1] 黄宝斌,许明哲,董中平等.药品检验业务流程效率研究概述[J].中国药事.2016,</span><span style=\"font-size: 14px;\">&nbsp;</span><span style=\"font-family: SimSun; line-height: 125%;\">(12):1204-1208.</span><br/></p><p style=\"line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">[2]张华,周中木,杨雪梅.食品药品检验实验室LIMS的设计与实现[J].计量与测试技术,2015,(11):22-23.</span></p><p style=\"line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">[3]林伟强.广东省药品检验所LIMS应用[J].今日药学,2008,(04):88-90.</span></p><p style=\"line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">[4]杨春福.药厂质量检验信息管理系统的设计与实现[D].山东大学,2013.</span></p><p style=\"line-height: 125%;\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">[5]李胜君.食品检测信息管理系统的设计与实现[D].吉林大学,2012</span><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">.</span></p>',1197,455,2019),(9,'<p style=\"text-indent:32px\"><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">本课题要求从目前贵港市港北区项目建设的现状出发，按照软件工程的规范，设计并开发出一款基于</span>android<span style=\"font-family:SimSun\">移动应用终端的</span><span style=\"font-family:SimSun\">港北区项目建设协同数据平台，</span><span style=\"font-family:SimSun\">主要内容如下：</span></span></p><p style=\"text-indent:32px\"><span style=\"font-family:SimSun;font-size:16px\">1、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">实地调研贵港市港北区目前项目管理中存在的问题；</span></span></p><p style=\"text-indent:32px\"><span style=\"font-family:SimSun;font-size:16px\">2、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">通过查阅相关文献资料和项目管理资料确定项目管理的整体设计目标和方案；</span></span></p><p style=\"text-indent:32px\"><span style=\"font-family:SimSun;font-size:16px\">3、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">确定设计该系统中涉及的项目管理方式和项目沟通方式，并采用移动应用终端与</span>PC<span style=\"font-family:SimSun\">端相结合的方式实现。</span></span></p><p style=\"text-indent:32px\"><span style=\"font-family:SimSun;font-size:16px\">4、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">需充分考虑项目管理的便利性和实时性；</span></span></p><p style=\"text-indent:32px\"><span style=\"font-family:SimSun;font-size:16px\">5、</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">积累设计过程文档，并按软件过程方式撰写毕业论文。</span></span></p><p><br/></p>','<p style=\"text-indent:32px\"><span style=\";font-family:SimSun;font-size:16px\">1.<span style=\"font-family:SimSun\">第一阶段：实地调研并查阅相关资料，了解目前港北区项目管理的困局，了解国内外相关的城市地区项目管理的方式和方法，并结合港北区项目管理的特点确定设计方案。</span></span></p><p style=\"text-indent:28px\"><span style=\";font-family:SimSun;font-size:16px\">2.<span style=\"font-family:SimSun\">第二阶段：收集港北区项目管理的相关表格、材料、政策文件、访谈内容确定整体设计目标和项目中具体设计模块，并使得该项目具备通用性。</span></span></p><p style=\"text-indent:32px\"><span style=\"font-family:SimSun;font-size:16px\">3.</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">第三阶段：平台功能设计，设计过程中注意与港北区沟通，充分考虑软件的通用性、便利性和实时性。</span></span></p><p style=\"text-indent:32px\"><span style=\"font-family:SimSun;font-size:16px\">4.</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">第四阶段：完成系统设计，并梳理设计过程中的相关阶段文档。</span></span></p><p style=\"text-indent:32px\"><span style=\"font-family:SimSun;font-size:16px\">5.</span><span style=\";font-family:SimSun;font-size:16px\"><span style=\"font-family:SimSun\">第五阶段：提交实地试运行并撰写论文、审阅和定稿。</span></span></p><p><br/></p>','<p><span style=\"font-family: SimSun;\">[1]</span><span style=\"font-family: SimSun;\">方国华</span><span style=\"font-family: SimSun;\">.</span><span style=\"font-family: SimSun;\">基于</span><span style=\"font-family: SimSun;\">Web</span><span style=\"font-family: SimSun;\">的工程项目管理系统的开发</span><span style=\"font-family: SimSun;\">[J]. </span><span style=\"font-family: SimSun;\">农业网络信息</span><span style=\"font-family: SimSun;\">,2010,(03):28-30+36</span><br/></p><p><span style=\";font-family:SimSun;font-size:16px\">[2]<span style=\"font-family:SimSun\">郭建海</span><span style=\"font-family:SimSun\">.</span><span style=\"font-family:SimSun\">浅析信息化的项目管理系统研究与实现</span><span style=\"font-family:SimSun\">[J]. </span><span style=\"font-family:SimSun\">数字技术与应用</span><span style=\"font-family:SimSun\">,2011,(08):118-119.</span></span></p><p><span style=\";font-family:SimSun;font-size:16px\">[3]<span style=\"font-family:SimSun\">周正文</span><span style=\"font-family:SimSun\">,</span><span style=\"font-family:SimSun\">曾慧</span><span style=\"font-family:SimSun\">. </span><span style=\"font-family:SimSun\">协同产品开发项目管理系统与产品生命周期管理系统的集成研究</span><span style=\"font-family:SimSun\">[J]. </span><span style=\"font-family:SimSun\">中国管理信息化</span><span style=\"font-family:SimSun\">,2014,17(24):40-43. [2017-09-14]. </span></span></p><p><span style=\";font-family:SimSun;font-size:16px\">[4]<span style=\"font-family:SimSun\">单明</span><span style=\"font-family:SimSun\">. </span><span style=\"font-family:SimSun\">基于</span><span style=\"font-family:SimSun\">J2EE</span><span style=\"font-family:SimSun\">的项目管理系统设计与实现</span><span style=\"font-family:SimSun\">[D].</span><span style=\"font-family:SimSun\">山东大学</span><span style=\"font-family:SimSun\">,2009.</span></span></p><p><span style=\";font-family:SimSun;font-size:16px\">[5]<span style=\"font-family:SimSun\">郑晓北</span><span style=\"font-family:SimSun\">.</span><span style=\"font-family:SimSun\">基于</span><span style=\"font-family:SimSun\">J2EE</span><span style=\"font-family:SimSun\">的企业项目管理系统的设计与实现</span><span style=\"font-family:SimSun\">[D].</span><span style=\"font-family:SimSun\">电子科技大学</span><span style=\"font-family:SimSun\">,2013.</span></span></p><p><span style=\";font-family:SimSun;font-size:16px\">[6]<span style=\"font-family:SimSun\">林一冰</span><span style=\"font-family:SimSun\">. </span><span style=\"font-family:SimSun\">基于移动终端的项目管理系统的研究与实现</span><span style=\"font-family:SimSun\">[D].</span><span style=\"font-family:SimSun\">华南理工大学</span><span style=\"font-family:SimSun\">,2014.</span></span></p><p><span style=\";font-family:SimSun;font-size:16px\">&nbsp;</span></p><p><span style=\";font-family:SimSun;font-size:16px\">[7]<span style=\"font-family:SimSun\">孙健</span><span style=\"font-family:SimSun\">. </span><span style=\"font-family:SimSun\">项目管理系统的设计与实现</span><span style=\"font-family:SimSun\">[D].</span><span style=\"font-family:SimSun\">吉林大学</span><span style=\"font-family:SimSun\">,2013.</span></span></p><p style=\"line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">[8]<span style=\"font-family:SimSun\">李刚</span><span style=\"font-family:SimSun\">.</span><span style=\"font-family:SimSun\">疯狂</span><span style=\"font-family:SimSun\">Java</span><span style=\"font-family:SimSun\">讲义</span><span style=\"font-family:SimSun\">[M].</span><span style=\"font-family:SimSun\">电子工业出版社</span><span style=\"font-family:SimSun\">.2012.12.</span></span></p><p style=\"line-height:125%\"><span style=\";font-family:SimSun;line-height:125%;font-size:16px\">[9]<span style=\"font-family:SimSun\">李刚</span><span style=\"font-family:SimSun\">.</span><span style=\"font-family:SimSun\">轻量级</span><span style=\"font-family:SimSun\">Java EE </span><span style=\"font-family:SimSun\">企业应用实战</span><span style=\"font-family:SimSun\">Spring+Struts2+Hibernate</span><span style=\"font-family:SimSun\">整合开发</span><span style=\"font-family:SimSun\">[M].</span><span style=\"font-family:SimSun\">电子工业出版社</span><span style=\"font-family:SimSun\">.2010.12. </span></span></p><p><span style=\";font-family:SimSun;font-size:16px\">&nbsp;</span></p><p><span style=\";font-family:SimSun;font-size:16px\">[10]<span style=\"font-family:SimSun\">张永诺</span><span style=\"font-family:SimSun\">,</span><span style=\"font-family:SimSun\">孙华</span><span style=\"font-family:SimSun\">,</span><span style=\"font-family:SimSun\">孙子恒</span><span style=\"font-family:SimSun\">. </span><span style=\"font-family:SimSun\">移动</span><span style=\"font-family:SimSun\">APP</span><span style=\"font-family:SimSun\">的应用与发展</span><span style=\"font-family:SimSun\">[J/OL]. </span><span style=\"font-family:SimSun\">电脑知识与技术</span><span style=\"font-family:SimSun\">,2016,(02):86-87.</span></span></p><p><span style=\";font-family:SimSun;font-size:16px\">[11]Radu Vasile Pascu,Radu Adrian Ciora,Lucian Lobonţ,Carmen Mihaela Simion. Developing A Decision Support System For Project Management In Universities[J]. Balkan Region Conference on Engineering and Business Education,2014,1(1):.</span></p><p><span style=\";font-family:SimSun;font-size:16px\"><br/></span></p><p><br/></p>',1190,455,2019);
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
INSERT INTO `teacher_directions` VALUES (9,1,455,2019),(10,5,454,2019),(11,1,459,2019),(12,1,457,2019);
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
INSERT INTO `teacher_major` VALUES (8,455,4,2019),(9,454,4,2019),(10,459,4,2019),(11,457,4,2019);
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
) ENGINE=InnoDB AUTO_INCREMENT=2257 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hlep`
--

LOCK TABLES `user_hlep` WRITE;
/*!40000 ALTER TABLE `user_hlep` DISABLE KEYS */;
INSERT INTO `user_hlep` VALUES (772,'admin','admin','admin','3','2017-09-30 11:31:23',NULL,'1','12','13507749831','11547830091@qq.com','/attached/userImg/FA29E1F9-CB79-4D39-A365-7CC0F151D52B_04 (1).jpg'),(1886,'龚红梅','18074','18074','2','2019-11-13 11:25:18',NULL,'1','',NULL,NULL,NULL),(1887,'吴燕端','17005','17005','2','2019-11-13 11:25:18',NULL,'1','',NULL,NULL,NULL),(1888,'刘树先','30008','30008','2','2019-11-13 11:25:18',NULL,'0','',NULL,NULL,NULL),(1889,'邵晋芳','17702','17702','2','2019-11-13 11:25:18',NULL,'1','',NULL,NULL,NULL),(1890,'蔡敏仪','17703','17703','2','2019-11-13 11:25:18',NULL,'1','',NULL,NULL,NULL),(1891,'曾雨珊','17704','17704','2','2019-11-13 11:25:18',NULL,'1','',NULL,NULL,NULL),(1892,'汪梅','17049','17049','2','2019-11-13 11:25:18',NULL,'1','',NULL,NULL,NULL),(1893,'李健','17020','17020','2','2019-11-13 11:25:18',NULL,'0','',NULL,NULL,NULL),(1894,'陈佳','17011','17011','2','2019-11-13 11:25:18',NULL,'1','',NULL,NULL,NULL),(1895,'黄洁明','17022','17022','2','2019-11-13 11:25:18',NULL,'0','',NULL,NULL,NULL),(1896,'梁朝湘','27013','27013','2','2019-11-13 11:25:18',NULL,'0','',NULL,NULL,NULL),(1897,'吴芳','17064','17064','2','2019-11-13 11:25:18',NULL,'1','',NULL,NULL,NULL),(1898,'代丽娴','17018','17018','2','2019-11-13 11:25:18',NULL,'1','',NULL,NULL,NULL),(1899,'黄宏本','07003','07003','2','2019-11-13 11:25:18',NULL,'0','',NULL,NULL,NULL),(1900,'梁菁','17037','17037','2','2019-11-13 11:25:19',NULL,'1','',NULL,NULL,NULL),(1901,'李宗妮','31047','31047','2','2019-11-13 11:25:19',NULL,'1','',NULL,NULL,NULL),(1902,'农健','17202','17202','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1903,'卿海军','17132','17132','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1904,'陈聪','17039','17039','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1905,'卢雪燕','17038','17038','2','2019-11-13 11:25:19',NULL,'1','',NULL,NULL,NULL),(1906,'黄寄洪','17133','17133','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1907,'郑明','17213','17213','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1908,'何希','31046','31046','2','2019-11-13 11:25:19',NULL,'1','','123344444','201600213229',NULL),(1909,'莫智懿','17041','17041','2','2019-11-13 11:25:19',NULL,'1','','17041','1586695284@qq.com','/attached/userImg/2CBCC067-DBC0-45C4-9E72-C5FF00EB9B80_linus.jpg'),(1910,'吴炎桃','17025','17025','2','2019-11-13 11:25:19',NULL,'1','',NULL,NULL,NULL),(1911,'陈悦','17221','17221','2','2019-11-13 11:25:19',NULL,'1','','17221','1586695284@qq.com',NULL),(1912,'冀肖榆','17134','17134','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1913,'许传本','27105','27105','2','2019-11-13 11:25:19',NULL,'1','','27105','1586695284@qq.com',NULL),(1914,'朱肖颖','17224','17224','2','2019-11-13 11:25:19',NULL,'1','',NULL,NULL,NULL),(1915,'庞光垚','17074','17074','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1916,'蒲保兴','17701','17701','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1917,'覃学文','21016','21016','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1918,'赵春茹','30011','30011','2','2019-11-13 11:25:19',NULL,'1','',NULL,NULL,NULL),(1919,'覃桂茳','21022','21022','2','2019-11-13 11:25:19',NULL,'1','',NULL,NULL,NULL),(1920,'刘敏捷','21011','21011','2','2019-11-13 11:25:19',NULL,'1','',NULL,NULL,NULL),(1921,'杨甲山','21054','21054','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1922,'黄劲','21012','21012','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1923,'胡庆席','28009','28009','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1924,'李连芬','21005','21005','2','2019-11-13 11:25:19',NULL,'1','',NULL,NULL,NULL),(1925,'石向东','21014','21014','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1926,'涂井先','30013','30013','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1927,'陈红','06003','06003','2','2019-11-13 11:25:19',NULL,'1','',NULL,NULL,NULL),(1928,'李志军','21018','21018','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1929,'许成章','21017','21017','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1930,'吴飞燕','23098','23098','2','2019-11-13 11:25:19',NULL,'1','',NULL,NULL,NULL),(1931,'贺杰','17010','17010','2','2019-11-13 11:25:19',NULL,'0','',NULL,NULL,NULL),(1932,'宫海晓','17044','17044','2','2019-11-13 11:25:20',NULL,'1','',NULL,NULL,NULL),(1933,'邸臻炜','17062','17062','2','2019-11-13 11:25:20',NULL,'1','',NULL,NULL,NULL),(1934,'李翊','17031','17031','2','2019-11-13 11:25:20',NULL,'1','',NULL,NULL,NULL),(1935,'黄筱佟','17033','17033','2','2019-11-13 11:25:20',NULL,'1','',NULL,NULL,NULL),(1936,'杨秋慧','17214','17214','2','2019-11-13 11:25:20',NULL,'1','',NULL,NULL,NULL),(1937,'何高明','17046','17046','2','2019-11-13 11:25:20',NULL,'0','',NULL,NULL,NULL),(1938,'蒋琳琼','17027','17027','2','2019-11-13 11:25:20',NULL,'1','',NULL,NULL,NULL),(1939,'李海英','17019','17019','2','2019-11-13 11:25:20',NULL,'1','',NULL,NULL,NULL),(1940,'李军','17021','17021','2','2019-11-13 11:25:20',NULL,'0','',NULL,NULL,NULL),(1941,'苏芳','21010','21010','2','2019-11-13 11:25:20',NULL,'1','',NULL,NULL,NULL),(1942,'赵贤','21019','21019','2','2019-11-13 11:25:20',NULL,'1','',NULL,NULL,NULL),(1943,'何盛万','201600208104','201600208104','1',NULL,NULL,'0',NULL,'13025978592','1835284800@qq.com',NULL),(1944,'李苑瑜','201600213141','201600213141','1',NULL,NULL,'0',NULL,'18977460345','850611863@qq.com',NULL),(1945,'陆南梅','201600213142','201600213142','1',NULL,NULL,'0',NULL,'18977418562','1945401687@qq.com',NULL),(1946,'廖克裕','201400213018','201400213018','1',NULL,NULL,'0',NULL,'15177400717','1254567951@qq.com',NULL),(1947,'甘德品','201600213104','201600213104','1',NULL,NULL,'0',NULL,'15277479500','1304899107@qq.com',NULL),(1948,'黄依顺','201600213108','201600213108','1',NULL,NULL,'0',NULL,'13324704970','1770219081@qq.com',NULL),(1949,'李春霖','201600213113','201600213113','1',NULL,NULL,'0',NULL,'13132756595','84345886@qq.com',NULL),(1950,'李宗森','201600213115','201600213115','1',NULL,NULL,'0',NULL,'18277415630','1247502122@qq.com',NULL),(1951,'梁稳','201600213117','201600213117','1',NULL,NULL,'0',NULL,'18377873304','2711127630@qq.com',NULL),(1952,'龙永亮','201600213120','201600213120','1',NULL,NULL,'0',NULL,'18577429460','1436036517@qq.com',NULL),(1953,'卢山盟','201600213122','201600213122','1',NULL,NULL,'0',NULL,'18277418951','2041905095@qq.com',NULL),(1954,'王文滔','201600213126','201600213126','1',NULL,NULL,'0',NULL,'18276410131','584373417@qq.com',NULL),(1955,'周林福','201600213132','201600213132','1',NULL,NULL,'0',NULL,'18775017243','2642951961@qq.com',NULL),(1956,'黄叶英','201600213138','201600213138','1',NULL,NULL,'0',NULL,'18278451613','1592257235@qq.com',NULL),(1957,'黄玉花','201600213139','201600213139','1',NULL,NULL,'0',NULL,'18878463792','2649722558@qq.com',NULL),(1958,'潘丽梅','201600213145','201600213145','1',NULL,NULL,'0',NULL,'18878461912','1844570685@qq.com',NULL),(1959,'唐艳妮','201600213148','201600213148','1',NULL,NULL,'0',NULL,'18269197327','2662954009@qq.com',NULL),(1960,'杨冬雪','201600213153','201600213153','1',NULL,NULL,'0',NULL,'17754583469','18176132473@qq.com',NULL),(1961,'游春兰 ','201600213155','201600213155','1',NULL,NULL,'0',NULL,'18897517253','2731938138@qq.com',NULL),(1962,'马欣廷','201600213215','201600213215','1',NULL,NULL,'0',NULL,'18207702336','115722537632@qq.com',NULL),(1963,'潘辉','201600213218','201600213218','1',NULL,NULL,'0',NULL,'18777843577','1905270669@qq.com',NULL),(1964,'宋楚皓','201600213220','201600213220','1',NULL,NULL,'0',NULL,'15777441585','2728659243@qq.com',NULL),(1965,'黄郁盛','201500208207','201500208207','1',NULL,NULL,'0',NULL,'','',NULL),(1966,'梁家琪','201500208218','201500208218','1',NULL,NULL,'0',NULL,'','',NULL),(1967,'沈嘉伟','201500208230','201500208230','1',NULL,NULL,'0',NULL,'','',NULL),(1968,'覃镜毓','201500208231','201500208231','1',NULL,NULL,'0',NULL,'','',NULL),(1969,'王志','201500208235','201500208235','1',NULL,NULL,'0',NULL,'','',NULL),(1970,'陈胜','20160020820\'1','20160020820\'1','1',NULL,NULL,'0',NULL,'19914987067‘','472010669@qq.com ',NULL),(1971,'杨长官','201600208230','201600208230','1',NULL,NULL,'0',NULL,'13557747691‘','1785868089@qq.com',NULL),(1972,'陈冬霞','201600208233‘','201600208233‘','1',NULL,NULL,'0',NULL,'18978489484‘','1149682393@qq.com',NULL),(1973,'程秀英','201600208234’','201600208234’','1',NULL,NULL,'0',NULL,'15878052273’','2536360208@qq.com',NULL),(1974,'李美琦','201600208236','201600208236','1',NULL,NULL,'0',NULL,'13507896865’','563732137@qq.com',NULL),(1975,'李逸','201600208237‘','201600208237‘','1',NULL,NULL,'0',NULL,'18208408054’','852561735@qq.com',NULL),(1976,'罗贺','201600208241‘','201600208241‘','1',NULL,NULL,'0',NULL,'18589840195’','956104201@qq.com',NULL),(1977,'孙少喜','201600208244’','201600208244’','1',NULL,NULL,'0',NULL,'13217747698/18898233096‘','1006450618@qq.com',NULL),(1978,'李海华','201600208408','201600208408','1',NULL,NULL,'0',NULL,'18376491975','2683794763@qq.com',NULL),(1979,'李善念','201600208409','201600208409','1',NULL,NULL,'0',NULL,'18078067215','2467167242@qq.com',NULL),(1980,'李天赐','201600208410','201600208410','1',NULL,NULL,'0',NULL,'18276407231','1455179754@qq.com',NULL),(1981,'覃威茗','201600208420','201600208420','1',NULL,NULL,'0',NULL,'15577152343','978250779@qq.com',NULL),(1982,'吴思敏','201600208427','201600208427','1',NULL,NULL,'0',NULL,'15077402099','875473947@qq.com',NULL),(1983,'杨健铭','201600208428','201600208428','1',NULL,NULL,'0',NULL,'18707742751','1612134732@qq.com',NULL),(1984,'郑宣贵','201600208430','201600208430','1',NULL,NULL,'0',NULL,'18907803595','1059570456@qq.com',NULL),(1985,'周杰威','201600208431','201600208431','1',NULL,NULL,'0',NULL,'15078168792','1575128896@qq.com',NULL),(1986,'池小媛','201600208435','201600208435','1',NULL,NULL,'0',NULL,'15078165967','1301801654@qq.com',NULL),(1987,'梁海玲','201600208439','201600208439','1',NULL,NULL,'0',NULL,'13457648052','1756350921@qq.com',NULL),(1988,'陈德培','201600213202','201600213202','1',NULL,NULL,'0',NULL,'18894637764','1622418364@qq.com',NULL),(1989,'陈永任','201600213203','201600213203','1',NULL,NULL,'0',NULL,'18176454130','1013184020@qq.com',NULL),(1990,'黄贻通','201600213210','201600213210','1',NULL,NULL,'0',NULL,'18176515068','2515830617@qq.com',NULL),(1991,'苏祖豪','201600213223','201600213223','1',NULL,NULL,'0',NULL,'18177404941','1137544509@qq.com',NULL),(1992,'黄慧君','201500208107','201500208107','1',NULL,NULL,'0',NULL,'','',NULL),(1993,'李睿','201500208317','201500208317','1',NULL,NULL,'0',NULL,'','',NULL),(1994,'梁皓','201500208318','201500208318','1',NULL,NULL,'0',NULL,'','',NULL),(1995,'陆权宁','201500208323','201500208323','1',NULL,NULL,'0',NULL,'','',NULL),(1996,'陈巨洁','201600208101','201600208101','1',NULL,NULL,'0',NULL,'13558240759','1024778645@qq.com',NULL),(1997,'蒋邦雄','201600208106','201600208106','1',NULL,NULL,'0',NULL,'13737370139','2240552076@qq.com',NULL),(1998,'李炳志','201600208108','201600208108','1',NULL,NULL,'0',NULL,'18376477800','1522436861@qq.com',NULL),(1999,'李宏伟','201600208109','201600208109','1',NULL,NULL,'0',NULL,'18587479941','1072204730@qq.com',NULL),(2000,'李杨','201600208112','201600208112','1',NULL,NULL,'0',NULL,'18276409600','961850649@qq.com',NULL),(2001,'李造','201600208113','201600208113','1',NULL,NULL,'0',NULL,'18577447368','1500062778@qq.com',NULL),(2002,'林家健','201600208114','201600208114','1',NULL,NULL,'0',NULL,'15907741682','1207798810@qq.com',NULL),(2003,'凌钦华','201600208115','201600208115','1',NULL,NULL,'0',NULL,'18577433282','1126021564@qq.com',NULL),(2004,'杨夕锋','201600208130','201600208130','1',NULL,NULL,'0',NULL,'18078067815','1453229971@qq.com',NULL),(2005,'曾波','201600208132','201600208132','1',NULL,NULL,'0',NULL,'13649448226','2209077910@qq.com',NULL),(2006,'董有宏','201600208203','201600208203','1',NULL,NULL,'0',NULL,'18577403934‘','577609286@qq.com',NULL),(2007,'蓝福','201600208207','201600208207','1',NULL,NULL,'0',NULL,'14796234245‘','936063161@qq.com',NULL),(2008,'李家荣','201600208209','201600208209','1',NULL,NULL,'0',NULL,'18276438252’','1203759782@qq.com',NULL),(2009,'刘维逸','201600208214','201600208214','1',NULL,NULL,'0',NULL,'15007840451','345618674@qq.com',NULL),(2010,'卢永贵','201600208215','201600208215','1',NULL,NULL,'0',NULL,'18776685317‘','2644049514@qq.com',NULL),(2011,'罗浩铨','201600208216‘','201600208216‘','1',NULL,NULL,'0',NULL,'18577420747’','1072450789@qq.com',NULL),(2012,'慕荣辉','201600208219','201600208219','1',NULL,NULL,'0',NULL,'18977409261’','1106856533@qq.com',NULL),(2013,'杨银燕','201600213154','201600213154','1',NULL,NULL,'0',NULL,'18376952971','18376952971@163.com',NULL),(2014,'黄鸿羲','201600213207','201600213207','1',NULL,NULL,'0',NULL,'18577407985','493798121@qq.com',NULL),(2015,'李汶霖','201600213213','201600213213','1',NULL,NULL,'0',NULL,'15278255913','1542897742@qq.com',NULL),(2016,'莫运平','201600213216','201600213216','1',NULL,NULL,'0',NULL,'18878463755','583311356@qq.com',NULL),(2017,'潘琦','201600213219','201600213219','1',NULL,NULL,'0',NULL,'13277796407','747685879@qq.com',NULL),(2018,'钟将','201600213232','201600213232','1',NULL,NULL,'0',NULL,'13471005219','1349280985@qq.com',NULL),(2019,'张超','201400213045','201400213045','1',NULL,NULL,'0',NULL,'','',NULL),(2020,'董振华','201500208305','201500208305','1',NULL,NULL,'0',NULL,'','',NULL),(2021,'陆宏安','201500208415','201500208415','1',NULL,NULL,'0',NULL,'','',NULL),(2022,'杨吉','201600208147','201600208147','1',NULL,NULL,'0',NULL,'18577423112','1311861142@qq.com',NULL),(2023,'颜阳','201600208229‘','201600208229‘','1',NULL,NULL,'0',NULL,'18277419479‘','1378116617@qq.com',NULL),(2024,'潘杏','201600208242‘','201600208242‘','1',NULL,NULL,'0',NULL,'15677540023‘','1106665834@qq.com',NULL),(2025,'陈春杨','201600208302','201600208302','1',NULL,NULL,'0',NULL,'13026948676','1047492790@qq.com',NULL),(2026,'梁艺耀','201600208313','201600208313','1',NULL,NULL,'0',NULL,'18577406440','1796689433@qq.com',NULL),(2027,'廖富光','201600208314','201600208314','1',NULL,NULL,'0',NULL,'15077518524','1552067371@qq.com',NULL),(2028,'叶子胜','201600208329','201600208329','1',NULL,NULL,'0',NULL,'18775751347','1415451651@qq.com',NULL),(2029,'周家财','201600208332','201600208332','1',NULL,NULL,'0',NULL,'15277331224','2458164829@qq.com',NULL),(2030,'陈紫丽','201600208336','201600208336','1',NULL,NULL,'0',NULL,'18587476974','969209706@qq.com',NULL),(2031,'李静','201600208339','201600208339','1',NULL,NULL,'0',NULL,'18172507886','2679324489@qq.com',NULL),(2032,'唐志晖','201600208424','201600208424','1',NULL,NULL,'0',NULL,'18978303784','11410253@qq.com',NULL),(2033,'杨顺海','201600208429','201600208429','1',NULL,NULL,'0',NULL,'18777427213','1359284798@qq.com',NULL),(2034,'刘玉霜','201600208442','201600208442','1',NULL,NULL,'0',NULL,'18178402371','1016958956@qq.com',NULL),(2035,'张中怡','201600208451','201600208451','1',NULL,NULL,'0',NULL,'13397840545','1144801348@qq.com',NULL),(2036,'陈艳艳','201600213236','201600213236','1',NULL,NULL,'0',NULL,'18377848554','1439148635@qq.com',NULL),(2037,'黄靖舒','201600213237','201600213237','1',NULL,NULL,'0',NULL,'13207741284','1097838588@qq.com',NULL),(2038,'黄柳条','201600213238','201600213238','1',NULL,NULL,'0',NULL,'18207747535','1993553621@qq.com',NULL),(2039,'江锦琦','201600213240','201600213240','1',NULL,NULL,'0',NULL,'15177689773','904407078@qq.com',NULL),(2040,'蓝金董','201600213241','201600213241','1',NULL,NULL,'0',NULL,'17878416736','1946541686@qq.com',NULL),(2041,'吕江','201600213245','201600213245','1',NULL,NULL,'0',NULL,'18707741877','1500411272@qq.com',NULL),(2042,'蒙丹','201600213246','201600213246','1',NULL,NULL,'0',NULL,'18207748401','1501429622@qq.com',NULL),(2043,'覃香群','201600213249','201600213249','1',NULL,NULL,'0',NULL,'18177854694','173608729@qq.com',NULL),(2044,'蔡昌志','201500213101','201500213101','1',NULL,NULL,'0',NULL,'','',NULL),(2045,'董世怡','201500213103','201500213103','1',NULL,NULL,'0',NULL,'','',NULL),(2046,'陶锐','201500213216','201500213216','1',NULL,NULL,'0',NULL,'','',NULL),(2047,'韦汀晏','201500213220','201500213220','1',NULL,NULL,'0',NULL,'','',NULL),(2048,'钟宾','201500213224','201500213224','1',NULL,NULL,'0',NULL,'','',NULL),(2049,'张翠玲','201600208148','201600208148','1',NULL,NULL,'0',NULL,'15507744515','1763062531@qq.com',NULL),(2050,'曹宸玮','201600208401','201600208401','1',NULL,NULL,'0',NULL,'15777445267','2508042890@qq.com',NULL),(2051,'韩鹏程','201600208406','201600208406','1',NULL,NULL,'0',NULL,'18858640815','937764586@qq.com',NULL),(2052,'刘柏池','201600208415','201600208415','1',NULL,NULL,'0',NULL,'15878057103','2013464099@qq.com',NULL),(2053,'阮民涛','201600208419','201600208419','1',NULL,NULL,'0',NULL,'18078060814','464330297@qq.com',NULL),(2054,'唐昊','201600208422','201600208422','1',NULL,NULL,'0',NULL,'18587472744','1148132975qq.com',NULL),(2055,'唐奕明','201600208423','201600208423','1',NULL,NULL,'0',NULL,'17878419207','270400250@qq.com',NULL),(2056,'韦永共','201600208425','201600208425','1',NULL,NULL,'0',NULL,'17707747546','2595665747qq.com',NULL),(2057,'丁婉朔','201600208436','201600208436','1',NULL,NULL,'0',NULL,'18278089517','2585425748@qq.com',NULL),(2058,'刘家倩','201600208441','201600208441','1',NULL,NULL,'0',NULL,'18777433789','2671003446@qq.com',NULL),(2059,'陈炳成','201600213101','201600213101','1',NULL,NULL,'0',NULL,'15278206029','2227331987@qq.com',NULL),(2060,'甘范名','201600213105','201600213105','1',NULL,NULL,'0',NULL,'15777444611','329446103@qq.com',NULL),(2061,'雷观昌','201600213111','201600213111','1',NULL,NULL,'0',NULL,'13557045210','1303585253@qq.com',NULL),(2062,'黎峻豪','201600213112','201600213112','1',NULL,NULL,'0',NULL,'13878407759','2428991161@qq.com',NULL),(2063,'刘冠宏','201600213118','201600213118','1',NULL,NULL,'0',NULL,'18277750692','1137241503@qq.com',NULL),(2064,'石宏磊','201600213124','201600213124','1',NULL,NULL,'0',NULL,'18529787572','634618338@qq.com',NULL),(2065,'谭建狄','201600213125','201600213125','1',NULL,NULL,'0',NULL,'18277499277','905076401@qq.com ',NULL),(2066,'韦歌迪','201600213127','201600213127','1',NULL,NULL,'0',NULL,'18775031081','863446895@qq.com',NULL),(2067,'朱华庭','201600213133','201600213133','1',NULL,NULL,'0',NULL,'15778664470','912728452@qq.com',NULL),(2068,'朱首彰','201600213134','201600213134','1',NULL,NULL,'0',NULL,'13347552466','2534670633@qq.com',NULL),(2069,'黄小梅','201600213239','201600213239','1',NULL,NULL,'0',NULL,'18278010804','1713668543@qq.com\n',NULL),(2070,'梁小英','201600213243','201600213243','1',NULL,NULL,'0',NULL,'15078431809','1799939949@qq.com',NULL),(2071,'覃萍','201600213248','201600213248','1',NULL,NULL,'0',NULL,'18176917595','2233897489@qq.com',NULL),(2072,'彭标','201500208123','201500208123','1',NULL,NULL,'0',NULL,'','',NULL),(2073,'韦增武','201500208128','201500208128','1',NULL,NULL,'0',NULL,'','',NULL),(2074,'闻丽媛','201500208129','201500208129','1',NULL,NULL,'0',NULL,'','',NULL),(2075,'傅宇华','201500208204','201500208204','1',NULL,NULL,'0',NULL,'','',NULL),(2076,'黄智中','201600208105','201600208105','1',NULL,NULL,'0',NULL,'18977055230','2367358345@qq.com',NULL),(2077,'潘宸','201600208118','201600208118','1',NULL,NULL,'0',NULL,'13877342926','1061656887@qq.com',NULL),(2078,'沈喜龙','201600208120','201600208120','1',NULL,NULL,'0',NULL,'15777406765','1158974225@qq.com',NULL),(2079,'司开元','201600208121','201600208121','1',NULL,NULL,'0',NULL,'18377457520','2393599234@qq.com',NULL),(2080,'王梓能','201600208124','201600208124','1',NULL,NULL,'0',NULL,'15188180515','1825178723@qq.com',NULL),(2081,'谢常繁','201600208128','201600208128','1',NULL,NULL,'0',NULL,'18587483684','739748823@qq.com',NULL),(2082,'黄滢','201600208135','201600208135','1',NULL,NULL,'0',NULL,'19976304091','961258946@qq.com',NULL),(2083,'蒋玉蓉','201600208136','201600208136','1',NULL,NULL,'0',NULL,'15331674002','2338664557@qq.com',NULL),(2084,'温晓怡','201600208145','201600208145','1',NULL,NULL,'0',NULL,'18577409465','1164037257@qq.com',NULL),(2085,'李锋','201600208208‘','201600208208‘','1',NULL,NULL,'0',NULL,'15878814272‘','48239446@qq.com',NULL),(2086,'王惠','201600208246’','201600208246’','1',NULL,NULL,'0',NULL,'18707799‘780','2015045336@qq.com',NULL),(2087,'张露丹','201600208249','201600208249','1',NULL,NULL,'0',NULL,'18579886479’','1972215027@qq.com',NULL),(2088,'曾小婷','201600208251','201600208251','1',NULL,NULL,'0',NULL,'13117749210’','1519107459@qq.com',NULL),(2089,'黄启东','201600208307','201600208307','1',NULL,NULL,'0',NULL,'18278959303','huangqidong2013@126.com',NULL),(2090,'阮春彪','201600208321','201600208321','1',NULL,NULL,'0',NULL,'15277916263','3096148788@qq.com',NULL),(2091,'盘美英','201600208345','201600208345','1',NULL,NULL,'0',NULL,'18589844025','1937599815qq.com',NULL),(2092,'范书豪','201600208404','201600208404','1',NULL,NULL,'0',NULL,'18407740954','873851622@qq.com',NULL),(2093,'廖树杰','201600208413','201600208413','1',NULL,NULL,'0',NULL,'13977013721','824709264@qq.com',NULL),(2094,'凌朝政','201600208414','201600208414','1',NULL,NULL,'0',NULL,'18878522710','331551083@qq.com',NULL),(2095,'潘登','201600208418','201600208418','1',NULL,NULL,'0',NULL,'13152672858','906332830@qq.com',NULL),(2096,'梁静华','201600208440','201600208440','1',NULL,NULL,'0',NULL,'18775042758','897860418@qq.com',NULL),(2097,'吴映辉','201600213128','201600213128','1',NULL,NULL,'0',NULL,'13977419796','2485167587@qq.com',NULL),(2098,'吴光辉','201600213227','201600213227','1',NULL,NULL,'0',NULL,'18377425309','1161699226@qq.com',NULL),(2099,'罗定友','201500208324','201500208324','1',NULL,NULL,'0',NULL,'','',NULL),(2100,'蒙伟森','201500208325','201500208325','1',NULL,NULL,'0',NULL,'','',NULL),(2101,'叶展鹏','201500208333','201500208333','1',NULL,NULL,'0',NULL,'','',NULL),(2102,'吴丹茗','201600208146','201600208146','1',NULL,NULL,'0',NULL,'19976304147','1402131129@qq.com',NULL),(2103,'刘上剑','201600208213','201600208213','1',NULL,NULL,'0',NULL,'18269446621’','863707090@qq.com',NULL),(2104,'庞桂花','201600208243','201600208243','1',NULL,NULL,'0',NULL,'19977264583','1612743874@qq.com',NULL),(2105,'朱美林','201600208250‘','201600208250‘','1',NULL,NULL,'0',NULL,'18894684161’','1685581920@qq.com',NULL),(2106,'曹鹏轩','201600208301','201600208301','1',NULL,NULL,'0',NULL,'15777406707','1139912591@qq.com',NULL),(2107,'黄世创','201600208309','201600208309','1',NULL,NULL,'0',NULL,'13457176612','1341630073@qq.com',NULL),(2108,'潘沛杰','201600208318','201600208318','1',NULL,NULL,'0',NULL,'13878454469','979775269@qq.com',NULL),(2109,'张恒','201600208330','201600208330','1',NULL,NULL,'0',NULL,'15777441007','1206366193@qq.com',NULL),(2110,'张积健','201600208331','201600208331','1',NULL,NULL,'0',NULL,'15289533192','1213312702@qq.com',NULL),(2111,'陈怡','201600208335','201600208335','1',NULL,NULL,'0',NULL,'18276419279','534886111@qq.com',NULL),(2112,'刘海帆','201600208340','201600208340','1',NULL,NULL,'0',NULL,'18707743057','1544172087@qq.com',NULL),(2113,'刘嘉嘉','201600208341','201600208341','1',NULL,NULL,'0',NULL,'15777403736','2916207007@qq.com',NULL),(2114,'罗颖玉','201600208344','201600208344','1',NULL,NULL,'0',NULL,'13367750234','1392642892@qq.com',NULL),(2115,'张晓君','201600208350','201600208350','1',NULL,NULL,'0',NULL,'18477403502','1341910139@qq.com',NULL),(2116,'陈震洺','201600208402','201600208402','1',NULL,NULL,'0',NULL,'18307853316','1986323702@qq.com',NULL),(2117,'邓彦松','201600208403','201600208403','1',NULL,NULL,'0',NULL,'13877499357','1940689003@qq.com',NULL),(2118,'梁海超','201600208412','201600208412','1',NULL,NULL,'0',NULL,'13557041170','984631527@qq.com',NULL),(2119,'魏祥','201600208426','201600208426','1',NULL,NULL,'0',NULL,'15878408793','1349239157@qq.com',NULL),(2120,'陈秋梅','201600208433','201600208433','1',NULL,NULL,'0',NULL,'18778719196','1796603504@qq.com',NULL),(2121,'李春梅','201600208438','201600208438','1',NULL,NULL,'0',NULL,'15777481527','3429920932@qq.com',NULL),(2122,'盛晓洁','201600208445','201600208445','1',NULL,NULL,'0',NULL,'15878079739','2635628347@qq.com',NULL),(2123,'韦露沐','201600213250','201600213250','1',NULL,NULL,'0',NULL,'18376487415','1584221714@qq.com',NULL),(2124,'陆兆民','201500208116','201500208116','1',NULL,NULL,'0',NULL,'','',NULL),(2125,'秦文兵','201500208421','201500208421','1',NULL,NULL,'0',NULL,'','',NULL),(2126,'陈龙','201600208102','201600208102','1',NULL,NULL,'0',NULL,'13324881646','1321570719@qq.com',NULL),(2127,'覃一鋆','201600208122','201600208122','1',NULL,NULL,'0',NULL,'18878155095','1017731265@qq.com',NULL),(2128,'和雪英','201600208133','201600208133','1',NULL,NULL,'0',NULL,'13627744623','2104513329@qq.com',NULL),(2129,'黄佩珍','201600208134','201600208134','1',NULL,NULL,'0',NULL,'18587489489','1807896298@qq.com',NULL),(2130,'莫小丽','201600208139','201600208139','1',NULL,NULL,'0',NULL,'15778691237','1439481102@qq.com',NULL),(2131,'欧榕坤','201600208140','201600208140','1',NULL,NULL,'0',NULL,'14795291929','1843216475@qq.com',NULL),(2132,'冉带素','201600208141','201600208141','1',NULL,NULL,'0',NULL,'18579881451','1771018632@qq.com',NULL),(2133,'邓扬殷','201600208202','201600208202','1',NULL,NULL,'0',NULL,'15777409426','407766289@we.com',NULL),(2134,'华孝鹏','201600208206','201600208206','1',NULL,NULL,'0',NULL,'15277416597','1023189105@qq.com',NULL),(2135,'廖桂生','201600208210','201600208210','1',NULL,NULL,'0',NULL,'18277600109','168543250@qq.com',NULL),(2136,'宋玉富','201600208224‘','201600208224‘','1',NULL,NULL,'0',NULL,'18776369093’','1450212241@qq.com',NULL),(2137,'唐民','201600208226','201600208226','1',NULL,NULL,'0',NULL,'15277414512','1009006463@qq.com',NULL),(2138,'周易源','201600208232’','201600208232’','1',NULL,NULL,'0',NULL,'15577579531’','1690409889@.qq.com',NULL),(2139,'赵迪','201500208136','201500208136','1',NULL,NULL,'0',NULL,'15277408983','1143508575@qq.com',NULL),(2140,'李昂','201600208311','201600208311','1',NULL,NULL,'0',NULL,'18587485156','3095582744@qq.com',NULL),(2141,'薛培星','201600208320','201600208320','1',NULL,NULL,'0',NULL,'18278058689','874470881@qq.com',NULL),(2142,'王晗','201600208323','201600208323','1',NULL,NULL,'0',NULL,'15665546587','1557180045@qq.com',NULL),(2143,'谢振威','201600208326','201600208326','1',NULL,NULL,'0',NULL,'15994430005','925323954@qq.com',NULL),(2144,'刘淋逸','201600213119','201600213119','1',NULL,NULL,'0',NULL,'14796063875','1394703577@qq.com',NULL),(2145,'蒙俐宏','201600213144','201600213144','1',NULL,NULL,'0',NULL,'','',NULL),(2146,'黄家理','201600213208','201600213208','1',NULL,NULL,'0',NULL,'15277571323','1359478672@qq.com',NULL),(2147,'雷文浩','201600213211','201600213211','1',NULL,NULL,'0',NULL,'18077511428','993328357@qq.com',NULL),(2148,'李家聪','201600213212','201600213212','1',NULL,NULL,'0',NULL,'18277511930','2195561242@qq.com',NULL),(2149,'黄妹','201601902132','201601902132','1',NULL,NULL,'0',NULL,'13878019439','1332352147@qq.com',NULL),(2150,'骆世嘉','201600208217','201600208217','1',NULL,NULL,'0',NULL,'18177406354‘','1130459793@qq.com',NULL),(2151,'蒙勇飞','201600208218','201600208218','1',NULL,NULL,'0',NULL,'18587678083','1162164202@qq.com',NULL),(2152,'庞彪','201600208221','201600208221','1',NULL,NULL,'0',NULL,'13677849326','741147406@qqcom',NULL),(2153,'司晓硕','201600208223','201600208223','1',NULL,NULL,'0',NULL,'18587480564’','1075662307@qq.com',NULL),(2154,'王洪升','201600208227','201600208227','1',NULL,NULL,'0',NULL,'18077453538’','2502008032@qq.com',NULL),(2155,'吴丽丽','201600208247‘','201600208247‘','1',NULL,NULL,'0',NULL,'18529780941’','1838830412@qq.com',NULL),(2156,'李国严','201600208312','201600208312','1',NULL,NULL,'0',NULL,'18815822941','2645154326@qq.com',NULL),(2157,'陆建宁','201600208316','201600208316','1',NULL,NULL,'0',NULL,'18277407986','2376571392@qq.com',NULL),(2158,'李汉彬','201600213114','201600213114','1',NULL,NULL,'0',NULL,'15778604464','906482416@qq.com',NULL),(2159,'梁林','201600213116','201600213116','1',NULL,NULL,'0',NULL,'18878515030','506457026@qq.com',NULL),(2160,'陈孔妙','201600213135','201600213135','1',NULL,NULL,'0',NULL,'15078121216','2558774873@qq.com',NULL),(2161,'黄安','201600213205','201600213205','1',NULL,NULL,'0',NULL,'13471402595','1109231162@QQ.com',NULL),(2162,'黄鸿庭','201600213206','201600213206','1',NULL,NULL,'0',NULL,'13471402595','1796098468@qq.com',NULL),(2163,'黄培彬','201600213209','201600213209','1',NULL,NULL,'0',NULL,'13471402595','642229776@qq.com',NULL),(2164,'罗明贵','201600213214','201600213214','1',NULL,NULL,'0',NULL,'13471402595','1035465851@qq.com',NULL),(2165,'农建泽','201600213217','201600213217','1',NULL,NULL,'0',NULL,'13471402595','6011658331@qq.com',NULL),(2166,'苏家卫','201600213221','201600213221','1',NULL,NULL,'0',NULL,'13471402595','1732486935@qq.com',NULL),(2167,'孙广进','201600213224','201600213224','1',NULL,NULL,'0',NULL,'13471402595','842936250@qq.com',NULL),(2168,'谭霁航','201600213225','201600213225','1',NULL,NULL,'0',NULL,'18007809821','614203787@qq.com',NULL),(2169,'周孔波','201600213233','201600213233','1',NULL,NULL,'0',NULL,'13471402595','1515964468@qq.com',NULL),(2170,'周华生','201500208337','201500208337','1',NULL,NULL,'0',NULL,'','',NULL),(2171,'陆月富','201500208417','201500208417','1',NULL,NULL,'0',NULL,'','',NULL),(2172,'孙亮','201500208426','201500208426','1',NULL,NULL,'0',NULL,'','',NULL),(2173,'吴煜辉','201500208431','201500208431','1',NULL,NULL,'0',NULL,'','',NULL),(2174,'邓彬胜','201600208103','201600208103','1',NULL,NULL,'0',NULL,'17607748805','1441855393@qq.com',NULL),(2175,'容宇轩','201600208119','201600208119','1',NULL,NULL,'0',NULL,'18579883178','1098385902@qq.com',NULL),(2176,'汪志明','201600208123','201600208123','1',NULL,NULL,'0',NULL,'15877029632','2247786052@qq.com',NULL),(2177,'温德尊','201600208126','201600208126','1',NULL,NULL,'0',NULL,'18174124169','798195570@qq.com',NULL),(2178,'高航涛','201600208405','201600208405','1',NULL,NULL,'0',NULL,'18587484804','40890768@qq.com',NULL),(2179,'陆正荣','201600208416','201600208416','1',NULL,NULL,'0',NULL,'15177066997','1606678391@qq.com',NULL),(2180,'黎艳芳','201600208437','201600208437','1',NULL,NULL,'0',NULL,'18777436573','2366844343@qq.com',NULL),(2181,'覃丽菊','201600208447','201600208447','1',NULL,NULL,'0',NULL,'13877495379','1279173055@qq.com',NULL),(2182,'邓祥鸿','201600213103','201600213103','1',NULL,NULL,'0',NULL,'18276412829','1517497965@qq.com',NULL),(2183,'郭天千','201600213107','201600213107','1',NULL,NULL,'0',NULL,'13877414921','1131615302@qq.com',NULL),(2184,'黄源松','201600213109','201600213109','1',NULL,NULL,'0',NULL,'13877419221','420844683@qq.com',NULL),(2185,'秦曼人','201600213123','201600213123','1',NULL,NULL,'0',NULL,'15277416531','913142189@qq.com',NULL),(2186,'谢惟朋','201600213130','201600213130','1',NULL,NULL,'0',NULL,'18775045602/18269676686','775622366@qq.com',NULL),(2187,'甘丽','201600213136','201600213136','1',NULL,NULL,'0',NULL,'15777423312','1812742693@qq.com',NULL),(2188,'何柳花','201600213137','201600213137','1',NULL,NULL,'0',NULL,'18778244153','2556398743@qq.com',NULL),(2189,'韦燕琳','201600213150','201600213150','1',NULL,NULL,'0',NULL,'18276417276','1425212042@qq.com',NULL),(2190,'叶炜','201600213230','201600213230','1',NULL,NULL,'0',NULL,'14795413020','983469420@qq.com',NULL),(2191,'陈贵连','201600213235','201600213235','1',NULL,NULL,'0',NULL,'18878277244','1487812572@qq.com',NULL),(2192,'廖小兰','201600213244','201600213244','1',NULL,NULL,'0',NULL,'14777147212','1910994973@qq.com',NULL),(2193,'莫佩凤','201600213247','201600213247','1',NULL,NULL,'0',NULL,'13471967794','710148944@qq.com',NULL),(2194,'赵春艳','201600213254','201600213254','1',NULL,NULL,'0',NULL,'18610629843','914844370@qq.com\n',NULL),(2195,'钟佳萍','201600213255','201600213255','1',NULL,NULL,'0',NULL,'13768128054','1051717348@qq.com',NULL),(2196,'陈石新','201500208103','201500208103','1',NULL,NULL,'0',NULL,'','',NULL),(2197,'黄荣春','201500208311','201500208311','1',NULL,NULL,'0',NULL,'','',NULL),(2198,'黄英强','201500208312','201500208312','1',NULL,NULL,'0',NULL,'','',NULL),(2199,'李权治','201500208316','201500208316','1',NULL,NULL,'0',NULL,'','',NULL),(2200,'周雯才','201600208131','201600208131','1',NULL,NULL,'0',NULL,'18977179408','1019931575@qq.com',NULL),(2201,'李碧静','201600208138','201600208138','1',NULL,NULL,'0',NULL,'15777328087','2396431127@qq.com',NULL),(2202,'谭月莲','201600208142','201600208142','1',NULL,NULL,'0',NULL,'15078111373','458387307@qq.com',NULL),(2203,'王娜','201600208143','201600208143','1',NULL,NULL,'0',NULL,'18172501857','1832968200@qq.com',NULL),(2204,'张楠','201600208149','201600208149','1',NULL,NULL,'0',NULL,'18577421040','1003405874@qq.com',NULL),(2205,'张旺珍','201600208150','201600208150','1',NULL,NULL,'0',NULL,'19976304023','2596795433@qq.com',NULL),(2206,'周丽鲜','201600208151','201600208151','1',NULL,NULL,'0',NULL,'19976304187','3188316741@qq.com',NULL),(2207,'刘清旭','201600208212','201600208212','1',NULL,NULL,'0',NULL,'18377480282','1870168644@qq.com',NULL),(2208,'孙艺','201600208225','201600208225','1',NULL,NULL,'0',NULL,'18276417233‘','1181823629@qq.com',NULL),(2209,'叶城廷','201600208231‘','201600208231‘','1',NULL,NULL,'0',NULL,'15177436102','395344467@qq.com',NULL),(2210,'廖梦青','201600208239’','201600208239’','1',NULL,NULL,'0',NULL,'18378016738‘','2671690670@qq.com',NULL),(2211,'刘春福','201600208315','201600208315','1',NULL,NULL,'0',NULL,'18577409493','429829320@qq.com',NULL),(2212,'陈宣媛','201600208334','201600208334','1',NULL,NULL,'0',NULL,'19127333480','1093869183@qq.com',NULL),(2213,'孔丽玲','201600208338','201600208338','1',NULL,NULL,'0',NULL,'18277403327','2662675272@qq.com',NULL),(2214,'刘禹含','201600208343','201600208343','1',NULL,NULL,'0',NULL,'17374843602','2099284432@qq.com',NULL),(2215,'覃荔靖','201600208346','201600208346','1',NULL,NULL,'0',NULL,'18276365213','2687834634@qq.com',NULL),(2216,'王菁颖','201600208348','201600208348','1',NULL,NULL,'0',NULL,'18777425659','1161463449@qq.com',NULL),(2217,'莫东林','201600208417','201600208417','1',NULL,NULL,'0',NULL,'18078062074','931668343@qq.com',NULL),(2218,'商文鑫','201600208444','201600208444','1',NULL,NULL,'0',NULL,'15777400781','1316521967@qq.com',NULL),(2219,'谈茵茵','201600208446','201600208446','1',NULL,NULL,'0',NULL,'15878427805','1586695284@qq.com',NULL),(2220,'李桂兰','201600213140','201600213140','1',NULL,NULL,'0',NULL,'15207840793','2561719281@qq.com',NULL),(2221,'魏钰','201600213151','201600213151','1',NULL,NULL,'0',NULL,'13557348039','1050332581@qq.com',NULL),(2222,'肖雨君','201600213152','201600213152','1',NULL,NULL,'0',NULL,'13649424680','978613018@qq.com',NULL),(2223,'何鹏程','201500213105','201500213105','1',NULL,NULL,'0',NULL,'','',NULL),(2224,'唐昌钰','201500213116','201500213116','1',NULL,NULL,'0',NULL,'','',NULL),(2225,'唐立','201500213117','201500213117','1',NULL,NULL,'0',NULL,'','',NULL),(2226,'钟明城','201500213126','201500213126','1',NULL,NULL,'0',NULL,'','',NULL),(2227,'李明清','201600208110','201600208110','1',NULL,NULL,'0',NULL,'18376477791','329031482@qq.com',NULL),(2228,'陆鹏祥','201600208116','201600208116','1',NULL,NULL,'0',NULL,'18775043257','1960262152@qq.com',NULL),(2229,'陆镇峰','201600208117','201600208117','1',NULL,NULL,'0',NULL,'18529780521','l516917774@qq.com',NULL),(2230,'黎军君','201600208137','201600208137','1',NULL,NULL,'0',NULL,'18278051926','1152097113@qq.com',NULL),(2231,'王研','201600208144','201600208144','1',NULL,NULL,'0',NULL,'14747509025','1479610934@qq.com',NULL),(2232,'梁容','201600208238','201600208238','1',NULL,NULL,'0',NULL,'15878059375‘','760718814@qq.com',NULL),(2233,'林远秋','201600208240’','201600208240’','1',NULL,NULL,'0',NULL,'13026947596‘','1577946543@qq.com',NULL),(2234,'郭家欣','201500208307','201500208307','1',NULL,NULL,'0',NULL,'18878578004','1272844493@qq.com',NULL),(2235,'廖家鹏','201500208410','201500208410','1',NULL,NULL,'0',NULL,'15717744021','1481537845@qq.com',NULL),(2236,'陈天艺','201600208303','201600208303','1',NULL,NULL,'0',NULL,'13878498531','1061318901@qq.com',NULL),(2237,'丁程强','201600208304','201600208304','1',NULL,NULL,'0',NULL,'18277480079','1009445881@qq.com',NULL),(2238,'董思源','201600208305','201600208305','1',NULL,NULL,'0',NULL,'18290124378','1370250496@qq.com',NULL),(2239,'黄庆港','201600208308','201600208308','1',NULL,NULL,'0',NULL,'15278359554','a9062058182qq.com@qq.com',NULL),(2240,'黄祖彬','201600208310','201600208310','1',NULL,NULL,'0',NULL,'15777588404','1730078542@qq.com',NULL),(2241,'覃悦','201600208322','201600208322','1',NULL,NULL,'0',NULL,'19968069458','122792840@qq.com',NULL),(2242,'叶国标','201600208328','201600208328','1',NULL,NULL,'0',NULL,'18577447845','1443372989@qq.com',NULL),(2243,'方丽萍','201600208337','201600208337','1',NULL,NULL,'0',NULL,'15777403561','1242649186@qq.com',NULL),(2244,'刘丽蓉','201600208342','201600208342','1',NULL,NULL,'0',NULL,'18276411572','1304313356@qq.com',NULL),(2245,'唐纤蓥','201600208347','201600208347','1',NULL,NULL,'0',NULL,'15078111541','1915420178@qq.com',NULL),(2246,'苏三明','201600213222','201600213222','1',NULL,NULL,'0',NULL,'18677546979','500607502@qq.com',NULL),(2247,'韦冠宇','201600213226','201600213226','1',NULL,NULL,'0',NULL,'13507743376','296712296@qq.com',NULL),(2248,'吴尚彬','201600213228','201600213228','1',NULL,NULL,'0',NULL,'18177405347','100504010@qq.com',NULL),(2249,'严荣','201600213229','201600213229','1',NULL,NULL,'0',NULL,'15778022959','185834022@qq.com',NULL),(2250,'梁鹏飞','201500208113','201500208113','1',NULL,NULL,'0',NULL,'','',NULL),(2251,'王玉华','201500208127','201500208127','1',NULL,NULL,'0',NULL,'','',NULL),(2252,'王嘉雯','201500208428','201500208428','1',NULL,NULL,'0',NULL,'','',NULL),(2253,'羊腾强','201600208129','201600208129','1',NULL,NULL,'0',NULL,'','',NULL),(2254,'莫冠华','201400213017','201400213017','1',NULL,NULL,'0',NULL,'13617743142','1648226142@qq.com',NULL),(2255,'霍胜权','201400213014','201400213014','1',NULL,NULL,'0',NULL,'','840526484@qq.com',NULL),(2256,'谢云','201400208223','201400208223','1',NULL,NULL,'0',NULL,'201400208223','15866952842@qq.com',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=1833 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (344,23,772),(1460,25,1886),(1461,25,1887),(1462,25,1888),(1463,25,1889),(1464,25,1890),(1465,25,1891),(1466,25,1892),(1467,25,1893),(1468,25,1894),(1469,25,1895),(1470,25,1896),(1471,25,1897),(1472,25,1898),(1473,25,1899),(1474,25,1900),(1475,25,1901),(1476,25,1902),(1477,25,1903),(1478,25,1904),(1479,25,1905),(1480,25,1906),(1481,25,1907),(1482,25,1908),(1484,25,1910),(1485,25,1911),(1486,25,1912),(1487,25,1913),(1488,25,1914),(1489,25,1915),(1490,25,1916),(1491,25,1917),(1492,25,1918),(1493,25,1919),(1494,25,1920),(1495,25,1921),(1496,25,1922),(1497,25,1923),(1498,25,1924),(1499,25,1925),(1500,25,1926),(1501,25,1927),(1502,25,1928),(1503,25,1929),(1504,25,1930),(1505,25,1931),(1506,25,1932),(1507,25,1933),(1508,25,1934),(1509,25,1935),(1510,25,1936),(1511,25,1937),(1512,25,1938),(1513,25,1939),(1514,25,1940),(1515,25,1941),(1516,25,1942),(1517,24,1943),(1518,24,1944),(1519,24,1945),(1520,24,1946),(1521,24,1947),(1522,24,1948),(1523,24,1949),(1524,24,1950),(1525,24,1951),(1526,24,1952),(1527,24,1953),(1528,24,1954),(1529,24,1955),(1530,24,1956),(1531,24,1957),(1532,24,1958),(1533,24,1959),(1534,24,1960),(1535,24,1961),(1536,24,1962),(1537,24,1963),(1538,24,1964),(1539,24,1965),(1540,24,1966),(1541,24,1967),(1542,24,1968),(1543,24,1969),(1544,24,1970),(1545,24,1971),(1546,24,1972),(1547,24,1973),(1548,24,1974),(1549,24,1975),(1550,24,1976),(1551,24,1977),(1552,24,1978),(1553,24,1979),(1554,24,1980),(1555,24,1981),(1556,24,1982),(1557,24,1983),(1558,24,1984),(1559,24,1985),(1560,24,1986),(1561,24,1987),(1562,24,1988),(1563,24,1989),(1564,24,1990),(1565,24,1991),(1566,24,1992),(1567,24,1993),(1568,24,1994),(1569,24,1995),(1570,24,1996),(1571,24,1997),(1572,24,1998),(1573,24,1999),(1574,24,2000),(1575,24,2001),(1576,24,2002),(1577,24,2003),(1578,24,2004),(1579,24,2005),(1580,24,2006),(1581,24,2007),(1582,24,2008),(1583,24,2009),(1584,24,2010),(1585,24,2011),(1586,24,2012),(1587,24,2013),(1588,24,2014),(1589,24,2015),(1590,24,2016),(1591,24,2017),(1592,24,2018),(1593,24,2019),(1594,24,2020),(1595,24,2021),(1596,24,2022),(1597,24,2023),(1598,24,2024),(1599,24,2025),(1600,24,2026),(1601,24,2027),(1602,24,2028),(1603,24,2029),(1604,24,2030),(1605,24,2031),(1606,24,2032),(1607,24,2033),(1608,24,2034),(1609,24,2035),(1610,24,2036),(1611,24,2037),(1612,24,2038),(1613,24,2039),(1614,24,2040),(1615,24,2041),(1616,24,2042),(1617,24,2043),(1618,24,2044),(1619,24,2045),(1620,24,2046),(1621,24,2047),(1622,24,2048),(1623,24,2049),(1624,24,2050),(1625,24,2051),(1626,24,2052),(1627,24,2053),(1628,24,2054),(1629,24,2055),(1630,24,2056),(1631,24,2057),(1632,24,2058),(1633,24,2059),(1634,24,2060),(1635,24,2061),(1636,24,2062),(1637,24,2063),(1638,24,2064),(1639,24,2065),(1640,24,2066),(1641,24,2067),(1642,24,2068),(1643,24,2069),(1644,24,2070),(1645,24,2071),(1646,24,2072),(1647,24,2073),(1648,24,2074),(1649,24,2075),(1650,24,2076),(1651,24,2077),(1652,24,2078),(1653,24,2079),(1654,24,2080),(1655,24,2081),(1656,24,2082),(1657,24,2083),(1658,24,2084),(1659,24,2085),(1660,24,2086),(1661,24,2087),(1662,24,2088),(1663,24,2089),(1664,24,2090),(1665,24,2091),(1666,24,2092),(1667,24,2093),(1668,24,2094),(1669,24,2095),(1670,24,2096),(1671,24,2097),(1672,24,2098),(1673,24,2099),(1674,24,2100),(1675,24,2101),(1676,24,2102),(1677,24,2103),(1678,24,2104),(1679,24,2105),(1680,24,2106),(1681,24,2107),(1682,24,2108),(1683,24,2109),(1684,24,2110),(1685,24,2111),(1686,24,2112),(1687,24,2113),(1688,24,2114),(1689,24,2115),(1690,24,2116),(1691,24,2117),(1692,24,2118),(1693,24,2119),(1694,24,2120),(1695,24,2121),(1696,24,2122),(1697,24,2123),(1698,24,2124),(1699,24,2125),(1700,24,2126),(1701,24,2127),(1702,24,2128),(1703,24,2129),(1704,24,2130),(1705,24,2131),(1706,24,2132),(1707,24,2133),(1708,24,2134),(1709,24,2135),(1710,24,2136),(1711,24,2137),(1712,24,2138),(1713,24,2139),(1714,24,2140),(1715,24,2141),(1716,24,2142),(1717,24,2143),(1718,24,2144),(1719,24,2145),(1720,24,2146),(1721,24,2147),(1722,24,2148),(1723,24,2149),(1724,24,2150),(1725,24,2151),(1726,24,2152),(1727,24,2153),(1728,24,2154),(1729,24,2155),(1730,24,2156),(1731,24,2157),(1732,24,2158),(1733,24,2159),(1734,24,2160),(1735,24,2161),(1736,24,2162),(1737,24,2163),(1738,24,2164),(1739,24,2165),(1740,24,2166),(1741,24,2167),(1742,24,2168),(1743,24,2169),(1744,24,2170),(1745,24,2171),(1746,24,2172),(1747,24,2173),(1748,24,2174),(1749,24,2175),(1750,24,2176),(1751,24,2177),(1752,24,2178),(1753,24,2179),(1754,24,2180),(1755,24,2181),(1756,24,2182),(1757,24,2183),(1758,24,2184),(1759,24,2185),(1760,24,2186),(1761,24,2187),(1762,24,2188),(1763,24,2189),(1764,24,2190),(1765,24,2191),(1766,24,2192),(1767,24,2193),(1768,24,2194),(1769,24,2195),(1770,24,2196),(1771,24,2197),(1772,24,2198),(1773,24,2199),(1774,24,2200),(1775,24,2201),(1776,24,2202),(1777,24,2203),(1778,24,2204),(1779,24,2205),(1780,24,2206),(1781,24,2207),(1782,24,2208),(1783,24,2209),(1784,24,2210),(1785,24,2211),(1786,24,2212),(1787,24,2213),(1788,24,2214),(1789,24,2215),(1790,24,2216),(1791,24,2217),(1792,24,2218),(1793,24,2219),(1794,24,2220),(1795,24,2221),(1796,24,2222),(1797,24,2223),(1798,24,2224),(1799,24,2225),(1800,24,2226),(1801,24,2227),(1802,24,2228),(1803,24,2229),(1804,24,2230),(1805,24,2231),(1806,24,2232),(1807,24,2233),(1808,24,2234),(1809,24,2235),(1810,24,2236),(1811,24,2237),(1812,24,2238),(1813,24,2239),(1814,24,2240),(1815,24,2241),(1816,24,2242),(1817,24,2243),(1818,24,2244),(1819,24,2245),(1820,24,2246),(1821,24,2247),(1822,24,2248),(1823,24,2249),(1824,24,2250),(1825,24,2251),(1826,24,2252),(1827,24,2253),(1828,24,2254),(1829,24,2255),(1830,24,2256),(1831,25,1909),(1832,26,1909);
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

-- Dump completed on 2019-11-26  9:31:07
