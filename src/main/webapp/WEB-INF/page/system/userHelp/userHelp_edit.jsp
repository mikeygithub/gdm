<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>修改用户</title>
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
		    //校验手机号码
		    $.validator.addMethod("mobile", function(value, element) {
				var length = value.length;
				var mobile = /^(13\d|14[57]|15[^4,\D]|17[678]|18\d)\d{8}|170[059]\d{7}$/;
				return this.optional(element) || (length == 11 && mobile.test(value));
			}, "手机号码格式错误"); 
		    
	    $("#form1").validate({
	        errorClass:"errorInfo", //默认为错误的样式类为：error
	        errorElement:"em",
	        focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
	        onkeyup: false,   
	        submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form
	              form.submit();   //提交表单
	              var index = layer.load(2, {time: 10*1000}); //又换了种风格，并且设定最长等待10秒 
	        },   
	        rules:{
	            "model.userName":{
	            	required:true,
	            	rangelength:[2,6]
	            },
	            "model.password":{
	            	required:true,
	            	rangelength:[6,20]
	            	
	            },
	            "thisRoleId":{
	            	required:true
	            },
	           
	        },
	        messages:{
	        	 "model.userName":{
		            	required:"请输入用户名",
		            	rangelength:"长度为2到 6个字或字母"
		            },
		            "model.password":{
		            	required:"请输入密码",
		            	rangelength:"长度为6- 20位"
		            },
		            "thisRoleId":{
		            	required:"请选择角色"
		            },
		           
	        },
	        errorPlacement: function(error, element) { //错误信息位置设置方法
				error.appendTo( element.parent() ); //这里的element是录入数据的对象
			}
	    });    
	});
	 
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
  <legend>修改用户信息</legend>
  <div class="layui-field-box">
		<form action="<%=path%>/sys/userHelp_edit.action?view=edit"
			method="post" name="form1" id="form1" style="border:1px  solid #C1DAD7;" >
				<input type="hidden" name="model.id" value="${model.id }">
			<ul>
				<li>
					<table  border="10" cellspacing="0" cellpadding="0" width="100%"
						>
						<tr >
						<tr >
							<td  class="rightText" >用户姓名：</td>
							<td style="font-size: 16px;padding: 4px;color: #3EAFE0;">${model.userName }<input type="hidden" class="inputfrom"
								id="model.userName" name="model.userName" value="${model.userName }"> </td>
						</tr>
						
							<td  class="rightText"  >登录名：</td>
							<td style="font-size: 16px;padding: 4px;color: #3EAFE0;">${model.loginName }
							<input type="hidden" class="inputfrom" readonly="readonly"
								id="model.loginName" name="model.loginName" value="${model.loginName }"> </td>
						</tr>
						
						<tr >
							<td  class="rightText" >密码：</td>
							    <td ><sec:authorize ifAnyGranted="ROLE_BASE">
							     ${model.password }
							 </sec:authorize>
							 <sec:authorize ifNotGranted="ROLE_BASE">
							 **************************
							 </sec:authorize></td>
						</tr>
						 <tr >
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
