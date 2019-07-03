<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>成员管理</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/closeDialog.js"></script>
</head>
<body style="min-width: 200px">

<div class="main">
  <form action="<%=path%>/sys/sysRole_edit.action?view=edit"
			method="post" name="form1" id="form1" >
			<ul>
				<li>
				<h1 style="font-size: 20px;">角色名称：<i class="layui-icon">&#xe612;</i>
				<i style="font-size: 20px;color: #3EAFE0;" >${model.roleName }</i>
				<a href="javascript:void(0)" target="rightFrame" style="float: right;" 
				onclick="addUser(this,'学生',1);">
							 <font color="green"> <i class="layui-icon">&#xe654;</i>添加角色给所有学生用户</font></a><p>
			   <a href="javascript:void(0)" target="rightFrame" style="float: right;" 
				onclick="addUser(this,'办公',2);">
							 <font color="green"> <i class="layui-icon">&#xe654;</i>添加角色给所有老师用户</font></a>
							 </h1>
				</li>
				<li>
					<table class="layui-table">
						<colgroup>
							<col width="150">
							<col width="200">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" id="checkall" name="checkall" />序号 </th>
								<th>用户名称</th>
								<th>所在部门</th>
								<th>联系方式</th>
								<th>用户类型</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<s:iterator id="p" value="pageResult1.data" status="pp">
					<tr id="tr_${id}">
					  <td ><input type="checkbox" name="deleteList"
							value="${id }" /><s:property value="#pp.count" /></td>
								<td>${userName }</td>
						       <td >${department.deptName }</td>
						       <td >${tel}</td>
						        <td >
						<s:if test="userType==1">学生用户</s:if> 
						<s:if test="userType==2">办公用户 </s:if>
						<s:if test="userType==3">管理员 </s:if>
						</td>
						<td ><a href="javascript:void(0)"
							target="rightFrame" onclick="del(this,'${userName }',${id});"> <font
								color="red"> <i class="layui-icon">&#xe640;</i>移除
							</font></a></td>
							</tr>
						</s:iterator>
						</tbody>
					</table>
			</ul>
		</form>
<div> <a
			class="layui-btn layui-btn-radius  layui-btn-small  layui-btn-danger"
			href="javascript:void();" onclick="DelSelect();"> <font> <i
				class="layui-icon">&#xe640;</i>移除选中
		</font></a>
	</div>
	<%@ include file="/WEB-INF/common/pagination1.jsp"%>
	<script type="text/javascript">
	//全选
	$("#checkall").click(function() {
		$("input[name='deleteList']").each(function() {
			if (this.checked) {
				this.checked = false;
			} else {
				this.checked = true;
			}
		});
	});
	//单个移除
function del(name, user,id) {
		layer.confirm("您确定要移除 "+user+" 用户吗?", {icon: 0, title:'提示'}, function(index){
			 layer.close(index);
			submit(id+",");});
	  }
//批量移除
function DelSelect(){
	var ids = "";
	var Checkbox=false;
	 $("input[name='deleteList']").each(function(index,content){
	  if (this.checked==true) {		
		Checkbox=true;	
		ids =ids+$(this).val()+","; 
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要移除选中的用户吗？");
		if (t==false) return false;	
		submit(ids);
	}
	else{
		alert("请选择您要移除的内容!");
		return false;
	}
}
function submit(ids){
	var index = layer.load(1); //换了种风格
	$.ajax({
	        type: "post",
	        url: '<%=path%>/sys/sysRole_removeUser.action',
	          dataType : "json",
	          data : {
	            	"thisIds" : ids,thisId:${model.id}
	        },
	success : function(result) {
		//关闭
		layer.close(index);   
		if (result) {
			layer.msg('移除成功', {icon: 1});
			$("input[name='deleteList']").each(function(index,content){
				  if (this.checked==true) {		
					$(this).parent().parent().remove();
				  }
				});
			location.reload();
		}else{
			layer.msg('移除失败', {icon: 2});
		}
	},
	error : function(result) {
		//关闭
		layer.close(index);   
		layer.msg('移除失败', {icon: 2});
	}
});
}

//单个移除
function addUser(name, user,id) {
	
		layer.confirm("添加 ${model.roleName} 角色给所有 "+user+" 用户？", {icon: 0, title:'提示'}, function(indx){
			 layer.close(indx);
			var index = layer.load(1); //换了种风格
			$.ajax({
			        type: "post",
			        url: '<%=path%>/sys/sysRole_addRoleToAllUser.action',
			          dataType : "json",
			          data : {
			            	"userType" : id,thisId:${model.id}
			        },
			success : function(result) {
				//关闭
				layer.close(index);   
				if (result) {
					layer.msg('添加成功', {icon: 1}); 
					$("input[name='deleteList']").each(function(index,content){
						  if (this.checked==true) {		
							$(this).parent().parent().remove();
						  }
						});
					location.reload();
				}else{
					layer.msg('添加失败', {icon: 2}); 
				}
			},
			error : function(result) {
				//关闭
				layer.close(index);   
				layer.msg('添加失败', {icon: 2});
			}
		});
	  });
}
</script>	

</div>

</body>
</html>
