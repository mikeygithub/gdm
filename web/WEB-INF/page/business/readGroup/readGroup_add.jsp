<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>添加用户</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />
<script  type="text/javascript" src="<%=path%>/third/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
<script type="text/javascript">
function openTeacher(){
	layer.open({
    	type: 2,
    	area: ['85%', '97%'],
    	fix: false, //不固定
		title:'添加分组',
    	maxmin: true,
    	content: '<%=path%>/sys/teacher_select.action?view=select&readGroup=select'
	});
}
</script>
<!-- 指派教师弹窗 -->
<script type="text/javascript">
	function choiceTeacher(title,url,w,h){
		layer.open({
		  type: 2,
		  area: ['85%', '80%'],
		  fixed: false,    //弹框位置不固定
		  maxmin: true,
		  content: url
		});
	}
</script>

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
	        	"model.loginName":{
	                required:true,
	                remote: {  
		                type: "post",  
		                url: "<%=path %>/sys/sysTeacher_checkName.action",  
		                data: {  
		                    "model.loginName": $("#model.loginName").val()  
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
	            "model.userName":{
	            	remote: {  
		                type: "post",  
		                url: "<%=path %>/sys/sysTeacher_checkName.action",  
		                data: {  
		                    "model.userName": $("#model.userName").val()  
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
	            	rangelength:[2,6]
	            },
	            "model.password":{
	            	required:true,
	            	rangelength:[4,20]
	            },
	            "model.tel":{
	            	required:true,
	            	mobile:true
	            },
	            "thisRoleId":{
	            	required:true
	            },
	           
	        },
	        messages:{
	        	"model.loginName":{
	        		required:"请输入登录名",
	        		rangelength:"长度为2到 20个字或字母",
	        	 remote:"该登录名已存在"},
	        	 "model.userName":{
		            	required:"请输入用户名",
		            	remote:"该名称已存在",
		            	rangelength:"长度为2到 6个字或字母"
		            },
		            "model.password":{
		            	required:"请输入密码",
		            	rangelength:"长度为4- 20位"
		            },
		            "model.tel":{
		            	required:"请输入联系方式"
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
	        layer.msg('添加成功');
	        setTimeout(function(){
	           parent.location.reload();
	           layer.close(index);
	        },1000);
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
td {padding: 4px;font-size: 14px;}
.inputfrom{width: 78%;height: 40px;border: 1px  solid #C1DAD7;font-size: 16px;}
.warn{color: red;font-size: 25px;}
</style>
</head>
<body style="min-width: 200px">
	<div class="main">
	<fieldset class="layui-elem-field">
  <legend>添加教师</legend>
  <div class="layui-field-box">
		<form action="<%=path%>/biz/readGroup_add.action?view=add"
			method="post" name="form1" id="form1" style="border:1px  solid #C1DAD7;" >
			<ul>
				<li>
					<table  border="10" cellspacing="0" cellpadding="0" width="100%" >
						<tr >
							<td  class="rightText" >组名：</td>
							<td >
							<input type="text" class="inputfrom"
								id="model.groupName" name="model.groupName"> <i class="warn">*</i>
							<input type="button" id="ni" value="选择" class="scbtn" 
							 onclick="choiceTeacher('选择单位','UnitService_openchoiceTeacher.action','1000','510')"/>
        		              <a href="#" style="font-size: 12px;" onclick="openTeacher()">添加</a>
							</td>
						</tr>
				<!-- 
				<li>
			     <label>指派单位</label>
			     <input type="text" id="una" readonly="readonly" name="unitName" class="dfinput1"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			     <input type="button" id="ni" value="选择" class="scbtn" onclick="choiceTeacher('选择单位','UnitService_openchoiceTeacher.action','1000','510')"/>
	             <input type="hidden" id="uia" name="unitString" class="dfinput"/>
	             <i>点击“选择”按钮选择单位</i>
			   </li>
			    -->
                     <tr >
							<td  class="rightText" >组长编号：</td>
							<td ><input type="text" class="inputfrom"
								id="model.groupLeaderId" name="model.groupLeaderId"> <i class="warn">*</i></td>
						</tr>
						 <tr >
							<td  class="rightText" >组长：</td>
							<td >
							 <select class="inputfrom" id="majorName" name="majorName" >
                             <option value=""></option>
                             <s:iterator value="sysTeachers">
                             <option value="${teacherName}" id="">${teacherName}</option>
                             </s:iterator>
                             </select>
        		             <i class="warn">*</i>
        		             </td>
						     </tr>
							  <tr >
							<td  class="rightText" >专业编号：</td>
							<td ><input type="text" class="inputfrom"
								id="model.majorId" name="model.majorId"> <i class="warn">*</i></td>
						</tr>
						 <tr >
							<td  class="rightText" >专业：</td>
							<td >
							 <select class="inputfrom" id="majorName" name="majorName" >
                             <option value=""></option>
                             <s:iterator value="sysMajors">
                             <option value="${majorName}" id="">${majorName}</option>
                             </s:iterator>
                             </select>
        		             <i class="warn">*</i>
        		             </td>
						     </tr>
						      <tr >
							<td  class="rightText" >教室编号：</td>
							<td ><input type="text" class="inputfrom"
								id="model.classRoomId" name="model.classRoomId"> <i class="warn">*</i></td>
						</tr>
						 <tr >
							<td  class="rightText" >教室：</td>
							<td ><input type="text" class="inputfrom"
								id="model.classRoomName" name="model.classRoomName"> <i class="warn">*</i></td>
						</tr>
						 <tr >
							<td  class="rightText" >时间：</td>
							<td >
							<input type="text" class="inputfrom" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="model.replyTime"
								id="model.replyTime" name="model.replyTime"> 
								<i class="warn">*</i></td>
						</tr>
						<!-- 
						<li><label>开始时间</label>
						<input type="text" class="datepicker scinput" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="alarmTime" /></li>
						 -->
						 <!--
						<tr>
							<td  class="rightText" >答辩时间：</td>
							<td ><input type="text" class="inputfrom"
								<fmt:formatDate value="${model.replyTime}"
									pattern="yyyy年MM月dd日  HH时mm分" /> <i class="warn">*</i>
							</td>
						</tr>
						  -->
						<!-- 
						  <tr >
							<td  class="rightText" >答辩时间：</td>
							<td ><input type="text" class="inputfrom"
								id="model.replyTime" name="model.replyTime"> <i class="warn">*</i>
							</td>
						</tr>
						 -->
						 <tr >
							<td  class="rightText" >年度：</td>
							<td ><input type="text" class="inputfrom"
								id="model.year" name="model.year"> <i class="warn">*</i></td>
						</tr>
					</table>
				<li>
					<div style="text-align: center;">
						<input name="" id="submit" type="submit" class="scbtn" value="添加"
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
