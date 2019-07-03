<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>课题信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />

<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>
<script type="text/javascript" src="<%=path%>/datePicket/WdatePicker.js"></script>
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
		<li><a href="<%=path %>/Userlogin.action">首页</a></li>
		<li>所分配评阅学生信息</li>
		</ul>
		</div>
		<div class="rightinfo">
			<div class="formtitle">
				<span>所分配评阅学生列表</span>
			</div>
        <form id="form1" name="form1"  action="<%=path%>/biz/materialInfo_guideStudentList.action?view=reviewDissertation&flag=13" method="post">
        	<div class="place">
		<ul class="placeul">
		<li><span>院系：</span>${teacher.deptName }</li>
		<li><span>大类：</span>${teacher.categoryName }</li>
					<li>当前年度：
					<input class="dfinput" type="text"
						id="issueInfo.year" name="thisYear" readonly value="${model.year}"
						style="text-align: center;"
						onClick="WdatePicker({dateFmt:'yyyy'});"></td>
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
	    	<th colspan="4">学生信息</th>
	    	<th colspan="2">课题信息</th>
	   		<th rowspan="2">论文评阅</th>
	   		<th rowspan="2">论文下载</th>
	   		<th rowspan="2">年度</th>
	        </tr>
	        <tr>
	    	<th>序号</th>
	    	<th>学院</th>
	    	<th>专业</th>
	    	<th>班级</th>
	    	<th>姓名</th>
	    	<th>课题</th>
	    	<th>课题类型</th>
	        </tr>
         </thead>
         <tbody>
         <s:iterator id="p" value="pageResult.data" status="pp">
         <tr id="tr_${taskId }">
						<td align="center"><s:property value="#pp.count" /></td>
						  <td align="center">
				        			${student.deptName}
				        		
		               </td>
					   <td align="center">
				        			${student.majorName}
		                </td>
				        <td align="center">
				        			${student.className}
				        </td>
				        
						<td align="center" >${student.stuName}</td>
				       <%-- <td align="center">
					       <s:if test="issueInfo.issueId==null">
					        <font color="red">未录入</font>
					       </s:if>
					       <s:else>
					        <font color="blue">${issueInfo.issueName}</font>
					       </s:else>
				        </td>  --%>
				        <td align="center">
					       <s:if test="issueInfo.issueId==null">
					        <a href="javascript:dialog('90%','90%','【<font color=blue >${student.stuName }</font>】 课题信息',
					        '<%=path%>/biz/issueInfo_openEdit.action?view=add&thisStuId=${student.stuId }&thisYear=${model.year }', 'true','20%');" target="rightFrame" >  
					       <font color="red">未录入</font></a>
					       </s:if>
					       <s:else>
					        <a href="javascript:dialog('98%','98%','【<font color=blue >${student.stuName }</font>】 课题信息',
					        '<%=path%>/biz/issueInfo_openEdit.action?view=edit&thisStuId=${student.stuId }&thisId=${issueInfo.issueId }&thisYear=${model.year }', 'true','20%');" target="rightFrame" >  
					       <font color="blue">${issueInfo.issueName}</font></a>
					       </s:else>
				        </td> 
						  <td align="center" >
					           <s:iterator  id="p" value="issueTypeList" status="sp">
							   <s:if test="issueInfo.issueType.contains(\"&\"+issueTypeId+\"&\")">${issueTypeName }&nbsp;</s:if>
						        </s:iterator>
					    </td>
				<td align="center">
				       <s:if test="reviewReadId==null">
				        <a href="javascript:dialog('98%','98%','【<font color=blue >${student.stuName }</font>】 评阅老师评阅信息','
				          <%=path%>/biz/review_openAdd.action?view=add&thisStuId=${student.stuId }&thisReviewType=01&thisYear=${model.year }&flag=07', 'true','20%');" target="rightFrame" >  
				       <font color="red">未录入</font></a>
				       </s:if><s:else>
				         <a href="javascript:dialog('98%','98%','【<font color=blue >${student.stuName }</font> 】评阅老师评阅信息','
				          <%=path%>/biz/review_openEdit.action?view=edit&thisId=${reviewReadId }&thisStuId=${student.stuId }&thisReviewType=01&thisYear=${model.year }&flag=07', 'true','20%');" target="rightFrame" >  
				      <font color="blue">查看</font></a>
				       </s:else>
				        </td>   
				         <td align="center">
					         <s:if test='(issueInfo.issueId==null || issueInfo.issueId =="") && (paperId == null || paperId =="")' >
					              <font color="red">课题未录入 }</font>
					         </s:if>
					         <s:elseif test='(issueInfo.issueId!=null && issueInfo.issueId !="") && (paperId == null || paperId =="")' >
					             <font color="red">论文未录入</font>
					         </s:elseif>
					         <s:elseif test='(issueInfo.issueId!=null && issueInfo.issueId !="") && (paperId != null && paperId !="")' >
					             <a href=" <%=basePath%>/biz/paper_downFile.action?thisId=${paperId}";
				                       id="fileInfoDownLoad"  style="color: blue;">下载</a>
					         </s:elseif>
				         </td>
				         <td align="center">  ${model.year} </td> 
						</tr>
			</s:iterator>
	     </tbody>
      </table>
</div>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>

</body>
</html>


