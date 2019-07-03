<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="<%=path%>/third/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>

<title>无标题文档</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />
<script language="JavaScript" src="<%=path %>/third/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected");
		$(this).addClass("selected");
	});
});
</script>


</head>

<body style="background:url(<%=path %>/images/topbg.gif) repeat-x;">

    <div class="topleft">
 		<a href="<%=path%>/sys/login_view.action?view=right"  
 		target="rightFrame"><img src="<%=path %>/images/loginlogo450881.png" title="系统首页" /></a>
    </div>
     
    <div class="topright">    
    	<ul>
    		<li style="color:red;font-size: 14px"><sec:authentication property="principal.username"></sec:authentication></li>
    		<li>
    		
    		<a href="<%=path%>/sys/userHelp_openEditUserInfo.action?view=userInfo&userHelpSign=0" target="rightFrame" >个人信息修改</a></li>
    		
    		<li><a href="<%=path %>/Userlogin_logout.action" target="_parent">退出系统</a></li>
    	</ul>
    	
    	<div class="user">
    		<span><%=session.getAttribute(SystemContext.USERNAME) %></span>
    		  <!-- <i>消息</i>
              <b>5</b> -->
    	</div>    
    	<!-- <ul><li><font color="white" ><strong>版权所有 2016 梧州学院软件开发中心&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></font></li></ul>
   -->
    </div>
</body>
</html>

