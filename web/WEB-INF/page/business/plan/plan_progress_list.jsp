<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>进度计划</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css"
	type="text/css" />

<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
<script type="text/javascript"
	src="<%=path%>/third/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>
<script type="text/javascript" src="<%=path%>/datePicket/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/js/core/dialog/closeDialog.js"></script>

<script type="text/javascript">
	$(function() {
		$("#form1").validate({
			errorClass : "errorInfo", //默认为错误的样式类为：error
			errorElement : "em",
			focusInvalid : false, //当为false时，验证无效时，没有焦点响应  
			onkeyup : false,
			submitHandler : function(form) { //表单提交句柄,为一回调函数，带一个参数：form
				form.submit(); //提交表单
				var index = layer.load(2, {
					time : 10 * 1000
				}); //又换了种风格，并且设定最长等待10秒 
			},
			rules : {
				"model.year" : {
					required : true
				},
			},
			messages : {
				"model.year" : {
					required : "请选择年度"
				},
			},
			errorPlacement : function(error, element) { //错误信息位置设置方法
				error.appendTo(element.parent()); //这里的element是录入数据的对象
			}
		});
	});

	$(function() {
		var flag = "${mark}";
		if (flag != '' && flag != undefined) {
			if (flag == "1") {
				$('#submit').attr('disabled', 'disabled');
				layer.msg('添加成功');
				setTimeout(function() {
					//parent.location.reload();
					layer.close(index);
				}, 1000);
			} else if (flag == "0") {
				layer.msg('添加失败');
			}
		}
	});

	//搜索
	function openSearch(name) {
		$("#form1").submit();
	}
</script>

<style>
	td {
		padding: 4px;
		font-size: 14px;
	}
</style>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>
			<li>指导安排</li>
		</ul>
	</div>

	<div class="rightinfo">
		<%@include file="/WEB-INF/page/business/plan/plan_tab.jsp" %>
		<form id="form1" name="form1"
			action="<%=path%>/biz/PlanProgress_list.action?view=progress_list"
			method="post">
			<table border="10" cellspacing="0" cellpadding="0" width="100%">
				<tr>
					<td align="center" width="100px">当前年度：</td>
					<td width="20px"><input class="dfinput" type="text"
						id="model.year" name="model.year" readonly
						value="${model.year}" style="text-align: center;"
						onClick="WdatePicker({dateFmt:'yyyy'});">
					</td>
					<td align="center" width="140px"><input type="button" name=""
						class="btn" value="查询" onclick="$('#form1').submit()" />
					</td>
					<td align="center" ></td>
				</tr>
			</table>
		
			<div class="place">
				<ul class="placeul">
				 	 <li class="click" >
			        	<span>学院：<s:select cssClass="dfinput" list="departmentList" 
		        		 cssStyle="width: auto;" onchange="$('#form1').submit();"  value="model.deptNumber"
		        		 listKey="deptNumber" listValue="deptName"  id="deptNumber" name="model.deptNumber"/></span>		
	        		 </li>
			         <li class="click" >
			        	<span>大类：<s:select cssClass="dfinput" list="categoryList" 
			        	headerKey="-1" headerValue="所有大类"
		        		 cssStyle="width: auto;" onchange="$('#form1').submit();" value="model.categoryId"
		        		 listKey="categoryId" listValue="categoryName"  id="category"  name="model.categoryId"/></span>		
			         </li>			  
			         <li class="click" >
			        	<span>专业：<s:select cssClass="dfinput" list="sysMajorList" 
			        	 headerKey="-1" headerValue="所有专业"
		        		 cssStyle="width: auto;" onchange="$('#form1').submit();" value="model.majorId"
		        		 listKey="majorId" listValue="majorName" 	id="major"  name="model.majorId"/></span>		
			         </li>	
					</ul>
			</div>
		</form>

		<table class="tablelist">
			<thead>
				<tr>
					<th rowspan="2"><input type="checkbox" id="checkList" />全选</th>
					<th rowspan="2">序号</th>
					<th rowspan="2">进度过程名称</th>
					<th colspan="2">进度时间段</th>
					<th rowspan="2">年度</th>
					<th rowspan="2">状态</th>
					<th rowspan="2">操作</th>
				</tr>
				<tr>
					<th>开始时间</th>
					<th>结束时间</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator id="p" value="pageResult.data" status="pp">
					<tr id="tr_${progressItemNo}" >
						<td align="center"><input type="checkbox" name="check_sel"
							value="${progressItemNo }" alt="${planYear.year }"
							title="${progressName}" /></td>
						<td align="center"><s:property value="#pp.count" /></td>
						<td align="center">${progressName}</td>
						<td align="center">
							<input name="model.startTime"
								class="dfinput" id="startTime${progressItemNo }"
								class="text Wdate"
						        value="${startTime}" 
								type="text"
								onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',isShowWeek:true})" />
						</td>
						<td align="center"><input name="model.endTime"
								class="dfinput" id="endTime${progressItemNo }"
								class="text Wdate"
						        value="${endTime}" 
								type="text"
								onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',isShowWeek:true})" />
						</td>
						<td align="center">${planYear.year}</td>
						<td align="center">
							<div class="layui-form">
								<input type="checkbox" 
									   alt="${progressId }" 
								       id="start${progressItemNo}" 
								       name="switch_start${progressItemNo}" 
								  <s:if test="progressStart==1"> checked="checked" value="1"</s:if>
								  <s:else>value="0"</s:else>
								  lay-skin="switch" lay-filter="switch"  lay-text="开|关">
							</div>
					</td>
					<td align="center"><a href="javascript:void(0);"
						onclick="selStart(this)"  id="${progressItemNo}"  title="${progressName}"
						class="layui-btn layui-btn-primary  layui-btn-small"><font
						color="blue">保存</font> </a>
					</td>
				</tr>
			</s:iterator>
		   </tbody>
		  <p align="center">
		</table>
		<%@ include file="/WEB-INF/common/pagination.jsp"%>

<script>
	layui.use('form', function(){
	  var form = layui.form;
	  form.on('switch(switch)',function(data){
		  this.value = this.checked ?1 :0;
	  });
	});
</script>
<script type="text/javascript">
	function selStart(name){
	    var isChecked = false;
	    var info='';
	    
	    var deptNumber = $("#deptNumber").val();
	    var categoryId = $("#category").val();
	    var categoryName= $("#category option:selected").text();
	    var majorId = $("#major").val();
	    var majorName= $("#major option:selected").text();
	    
	    var progressItemNo = $(name).attr("id");
	    var progressItemName = ''+$(name).attr("title");
	    var startTime = $("#startTime"+progressItemNo).val();
	    var endTime = $("#endTime"+progressItemNo).val();
	    
	    var progressId = $("#start"+progressItemNo).attr("alt");
	    var progressStart = $("#start"+progressItemNo).val();
	    var state = '<font color=\"'+(progressStart==0?'red\">禁用':'#5FB878\">启用')+'</font>';
	    var year = '${planYear.year}';
	    
	      if(startTime ==undefined ||startTime.length==0){
	         layer.msg(progressItemName+'<br>开始时间不能为空',{icon: 0});
	      return;
	      }
	      if(endTime==undefined||endTime.length==0){
	         layer.msg(progressItemName+'<br> 结束时间不能为空',{icon: 0});
	      
	      return;
	      }
	      
	      if(progressId==undefined||progressId.length==0){
	      progressId = -1;
	      }
	       info  = progressItemNo+"_"+year+"_"+
				     startTime+"_"+endTime+"_"
				     +progressId+"_"+progressStart
				     +'_'+deptNumber+'_'+categoryId+'_'+majorId; 
	       
		       var index = layer.confirm('当前大类：'+categoryName
		    		   +'<br>当前专业：'+majorName+'<br>当前阶段：'+progressItemName
		    		   +'<br>开始时间：<font color=\"blue\">'+startTime
		    		   +'</font><br>结束时间：<font color=\"blue\">'+endTime
		    		   +'</font><br>状态：'+state,
				{icon: 6},function(){
				 layer.close(index);
				 var index = layer.load(1);
				 $.ajax({
				        type: "post",
				        cache: false,
				        url: '<%=path%>/biz/PlanProgress_add.action',
									dataType : "json",
									data : {
										"thisId" : info,
									},
									success : function(result) {
										layer.close(index);
										if (result) {
											layer.alert('保存成功', {
												icon : 1
											}, function() {
												location.reload();
											});
										} else {
											layer.msg('保存失败', {
												icon : 2
											});
										}
									},
									error : function(result) {
										layer.close(index);
										layer.msg('保存失败', {
											icon : 2
										});
									}
								});
							});
	
				}
	
				$(function() {
					$("#checkList").click(function() {
						$("input[name='check_sel']").each(function(index, content) {
							if (this.checked) {
								this.checked = false;
							} else {
								this.checked = true;
							}
						});
	
					});
				});
</script>
</div>
</body>
</html>
