<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>添加教师</title>
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
	              var index = layer.load(2); //又换了种风格
	        },   
	        rules:{
	        	"excelFile":{
	                required:true
	        	},
	        },
	        messages:{
		            "excelFile":{
		            	required:"请选择文件"
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
		     var flag="${exitList}";
		     if(flag!='' && flag!=undefined){
		     layer.msg('添加成功,信息重复');
		    }else{
		    	 layer.msg('添加成功');
		        setTimeout(function(){
		           parent.location.reload();
		           layer.close(index);
		        },1000);
		    }
	   
	     }else if(flag=="0"){
	     layer.msg('添加失败');
	     }
	    }
	});

	 
	 layui.use('form', function(){
		  var form = layui.form();
		}); 
</script>

<style type="text/css">
.rightText {text-align: right;width: 16%;}
td {padding: 4px;font-size: 14px;color: red;}
.inputfrom{width: 78%;height: 40px;border: 1px  solid #C1DAD7;font-size: 16px;}
.warn{color: red;font-size: 25px;}
h1{color: red;font-size: 15px;}
</style>
</head>

<body><div class="place">
<span>位置：</span>
<ul class="placeul">
<li><a href="<%=path %>/sys/Home_home.action">首页</a></li>
<li>教师管理</li>
</ul>

</html>
</div>
      <div class="rightinfo">
			<div class="formtitle">
				<span>导入教师信息</span>
			</div>
    	<form  id="form1"
    	 action="<%= basePath%>/sys/teacher_addTeacherByExcel.action?view=openAddTeacherByExcel" enctype="multipart/form-data" method="post" style="margin-left: 20px;"> 
        	<input type="file" id="excelFile"  name="excelFile"/> 
        	<input type="submit" name="" class="btn" value="确认导入" />
        	<a href="<%=path%>/sys/download.action?filePath=templete/templeteTeacher.xlsx"><input type="button" name=""  class="btn" value="下载模板"/></a>
    	</form>
		<br/>
		<s:if test="exitList!=null">
		<h1>*该信息已存在</h1>
		
		 <table class="tablelist" >
    	<thead>
    	<tr>
    	<th>序号</th>
   		<th>职工号</th>
   		<th>姓名</th>
   		<th>教师职称</th>
   		<th>联系电话</th>
   		<th>邮箱</th>
   		<th>性别</th>
   		<th>年龄</th>
   		<th>操作</th>
        </tr>
        </thead>
        <tbody>
				<s:iterator id="p" value="exitList" status="pp">
					<tr id="tr_${id}">
						<td align="center"><s:property value="#pp.count" /></td>
						<td align="center" >${teacherId}</td>
						<td align="center" >${teacherName}</td>
						<td align="center" >${technicalName}</td>
						<td align="center" >${teacherTelephone}</td>
						<td align="center" >${teacherEmail}</td>
						<td align="center" >${teacherSex}</td>
						<td align="center" >${teacherAge}</td>
					</tr>
				</s:iterator>
				</tbody>
    </table>
		</s:if>
		<br/>
    </div>
</body>
</html>

