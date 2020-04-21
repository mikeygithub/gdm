<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>进度情况</title>
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
<script type="text/javascript" src="<%=path%>/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>
<script type="text/javascript" src="<%=path%>/datePicket/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/js/select-ui.min.js"></script>

<script type="text/javascript">
function openAdd(thisId){

	layer.open({
    	type: 2,
    	area: ['100%', '100%'],
    	fix: false, //不固定
		title:'添加进度情况',
    	maxmin: true,
    	content: '<%=path%>/biz/progressSitu_openAdd.action?view=add&thisStuId=${thisStuId}&thisYear=${thisYear}&flag=05'
	});
	
}
 //搜索
    function openSearch(name){
    	$("#form1").submit();
    }
</script>

<style >
</style>
</head>
<body>

<form id="form1" name="form1"  action="<%=path%>/biz/progressSitu_list.action?view=list&page=${pageResult.page}" method="post">
        	<div class="place">
		<ul class="placeul">
		<li><span>院系：</span>${deptName }</li>
					<li>当前年度：
					<input class="dfinput" type="text"
						id="issueInfo.year" name="thisYear" readonly value="${thisYear}"
						style="text-align: center;"
						onClick="WdatePicker({dateFmt:'yyyy'});"></td>
				</li>
				<li class="click">
	        		<a href="javascript:void(0);"  onclick="openSearch(this);"><img src="<%=path%>/images/search.png"  />搜索</a>
				</li> 
		</ul>
		</div>
     </form>

    <div class="formbody">
      <div id="usual1" class="usual"> 
<%--      <%@ include file="/WEB-INF/page/business/materialInfo/select_tab.jsp"%>--%>
   <div id="tab2" class="tabson">

<%--		<div class="place">--%>
<%--		<span>位置：</span>--%>
<%--		<ul class="placeul">--%>
<%--		<li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>--%>
<%--		<li>进度情况</li>--%>
<%--		</ul>--%>
<%--		</div>--%>
		<div class="rightinfo">
<%--			<div class="formtitle">--%>
<%--				<span>进度情况列表</span>--%>
<%--			</div>--%>
        <form id="form1" name="form1"  action="<%=path%>/biz/progressSitu_list.action?view=list&page=${pageResult.page}" method="post">
		<ul class="placeul">
		<li><span>院系：</span>${deptName }</li>
					<li>当前年度：${thisYear }
					</td>
				</li>
				<li class="click">
	        		<a href="#" onclick="openAdd()"><img src="<%=path%>/images/t01.png"  style="width: 16px;"/>添加</a>
				</li>
		</ul>
		</div>
		<div class="formtitle" style="float:right;">
			<ul>
				<li class="line"> <a href="<%=path%>/biz/progressSitu_outProgressSitu.action?thisStuId=${thisStuId }&thisYear=${thisYear }">
				<font> <img src="<%=path%>/images/i01.png" width="20px" />一键导出</font></a></li>
			</ul>
		</div>
       </form>    
         <table class="tablelist fix-table" >
    	  <thead>
	        <tr>
	    	<th>序号</th>
	    	<th>学生姓名</th>
	    	<th>时间</th>
	    	<th colspan="2">工作要求</th>
	    	<th colspan="2">进程记录</th>
	    	<th>操作</th>
	        </tr>
         </thead>
         <tbody>
		 <s:if test="pageResult.data!=null&&pageResult.total>0">
			 <s:iterator id="p" value="pageResult.data" status="pp">
				 <tr id="tr_${progressId }">
					 <td align="center"><s:property value="#pp.count" /></td>
					 <td align="center">
							 ${stuName}
					 </td>
					 <td align="center">
							 ${progressTime}
					 </td>
					 <td align="center" class="fix-td" colspan="2">
							 ${progressWork}
					 </td>
					 <td align="center" class="fix-td" colspan="2">
							 ${progressRecord}
					 </td>

					 <td align="center" width="20%">
						 <a href="javascript:void(0)"
							target="rightFrame" onclick="del(this,${progressId});"> <font color="red"> <i class="layui-icon">&#xe640;</i>删除</font></a>
						 <a target="_parent" href="javascript:dialog('100%','100%','修改进度情况','<%=path%>/biz/progressSitu_openEdit.action?view=edit&thisId=${progressId }&flag=05', 'true','0');">
							 <font color="blue"> <i class="layui-icon">&#xe642;</i>修改</font></a>&nbsp;&nbsp;&nbsp;
						 <a target="_parent" href="javascript:dialog('100%','100%','查看进度情况','<%=path%>/biz/progressSitu_openEdit.action?view=detail&thisId=${progressId }&flag=05', 'true','20%');">
							 <font color="blue"> <i class="layui-icon">&#xe655;</i>查看</font></a>&nbsp;&nbsp;&nbsp;
					 </td>
				 </tr>
			 </s:iterator>
		 </s:if>
		 <s:else>
			 <tr><td align="center" colspan="8"><font>暂无数据</font></td></tr>
		 </s:else>

	     </tbody>
      </table>
<%@ include file="/WEB-INF/common/pagination.jsp"%>
</div>
</div>
</div>
<script type="text/javascript">
//删除
function del(name,id){
	var re=$(name).parent().parent();
	layer.confirm('您确定要删除该记录吗?', {icon: 3, title:'提示'}, function(index){
		  layer.close(index);
		var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/biz/progressSitu_del.action',
					dataType : "json",
					data : {
						"thisId" : id
					},success : function(result) {
						layer.close(index); 
						if (result) {
							re.remove();
							layer.alert('删除成功',{icon: 1},function(){
								 location.reload();
								});
						}else{
							layer.msg('删除失败',{icon: 2});
						}
					},
					error : function(result) {
						layer.close(index); 
						layer.msg('删除失败',{icon: 2});
					}
				});
});
}
</script>
</body>
</html>


