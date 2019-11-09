<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>聊天面板</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="<%=basePath %>/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath %>/third/layui/css/layui.css" type="text/css">
<link rel="stylesheet" href="<%=basePath %>/third/layer/skin/layer.css" id="layui_layer_skinlayercss">
<link id="layuicss-skinlayimcss" rel="stylesheet" href="<%=basePath %>/third/layui/css/modules/layim/layim.css?v=3.60Pro" media="all">
<link id="layuicss-skinlayercss" rel="stylesheet" href="<%=basePath %>/third/layui/css/modules/layer/default/layer.css?v=3.0.3303" media="all">
<link href="<%=basePath %>/datePicket/skin/WdatePicker.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="<%=basePath %>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath %>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=basePath %>/third/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath %>/third/layui/lay/modules/layim.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/core/dialog/enable.js"></script>
<script type="text/javascript" src="<%=basePath %>/datePicket/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/business/replyScore/replyScore.js"></script>
<style>
#imgFile { width: 100%; margin: 0 auto; font-size: 0;}
</style>
</head>

<body>
	<div  class="layui-layer layui-layer-page layui-box layui-layim-chat layer-anim" id="layui-layer100006" type="page" times="100006" showtime="0" contype="string" style="z-index: 19991020; width: 100%; top: 0; left: 0; min-width: 100px; 
	      min-height: 420px;bottom:0; background-image: url(http://127.0.0.1:8080/gdm/third/layui/css/modules/layim/skin/3.jpg);">
	  <div class="layui-layer-title" style="cursor: move;/* z-index: -2; *//* visibility: hidden; */">&#8203;</div>
		<div id="layui-layim-chat" class="layui-layer-content" style="right: 0;bottom: 0; left: 0;position: absolute;top: 0;z-index: -4;">
			<div class="layim-chat-box" style="height: 100%;">
				<div   class="layim-chat layim-chat-friend layui-show" style="position: absolute;bottom: 0;top: 0; left: 0;right: 0;">
					<!--顶部  -->
					<div >
						<div class="layim-chat-other">
							<img class="layim-friend1008612" src="<%=path%>/images/qq.jpg">
							<span class="layim-chat-username" layim-event="">${teacherList.teacherName } ${student.stuName } 交流信息</span>
							<p class="layim-chat-status"><span style="color:#FF5722;">${teacherList.staffName } ${student.majorName }</span></p>
						</div>
					</div>
					
					<!--对话start  -->
					<div class="layim-chat-main" style="height: 70%;">
						<div class="layim-chat-system">
							<span layim-event="chatLog">查看更多记录</span>
						</div>
						<ul id="chattwolist">
						</ul>
					</div>
					<!--对话end  -->
					  
					<div id="sendcloseall" class="layim-chat-footer" style="height: 30%;">
						<div class="layui-unselect layim-chat-tool" >
							<span class="layui-icon layim-tool-image" title="上传图片" style="magin-left:-100px">
							      <button type="button" name="file" id="file"/>
							</span>
							<span class="layui-icon layim-tool-image" title="发送文件"  >
							      <button type="button" name="file" id="file"/>
							</span>
						</div>
						<!--输入框 start -->
						<div class="layim-chat-textarea" style="height: 80px">
							<textarea id="chattext" ></textarea>
						</div>
						<!--输入框 end  -->
						<!--按钮start  -->
						<div class="layim-chat-bottom" style="" >
							<div class="layim-chat-send" style="top: -11px;">
							     <input id ="chatType" name="chatType" type="text" value="${chatType}"/>
								 <span id="closechat" class="layim-send-close" >关闭</span>
								 <span id="sendchat" class="layim-send-btn"  onclick="loadAddChat(this,${thisId},'${teacherList.teacherName }${student.stuName }');">发送</span>
							</div> 
						</div>
						<!--按钮end  -->
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
</body>
<script src="<%=basePath %>/js/viewer.min.js"></script>
<script>
var viewer = new Viewer(document.getElementById('imgFile'), {
	url: 'data-original'
});
</script>
<script type="text/javascript">
$(function(){
      var chatType = ${chatType}; 
      if(chatType == '0'){ 
          loadChatMessage('Guide');
      }else{
          loadChatMessage(''); 
      }
     
	 //setInterval(loadChatMessage,2000);
	 function loadChatMessage(pro){
		 $.post('<%=path%>/biz/chatInfo_load'+pro+'ChatMessageList.action?thisId=${thisId}&thisType=${thisType}&chatType=${chatType}',function(res){
		 var timechat =  $('#chattwolist');
		 var result = eval('('+res+')');
		 console.log(result);
		 if(!result.success)
		 return;
		 
		 $.each(result.obj,function(index,con){
			 if(con.contType == '0'){
				  var timechat_img =  $('<img src="<%=path%>/images/qq.jpg">');//头像
				  var timechat_i =  $('<i>'+con.sendTime+'</i>');  //时间
				  var timechat_cite =  $('<cite>'+con.senderName+'</cite>');   //名字
				  var timechat_div =  $('<div class="layim-chat-user"></div>');
				  var timechat_div2 =  $(' <div class="layim-chat-text">'+con.senderContent+'</div>');  //聊天内容
				  var timechat_li = $(' <li id=\"chatId_'+con.chatId+'\"></li>');
		/*  		  var a = ${model.senderId};
				   alert(a+","+con.senderId);  */
				  if(('${model.senderId}'==con.senderId||'${model.senderId}'==con.anwserId)){
				     timechat_li =  $(' <li id=\"chatId_'+con.chatId+'\" class="layim-chat-mine"></li>');
				  } 
				  /* if('${model.senderId}'==con.senderId||'${model.senderId}'==con.anwserId){
				     timechat_li =  $(' <li id=\"chatId_'+con.chatId+'\" class="layim-chat-mine"></li>');
				  } */
				  timechat_img.appendTo(timechat_div);
				  timechat_i.appendTo(timechat_cite);
				  timechat_cite.appendTo(timechat_div);
				  timechat_div.appendTo(timechat_li);
				  timechat_div2.appendTo(timechat_li);
				  console.log($("#chatId_"+con.chatId).html());
				  if($("#chatId_"+con.chatId).html()==undefined||$("#chatId_"+con.chatId).html()==''){
				  	  timechat_li.appendTo(timechat);
				  }
			 
			 }else if(con.contType == '1'){
				 for ( var i = 0; i < con.chatFileList.length; i++) {
					  var filePath = con.chatFileList[i].filePath; //文件的路径
				      var timechat_img =  $('<img src="<%=path%>/images/qq.jpg">');//头像
					  var timechat_i =  $('<i>'+con.sendTime+'</i>');  //时间
					  var timechat_cite =  $('<cite>'+con.senderName+'</cite>');   //名字
					  var timechat_div =  $('<div class="layim-chat-user"></div>');
					  var timechat_div2 =  $(' <div class="layim-chat-text"><img src="<%=path%>/'+filePath+'" id="imgFile"  data-original="<%=path%>/'+filePath+'"></div>');  //聊天内容
					  var timechat_li = $(' <li id=\"chatId_'+con.chatId+'\"></li>');
					  if(('${model.senderId}'==con.senderId||'${model.senderId}'==con.anwserId)){
					     timechat_li =  $(' <li id=\"chatId_'+con.chatId+'\" class="layim-chat-mine"></li>');
					  } 
					  timechat_img.appendTo(timechat_div);
					  timechat_i.appendTo(timechat_cite);
					  timechat_cite.appendTo(timechat_div);
					  timechat_div.appendTo(timechat_li);
					  timechat_div2.appendTo(timechat_li);
					  console.log($("#chatId_"+con.chatId).html());
					  if($("#chatId_"+con.chatId).html()==undefined||$("#chatId_"+con.chatId).html()==''){
					  	  timechat_li.appendTo(timechat);
					  }
			 	}

			 
			 
			 }else if(con.contType == '2'){
				 for ( var i = 0; i < con.chatFileList.length; i++) {
					  var filePath = con.chatFileList[i].filePath; //文件的路径
				      var timechat_img =  $('<img src="<%=path%>/images/qq.jpg">');//头像
					  var timechat_i =  $('<i>'+con.sendTime+'</i>');  //时间
					  var timechat_cite =  $('<cite>'+con.senderName+'</cite>');   //名字
					  var timechat_div =  $('<div class="layim-chat-user"></div>');
					  var timechat_div2 =  $(' <div class="layim-chat-text">'+con.senderContent+'<br>'+
					      '<img src="<%=path%>/images/icon05.png">'+
					      '<a href="<%=path%>/biz/chatInfo_downLoad.action?senderContent='+encodeURI(encodeURI(con.senderContent))+'&savePath='+encodeURI(encodeURI(filePath))+'" style="color:blue">下载</a></div>');  //聊天内容
					  var timechat_li = $(' <li id=\"chatId_'+con.chatId+'\"></li>');
					  if(('${model.senderId}'==con.senderId||'${model.senderId}'==con.anwserId)){
					     timechat_li =  $(' <li id=\"chatId_'+con.chatId+'\" class="layim-chat-mine"></li>');
					  } 
					  timechat_img.appendTo(timechat_div);
					  timechat_i.appendTo(timechat_cite);
					  timechat_cite.appendTo(timechat_div);
					  timechat_div.appendTo(timechat_li);
					  timechat_div2.appendTo(timechat_li);
					  console.log($("#chatId_"+con.chatId).html());
					  if($("#chatId_"+con.chatId).html()==undefined||$("#chatId_"+con.chatId).html()==''){
					  	  timechat_li.appendTo(timechat);
					  }
			 	}
			 
			 }
		});
	});
	}
});
		
		function loadAddChat(name,anwserId,anwserName){
		      var chatType = ${chatType}; 
			  var content = $("#chattext").val();
			  if(content==undefined||content.length==0){
			    alert("发送内容不能为空！");
			    return;
			  }else{
			   $.post('<%=path%>/biz/chatInfo_addChat.action?chatType='+chatType
				   ,{'model.answerId':anwserId,'model.answerName':anwserName,'model.senderContent':content}
				   ,function(res){
						 var result = eval('('+res+')');
						 var con = result.obj;
						 if(result.success){
						     if(con.contType == '0'){
								  $("#chattext").val("");
								  var timechat =  $('#chattwolist');      
								  var timechat_img =  $('<img src="<%=path%>/images/qq.jpg">');//头像
								  var timechat_i =  $('<i>'+result.obj.sendTime+'</i>');  //时间
								  var timechat_cite =  $('<cite>'+result.obj.senderName+'</cite>');   //名字
								  var timechat_div =  $('<div class="layim-chat-user"></div>');
								  var timechat_div2 =  $(' <div class="layim-chat-text">'+result.obj.senderContent+'</div>');  //聊天内容
								  var timechat_li =  $(' <li id=\"chatId_'+result.obj.chatId+'\"  class="layim-chat-mine"></li>');
								  timechat_img.appendTo(timechat_div);
								  timechat_i.appendTo(timechat_cite);
								  timechat_cite.appendTo(timechat_div);
								  timechat_div.appendTo(timechat_li);
								  timechat_div2.appendTo(timechat_li);
								  timechat_li.appendTo(timechat);

						     }else if(con.contType == '1'){
						          // alert("长度："+result.obj.chatFileList.length);
								  for ( var i = 0; i < result.obj.chatFileList.length; i++) {
									  var filePath = result.obj.chatFileList[i].filePath; //图片路径
									  $("#chattext").val("");
									  var timechat =  $('#chattwolist');      
									  var timechat_img =  $('<img src="<%=path%>/images/qq.jpg">');//头像
									  var timechat_i =  $('<i>'+result.obj.sendTime+'</i>');  //时间
									  var timechat_cite =  $('<cite>'+result.obj.senderName+'</cite>');   //名字
									  var timechat_div =  $('<div class="layim-chat-user"></div>');
									  
									  var timechat_div2 =  $(' <div class="layim-chat-text"><img src="<%=path%>/'+filePath+'"></div>');  //聊天内容
									  var timechat_li =  $(' <li id=\"chatId_'+result.obj.chatId+'\"  class="layim-chat-mine"></li>');
									  timechat_img.appendTo(timechat_div);
									  timechat_i.appendTo(timechat_cite);
									  timechat_cite.appendTo(timechat_div);
									  timechat_div.appendTo(timechat_li);
									  timechat_div2.appendTo(timechat_li);
									  timechat_li.appendTo(timechat);
								  }

						         
						     }else if(con.contType == '2'){
						          alert("长度："+result.obj.chatFileList.length);
								  for ( var i = 0; i < result.obj.chatFileList.length; i++) {
									  alert( result.obj.chatFileList[i].filePath);
									  var filePath = result.obj.chatFileList[i].filePath; //图片路径
									  $("#chattext").val("");
									  var timechat =  $('#chattwolist');      
									  var timechat_img =  $('<img src="<%=path%>/images/qq.jpg">');//头像
									  var timechat_i =  $('<i>'+result.obj.sendTime+'</i>');  //时间
									  var timechat_cite =  $('<cite>'+result.obj.senderName+'</cite>');   //名字
									  var timechat_div =  $('<div class="layim-chat-user"></div>');
									  
									  var timechat_div2 =  $(' <div class="layim-chat-text">'+result.obj.senderContent+'<br><img src="<%=path%>/images/icon05.png"><a href="" style="color:blue">下载</a></div>');  //聊天内容
									  var timechat_li =  $(' <li id=\"chatId_'+result.obj.chatId+'\"  class="layim-chat-mine"></li>');
									  timechat_img.appendTo(timechat_div);
									  timechat_i.appendTo(timechat_cite);
									  timechat_cite.appendTo(timechat_div);
									  timechat_div.appendTo(timechat_li);
									  timechat_div2.appendTo(timechat_li);
									  timechat_li.appendTo(timechat);
								  }
						         
						     }
						     
						 }

				  });
			  }
		}

</script> 
<script type="text/javascript">
	layui.use('upload', function() {
		var upload = layui.upload;
		var savePath = "attached/chatFile";
		//普通图片上传
		var uploadInst = upload.render({
			elem : '#file',
			url : '<%=path%>/biz/chatInfo_uploadChartFile.action?savePath='+savePath
			,accept: 'file'
		    ,field:'upload',
			before : function(obj) {
				//预读本地文件示例，不支持ie8
				obj.preview(function(index,file, result) {
					$('#demo1').attr('src',result); //图片链接（base64）
				    });
			},
			done : function(res) {
                if(res.code>0){
				    $("#chattext").val(res.fileName); 
				}else{
				    layer.msg('上传失败');
				}
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

</html>
