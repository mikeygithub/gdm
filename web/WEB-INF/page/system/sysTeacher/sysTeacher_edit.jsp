<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>修改教师</title>
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
	 $(function(){
		    //校验手机号码
		    $.validator.addMethod("mobile", function(value, element) {
				var length = value.length;
				var mobile = /^(13\d|14[57]|15[^4,\D]|17[678]|18\d)\d{8}|170[059]\d{7}$/;
				return this.optional(element) || (length == 11 && mobile.test(value));
			}, "手机号码格式错误"); 
		    
		    //校验电子邮箱
		    $.validator.addMethod("email", function(value, element) {
				var email = /^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/;
				return this.optional(element) || email.test(value);
			}, "邮箱格式不对"); 
		    
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
		        	"model.teacherNo":{
		                required:true,
		                remote: {  
			                type: "post",  
			                url: "<%=path%>/sys/teacher_checkName.action",  
			                data: {  
			                    "model.teacherNo": $("#model.teacherNo").val()  
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
			            rangelength:[4,20]
		            },
		            "model.teacherName":{
		            	required:true,
		            	rangelength:[2,20]
		            },
		            "userHelp.password":{
		            	required:true,
		            	rangelength:[6,20]
		            },
		            "userHelp.userEmail":{
		            	email:true
		            },
		            "userHelp.userTel":{
		            	mobile:true
		            },
		            "thisRoleId":{
		            	required:true
		            },
		           
		        },
		        messages:{
		        	"model.teacherNo":{
		        		required:"请输入职工号",
		        		rangelength:"长度为4到 20个字或字母",
		        	 remote:"该工号已存在"
		        	 },
			            "model.teacherName":{
			            	required:"请输入教师姓名",
			            	rangelength:"长度为4- 20位"
			            },
			            "userHelp.password":{
			            	required:"请输入密码",
			            	rangelength:"长度为6- 20位"
			            },
			            "userHelp.userEmail":{
			            	email:"邮箱格式错误"
			            },
			            "userHelp.userTel":{
			            	mobile:"手机号格式错误"
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
	 function onSelect(name){
		 var deptNumber = function(){return $(name).val();};
	$.ajax({
	    type: "post",
	    url: '<%=path%>/sys/category_findJsonByDept.action',
			dataType : "json",
			data : {
				"deptNumber" : deptNumber
			},
			success : function(result) {
				if (result) {
					$("#categoryList").html('');
					$.each(result, function(index, content) {
						$("#categoryList").append(
								"<option value='"+content.categoryId+"' >"
										+ content.categoryName + "</option>");
						if(index==1){
							onSelect1(this,content.categoryId);
						}
					});
				}
			},
			error : function(result) {
				console.log(result);
			}
		});
	}
	 
	 function onSelect1(name,type){
		 var categoryId = 0;
		 if(type==-1){
		  categoryId = function(){return $(name).val();};
		 }else{
			 categoryId =  type;
		 }
	$.ajax({
	    type: "post",
	    url: '<%=path%>/sys/major_findJsonByDept.action',
			dataType : "json",
			data : {
				"categoryId" : categoryId
			},
			success : function(result) {
				if (result) {
					$("#staffroomList").html('');
					$.each(result, function(index, content) {
						$("#staffroomList").append(
								"<option value='"+content.majorId+"' >"
										+ content.staffName + "</option>");
					});
				}
			},
			error : function(result) {
				console.log(result);
			}
		});
	} 
	layui.use('form', function() {
		var form = layui.form();
	});
</script>
<style type="text/css">
.rightText {
	text-align: right;
	width: 30%;
}

td {
	padding: 4px;
	font-size: 14px;
}
.warn {
	color: red;
	font-size: 25px;
}
</style>
</head>

<body style="min-width: 200px">
	<div class="main">
		<fieldset class="layui-elem-field">
			<legend>修改教师信息</legend>
			<div class="layui-field-box">
				<form action="<%=path%>/sys/teacher_edit.action?view=edit"
					method="post" name="form1" id="form1">
					<input type="hidden" name="model.teacherId"
						value="${teacher.teacherId }"> <input type="hidden"
						name="model.userId" value="${teacher.userId }">
					<ul>
						<li>
							<table class="tablelist" width="100%">
							<tbody>
								<tr>
									<td class="rightText">职工号：</td>
									<td style="font-size: 16px;padding: 4px;color: #3EAFE0;">${teacher.teacherNo }
										<input type="hidden" class="dfinput" readonly="readonly"
										id="model.teacherNo" name="model.teacherNo"
										value="${teacher.teacherNo }">
									</td>
								</tr>
								<tr>
									<td class="rightText">姓名：</td>
									<td style="font-size: 16px;padding: 4px;color: #3EAFE0;">
										<input type="text" class="dfinput" id="model.teacherName"
										name="model.teacherName" value="${teacher.teacherName }">
										<i class="warn">*</i>
									</td>
								</tr>
								<tr>
									<td class="rightText">学院名称：</td>
									<td><s:select cssClass="dfinput" list="departmentList"
											listKey="deptNumber" listValue="deptName"
											onchange="onSelect(this);" name="model.deptNumber" id="deptNumber"
											value="model.deptNumber" /></td>
								</tr>
									<tr>
									<td class="rightText">大类：</td>
									<td><s:select cssClass="dfinput" list="categoryList"
											listKey="categoryId" listValue="categoryName"
											onchange="onSelect1(this,-1);" name="model.categoryId" id="category"
											value="teacher.categoryId" /></td>
								</tr>
								<tr>
									<td class="rightText">教研室名称：</td>
									<td><select class="dfinput" id="staffroomList"
										name="staffroomId">
											<s:iterator id="sm" value="sysMajorList">
												<option value="${majorId }" <s:if test="majorId==teacher.staffroomId">selected="selected"</s:if>>${staffName }</option>
											</s:iterator>
									</select></td>
								</tr>
								<tr>
									<td class="rightText">教师职称：</td>
									<td><s:select cssClass="dfinput" list="sysTechnicalList"
											listKey="technicalId" listValue="technicalName"
											value="teacher.technicalId" name="model.technicalId"
											id="model.technicalId" /></td>
								</tr>
								<%-- 	<tr>
									<td class="rightText">教师职务：</td>
									<td><s:select cssClass="dfinput" list="sysDutiesList"
											listKey="dutiesId" listValue="dutiesName"
											value="teacher.dutiesId" name="model.dutiesId"
											id="model.dutiesId" /></td>
								</tr> --%>
								<tr>
									<td class="rightText">性别：</td>
									<td><s:select cssClass="dfinput" list="#{0:'男',1:'女'}"
											listKey="key" listValue="value" value="teacher.userSex"
											id="userHelp.userSex" name="userHelp.userSex" /></td>
												</tr>
						<tr >
									<td class="rightText">联系电话：</td>
									<td><input type="text" class="dfinput"
										id="userHelp.userTel" name="userHelp.userTel"
										value="${teacher.userTel }"> </td>
								</tr>

								<tr>
									<td class="rightText" style="width: 10%;">邮箱：</td>
									<td><input type="text" class="dfinput"
										id="userHelp.userEmail" name="userHelp.userEmail"
										value="${teacher.userEmail}"></td>
											</tr>
						<tr >
									<td class="rightText" style="width: 10%;">年龄：</td>
									<td><input type="text" class="dfinput"
										id="userHelp.userAge" name="userHelp.userAge"
										value="${teacher.userAge}"></td>
								</tr>
								</tbody>
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
 <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
	</div>
</body>
</html>
