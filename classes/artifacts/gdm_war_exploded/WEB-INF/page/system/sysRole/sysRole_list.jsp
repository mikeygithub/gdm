<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>部门管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />

<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>

<script type="text/javascript">
function openAdd(){
	layer.open({
    	type: 2,
    	area: ['60%', '80%'],
    	fix: false, //不固定
		title:'添加角色',
    	maxmin: true,
    	content: '<%=path%>/sys/sysRole_openAdd.action?view=add'
	});
}
 $(function(){
	     var flag="${mark}";
	     if(flag!='' && flag!=undefined&&flag=="1"){
	        layer.msg('删除成功', {icon: 1});
	     }else if(flag=="0"){
	     	layer.msg('删除失败', {icon: 2});
	     }
	});

</script>
</head>
<body>
<div class="place">
<span>位置：</span>
<ul class="placeul">
<li><a href="<%=path %>/sys/Home_home.action">首页</a></li>
<li>角色管理</li>
</ul>
</div>
		<div class="rightinfo">
			<div class="formtitle">
				<span>角色信息列表</span>
			</div>
         <div class="place">
		<ul class="placeul" style="font-size: 12px">
		<li class="click" ></li>
        		<li class="click" >
        		<a href="#"  onclick="openAdd()"><img src="<%=path%>/images/t01.png"  style="width: 16px;"/>添加角色</a>
        		</li>
		</ul>
		</div>
        <table class="tablelist" >
    	<thead>
    	<tr>
    	<th>序号</th>
   		<th>角色名称</th>
   		<th>角色描述</th>
   		<th>操作</th>
        </tr>
        </thead>
        <tbody>
				<s:iterator id="p" value="pageResult.data" status="pp">
					<tr id="tr_${id}">
						<td align="center"><s:property value="#pp.count" /></td>
						<td align="center" >${roleName}</td>
						<td align="center" >${description}</td>
						<td align="center" width="20%">
							<div class="layui-btn-group">
							</div> 
							<a 
							href="<%=path%>/sys/sysRole_del.action?view=list&resUri=list&thisId=${id }"
							target="rightFrame"
							onclick="javascript:if(confirm('确定要删除此信息吗？')){alert('删除成功！');return true;}return false;">
							<font color="red"> <i class="layui-icon">&#xe640;</i>删除</font></a> 
								<a 
							      href="javascript:dialog('50%','75%','修改角色信息','<%=path%>/sys/sysRole_openEdit.action?view=edit&thisId=${id }', 'true');">
							      <font color="blue"> <i class="layui-icon">&#xe642;</i>修改</font></a>&nbsp;&nbsp;&nbsp;
								<a 
								 href="javascript:dialog('98%','75%','成员管理','<%=path%>/sys/sysRole_openUserRoleList.action?view=openUserHelp&thisId=${id }', 'true');">
								 <font color="green"> <i class="layui-icon">&#xe654;</i>成员管理</font></a></td>
					</tr>
				</s:iterator>

			</tbody>
</table>
<%@ include file="/WEB-INF/common/pagination.jsp"%>
</div>
<br/>

</body>
</html>
