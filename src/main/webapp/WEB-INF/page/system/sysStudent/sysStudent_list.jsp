<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>学生管理</title>
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
    	area: ['40%', '96%'],
    	fix: false, //不固定
		title:'添加学生',
    	maxmin: true,
    	content: '<%=path%>/sys/student_openAdd.action?view=add'
	});
}


function openAddStudentByExcel(){

	layer.open({
    	type: 2,
    	area: ['100%', '100%'],
    	fix: false, //不固定
		title:'批量添加学生',
    	maxmin: true,
    	content: '<%=path%>/sys/student_openAddStudentByExcel.action?view=openAddStudentByExcel'
	   ,cancel:function(index,leyerz){
		   location.reload();
		   return true;
	   }
	});
}
 //搜索
    function openSearch(name){
	
    	var type =  $("#selectName").val();
    	var nameValie = "";
    	if(type==1){
    		nameValie = "model.stuNo";
    	}else if(type==2){
    		nameValie = "model.stuName";
    	}else {
			nameValie = "model.stuName";//默认名字搜索
		}

    	$("#selectValue").attr("name",nameValie);
     	$("#form1").submit();
    }

</script>
<style >
</style>
</head>
<body>
<div class="place">
<span>位置：</span>
<ul class="placeul">
<li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>
<li>学生管理</li>
</ul>
</div>
		<div class="rightinfo">
			<div class="formtitle">
				<span>学生管理</span>
			</div>
          <form id="form1" name="form1" action="<%=path%>/sys/student_list.action?view=list&page=${pageResult.page}" method="post">
        	
        	 	<div class="place">
		 <ul class="placeul"  style="font-size: 12px">
                   <li class="click">
	        	   <span>院系</span>：
        		   <s:select cssClass="dfinput" list="departmentList" 
	        		   cssStyle="width: auto;" onchange="$('#form1').submit();" value="model.deptNumber"
	        		   listKey="deptNumber" listValue="deptName"  id="model.deptNumber" name="model.deptNumber"/>	
	        		 </li>
	        		 		
        		    <li class="click" >
        			<span>专业</span>：<s:select cssClass="dfinput" list="sysMajorList" headerKey="" headerValue="--请选择---"
	        		 cssStyle="width: auto;" onchange="$('#form1').submit();"
	        		 listKey="majorId" listValue="majorName"  id="model.majorId" name="model.majorId"/>	
        			</li>  
	        		<li class="click" >
		        		<span>班级</span>：<s:select cssClass="dfinput" list="sysClassList" value="model.classId"
		        		headerKey="" headerValue="--请选择---" cssStyle="width: auto;" onchange="$('#form1').submit();"
		        		listKey="classId" listValue="className"  name="model.classId" id="model.Id"/>
	        		 </li>
        		 <li class="click" >
	        		<span>更多条件：</span>
        		    <s:select cssClass="dfinput" list="#{1:'学号',2:'学生姓名'}" 
		        		      headerKey="" headerValue="--请选择---" cssStyle="width: auto;"
		        		      listKey="key" listValue="value"  name="selectName" id="selectName"/>
        		    <input type="text" class="dfinput" id="selectValue" name=""
        		           placeholder="请输入信息" style="line-height: 18px;" >
        		</li>
        			
        		<li class="click">
	        		<a href="javascript:void(0);"  onclick="openSearch(this);"><img src="<%=path%>/images/search.png"  />搜索</a>
				</li>
					
					<li class="click">
	        		<a href="#" onclick="openAdd()"><img src="<%=path%>/images/t01.png"  style="width: 16px;"/>添加</a>
				</li>
					<li class="click">
	        		<a href="#" onclick="openAddStudentByExcel()"><img src="<%=path%>/images/t01.png"  style="width: 16px;"/>批量添加  </a>
				</li>
		</ul>
		</div>
     </form>
        <table class="tablelist" >
    	<thead>
    	<tr>
    	<th>序号</th>
   		<th>学号</th>
   		<th>姓名</th>
   		<th>性别</th>
   		<th>院系 </th>
   		<th>专业</th>
   		<th>班级</th>
   		<th>年级</th>
   		<th>联系方式</th>
   		<th>邮箱</th>
   		<th>操作</th>
        </tr>
        </thead>
        <tbody>
				<s:iterator id="p" value="pageResult.data" status="pp">
					<tr id="tr_${stuId}">
						<td align="center"><s:property value="#pp.count" /></td>
						
						<td align="center" >${stuNo}</td>
						<td align="center" >${stuName}</td>
						<td align="center" >
						<s:if test="userSex==1">男</s:if>
						<s:if test="userSex==0">女</s:if></td>
					    <td align="center">
				        			${deptName}
		               </td>
					   <td align="center">
				        			${majorName}
		                </td>
				        <td align="center">
				        			${className}
				        </td> 
						<td align="center" >${stuGrade}</td>
						<td align="center" >${userTel}</td>
						<td align="center" >${userEmail}</td>
						
						<td align="center" width="20%">
							 <a href="javascript:void(0)"
							target="rightFrame" onclick="del(this,${stuId},'${stuName}');"> <font
								color="red"> <i class="layui-icon">&#xe640;</i>删除
							</font></a>
								<a 
							      href="javascript:dialog('40%','94%','修改用户信息','<%=path%>/sys/student_openEdit.action?view=edit&thisId=${stuId }', 'true','20%');">
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
function del(name,id,stuName){
    var re=$(name).parent().parent();
    layer.confirm('您确定要删除 '+stuName+' 吗?', {icon: 2, title:'提示'}, function(index){
        layer.close(index);
        var index = layer.load(1);
        $.ajax({
            type: "post",
            cache: false,
            url: '<%=path%>/sys/student_del.action',
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
