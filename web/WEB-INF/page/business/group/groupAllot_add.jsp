<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>添加用户</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>

<script type="text/javascript">
$(function(){
    $("#form1").validate({
        errorClass:"errorInfo", //默认为错误的样式类为：error
        errorElement:"em",
        focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
        onkeyup: false,   
        submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form
        		addGroup();
        },   
        rules:{
        	"groupAllotName":{
                required:true,
                remote: {  
	                type: "post",  
	                url: "<%=path %>/biz/GroupAllot_checkName.action",  
	                data: {  
	                    "model.groupName":  function(){ return $("#groupAllotName").val(); }
	                },  
	                dataType: "html",  
	                dataFilter: function(data, type) {
	                var tag = document.getElementsByTagName("i");
					tag[0].style.display = "none"; 
	                    if (data == "true"){  
	                        return true;  
	                    }else{  
	                        return false;  
	                    }  
	                }  
	            },
	            required:true,
            },
        },
        messages:{
        	"groupAllotName":{
        		required:"组名不能为空",
        	 remote:"该组名已存在"},
        },
        errorPlacement: function(error, element) { //错误信息位置设置方法
			error.appendTo( element.parent() ); //这里的element是录入数据的对象
		}
    });  
    //添加分组
    function addGroup(){
	     layer.confirm('您确定要添加该分组?', {icon: 3, title:'提示'}, function(index){
		 layer.close(index);
		 var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/biz/GroupAllot_add.action',
					dataType : "json",
					data : {
						"model.groupName" : function(){ return $("#groupAllotName").val(); }
					},success : function(result) {
						layer.close(index); 
						if (result) {
							layer.alert('添加分组成功',{icon: 1},function(){
								 location.reload();
								});
						}else{
							layer.msg('添加分组失败',{icon: 2});
						}
					},
					error : function(result) {
						layer.close(index); 
						layer.msg('添加分组失败',{icon: 2});
					}
				});
    });
}
});

	 $(function(){
	     var flag="${mark}";
	     if(flag!='' && flag!=undefined){
	    	 if(flag=="1"){
	        $('#submit').attr('disabled','disabled');
	        layer.msg('添加成功');
	        setTimeout(function(){
	           parent.location.reload();
	           layer.close(index);
	        },1000);
	     }else if(flag=="0"){
	     layer.msg('添加失败');
	     }
	    }
	});
</script>

</head>
<body style="min-width: 200px">
	<div class="main">
		<form action="<%=path%>/biz/readGroup_add.action?view=add"
			method="post" name="form1" id="form1"  >
			<table class="tablelist">
			<tbody>
			<tr>
			<td align="center">组名： </td>
			<td  ><input type="text" class="dfinput" id="groupAllotName" name="groupAllotName"
	        		       placeholder="输入组名"  >
	        		<a href="#" class="addGroup" onclick="$('#form1').submit();"><img src="<%=path%>/images/t01.png"  style="width: 16px;"/>添加</a>
				 </td>
			</tr>
			<%--组长--%>
			<%--<tr>--%>
				<%--<td>组长</td>--%>
				<%--<td><ul>--%>
					<%--<li class="click" style="font-size: 12px;">--%>
				    <%--<span>组长：<s:iterator id="" value="groupAllot.teacherList">--%>
						<%--<s:if test="type==0"><font color="blue">${teacherName }</font> </s:if>--%>
					<%--</s:iterator></span>--%>
					<%--</li>--%>
				<%--</ul></td>--%>
			<%--</tr>--%>
			<%--答辩日期--%>
			<%--<tr>--%>
				<%--<td class="rightText"  >答辩时间：</td>--%>
				<%--<td style="font-size: 16px;padding: 4px;color: #3EAFE0;">--%>
					<%--<input name="model.replyTime" id="model.replyTime" class="dfinput" value="${groupAllot.replyTime}"--%>
						   <%--type="text" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',isShowWeek:true})" />--%>
				<%--</td>--%>
			<%--</tr>--%>
			<%--教室--%>
			<%--<tr>--%>
				<%--<td class="rightText">教室：</td>--%>
				<%--<td><s:select cssClass="dfinput" list="classRoomList"--%>
							  <%--listKey="id" value="groupAllot.classRoomId"--%>
							  <%--id="classRoomId" name="model.classRoomId"--%>
							  <%--listValue="classroomName" onchange="onSelect(this);"/>--%>
				<%--</td>--%>
			<%--</tr>--%>
			<tr>
			<td colspan="2">&nbsp;选择答辩方向<font color="red">*</font>  </td>
             </tr>
			<s:iterator id="p" value="majorList" status="cp">
			<tr>
			<td align="center"><input type="checkbox"> </td>
			<td align="center">${majorName }</td>
			</tr>
			</s:iterator>
			</tbody>
		</table>
		</form>
	</div>
	<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
