<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>答辩记录</title>
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
</head>
<body>
		<div class="place">
		<span>位置：</span>
		<ul class="placeul">
		<li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>
		<li>答辩记录信息</li>
		</ul>
		</div>

		<div class="rightinfo">
			<div class="formtitle">
				<span>答辩记录列表</span>
			</div>
        <form id="form1" name="form1"  action="<%=path%>/biz/defenseRecord_list.action?view=list&page=${pageResult.page}" method="post">
			<%--<%@ include file="/WEB-INF/page/business/materialInfo/select_info_tab.jsp"%>--%>
			<div class="place">
				<%--<input name="thisStuId" type="hidden"  value="${thisStuId }">--%>
				<%--<input type="hidden" name="thisYear" value="${thisYear }" >--%>
				<ul class="placeul">
					<li class="click">
	        		<a href="<%=path%>/biz/defenseRecord_openAdd.action?view=add&flag=11&thisStuId=${thisStuId }&thisYear=${thisYear }" >
	        		<img src="<%=path%>/images/t01.png"  style="width: 16px;"/>添加</a>
				</li>

		</ul>
		</div>
       </form>
        <table class="tablelist" align="right">
    	  <thead>
	    	<tr>
	    	<th>序号</th>
	    	<th>题目</th>
	   		<th>指导老师</th>
	   		<th>年度</th>
	   		<th>操作</th>
	        </tr>
         </thead>
         <tbody>
		 <s:if test="pageResult.data!=null">
			 <s:iterator id="p" value="pageResult.data" status="pp">
				 <tr id="tr_${defenseId }">
					 <td align="center">
						 <s:property value="#pp.count" /></td>
					 <td align="center">
							 ${issueName}
					 </td>
					 <td align="center" >
							 ${teacherName}
					 </td>
					 <td align="center" >${year}</td>
					 <td align="center" width="20%">
						 <a href="javascript:void(0)" target="rightFrame" onclick="del(this,'${defenseId}' );">
							 <font color="red"> <i class="layui-icon">&#xe618;</i>删除</font>
						 </a>
						 <a href="<%=path%>/biz/defenseRecord_openEdit.action?view=detail&flag=11&thisId=${defenseId }&thisStuId=${thisStuId }&thisYear=${year}">
							 <font color="blue"> <i class="layui-icon">&#xe655;</i>查看</font>
						 </a>

						 <a href="<%=path%>/biz/defenseRecord_openEdit.action?view=edit&flag=11&thisId=${defenseId }&thisStuId=${thisStuId }&thisYear=${year}">
							 <font color="blue"> <i class="layui-icon">&#xe642;</i>修改</font>
						 </a>

						 <a href="<%=path%>/biz/defenseRecord_outDefenseRecord.action?thisId=${defenseId }">
							 <font> <img src="<%=path%>/images/i01.png" width="20px" />导出</font>
						 </a>
					 </td>
				 </tr>
			 </s:iterator>
		 </s:if>
		 <s:else>
			 <tr><td align="center" colspan="5"><font>暂无数据</font></td></tr>
		 </s:else>

	     </tbody>
      </table>
			<div class="layui-form-item"></div>
			<%@ include file="/WEB-INF/common/pagination.jsp"%>
		</div>
<script type="text/javascript">
//删除
function del(name,id){
	var re=$(name).parent().parent();
	layer.confirm('您确定要删除该答辩记录吗?', {icon: 3, title:'提示'}, function(index){
		  layer.close(index);
		var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/biz/defenseRecord_del.action',
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
