<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
			<div class="mainindex">
				<div class="welinfo">
					<span><img src="images/sun.png" alt="天气" />
					</span>
					<b>${sessionScope.sysUser.userName}你好，欢迎使用梧州学院毕业设计选题档案管理平台</b>
					<a href="javaScript:;">帐号设置</a>
	            </div>
				<div class="xline"></div>
	         </div>
			
			<div class="mainindex">
			   <div class="welinfo">
					<span>
						<img src="<%=path%>/images/dp.png" alt="提醒" />
					</span>
					<b>系统管理员主要操作流程如下：</b>
					<br /><br />
					<span>
						<img src="<%=path%>/images/xgly.png" />
					</span>
			   </div>
			</div>
			<div class="xline"></div>
		
		    <div class="mainindex">
				   <div class="welinfo">
						<span>
							<img src="<%=path%>/images/c01.png" alt="提醒" />
						</span>
						 <b>梧州学院毕业设计选题档案管理平台服务器运行状态</b>
						<br /><br />
				   </div>
				   <ul class="infolist">
						    <li><%  
							    double total = (Runtime.getRuntime().totalMemory()) / (1024.0 * 1024);  
							    double max = (Runtime.getRuntime().maxMemory()) / (1024.0 * 1024);  
							    double free = (Runtime.getRuntime().freeMemory()) / (1024.0 * 1024);  
							    
							    out.println("最大内存量(当前JVM的最大可用内存): " + max + "MB<br/>"); %></li> 
						    <li><%out.println("内存总量(当前JVM占用的内存总数): " + total + "MB<br/>"); %></li>
							<li><%out.println("空闲内存量(当前JVM空闲内存): " + free + "MB<br/>");   %></li>
						    <li><%out.println("JVM实际可用内存: " + (max - total + free) + "MB<br/>");   %></li>
					</ul>	
			</div>
		    <div class="xline"></div>
		
		    <div class="mainindex">
			   <div class="welinfo">
					  <span>
					     <img src="<%=path%>/images/icon06.png" alt="天气" />
					  </span>
					  <b>技术支持：<a href="javascript:void(0);" target="_blank">软件开发中心</a></b>
			   </div>
			</div>
			<div class="xline"></div>
