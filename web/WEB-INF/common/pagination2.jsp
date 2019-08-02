<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<script type="text/javascript" src="<%=path%>/third/laypage-v1.3/laypage/laypage.js"></script>
     <div class="pagin">
         <div class="message">共<i class="blue">${pageResult2.total!=null?pageResult2.total:0 }</i>条记录，当前显示第&nbsp;<i class="blue">${pageResult2.page!=null?pageResult2.page:0}&nbsp;</i>页，总页数：<i class="blue">${pageResult2.totalPage!=null?pageResult2.totalPage:0 }</i> 页</div>
<%--    	<div class="message">共<i class="blue">${pageResult2.total }</i>条记录，当前显示第&nbsp;<i class="blue">${pageResult2.page}&nbsp;</i>页，总页数：<i class="blue">${pageResult2.totalPage }</i> 页</div>--%>
        <ul class="paginList">
        <li ><s:if test="pageResult2.totalPage==1">  <!-- 分页  如果总页数为1 则显示自定义分页 -->
	<div name="laypage1.3" style="text-align:center;" class="laypage_main laypageskin_molv" id="laypage_0"><span class="laypage_curr" style="background-color:#3EAFE0">1</span><span class="laypage_total"><label>到第</label><input type="number" min="1" onkeyup="this.value=this.value.replace(/\D/, '');" class="laypage_skip"><label>页</label><button type="button" class="laypage_btn">确定</button></span></div>
</s:if><s:else>
		<div id="page3" ></div>
</s:else> </li>
        </ul>
    </div>
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
 <script type="text/javascript">
  $(document).ready(function(){
	  var isJemp = -1;  //默认加载 ;laypage 防止 jump无限加载
	  //分页
	  laypage({
		  cont: $('#page3'), //容器。值支持id名、原生dom对象，jquery对象,
		  pages: ${pageResult2.totalPage}, //总页数
		  skip: true, //是否开启跳页
		  skin: '#3EAFE0',
		  groups: 3, //连续显示分页数
		  curr: ${pageResult2.page}, //当前页
		  jump: function(obj, first){
			  //得到了当前页，用于向服务端请求对应数据
			  var curr = obj.curr;
			  isJemp++;
			  if(isJemp>0)
			  window.location.href='${pageResult2.pageUrl}'+curr;
			}
		});
});
	</script>
