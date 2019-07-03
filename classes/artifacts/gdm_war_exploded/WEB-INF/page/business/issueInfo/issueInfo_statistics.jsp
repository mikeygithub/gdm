<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>课题统计</title>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css" />
<link href="<%=path %>/css/animate.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">


<script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script language="JavaScript" src="<%=path%>/js/alert.js"></script>
<script src="<%=path %>/js/echarts.min.js"></script>

<style type="text/css">
.rightText {text-align: right;width: 100px; ;}
td {padding: 4px;font-size: 14px;}
table{margin:0 auto;}
.title{height: 40px;}
.warn{color: red;font-size: 25px;}
.textContent {
	font-size: 16px;padding: 4px;color: #3EAFE0;
}
</style>
</head>
<body style="min-width: 200px">
     <form id="form1" name="form1"  action="<%=path%>/biz/issueInfo_openChart.action?" method="post">
        	<div class="place">
		<ul class="placeul">
		<li><span>院系：</span>信息与电子工程</li>
					<%-- <li>当前年度：
					<input class="dfinput" type="text"
						id="issueInfo.year" name="thisYear" readonly value="${thisYear}"
						style="text-align: center;"
						onClick="WdatePicker({dateFmt:'yyyy'});"></td>
				</li>
				<li class="click">
	        		<a href="javascript:void();"  onclick="openSearch(this);"><img src="<%=path%>/images/search.png"  />搜索</a>
				</li>  --%>
		</ul>
		</div>
     </form>
		<!-- 进度提示框 开始-->
		<div class="alert alert-success hidden"  id="Succces" >加载图表成功！</div>
		<div class="alert alert-info hidden " id="Pross">正在加载图表，请销等</div>
		<div class="alert alert-danger hidden " id="Error" >加载图表失败。</div>
		<!-- 进度提示框 结束-->
		    <div id="main" style="width: 100%;height:700px;margin-top: 10px"></div>
		
<script type="text/javascript">
$(function(){
    openEchart();
    function openEchart(){
       // 基于准备好的dom，初始化echarts实例
       var myChart = echarts.init(document.getElementById('main'));
       alertShow($('#Pross'));
       $.ajax({
	        type: "post",
	        url: '<%=path%>/biz/issueInfo_chart.action',
		    dataType : "json",
		    success : function(result) {
				alertHide($('#Pross'));
				alertShowT($('#Succces'),1000);
				var json = result ; //数组  
				console.log(json);
				var pList = json['pList'];
			    var typeList = json['typeList'];
			    var years = json['yearList']; 
			    var values = json['valueList']; 
	            var option = {
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
				    },
				    legend: {
				        data:typeList
				    },
				    grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				    xAxis : [
				        {
				            type : 'category',
				            data : pList
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value'
				        }
				    ],
				    series : [
				        {
				            name:'基础研究',
				            type:'bar',
				            data:values[0].value
				        },
				        {
				            name:'应用基础',
				            type:'bar',
				            data:values[1].value
				        },
				        {
				            name:'应用研究',
				            type:'bar',
				            data:values[2].value
				        },
				        {
				            name:'工程设计',
				            type:'bar',
				            data:values[3].value
				        },
				        {
				            name:'实验研究',
				            type:'bar',
				            data:values[4].value,
				        },
				    ]	            
	           };
	           
	           
	           // 使用刚指定的配置项和数据显示图表。
	           myChart.setOption(option);
		   },
		   error : function(result) {
			  alertHide($('#Pross'));
			  alertShowT($('#Error',1000));
			  console.log("error"+result);
		   }
	   });
    }

});
   </script>
</body>
</html>
