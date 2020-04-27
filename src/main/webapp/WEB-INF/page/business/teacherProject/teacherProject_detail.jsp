<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>我的导师的课题</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />

<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>
<script type="text/javascript" src="<%=path%>/datePicket/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/closeDialog.js"></script>

<script type="text/javascript">

     $(function() {
		$("#form1").validate({
			errorClass : "errorInfo", //默认为错误的样式类为：error
			errorElement : "em",
			focusInvalid : false, //当为false时，验证无效时，没有焦点响应  
			onkeyup : false,
			submitHandler : function(form) { //表单提交句柄,为一回调函数，带一个参数：form
				form.submit(); //提交表单
				var index = layer.load(2, {
					time : 10 * 1000
				}); //又换了种风格，并且设定最长等待10秒 
			},
			rules : {
				"model.year" : {
					required : true
				},
			},
			messages : {
				"model.year" : {
					required : "请选择年度"
				},
			},
			errorPlacement : function(error, element) { //错误信息位置设置方法
				error.appendTo(element.parent()); //这里的element是录入数据的对象
			}
		});
	});

   function openAdd(){
		layer.open({
	    	type: 2,
	    	area: ['50%', '84%'],
	    	fix: false, //不固定
			title:'添加课题',
	    	maxmin: true,
	    	content: '<%=path%>/biz/teacherProject_openAdd.action?view=add'
		});
   }
	//搜索
	function openSearch(name){
		$('#form1').submit();
	}
</script>
<style >
</style>
</head>
<body>
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li><a href="<%=path %>/sys/Home_home.action">首页</a></li>
				<li>选择导师课题</li>
			</ul>
		</div>
		<div class="rightinfo">
			<div class="formtitle">
				<span>我的导师的课题信息</span>
			</div>
        <form id="form1" name="form1" action="<%=path%>/biz/teacherProject_detail.action?view=detail" method="post">
       	 	<input name="thisStuId" id="thisStuId" type="hidden"  value="${student.stuId }">
			<input name="thisYear" id="thisYear" type="hidden"  value="${planYear.year }" >	
			<div class="place">
				<table border="10" cellspacing="0" cellpadding="0" width="100%">
					<tr>
						<td align="center" width="100px">当前年度：</td>
						<td width="20px"><input class="dfinput" type="text"
							id="model.year" name="model.year" readonly
							value="${model.year}" style="text-align: center;"
							onClick="WdatePicker({dateFmt:'yyyy'});"></td>
						 <td align="center" width="140px"><input type="button" name=""
							class="btn" value="查询" onclick="$('#form1').submit()" /></td>
							<td align="center" ></td>
					</tr>
				</table>
			</div>
        </form>
        <table class="tablelist" >
	    	<thead>
	    	<tr>
	    	<th>序号</th>
	    	<th>课题名称</th>
	   		<th>课题类型</th>
	   		<th>课题描述</th>
	   		<th>学生名称</th>
	   		<th>已选课题人数</th>
	   		<th>最多可选人数</th>
	   		<th>剩余</th>
	   		<th>年度</th>
	   		<th>操作</th>
	        </tr>
	        </thead>
	        <tbody>
					<s:iterator id="p" value="teacherProjectList" status="pp">
						<tr id="tr_${projectId}">
							<td align="center"><s:property value="#pp.count" /></td>
							<td align="center" > <font color="blue">${projectName}</font></td>
							<td align="center" >
							    <s:if test="projectType=='&3&_'">应用研究</s:if>
								<s:if test="projectType=='&2&_'">应用基础</s:if>
								<s:if test="projectType=='&1&_'">基础研究</s:if> 
							</td>
							<td align="center" >${projectDescrib}</td>
							<td align="center" >${stuNames}</td>
							<td align="center" >${alreadyChoose}</td>
							<td align="center" >${maxChoose}</td>
							
							<td align="center" >${maxChoose-alreadyChoose} </td>
					        <td align="center" >${year}</td>
					        
					        <td align="center" width="20%">
						        <s:if test="state == 1">
			                        <a href="javascript:void(0)"
							    	    target="rightFrame" onclick="option(this,'${projectId}' ,'${projectName}');">  
								        <font color="blue" id="canChoose"> <i class="layui-icon">&#xe618;</i>可选</font></a>
							    </s:if>
							    <s:elseif test="state == 2">
							        <font color="red">不可选 </font>
							    </s:elseif>
							    <s:elseif test="state == 3">
							        <a href="javascript:void(0)"
							    	    target="rightFrame" onclick="del(this,'${projectId}');"> 
							            <font color="red" id="delChoose"><i class="layui-icon">&#x1006;</i>退选</font></a>
							    </s:elseif>
							    <s:elseif test="state == 4">
							        <font color="red">已选完</font>
							    </s:elseif>
							</td>
						</tr>
					</s:iterator>
					</tbody>
             </table>
</div>
<script type="text/javascript">
//选择老师课题
function option(name,projectId,projectName){
	var thisStuId = $("#thisStuId").val();
	var url = "<%=path%>/biz/issueInfo_findByStuId.action";
	var isChoose = false; //判断该学生是否已选题
	$.post(url,{"thisStuId":thisStuId,"thisProjectId":projectId},function(data){
	    var data=eval("(" + data + ")");
	    if(data.isFind == true){
			if(data.maxChoose <= data.alreadyChoose){
				layer.alert('已选课题:'+projectName+'不能再选其他课题！',{icon: 3});
			}else { 
				layer.confirm('你确定选择 '+projectName+'  作为你的毕业设计课题吗?', {icon: 3, title:'提示'}, function(index){
					layer.close(index);
				    var index = layer.load(1);
				    $.ajax({
				        type: "post",
				        cache: false,
				        url: '<%=path%>/biz/issueInfo_addTeacher.action',
								dataType : "json",
								data : {
									"thisProjectId" : projectId
									,"thisStuId" : $("#thisStuId").val()
									,"thisYear" : $("#thisYear").val()
									,"issueName":projectName
									,"issueType":data.projectType
									,"thisAlreadyChoose":data.alreadyChoose
									,"thisStuIds":data.stuIds
									,"ownOrChoose":1
								},success : function(result) {
								    alert(result);
									layer.close(index); 
									if (result) {
										layer.alert('选择课题成功',{icon: 1},function(){
											 location.reload();
											});
									    $("#canChoose").attr("color","red");
									    $("#canChoose").html("");
											
									}else{
										layer.msg('选择课题失败',{icon: 2});
									}
								},
								error : function(result) {
									layer.close(index); 
									layer.msg('选择课题失败',{icon: 2});
								}
							});
				    });
			 } 
		}else{
		    layer.alert('你已有课题，不能再选其他课题',{icon: 3});
		}
	});


}
		
//删除已选导师课题
function del(name,projectId){
	var re=$(name).parent().parent();
	layer.confirm('您确定要退选该课题吗?', {icon: 3, title:'提示'}, function(index){
		 layer.close(index);
		 var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/biz/issueInfo_del.action',
					dataType : "json",
					data : {
						"thisProjectId" : projectId
						,"stuId" : $("#thisStuId").val()
					},success : function(result) {
						layer.close(index); 
						if (result) {
							re.remove();
							layer.alert('退选成功',{icon: 1},function(){
								 location.reload();
								});
						}else{
							layer.msg('退选失败',{icon: 2});
						}
					},
					error : function(result) {
						layer.close(index); 
						layer.msg('退选失败',{icon: 2});
					}
				});
});
}
</script>
</body>
</html>
