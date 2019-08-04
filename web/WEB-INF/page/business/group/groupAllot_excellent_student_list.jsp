<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>学生分组管理</title>
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
	
	//多选批量移除
	function selectAllDel() {
		var checklist = document.getElementsByName("delSelected");
		if (document.getElementById("controlAll2").checked) {
			for (var i = 0; i < checklist.length; i++) {
				checklist[i].checked = 1;
			}
		} else {
			for (var j = 0; j < checklist.length; j++) {
				checklist[j].checked = 0;
			}
		}
	}
	//提交表单
	function sub() {
		var cheched = $("input[type='checkbox']:checked").length;
		if(cheched > 0){
		    var deleteForm = document.getElementById("deleteForm");
			deleteForm.submit();
			var deleteForm = document.getElementById("deleteForm");
			deleteForm.submit();
		}else{
		   alert("请先选择要删除的信息！");
		}
		
	}
</script>
<!-- 全选或取消全选结束 -->

<script type="text/javascript">
function openGroup(name,thisId,groupName,type){
	layer.open({
    	type: 2,
    	area: ['80%', '94%'],
    	fix: false, //不固定
		title:'【<font color=\'blue\'>'+groupName+'</font>】组学生信息',
    	maxmin: true,
    	content: '<%=path%>/biz/GroupStudent_detailList.action?view=detail_list&thisId='+thisId
    	,cancel: function(index, layero){ 
    			  location.reload();
    		  layer.close(index);
    		  return true; 
    		}   
	});
}
</script>
<script type="text/javascript">
 //搜索
    function openSearch(name){
    	$("#form1").submit();
    }
   $(function(){
	     var flag="${mark}";
	     if(flag!='' && flag!=undefined){
	    	 if(flag=="1"){
	        $('#submit').attr('disabled','disabled');
	        layer.msg('添加成功',{icon:1});
	        setTimeout(function(){
	           layer.close(index);
	        },1000);
	     }else if(flag=="0"){
	     layer.msg('添加失败',{icon:2});
	     }
	    }
	});
</script>

<style >
</style>
</head>
<body>
		<div class="place">
		<span>位置：</span>
		<ul class="placeul">
		<li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>
		<li>选择分组学生</li>
		</ul>
		</div>
 <div class="layui-tab">
  <ul class="layui-tab-title">
    <li  >
   <a  class="selected" href="<%=path%>/biz/GroupStudent_list.action?view=student_list&thisYear=${thisYear }&listGroupStudent.groupType=00&flag=08" >  
	学生列表(<font style="font-weight: bold;font-size: 14px; "color="blue">${pageResult.total }</font>)- 答辩组</a>  
    </li>
    <li class="layui-this">
    <a  class="selected" href="<%=path%>/biz/GroupStudent_list.action?view=excellent_student_list&thisYear=${thisYear }&listGroupStudent.groupType=01&flag=08" >  
	 优秀学生列表(<font style="font-weight: bold;font-size: 14px; "color="blue">${pageResult.total }</font>)- 大组</a>  
    </li>
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item <s:if test="tabFlag!=00"> layui-show</s:if>">
		 <div class="rightinfo">
		 <form id="form1" name="form1"  action="<%=path%>/biz/GroupStudent_list.action?view=excellent_student_list&page=${pageResult.page}&listGroupStudent.groupType=01&flag=08" method="post">
		
		<div class="rightinfo">
			<div class="formtitle">
			<s:if test="model.groupAllotId!=null">
			<ul class="placeul">
			
			   <li class="click" style="font-size: 12px;">
				    	<span>已分配：<font color="blue">${groupAllot.studentNum }</font>人</span>
				</li>
				   <s:iterator id="" value="groupAllot.directionList">
				    <li class="click" style="font-size: 12px;width:150px;">
				    	<span>
						   ${majorName } <font color="blue">&nbsp;${majorNum }&nbsp;</font>人&nbsp;
					   </span>
					   </li>
						 </s:iterator>
				 </ul>
				 </s:if>
			</div>
		
			<div class="place">
				<ul class="placeul">
		        	<li class="click" style="font-size: 12px;">
				    <span>选择组名：<s:select cssClass="dfinput" list="groupAllotList" headerKey="" headerValue="所有组名"
	        		cssStyle="width: auto;" onchange="$('#form1').submit();" 
	        		listKey="groupId" listValue="groupName"  name="model.groupAllotId" id="allGroupId"/></span>
				</li>
				
				<s:if test="model.groupAllotId!=null">
		<li class="click" style="font-size: 12px;">
				    <span>组长：<s:iterator id="" value="groupAllot.teacherList">
						   <s:if test="type==0"><font color="blue">${teacherName }</font> </s:if>
						 </s:iterator></span>
				</li>
		<li class="click" style="font-size: 12px;">
				    <span>记录员：<s:iterator id="" value="groupAllot.teacherList">
						   <s:if test="type==2"><font color="blue">${teacherName }</font></s:if>
						 </s:iterator></span>
				</li>
		  <li class="click" style="font-size: 12px;">
				    <span>答辩老师：<s:iterator id="" value="groupAllot.teacherList">
						   <font color="blue"><s:if test="type==1">${teacherName }</s:if>&nbsp;</font>
						 </s:iterator></span>
				</li>
		  <li class="click" style="font-size: 12px;">
				    <span>组答辩方向：<s:iterator id="" value="groupAllot.directionList">
						   <font color="blue">${majorName }&nbsp;</font>
						 </s:iterator></span>
				</li>
				<li>
					<a href="javascript:void(0);"  onclick="openGroup(this,${groupAllot.groupId},'${groupAllot.groupName },0');">
						<font color="green"><img src="<%=path%>/images/f03.png" width="16px" />查看分组学生</font> 
						</a>
						</li> 		
				</s:if>	
		        </ul>
			</div>
        	<div class="place">
	        	<ul class="placeul">
			        <li class="click" style="font-size: 12px">
				        <span>院系：<s:select cssClass="dfinput" list="sysDepartmentList" 
		        		cssStyle="width: auto;" onchange="$('#form1').submit();" value="listGroupStudent.deptNumber"
		        		listKey="deptNumber" listValue="deptName"  name="listGroupStudent.deptNumber" id="listGroupStudent.deptNumber"/></span>
				     </li>  
				     <li class="click" >
        			<span>专业</span>：<s:select cssClass="dfinput" list="sysMajorList"  value="listGroupStudent.majorId"
	        		 headerKey="" headerValue="选择专业" cssStyle="width: auto;" onchange="$('#form1').submit();" 
	        		 listKey="majorId" listValue="majorName"  id="listGroupStudent.majorId" name="listGroupStudent.majorId"/>	
        			</li>  
	        		<li class="click" >
		        		<span>班级</span>：<s:select cssClass="dfinput" list="sysClassList" value="listGroupStudent.classId"
		        		headerKey="" headerValue="选择班级" cssStyle="width: auto;" onchange="$('#form1').submit();"
		        		listKey="classId" listValue="className"  name="listGroupStudent.classId" id="listGroupStudent.classId"/>
	        		 </li>
				     <li class="click" style="font-size: 12px">
		        		<span>学生姓名:
	        		    <input type="text" class="dfinput" id="selectValue" name="listGroupStudent.stuName"
		        		       placeholder="学生姓名"  ></span>
	        		</li>
	        		<li class="click">
		        		<a href="javascript:void();"  onclick="openSearch(this);"><img src="<%=path%>/images/search.png"  />搜索</a>
					</li>
						<li class="click">
		        		<a href="<%=path%>/biz/GroupAllot_list.action?view=list&groupType=01" ><img src="<%=path%>/images/t02.png"  style="width: 16px;"/>查看大组</a>
					</li>
					<li>
					 <a href="javascript:void(0)"  target="rightFrame" onclick="allOption()"> 
					  <img src="<%=path%>/images/t01.png"  style="width: 16px;"/><font color="green">&nbsp;&nbsp;一键选择</font>
				   </a>
					</li>
					
		        </ul>
		</div>
       </form>
        <table class="tablelist" >
    	  <thead>
	        <tr>
	         <th width="130px;">
				   <input onclick="selectAll()" type="checkbox" name="controlAll" style="controlAll" id="controlAll" />&nbsp;全选
			 </th>
		     <th>序号<i class="sort"><img src="<%=path%>/images/px.gif" /></i></th>
	   		 <th>学生姓名</th>
   		     <th>专业</th>
   		     <th>班级</th>
   		     <th>课题类型</th>
   		     <th>课题名称</th>
   		     <th>指导老师</th>
   		     <th>年度</th>
	   		 <th>状态</th>
	        </tr>
         </thead>
        <tbody>
				<s:iterator id="p" value="pageResult.data" status="pp">
					<tr id="tr_${stuId}">
					    <td align="center">
						   <s:if test="groupAllotId==null" >
						       <input value="${stuId}"  title="${stuName }"  type="checkbox" name="selected"/>
						   </s:if>
						   <s:else>
						       <font color="red"> <i class="layui-icon">&#xe618;</i></font>
						   </s:else>
					    </td>
					    <td align="center"><s:property value="#pp.count" /></td>
					    <td align="center" >${stuName}</td>
				        <td align="center" > ${majorName} </td>
					    <td align="center" > ${className} </td>
					    <td align="center" >
						      <s:iterator  id="p" value="issueTypeList" status="sp">
								<s:if test="issueType.contains(\"&\"+issueTypeId+\"&\")">${issueTypeName }&nbsp;</s:if>
							 </s:iterator>
					    </td>
					    <td align="center" >${issueName }</td>
					    <td align="center" >${teacherName }</td>
					    <td align="center" >${planYear.year }</td>
					    <td align="center" width="20%">
					       <s:if test="groupAllotId==null" >
						   <a href="javascript:void(0)"
								   target="rightFrame" onclick="option(this,${stuId},'${stuName}')"> 
								   <font color="green"> <i class="layui-icon">&#xe618;</i>选择</font>
						   </a>
						   </s:if><s:else>
						      <font color="red"> 已选择</font>
						   </s:else>
						</td>
					</tr>
				</s:iterator> 
	     </tbody>
      </table>
      
<%@ include file="/WEB-INF/common/pagination.jsp"%>
</div>
</div>
    <div class="layui-tab-item <s:if test="tabFlag==00"> layui-show</s:if>">
    
  </div>

</div>
</div>
  <script>
layui.use('element', function(){
  var element = layui.element;
});
</script>  
<script type="text/javascript">

//多选
function allOption(){
	 var allGroupId = $("#allGroupId").val();
   var stuIds ="";
   var stuName ="<font color='blue'> ";
    $("input[name='selected']").each(function(index,content){
	           if(this.checked==true){
	            stuIds = stuIds+$(this).val()+",";
	            stuName = stuName+(index+1)+"."+$(this).attr('title')+"<br>";
	           }
	        });	  
    stuName=stuName+"</font>";
    if(allGroupId == ""){
        layer.alert('请先选择组名',{icon: 3});
    }else if(stuIds == ""){
        layer.alert('请勾选学生',{icon: 3});
    }else{
    	option(this,stuIds,stuName);
	}
}

//单选学生
function option(name,stuId,stuName){
	 var allGroupName = $("#allGroupId option:selected").text();
	 var allGroupId = $("#allGroupId").val();
	 if(allGroupId == ""){
	        layer.alert('请先选择组名',{icon: 3});
	        return;
	 }     
    	var index = layer.confirm(allGroupName+'<br>您确定选择 以下学生吗?<br><font color=\'blue\'>'+stuName+'</font>',{icon: 3, title:'提示'}, function(index){
    		      layer.close(index);
		          var index = layer.load(1);
				 
				  $.ajax({
			         type: "post",
			         cache: false,
			         url: '<%=path%>/biz/GroupStudent_addStudentGroup.action',
					 dataType : "json",
					 data : {
						"stuIds" : stuId+",",
						"thisGroupId" : allGroupId
					  },
				  success : function(result) {
						layer.close(index);
						if (result.length==0) {
							layer.alert('选择学生成功',{icon: 1},function(){
								openGroup(this,allGroupId,allGroupName,1);
								});
						}else{
							layer.alert('选择学生失败<br>'+result,{icon: 0},function(){
								openGroup(this,allGroupId,allGroupName,1);
								});
						}
					},
					error : function(result) {
						layer.msg('选择学生失败'+result,{icon: 2});
					}
				});
	          
			}); 
}

</script>
</body>
</html>
