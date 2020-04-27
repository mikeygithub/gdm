/**
 * * 
 * 启用（通用）
 * @date: 2015/11/03
 * @log:  1.创建方法
 * @param {Object} url   action地址及参数
 * @param {Object} isEnable   启用或删除   （启用：1  ， 关闭： 0）
 * @param {Object} hint 提示信息
 * 
 */

function enable(isEnable, url, hint){
	if(isEnable!=1 && isEnable!=0 && isEnable!="1" && isEnable!="0"){
		layer.msg("请设置是启用还是关闭!启用：1;关闭：0",{time:1000});
		return;
	}
	if(hint == undefined){
		hint="确认操作？";
	}
	if(url == undefined || url==''){
		layer.msg("url错误！",{time:1000});
	}
	
	layer.confirm(hint, {
	    btn: ['确认','取消'] //按钮
	}, function(){
		 $.post(url, function(data){
		   if(data=="success"){
			   if(isEnable==1 || isEnable=="1"){//启用
			   	   layer.msg('启用成功！', {icon: 1,time:1000});
			   }else if(isEnable==0 || isEnable=="0"){//关闭
			   	   layer.msg('关闭成功！', {icon: 1,time:1000});
			   }
			   setTimeout(function(){
				   location.reload();
			   },1000);
		   }else{
			   layer.msg('操作失败！', {icon: 2,time:1000});
		   }
		 });
	});
}