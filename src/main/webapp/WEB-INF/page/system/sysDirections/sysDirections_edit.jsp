<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>修改教室</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />

<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>


<script type="text/javascript"> 
	 $(function(){ 
	     var flag="${mark}";
	     if(flag!='' && flag!=undefined){
	    	 if(flag=="1"){
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

	 layui.use('form', function(){
		  var form = layui.form();
	});
</script>
<style type="text/css">
.rightText {text-align: right;width: 16%;}
td {padding: 4px;font-size: 14px;}
.inputfrom{width: 78%;height: 40px;border: 1px  solid #C1DAD7;font-size: 16px;}
.warn{color: red;font-size: 25px;}
</style>
</head>

<body style="min-width: 200px">
	<div class="main">
	<fieldset class="layui-elem-field">
  <legend>修改研究方向信息</legend>
  <div class="layui-field-box">
		<form action="<%=path%>/sys/directions_edit.action?view=edit"
			method="post" name="form1" id="form1" style="border:1px  solid #C1DAD7;" >
				<input type="hidden" name="model.directionsId" value="${model.directionsId }">
			<ul>
				<li>
					<table  border="10" cellspacing="0" cellpadding="0" width="100%"
						>
						<tr >
						<tr >
							<td  class="rightText" >研究方向名称：</td>
							<td style="font-size: 16px;padding: 4px;color: #3EAFE0;"><input type="text" class="inputfrom"
								id="model.directionsName" name="model.directionsName" value="${model.directionsName }"> </td>
						</tr>
						<!--  <tr >
							<td  class="rightText"  >用户角色：</td>
							<td >
							 <div class="layui-form">
                                    <s:iterator id="role" value="roles" > 
                                      <div class="layui-input-block" 
                                      style="margin-left: 0px;">
                                     <input type="checkbox"
                                      name="roleIds[${id }]"value="${id }"  title="${roleName }" 
                                       <s:iterator id="re" value="model.sysRoles">
                                     <s:if test="id==#role.id">checked="checked"</s:if>
                                     </s:iterator>
                                     >
                                  </div> 
                                  </s:iterator>
                            </div>
					      </td>
						</tr>
						 -->
					</table>
				<li>
					<div style="text-align: center;">
						<input name="" id="submit" type="submit"  class="scbtn" value="修改"
							 />
					</div>
				</li>
			</ul>
		
		</form>
  </div>
</fieldset>
	
</div>
</body>
</html>
