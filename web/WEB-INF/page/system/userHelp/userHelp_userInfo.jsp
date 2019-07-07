<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>修改用户</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css"
	type="text/css" />

<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/closeDialog.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>

<style type="text/css">
th,td {
	padding: 8px;
	font-size: 14px;
}
th{
width: 100px;
}
</style>
</head>
<script type="text/javascript">
$(function(){
	  var flag="${userSign}";
 if(flag!='' && flag!=undefined){
	 if(flag=='0'){
		 var index =
			 layer.open({
				 type: 2,
		       	area: ['80%', '80%'],
		       	fix: false, //不固定
		   		title:'修改个人信息',
		       	content:'<%=path%>/sys/userHelp_openEdit.action?view=userInfoEdit&thisId=${session.userId }&resUri=openEdit&mark=${mark}'
						});
			}
		}
	});
	
	$(function() {
		var flag = "${mark}";
		if (flag != '' && flag != undefined && flag == "1") {
			layer.msg('修改成功', {
				icon : 1
			});
		} else if (flag == "0") {
			layer.msg('修改失败', {
				icon : 2
			});
		}
	});
</script>

<script type="text/javascript">
	 $(function(){
		    //校验手机号码
		    $.validator.addMethod("mobile", function(value, element) {
				var length = value.length;
				var mobile = /^(13\d|14[57]|15[^4,\D]|17[678]|18\d)\d{8}|170[059]\d{7}$/;
				return this.optional(element) || (length == 11 && mobile.test(value));
			}, "手机号码格式错误"); 
			    //校验密码确认密码
			   $.validator.addMethod("equalPad", function(value, element) {
					return this.optional(element) || (value==$("#newPsd").val());
			}, "新密码与确认密码不一致"); 
		    
	    $("#form1").validate({
	        errorClass:"errorInfo", //默认为错误的样式类为：error
	        errorElement:"em",
	        focusInvalid: false, //当为false时，验证无效时，没有焦点响应  
	        onkeyup: false,   
	        submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form
	              form.submit();   //提交表单
	        }, 
	        rules:{
	        	"oldPsd":{
	                required:true,
	                remote: {  
		                type: "post",  
		                url: "<%=path %>/sys/userHelp_checkPassword.action",  
		                data: {  
		                    "oldPsd": function(){ return $("#oldPsd").val();}
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
		            rangelength:[2,20],
		            required:true,
	            },
	            "newPsd":{
	            	required:true,
	            	rangelength:[6,20]
	            },
	            "surePsd":{
	            	required:true,
	            	rangelength:[6,20],
	            	equalPad:true
	            },
	            "model.tel":{
	            	required:true,
	            	mobile:true	
	            },
	        
	           
	        },
	        messages:{
	        	 "oldPsd":{
		            	required:"请输入旧密码",
		            	remote:"密码不正确",
		            },
		            "newPsd":{
		            	required:"请输入新密码",
		            	rangelength:"长度为6- 20位"
		            },
		            "surePsd":{
		            	required:"请输入确认密码",
		            	rangelength:"长度为6- 20位"
		            },
		            "model.tel":{
		            	required:"请输入联系方式"
		            },
	        },
	        errorPlacement: function(error, element) { //错误信息位置设置方法
				error.appendTo( element.parent() ); //这里的element是录入数据的对象
			}
	    });    
	});
	 
</script>

<body style="min-width: 200px">
	<div class="main" style="max-width:800px; margin:0 auto;">
		<fieldset class="layui-elem-field">
			<legend>个人信息</legend>
			<div class="layui-field-box">
				<form action="<%=path%>/sys/userHelp_editUserInfo.action?view=userInfo" target="rightFrame"
			method="post" name="form1" id="form1"  >
			<input type="hidden" name="model.id" value="${model.id }">
						<table class="tablelist">
				<ul>
					<li>
							<tbody>
								<tr >
									<th>姓名：</th>
									<td class="textContent" colspan="2">${model.userName }</td>
										<th rowspan="4" style="width: 160px">
										<div class="layui-upload" id="phone">
											<div class="layui-upload-list">
											    <c:choose>
											        <c:when test="${model.userImg != null and model.userImg != ''}">
											            <img class="layui-upload-img" src="<%=basePath%>${model.userImg}" id="demo1" style="width:179px;height:192px;">
											        </c:when>
											        <c:otherwise>
											            <img class="layui-upload-img" src="<%=path%>/images/photo.jpg" id="demo1" style="width:179px;height:192px;">
											        </c:otherwise>
											    </c:choose>											
												<p id="demoText"></p>
											</div>
											<button type="button" class="layui-btn" id="test1">上传图片</button>
										</div>
									</th>
									</tr>
								<tr>
									<th><s:if test="student.stuId!=null">学号：</s:if>
									    <s:if test="teacher.teacherId!=null">职工号：</s:if>
									</th>
									<td class="textContent"  colspan="2">${model.loginName }</td>
								</tr>
								<tr>
									<th>性别：</th>
									<td class="textContent"  colspan="2">
										<s:select cssClass="dfinput" list="#{0:'女',1:'男'}" 
        		                           listKey="key" listValue="value"  value="model.userSex"
        		                           id="model.userSex" name="model.userSex"/> 
										</td>
										</tr>
								<tr>
									<th>用户角色：</th>
									<td class="textContent"  colspan="2"><s:iterator id="re"
											value="model.sysRoles">
	                                         ${roleName }
	                                    </s:iterator></td>
								</tr>
								<s:if test="student.stuId!=null">
								<tr>
									<th>所属院系：</th>
									<td class="textContent"  colspan="3"><s:iterator id="p"
											value="student">
											<s:if test="#p.deptNumber == deptNumber">
							        			${deptName}
							        		</s:if>
										</s:iterator></td>
										</tr>
								<tr>
									<th>所属专业：</th>
									<td class="textContent" colspan="3">
							        			${student.majorName}</td>
								</tr>
								<tr style=" ">
									<th>所属年级：</th>
									<td class="textContent" colspan="3">${student.stuGrade}</td>
											</tr>
								<tr>
									<th>所属班级：</th>
									<td class="textContent" colspan="3"><s:iterator id="p"
											value="student">
											<s:if test="#p.classId == classId">
							        			${className}
							        		</s:if>
										</s:iterator></td>
								</tr>
								<tr >
									<th>学制：</th>
									<td class="textContent" colspan="3">${student.stuSchoollength }</td>
											</tr>
								<tr>
									<th>学历：</th>
									<td class="textContent" colspan="3">
											<s:if test="student.stuArrangement == 0 ">本科</s:if>
											<s:if test="student.stuArrangement == 1 ">高职</s:if>
									</td>
								</tr>
								</s:if>
								<s:if test="teacher.teacherId!=null">
								<tr>
								<tr>
									<th>职称：</th>
									<td class="textContent" colspan="3">${teacher.technicalName }</td>
								</tr>
								<tr>
									<th>职务：</th>
									<td class="textContent" colspan="3">${teacher.dutiesName }</td>
								</tr>
								<th>所带专业：</th>
									<td class="textContent"  colspan="2"><s:iterator id="p"
											value="teacher.teacherMajorList">
							        			${majorName}
										</s:iterator></td>
										<td width="auto">
										<a href="javascript:dialogReload('50%','90%','所带专业','<%=path%>/sys/teacher_openMajorList.action?view=major_list&teacherMajor.teacherId=${teacher.teacherId }', 'true','20%');">
							      <font color="green"> <i class="layui-icon">&#xe642;</i>修改</font></a>
										</td>
								</tr>
								<tr>
								<th>研究方向：</th>
									<td class="textContent"  colspan="2"><s:iterator id="p"
											value="teacher.teacherDirectionList">
							        			${directionsName}
										</s:iterator></td>
										<td>
										  <a href="javascript:dialogReload('50%','90%','研究方向','<%=path%>/sys/teacher_openDirectionsList.action?view=directions_list&teacherDirections.teacherId=${teacher.teacherId }', 'true','20%');">
							      <font color="green"> <i class="layui-icon">&#xe642;</i>修改</font></a>
										</td>
								</tr>
								</s:if>
								<tr >
									<th>手机号码：</th>
									<td class="textContent" colspan="3">
									<input type="text" class="dfinput" placeholder="请输入课题"
								 value="${model.userTel}"
								id="model.userTel" name="model.userTel" >
									</td>
											</tr>
								<tr>
									<th>QQ邮箱：</th>
									<td class="textContent" colspan="3">
									<input type="text" class="dfinput" placeholder="请输入课题"
								 value="${model.userEmail}"
								id="model.userEmail" name="model.userEmail" > 
									</td>
								</tr>
								
								 <tr >
							     <th>是否修改密码：</th>
							     <td class="textContent" colspan="3">
							           <div class="layui-form">
										<input type="radio" name="isPsd" value="1"
											title="是" > <input type="radio"
											name="isPsd" value="0" title="否" checked>
									   </div>
								 </td>
								</tr>
									</tbody>
						</table>
						
								<table class="tablelist" id="PsdDiv">
								 <tr >
									<th>旧密码：</th>
									<td class="textContent" colspan="3">
									<input type="password" class="dfinput"
										id="oldPsd" name="oldPsd" > <i class="warn">*</i>
									</td>
								</tr>
								<tr >
									<th>新密码：</th>
									<td class="textContent" colspan="3">
									<input type="password" class="dfinput"
										id="newPsd" name="newPsd" ><i class="warn">*</i> 
									</td>
								</tr>
								<tr >
									<th>确认密码：</th>
									<td class="textContent" colspan="3">
									<input type="password" class="dfinput"
										id="surePsd" name="surePsd" > <i class="warn">*</i>
									</td>
								</tr>
								</table>
				  <li>
					<div style="text-align: center;">
						<input name="" id="submit" type="submit" class="scbtn" value="修改"
							 />
					</div>
				</li>
				</ul>
				</form>
			</div>
		</fieldset>
		
	</div>

	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		$(function(){
			$("#PsdDiv").hide();
		});
		layui.use('form', function() {
			var form = layui.form;
			form.on('radio', function(data){
				  if(data.value==1){
					  $("#PsdDiv").show();
					}else if(data.value==0){
						$("#PsdDiv").hide();
					}
				});  
		});
	</script>
	<script type="text/javascript">
		layui.use('upload', function() {
							var upload = layui.upload;
							//普通图片上传
							var uploadInst = upload.render({
								elem : '#test1',
								url : '<%=path%>/sys/userHelp_loadUserHelpImg.action?thisId=${model.id}'
								,accept: 'file'
							    ,field:'upload',
								before : function(obj) {
									//预读本地文件示例，不支持ie8
									obj
											.preview(function(index,
													file, result) {
												$('#demo1').attr('src',
														result); //图片链接（base64）
											});
								},
								done : function(res) {
									//如果上传失败
									if (res.code > 0) {
										return layer.msg('上传失败');
									}else{
									    return layer.msg('上传成功');
									}
									//上传成功
								},
								error : function() {
									//演示失败状态，并实现重传
									var demoText = $('#demoText');
									demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
									demoText.find('.demo-reload').on(
											'click', function() {
												uploadInst.upload();
									});
								}
							});
									
						});
	</script>


</body>
</html>
