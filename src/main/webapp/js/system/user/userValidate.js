/**
 * 添加用户表单校验
 * @date： 2015/11/03
 * @log:  1.创建方法  （mengyiwen）
 **/

$(function(){
	    //校验手机号码
	    $.validator.addMethod("mobile", function(value, element) {
			var length = value.length;
			var mobile = /^(13\d|14[57]|15[^4,\D]|17[678]|18\d)\d{8}|170[059]\d{7}$/;
			return this.optional(element) || (length == 11 && mobile.test(value));
		}, "手机号码格式错误"); 
	    
	    //校验QQ
	    $.validator.addMethod("qq", function(value, element) {
			var length = value.length;
			var qq = /^\d{5,12}$/;
			return this.optional(element) || (qq.test(value));
		}, "QQ格式错误"); 
	    
	    //基本信息校验：登录用户名 
	    $.validator.addMethod("baseInfo", function(value, element) {
			var length = value.length;
			var baseInfo = /^[a-zA-z][a-zA-Z0-9_]{2,16}$/;
			return this.optional(element) || (baseInfo.test(value));
		}, "2-16位字母、数字或下划线，字母开头"); 
	
	    //校验密码
	    $.validator.addMethod("password", function(value, element) {
			var length = value.length;
			var password = /^[a-zA-z][a-zA-Z0-9_]{5,16}$/;
			return this.optional(element) || (password.test(value));
		}, "6-16位字母、数字或下划线，字母开头");
	    
	    $("#user").validate({
	        errorClass:"errorInfo", //默认为错误的样式类为：error
	        errorElement:"em",
	        errorPlacement: function(error, element) {
				if ( element.is(":radio") )
					error.appendTo( element.parent());
				else
					error.appendTo( element.parent());
			},
	        focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
	        onkeyup: false,   
	        submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form 
	              form.submit();   //提交表单
	        },   
	        rules:{
	            "model.userLogin":{
	                required:true,
	                baseInfo:true,
	                remote: {  
		                type: "post",  
		                url: "/gwyc/sys/sysUser_checkLoginName.action",  
		                data: {  
		                    "model.userLogin": function() {  
		                        return $("#userLogin").val();  
		                    }  
		                },  
		                dataType: "html",  
		                dataFilter: function(data, type) {  
		                    if (data == "true"){  
		                        return true;  
		                    }else{  
		                        return false;  
		                    }  
		                }  
		            },
	                rangelength:[1,100]
	            },
	            "model.userName":{
	            	required:true,
	                rangelength:[1,100]
	            },
	            "model.userPhone":{
	            	mobile:true,
	            	rangelength:[1,100]
	            },
	            "model.userQq":{
	            	qq:true
	            },
	            "model.userMail":{
	            	email:true
	            },
	            "model.userPassword":{
	            	required:true,
	            	password:true
	            },
	            "c_userPassword":{
	            	required:true,
	            	password:true,
	            	equalTo:"#userPassword"
	            },
	            "model.userRole":{
	            	required:true
	            },
	            "area":{
	            	required:true
	            },
	            "model.userFunction":{
	            	required:true
	            }
	        },
	        messages:{
	        	"model.userLogin":{
	                required:"必填",
	                remote:"该用户已经存在",
	                rangelength:$.validator.format("{0}-{1}位")
	            },
	            "model.userName":{
	            	required:"必填",
	                rangelength:[1,100]
	            },
	            "model.userPhone":{
	            	rangelength:[1,100]
	            },
	            "model.userQq":{
	            	
	            },
	            "model.userMail":{
	            	email:"请输入正确的电子邮箱"
	            },
	            "model.userPassword":{
	            	required:"必填"
	            },
	            "c_userPassword":{
	            	required:"必填",
	            	equalTo:"两次密码输入的不相同"
	            },
	            "model.userRole":{
	            	required:"必选项"
	            },
	            "area":{
	            	required:"必选项"
	            },
	            "model.userFunction":{
	            	required:"必选项"
	            }
	        }  
	    });    
});
