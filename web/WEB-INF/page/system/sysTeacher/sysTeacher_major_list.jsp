<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>教师可选专业管理</title>
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

//搜索
 function openSearch(){
	
	 var type =  $("#selectName").val();
 	var nameValie = "";
 	if(type=='1'){
  		nameValie = "teacherId";
  }else if(type=='2'){
 		nameValie = "teacherName";
  }
 	$("#selectValue").attr("name",nameValie);
 	$("#form1").submit();
}

 function openAddTeacherByExcel(){
	layer.open({
		type: 2,
    	area: ['60%', '84%'],
    	fix: false, //不固定
		title:'批量添加教师',
    	maxmin: true,
    	content: '<%=path%>/sys/teacher_openAddTeacherByExcel.action?view=openAddTeacherByExcel'
	});
}
</script>

</head>
<body style="min-width: 200px">
<div class="place">
<span>位置：</span>
<ul class="placeul">
<li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>
<li>老师可选专业管理</li>
</ul>
</div>


	<div class="rightinfo">
			<div class="formtitle">
				<span>老师已选专业</span>
			</div>
        <table class="tablelist" >
    	<thead>
    	<tr>
    	<th>序号</th>
   		<th>专业名称</th>
   		<th>操作</th>
        </tr>
        </thead>
        <tbody>
				<s:iterator id="p" value="teacherMajorList" status="pp">
					<tr id="tr_${id}">
						<td align="center"><s:property value="#pp.count" /></td>
						<td align="center" >
						<s:iterator id="tp" value="sysMajorList" status="pp">
						   <s:if test="#p.majorId==majorId">
						   ${majorName}
							</s:if>
						</s:iterator>
						</td>
					
						<td align="center" width="20%">
							<a href="javascript:void(0)"
							target="rightFrame" onclick="del(this,${id});"> <font
								color="red"> <i class="layui-icon">&#xe640;</i>删除
							</font>
							</a>
							</td>
					</tr>
				</s:iterator>
				</tbody>
</table>
</div>

		<div class="rightinfo">
			<div class="formtitle">
				<span>老师可选专业</span>
			</div>
        <form id="form1" name="form1" action="<%=path%>/sys/teacher_openMajorList.action?view=major_list&page=${pageResult1.page}&thisId=${model.teacherId }" method="post">
        	<div class="place">
		<ul class="placeul" style="font-size: 12px">
		   <li class="click" >
	        	<span>学院</span>：${sysDepartment.deptName }	&nbsp; 
        		 <input type="text" class="dfinput" id="sysMajor.majorName" name="sysMajor.majorName"
        		  placeholder="专业名称"  >
        			</li>
        		
        		<li class="click">
	        		<a href="javascript:void();"  onclick="openSearch(this);"><img src="<%=path%>/images/search.png"  />搜索</a>
				</li>
		</ul>
		</div>
     </form>
        <table class="tablelist" >
    	<thead>
    	<tr>
    	<th>序号</th>
   		<th>专业名称</th>
   		<th>操作</th>
        </tr>
        </thead>
        <tbody>
				<s:iterator id="p" value="pageResult1.data" status="pp">
					<tr id="tr_${majorId}">
						<td align="center"><s:property value="#pp.count" /></td>
						<td align="center" >
						     ${majorName} 
						</td>
					    
						<td align="center" width="20%">
						<s:iterator id="tp" value="teacherMajorList" status="pp">
						   <s:if test="#p.majorId==majorId">
						   <s:set name="state" value="1" ></s:set>
							 <font color="red">已选择</font>
							</s:if>
						</s:iterator>
						<s:if test="#state!=1" >
							<a href="javascript:void(0)"
							target="rightFrame" onclick="option(this,${majorId},'${majorName}')"> <font
								color="green"> <i class="layui-icon">&#xe618;</i>选择
							</font>
							</a>
							</s:if>
					    <s:set name="state" value="" ></s:set>
						</td>
					</tr>
				</s:iterator>
				</tbody>
</table>
<%@ include file="/WEB-INF/common/pagination1.jsp"%>
</div>

<script type="text/javascript">

//选择专业
function option(name,majorId,majorName){
		layer.confirm('您确定添加 '+majorName+' 专业 ?', {icon: 3, title:'提示'}, function(index){
			layer.close(index);
			var index = layer.load(1);
			 $.ajax({
		        type: "post",
		        cache: false,
		        url: '<%=path%>/sys/teacher_addTeacherMajor.action',
						dataType : "json",
						data : {
							"teacherMajor.majorId" : majorId,
							"teacherMajor.teacherId":${model.teacherId}
						},success : function(result) {
							layer.close(index); 
							if (result) {
								layer.alert('添加成功',{icon: 1},function(){
									 location.reload();
									});
							}else{
								layer.msg('添加失败',{icon: 2});
							}
						},
						error : function(result) {
							layer.close(index); 
							layer.msg('添加失败',{icon: 2});
						}
				});
		});
}
//单个删除
function del(name,id){
	var re=$(name).parent().parent();
	layer.confirm('您确定删除该专业？', {icon: 3, title:'提示'}, function(index){
		var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/sys/teacher_delMajor.action',
					dataType : "json",
					data : {
						"thisId" : id
					},success : function(result) {
						layer.close(index); 
						if (result) {
							re.remove();
							layer.msg('删除成功',{icon: 1});
						   location.reload();
						}else{
							layer.msg('删除失败',{icon: 2});
						}
					},
					error : function(result) {
						layer.close(index); 
						layer.msg('删除失败',{icon: 2});
					}
				}
				);
			});
		}
</script>
</body>
</html>
