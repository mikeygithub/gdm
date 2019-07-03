/**
 * 校验密码
 */

var pswCode='';
var pswFormat;//密码格式

function checkPsw(){
	
    var old_password=$('#old_password').val();
    var userId=$('#userId').val();
    
    if(pswCode!=''){
    	return;
    }
    
    if($.trim(old_password)==''){
    	$('#tipInfo1').html("<font color='red'>请输入旧密码</font>");
    }else{
    	$.ajax({
		   type: "POST",
		   url: "/ggfp/sys/sysUser_checkPsw.action",
		   dataType:"html",
		   data:"model.userId="+userId+"&password="+old_password,
		   async:false,
		   success: function(data){
				if(data=='error'){
					$('#tipInfo1').html("<font color='red'>密码错误，请重新输入</font>");
					$('#old_password').val('');
				}else{
					$('#tipInfo1').html("<font color='green'>密码正确</font>");
					pswCode=data;
				}
		   }
	     });
    }
}

function changePsw(){
	var new_password=$('#new_password').val();
    var userId=$('#userId').val();
    
    if($.trim(new_password)=='' || pswCode==''){
    	$('#tipInfo1').html("<font color='red'>请输入旧密码</font>");
    	return;
    }
    
    if(confirmPsw()){
    	
    	$.ajax({
		   type: "POST",
		   url: "/ggfp/sys/sysUser_changePsw.action",
		   dataType:"html",
		   data:"model.userId="+userId+"&password="+new_password+"&pswCode="+pswCode,
		   async:false,
		   success: function(data){
				if(data=='success'){
					layer.msg('修改成功',{time:1000});
					$('#tipInfo1').html("");
					$('#old_password').val("");
					$('#new_password').val("");
					$('#c_new_password').val("");
				}else{
					layer.msg('修改失败',{time:1000});
				}
		   }
	     });
    }
}

function format(){
	var new_password=$('#new_password').val();
	
	if(new_password==''){
		return;
	}
	
	var regex = /^[a-zA-z][a-zA-Z0-9_]{5,16}$/;
	if(!regex.test(new_password)){
		$('#tipInfo2').html("<font color='red'>6-16位字母、数字或下划线组成，字母开头</font>");
		pswFormat=false;
	}else{
		$('#tipInfo2').html("");
		pswFormat=true;
	}
}

function confirmPsw(){
	var new_password=$('#new_password').val();
	var c_new_password=$('#c_new_password').val();
	
	if($.trim(new_password)==$.trim(c_new_password)){
		$('#tipInfo3').html("");
		return true;
	}else{
		$('#tipInfo3').html("<font color='red'>两次输入的密码不一致</font>");
		return false;
	}
}