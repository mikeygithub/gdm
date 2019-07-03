<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统出现异常</title>
<base href="<%=basePath %>"/>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="third/jquery-1.9.1.js"></script>

<script language="javascript">
	$(function(){
    $('.errorTip').css({'position':'absolute','left':($(window).width()-490)/2});
	$(window).resize(function(){  
    $('.errorTip').css({'position':'absolute','left':($(window).width()-490)/2});
    })  
});  
</script> 


</head>


<body style="background:#edf6fa;">

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>405错误提示</li>
    </ul>
    </div>
    
    <div class="errorTip">
    
    <h2>非常遗憾，您访问的页面不存在！</h2>
    <div class="reindex"><a href="#" target="_parent">返回首页</a></div>
    
    </div>


</body>

</html>
