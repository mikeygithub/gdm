<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="formtitle">
			<ul> 
				<li <s:if test="tabFlag==01">class="line"</s:if>><a href="<%=path%>/biz/PlanProgress_list.action?view=progress_list&tabFlag=01">进度计划</a></li>
				<li <s:if test="tabFlag==02">class="line"</s:if>><a href="<%=path%>/biz/PlanGuide_list.action?view=guide_list&tabFlag=02">指导安排</a></li>
			</ul>
</div>

