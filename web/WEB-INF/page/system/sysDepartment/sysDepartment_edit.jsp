<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>修改学院</title>
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
	            "model.deptNumber":{
	            	required:true,
	            	rangelength:[2,6]
	            },
	            "model.deptName":{
	            	required:true,
	            	rangelength:[6,20]
	            	
	            },
	            "model.deptDescription":{
	            	required:true
	            },
	           
	        },
	        messages:{
	        	 "model.deptNumber":{
		            	required:"请输入学院编号",
		            	rangelength:"长度为2到 6个字或字母"
		            },
		            "model.deptName":{
		            	required:"请输入学院名称",
		            	rangelength:"长度为6- 20位"
		            },
		            "model.deptDescription":{
		            	required:"请输入学院描述"
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
.textareafrom{width: 78%;height: 100px;border: 1px  solid #C1DAD7;font-size: 16px;}
.warn{color: red;font-size: 25px;}
</style>
</head>

<body style="min-width: 200px">
	<div class="main">
	<fieldset class="layui-elem-field">
  <legend>修改学院信息</legend>
  <div class="layui-field-box">
		<form action="<%=path%>/sys/department_edit.action"
			method="post" name="form1" id="form1" style="border:1px  solid #C1DAD7;" >
				<input type="hidden" name="model.id" value="${model.id }">
			<ul>
				<li>
					<table  border="10" cellspacing="0" cellpadding="0" width="100%"
						>
						
						<tr >
							<td  class="rightText" >学院编号：</td>
							<td style="font-size: 16px;padding: 4px;color: #3EAFE0;">${model.deptNumber }<input type="hidden" class="inputfrom"
								id="model.deptNumber" name="model.deptNumber" value="${model.deptNumber }"> </td>
						</tr>
						<tr >
							<td  class="rightText"  >学院名称：</td>
							<td style="font-size: 16px;padding: 4px;color: #3EAFE0;">${model.deptName }
							<input type="hidden" class="inputfrom" readonly="readonly"
								id="model.deptName" name="model.deptName" value="${model.deptName }"> </td>
						</tr>
						<tr >
							<td  class="rightText" >学院描述：</td>
							<td ><textarea type="text" class="textareafrom"
								id="model.deptDescription" name="model.deptDescription" >${model.deptDescription } </textarea></td>
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
