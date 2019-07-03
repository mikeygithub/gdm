<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>学院管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />


<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>


<script type="text/javascript">
function openAdd(){

	layer.open({
    	type: 2,
    	area: ['50%', '84%'],
    	fix: false, //不固定
		title:'添加用户',
    	maxmin: true,
    	content: '<%=path%>/sys/department_openAdd.action'
	});
}
 //搜索
    function openSearch(name){
	
    	var type =  $("#selectName").val();
    	var nameValie = "";
    	if(type=='1'){
 		nameValie = "model.deptNumber";
 }else if(type=='2'){
		nameValie = "model.deptName";
 }
    	$("#selectValue").attr("name",nameValie);
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
<li>学院管理</li>
</ul>
</div>
		<div class="rightinfo">
			<div class="formtitle">
				<span>学院管理</span>
			</div>
        <form id="form1" name="form1" action="<%=path%>/sys/department_list.action?resUri=list&view=list&page=${pageResult.page}" method="post">
        	
        	 	<div class="place">
		<ul class="placeul" style="font-size: 12px">
			<li class="click" >
	        	<span>更多条件</span>：<s:select cssClass="dfinput" list="#{1:'学院编号',2:'学院名称'}" 
        		headerKey="" headerValue="--请选择---" cssStyle="width: auto;" 
        		 listKey="key" listValue="value"  name="selectName" id="selectName"/>
        		 
        		 <input type="text" class="dfinput" id="selectValue" name=""
        		  placeholder="请输入信息" style="line-height: 18px;"  > 
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
    	<th>学院编号</th>
   		<th>学院名称</th>
   		<th>学院描述</th>
   		
   		<th>操作</th>
        </tr>
        </thead>
        <tbody>
				<s:iterator id="p" value="pageResult.data" status="pp">
					<tr id="tr_${id}">
						<td align="center"><s:property value="#pp.count" /></td>
						<td align="center" >${deptNumber}</td>
						<td align="center" >${deptName}</td>
						<td align="center" >${deptDescription}</td>
						
				
						<td align="center" width="20%">
							<a href="javascript:void(0)"
							target="rightFrame" onclick="del(this,${id});"> <font
								color="red"> <i class="layui-icon">&#xe640;</i>删除
							</font></a>
								<a 
							      href="javascript:dialog('50%','84%','修改学院信息','<%=path%>/sys/department_openEdit.action?thisId=${id }', 'true','20%');">
							      <font color="blue"> <i class="layui-icon">&#xe642;</i>修改</font></a>&nbsp;&nbsp;&nbsp;
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
	        url: '<%=path%>/sys/department_del.action',
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
