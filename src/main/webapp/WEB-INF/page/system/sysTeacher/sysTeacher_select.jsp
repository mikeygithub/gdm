<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<title>指标列表</title>
	<meta http-equiv=Content-Type content="text/html; charset=utf-8">
	<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
	<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css"/>
	
    <script type="text/javascript" src="<%=path %>/third/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
	<script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
			
			
<script type="text/javascript">
    
    $(function(){
        $(".tablelinkdelete").click(function(){
            var technicalArry = "";      //教师工号存入数组
	        var teacherNameArry = "";    //教师名称存入数组 
            var id = $(this).attr("id");               //获取选框technical值
			var teacherName = $(this).attr("teacherName");  //获取选框teacherName值
			
			if(teacherNameArry.indexOf(id)>=0){            //该单位是否已选择
				return false;
			}	    
			technicalArry = technicalArry + id + ",";         //选择后加上“id,”
			$("#treeDemo").after("<tr id=new_"+ id +" class='liMarginLeft'><td><laber class='myFontSize'>"+teacherName+"</laber></td><td><input type='button' value='删除' class='dele myFontSize delBtnMargin' onClick=\"removeTeacher('"+id+"','"+teacherName+"')\"/><td></tr>");
		});
		
		$("#sure").click(function(){
			var arry = technicalArry.split(",");          //遇到“,”符号就分割成 数组的一个元素
			if($(".liMarginLeft").length == 0){//如果未选择任务单位，则将单位数组置空
				teacherNameArry = "";
				technicalArry = "";
			}else{
				for(var i = 0; i < arry.length; i++){
					if(""!=arry[i]){
						var teacherName = $("#new_"+arry[i]+" laber").text();
						var tempArray = teacherNameArry.split(","); 
						var flag = 0;
						for(var j = 0; j < tempArray.length; j++){
							if(tempArray[j] == teacherName){
								flag = 1;
								break;
							}
						}
						if(flag == 0 && teacherName !=""){//如果已选择的单位不存在于单位数组，则加入数组
							teacherNameArry +=  teacherName + ",";
						}
					}
				}
			}
			var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
			parent.$('#una').val(teacherNameArry);
			parent.$('#uia').val(technicalArry);
			parent.layer.close(index);
		});	
		
		if(parent.$('#uia').val() !='' && parent.$('#una').val() !=''){
			technicalArry = parent.$('#uia').val(); //获得已选择的单位Id字符串
			teacherNameArry = parent.$('#una').val();     //获得已选择的单位名称字符串
			var tmptechnicalArry = technicalArry.split(",");    //获得已选择的单位Id数组
			var tmpteacherNameArry = teacherNameArry.split(",");   //获得已选择的单位名称数组
			$(function(){ 
				for(var i = 0; i < tmptechnicalArry.length;i++){
					if(tmptechnicalArry[i] !='' && teacherNameArry[i] != ''){
						$("#treeDemo").after("<tr id=new_"+tmptechnicalArry[i]+" class='liMarginLeft'><td><laber class='myFontSize'>"+tmpteacherNameArry[i]+"</laber></td><td><input type='button' value='删除' class='dele myFontSize' onClick=\"removeTeacher('"+tmptechnicalArry[i]+"','"+tmpteacherNameArry[i]+"')\"/></td></tr>");
					}
				}	    
			});
		}	
    });
    function removeTeacher(id, name){                         //删除相应的id以及“,”
        var technicalArry = "";      //教师工号存入数组
	    var teacherNameArry = "";    //教师名称存入数组 
		technicalArry = technicalArry.replace(id+",","");
		$("#new_"+id).remove();
		teacherNameArry = teacherNameArry.replace(name+",","");
    }
</script>
<script  type="text/javascript" >


</script>

<script type="text/javascript">
	/*
	 *_contextPath:上下文路径
	 *_modulePath: 模块路径
	 */
	var _contextPath = "<%=path%>";
	var _modulePath = _contextPath + "/sys/";
	$(document).ready(function() {
		$(".clicks").click(function() {
			_open(_modulePath + "textures_open.action?view=add");
		});
	});
</script>



<style type="text/css">
.tablelinkdelete {
	color: #056dae;
}

.pos-a {
	position: absolute;
}

.find {
	height: 31px;
	margin-top: -5px;
	margin-left: -10px;
}

.find1 {
	height: 31px;
	margin-right: -14px;
	margin-top: -5px;
}

.sure {
	display: block;
	margin: 20px auto 0 auto;
}

#mySpan {
	text-align: center;
	margin-top: 20px;
	font-size: 14pt;
}

.dele {
	color: blue;
	margin-left: 50px;
}

.liMarginLeft {
	padding-top: 100px;
}

.myFontSize {
	font-size: 12pt;
}

.treeMarginTop {
	margin-top: 20px;
}

.delBtnMargin {
	margin-right: 30px;
}

.btn {
	width: 137px;
	height: 35px;
	background: url(../images/btnbg.png) no-repeat;
	font-size: 14px;
	font-weight: bold;
	color: #fff;
	cursor: pointer;
}

.tablelinkdelete {
	color: black;
	font-size: 14px;
}

.tablelinkdelete1 {
	color: #056dae;
	font-size: 14px;
}
</style>

</head>
<body>
	<div class="place"></div>
	<div class="pos-a"
		style="width:300px;left:0;top:6.8%; bottom:0; height:100%; border-right:1px solid #e5e5e5; background-color:#f5f5f5;position:absolute;">
		<span id="mySpan">&nbsp;&nbsp;已选教师</span>
		<table id="treeDemo" class="ztree treeMarginTop">
		</table>
        <input name="" type="submit" class="scbtn" value="确定测试" />
        <button style="background: none;line-height: 35px;margin-left: 4px;"
                type="submit" onclick="savaGroupTeacher(this);"> 测试
		</button> 
		<input name="" type="button" id="sure" class="sure" value="确定" />
		<form id="form1" name="form1"
			action="<%=path%>/biz/readGroup_add.action?resUri=add&view=add"
			method="post">
			<input name="" type="button" id="sure" class="sure" value="确定" />
			 <button style="background: none;line-height: 35px;margin-left: 4px;"
                type="submit" onclick="savaGroupTeacher(this);"> 测试
		</button> 
		</form>
	</div>

	<div style="margin-left:300px;">
		<div class="formbody">
			<div id="usual1" class="usual">
				<div id="tab2" class="tabson">
					<form action="<%=basePath%>/sys/SysTeacher_list.action"
						method="post" id="form">
						<ul class="seachform">
							<li><label>综合查询</label><input class="scinput" id="query"
								name="model.teacherName" value="${model.teacherName}"
								placeholder="请输入单位名称" /></li>
							<li><input name="" type="submit" class="scbtn" value="查询" />
							</li>
						</ul>
					</form>
					<table class="tablelist">
						<thead>
							<tr>
								<th style="width: 100px">序号</th>
								<th style="width: 100px">姓名</th>
								<th style="width: 100px">工号</th>
								<th style="width: 100px">联系电话</th>
								<th style="width: 50px">操作</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator id="p" value="pageResult.data" status="pp">
								<tr id="tr_${id}">
									<td align="center"><s:property value="#pp.count" /></td>
									<td align="center">${teacherName}</td>
									<td align="center">${technical}</td>
									<td align="center">${teacherTelephone}</td>
									<td><a href="javascript:;" class="tablelinkdelete"
										id="${id}" teacherName="${teacherName}"
										technical="${technical}">选择</font></a>&nbsp;&nbsp;</td>
								</tr>
								<!-- teacherName="${teacherName}" technical="${technical}" -->
							</s:iterator>
						</tbody>
					</table>
					<%@ include file="/WEB-INF/common/pagination.jsp"%>
				</div>

			</div>
			<script type="text/javascript">
				$("#usual1 ul").idTabs();
			</script>

			<script type="text/javascript">
				$('.tablelist tbody tr:odd').addClass('odd');
			</script>
		</div>


	</div>

	<div class="tip">
		<div class="tiptop">
			<span>提示信息</span><a></a>
		</div>
		<div class="tipinfo">
			<span><img src="<%=basePath%>images/ticon.png" /> </span>
			<div class="tipright">
				<p>是否确认删除信息 ？</p>
				<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
			</div>
		</div>

		<div class="tipbtn">
			<input name="" type="button" class="sure" value="确定" />&nbsp; 
			<input name="" type="button" class="cancel" value="取消" />
		</div>

	</div>
</body>

</html>
