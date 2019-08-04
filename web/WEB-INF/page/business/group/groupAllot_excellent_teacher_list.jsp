<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>教师分组管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/third/jquery-1.9.1.min.js"></script>

<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>
<script type="text/javascript" src="<%=path%>/js/business/group/add_group.js"></script>

<script type="text/javascript">
function openGroup(){
	var tableData =  $("<table border=\"1\" class=\"tablelist\"></table>");
	 var trData0=$("<tr ></tr>");
	  var  tdData =  '<input type="text" class="dfinput" id="groupAllotName" name="groupAllotName" placeholder="输入组名" >';
	  var td1=$("<td ign=\"center\">&nbsp;组名:&nbsp;</td>");
	  var td2=$("<td >"+tdData+"</td>");
	  td1.appendTo(trData0);
	  td2.appendTo(trData0);
	var trData1=$("<tr class=\"odd\"><td colspan=\"2\">&nbsp;选择答辩方向</td></tr>");  
	var trData2 = $('<s:iterator  value="majorList" ><tr>'
	+'<td align="center" ><input type="checkbox" name="catS" value="${majorId}"> </td>'
	+'<td align="center">${majorName }</td>'
	+'</tr></s:iterator>');


	trData0.appendTo(tableData);
	// groupAllot.appendTo(tableData);//组长
	trData1.appendTo(tableData);
	trData2.appendTo(tableData);

	  var index = layer.confirm(''+tableData[0].outerHTML, {title:'添加大组'}, function(index){
			 var categoryIds ="";
			    $("input[name='catS']").each(function(index,content){
				           if(this.checked==true){
				        	   categoryIds = categoryIds+$(this).val()+",";
				           }
				        });	
			    addGroup(categoryIds,$('#groupAllotName').val(),'01',${listGroupTeacher.deptNumber},index)
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

</head>
<body>
		<div class="place">
		<span>位置：</span>
		<ul class="placeul">
		<li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>
		<li>选择所带教师</li>
		</ul>
		</div>
		  <div class="layui-tab">
  <ul class="layui-tab-title">
    <li >
   <a  class="selected" href="<%=path%>/biz/GroupTeacher_list.action?view=teacher_list&thisYear=${thisYear }&flag=08" >  
	 教师列表(<font style="font-weight: bold;font-size: 14px; "color="blue">${pageResult.total }</font>)- 答辩组</a>  
    </li>
    <li  class="layui-this">
    <a  class="selected" href="<%=path%>/biz/GroupTeacher_list.action?view=excellent_teacher_list&thisYear=${thisYear }&flag=08" >  
	 教师列表(<font style="font-weight: bold;font-size: 14px; "color="blue">${pageResult.total }</font>)- 大组</a>  
    </li>
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item layui-show">
		<div class="rightinfo">
		
		 <form id="form1" name="form1"  action="<%=path%>/biz/GroupTeacher_list.action?view=excellent_teacher_list&page=${pageResult.page}&listGroupTeacher.groupType=01&flag=08" method="post">
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
						   <font color="blue">${categoryName }&nbsp;</font>
						 </s:iterator></span>
				</li>		
				</s:if>	
			</ul>
		</div>
	<div class="place">
        <ul class="placeul">
		          <li class="click" style="font-size: 12px">
			        <span>院系：<s:select cssClass="dfinput" list="sysDepartmentList" 
	        		cssStyle="width: auto;" onchange="$('#form1').submit();" 
	        		listKey="deptNumber" listValue="deptName"  name="listGroupTeacher.deptNumber" id="listGroupTeacher.deptNumber"/></span>
			     </li>   
			    <li class="click" style="font-size: 12px">
			        <span>大类：<s:select cssClass="dfinput" list="sysCategoryList" 
			        headerKey="" headerValue="所有大类"
	        		cssStyle="width: auto;" onchange="$('#form1').submit();"
	        		listKey="categoryId"  listValue="categoryName"  name="listGroupTeacher.categoryId" id="listGroupTeacher.categoryId"/></span>
			     </li>
			     <li class="click" style="font-size: 12px">
	        		<span>教研室：<s:select cssClass="dfinput" list="sysMajorList" 
	        		cssStyle="width: auto;" onchange="$('#form1').submit();"
	        		headerKey="" headerValue="所有教研室"
	        		listKey="majorId" listValue="staffName"  name="listGroupTeacher.staffroomId" id="listGroupTeacher.staffroomId"/>
        		    <input type="text" class="dfinput" id="selectValue" name="listGroupTeacher.teacherName"
	        		       placeholder="教师姓名"  ></span>
        		</li>
        		<li class="click">
	        		<a href="javascript:void(0);"  onclick="openSearch(this);"><img src="<%=path%>/images/search.png"  />搜索</a>
				</li>
					<li class="click">
	        		<a href="<%=path%>/biz/GroupAllot_list.action?view=list&groupType=01" ><img src="<%=path%>/images/t01.png"  style="width: 16px;"/>查看分组</a>
				</li>
				</li>
					<li class="click">
	        		<a href="javascript:void(0);"  onclick="openGroup();" ><img src="<%=path%>/images/t01.png"  style="width: 16px;"/>添加大组</a>
				</li>
			</ul>
		</div>
			</form>
        <table class="tablelist">
    	  <thead>
	        <tr>
	         <th>序号</th>
	   		 <th>教师名称</th>
   		     <th>所在学院</th>
   		     <th>大类</th>
   		     <th>所在教研室</th>
   		     <th>教师职称</th>
   		     <th>年度</th>
   		     <th>组名</th>
	   		 <th>状态</th>
	        </tr>
         </thead>
         <tbody>
				<s:iterator id="p" value="pageResult.data" status="pp">
					<tr id="tr_${teacherId}">
					    <td align="center"><s:property value="#pp.count" /></td>
					    <td align="center" >${teacherName}</td>
						<td align="center">
				           ${deptName}
		                </td>
		                <td align="center" >
						   ${categoryName }
					    </td>
					    <td align="center" >
						   ${staffName} 
					    </td>
					    
				        <td align="center" >
						   ${technicalName} 
					    </td>
					    <td align="center" >${planYear.year }</td>
					    <td align="center" >
					        <c:choose>
					            <c:when test="${groupName == null}"></c:when>
					            <c:when test="${groupName != null}">${groupName}</c:when>
					        </c:choose>	
					        <s:if test="groupAllotId!=null">
					        <c:if test="${type == 0}">(组长)</c:if> 
						    <c:if test="${type == 1}">(答辩教师)</c:if> 
						    <c:if test="${type == 2}">(记录员)</c:if> 
						    </s:if>
					    </td>
					   <td align="center" width="20%">
							 <s:if test="groupType==01">
								 <font color="red"> 已选择</font>
								</s:if><s:else>
								<a href="javascript:void(0)"
								   target="rightFrame" onclick="option(this,${teacherId},'${teacherName}')"> 
								    <font color="green"> <i class="layui-icon">&#xe618;</i>选择</font>
								</a>
						   </s:else>
						</td>
					</tr>
				</s:iterator>
	     </tbody>
	     
      </table>
      </div>
  <%@ include file="/WEB-INF/common/pagination.jsp"%>
</div>
   

</div>
</div>
  <script>
layui.use('element', function(){
  var element = layui.element;
});
</script>  
<script type="text/javascript">
//选择教师
function option(name,teacherId,teacherName){
    var allGroupId = $("#allGroupId").find("option:selected").val();
    if(allGroupId == ""){
        layer.alert('请先选择组名',{icon: 3});
    }else{
	    var count = '${count}';
		if(count!=''&&count!=undefined&&count=='3'){
			layer.alert('已选${count}位教师 ，不能再选其他教师！',{icon: 3});
			}else{
			
			var index = layer.confirm("您确定选择 "+teacherName+"  教师  <p>并指定他为 " 
			+"<select id='teachType' class='dfinput' style='width:auto;'>" 
			+"<option value=0> 组长</option>" 
			+"<option value=1> 答辩教师 </option>" 
			+"<option value=2> 记录员</option></select>  吗?" 
			              ,{icon: 3, title:'提示'}, function(index){
			var teachType = $("#teachType").val();
			var isSelect = false;
			$("input[name='p_userType']").each(function(index,content){
	           if($(this).val()==teachType)
	            isSelect = true;
	        });
			
	        if(isSelect){
	           if(0 == teachType){
	               layer.alert('不能重复选择组长',{icon: 3});
	           }else if(1 == teachType){
	               layer.alert('不能重复选择答辩教师',{icon: 3});
	           }else if(2 == teachType){
	               layer.alert('不能重复选择记录员',{icon: 3});
	           }
	        }else{
	        var index = layer.load(1);
			  $.ajax({
		         type: "post",
		         cache: false,
		         url: '<%=path%>/biz/GroupTeacher_addTeacherGroup.action',
						dataType : "json",
						data : {
							"thisTeacherId" : teacherId,
							"teachType" : teachType,
							"thisGroupId" : allGroupId
						},
						success : function(result) {
							layer.close(index); 
							if (result) {
								layer.alert('选择教师成功',{icon: 1},function(){
									 location.reload();
									});
							}else{
								layer.msg('选择教师失败',{icon: 2});
							}
						},
						error : function(result) {
							layer.close(index); 
							layer.msg('选择教师失败',{icon: 2});
						}
					});
	           }
			}); 
		}
    }
}
    //删除已选教师
    function del(name,id){
	     var re=$(name).parent().parent();
	     layer.confirm('您确定要移除该教师吗?', {icon: 3, title:'提示'}, function(index){
		 layer.close(index);
		 var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/biz/GroupTeacher_delTeacher.action',
					dataType : "json",
					data : {
						"thisId" : id
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
