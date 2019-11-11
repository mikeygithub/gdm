<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.gxwzu.core.context.SystemContext" %>
<%@ page import="com.gxwzu.core.context.SystemContext" %>
<%@ taglib prefix ="sec" uri ="http://www.springframework.org/security/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
    function loginOutTip() {
        layer.open({
            title:'系统提示'
            ,content: '您确认退出吗？'
            ,offset: ['40%', '40%']
            ,btn: ['确定退出', '取消']
            ,shadeClose: true
            ,yes: function(index, layero){
                layer.msg('退出成功',{icon:1})
                top.location = "<%=path%>/Userlogin_logout.action";
            }
            ,btn2: function(index, layero){
            }
            ,cancel: function(){
            }
        });
    }
</script>