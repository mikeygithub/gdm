<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>添加班级</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />

<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>


<script type="text/javascript">
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
 

 $(function(){
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
            "model.className":{
            	required:true,
            	rangelength:[2,20]
            },
        },
        messages:{
        	 "model.className":{
	            	required:"请输入班级名称",
	            	rangelength:"长度为2到 20个字或字母"
	            },
        },
        errorPlacement: function(error, element) { //错误信息位置设置方法
			error.appendTo( element.parent() ); //这里的element是录入数据的对象
		}
    });    
});
 
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
.rightText {text-align: right;}
td {padding: 4px;font-size: 14px;}
.warn{color: red;font-size: 25px;}
</style>
</head>
<body style="min-width: 200px">
	<div class="main">
	<fieldset class="layui-elem-field">
  <legend>添加班级</legend>
  <div class="layui-field-box">
		<form action="<%=path%>/sys/classes_add.action?view=add"
			method="post" name="form1" id="form1" >
			<ul>
				<li>
					<table  border="10" cellspacing="0" cellpadding="0" width="100%">
						<tr >
							<td  class="rightText" >学院名称：</td>
							<td >	<s:select cssClass="dfinput" list="departmentList" 
        		            listKey="deptNumber" listValue="deptName"  onchange="onSelect(this);"
        		            name="deptNumber"
        		         />	
        		  		</td>
						</tr>
						<tr >	
							<td  class="rightText" >专业名称：</td>
							<td > 
               	        		 <select class="dfinput" id="majorList" name="model.majorId">
               	        		 <s:iterator id="sm" value="sysMajorList">
               	        		    <option value="${majorId }" >${majorName }</option>
               	        		    </s:iterator>
               	        		 </select><i class="warn">*</i>
               	        		 </td>
						</tr>
						<!-- <tr >
							<td  class="rightText" >班级编号：</td>
							<td ><input type="text" class="dfinput"
								id="model.classNo" name="model.classNo"> <i class="warn">*</i></td>
						</tr> -->
						<tr >
							<td  class="rightText" >班级名称：</td>
							<td ><input type="text" class="dfinput"
								id="model.className" name="model.className" > <i class="warn">*</i></td>
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
