<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<div class="itab">
	<ul>
		<li>
			<a <s:if test="tabFlag==00"> class="selected" </s:if>
					href="<%=path%>/biz/materialInfo_info.action?view=info&thisYear=${thisYear }&tabFlag=00">
				课题信息列表</a>
		<li>
			<a <s:if test="tabFlag==01"> class="selected" </s:if>
					href="<%=path%>/biz/materialInfo_info.action?view=myGuideTeacher&thisYear=${thisYear }&tabFlag=01">
				指导老师信息</a>
		</li>

		<li>
			<a <s:if test="tabFlag==02"> class="selected" </s:if>
					href="<%=path%>/biz/materialInfo_info.action?view=myGroup&thisYear=${thisYear }&tabFlag=02">
				答辩分组信息</a>
		</li>
		<li>
			<a <s:if test="tabFlag==03"> class="selected" </s:if>
					href="<%=path%>/biz/defenseRecord_list.action?view=list&thisYear=${thisYear }&tabFlag=0&flag=11">
				答辩记录信息
			</a>
		</li>
		<li>
			<a <s:if test="tabFlag==04"> class="selected" </s:if>
					href="<%=path%>/biz/materialInfo_info.action?view=uploadFile&thisYear=${thisYear }&tabFlag=04">
				文件上传信息
			</a>
		</li>
	</ul>
</div>
