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
				<div class="formtitle" style="float:right;">
					<ul>
						<li class="line"><a
							href="<%=path%>/biz/review_outReview.action?thisId=${review.reviewId }">
								<font> <img src="<%=path%>/images/i01.png" width="20px" />一键导出
							</font>
						</a></li>
					</ul>
				</div>
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
													<td align="center">
													<s:iterator id="rp" value="review.reviewScoreList" >
													   <s:if test="scoreItemId==#ps.scoreItemId">
													   ${score }
													   </s:if>
													</s:iterator>
													</td>
												</s:if>
											</s:iterator>
										</tr>
										<s:iterator id="ps" value="scoreItemList" status="sp">
											<s:if test="#sp.count>1">
												<tr class="title">
													<td>${itemName}</td>
													<td align="center">${itemScore }</td>
													<td align="center">
													<s:iterator id="rp" value="review.reviewScoreList" >
													   <s:if test="scoreItemId==#ps.scoreItemId">
													    ${score }
													   </s:if>
													</s:iterator>
													</td>
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
									<td align="left" >指导教师评语:</td>
									<s:if test="thisReviewType!=02">
									<td align="center" ></td>
									<td align="center">是否进入答辩环节</td>
									<td align="center">
									 <s:if test="review.replyLink==00">否</s:if>
									<s:if test="review.replyLink==01"> 是</s:if>
									</td></s:if>
								</tr>
								<tr style="height: 100px" >
									<td  colspan="10"><textarea rows="" cols=""  
									name="model.reviewContent"
									style="min-height: 100px;width: 100%">${review.reviewContent }</textarea></td>
								</tr>
							</table>
					</ul>
				</form>
			</div>
		</fieldset>
	</div>
</body>
</html>
