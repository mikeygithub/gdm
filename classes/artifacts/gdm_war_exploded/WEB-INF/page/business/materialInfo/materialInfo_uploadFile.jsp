 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<head>
	<title>课题信息</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />
	
	<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
	<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
	<script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
</head>
  
 <body> 
 
     <div class="place">
		<span>位置：</span>
		<ul class="placeul">
		<li><a href="<%=path %>/Userlogin.action">首页</a></li>
		<li>毕业设计相关流程信息</li>
		</ul>
		</div>
		<div class="rightinfo">
		  <div class="formbody">
          <div id="usual1" class="usual"> 
             <%@ include file="/WEB-INF/page/business/materialInfo/select_info_tab.jsp"%>
  
             
<div class="layui-tab layui-tab-card" lay-filter="tabFile">
 <ul class="layui-tab-title" >
    <s:iterator id="p" value="fileTypeList" status="ft">
    <li <s:if test="#ft.count==1">class="layui-this" </s:if> >
       			${fileName}
    </li>
     </s:iterator>
  </ul>
  <div class="layui-tab-content" style="height: auto;">
     <s:iterator id="p" value="fileTypeList" status="ft">
       <div class="layui-tab-item <s:if test="#ft.count==1">layui-show </s:if> ">
	    <button type="button" class="layui-btn layui-btn-normal" id="testList${fileTypeNo }">选择本地文件</button> 
		<button type="button" class="layui-btn" id="testListAction${fileTypeNo }" title="${fileTypeNo }" alt="${fileName }">
		   上传${fileName }
		</button>
	</div>
     </s:iterator>
  </div>
</div>
		  <div class="layui-upload-list">
		    <table class="layui-table">
		        <thead>
			        <tr>
				        <th>文件名</th>
				        <th>类型</th>
				        <th>大小</th>
				        <th>年度</th>
				        <th>状态</th>
				        <th>操作</th>
			        </tr>
		        </thead>
		      <tbody id="demoList"></tbody>
		    </table>
		</div>

<script type="text/javascript">

layui.use(['element','upload'], function(){
  var $ = layui.jquery
  ,upload = layui.upload,element = layui.element;
  var demoListView = $('#demoList');
  
  //一些事件监听
  element.on('tab(tabFile)', function(data){
    loadData('0'+data.index);
    var lBt = $('#testListAction0'+data.index);
    demoListView.attr('name',lBt.attr('alt'));
  });
  
  //加载学生文件
	loadData('${fileType}');
	var lBt = $('#testListAction${fileType}');
    demoListView.attr('name',lBt.attr('alt'));
  
  for(var i = 0;i<${fileTypeSize};i++){
	//多文件列表示例
	 upload.render({
	    elem: '#testList0'+i
	    ,url: '<%=path%>/biz/paper_uploadFile.action?thisYear=${model.year }&thisFileType=0'+i
	    ,accept: 'file'
	    ,multiple: true
	    ,auto: false,
	    size:20480
	    ,field:'upload'
	    ,bindAction: '#testListAction0'+i
	    ,choose: function(obj){ chooseFile(obj);}
	    ,done: function(res, index, upload){
	    	doneFile(res, index, upload);
	    }
	    ,error: function(index, upload){
	    	errorFile(index, upload);
	    }
	  });
  }
	 function chooseFile(obj){
		    var files = obj.pushFile(); //将每次选择的文件追加到文件队列
	        //读取本地文件
	        obj.preview(function(index, file, result){
	        var tr = $(['<tr id="upload-'+ index +'">'
	          ,'<td>'+ file.name +'</td>'
	          ,'<td>'+ demoListView.attr('name')+'</td>'
	          ,'<td>'+ (file.size/1014).toFixed(1) +'k</td>'
	          ,'<td> ${model.year }</td>'
	          ,'<td>等待上传</td>'
	          ,'<td>'
	            ,'<button class="layui-btn layui-btn-mini demo-reload layui-hide">重传</button>'
	            ,'<button class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</button>'
	          ,'</td>'
	        ,'</tr>'].join(''));
	        
	        //单个重传
	        tr.find('.demo-reload').on('click', function(){
	          obj.upload(index, file);
	        });
	        
	        //删除
	        tr.find('.demo-delete').on('click', function(){
	          delete files[index]; //删除对应的文件
	          tr.remove();
	        });
	      
	        demoListView.append(tr);
	      });
	 }
	 function doneFile(res, index, upload){
		
		 if(res.code == 0){ //上传成功
		        var tr = demoListView.find('tr#upload-'+ index)
		        ,tds = tr.children(); 
		        tds.eq(4).html('<span  style="color: #5FB878;">上传成功</span> ');
			    tds.eq(5).html('<button class="layui-btn layui-btn-mini layui-btn-danger" onclick="downLoad(this,'+res.data[0].paperId+')">下载</button>');
		        tds.eq(5).html(tds.eq(5).html()+'<button class="layui-btn layui-btn-mini layui-btn-danger demo-delete" onclick="del(this,'+res.data[0].paperId+')">删除</button>');
		        delete files[index]; //删除文件队列已经上传成功的文件
		        return;
		      }
		      this.error(index, upload);
	 }
	 
	 function errorFile(index, upload){
		 var tr = demoListView.find('tr#upload-'+ index)
	      ,tds = tr.children();
	      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
	      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
	 }
	 function loadData(type){
		 $.ajax({
		        type: "post",
		        cache: false,
		        url: '<%=path%>/biz/paper_userInfoFile.action',
						dataType : "json",
						data : {
							"thisYear" :'${thisYear}',
							"model.fileType" :type
						},success :function(result) {
							var demoListView = $('#demoList');
							demoListView.html('');
							$.each(result,function(index,con){
								  var tr = $(['<tr id="upload-'+ index +'">'
									          ,'<td>'+ con.paperName +'</td>'
									          ,'<td>'+ con.fileTypeName +'</td>'
									          ,'<td>'+  Math.round(con.fileSize/1024) +'k</td>'
									          ,'<td>'+ con.year +'</td>'
									          ,'<td><span style="color: #5FB878;">已上传</span></td>'
									          ,'<td>'
									          ,'<button class="layui-btn layui-btn-mini layui-btn-danger" onclick="downLoad(this,'+con.paperId+')">下载</button>'
									           ,'<button class="layui-btn layui-btn-mini layui-btn-danger" onclick="del(this,'+con.paperId+')">删除</button>'
									          ,'</td>'
									        ,'</tr>'].join(''));
								  
								 demoListView.append(tr);
							});
						},
						error : function(result) {
						}
					}); 
	}
});
//删除文件
function del(name,thisId){
    var tr = $(name).parent().parent();
	     layer.confirm('您确定要删除该文件吗?', {icon: 3, title:'提示'}, function(index){
		 layer.close(index);
		 var index = layer.load(1);
		 $.ajax({
	        type: "post",
	        cache: false,
	        url: '<%=path%>/biz/paper_del.action',
					dataType : "json",
					data : {
						"thisId" : thisId
					},success : function(result) {
						layer.close(index); 
						if (result) {
							tr.remove();
							layer.msg('删除成功',{icon: 1});
						}else{
							layer.msg('移除失败',{icon: 2});
						}
					},
					error : function(result) {
						layer.close(index); 
						layer.msg('移除失败',{icon: 2});
					}
				}); 
    });
}

function downLoad(name,thisId){
	   
	   var paperId=thisId;
	    var fileUrl;
		fileUrl ="<%=basePath%>/biz/paper_downFile.action?thisId="+paperId;
		window.location.href=fileUrl;
}

</script>




</body>  
</html> 