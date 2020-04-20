<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>教师管理</title>
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
    	area: ['40%', '70%'],
    	fix: false, //不固定
		title:'添加教师',
    	maxmin: true,
    	content: '<%=path%>/sys/teacher_openAdd.action?view=add'
	});
}

//搜索
 function openSearch(){
	 var type =  $("#selectName").val();
 	var nameValie = "";
 	if(type=='1'){
  		nameValie = "model.teacherNo";
  }else if(type=='2'){
 		nameValie = "model.teacherName";
  }else {
		nameValie = "model.teacherName";
	}
	 $("#selectValue").attr("name",nameValie);
 	$("#form1").submit();
}

 function openAddTeacherByExcel(){
	layer.open({
		type: 2,
    	area: ['100%', '100%'],
    	fix: false, //不固定
		title:'批量添加教师',
    	maxmin: true,
    	content: '<%=path%>/sys/teacher_openAddTeacherByExcel.action?view=openAddTeacherByExcel'
    	,cancel:function(index,leyerz){
    			   location.reload();
    			   return true;
    		   }
	});
}
</script>

</head>
<body>
<div class="place">
<span>位置：</span>
<ul class="placeul">
<li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>
<li>教师管理</li>
</ul>
</div>
		<div class="rightinfo">
			<div class="formtitle">
				<span>教师管理</span>
			</div>
        <form id="form1" name="form1" action="<%=path%>/sys/teacher_list.action?view=list&page=${pageResult.page}" method="post">
        	<div class="place">
		<ul class="placeul" style="font-size: 12px">
		   <li class="click" >
	        	<span>学院：<s:select cssClass="dfinput" list="departmentList"  	headerKey="" headerValue="所选学院"
        		 cssStyle="width: auto;" onchange="$('#form1').submit();"  value="model.deptNumber"
        		 listKey="deptNumber" listValue="deptName"  id="deptNumber" name="model.deptNumber"/>	</span>		
	        		 </li>
	         <li class="click" >
	        	<span>大类：<s:select cssClass="dfinput" list="categoryList" 	headerKey="" headerValue="所选大类"
        		 cssStyle="width: auto;" onchange="$('#form1').submit();"  value="model.categoryId"
        		 listKey="categoryId" listValue="categoryName"  id="categoryId" name="model.categoryId"/>	</span>		
	        		 </li>			 
	         <li class="click" >
	        	<span>教研室：<s:select cssClass="dfinput" list="sysMajorList" 	headerKey="" headerValue="所选教研室"
        		 cssStyle="width: auto;" onchange="$('#form1').submit();"  value="model.staffroomId"
        		 listKey="majorId" listValue="staffName"  id="majorId" name="model.staffroomId"/>	</span>		
	        		 </li>		
			<li class="click" >
	        		<span>更多条件：
        		  <s:select cssClass="dfinput" list="#{1:'职工号',2:'教师姓名'}" 
        		headerKey="" headerValue="--请选择---" cssStyle="width: auto;"
        		 listKey="key" listValue="value"  name="selectName" id="selectName"/>
        		 <input type="text" class="dfinput" id="selectValue" name="" 
        		  placeholder="请输入信息" style="line-height: 18px;" ></span>
        			</li>
        		
        		<li class="click">
	        		<a href="javascript:void(0);"  onclick="openSearch(this);"><img src="<%=path%>/images/search.png"  />搜索</a>
				</li>
				
					<li class="click">
	        		<a href="#" onclick="openAdd()"><img src="<%=path%>/images/t01.png"  style="width: 16px;"/>添加</a>
				</li>
					<li class="click">
	        		<a href="#" onclick="openAddTeacherByExcel()"><img src="<%=path%>/images/t01.png"  style="width: 16px;"/>批量添加  </a>
				</li>
		</ul>
		</div>
     </form>
        <table class="tablelist" >
    	<thead>
    	<tr>
    	<th>序号</th>
   		<th>职工号</th>
   		<th>姓名</th>
   		<th>所在学院</th>
   		<th>大类</th>
   		<th>所在教研室</th>
   		<th>教师职称</th>
   		<th>教师职务</th>
   		<th>性别</th>
   		<th>联系电话</th>
   		<th>邮箱</th>
   		<th>操作</th>
        </tr>
        </thead>
        <tbody>
		<s:if test="pageResult.data!=null&&pageResult.total>0">
			<s:iterator id="p" value="pageResult.data" status="pp">
				<tr id="tr_${teacherId}">
					<td align="center"><s:property value="#pp.count" /></td>
					<td align="center" >${teacherNo}</td>
					<td align="center" >${teacherName}</td>
					<td align="center" >
								<s:if test="deptName==null||deptName==''"><font>-</font></s:if><s:else>${deptName}</s:else>
					</td>
					<td align="center" >
								<s:if test="categoryName==null||categoryName==''"><font>-</font></s:if><s:else>${categoryName}</s:else>
					</td>
					<td align="center" >
								<s:if test="staffName==null||staffName==''"><font>-</font></s:if><s:else>${staffName}</s:else>
					</td>
					<td align="center" >
						<s:if test="technicalName==null||technicalName==''"><font>-</font></s:if><s:else>${technicalName}</s:else>
					</td>
					<td align="center" >
						<s:if test="dutiesName==null||dutiesName==''"><font>-</font></s:if><s:else>${dutiesName}</s:else>
					</td>
					<td align="center" >
						<s:if test="userSex==0">男</s:if>
						<s:if test="userSex==1">女</s:if></td>
					<td align="center" >
						<s:if test="userTel==null||userTel==''"><font>-</font></s:if><s:else>${userTel}</s:else>
					</td>
					<td align="center" >
								<s:if test="userEmail==null||userEmail==''"><font>-</font></s:if><s:else>${dutiesName}</s:else>
					</td>
					<td align="center" width="20%">
						<a href="javascript:void(0)"
						   target="rightFrame" onclick="del(this,${teacherId},'${teacherName}');"> <font
								color="red"> <i class="layui-icon">&#xe640;</i>删除
						</font>
						</a>
						<a
								href="javascript:dialog('40%','70%','修改老师信息','<%=path%>/sys/teacher_openEdit.action?view=edit&thisId=${teacherId }', 'true','20%');">
							<font color="blue"> <i class="layui-icon">&#xe642;</i>修改</font></a>&nbsp;&nbsp;
						<a href="javascript:dialog('60%','90%','所带专业','<%=path%>/sys/teacher_openMajorList.action?view=major_list&teacherMajor.teacherId=${teacherId }', 'true','20%');">
							<font color="green"> <i class="layui-icon">&#xe642;</i>所带专业</font></a>&nbsp;&nbsp;
						<a href="javascript:dialog('60%','90%','研究方向','<%=path%>/sys/teacher_openDirectionsList.action?view=directions_list&teacherDirections.teacherId=${teacherId }', 'true','20%');">
							<font color="green"> <i class="layui-icon">&#xe642;</i>研究方向</font></a>&nbsp;&nbsp;
					</td>
				</tr>
			</s:iterator>
		</s:if>
		<s:else>
			<tr><td align="center" colspan="12"><font>暂无数据</font></td></tr>
		</s:else>
				</tbody>
</table>
<%@ include file="/WEB-INF/common/pagination.jsp"%>
</div>

<script type="text/javascript">
//单个删除
function del(name,id,teacherName){
	var re=$(name).parent().parent();
	layer.confirm('您确定要删除 '+teacherName+' 吗?', {icon: 2, title:'提示'}, function(index){
		layer.close(index);
		var index = layer.load(1);
		$.ajax({
			type: "post",
			cache: false,
			url: '<%=path%>/sys/teacher_del.action',
			dataType : "json",
			data : {
				"thisId" : id
			},success : function(result) {
				layer.close(index);
				if (result) {
					re.remove();
					layer.alert('删除成功');
				}else{
					layer.alert('删除失败');
				}
			},
			error : function(result) {
				layer.close(index);
				layer.alert('删除失败');
			}
		});
	});
}
</script>
</body>
</html>
