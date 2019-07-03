<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>修改专业</title>
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
	        	"model.majorNo":{
	                required:true,
	                remote: {  
		                type: "post",  
		                url: "<%=path %>/sys/major_checkName.action",  
		                data: {  
		                    "model.majorNo": $("#model.majorNo").val()  
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
	            "model.majorName":{
	            	remote: {  
		                type: "post",  
		                url: "<%=path %>/sys/major_checkName.action",  
		                data: {  
		                    "model.majorName": $("#model.majorName").val()  
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
	            "model.staffName":{
	            	remote: {  
		                type: "post",  
		                url: "<%=path %>/sys/major_checkName.action",  
		                data: {  
		                    "model.staffName": $("#model.staffName").val()  
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
	          },
	        messages:{
	        	"model.majorNo":{
	        	required:"请输入专业编号",
	        	rangelength:"长度为2到 20个字或字母",
	        	remote:"该专业编号已存在"
	        	 },
	        	 "model.majorName":{
		            	required:"请输入专业名称",
		            	remote:"该专业已存在",
		            	rangelength:"长度为2到 20个字或字母"
		            },
		            "model.staffName":{
		            	required:"请输入教研室",
		            	remote:"该教研室已存在",
		            	rangelength:"长度为2到 20个字或字母"
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
			    url: '<%=path%>/sys/category_findJsonByDept.action',
				dataType : "json",
				data : {
					"deptNumber" : deptNumber
				},success : function(result) {
					if (result) {
						$("#categoryList").html('');
						$.each(result,function(index,content){
							$("#categoryList").append("<option value='"+content.categoryId+"' >"+content.categoryName+"</option>");   
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
.rightText {text-align: right;width: auto;}
td {padding: 4px;font-size: 14px;}
.warn{color: red;font-size: 25px;}
</style>
</head>
<body style="min-width: 200px">
	<div class="main">
	<fieldset class="layui-elem-field">
  <legend>修改专业</legend>
  <div class="layui-field-box">
		<form action="<%=path%>/sys/major_edit.action"
			method="post" name="form1" id="form1">
			<ul>
				<li>
					<table   border="10" cellspacing="0" cellpadding="0" width="100%">
						<input type="hidden" name="thisId" value="${model.majorId }">
					<tr >
							<td  class="rightText" >学院：</td>
							<td >
	              	<s:select cssClass="dfinput" list="departmentList" 
        		 listKey="deptNumber" listValue="deptName" onchange="onSelect(this);"
        		   value="model.deptNumber"
        		  id="model.deptNumber" name="model.deptNumber"/>		
                  <i class="warn">*</i> </td>
						</tr>
							<tr >
							<td  class="rightText" >大类：</td>
							<td >
        		      <select class="dfinput" id="categoryList" name="model.categoryId" >
               	        		 <s:iterator id="sm" value="categoryList">
               	        		    <option value="${categoryId }" <s:if test="model.categoryId==categoryId">selected="selected"</s:if>>${categoryName }</option>
               	        		    </s:iterator>
               	        		 </select>
                  <i class="warn">*</i> </td>
						</tr>
						<tr >
							<td  class="rightText" >专业名称：</td>
							<td >${model.majorName }<input type="hidden" class="dfinput"
							id="model.majorName" name="model.majorName" value="${model.majorName }"> <i class="warn">*</i></td>	
						</tr>
						<tr >
							<td  class="rightText" >教研室：</td>
							<td >${model.staffName }<input type="hidden" class="dfinput"
							id="model.staffName" name="model.staffName" value="${model.staffName }"> <i class="warn">*</i></td>	
						</tr>
					</table>
				<li>
					<div style="text-align: center;">
						<input name="" id="submit" type="submit" class="scbtn" value="提交"
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
