<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>添加进度情况</title>
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
</script>


<style type="text/css">
.rightText {text-align: left;width: 100px;;}
td {padding: 4px;font-size: 14px;font-size: 14px;}
.inputfrom{width: 78%;height: 40px;border: 1px  solid #C1DAD7;font-size: 14px;}
.textareafrom{width: 78%;height: 100px;border: 1px  solid #C1DAD7;font-size: 16px;}
.title{height: 40px;}
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
						id="issueInfo.year" name="thisYear" readonly value="${thisYear}"
						style="text-align: center;"
						onClick="WdatePicker({dateFmt:'yyyy'});"></td>
				</li>
				<li class="click">
	        		<a href="javascript:void();"  onclick="openSearch(this);"><img src="<%=path%>/images/search.png"  />搜索</a>
				</li> 
		</ul>
		</div>
     </form>
	<div class="main">
	<fieldset class="layui-elem-field">
    <legend>添加进度情况</legend>
    <div class="layui-field-box">
		<form action="<%=path%>/biz/progressSitu_add.action?view=add"
			method="post" name="form1" id="form1" >
					<input name="thisStuId" type="hidden" value="${thisStuId }">
					<input type="hidden" name="thisYear" value="${thisYear }">
			<ul>
				<li>
					<table  border="10" cellspacing="0" cellpadding="0" width="100%"
						>
						<tr class="title">
							<td  class="rightText" >学生姓名：</td>
							<td >${student.stuName }</td>
						</tr> 
						<tr >
							<td  class="rightText">工作要求：</td>
							<td ><textarea class="inputfrom"cols="" rows="" 
								id="model.progressWork" name="model.progressWork"></textarea></td>
        		  			</tr>
        		  		<tr >
							<td  class="rightText">进程记录：</td>
							<td ><textarea class="inputfrom"cols="" rows="" 
								id="model.progressRecord" name="model.progressRecord"></textarea></td>
        		  		</tr>
						<tr >
					</table>
				<li>
					<div style="text-align: center;">
								<input name="" id="submit" type="submit" class="scbtn"
									value="添加"  />
					</div>
				</li>
			</ul>
		</form>
  </div>
</fieldset>
	</div>
</div>
</div>
</body>
</html>
