<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>修改论文</title>
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
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>



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
	        layer.msg('保存成功',{icon:1});
	        setTimeout(function(){
	        },1000);
	     }else if(flag=="0"){
	     layer.msg('保存失败',{icon:2});
	     }
	    }
	});
	 
   function getData(){
	   $("#taskContent").val(getCon());
	   $("#taskPlanJob").val(getPlan());
	   $("#taskDocument").val(getDocue());
   }
   
	 layui.use('form', function(){
		  var form = layui.form();
		});
</script>
<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
</script>


<style type="text/css">
.rightText {text-align: right;width: 120px;;}
td {padding: 4px;font-size: 14px;font-size: 14px;border: 1px  solid #C1DAD7;}
.inputfrom{width: 78%;height: 40px;border: 1px  solid #C1DAD7;font-size: 14px;}
.title{height: 40px;}
.warn{color: red;font-size: 25px;}
</style>
</head>
<body style="min-width: 200px;">

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

    <div class="formbody">
      <div id="usual1" class="usual"> 
       <%@ include file="/WEB-INF/page/business/materialInfo/select_tab.jsp"%>
   <div id="tab2" class="tabson">

   <div class="rightinfo" style="text-align: center;">
	<fieldset class="layui-elem-field">
    <legend>论文</legend>	
    <div class="layui-field-box" >
    	<%-- 	<div class="formtitle" style="float:right;">
				<ul>
				    <li class="line">
					    <a href="<%= basePath%>/biz/taskBook_uploadTaskBook.action?thisId=${model.taskId }">
					    <font> <img src="<%=path%>/images/ico04.png" width="20px" />论文上传</font></a>
					</li>
					<li class="line"> <a href="<%=path%>/biz/taskBook_outTaskBook.action?thisId=${model.taskId }">
					<font> <img src="<%=path%>/images/i01.png" width="20px" />一键导出</font></a></li>
				</ul>
			</div>
			<form action="<%=path%>/biz/taskBook_edit.action?view=edit"
				method="post" name="form1" id="form1"  >
			
			</form>
        </div> --%>
</fieldset>
	</div>
   </div>
  </div>
</body>
</html>
