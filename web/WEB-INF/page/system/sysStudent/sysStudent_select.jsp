<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>学生管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />


<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>

</head>
<body>
<div class="place">
<span>选择学生</span>
</ul>
</div>
		<div class="rightinfo">
        <table class="tablelist" >
    	<thead>
    	<tr>
    	<th>序号</th>
    	<th>姓名</th>
   		<th>学号</th>
   		<th>班级</th>
   		<th>联系方式</th>
   		<th>操作</th>
        </tr>
        </thead>
        <tbody>
				<s:iterator id="p" value="pageResult.data" status="pp">
					<tr id="tr_${id}">
						<td align="center"><s:property value="#pp.count" /></td>
						<td align="center" >${model.stuName}</td>
						<td align="center" >${model.stuId}</td>
						<td align="center" >${model.stuEntrance}</td>
						<td align="center" >${model.stuPhone}</td>
					</tr>
				</s:iterator>
				</tbody>
</table>
<%@ include file="/WEB-INF/common/pagination.jsp"%>
</div>
</body>
</html>
