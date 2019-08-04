<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>指导分配老师管理</title>
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

</script>

</head>
       <body>
       
		   <div class="place">
		<span>位置：</span>
		<ul class="placeul">
		<li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>
		<li>选择指导老师</li>
		</ul>
		</div>
		<div class="rightinfo">
			<div class="formtitle">
				<span>指导老师列表</span>
			</div>
        <form id="form1" name="form1"  action="<%=path%>/biz/allotGuide_allotTeacherList.action?view=teacher_list&flag=01&page=${pageResult.page}" method="post">
        	<div class="place">
		<ul class="placeul">
		    <li><span>院系：</span>${student.deptName }</li>
			<li class="click" style="font-size: 12px">
	        		<span>专业：</span><s:select cssClass="dfinput" list="sysMajorList" 
	        		cssStyle="width: auto;" onchange="$('#form1').submit();" 
	        		listKey="majorId" listValue="majorName"  name="majorId" id="majorId"/>
	        		
        		    <input type="text" class="dfinput" id="selectValue" name="teacherName"
	        		       placeholder="老师名称"  >
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
		   		<th>老师名称</th>
	   		    <th>所在学院</th>
		   		<th>所在教研室</th>
		   		<th>老师职称</th>
		   		<th>性别</th>
		   		<th>联系电话</th>
		   		<th>年度</th>
		   		<th>所带专业</th>
		   		<th>研究方向</th>
		   		<th>最多人数</th>
		   		<th>已选人数</th>
		   		<th>状态</th>
	        </tr>
         </thead>
         <tbody>
				<s:iterator id="p" value="pageResult.data" status="pp">
					<tr id="tr_${teacherId}">
						<td align="center"><s:property value="#pp.count" /></td>
						<td align="center" >${teacherName}</td>
						<td align="center" > ${deptName}</td>
						<td align="center" > ${staffName} </td>
						<td align="center" > ${technicalName}</td>
						<td align="center" >
						<s:if test="userSex==0">男</s:if>
						<s:if test="userSex==1">女</s:if></td>
						<td align="center" >${userTel}</td>
						<td align="center" >${year}</td>
						<td align="center" >
						 <s:iterator id="tml" value="teacherMajorList">
						          ${majorName} &nbsp;
						</s:iterator></td>
							<td align="center" >
								<c:if test="${teacherDirectionList==[]}">
									<font color="red">未录入</font>
								</c:if>
								<c:if test="${teacherDirectionList!=[]}">
									<s:iterator id="tml" value="teacherDirectionList">
										<s:iterator id="sml" value="sysDirectionList">
											<s:if test="#tml.directionsId == directionsId">
												${sml.directionsName} &nbsp;
											</s:if>
										</s:iterator>
									</s:iterator>
								</c:if>
							</td>
						<td align="center" ><font color="blue"> ${maxStuNum}</font></td>
						<td align="center" >${alreadyStuNum}</td>
						
						<td align="center" width="20%">
						<s:if test="teacher.teacherId==teacherId">
						   <font color="green"> 已选</font></a>
						</s:if><s:else>
						    <s:if test="maxStuNum==alreadyStuNum">
				               <font color="blue"> 人数已满</font>
				            </s:if>	
						 </s:else>
						 
						  <s:if test="teacher.teacherId==null">
				             <a href="javascript:void(0)"
						    	target="rightFrame" onclick="option(this,'${teacherId}' ,'${teacherName}'  );">  
							      <font color="blue"> <i class="layui-icon">&#xe618;</i>可选</font></a>
						 </s:if>
						 <s:if test="teacher.teacherId!=teacherId&teacher.teacherId!=null">
						  <font color="red">不可选 </font>
						 </s:if>
						 </td>
					</tr>
				</s:iterator>
	     </tbody>
      </table>
<%@ include file="/WEB-INF/common/pagination.jsp"%>
</div>

<div class="rightinfo" id="stu">
			<div class="formtitle">
				<span>学生已选指导老师</span>
			</div>
        <table class="tablelist" >
    	  <thead>
	    	<tr>
	    	<th>序号</th>
	   		<th>指导老师名称</th>
	   		 <th>所在学院</th>
		   	<th>所在教研室</th>
		   	<th>老师职称</th>
		   	<th>性别</th>
		   	<th>联系电话</th>
	   		<th>分配时间</th>
	   		<th>年度</th>
	   		<th>操作</th>
	        </tr>
         </thead>
         <tbody>
         <s:if test="teacher.teacherId!=null">
					<tr id="tr_${model.id}">
						<td align="center">1</td>
						<td align="center" >${teacher.teacherName}</td>
						<td align="center" > ${teacher.deptName}</td>
						<td align="center" > ${teacher.staffName} </td>
						<td align="center" > ${teacher.technicalName}</td>
						<td align="center" >
						<s:if test="teacher.userSex==0">男</s:if>
						<s:if test="teacher.userSex==1">女</s:if></td>
						<td align="center" >${teacher.userTel}</td>
						<td align="center" >${model.opTime}</td>
						<td align="center" >${model.year}</td>
						<td align="center" width="20%">
							<a  href="javascript:void(0);" onclick="del(this,'${model.id},');">
							      <font color="red"> <i class="layui-icon">&#x1006;</i>退选</font></a>&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					</s:if>
	     </tbody>
      </table>
</div>
<script type="text/javascript">
//选择老师
function option(name,teacherId,reacherName){
	var alist = '${allotGuideList[0]}';
	
	if(alist!=''&&alist!=undefined){
		layer.alert('已选指导老师:${allotGuideList[0].teacherName} 不能再选其他老师！',{icon: 3});
	}else {
		layer.confirm('您确定选择 '+reacherName+'  作为你的指导老师吗?', {icon: 3, title:'提示'}, function(index){
			  layer.close(index);
		var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/biz/allotGuide_addTeacher.action',
					dataType : "json",
					data : {
						"teacherId" : teacherId
					},success : function(result) {
						layer.close(index); 
						if (result) {
							layer.alert('选择老师成功',{icon: 1},function(){
								 location.reload();
								});
						}else{
							layer.msg('选择老师失败',{icon: 2});
						}
					},
					error : function(result) {
						layer.close(index); 
						layer.msg('选择老师失败',{icon: 2});
					}
				});
		});
			}
		}
		
//删除已选老师
function del(name,id){
	var re=$(name).parent().parent();
	layer.confirm('您确定要退选该老师吗?', {icon: 3, title:'提示'}, function(index){
		  layer.close(index);
		var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/biz/allotGuide_del.action',
					dataType : "json",
					data : {
						"thisIds" : id
					},success : function(result) {
						layer.close(index); 
						if (result) {
							re.remove();
							layer.alert('退选成功',{icon: 1},function(){
								 location.reload();
								});
						}else{
							layer.msg('退选失败',{icon: 2});
						}
					},
					error : function(result) {
						layer.close(index); 
						layer.msg('退选失败',{icon: 2});
					}
				});
});
}
</script>
		
		</body>
</html>
