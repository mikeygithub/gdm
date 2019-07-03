<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>论文管理</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/ueditor/themes/default/css/ueditor.css" type="text/css" />

<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>

<script type="text/javascript">
	$(function() {
		var flag = "${mark}";
		if (flag != '' && flag != undefined) {
			if (flag == "1") {
				layer.msg('保存成功', {
					icon : 1
				});
				setTimeout(function() {
					parent.location.reload();
				}, 1000);
			} else if (flag == "0") {
				layer.msg('保存失败', {
					icon : 2
				});
			}
		}
	});

</script>
<style type="text/css">
.rightText {text-align: right;width: 120px;;}
td {padding: 4px;font-size: 14px;font-size: 14px;border: 1px  solid #C1DAD7;}
.inputfrom{width: 78%;height: 40px;border: 1px  solid #C1DAD7;font-size: 14px;}
.title{height: 40px;}
.warn{color: red;font-size: 25px;}
</style>
</head>
<body style="min-width: 200px;">
<div class="rightinfo" style=" width: 980px;margin: 0 auto;">
	<fieldset class="layui-elem-field">
    <legend>论文</legend>	
    <div class="layui-field-box" >
    		<div class="formtitle" style="float:right;">
			<ul>
				<li class="line"> <a href="<%=path%>/biz/taskBook_outTaskBook.action?thisId=${model.taskId }">
				<font> <img src="<%=path%>/images/i01.png" width="20px" />一键导出</font></a></li>
			</ul>
		</div>
			<ul>
				<li>
					<table  border="10" cellspacing="0" cellpadding="0" width="100%"
						>
						<tr  class="title">
						<td  class="rightText" >学院：</td>
							<td >${student.deptName } 
               	         </td>
               	         <td  class="rightText" >专业：</td>
							<td > 
               	        		${student.majorName }
               	        	 </td>
							 <td  class="rightText" >班级：</td>
							 <td>
               	        		${student.className }
               	        		 </select>
               	        		 </td>
						</tr>
						
						<tr class="title">
							<td  class="rightText">学号：</td>
							<td >${student.stuNo }</td>
							<td  class="rightText" >姓名：</td>
							<td >${student.stuName }</td>
							<td  class="rightText" >指导 老师：</td>
							<td >${teacher.teacherName }</td>
						</tr> 
						<tr class="title" >
							<td  class="rightText">题目：</td>
							<td colspan="10">
							${issueInfo.issueName }
        		  		   </td>
        		  			</tr>
						
						<tr >
						<tr class="title">
							<td colspan="10" style="padding-top: 40px;">一、论文的内容和要求：</td>
						</tr>
						<tr>
						<td colspan="10">
							<div >${model.taskContent}</div>
							</td>
							</tr>
				
				     <tr class="title">
							<td colspan="10"  style="padding-top: 40px;">二、进度计划与应完成的工作：</td>
						</tr>
						<tr >
						<td colspan="10" >
							<div >${model.taskPlanJob}</div>
							</td>
						</tr>
				       <tr class="title">
							<td colspan="10"  style="padding-top: 40px;">三、主要参考文献、资料：（标明）</td>
						</tr>
						<tr>
						<td colspan="10" >
							<div >${model.taskDocument}</div>
							</td>
						</tr>
					</table>
					</li>
			</ul>
  </div>
</fieldset>
	</div>

</body>
</html>
