<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>年度计划</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css"
	type="text/css" />

<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript"
	src="<%=path%>/third/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>
<script type="text/javascript" src="<%=path%>/datePicket/WdatePicker.js"></script>

<script type="text/javascript">
	$(function() {
		$("#form1").validate({
			errorClass : "errorInfo", //默认为错误的样式类为：error
			errorElement : "em",
			focusInvalid : false, //当为false时，验证无效时，没有焦点响应  
			onkeyup : false,
			submitHandler : function(form) { //表单提交句柄,为一回调函数，带一个参数：form
				form.submit(); //提交表单
				var index = layer.load(2, {
					time : 10 * 1000
				}); //又换了种风格，并且设定最长等待10秒 
			},
			rules : {
				"model.year" : {
					required : true
				},
			},
			messages : {
				"model.year" : {
					required : "请选择年度"
				},
			},
			errorPlacement : function(error, element) { //错误信息位置设置方法
				error.appendTo(element.parent()); //这里的element是录入数据的对象
			}
		});
	});

	$(function() {
		var flag = "${mark}";
		if (flag != '' && flag != undefined) {
			if (flag == "1") {
				$('#submit').attr('disabled', 'disabled');
				layer.msg('添加成功');
				setTimeout(function() {
					//parent.location.reload();
					layer.close(index);
				}, 1000);
			} else if (flag == "0") {
				layer.msg('添加失败');
			}
		}
	});

	//搜索
	function openSearch(name) {
		$("#form1").submit();
	}
</script>

<style>
td {
	padding: 4px;
	font-size: 14px;
	border: 1px solid #C1DAD7;
}
</style>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>
			<li>安排计划</li>
		</ul>
	</div>

	<div class="rightinfo">
		<%@include file="/WEB-INF/page/business/plan/plan_tab.jsp" %>
		<form id="form1" name="form1"
			action="<%=path%>/biz/PlanYear_add.action?view=year_list"
			method="post">
			<table border="10" cellspacing="0" cellpadding="0" width="100%">
				<tr>
					<td align="center" width="100px">当前年度：</td>
					<td width="20px"><input class="dfinput" type="text"
						id="model.year" name="model.year" readonly value="${model.year}"
						style="text-align: center;"
						onClick="WdatePicker({dateFmt:'yyyy'});"></td>
					<td align="center" width="140px"><input type="button" name=""
						class="btn" value="保存" onclick="$('#form1').submit()" /></td>
					<td align="center"></td>
				</tr>
			</table>
		</form>
		<br />
		<table class="tablelist" align="right">
			<thead>
				<tr>
					<th>序号</th>
					<th>年度</th>
					<th>更改人</th>
					<th>更改时间</th>
				</tr>
			</thead>
			<tbody>
				<tr id="tr_${id}">
					<td align="center">1</td>
					<td align="center"><h1
							style="font-weight: bolder;color: blue;">${model.year}</h1></td>
					<td align="center">${teacher.teacherName}</td>
					<td align="center">${model.opTime}</td>
				</tr>
			</tbody>
		</table>
	</div>


</body>
</html>
