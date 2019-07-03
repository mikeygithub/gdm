$(function(){
	
	qx(-1);
	
});

//各用户的权限
//备注：因为是隐藏切换的，为了防止提交所以不显示时，把表单元素设置为disabled
function qx(num){
	if(num==-1){
		hideAll();
	}else if(num==0){
		hideAll();
	}else if(num==0){
		hideAll();
	}else if(num==1){
		$('#ycbm_tb').show();
		$("#ycbm_tb").find("input").removeAttr("disabled");
		$('#spbm_tb').hide();
		$("#spbm_tb").find("input").attr("disabled","disabled");
	}else if(num==2){
		$('#ycbm_tb').hide();
		$("#ycbm_tb").find("input").attr("disabled","disabled");
		$('#spbm_tb').show();
		$("#spbm_tb").find("input").removeAttr("disabled");
	}
}

//隐藏所有权限
function hideAll(){
	$('#spbm_tb').hide();
	$("#spbm_tb").find("input").attr("disabled","disabled");
	$('#ycbm_tb').hide();
	$("#ycbm_tb").find("input").attr("disabled","disabled");
}