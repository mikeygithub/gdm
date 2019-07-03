<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
      <div class="itab">
  	     <ul> 
  	       <li><s:if test="materialInfo.issueInfo.issueId==null">
					        <a <s:if test="tabFlag==00"> class="selected" </s:if> href="<%=path%>/biz/issueInfo_openEdit.action?view=add&thisStuId=${materialInfo.student.stuId }&thisYear=${thisYear }&tabFlag=00" >  
					                              课题信息</a>
					       </s:if>
					       <s:else>
					        <a  <s:if test="tabFlag==00"> class="selected" </s:if> href="<%=path%>/biz/issueInfo_openEdit.action?view=edit&thisStuId=${materialInfo.student.stuId }&thisId=${materialInfo.issueInfo.issueId }&thisYear=${thisYear }&tabFlag=00" >  
					                            课题信息</a>
					       </s:else></li> 
		                <li>
						<s:if test="materialInfo.taskId==null">
				         <a <s:if test="tabFlag==01"> class="selected" </s:if> href="<%=path%>/biz/taskBook_openAdd.action?view=add&thisStuId=${materialInfo.student.stuId }&thisYear=${thisYear }&tabFlag=01&flag=03" >  
				            任务书信息</a>
				       </s:if><s:else>
				         <a <s:if test="tabFlag==01"> class="selected" </s:if> href="<%=path%>/biz/taskBook_openEdit.action?view=edit&thisStuId=${materialInfo.student.stuId }&thisId=${materialInfo.taskId }&thisYear=${thisYear }&tabFlag=01&flag=03" >  
				              任务书信息</a></s:else>
				       </li> 
				        
					 <li>
					<s:if test="materialInfo.reportId==null">
				         <a <s:if test="tabFlag==02"> class="selected" </s:if> href="<%=path%>/biz/openReport_openAdd.action?view=add&thisStuId=${materialInfo.student.stuId }&thisYear=${thisYear }&tabFlag=02&flag=04" >  
				             开题报告信息</a>
				       </s:if><s:else>
				        <a <s:if test="tabFlag==02"> class="selected" </s:if> href="<%=path%>/biz/openReport_openEdit.action?view=edit&thisStuId=${materialInfo.student.stuId }&thisId=${materialInfo.reportId }&thisYear=${thisYear }&tabFlag=02&flag=04" >  
				                开题报告信息</a></s:else>
				       </li> 
						 <li>
				        <a <s:if test="tabFlag==03"> class="selected" </s:if> href="<%=path%>/biz/progressSitu_list.action?view=list&thisStuId=${materialInfo.student.stuId }&thisId=${materialInfo.reportId }&thisYear=${thisYear }&tabFlag=03&flag=05" >  
				         进度情况信息
				      </a>
				       </li> 
				       
				       
  	    </ul>
</div>
