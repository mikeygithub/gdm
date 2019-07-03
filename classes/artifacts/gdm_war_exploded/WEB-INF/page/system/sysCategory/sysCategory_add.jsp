<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>添加大类</title>
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
  <legend>添加大类</legend>
  <div class="layui-field-box">
		<form action="<%=path%>/sys/category_add.action?view=add"
			method="post" name="form1" id="form1" style="border:1px  solid #C1DAD7;" >
			<ul>
				<li>
					<table  border="10" cellspacing="0" cellpadding="0" width="100%"
						>
							<tr >
							<td  class="rightText" >学院：</td>
							<td >
	              	<s:select cssClass="inputfrom" list="departmentList" 
        		 listKey="deptNumber" listValue="deptName" 
        		  id="model.deptNumber" name="model.deptNumber"/>		
                  <i class="warn">*</i> </td>
						</tr>
						<tr >
							<td  class="rightText" >大类编号：</td>
							<td ><input type="text" class="inputfrom"
								  id="model.categoryId" name="model.categoryId"><i class="warn">*</i></td>
						</tr> 
						<tr >
							<td  class="rightText" >大类名称：</td>
							<td ><input type="text" class="inputfrom"
							id="model.categoryName" name="model.categoryName"> <i class="warn">*</i></td>	
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
