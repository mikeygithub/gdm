<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>添加角色</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=path%>/third/zTree_v3/css/demo.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/zTree_v3/css/zTreeStyle/zTreeStyle.css" type="text/css" />
<script type="text/javascript" src="<%=path%>/third/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="<%=path%>/third/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
</head>

<body style="min-width: 200px;">
<div >
    <ul id="treeDemo" class="ztree"  style="background-color: white;border: 1px  solid #C1DAD7;height: 100%;margin-bottom: 20px"></ul>
    <input type="hidden" id="perms" name="perms">
</div>
<script type="text/javascript">
var setting = {
	check: {
		enable: true,
		chkboxType: { "Y": "ps", "N": "ps" }
	},
	data: {
		simpleData: {
			enable: true
		}
	}
};
function getData(){
	var index = layer.load(2, {time: 10*1000}); //又换了种风格，并且设定最长等待10秒 
    var treeObj=$.fn.zTree.getZTreeObj("treeDemo"),
    nodes=treeObj.getCheckedNodes(true),
    v="";
    for(var i=0;i<nodes.length;i++){
    v+=nodes[i].aliasName + ",";
    }
    $("#perms").val(v);
    return v;
   }

$(document).ready(function(){
	var index = layer.load(2); //又换了种风格，并且设定最长等待10秒 
	$.post('sysRole_findPerm.action',{'thisId':'${model.id}'},function(data){  
		layer.close(index);
        var zNodes = eval("("+data+")"); 
        zNodes  = eval("("+zNodes+")"); 
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
        });  
});
</script>
</body>
</html>
