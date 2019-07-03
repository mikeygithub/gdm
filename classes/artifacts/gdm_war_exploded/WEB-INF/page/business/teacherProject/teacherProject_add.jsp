<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>添加研究方向</title>
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
  <legend>添加研究方向</legend>
  <div class="layui-field-box">
		<form action="<%=path%>/biz/teacherProject_add.action?view=add"
			method="post" name="form1" id="form1" style="border:1px  solid #C1DAD7;" >
			<ul>
				<li>
					<table  border="10" cellspacing="0" cellpadding="0" width="100%">
						<tr >
							<td  class="rightText" >课题名称：</td>
							<td ><input type="text" class="inputfrom"
								id="model.projectName" name="model.projectName"> <i class="warn">*</i></td>
						</tr>
						<tr >
							<td  class="rightText" >课题类型：</td>
							<td >
					             <s:iterator id="p" value="issueTypeList" status="sp">
									<input type="checkbox" name="issueTypeList[${sp.count-1 }].issueTypeId" value="${issueTypeId}"  
									<s:if test="model.projectType.contains(\"&\"+issueTypeId+\"&\")">checked="checked"</s:if>>
									${issueTypeName }&nbsp; 
							     </s:iterator>
			                </td>
						</tr>
						<tr >
							<td  class="rightText" >课题描述：</td>
							<td >
								<textarea name="model.projectDescrib" cols="" rows="" class="textinput"></textarea>
							</td>
						</tr>
						<tr >
							<td  class="rightText" >最多可选人数：</td>
							<td ><input type="text" class="inputfrom"
								id="model.maxChoose" name="model.maxChoose"> <i class="warn">*</i></td>
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
