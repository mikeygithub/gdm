<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>学生组信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />

<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>

</head>
<body>
    <div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=path%>/Userlogin.action" target="_parent">首页</a></li>
			<li><a href="<%=path%>/biz/Group_list.action?view=student_list">移除学生分组</a></li>
			<li>分组管理</li>
		</ul>
	</div>

    <div class="rightinfo">
        <form id="form1" name="form1" action="<%=path%>/biz/GroupAllot_detailList.action?view=detail_list&page=${pageResult.page}" method="post">
			<div class="formtitle">
				<span>答辩组学生信息  
				<a href="javascript:void(0)"  target="rightFrame" onclick="allOption()"> 
					  <img src="<%=path%>/images/t01.png"  style="width: 16px;"/><font color="green">&nbsp;&nbsp;一键删除</font>
				   </a></span>
			</div>
		</form>
			
        <table class="tablelist" >
    	<thead>
	    	<tr>
	    		<th width="130px;">
				      <input onclick="selectAll()" type="checkbox" name="controlAll" style="controlAll" id="controlAll" />&nbsp;全选
 			         </th>
		    	<th>序号</th>
		    	<th>组名</th>
		   		<th>姓名</th>
		   		<th>学号</th>
		   		<th>性别</th>
		   		<th>专业</th>
		   		<th>班级</th>
		   		<th>年度</th>
		   		<th>操作</th>
	        </tr>
        </thead>
        <tbody>
				<s:iterator id="p" value="pageResult.data" status="pp">
					<tr id="tr_${id}">
				<td align="center">
 			          <input value="${id}"  title="${stuName }"  type="checkbox" name="selected"/></td>
						<td align="center"><s:property value="#pp.count" /></td>
						<td align="center" >${groupName}</td>
						<td align="center" >${stuName}</td>
						<td align="center" >${stuNo}</td>
						<td align="center" >
						    <s:if test="userSex==1">男</s:if>
						    <s:if test="userSex==0">女</s:if>
						</td>
						<td align="center" >${majorName}</td>
						<td align="center" >${className}</td>
						<td align="center" >${year}</td>
						<td align="center" width="20%">
							<a  href="javascript:void(0);" onclick="option(this,'${id},','${stuName }');">
							    <font color="red"> <i class="layui-icon">&#x1006;</i>移除</font></a>&nbsp;&nbsp;&nbsp;
					    </td>
					</tr>
				</s:iterator>
				</tbody>
</table>
<%@ include file="/WEB-INF/common/pagination.jsp"%>
</div>

<script type="text/javascript">
function selectAll() {
	var checklist = document.getElementsByName("selected");
	if (document.getElementById("controlAll").checked) {
		for (var i = 0; i < checklist.length; i++) {
			checklist[i].checked = 1;
		}
	} else {
		for (var j = 0; j < checklist.length; j++) {
			checklist[j].checked = 0;
		}
	}
}
//多选
function allOption(){
   var stuIds ="";
   var stuName ="<font color='blue'> ";
    $("input[name='selected']").each(function(index,content){
	           if(this.checked==true){
	            stuIds = stuIds+$(this).val()+",";
	            stuName = stuName+(index+1)+"."+$(this).attr('title')+"<br>";
	           }
	        });	  
    stuName=stuName+"</font>";
     if(stuIds == ""){
        layer.alert('请勾选学生',{icon: 3});
    }else{
    	option(this,stuIds,stuName);
	}
}

//单选学生
function option(name,stuId,stuName){
	   
  	var index = layer.confirm('<br>您确定移除 以下学生吗?<br><font color=\'blue\'>'+stuName+'</font>',{icon: 3, title:'提示'}, function(index){
  		      layer.close(index);
		          var index = layer.load(1);
				 
				  $.ajax({
			         type: "post",
			         cache: false,
			         url: '<%=path%>/biz/GroupStudent_delStudent.action',
					 dataType : "json",
					 data : {
						"stuIds" : stuId+","
					  },
				  success : function(result) {
						layer.close(index);
						if (result) {
							layer.alert('移除学生成功',{icon: 1},function(){
								location.reload();
								});
						}else{
							layer.msg('移除学生失败<br>'+result,{icon: 0});
						}
					},
					error : function(result) {
						layer.msg('移除学生失败'+result,{icon: 2});
					}
				});
	          
			}); 
}
   
</script>

</body>
</html>
