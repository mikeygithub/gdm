<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>公告信息管理</title>
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
    	area: ['50%', '84%'],
    	fix: false, //不固定
		title:'发布公告',
    	maxmin: true,
    	content: '<%=path%>/sys/notice_openAdd.action?view=add'
	});
}
 //搜索
    function openSearch(name){
	
    	var type =  $("#selectName").val();
    	var nameValie = "";
    	if(type=='1'){
 			nameValie = "model.noticeId";
 		}else if(type=='2'){
			nameValie = "model.noticeName";
 		}else {
			nameValie = "model.noticeName";
		}
    	$("#selectValue").attr("name",nameValie);
    	$('#form1').submit();
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
<li>公告信息管理</li>
</ul>
</div>
		<div class="rightinfo">
			<div class="formtitle">
				<span>公告信息管理</span>
			</div>
        <form id="form1" name="form1" action="<%=path%>/sys/notice_list.action?resUri=list&view=list&page=${pageResult.page}" method="post">
        	
        	 	<div class="place">
		<ul class="placeul" style="font-size: 12px">
		
		        <li class="click" >
        		     <input type="text" class="dfinput" id="selectValue" name=""
        		        placeholder="请输入信息" style="line-height: 18px;"  > 
	        	</li>	
		
        		<li class="click">
	        		<a href="javascript:void(0)"  onclick="openSearch(this);"><img src="<%=path%>/images/search.png"  />搜索</a>
				</li>
					
				<li class="click">
<%--					非教师身份不允许发布公告--%>
					<s:if test="LoginUser.userType!=1">
						<a href="#" onclick="openAdd()"><img src="<%=path%>/images/t01.png"  style="width: 16px;"/>发布公告</a>
					</s:if>
				</li>
		</ul>
		</div>
     </form>
        <table class="tablelist fix-table" >
    	<thead>
    	<tr>
    	<th>序号</th>
   		<th>公告人</th>
   		<th>公告标题</th>
   		<th>公告内容</th>
   		<th>公告时间</th>
   		<th>操作</th>
        </tr>
        </thead>
        <tbody>
				<s:iterator id="p" value="pageResult.data" status="pp">
					<tr id="tr_${id}">
						<td align="center"><s:property value="#pp.count" /></td>
						<%-- <td align="center" >${userId}</td> --%>
						
						<td align="center">
			                <s:iterator value="userHelpList" id="uhl">
					          <s:if test="#p.userId == #uhl.id">
					            ${userName}
					          </s:if>
					        </s:iterator>
		                </td>
						
						<td align="center" >${noticeName}</td>
						<td align="center" class="fix-td" >${noticeContent}</td>
						<td align="center" >${noticeTime}</td>
						<td align="center" width="20%">
							<s:if test="LoginUser.id==#p.userId">
								<a href="javascript:void(0)"
								   target="rightFrame" onclick="del(this,${noticeId},'${noticeName}');"> <font
										color="red"> <i class="layui-icon">&#xe640;</i>删除
								</font>
								</a>
							</s:if>
							<a href="javascript:dialog('100%','100%','通知详情','<%=path%>/sys/notice_openNotice.action?view=detail&model.noticeId=${noticeId}', 'true','0%','0%');"> <i class="layui-icon">&#xe649;</i>详情</a>

<!--							<a href="javascript:void(0)" onclick="openNotice(${noticeId});"> <font color="red"> <i class="layui-icon">&#xe649;</i>详情</font></a>-->
						<%--							管理员可删除所有通知--%>
							<s:if test="LoginUser.userType=='3'">
								<a href="javascript:void(0)"
								   target="rightFrame" onclick="del(this,${noticeId});"> <font
										color="red"> <i class="layui-icon">&#xe640;</i>删除
								</font>
								</a>
							</s:if>
						</td>
					</tr>
				</s:iterator>
				</tbody>
</table>
<%@ include file="/WEB-INF/common/pagination.jsp"%>
</div>

<script type="text/javascript">
//单个删除
function del(name,id,noticeName){
	var re=$(name).parent().parent();
	// if(confirm("您确定要删除吗?")){
	// 	var index = layer.load(1);
	layer.confirm('您确定要删除 <font color="red">'+noticeName+'</font> 吗?', {icon: 2, title:'提示'}, function(index){
		layer.close(index);
		var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/sys/notice_del.action',
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
				}
				);
			});
		}

function openNotice(noticeId) {
	layer.open({
		type: 2,
		area: ['99%', '99%'],
		offset: '10px',
		fix: false, //不固定
		title: false,
		maxmin: false,
		content: '<%=path%>/sys/notice_openNotice.action?view=detail&model.noticeId=' + noticeId,
		//去除最大化最小化
		success: function(layero) {
			layero.find('.layui-layer-min').remove();
			layero.find('.layui-layer-max').remove();
		}
		});

}
</script>
</body>
</html>
