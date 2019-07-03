<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>职称管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />


<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>


<script type="text/javascript">
$(function(){
    $("#form1").validate({
        errorClass:"errorInfo", //默认为错误的样式类为：error
        errorElement:"em",
        focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
        onkeyup: false,   
        submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form
        	if(confirm('是否添加改职称?')){
                    var index = layer.load(1);
                   form.submit();   //提交表单
          }
        },   
        rules:{
        	"model.technicalNo":{
                required:true,
                remote: {  
	                type: "post",  
	                url: "<%=path %>/sys/technical_checkName.action",  
	                data: {  
	                    "model.technicalNo": $("#model.technicalNo").val()  
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
        	"model.technicalName":{
                required:true,
                remote: {  
	                type: "post",  
	                url: "<%=path %>/sys/technical_checkName.action",  
	                data: {  
	                    "model.technicalName": $("#model.technicalName").val()  
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
        	"model.technicalNo":{
        		required:"职称编号不能为空",
        	 remote:"该职称编号已存在"},
        	"model.technicalName":{
        		required:"职称名称不能为空",
        	 remote:"该职称名称已存在"},
        },
        errorPlacement: function(error, element) { //错误信息位置设置方法
			error.appendTo( element.parent() ); //这里的element是录入数据的对象
		}
    });    
});
 
 $(function(){
     var flag="${mark}";
     if(flag!='' && flag!=undefined){
    	 if(flag=="1"){
        $('#submit').attr('disabled','disabled');
        layer.msg('添加成功');
        /* setTimeout(function(){
           location.reload();
           layer.close(index);
        },1000); */
     }else if(flag=="0"){
     layer.msg('添加失败');
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
<li><a href="<%=path %>/sys/Home_home.action">首页</a></li>
<li>职称管理</li>
</ul>
</div>
		<div class="rightinfo">
			<div class="formtitle">
				<span>职称管理</span>
			</div>
     <div class="place">
		<form action="<%=path%>/sys/technical_add.action?view=list"
			method="post" name="form1" id="form1" style="border:1px  solid #C1DAD7;" >
		<ul class="placeul" style="font-size: 12px">
          		 <li class="click" >
          		 编号：<input type="text" class="dfinput"
								id="model.technicalNo" name="model.technicalNo"> <i style="color: red;">*</i>
        		</li>
        		 <li class="click" >
        		 职称：<input type="text" class="dfinput"
								id="model.technicalName" name="model.technicalName"> <i style="color: red;">*</i>
        		</li>
        		<li class="click" >
        		<a href="#">
        		<input name="" id="submit" type="submit" class="scbtn" value="添加"/></a>
        		</li>
		</ul>
		</form>
		</div> 
        <table class="tablelist" >
    	<thead>
    	<tr>
    	<th>序号</th>
   		<th>职称</th>
   		<th>操作</th>
        </tr>
        </thead>
        <tbody>
				<s:iterator id="p" value="pageResult.data" status="pp">
					<tr id="tr_${technicalId}">
						<td align="center"><s:property value="#pp.count" /></td>
						<td align="center" >${technicalName}</td>
						<td align="center" width="20%">
							<a href="javascript:void(0)"
							target="rightFrame" onclick="del(this,${technicalId});"> <font
								color="red"> <i class="layui-icon">&#xe640;</i>删除
							</font></a>
								</td>
					</tr>
				</s:iterator>
				</tbody>
</table>
<%@ include file="/WEB-INF/common/pagination.jsp"%>
</div>

<script type="text/javascript">
//单个删除
function del(name,id){
	var re=$(name).parent().parent();
	var index = layer.confirm('您确定要删除该职务吗?'
            ,{icon: 3, title:'提示'}, function(index){
            	layer.close(index); 
		var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/sys/technical_del.action',
					dataType : "json",
					data : {
						"thisId" : id
					},success : function(result) {
						layer.close(index); 
						if (result) {
							re.remove();
							layer.msg('删除成功',{icon: 1});
						}else{
							layer.msg('删除失败',{icon: 2});
						}
					},
					error : function(result) {
						layer.close(index); 
						layer.msg('删除失败',{icon: 2});
					}
				}
				);
			});
		}
</script>
</body>
</html>
