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
				layer.confirm('您确定提交吗?', {icon: 2, title:'提示'}, function(index){
					layer.close(index);
					form.submit(); //提交表单
					var index = layer.load(2, {
						time : 10 * 1000
					}); //又换了种风格，并且设定最长等待10秒
				});
			},
			rules : {
				"model.reviewContent":{
					required:true
	            	// rangelength:[200,1000]
				}
			},
			messages : {
				"model.reviewContent":{
					required:"请填写内容"
	            	// rangelength:"填写内容不少于200-1000字"
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
		// var form = layui.form();
		var form = layui.form;
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
			<s:if test="thisReviewType==00">
				<legend>梧州学院本科生毕业论文（设计）评阅表（指导老师专用）</legend>
			</s:if>
			<s:if test="thisReviewType==01">
				<legend>梧州学院本科生毕业论文（设计）评阅表（评阅老师专用）</legend>
			</s:if>
			<s:if test="thisReviewType==02">
				<legend>梧州学院本科生毕业论文（设计）规范审查表（指导老师专用）</legend>
			</s:if>
			<div class="layui-field-box">
				<form action="<%=path%>/biz/review_add.action?view=detail"
					method="post" name="form1" id="form1">
					<input name="thisStuId" type="hidden" value="${thisStuId }">
					<input type="hidden" name="scoreIds" id="scoreIds"> <input
						type="hidden" name="thisReviewType" value="${thisReviewType }">
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
									<td align="center" colspan="2">评分项目</td>
									<td align="center">分值</td>
									<td align="center">得分</td>
								</tr>
								<tr>
									<s:iterator id="p" value="listScoreItemGroups">
										<tr class="title">
											<td align="center" rowspan="${totalCount }">${groupName }${groupPercent }</td>
											<s:iterator id="ps" value="scoreItemList" status="sp">
												<s:if test="#sp.count<=1">
													<td>${itemName}</td>
													<td align="center">${itemScore }</td>
													<td align="center"><input class="dfinput"
														style="width: 50px" min="0" name="score"
														id="${scoreItemId }"
														<s:iterator id="rp" value="review.reviewScoreList" >
													   <s:if test="scoreItemId==#ps.scoreItemId">
													    value="${score }"
													    alt="${reviewScoreId }"
													   </s:if>
													</s:iterator>
														max="${itemScore }" type="number"></td>
												</s:if>
											</s:iterator>
										</tr>
<%--								<tr><s:property value="scoreItemList"></s:property></tr>--%>
<%--									<tr><s:property value="review.reviewScoreList"></s:property></tr>--%>
										<s:iterator id="ps" value="scoreItemList" status="sp">
											<s:if test="#sp.count>1">
												<tr class="title">
													<td>${itemName}</td>
													<td align="center">${itemScore }</td>
													<td align="center"><input class="dfinput" style="width: 50px" min="0" name="score" id="${scoreItemId }"
														<s:iterator id="rp" value="review.reviewScoreList" >
															<s:if test="scoreItemId==#ps.scoreItemId"> value="${score }" alt="${reviewScoreId }"</s:if>
														</s:iterator>
													max="${itemScore }" type="number"></td>
												</tr>
											</s:if>
										</s:iterator>

									</s:iterator>
								<tr class="title">
									<td align="center" colspan="2">总得分</td>
									<td align="center"></td>
									<td align="center">${review.totalScore }</td>
								</tr>
								<tr class="title">
									<td>
										<s:if test="thisReviewType==00">
											指导教师评语:【评语不少于200字】
										</s:if>
										<s:if test="thisReviewType==01">
											评阅人评语:【评阅意见不少于200字】
										</s:if>
										<s:if test="thisReviewType==02">
											对规范审查不合格者说明原因:
										</s:if>
									</td>
<%--									<td align="left">指导教师评语:</td>--%>
									<s:if test="thisReviewType!=02">
										<td align="center"></td>
										<td align="center">是否进入答辩环节</td>
										<td align="center">否&nbsp; <input type="radio"
											name="model.replyLink" value="00" alt="否" checked="checked">
											是&nbsp;<input type="radio" name="model.replyLink" value="01"
											alt="是">
										</td>
									</s:if>
								</tr>
								<tr style="height: 100px">
									<td colspan="10"><textarea rows="" cols=""
											name="model.reviewContent" id="model.reviewContent"
											style="min-height: 100px;width: 100%">${model.reviewContent }</textarea></td>
								</tr>
							</table>
						<li>
							<div style="text-align: center;">
								<input name="" type="submit" class="scbtn" value="提交" onClick="getData();" />
							</div>
						</li>
					</ul>
				</form>
			</div>
		</fieldset>
	</div>
</body>
</html>
