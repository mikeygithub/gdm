<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>指导分配管理</title>
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
		title:'添加指导分配',
    	maxmin: true,
    	content: '<%=path%>/sys/readGroup_openAdd.action?view=add'
	});
}
 //搜索
    function openSearch(name){
	
    	var type =  $("#selectName").val();
    	var nameValie = "";
    	if(type==1){
    		nameValie = "model.className";
    	}
    	$("#selectValue").attr("name",nameValie);
    }

</script>


<!--二级联动，开始 -->
<!-- <script type="text/javascript">
    $(document).ready(function(){
        $("#stu").hide();
	});
	
</script>  -->
<!--二级联动，结束 -->




<style >
</style>
</head>
<body>
		<div class="place">
		<span>位置：</span>
		<ul class="placeul">
		<li><a href="<%=path %>/sys/Home_home.action">首页</a></li>
		<li>指导分配管理</li>
		</ul>
		</div>
		<div class="rightinfo">
			<div class="formtitle">
				<span>指导老师分配管理</span>
			</div>
        <form id="form1" name="form1" action="<%=path%>/biz/readGroup_list.action?view=list&page=${pageResult.page}" method="post">
        	<div class="tools">
             <ul class="toolbar">
        		<li class="click">
	        		<button style="background: none;line-height: 35px;margin-left: 4px;"
	        		        type="submit" ><img src="<%=path%>/images/search.png"  />搜索</button>
				</li>
             </ul>
        	</div>
       </form>
        <table class="tablelist" align="right">
    	  <thead>
	    	<tr>
	    	<th>序号</th>
	   		<th>老师</th>
	   		<th>工号</th>
	   		<th>状态</th>
	        </tr>
         </thead>
         <tbody>
        
				<s:iterator id="p" value="pageResult1.data" status="pp">
					<tr id="tr_${id}">
						<td align="center"><s:property value="#pp.count" /></td>
						<td align="center" >${teacherName}</td>
						<td align="center" >${teacherId}</td>
						<td align="center" width="20%">
							<%-- <a  href="<%=path%>/sys/readGroup_openEdit.action?view=edit&thisId=${id }&resUri=openEdit', 'true','20%');"> --%>
							     <a href="javascript:void(0)"
						    	target="rightFrame" onclick="option(this,'${teacherId}' );">  
							      <font color="green"> <i class="layui-icon">&#xe618;</i>可选</font></a>&nbsp;&nbsp;&nbsp;
							    <!--   <font color="red"> <i class="layui-icon">&#x1006;</i>不可选</font></a>&nbsp;&nbsp;&nbsp; -->
						</td>
						<!-- <td align="center" width="20%">
							<a href="<%=path%>/biz/readGroup_addGroupTeacher.action?view=select_teacher&thisId=${id }">
							      <font color="green"> <i class="layui-icon">&#xe618;</i>可选测试</font></a>&nbsp;&nbsp;&nbsp;
						</td>
						 -->
					</tr>
				</s:iterator>
	     </tbody>
      </table>
<%@ include file="/WEB-INF/common/pagination.jsp"%>
<%-- <%@ include file="/WEB-INF/page/system/readGroup/readGroup_stulist.jsp"%> --%>




</div>

<div class="rightinfo" id="stu">
			<div class="formtitle">
				<span>已分配老师</span>
			</div>
        <table class="tablelist" >
    	  <thead>
	    	<tr>
	    	<th>序号</th>
	   		<th>老师</th>
	   		<th>操作</th>
	        </tr>
         </thead>
         <tbody>
				<s:iterator id="p" value="groupTeacherList" status="pp">
				
					<tr id="tr_${id}">
						<td align="center"><s:property value="#pp.count" /></td>
						
						<td align="center" >${teacherName}</td>
						<td align="center" width="20%">
							<a href="<%=path%>/biz/groupTeacher_del.action?view=list&thisId=${id }', 'true','20%');">
							      <font color="red"> <i class="layui-icon">&#x1006;</i>移除</font></a>&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</s:iterator>
	     </tbody>
      </table>
<%-- <%@ include file="/WEB-INF/common/pagination.jsp"%> --%>
<%-- <%@ include file="/WEB-INF/page/system/readGroup/readGroup_stulist.jsp"%> --%>




</div>



<script type="text/javascript">
//选择教师
function option(name,teacherId){
	var re=$(name).parent().parent();
	if(confirm("您确定要选择该老师吗?")){
		var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/biz/readGroup_addGroupTeacher.action',
	       
					dataType : "json",
					data : {
						"teacherId" : teacherId
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
