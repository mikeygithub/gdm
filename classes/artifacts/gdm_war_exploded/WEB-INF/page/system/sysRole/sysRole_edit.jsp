<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>修改角色</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="<%=path%>/css/permStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/core/dialog/closeDialog.js"></script>

<script type="text/javascript">
	 $(function(){
	     var flag="${mark}";
	     if(flag!='' && flag!=undefined){
	    	if(flag=="1") {
	        $('#submit').attr('disabled','disabled');
	        layer.msg('修改成功');
	        setTimeout(function(){
	           parent.location.reload();
	           layer.close(index);
	        },1000);
	     }else if(flag=="0"){
	     layer.msg('修改失败');
	     }
	     }
	});


</script>
<style type="text/css">
	.rightText{text-align: right;width: 20%;}
	td{padding: 4px;}
</style>
</head>

<body style="min-width: 200px;margin: 20px;">
<div class="main">
<fieldset class="layui-elem-field">
			<legend>修改角色</legend>
			<div class="layui-field-box">

  <form action="<%=path%>/sys/sysRole_edit.action?view=edit"
			method="post" name="form1" id="form1" >
			<ul>
				<li>
					<table  border="10" cellspacing="0" cellpadding="0" width="100%"
						>
						<tr>
							<td  class="rightText" >
							<h1 style="font-size: 16px;text-align: right;">角色名称：</h1>
							</td>
							<td ><i class="layui-icon">&#xe612;</i>
				        <i style="font-size: 20px;color: #3EAFE0;" >${model.roleName }</i></td>
						</tr>
						<tr height="100px">
							<td class="rightText">角色描述：</td>
							<td><textarea id="model.description"  style="width: 80%;height: 100%;border: 1px  solid #C1DAD7;padding: 2px"
								name="model.description">${model.description }</textarea> <i style="color: red">*</i></td>
						</tr>
                         <tr>
							<td class="rightText" align="center">角色描述：</td>
									<td>
									<%@include file="/WEB-INF/page/system/sysRole/sysPole_permView.jsp" %>
									</td>
							</tr>
					</table>
				<li>
					<div style="text-align: center;">
						<input name="" id="submit" type="submit" onClick="getData();" class="scbtn" value="修改"
							 />
					</div>
				</li>
			</ul>
			<input type="hidden" name="model.id" value="${model.id }">
			<input type="hidden" name="model.roleName" value="${model.roleName }">
		</form>
			</div>
		</fieldset>
</div>
</body>
</html>
