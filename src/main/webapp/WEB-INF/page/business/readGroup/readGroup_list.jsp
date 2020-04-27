<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>

<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>
<script type="text/javascript" src="<%=path%>/js/business/car/carDel.js"></script>
<script type="text/javascript">
function openAdd(){
	layer.open({
    	type: 2,
    	area: ['85%', '97%'],
    	fix: false, //不固定
		title:'添加分组',
    	maxmin: true,
    	content: '<%=path%>/biz/readGroup_openAdd.action?view=add'
	});
}
//搜索
function openSearch(name){
	$('#form1').submit();
}

</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>
			<li>分组管理</li>
		</ul>
	</div>

	<div class="rightinfo">
		<form id="form1" name="form1"
			action="<%=path%>/biz/carAllot_list.action?resUri=list&view=list&page=${pageResult.page}"
			method="post">
			<div class="formtitle"><span>分组管理列表</span></div>
			
			<div class="place">
		<ul class="placeul" style="font-size: 12px">
			<li class="click" >
	        	<span>  组名</span>：
	        	 <input type="text" class="inputfrom" id="model.groupName"name="model.groupName" placeholder="请输入信息" /> 
				
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


		<table class="tablelist">
			<thead>
				<tr>
					<th>序号</th>
					<th>组名</th>
					<th>组长</th>
					<th>组长编号</th>
					<th>教室</th>
					<th>教室编号</th>
					<th>专业</th>
					<th>专业编号</th>
					<th>答辩时间</th>
					<th>年度</th>
					<th>详情</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>

				<s:iterator id="p" value="pageResult.data" status="pp">
					<tr>
						<td align="center"><s:property value="#pp.count" /></td>
						<td align="center">${model.groupName}</td>
						<td align="center">${model.teacherName}</td>
						<td align="center">${model.groupLeaderId}</td>
						<td align="center">${model.classRoomName}</td>
						<td align="center">${model.classRoomId}</td>
						<td align="center">${model.majorName}</td>
						<td align="center">${model.majorId}</td>
						<td align="center">${model.replyTime}</td>
						<td align="center">${model.year}</td>
					
						<td align="center"> 
						<a href="javascript:dialog('70%','90%','查看详情信息','<%=path%>/biz/readGroup_list.action?view=detail&model.id=${id }','true', '5%', '15%');">
						<font color="blue"><img src="<%=path%>/images/f06.png" width="10px" />查看详情</font> </a> 
						</td>
					
						<td align="center" width="20%">
						  <a href="javascript:dialog('50%','84%','修改用户信息','<%=path%>/biz/readGroup_openEdit.action?view=edit&thisId=${id }', 'true','20%');">
							      <font color="blue"> <i class="layui-icon">&#xe642;</i>修改</font>
						  </a>&nbsp;&nbsp;&nbsp;
						   <a href="<%=path%>/sys/readGroup_del.action?model.id=${id }"
							target="rightFrame"
							onclick="javascript:if(confirm('确定要删除此信息吗？')){alert('删除成功！');return true;}return false;"><font color="red">删除</font> 
						   </a> 
						   <a href="javascript:dialog('93%','90%','分配教师','<%=path%>/biz/readGroup_select_teacher.action?view=select_teacher&thisId=${id }', 'true','20%');">
							  <font color="blue"> <i class="layui-icon">&#xe642;</i>分配教师</font>
						  </a>&nbsp;&nbsp;&nbsp;
						    <a href="javascript:dialog('50%','84%','分配学生','<%=path%>/biz/readGroup_select.action?view=select&thisId=${id }', 'true','20%');">
							  <font color="blue"> <i class="layui-icon">&#xe642;</i>分配学生</font>
						  </a>&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
			<%@ include file="/WEB-INF/common/pagination.jsp"%>
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
	        url: '<%=path%>/sys/readGroup_del.action',
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

