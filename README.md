# GRADUATION PROJECT SYSTEM
#**毕业设计管理系统**
###### 介绍
毕业设计管理系统，结合学校实际情况开发，提供教师和学生在整个毕业设计管理流程中使用，其主要包括
````text
1.师生双选  
2.提交材料
3.答辩分组
4.成绩录入
5.论文审阅
6.在线沟通
7.公告模块
````

## 软件架构
1.后端`struts2+hibernate+spring`  
2.前端`layui`  
3.聊天`netty`
## 安装教程

web端口：`8899`  
netty服务器: `ws://ip:port`

````text
1.配置数据库
set global sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
set session sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
2.打包镜像
docker build -t mikeyboom/gdm:latest .
3.推送镜像
docker push mikeyboom/gdm:latest
4.拉取镜像
docker-compose -f docker-compose.yml pull
5.运行容器
docker-compose -f docker-compose.yml -d
````

## 使用说明

部署地址：[gdm](http://47.106.210.183:8888/gdm/)

用户手册：[operation instruction](src/main/webapp/attached/doc/operation%20instruction.wps)  

业务流程：
`管理员登录录入数据->各个用户登入完善信息->管理员给予各个教研室主任角色->教研室主任登入安排时间进度->设置各个教师所带人数->答辩分组-记录信息`　　

## BUG汇总  

1.未在阶段时间内操作给出提示  
