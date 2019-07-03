<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>指导老师评阅表</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css"
	type="text/css" />

<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>



<script type="text/javascript">
	$(function() {

		$("#form1").validate({
			errorClass : "errorInfo", //默认为错误的样式类为：error
			errorElement : "em",
			focusInvalid : false, //当为false时，验证无效时，没有焦点响应  
			onkeyup : false,
			submitHandler : function(form) { //表单提交句柄,为一回调函数，带一个参数：form
				if (confirm("是否要保存信息？")) {
					form.submit(); //提交表单
					var index = layer.load(2, {
						time : 10 * 1000
					}); //又换了种风格，并且设定最长等待10秒 
				}
			},
			rules : {
				"thisScore":{
					required:true,
	            	rangelength:[0,100]
				},
				"model.replyLink":{
					required:true,
	            	rangelength:[200,10000]
				}
			},
			messages : {
				"thisScore":{
					required:"请填写答辩成绩",
	            	rangelength:"0-100以内"
				},
				"model.replyLink":{
					required:"请填写评语",
	            	rangelength:"评语不少于200字"
				}
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
				layer.msg('保存成功', {
					icon : 1
				});
				setTimeout(function() {
				}, 1000);
			} else if (flag == "0") {
				layer.msg('保存失败', {
					icon : 2
				});
			}
		}
	});

	function getData() {
		var score = '';
		$("input[name='score']").each(function(index, content) {
			score = score + this.id + '-' + this.value + '-' + this.alt + ',';
		});
		$("#scoreIds").val('');
		$("#scoreIds").val(score);
	}

	layui.use('form', function() {
		var form = layui.form();
	});
</script>

<style type="text/css">
.rightText {
	text-align: right;
	width: 120px;;
}

td {
	padding: 4px;
	font-size: 14px;
	font-size: 14px;
	border: 1px solid #C1DAD7;
}

.inputfrom {
	width: 78%;
	height: 40px;
	border: 1px solid #C1DAD7;
	font-size: 14px;
}

.title {
	height: 30px;
}

.warn {
	color: red;
	font-size: 25px;
}
</style>
</head>
<body style="min-width: 200px;">
	<div class="rightinfo" style=" width: 980px;margin: 0 auto;">

		<fieldset class="layui-elem-field">
				<legend>梧州学院本科生毕业论文答辩成绩及评语表</legend>
			<div class="layui-field-box">
				<form action="<%=path%>/biz/replyScore_add.action?view=detail"
					method="post" name="form1" id="form1">
					<input name="thisStuId" type="hidden" value="${thisStuId }">
						<input type="hidden"   name="thisReplyType" value="${thisReplyType }">
					<input type="hidden" name="thisYear" value="${thisYear }">
					<ul>
						<li>
							<table border="10" cellspacing="0" cellpadding="0" width="980px">
								<tr class="title">
									<td class="rightText">题目：</td>
									<td colspan="10">${issueInfo.issueName }</td>
								</tr>
								<tr class="title">
									<td class="rightText">学院：</td>
									<td>${student.deptName }</td>
									<td class="rightText">专业：</td>
									<td>${student.majorName }</td>
								</tr>

								<tr class="title">
									<td class="rightText">姓名：</td>
									<td>${student.stuName }</td>
									<td class="rightText">指导 老师：</td>
									<td>${teacher.teacherName }</td>
								</tr>
								<tr class="title">
									<td align="center" colspan="4">答辩小组对毕业论文的答辩评定成绩及评语</td>
								</tr>
								<tr class="title">
								  <td  class="rightText">答辩小组名单：</td>
									<td colspan="3">
									  ${groupAllot.groupLeader.teacherName }
								   &nbsp;${groupAllot.recordKeeper.teacherName }
								    &nbsp;${groupAllot.normalTeacher.teacherName }
									</td>
								</tr>
								<tr class="title">
								  <td class="rightText">规范审查:</td>
								  <td  align="center">${checkScore }</td>
								  <td class="rightText">指导教师评阅打分:</td>
								  <td align="center" >${guideScore }</td>
								 </tr>
								 <tr class="title">
								  <td class="rightText">评阅人评阅打分:</td>
								  <td  align="center">${readScore }</td>
								  <td class="rightText">答辩成绩:</td>
								  <td  align="center">
								  <input class="dfinput" style="width: 50px"
								   min="0" name="thisScore" 
								  max="100" id="thisScore"
									 value="${score }"  type="number">
								  </td>
								 </tr>
								<tr class="title">
								  <td class="rightText">等级</td>
								  <td  align="center"></td>
								  <td  class="rightText">最终成绩：</td>
								  <td align="center"></td>
								 </tr>
								 <tr >
								 <td class="rightText">评语:</td></tr>
								<tr style="height 100px">
									<td colspan="10"><textarea rows="" cols=""
											name="model.replyLink" id="model.replyLink"
											style="min-height: 100px;width: 100%">${review.reviewContent }</textarea></td>
								</tr>
							</table>
						<li>
							<div style="text-align: center;">
								<input name="" id="submit" type="submit" class="scbtn"
									value="提交" onClick="getData();" />
							</div>
						</li>
					</ul>
				</form>
			</div>
		</fieldset>
	</div>
</body>
</html>
