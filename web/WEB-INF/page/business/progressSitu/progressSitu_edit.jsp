<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>修改进度情况</title>
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
<script type="text/javascript" src="<%=path%>/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>
<script type="text/javascript" src="<%=path%>/datePicket/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/js/select-ui.min.js"></script>




<script type="text/javascript"> 
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
		  // var form = layui.form();
		 var form = layui.form;
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

<form id="form1" name="form1"  action="<%=path%>/biz/issueInfo_info.action?view=info&page=${pageResult.page}" method="post">
        	<div class="place">
		<ul class="placeul">
		<li><span>院系：</span>${deptName }</li>
					<li>当前年度：
					<input class="dfinput" type="text"
						id="issueInfo.year" name="thisYear" readonly value="${model.year}"
						style="text-align: center;"
						onClick="WdatePicker({dateFmt:'yyyy'});"></td>
				</li>
				<li class="click">
	        		<a href="javascript:void();"  onclick="openSearch(this);"><img src="<%=path%>/images/search.png"  />搜索</a>
				</li> 
		</ul>
		</div>
     </form>

    <div class="formbody">
      <div id="usual1" class="usual"> 
       <%@ include file="/WEB-INF/page/business/materialInfo/select_tab.jsp"%>
   <div id="tab2" class="tabson">

	<div class="main">
	<fieldset class="layui-elem-field">
    <legend>进度情况信息</legend>
    <div class="layui-field-box">
		<form action="<%=path%>/biz/progressSitu_edit.action?view=edit" 
			method="post" name="form1" id="form1" style="border:1px  solid #C1DAD7;" >
			<input name="model.progressId" type="hidden"  value="${model.progressId }">
			<ul>
				<li>
					<table  border="10" cellspacing="0" cellpadding="0" width="100%">						
						<td  class="rightText" >学生姓名：</td>
							<td style="font-size: 16px;padding: 4px;color: #3EAFE0;"><input type="text" class="inputfrom"
								id="model.stuId" name="model.stuId" value="${model.stuId }"> </td>
								
						<tr>
							<td  class="rightText"  >时间：</td>
							<td style="font-size: 16px;padding: 4px;color: #3EAFE0;">
							<input type="text" class="inputfrom" 
								id="model.progressTime" name="model.progressTime" value="${model.progressTime }"> </td>
						</tr>
								
						<tr >
							<td  class="rightText" >工作要求：</td>
							<td ><textarea type="text" class="textareafrom"
								id="model.progressWork" name="model.progressWork" > ${model.progressWork }</textarea></td>
						</tr>	
						
						<tr >
							<td  class="rightText" >进程记录：</td>
							<td ><textarea type="text" class="textareafrom"
								id="model.progressRecord" name="model.progressRecord" >${model.progressRecord } </textarea></td>
						</tr>			
					
					</table>
				<li>
					<div style="text-align: center;">
						<input name="" id="submit" type="submit"  class="scbtn" value="修改"
							 />
					</div>
				</li>
			</ul>
		</form>
  </div>
</fieldset>
	</div>
	</div>
	</div>
</div>
</body>
</html>
