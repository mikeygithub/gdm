<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>添加学院</title>
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
				layer.confirm('您确定要保存 '+$("input[name='model.deptName']").val()+' 吗?', {icon: 1, title:'提示'}, function(index){
					var index = layer.load(1);
					layer.close(index)
					form.submit();
				});
	        },
	        rules:{
	        	"model.deptNumber":{
	                required:true,
	                remote: {  
		                type: "post",  
		                url: "<%=path %>/sys/department_checkName.action",  
		                data: {  
		                    "model.deptNumber": $("#model.deptNumber").val()  
		                },  
		                dataType: "html",  
		                dataFilter: function(data, type) {
		                var tag = document.getElementsByTagName("i");
						tag[0].style.display = "none"; 
		                    if (data == "true"){  
		                        return true;  
		                    }else{  
		                        return false;  
		                    }  
		                }  
		            },
		            rangelength:[2,20]
	            },
	            "model.deptName":{
	            	remote: {  
		                type: "post",  
		                url: "<%=path %>/sys/department_checkName.action",  
		                data: {  
		                    "model.deptName": $("#model.deptName").val()  
		                },  
		                dataType: "html",  
		                dataFilter: function(data, type) {
		                var tag = document.getElementsByTagName("i");
						tag[0].style.display = "none"; 
		                    if (data == "true"){  
		                        return true;  
		                    }else{  
		                        return false;  
		                    }  
		                }  
		            },
		            rangelength:[2,20],
	            	required:true,
	            },
	            /* "model.deptDescription":{
	            	required:true,
	            	rangelength:[4,20]
	            }, */
	          },
	        messages:{
	        	"model.deptNumber":{
	        		required:"请输入学院编号",
	        		rangelength:"长度为2到 20个字或字母",
	        	 remote:"该学院编号已存在"},
	        	 "model.deptName":{
		            	required:"请输入学院名称",
		            	remote:"该名称已存在",
		            	rangelength:"长度为2到 20个字或字母"
		            },
		            /* "model.deptDescription":{
		            	required:"请输入学院描述",
		            	rangelength:"长度为4- 20位"
		            }, */
		           
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
	        layer.msg('添加成功',{icon: 1});
	        setTimeout(function(){
	           parent.location.reload();
	           layer.close(index);
	        },1000);
	     }else if(flag=="0"){
	     layer.msg('添加失败',{icon: 2});
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
  <legend>添加学院信息</legend>
  <div class="layui-field-box">
		<form action="<%=path%>/sys/department_add.action"
			method="post" name="form1" id="form1" style="border:1px  solid #C1DAD7;" >
			
					<table  border="10" cellspacing="0" cellpadding="0" width="100%"
						>
						<tr >
							<td  class="rightText" >学院编号：</td>
							<td ><input type="text" class="inputfrom"
							--id="model.deptNumber" name="model.deptNumber"> <i class="warn">*</i></td>	
						</tr>
						<tr >
							<td  class="rightText" >学院名称：</td>
							<td ><input type="text" class="inputfrom"
								  id="model.deptName" name="model.deptName"><i class="warn">*</i></td>
						</tr> 
						<tr >
							<td  class="rightText" >学院描述：
							<td ><textarea type="text" class="textareafrom"
								 id="model.deptDescription" name="model.deptDescription"  ></textarea> </td>
						</tr>
	                   
					</table>
				
					<div style="text-align: center;">
						<input name="" type="submit" class="scbtn" value="添加" />
					</div>
		</form>
		  
  </div>
</fieldset>
	</div>

</body>
</html>
