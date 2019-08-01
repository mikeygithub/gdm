<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>修改分组信息</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css"
	type="text/css" />

<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>

<script type="text/javascript" src="<%=path%>/js/core/dialog/closeDialog.js"></script>
<script type="text/javascript" src="<%=path%>/datePicket/WdatePicker.js"></script>

<script type="text/javascript">

	$(function() {
		var flag = "${mark}";
		if (flag != '' && flag != undefined) {
			if (flag == "1") {
				$('#submit').attr('disabled', 'disabled');
				layer.msg('修改成功');
				setTimeout(function() {
					parent.location.reload();
					layer.close(index);
				}, 1000);
			} else if (flag == "0") {
				layer.msg('修改失败');
			}
		}
	});

	layui.use('form', function() {
		var form = layui.form();
	});
</script>
<style type="text/css">
.rightText {
	text-align: right;
	width: 16%;
}

td {
	padding: 4px;
	font-size: 14px;
}

</style>
</head>

<body style="min-width: 200px">
	<div class="main">
		<fieldset class="layui-elem-field">
			<legend>修改分组信息</legend>
			<div class="layui-field-box">
				<form action="<%=path%>/biz/GroupAllot_edit.action?view=edit"
					method="post" name="form1" id="form1">
					<input type="hidden" name="thisId" value="${groupAllot.groupId }" />
					<ul>
						<li>
							<table class="tablelist" border="10" cellspacing="0" cellpadding="0" width="100%">
							      <tr>
									<td class="rightText">所选年度：</td>
									<td>${groupAllot.year }</td>
								</tr>
								<tr>
									<td class="rightText">组别：</td>
									<td>
									<s:if test="groupAllot.groupType==00">答辩组</s:if>
					                          <s:if test="groupAllot.groupType==01">大组</s:if>
									</td>
								</tr>
								<tr>
									<td class="rightText">组名：</td>
									<td>${groupAllot.groupName }</td>
								</tr>
							 	<tr>
									<td class="rightText" style="width: 10%;">组长：</td>
									<td >
									<s:iterator id="" value="groupAllot.teacherList">
						             <s:if test="type==0">${teacherName }
						              <a href="javascript:void(0);" onclick="del(this,${groupAllot.groupId},${teacherId},'${teacherName}',${groupAllot.year })">
							         <font color="red"> <i class="layui-icon">&#x1006;</i></font></a>
						             </s:if>
						         </s:iterator>
									</td>
									
								</tr>
								<tr>
									<td class="rightText" style="width: 10%;">记录员：</td>
									<td>
									
								<s:iterator id="" value="groupAllot.teacherList">
						             <s:if test="type==2">${teacherName }
						              <a href="javascript:void(0);" onclick="del(this,${groupAllot.groupId},${teacherId},'${teacherName}',${groupAllot.year })">
							         <font color="red"> <i class="layui-icon">&#x1006;</i></font></a>
						             </s:if>
						         </s:iterator>
									</td>
								</tr>
								<tr>
									<td class="rightText" style="width: 10%;">评阅老师</td>
									<td><s:iterator id="" value="groupAllot.teacherList">
						             <s:if test="type==1">${teacherName }
						              <a href="javascript:void(0);" onclick="del(this,${groupAllot.groupId},${teacherId},'${teacherName}',${groupAllot.year })">
							         <font color="red"> <i class="layui-icon">&#x1006;</i></font></a>&nbsp;
						             </s:if>
						         </s:iterator>
									</td>
								</tr> 
								<tr>
									<td class="rightText">教室：</td>
									<td><s:select cssClass="dfinput" list="classRoomList"
										 listKey="id" value="groupAllot.classRoomId"
										   id="classRoomId" name="model.classRoomId"
											listValue="classroomName" onchange="onSelect(this);" 
											/>
									</td>
								</tr>
								<tr>
								    <td class="rightText"  >答辩时间：</td>
									<td style="font-size: 16px;padding: 4px;color: #3EAFE0;">
									    <input name="tempDateFormat" id="model.replyTime" class="dfinput" value="${groupAllot.replyTime}"
										type="text" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',isShowWeek:true})" />
								    </td>
								</tr>
								
								<tr>
								    <td class="rightText"  >答辩方向：</td>
									<td style="font-size: 16px;padding: 4px;">
									 <s:iterator  id="p" value="groupAllot.directionList">
									    ${majorName }&nbsp;
									    </s:iterator>
									    
									<%--   <s:iterator id="mp"  value="majorList" >
									    <s:iterator  id="p" value="groupAllot.directionList">
									      <s:if test="#mp.majorId==majorId">
									      <s:set name="state"  value="0"></s:set>
									      </s:if>
									    </s:iterator>
	                                  &nbsp; <input type="checkbox" name="categoryList" value="${majorId}"  
	                                   <s:if test="#state==0">checked="checked"</s:if> > 
	                                        ${majorName }&nbsp; 
	                                         <s:set name="state"  value="1"></s:set> 
	                                 </s:iterator> --%>
									 </td>
								</tr>
							</table>
							
						<li>
							<div style="text-align: center;">
								<input name="" id="submit" type="submit" class="scbtn"
									value="修改" />
							</div>
						</li>
					</ul>

				</form>
			</div>
		</fieldset>

	</div>
	 <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
<script type="text/javascript">

    //删除已选老师
    function del(name,allGroupId,teacherId,teacherName,year){
	     var re=$(name).parent().parent();
	     layer.confirm('您确定要移除 <font color="blue">'+teacherName+'</font> 老师吗?', {icon: 3, title:'提示'}, function(index){
		 layer.close(index);
		 var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/biz/GroupTeacher_delSelTeacher.action',
					dataType : "json",
					data : {
						"thisGroupId" : allGroupId,
						"thisTeacherId" : teacherId,
						"thisYear" : year
					},success : function(result) {
						layer.close(index); 
						if (result) {
							re.remove();
							layer.alert('删除成功',{icon: 1},function(){
								 parent.location.reload();
								});
						}else{
							layer.msg('删除失败',{icon: 2});
						}
					},
					error : function(result) {
						layer.close(index); 
						layer.msg('删除失败',{icon: 2});
					}
				});
    });
}
</script>
	
</body>
</html>
