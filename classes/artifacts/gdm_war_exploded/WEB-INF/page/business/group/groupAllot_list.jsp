<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>分组管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>

<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/datePicket/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>
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
			<li><a href="<%=path%>/Userlogin.action" target="_parent">首页</a></li>
			<li><a href="<%=path%>/biz/Group_list.action?view=student_list">选择老师分组</a></li>
			<li>分组管理</li>
		</ul>
	</div>

	<div class="rightinfo">
		<form id="form1" name="form1"
			action="<%=path%>/biz/GroupAllot_list.action?resUri=list&view=list&page=${pageResult.page}&groupType=${groupType}" method="post">
			<div class="formtitle">
			   <span><s:if test="groupType==00">答辩组</s:if>
					<s:if test="groupType==01">大组</s:if>管理列表</span>
			   </div>
			<div class="place">
				<ul class="placeul" style="font-size: 12px">
				<li>当前年度：
					<input class="dfinput" type="text"
						id="model.year" name="model.year" readonly value="${model.year}"
						style="text-align: center;"   onchange="$('#form1').submit();" 
						onClick="WdatePicker({dateFmt:'yyyy'});"></td>
				</li>
					<li class="click" >
			        	<span>组名</span>：
			        	<input type="text" class="dfinput" id="model.groupName"name="model.groupName" placeholder="请输入信息" /> 
			        </li>		
		        	<li class="click">
			        	<a href="javascript:void();"  onclick="openSearch(this);"><img src="<%=path%>/images/search.png"  />搜索</a>
					</li>
					<li>
		                <a href="<%=path%>/biz/GroupAllot_exportGroupByExcel.action?">
									<font color="green"> <img src="<%=path%>/images/i01.png" width="20px" />按专业导出分组</font>
						</a>					
					</li>
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
					<th>记录员</th>
					<th>评阅老师</th>
					<th>答辩方向</th>
					<th>组别</th>
					<th>已分配学生人数</th>
					<th>教室</th>
					<th>答辩时间</th>
					<th>年度</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator id="p" value="pageResult.data" status="pp">
					<tr>
						<td align="center"><s:property value="#pp.count" /></td>
						<td align="center">${groupName }</td>
						<td align="center">
						<s:iterator id="" value="teacherList">
						   <s:if test="type==0">${teacherName }</s:if>
						 </s:iterator>
						</td>
						<td align="center">
						<s:iterator id="" value="teacherList">
						   <s:if test="type==2">${teacherName }</s:if>
						 </s:iterator>
						</td>
						<td align="center">
						<s:iterator id="" value="teacherList">
						   <s:if test="type==1">${teacherName }&nbsp;</s:if>
						 </s:iterator>
						</td>
						<td align="center">
						<s:iterator id="" value="directionList">
						   ${majorName }&nbsp;
						 </s:iterator>
						</td>
						<td align="center">
						<s:if test="groupType==00">答辩组</s:if>
						<s:if test="groupType==01">大组</s:if>
						</td>
						<td align="center">${studentNum}</td>
						<td align="center">${classroomName}</td>
						<td align="center"><fmt:formatDate value="${replyTime}"
								pattern="yyyy年MM月dd日" /></td>
						<td align="center">${year}</td>
						<td align="center" width="20%">
						<a href="javascript:dialog('70%','90%','查看详情信息','<%=path%>/biz/GroupStudent_detailList.action?view=detail_list&thisId=${groupId }','true', '5%', '15%');">
						<font color="blue"><img src="<%=path%>/images/f06.png" width="10px" />查看分组学生</font> 
						</a> 
						 
						  <a href="javascript:dialog('50%','60%','修改用户信息','<%=path%>/biz/GroupAllot_openEdit.action?view=edit&thisId=${groupId }', 'true','20%');">
							      <font color="blue"> <i class="layui-icon">&#xe642;</i>修改</font>
						  </a>&nbsp;&nbsp;&nbsp;
						  <a  href="javascript:void(0);" onclick="del(this,${groupId});">
							    <font color="red"> <i class="layui-icon">&#x1006;</i>删除</font></a>&nbsp;&nbsp;&nbsp;
						  <%--  <a href="<%=path%>/biz/taskBook_outTaskBook.action?thisId=${taskId }">
									<font> <img src="<%=path%>/images/i01.png" width="20px" />导出分组
							</font></a> --%>
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
	var index =  layer.confirm("<br>删除该组会清空该组中的老师和学生信息，您确定要删除吗? ", {icon: 3, title:'提示'}, function(index){
			 layer.close(index);
		var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/biz/GroupAllot_del.action',
					dataType : "json",
					data : {
						"thisId" : id
					},success : function(result) {
						layer.close(index); 
						if (result) {
							re.remove();
							layer.msg('删除成功',{icon: 1});
						}else{
							layer.msg('删除失败',{icon: 2});
						}
					},
					error : function(result) {
						layer.close(index); 
						layer.msg('删除失败',{icon: 2});
					}
				});
			});
		}
</script> 
</body>
</html>

