<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path %>/third/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/core/time/time.js"></script>

</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
<%--    <li><a href="<%=path %>/sys/Home_home.action" target="_parent">首页</a></li>--%>
        <li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>
    </ul>
    </div>
    <div class="mainindex">
    <div class="welinfo">
    <span><img src="<%=path %>/images/sun.png" id="timeIcon"/></span>
    <b>${fullName }&nbsp;<i id="shijianduan"></i>，欢迎使用欢迎使用梧州学院毕业设计选题档案管理系统</b>
    
 
    </div>

</body>

</html>
