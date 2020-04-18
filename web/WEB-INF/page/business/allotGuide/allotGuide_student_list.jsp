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
<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>


<script type="text/javascript">
 //搜索
    function openSearch(name){
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
		<li>选择所带学生</li>
		</ul>
		</div>
		
        <div class="layui-tab">
  <ul class="layui-tab-title">
    <li <s:if test="tabFlag!=00"> class="layui-this"</s:if> >已选学生/最多可选(${guideCount.alreadyStuNum }/<font style="font-weight: bold;font-size: 14px; "color="blue">${guideCount.maxStuNum }</font>)</li>
    <li <s:if test="tabFlag==00"> class="layui-this"</s:if>>可选学生(<font style="font-weight: bold;font-size: 14px; "color="blue">${pageResult1.total }</font>)</li>
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item <s:if test="tabFlag!=00"> layui-show</s:if>">
  
  <div class="rightinfo" id="stu">
    <div class="place">
    <ul class="placeul">
       <li class="click"> <a href="javascript:void(0)"  target="rightFrame" onclick="optionAllDel();"> 
					  <font color="red">&nbsp;&nbsp; <i class="layui-icon">&#xe640;</i>&nbsp;&nbsp;批量退选</font>
				   </a></li>
		</ul></div>
    <table class="tablelist" >
    	  <thead>
	    	<tr>
	    	<th width="130px;">
				   <input onclick="selectAllDel()" type="checkbox" name="controlAllDel"  id="controlAllDel" />&nbsp;全选
			 </th>
	    	<th>序号</th>
	    	<th>所在学院</th>
	    	<th>专业</th>
	    	<th>班级</th>
	   		<th>学生学号</th>
	   		<th>学生姓名</th>
	   		<th>性别</th>
	   		<th>年度</th>
	   		<th>操作</th>
	        </tr>
         </thead>
         <tbody>
				<s:iterator id="p" value="allotStudentList" status="pp">
					<tr id="tr_${allotGuideId}">
					<td align="center">
						   <input value="${allotGuideId}"  title="${stuName}"  type="checkbox" name="delSelected"/>
					    </td>
						<td align="center"><s:property value="#pp.count" /></td>
						 <td align="center">
				        			${deptName}
		               </td>
					   <td align="center">
				        			${majorName}
		                </td>
				        <td align="center">
				        			${className}
				        </td> 
					    <td align="center" >${stuNo}</td>
						<td align="center" >${stuName}</td>
					<td align="center" >
						<s:if test="userSex==1">男</s:if>
						<s:if test="userSex==0">女</s:if></td>
						<td align="center" >${planYear.year}</td>
						<td align="center" width="20%">
							<a  href="javascript:void(0);" onclick="del('${allotGuideId},','${stuName }');">
							<font color="red"> <i class="layui-icon">&#x1006;</i>退选</font></a>
					</td>
					
					
					</tr>
				</s:iterator>
	     </tbody>
      </table>
    </div>
    </div>
    <div class="layui-tab-item <s:if test="tabFlag==00"> layui-show</s:if>">
    <div class="rightinfo">
        <form id="form1" name="form1"  action="<%=path%>/biz/allotGuide_allotStudentList.action?view=student_list&page=${pageResult1.page}&tabFlag=00&flag=01" method="post">
        	<div class="place">
		<ul class="placeul">
		<li><span>院系：</span>${teacher.deptName }</li>
			<li class="click" style="font-size: 12px">
	        		<span>专业：</span><s:select cssClass="dfinput" list="teacherMajorList" 
	        		headerKey="" headerValue="所带专业"
	        		cssStyle="width: auto;" onchange="$('#form1').submit();"
	        		listKey="majorId" listValue="majorName"  name="majorId" id="majorId"/>
	        		
        		    <input type="text" class="dfinput" id="selectValue" name="stuName"
	        		       placeholder="学生姓名"  >
        		</li>
        		<li class="click">
	        		<a href="javascript:void(0);"  onclick="openSearch(this);"><img src="<%=path%>/images/search.png"  />搜索</a>
				</li> 
				<li class="click"> <a href="javascript:void(0)"  target="rightFrame" onclick="optionAll();"> 
					  <font color="green">&nbsp;&nbsp;批量选择</font>
				   </a></li>
		</ul>
		</div>
       </form>
        <table class="tablelist" >
    	  <thead>
	    	<tr>
	    	<th width="130px;">
				   <input onclick="selectAll()" type="checkbox" name="controlAll"  id="controlAll" />&nbsp;全选
			 </th>
	    	<th>序号</th>
	    	<th>所在学院</th>
	    	<th>专业</th>
	    	<th>班级</th>
	    	<th>学生学号</th>
	   		<th>学生姓名</th>
	   		<th>性别</th>
	   		<th>年度</th>
	   		<th>状态</th>
	        </tr>
         </thead>
         <tbody>
				<s:iterator id="p" value="pageResult1.data" status="pp">
					<tr id="tr_${stuId}">
					<td align="center">
						   <input value="${stuId}"  title="${stuName}"  type="checkbox" name="selected"/>
					    </td>
						<td align="center"><s:property value="#pp.count" /></td>
						 <td align="center">${deptName} </td>
					   <td align="center">${majorName} </td>
				        <td align="center">${className} </td> 
						<td align="center" >${stuNo}</td>
						<td align="center" >${stuName}</td>
						<td align="center" >
						<s:if test="userSex==1">男</s:if>
						<s:if test="userSex==0">女</s:if></td>
						 <td align="center" >${planYear.year}</td>
						<td align="center" width="20%">
						  <s:if test="allotGuideId==null">
						 <a href="javascript:void(0)"
<%--						    	target="rightFrame" onclick="option('${stuId},' ,'${stuName}' );">--%>
							 target="rightFrame" onclick="optionHandler('${stuId},' ,'${stuName}' );">
							 <font color="green"> <i class="layui-icon">&#xe618;</i>可选</font></a>
						 </s:if>
						</td>
					</tr>
				</s:iterator>
	     </tbody>
      </table>
<%@ include file="/WEB-INF/common/pagination1.jsp"%>
</div>

  </div>

</div>
<script>
layui.use('element', function(){
  var element = layui.element;
});
</script>		
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
//选择学生
function optionAll(){
	 var stuIds ="";
	 var stuName ="<br><font color='blue'> ";
	    $("input[name='selected']").each(function(index,content){
		           if(this.checked==true){
		            stuIds = stuIds+$(this).val()+",";
		            stuName = stuName+(index+1)+"."+$(this).attr('title')+"<br>";
		           }
	 });
	    stuName=stuName+"</font>";
	    if(stuIds == ""){
	        layer.alert('请勾选学生',{icon: 3});
	    }else{ option(stuIds,stuName);}
}
// 执行选取
function optionHandler(stuId,stuName){
	$.ajax({
		type: "post",
		cache: false,
		url: '<%=path%>/biz/allotGuide_checkTime.action',
		dataType : "json",
		data : {
			"thisIds" : stuId
		},success : function(result) {
			if (result.obj==1) {
				option(stuId,stuName);
			}else{
				layer.msg('未在操作时间段内操作',{icon: 2});
			}
		},
		error : function(result) {
			layer.msg('操作失败',{icon: 2});
		}
	});
}
//选择学生
function option(stuId,stuName){
	
var maxStuNum = '${guideCount.maxStuNum}';
var alreadyStuNum = '${guideCount.alreadyStuNum}';

	//条件过滤
	//未到分配时间
	if (false){
		layer.alert('未在操作时间段内！',{icon: 3});
		return
	}

	//未分配指导人数
	if(maxStuNum==null||maxStuNum==''){
		layer.alert('您还未分配指导人数,请联系管理员或教研室主任分配！',{icon: 3});
		return
	}

	if(maxStuNum!=''&&maxStuNum!=undefined&&alreadyStuNum!=''&&alreadyStuNum!=undefined&&maxStuNum==alreadyStuNum){
		layer.alert('最多可选:${guideCount.maxStuNum} 位学生， 不能再选其他学生！',{icon: 3});
	}else {
		layer.confirm('您确定选择 以下学生吗?<br>'+stuName+' ', {icon: 3, title:'提示'}, function(index){
			  layer.close(index);
		var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/biz/allotGuide_addStudent.action',
					dataType : "json",
					data : {
						"thisIds" : stuId
					},success : function(result) {
						layer.close(index);
						console.log('result='+result)
						if (result.length==0) {
							layer.alert('选择学生成功',{icon: 1},function(){
								 location.reload();
								});
						}else{
							layer.msg('选择学生失败',{icon: 2});
						}
					},
					error : function(result) {
						layer.close(index); 
						layer.msg('选择学生失败',{icon: 2});
					}
				});
		});
	}
}
function selectAllDel() {
	var checklist = document.getElementsByName("delSelected");
	if (document.getElementById("controlAllDel").checked) {
		for (var i = 0; i < checklist.length; i++) {
			checklist[i].checked = 1;
		}
	} else {
		for (var j = 0; j < checklist.length; j++) {
			checklist[j].checked = 0;
		}
	}
}
//选择学生
function optionAllDel(){
	 var stuIds ="";
	 var stuName ="<br><font color='blue'> ";
	    $("input[name='delSelected']").each(function(index,content){
		           if(this.checked==true){
		            stuIds = stuIds+$(this).val()+",";
		            stuName = stuName+(index+1)+"."+$(this).attr('title')+"<br>";
		           }
	 });
	    stuName=stuName+"</font>";
	    if(stuIds == ""){
	        layer.alert('请勾选学生',{icon: 3});
	    }else{  del(stuIds,stuName);}
	   
}
//删除已选学生
function del(thisId,stuName){
	var re=$(name).parent().parent();
	layer.confirm('您确定要退选以下学生吗?<br>'+stuName+'', {icon: 3, title:'提示'}, function(index){
		  layer.close(index);
		var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/biz/allotGuide_del.action',
					dataType : "json",
					data : {
						"thisIds" : thisId
					},success : function(result) {
						layer.close(index); 
						if (result.length==0) {
							re.remove();
							layer.alert('取消选择成功',{icon: 1},function(){
								 location.reload();
								});
						}else{
							layer.msg('取消失败',{icon: 2});
						}
					},
					error : function(result) {
						layer.close(index); 
						layer.msg('取消失败',{icon: 2});
					}
				});
});
}
</script>
</body>
</html>
