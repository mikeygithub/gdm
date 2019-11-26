# Graduation project management system
毕业设计管理系统
###### 介绍
毕业设计管理系统，结合学校实际情况开发，提供教师和学生在整个毕业设计管理流程中使用，其主要包括
````text
1.教师和学生相互选取  
2.学生提交相关毕业设计材料
3.教师和学生进行答辩分组
4.教师对学生答辩成绩的录入
5.
````

#### 软件架构
1.采用struts2+hibernate+spring框架搭建  
2.前端采用layui

#### 安装教程

````text
1.配置数据库
set global sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
set session sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
2.打包镜像
docker build -t mikeyboom/gdm：v1.0.0 .
3.推送镜像
docker push mikeyboom/gdm:tagname
4.拉取镜像
docker pull mikeyboom/gdm:tagname
5.运行容器
docker run -d --name gdm -v /root/GDM/gdm:/usr/local/tomcat/webapps/ROOT -p 8080:8080 <imageId>
````
#### 使用说明
部署地址：[gdm](http://47.106.210.183:8888/gdm/)



