<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
  <%@page import="org.springframework.security.web.*" %> 
<!DOCTYPE  HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%=SystemContext.PROJECTNAME %></title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<base href="<%=basePath%>">
<style type="text/css">
.systemlogo {
	background:
		url(<%=path%>/images/loginlogo450881.png)
		no-repeat center;
	width: 100%;
	height: 71px;
	margin-top: 75px;
}
</style>
<script language="JavaScript" src="<%=path%>/third/jquery.js"></script>

<script language="javascript">
	$(function() {
		$('.loginbox').css({
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
		$(window).resize(function() {
			$('.loginbox').css({
				'position' : 'absolute',
				'left' : ($(window).width() - 692) / 2
			});
		});
	});

	function checkLogin() {
		var userName = $('#LoginName').val();
		var password = $('#Password').val();

		if ($.trim(userName) != '' && $.trim(password) != '') {
			return true;
		} else {
			$('#errorInfo').html("用户名或密码不能为空");
			return false;
		}
	}
</script>
<%
request.setAttribute("", "hagl");

%>
</head>

<body
	style="background-color:#1c77ac; background-image:url(<%=path%>/images/light.png);
	 background-repeat:no-repeat; background-position:center top; overflow:hidden;">

	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>


	<div class="logintop">
		<span>欢迎使用<%=SystemContext.PROJECTNAME%></span>
		<ul>
			<li><a href="#">回首页</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>

	<div class="loginbody">

		<span class="systemlogo"></span>

		<div class="loginbox">
			<form method="post" action="<%=path%>/Userlogin_login.action"
				id="LoginForm" onsubmit="return checkLogin();">
				<ul>
				${SPRING_SECURITY_LAST_EXCEPTION.message}
					<li><input name="LoginName" id="LoginName" type="text"
						class="loginuser" placeHolder="用户名" value="${LoginName}" /></li>
					<li><input name="Password" id="Password" type="password"
						class="loginpwd" placeHolder="密码" value="${Password}" /></li>

					<li><input name="" type="submit" class="loginbtn" value="登录" />
						<label><input name="" type="checkbox" value=""
							checked="checked" />记住密码</label><label><a href="#">忘记密码？</a></label></li>
				</ul>
			
			</form>
				<h3></h3>
          
		</div>


	</div>
	<div class="loginbm">
		版权所有 2017 <a href="http://www.gxuwz.edu.cn/">梧州学院软件开发中心</a>
	</div>

</body>

</html>
