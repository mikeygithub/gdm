<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>教师可选研究方向管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />

<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/ajax.js"></script>

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

function openAdd(){

	layer.open({
    	type: 2,
    	area: ['80%', '35%'],
    	fix: false, //不固定
		title:'添加用户',
    	maxmin: true,
    	content: '<%=path%>/sys/directions_openAdd.action?view=add'
	});
	
}

</script>

</head>
<body style="min-width: 200px">
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
		<li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">>首页</a></li>
		<li>老师可选研究方向管理</li>
		</ul>
	</div>
	<div class="rightinfo">
		<div class="formtitle">
			<span>老师已选研究方向</span>
		</div>
        <table class="tablelist" >
		    	<thead>
		    	<tr>
			    	<th>序号</th>
			   		<th>研究方向名称</th>
			   		<th>操作</th>
			        </tr>
		        </thead>
		        <tbody>
					 <s:iterator id="p" value="teacherDirectionsList" status="pp">
						<tr id="tr_${id}">
							<td align="center"><s:property value="#pp.count" /></td>
							<td align="center" >
								<s:iterator id="dp" value="sysDirectionsList">
								   <s:if test="#p.directionsId==directionsId">
								     ${directionsName} 
								   </s:if>
								</s:iterator>
							</td>
							<td align="center" width="20%">
								<a href="javascript:void(0)"
									target="rightFrame" 
									onclick="ajax('<%=path%>/sys/teacher_delDirections.action'
									,{thisId:${id}},'您确定删除${directionsName}该研究方向？');"
									>
									<font
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
			<span>研究方向</span>
		</div>
        <form id="form1" name="form1" action="<%=path%>/sys/teacher_openDirectionsList.action?view=directions_list" method="post">
			  <div class="place">
				<ul class="placeul" style="font-size: 12px">
				    <li class="click" >
			        	 <span>学院</span>：${sysDepartment.deptName }	&nbsp; 
			       		 <input type="text" class="dfinput" id="sysMajor.majorName" name="sysMajor.majorName"
			       		  placeholder="研究方向"  >
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
		   		<th>研究方向</th>
		   		<th>操作</th>
		        </tr>
	        </thead>
            <tbody>
				<s:iterator id="p" value="sysDirectionsList" status="pp">
					<tr id="tr_${directionsId}">
						<td align="center"><s:property value="#pp.count" /></td>
						<td align="center" >${directionsName}</td>
						<td align="center" width="20%">
							<s:iterator id="tp" value="teacherDirectionsList" status="pp">
							    <s:if test="#p.directionsId==directionsId">
							   <s:set name="state" value="1" ></s:set>
								 <font color="red"> 已添加</font>
								</s:if>
							</s:iterator>
							<s:if test="#state!=1" >
								<a href="javascript:void(0)"
								target="rightFrame"
								 onclick="option(this,${directionsId},'${directionsName}')"> <font
									color="green"> <i class="layui-icon">&#xe618;</i>添加
								</font>
								</a>
								</s:if>
						    <s:set name="state" value="" ></s:set>
					  </td>
				   </tr>
			  </s:iterator>
		 </tbody>
</table>
</div>

<script type="text/javascript">
//选择研究方向
function option(name,directionsId,directionsrName){
	var data = {
		"teacherDirections.directionsId" : directionsId,
		"teacherDirections.teacherId": ${teacherDirections.teacherId}
	};	
	var title = '您确定添加 '+directionsrName+' 研究方向 ?';
	var url  = '<%=path%>/sys/teacher_addTeacherDirections.action';
	ajax(url,data,title);
}
</script>
</body>
</html>
