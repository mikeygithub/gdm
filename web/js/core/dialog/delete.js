/**
 * * 
 * 删除（通用）
 * @date: 2015/11/03
 * @log:  1.创建方法
 * 
 * @param {Object} url   action地址及参数
 * @param {Object} nodeId   所在表格的行Id
 * @param {Object} hint   提示信息（默认是：确认删除？）
 */

function remove(url, nodeId, hint){
	
	if(hint == undefined){
		hint="确认删除？";
	}
	if(url == undefined || url==''){
		layer.msg("url错误！",{time:1000});
	}
	if(nodeId.indexOf("#") == -1){//如果没有包含#，即id选择器
		nodeId="#"+nodeId;
	}
	
	layer.confirm(hint, {
	    btn: ['确认','取消'] //按钮
	}, function(){
		$.ajax({
		   type: "POST",
		   url: url,
		   success: function(data){
		    	 if(data=="success"){
				   $(nodeId).fadeOut('fast');
				   layer.msg('操作成功！', {icon: 1,time:1000});
		   		}
		   },error:function(){
			   layer.msg('操作失败！', {icon: 1,time:1000});
		   }
		});
	});
}