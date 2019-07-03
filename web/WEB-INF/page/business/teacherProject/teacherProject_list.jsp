<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>导师课题信息管理</title>
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
<li>导师课题管理</li>
</ul>
</div>
		<div class="rightinfo">
			<div class="formtitle">
				<span>导师课题管理</span>
			</div>
        <form id="form1" name="form1" action="<%=path%>/biz/teacherProject_list.action?view=list&page=${pageResult.page}" method="post">
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
        	 	
          <div class="place" >
		      <ul class="placeul" style="font-size: 12px">
        			<li class="click" >
        			   <span>更多条件</span>：<input type="text" class="dfinput" id="model.projectName" name="model.projectName"
        		          placeholder="请输入信息" style="line-height: 18px;" >
        			</li>
	        		<li class="click">
		        		<a href="javascript:void();"  onclick="openSearch(this);"><img src="<%=path%>/images/search.png"  />搜索</a>
					</li>
					
					<li class="click">
	        		    <a href="#" onclick="openAdd()"><img src="<%=path%>/images/t01.png"  style="width: 16px;"/>添加</a>
				   </li>
		     </ul>
		</div>
     </form>
        <table class="tablelist" >
    	<thead>
    	<tr>
    	<th>序号</th>
    	<th>课题名称</th>
   		<th>课题类型</th>
   		<th>课题描述</th>
   		<th>已选的学生</th>
   		<th>已选课题人数</th>
   		<th>最多可选人数</th>
   		<th>年度</th>
   		<th>操作</th>
        </tr>
        </thead>
        <tbody>
				<s:iterator id="pr" value="pageResult.data" status="pp">
					<tr id="tr_${projectId}">
						<td align="center"><s:property value="#pp.count" /></td>
						<td align="center" >${projectName}</td>
						<td align="center" >
					      <%--  <s:iterator id="p" value="issueTypeList" status="sp">
								<input type="checkbox" name="issueTypeList[${sp.count-1 }].issueTypeId" value="${issueTypeId}"  
								<s:if test="pr.projectType.contains(\"&\"+issueTypeId+\"&\")">checked="checked"</s:if>>
								${issueTypeName}&nbsp; 
						    </s:iterator> --%>
							<s:if test="projectType=='&3&_'">应用研究</s:if>
							<s:if test="projectType=='&2&_'">应用基础</s:if>
							<s:if test="projectType=='&1&_'">基础研究</s:if>    
						</td>
						<s:if test="projectType.contains(\"&\"1\"&\")">123456</s:if>
						<td align="center" >${projectDescrib}</td>
						<td align="center" >${stuId}</td>
						<td align="center" >${alreadyChoose}</td>
						<td align="center" >${maxChoose}</td>
				        <td align="center" >${year}</td>
				        
						<td align="center" width="20%">
							<a href="javascript:void(0)"
							target="rightFrame" onclick="del(this,${projectId});"> <font
								color="red"> <i class="layui-icon">&#xe640;</i>删除
							</font></a>
								<a 
							      href="javascript:dialog('50%','84%','修改课题','<%=path%>/biz/teacherProject_openEdit.action?view=edit&thisId=${projectId }', 'true','20%');">
							      <font color="blue"> <i class="layui-icon">&#xe642;</i>修改</font></a>&nbsp;&nbsp;&nbsp;
								</td>
					</tr>
				</s:iterator>
				</tbody>
</table>

</div>

<script type="text/javascript">
//单个删除
function del(name,id){
	var re=$(name).parent().parent();
	if(confirm("您确定要删除吗?")){
		var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/biz/teacherProject_del.action',
					dataType : "json",
					data : {
						"thisId" : id
					},success : function(result) {
						layer.close(index); 
						if (result) {
							re.remove();
							alert('删除成功');
						}else{
							alert('删除失败');
						}
					},
					error : function(result) {
						layer.close(index); 
						alert('删除失败');
					}
				}
				);
			}
		}
</script>
</body>
</html>
