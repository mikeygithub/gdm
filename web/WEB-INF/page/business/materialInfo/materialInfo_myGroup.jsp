<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>答辩分组信息</title>
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
		<li><a href="<%=path %>/Userlogin.action">首页</a></li>
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
			<legend>答辩分组信息</legend>
			<div class="layui-field-box">
				<form action="<%=path%>/biz/GroupAllot_edit.action?view=edit"
					method="post" name="form1" id="form1">
					<input type="hidden" name="thisId" value="${groupAllot.groupId }" />
					<ul>
						<li>
							<table class="tablelist">
							     <tr>
								  <th >所在分组：</th>
									<td class="textContent">${groupAllot.groupName}</td>
								  </tr>
								  
								  <tr>
									<th >组长：</th>
									<td> 
										<s:iterator id="" value="groupAllot.teacherList">
								             <s:if test="type==0">${teacherName }
								             </s:if>
							            </s:iterator>
									</td>
								  </tr>
								
								  <tr>
									<th >记录员：</th>
									<td class="textContent"> 
										<s:iterator id="" value="groupAllot.teacherList">
								             <s:if test="type==2">${teacherName }
								             </s:if>
							            </s:iterator>
							        </td>
								  </tr>
							 	
							   	  <tr>
								    <s:set name="gNormal" value="groupAllot.normalTeacher" scope="page"></s:set>
									<th >老师：</th>
									<td class="textContent"> 
										 <s:iterator id="" value="groupAllot.teacherList">
								             <s:if test="type==1">${teacherName }&nbsp;
								             </s:if>
							            </s:iterator>
							        </td>
								  </tr>
								
								  <tr>
								    <th >评阅老师：</th>
								    <td class="textContent"> 
								    <s:iterator id="" value="groupAllot.teacherList">
								             <s:if test="type==0">${teacherName }
								             </s:if>
							            </s:iterator>
							        </td>
								  </tr>
								
								  <tr>
								   <th >答辩时间：</th>
								    <td class="textContent">${groupAllot.replyTime }</td>
								  </tr>
								  <tr>

								    <th >答辩地点：</th>
								    <td class="textContent">${groupAllot.classroomName }</td>

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
