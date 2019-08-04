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
		<div class="rightinfo" id="stu">
			<div class="formtitle">
				<span>已选学生信息  已选/可带： 
				 <font style="font-weight: bold;font-size: 14px; "color="blue">
				 ${guideCount.alreadyStuNum }/${guideCount.maxStuNum }人</font></span>
			</div>
        <table class="tablelist" >
    	  <thead>
	    	<tr>
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
						<td align="center" >${year}</td>
						<td align="center" width="20%">
							<a  href="javascript:void(0);" onclick="del(this,${allotGuideId});">
							      <font color="red"> <i class="layui-icon">&#x1006;</i>移除</font></a>
								</td>
					</tr>
				</s:iterator>
	     </tbody>
      </table>
</div>
		
		<div class="rightinfo">
			<div class="formtitle">
				<span>学生列表</span>
			</div>
        <form id="form1" name="form1"  action="<%=path%>/biz/allotGuide_allotStudentList.action?view=student_list&page=${pageResult1.page}" method="post">
        	<div class="place">
		<ul class="placeul">
		<li><span>院系：</span>${teacher.deptName }</li>
			<li class="click" style="font-size: 12px">
	        		<span>专业：</span><s:select cssClass="dfinput" list="sysMajorList" 
	        		headerKey="" headerValue="所有专业"
	        		cssStyle="width: auto;" onchange="$('#form1').submit();"
	        		listKey="majorId" listValue="majorName"  name="majorId" id="majorId"/>
	        		
        		    <input type="text" class="dfinput" id="selectValue" name="stuName"
	        		       placeholder="学生姓名"  >
        		</li>
        		<li class="click">
	        		<a href="javascript:void();"  onclick="openSearch(this);"><img src="<%=path%>/images/search.png"  />搜索</a>
				</li>
				
				<span>
				 已选学生数： <font style="font-weight: bold;"color="blue"> ${guideCount.alreadyStuNum }人 </font>
				 可带学生数：  <font style="font-weight: bold;"color="blue">${guideCount.maxStuNum }人</font>
				 </span>
		</ul>
		</div>
       </form>
        <table class="tablelist" >
    	  <thead>
	    	<tr>
	    	<th>序号</th>
	    	<th>所在学院</th>
	    	<th>专业</th>
	    	<th>班级</th>
	    	<th>年度</th>
	    	<th>学生学号</th>
	   		<th>学生姓名</th>
	   		<th>性别</th>
	   		<th>状态</th>
	        </tr>
         </thead>
         <tbody>
				<s:iterator id="p" value="pageResult1.data" status="pp">
					<tr id="tr_${id}">
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
				        <td align="center" >${year}</td>
						<td align="center" >${stuNo}</td>
						<td align="center" >${stuName}</td>
						<td align="center" >
						<s:if test="userSex==1">男</s:if>
						<s:if test="userSex==0">女</s:if></td>
						<td align="center" width="20%">
						  <s:if test="allotGuideId!=null">
						      <font color="red"><i class="layui-icon">&#x1006;</i>已被选</a></font>
						 </s:if><s:else>
						 <a href="javascript:void(0)"
						    	target="rightFrame" onclick="option(this,'${stuId}' ,'${stuName}' );">  
							      <font color="green"> <i class="layui-icon">&#xe618;</i>可选</font></a>
						 </s:else>
								</td>
					</tr>
				</s:iterator>
	     </tbody>
      </table>
<%@ include file="/WEB-INF/common/pagination1.jsp"%>
</div>
<script type="text/javascript">
//选择学生
function option(name,stuId,stuName){
	
var maxStuNum = '${guideCount.maxStuNum}';
var alreadyStuNum = '${guideCount.alreadyStuNum}';	
	
	if(maxStuNum!=''&&maxStuNum!=undefined&&alreadyStuNum!=''&&alreadyStuNum!=undefined&&maxStuNum==alreadyStuNum){
		layer.alert('最多可选:${guideCount.maxStuNum} 位学生， 不能再选其他学生！',{icon: 3});
	}else {
		layer.confirm('您确定选择 '+stuName+'  学生吗?', {icon: 3, title:'提示'}, function(index){
			  layer.close(index);
		var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/biz/allotGuide_add.action',
					dataType : "json",
					data : {
						"stuId" : stuId
					},success : function(result) {
						layer.close(index); 
						if (result) {
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
//删除已选学生
function del(name,id){
	var re=$(name).parent().parent();
	layer.confirm('您确定要移除该学生吗?', {icon: 3, title:'提示'}, function(index){
		  layer.close(index);
		var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/biz/allotGuide_del.action',
					dataType : "json",
					data : {
						"id" : id
					},success : function(result) {
						layer.close(index); 
						if (result) {
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
