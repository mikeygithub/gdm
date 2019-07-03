<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script language="javaScript" src="<%=path %>/third/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active");
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	;
</script>


</head>

<body style="background:#f0f9fd;">
<div class="lefttop"><span></span>导航菜单</div>

<dl class="leftmenu">

   <s:iterator id="p" value="menuList"> 
     <sec:authorize ifAnyGranted="${menuPerm }">
	    <dd>
	    <div class="title">
		    <span><img src="<%=path %>/images/leftico01.png" /></span>
		    ${menuName }
	    </div>
	    	<ul class="menuson" >
	    	   <s:iterator id="p" value="sysGroupList"> 
	    	   <sec:authorize ifAnyGranted="${groupPerm}">  
				 <li><cite></cite>
				   <a href="<%=path %>${groupUrl }" target="rightFrame">${groupName }</a>
				     <i></i>
				 </li>
			   </sec:authorize>
			   </s:iterator>
			</ul>
	      </dd> 
      </sec:authorize>
   </s:iterator>
</dl>
</body>
</html>
