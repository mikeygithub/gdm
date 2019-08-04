<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>班级管理</title>
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
function onSelect(name){
	 var deptNumber = function(){return $(name).val();};
$.ajax({
   type: "post",
   url: '<%=path%>/sys/major_findJsonByDept.action',
			dataType : "json",
			data : {
				"deptNumber" : deptNumber
			},success : function(result) {
				if (result) {
					$("#majorList").html('');
					$.each(result,function(index,content){
						$("#majorList").append("<option value='"+content.majorId+"' >"+content.majorName+"</option>");   
						});
				}
			},
			error : function(result) {
				console.log(result);
			}
		}
		);
}

function openAdd(){

	layer.open({
    	type: 2,
    	area: ['30%', '40%'],
    	fix: false, //不固定
		title:'添加用户',
    	maxmin: true,
    	content: '<%=path%>/sys/classes_openAdd.action?view=add'
	});
}
 //搜索
    function openSearch(name){
	
    	var type =  $("#selectName").val();
    	var nameValie = "";
    	if(type=='1'){
    		nameValie = "model.classNo";
    	}else if(type=='2'){
    		nameValie = "model.className";
    	}
    	$("#selectValue").attr("name",nameValie);
    	$('#form1').submit();
    }



</script>
</head>
<body>
		<div class="place">
		<span>位置：</span>
		<ul class="placeul">
		<li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>
		<li>班级管理</li>
		</ul>
		</div>
		<div class="rightinfo">
			<div class="formtitle">
				<span>班级管理</span>
			</div>
        <form id="form1" name="form1" action="<%=path%>/sys/classes_list.action?view=list&page=${pageResult.page}" method="post">
        	
        	 	<div class="place">
		<ul class="placeul" style="font-size: 12px">
	        	<li class="click">
	        	   <span>院系</span>：
        		   <s:select cssClass="dfinput" list="departmentList" headerKey="" headerValue="--请选择---"
	        		 cssStyle="width: auto;" onchange="$('#form1').submit();"
	        		 listKey="deptNumber" listValue="deptName"  id="deptNumber" name="deptNumber"/>	
	        	 </li>	
	        		 
       			<li class="click" >
	       			<span>专业</span>：<s:select cssClass="dfinput" list="sysMajorList" 
	        		headerKey="" headerValue="--请选择---" cssStyle="width: auto;" onchange="$('#form1').submit();" 
	        		listKey="majorId" listValue="majorName"  name="majorId" id="majorId"/>
       			</li>
        		
        		<li class="click" >
	        	    <span>更多条件</span>：<s:select cssClass="dfinput" list="#{1:'班级编号',2:'班级名称'}" 
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
	    	<th>所在专业</th>
	   		<th>班级名称</th>
	   		<th>操作</th>
	        </tr>
         </thead>
         <tbody>
				<s:iterator id="p" value="pageResult.data" status="pp">
					<tr id="tr_${classId}">
						<td align="center"><s:property value="#pp.count" /></td>
						   <td align="center" >	${majorName}    </td>
		                	<td align="center" >${className}</td>
						<%-- <td align="center" >${classNo}</td> --%>
						<td align="center" width="20%">
						 <a href="javascript:void(0)"
							target="rightFrame" onclick="del(this,${classId});"> <font
								color="red"> <i class="layui-icon">&#xe640;</i>删除
							</font></a>
								<a 
							      href="javascript:dialog('50%','44%','修改班级信息','<%=path%>/sys/classes_openEdit.action?view=edit&thisId=${classId }', 'true','20%');">
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
	        url: '<%=path%>/sys/classes_del.action',
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
