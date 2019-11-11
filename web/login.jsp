<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
  <%@page import="org.springframework.security.web.*" %> 
<!DOCTYPE  HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%=SystemContext.PROJECTNAME %></title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href="<%=path%>/images/favicon.ico">
<base href="<%=basePath%>">
<style type="text/css">
.systemlogo {
	background: url(<%=path%>/images/banner_logo.png) no-repeat center;
	background-size: contain;
	margin-left: 20%;
	margin-right: 20%;
	width: 60%;
	height: 200px;
	margin-top: 20px;
	margin-bottom: -10px;
}
</style>
<script src="<%=path%>/third/jquery-1.9.1.min.js"></script>
<script language="JavaScript" src="<%=path%>/third/layui/layui.js"></script>
<script language="JavaScript" src="<%=path%>/third/layer/layer.js"></script>
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css"  media="all">
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
	function forgetPassword() {
		layer.open({
			type: 1
			,title: '系统提示'
			,closeBtn: false
			,area: '300px;'
			,shade: 0.5
			,id: 'LAY_layuipro' //设定一个id，防止重复弹出
			,btn: ['好了好了,我知道了']
			,btnAlign: 'c'
			,moveType: 1 //拖拽模式，0或者1
			,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">忘记密码请联系管理员,就这样,告辞！<br></div>'
			,success: function(layero){
			}
		});
	}
</script>
<%
request.setAttribute("", "hagl");
%>
</head>

<body
	style="background-color:#1c77ac; background-image:url(<%=path%>/images/light.png);background-repeat:no-repeat; background-position:center top; overflow:hidden;">
	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>
	<div class="logintop">
		<span>欢迎使用<%=SystemContext.PROJECTNAME%></span>
		<ul>
			<li><a href="<%=path%>">回首页</a></li>
			<li><a href="#" onclick="layer.alert('帮助？不存在的,告辞！')">帮助</a></li>
			<li><a href="#" onclick="layer.alert('没有关于,告辞！')">关于</a></li>
		</ul>
	</div>
	<div class="loginbody">
		<span class="systemlogo"></span>
		<div class="loginbox">
			<form method="post" action="<%=path%>/Userlogin_login.action" id="LoginForm" onsubmit="return checkLogin();">
				<ul>
				${SPRING_SECURITY_LAST_EXCEPTION.message}
					<li><input name="LoginName" id="LoginName" type="text"
						class="loginuser" placeHolder="用户名" value="${LoginName}" /></li>
					<li><input name="Password" id="Password" type="password"
						class="loginpwd" placeHolder="密码" value="${Password}" /></li>

					<li><input name="" type="submit" class="loginbtn" value="登录" />
						<label><input name="" type="checkbox" value="" checked="checked" />记住密码</label>
						<label>
							<a href="javascript:void(0);" onclick="forgetPassword()">忘记密码？</a>
						</label>
					</li>
				</ul>
			</form>
				<h3></h3>
		</div>
	</div>
	<div class="loginbm">版权所有 2019 <a href="http://www.gxuwz.edu.cn/">梧州学院软件开发中心</a>
	</div>
</body>

</html>
