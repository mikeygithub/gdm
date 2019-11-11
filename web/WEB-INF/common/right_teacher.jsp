<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="mainbox">

		<div class="mainleft">

			<!--leftinfo end-->


			<div class="leftinfos">


				<div class="infoleft">

					<div class="listtitle">
						<a href="#" class="more1"></a>时间安排
					</div>
					<ul class="layui-timeline" id="planProgress">

					</ul>
				</div>

				<div class="inforight">
					
					<div class="listtitle">
						<a href="#" class="more1"></a>指导教师主要任务
					</div>
					<ul class="layui-timeline" id="gradscore">
						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title" id="gradscore"><span class="layui-badge">1</span>完善个人信息</h3>
								<div class="layui-timeline-title">主要是完善本人的可带专业以及研究方向，为学生选择毕业设计导师提供参考</div>
							</div></li>

						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title" id="gradscore"><span class="layui-badge">2</span>确定指导学生名单</h3>
								<div class="layui-timeline-title">选择指导学生，查看已选你为导师的学生信息，确定或是退选学生</div>
							</div></li>

						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title" id="gradscore"><span class="layui-badge">3</span>我的课题</h3>
								<div class="layui-timeline-title">如果本人有课题或者是研究项目可录入系统，供指导学生参考选择课题</div>
							</div></li>

						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title" id="gradscore"><span class="layui-badge">4</span>在线交流指导</h3>
								<div class="layui-timeline-title">通过在线交流对学生进行指导，规范学生选题，可私聊或是群聊对指导学生实时指导，
								<br>发送消息或文件等毕业设计相关资料，并回答学生提出的问题</div>
							</div></li>
                        <li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title" id="gradscore"><span class="layui-badge">5</span>下达任务书</h3>
								<div class="layui-timeline-title">确定所有指导学生选完论文题目后，给学生下达任务书</div>
							</div></li>
						<li class="layui-timeline-item"><i
								class="layui-icon layui-timeline-axis"></i>
								<div class="layui-timeline-content layui-text">
									<h3 class="layui-timeline-title" id="gradscore"><span class="layui-badge">6</span>查看学生开题报告</h3>
									<div class="layui-timeline-title">对学生提交的开题报告进行检查并指导。在开题报告结束后，查看指导学生开题通过
									<br>情况，对于未通过的学生，及时交流指导</div>
								</div></li>
						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title" id="gradscore"><span class="layui-badge">7</span>中期检查</h3>
								<div class="layui-timeline-title">对指导学生毕业设计进行中期检查，规范指导学生毕业设计行为</div>
							</div></li>
						<li class="layui-timeline-item"><i
							class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text">
								<h3 class="layui-timeline-title" id="gradscore"><span class="layui-badge">8</span>批阅指导学生论文</h3>
								<div class="layui-timeline-title">对指导学生提交的论文进行批阅，给出相关修改意见</div>
							</div></li>
					</ul>
					
					
				</div>
			</div>
		</div>
		<!--mainleft end-->
		<div class="mainright">

			<!--公告信息 satrt-->
			<div class="dflist">
				<div class="listtitle">
<%--					<a href="javascript:void(0);" onclick="openNoticeList()" class="more1">更多</a><img src="<%=path%>/images/i09.png" style="width:40px" />&nbsp;公告信息--%>
					<a href="javascript:dialog('100%','100%','通知列表','<%=path%>/sys/notice_list.action?view=list', 'true','0');" class="more1">更多</a><img src="<%=path%>/images/i09.png" style="width:40px" />&nbsp;公告信息
				</div>
				<ul class="newlist" id="sysNotice" >

				</ul>
			</div>

		</div>
		<!--mainright end-->
	</div>
	<!--我的聊天室   -->
	<div id="myChat"
		style="width: 260px;height: 520px;position: absolute;bottom: 0; right: 3px;box-shadow: 1px 1px 50px rgba(0,0,0,.3);">

		<div class="layui-layer layui-layer-page layui-box layui-layim"
			id="layui-layer1" type="page" times="1" showtime="0" contype="string"
			style="z-index: 19891015; width: 260px; height: 520px; position:absolute;right: 3px;top:0; background-image: url(http://res.layui.com/layui/dist/css/modules/layim/skin/3.jpg);">
			<div class="layui-layer-title" style="cursor: move;"></div>
			<div id="layui-layim" class="layui-layer-content"
				style="height: 520px;">
				<div class="layui-layim-main">
					<div class="layui-layim-info">
						<div class="layui-layim-user">本人${student.stuName }${teacher.teacherName }</div>
						<div class="layui-layim-status">
							<span class="layui-icon layim-status-online" layim-event="status"
								lay-type="show"></span>
							<ul class="layui-anim layim-menu-box">
								<li class="layim-this" layim-event="status" lay-type="online">
									<i class="layui-icon"></i><cite
									class="layui-icon layim-status-online"></cite>在线</li>
								<li layim-event="status" lay-type="hide"><i
									class="layui-icon"></i><cite
									class="layui-icon layim-status-hide"></cite>隐身</li>
							</ul>
						</div>
<%--						<input class="layui-layim-remark" placeholder="编辑签名" value="在深邃的编码世界，做一枚轻盈的纸飞机">--%>
					</div>

					<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
						<!--组成员列表start  -->
						<ul class="layui-tab-title">
							<li class="layui-this"><i class="layui-icon">&#xe612;</i>
							</li>
							<li><i class="layui-icon">&#xe613;</i>
							</li>
						</ul>
						<!--组成员列表end  -->

						<div class="layui-tab-content">
							<div class="layui-tab-item layui-show">
								<ul
									class="layui-unselect layim-tab-content layui-show layim-list-friend"
									id="openpeoul">
									<li>
										<ul id="openpeolist" class="layui-layim-list"
											style="display: block;">
											
										</ul>
									</li>
								</ul>
							</div>
							<div class="layui-tab-item">
								<ul class="layui-unselect layim-tab-content"
									style="display: block;"
									id="opengroupul">
									<li>
										<ul id="openpeogrouplist" class="layui-layim-list layui-show layim-list-group">
											<li onclick="openChat(1,'0','0');" class="layim-group101" id="groupChatIl">
											</li>
										</ul>
									</li>
								</ul>
							</div>

						</div>
					</div>

				</div>
			</div>
			<span class="layui-layer-setwin">
				<a id="chatclose" class="layui-layer-ico layui-layer-close layui-layer-close1" href="javascript:;"></a> 
			</span>
		</div>
	</div>

	<!--右下角聊天室按钮  -->
	<div id="chatbottom" onclick="loadChatInfo()"
		style="position: absolute;bottom: 0;width: 150px;right: 0;border: 1px solid #ddd;height: 50px;box-shadow: 1px 1px 50px rgba(0,0,0,.3);">
		<img
			src="<%=path%>/images/qq.jpg"
			style="width: 40px;height: 40px;
           border-radius: 25px;float: left;margin: 6px;"><span
			style="height: 50px;line-height: 50px;font-size:16px;">最新消息
		<s:if test="chatCount!=null&&chatCount!=0">
			<span class="layui-badge message-count"><s:property value="chatCount"></s:property></span>
		</s:if>
	</span>
	</div>