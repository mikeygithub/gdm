<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>添加角色</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="<%=path%>/css/permStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/core/dialog/closeDialog.js"></script>
<script type="text/javascript">
 
	 $(function(){
	     var flag='${mark}';
	     if(flag!='' && flag!=undefined){
	    	 if(flag==1){
	        $('#submit').attr('disabled','disabled');
	        layer.msg('添加成功');
	        setTimeout(function(){
	           parent.location.reload();
	           layer.close(index);
	        },1000);
	     }else if(flag==0){
	     layer.msg('添加失败');
	     }
	     }
	});
</script>
<style type="text/css">
.rightText {text-align: right;width: 20%;}
td {padding: 4px;}
</style>
</head>
<body style="min-width: 200px;margin: 10px;">
	<div class="main" >
		<fieldset class="layui-elem-field">
			<legend>添加角色</legend>
			<div class="layui-field-box">
				<form action="<%=path%>/sys/sysRole_add.action?view=add"
					method="post" name="form1" id="form1">
					<ul>
						<li>
							<table border="10" cellspacing="0" cellpadding="0" width="100%">
								<tr>
									<td class="rightText">角色名称：</td>
									<td><input type="text"
										style="width: 80%;height: 40px;border: 1px  solid #C1DAD7;"
										id="model.roleName" name="model.roleName" width="80%">
										<i style="color: red">*</i></td>
								</tr>
								<tr height="80px">
									<td class="rightText">角色描述：</td>
									<td><textarea id="model.description"
											style="width: 80%;height: 100%;border: 1px  solid #C1DAD7;"
											name="model.description"></textarea></td>
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
								<input name="" id="submit" type="submit" class="scbtn"
									value="添加" onClick="getData();" />
							</div>
						</li>
					</ul>
				</form>
			</div>
		</fieldset>
	</div>
</body>
</html>
