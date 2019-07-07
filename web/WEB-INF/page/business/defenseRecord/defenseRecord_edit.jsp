<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>修改答辩记录</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/ueditor/themes/default/css/ueditor.css" type="text/css" />

<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/third/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="<%=path%>/third/ueditor/ueditor.all.js"></script>



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
	        	if(confirm("是否要保存信息？")){
		              form.submit();   //提交表单
		              var index = layer.load(2, {time: 10*1000}); //又换了种风格，并且设定最长等待10秒 
		        	}
	        },   
	        rules:{},
	        messages:{},
	        errorPlacement: function(error, element) { //错误信息位置设置方法
				error.appendTo( element.parent() ); //这里的element是录入数据的对象
			}
	    });    
	});
	 
	 $(function(){
	     var flag="${mark}";
	     if(flag!='' && flag!=undefined){
	    	 if(flag=="1"){
	        layer.msg('保存成功',{icon:1});
	        setTimeout(function(){
	        },1000);
	     }else if(flag=="0"){
	     layer.msg('保存失败',{icon:2});
	     }
	    }
	});
	 
	  function getData(){
		   $("#defenseContent").val(getCon());
	   }
	 layui.use('form', function(){
		  var form = layui.form();
		});
</script>

<style type="text/css">
.rightText {text-align: right;width: 120px;;}
td {padding: 4px;font-size: 14px;font-size: 14px;border: 1px  solid #C1DAD7;}
.inputfrom{width: 78%;height: 40px;border: 1px  solid #C1DAD7;font-size: 14px;}
.title{height: 40px;}
.warn{color: red;font-size: 25px;}
.textinput{border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df; background:url(../images/inputbg.gif) repeat-x; padding:10px; width:504px; height:135px; line-height:20px; overflow:hidden;}
</style>
</head>
<body style="min-width: 200px;">
<div class="rightinfo" style=" width: 980px;margin: 0 auto;">
	<fieldset class="layui-elem-field">
    <legend>答辩记录</legend>	
    <div class="layui-field-box" >
    		<div class="formtitle" style="float:right;">
			<ul>
				<li class="line"> <a href="<%=path%>/biz/defenseRecord_outDefenseRecord.action?thisId=${model.defenseId }">
				<font> <img src="<%=path%>/images/i01.png" width="20px" />一键导出</font></a></li>
			</ul>
		</div>
		<form action="<%=path%>/biz/defenseRecord_edit.action?view=list&tabFlag=03&flag=11"
			method="post" name="form1" id="form1"  >
			<input name="thisStuId" type="hidden" value="${thisStuId }">
			<input type="hidden" name="thisYear" value="${thisYear }">
			<input type="hidden" name="thisId" value="${thisId}">
			<ul>
				<li>
					<table  border="10" cellspacing="0" cellpadding="0" width="100%"
						>
						<tr  class="title">
						<td  class="rightText" >学院：</td>
							<td >${student.deptName } 
               	         </td>
               	         <td  class="rightText" >专业：</td>
							<td > 
               	        		${student.majorName }
               	        	 </td>
							 <td  class="rightText" >班级：</td>
							 <td>
               	        		${student.className }
               	        		 </select>
               	        		 </td>
						</tr>
						
						<tr class="title">
							<td  class="rightText">学号：</td>
							<td >${student.stuNo }</td>
							<td  class="rightText" >姓名：</td>
							<td >${student.stuName }</td>
							<td  class="rightText" >指导 老师：</td>
							<td >${teacher.teacherName }</td>
						</tr> 
						<tr class="title" >
							<td  class="rightText">题目：</td>
							<td colspan="10">
							${issueInfo.issueName }
        		  		   </td>
        		  			</tr>
						<tr >
						<tr class="title">
							<td colspan="10" style="padding-top: 40px;">答辩记录：</td>
						</tr>
						<tr>
						<td colspan="10">
							<div >
							<textarea id="defenseContent"name="model.defenseContent" cols="" rows="" class="textinput"style="width: 100%">${model.defenseContent}</textarea>
							</div>
							</td>
							</tr>
					</table>
					</li>
						<li>
					<div style="text-align: center;">
								<input name="" id="submit" type="submit" class="scbtn"
									value="保存" onClick="getData();" />
					</div>
				</li>
			</ul>
		</form>
  </div>
</fieldset>
	</div>

</body>
</html>
