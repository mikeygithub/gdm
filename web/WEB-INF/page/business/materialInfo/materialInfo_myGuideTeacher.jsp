<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>我的指导老师信息</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />

<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>

<script type="text/javascript" src="<%=path%>/js/core/dialog/closeDialog.js"></script>
<script type="text/javascript" src="<%=path%>/datePicket/WdatePicker.js"></script>


<style type="text/css">
th,td {
	padding: 8px;
	font-size: 14px;
}
th{
width: 100px;
}
</style>

</head>

<body style="min-width: 200px">
   <div class="place">
		<span>位置：</span>
		<ul class="placeul">
		<li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>
		<li>毕业设计相关流程信息</li>
		</ul>
   </div>

   <div class="rightinfo">
		  <div class="formbody">
          <div id="usual1" class="usual"> 
             <%@ include file="/WEB-INF/page/business/materialInfo/select_info_tab.jsp"%>
          <div id="tab2" class="tabson">
	<div class="main" style="max-width:800px; margin:0 auto;">
		<fieldset class="layui-elem-field">
			<legend>我的指导老师信息</legend>
			<div class="layui-field-box">
				<form action="<%=path%>/biz/GroupAllot_edit.action?view=edit"
					method="post" name="form1" id="form1">
					<input type="hidden" name="thisId" value="${groupAllot.groupId }" />
					<ul>
						<li>
							<table class="tablelist">
							      <tr>
									<th>姓名：</th>
									<td class="textContent">${teacher.teacherName }</td>
								  </tr>
								<tr>
									<th>所在教研室：</th>
									<td class="textContent"> ${teacher.staffName}</td>
								</tr>
								<tr>
									<th>研究方向：</th>
									<td class="textContent"> 
									    <s:iterator id="p" value="teacherDirectionsList">
							        		<s:if test="#p.directionsId == directionsId">
							        			${directionsName}
							        		</s:if>
							        	</s:iterator>
							        </td>
								</tr>
								<tr>
									<th>职务：</th>
									<td class="textContent">
							        	${teacher.dutiesName }
									</td>
								</tr>
								<tr>
								    <th>职称：</th>
								    <td class="textContent">${teacher.technicalName }</td>
								</tr>
								<tr>
								    <th>联系方式：</th>
								    <td class="textContent">${teacher.userTel }</td>
								</tr>
								
							</table>
					</ul>

				</form>
			</div>
		</fieldset>
	</div>
	 <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
