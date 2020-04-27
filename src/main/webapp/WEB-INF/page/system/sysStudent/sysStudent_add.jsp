<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>添加学生</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />

<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>

<script type="text/javascript" src="<%=path%>/js/core/dialog/closeDialog.js"></script>
<script type="text/javascript" src="<%=path%>/datePicket/WdatePicker.js"></script>

<script type="text/javascript">
       $(function(){
    		//校验身份证验证
    	   $(document).ready(function () {
    		    jQuery.validator.addMethod("isIdCardNo", function (value, element) {
    		        return this.optional(element) || isIdCardNo(value);
    		    }, "请正确输入您的身份证号码");
    		});
    		//增加身份证验证
    		function isIdCardNo(num) {
    		    var factorArr = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1);
    		    var parityBit = new Array("1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2");
    		    var varArray = new Array();
    		    var intValue;
    		    var lngProduct = 0;
    		    var intCheckDigit;
    		    var intStrLen = num.length;
    		    var idNumber = num;
    		    // initialize
    		    if ((intStrLen != 15) && (intStrLen != 18)) {
    		        return false;
    		    }
    		    // check and set value
    		    for (i = 0; i < intStrLen; i++) {
    		        varArray[i] = idNumber.charAt(i);
    		        if ((varArray[i] < '0' || varArray[i] > '9') && (i != 17)) {
    		            return false;
    		        } else if (i < 17) {
    		            varArray[i] = varArray[i] * factorArr[i];
    		        }
    		    }
    		    if (intStrLen == 18) {
    		        //check date
    		        var date8 = idNumber.substring(6, 14);
    		        if (isDate8(date8) == false) {
    		            return false;
    		        }
    		        // calculate the sum of the products
    		        for (i = 0; i < 17; i++) {
    		            lngProduct = lngProduct + varArray[i];
    		        }
    		        // calculate the check digit
    		        intCheckDigit = parityBit[lngProduct % 11];
    		        // check last digit
    		        if (varArray[17] != intCheckDigit) {
    		            return false;
    		        }
    		    }
    		    else {        //length is 15
    		        //check date
    		        var date6 = idNumber.substring(6, 12);
    		        if (isDate6(date6) == false) {
    		            return false;
    		        }
    		    }
    		    return true;
    		}
    		function isDate6(sDate) {
    		    if (!/^[0-9]{6}$/.test(sDate)) {
    		        return false;
    		    }
    		    var year, month, day;
    		    year = sDate.substring(0, 4);
    		    month = sDate.substring(4, 6);
    		    if (year < 1700 || year > 2500) return false
    		    if (month < 1 || month > 12) return false
    		    return true
    		}

    		function isDate8(sDate) {
    		    if (!/^[0-9]{8}$/.test(sDate)) {
    		        return false;
    		    }
    		    var year, month, day;
    		    year = sDate.substring(0, 4);
    		    month = sDate.substring(4, 6);
    		    day = sDate.substring(6, 8);
    		    var iaMonthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    		    if (year < 1700 || year > 2500) return false
    		    if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) iaMonthDays[1] = 29;
    		    if (month < 1 || month > 12) return false
    		    if (day < 1 || day > iaMonthDays[month - 1]) return false
    		    return true
    		}
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
				layer.confirm('您确定要保存学生 '+$("input[name='model.stuName']").val()+' 吗?', {icon: 1, title:'提示'}, function(){
					var index = layer.load(1);
					layer.close(index)
					form.submit();
				});
	        },
	        rules:{
	        	"model.stuNo":{
	                required:true,
	                remote: {  
		                type: "post",  
		                url: "<%=path %>/sys/student_checkName.action",  
		                data: {  		                  
		                	"model.stuNo": $("#model.stuNo").val() 
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
	           "model.stuName":{
	            	required:true,
	            	rangelength:[2,20]
	            },   
	             "userHelp.password":{
	            	rangelength:[6,20]
	             },
	          /*  "userHelp.userEmail":{
	            	required:true,
	            	email:true
	            }, */
	            "userHelp.userTel":{
	            	required:true,
	            	mobile:true
	            },
	            "model.stuIdcart":{
	            	required:true,
	            	isIdCardNo:true	           
	            },
	            "model.stuEntrance":{
	            	required:true
	            },
	            "model.stuGrade":{
	            	required:true,
	            	rangelength:[4,20]
	            },
	            "thisRoleId":{
	            	required:true
	            },
	        },
	        messages:{

	            "model.stuNo":{
	        		required:"请输入学号",
	        		rangelength:"长度为4到 20个数字",
	        	    remote:"该学号已存在"
	        	 },
	        
	        	"model.stuName":{
	        		required:"请输入姓名",
	        		rangelength:"长度为2到 20个字或字母"
	        	    },

		           "userHelp.password":{
		            	required:"请输入密码",
		            	rangelength:"长度为6- 20位"
		            },
		            /* "userHelp.userEmail":{
		            	required:"请输入电子邮箱"
		            },  */          
		            "userHelp.userTel":{
		            	required:"请输入联系方式"
		            },
		            "model.stuIdcart":{
		            	required:"请输入身份证号"         	
		            },
		            "model.stuEntrance":{
		            	required:"请输入入学时间"
		            },
		            "model.stuGrade":{
		            	required:"请输入年级"
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

	function onSelect(name){
	 var deptNumber = function(){return $(name).val();};
		$.ajax({
		    type: "post",
		    url: '<%=path%>/sys/major_findJsonByDept.action',
			dataType : "json",
			data : {
				"deptNumber" : deptNumber
			},success : function(result) {
				if (result) {
					$("#majorList").html('');
					$.each(result,function(index,content){
						if(index==0){
							onSelect1(content.majorId,2);
						}
						$("#majorList").append("<option value='"+content.majorId+"' >"+content.majorName+"</option>");   
						});
				}
			},
			error : function(result) {
				console.log(result);
			}
		}
		);
}
	function onSelect1(name,type){
		var majorId; 
		if(type==1){
			majorId = function(){return $(name).val();};
		}else if(type==2){
			majorId =name;
		}	 
	$.ajax({
		  type: "post",
		  url: '<%=path%>/sys/classes_findJsonByMajorId.action',
					dataType : "json",
					data : {
						"majorId" : majorId
					},success : function(result) {
						if (result) {
							$("#classList").html('');
							$.each(result,function(index,content){
								$("#classList").append("<option value='"+content.classId+"' >"+content.className+"</option>");   
								});
						}
					},
					error : function(result) {
						console.log(result);
					}
				}
				);
		}  
	 
	 $(function(){
	     var flag="${mark}";
	     if(flag!='' && flag!=undefined){
	    	 if(flag=="1"){
	        $('#submit').attr('disabled','disabled');
	        layer.msg('添加成功',{icon:1});
	        setTimeout(function(){
	           parent.location.reload();
	           // layer.close(index);
	        },1000);
	     }else if(flag=="0"){
	     layer.msg('添加失败',{icon:2});
	     }
	     }
	});
 
	 // layui.use('form', function(){
		//   var form = layui.form();
		// });
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
			<legend>添加学生信息</legend>
			<div class="layui-field-box">
				<form action="<%=path%>/sys/student_add.action?view=add"
					method="post" name="form1" id="form1">
					<input type="hidden" name="thisId" value="${student.stuId }">
					<input type="hidden" name="model.userId" value="${student.userId }">
					<input type="hidden" id="keepMajorId" name="keepMajorId"
						value="${student.majorId}" /> <input type="hidden"
						id="keepClassId" name="keepClassId" value="${student.classId}" />
					<ul>
						<li>
							<table class="tablelist" width="100%">
								<tbody>
								<tr>
										<td class="rightText">学号：</td>
										<td style="font-size: 16px;padding: 4px;color: #3EAFE0;">
											<input type="text" class="dfinput" 
											id="model.stuNo" name="model.stuNo" value="${student.stuNo }">
										</td>
									</tr>

									<tr>
										<td class="rightText">姓名：</td>
										<td style="font-size: 16px;padding: 4px;color: #3EAFE0;">
											<input type="text" class="dfinput" id="model.stuName"
											name="model.stuName" value="${student.stuName }"> <i
											class="warn">*</i>
										</td>
									</tr>
									<tr>
										<td class="rightText">性别：</td>
										<td><s:select cssClass="dfinput" list="#{0:'男',1:'女'}"
												listKey="model.userSex" listValue="value"
												value="model.userSex" id="userHelp.userSex"
												name="userHelp.userSex" /><i
											class="warn">*</i></td>
									</tr>
								
									<tr>
										<td class="rightText" style="width: 10%;">学院名称：</td>
										<td><s:select cssClass="dfinput" list="sysDepartmentList"
												listKey="deptNumber" listValue="deptName"
												onchange="onSelect(this);" name="deptNumber" id="deptNumber"
												value="model.deptNumber" /><i
											class="warn">*</i></td>
									</tr>
									<tr>
										<td class="rightText" style="width: 10%;">专业：</td>
										<td><select class="dfinput" id="majorList"
											name="model.majorId" onchange="onSelect1(this,1);"
											listKey="majorId">
												<s:iterator id="sm" value="sysMajorList">
													<option value="${majorId}">
														${majorName }</option>
												</s:iterator>
										</select><i
											class="warn">*</i></td>
									</tr>

									<tr>
										<td class="rightText" style="width: 10%;">班级：</td>
										<td><select class="dfinput" id="classList"
											listKey="majorId" name="model.classId">
												<s:iterator id="sm" value="sysClassList">
													<option value="${student.classId }">
														${student.className }</option>
												</s:iterator>
										</select><i
											class="warn">*</i></td>
									</tr>
									<tr>
										<td class="rightText">年级：</td>
										<td style="font-size: 16px;padding: 4px;color: #3EAFE0;">
											<input type="text" class="dfinput" id="model.stuGrade"
											name="model.stuGrade" value="${student.stuGrade }"
											onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy',isShowWeek:true})" 
											> <i
											class="warn">*</i>
										</td>
									</tr>
								<%--待修复英文日期传递异常--%>
									<tr>
										<td class="rightText">入学时间：</td>
										<td style="font-size: 16px;padding: 4px;color: #3EAFE0;">
											<input name="model.stuEntrance" id="stuEntrance"
											class="dfinput" value="${student.stuEntrance }" type="text"
<%--											onfocus="WdatePicker({skin:'whyGreen',dateFmt:'MM/dd/yyyy',isShowWeek:true})" />--%>
											onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',isShowWeek:true})" />
										<i
											class="warn">*</i>
										</td>
									</tr>

									<tr>
										<td class="rightText">学历层次：</td>
										<td><s:select cssClass="dfinput"
												list="#{0:'本科',1:'专科',2:'专升本',3:'中升本'}" listKey="key"
												listValue="value" value="model.stuArrangement"
												id="model.stuArrangement" name="model.stuArrangement" />
												<i
											class="warn">*</i></td>
									</tr>

									<tr>
										<td class="rightText">学制：</td>
										<td>
										<s:select cssClass="dfinput"
												list="#{1:'一年',2:'二年',3:'三年',4:'四年'}" listKey="key"
												listValue="value" value="student.stuSchoollength"
												id="model.stuSchoollength" name="model.stuSchoollength" />
											<i class="warn">*</i></td>
									</tr>
									<tr>
										<td class="rightText" style="width: 10%;">身份证号:</td>
										<td><input type="text" class="dfinput"
											id="model.stuIdcart" name="model.stuIdcart"
											value="${student.stuIdcart}"> </td>
									</tr>
									<td class="rightText">地址：</td>
									<td style="font-size: 16px;padding: 4px;color: #3EAFE0;">
										<input type="text" class="dfinput" id="model.stuAddress"
										name="model.stuAddress" value="${student.stuAddress }">
									</td>
									</tr>
									<tr>
										<td class="rightText">联系电话：</td>
										<td><input type="text" class="dfinput"
											id="userHelp.userTel" name="userHelp.userTel"
											value="${student.userTel }"> </td>
									</tr>

									<tr>
										<td class="rightText">电子邮箱：</td>
										<td style="font-size: 16px;padding: 4px;color: #3EAFE0;">
											<input type="text" class="dfinput" id="userHelp.userEmail"
											name="userHelp.userEmail" value="${student.userEmail }">
										</td>
									</tr>

<%--									<tr>--%>
<%--										<td class="rightText" style="width: 10%;">年龄：</td>--%>
<%--										<td><input type="text" class="dfinput"--%>
<%--											id="userHelp.userAge" name="userHelp.userAge"--%>
<%--											value="${student.userAge}"></td>--%>
<%--									</tr>--%>
								</tbody>
							</table>
						<li>
							<div style="text-align: center;">
								<input name="" type="submit" class="scbtn" value="添加"/>
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
