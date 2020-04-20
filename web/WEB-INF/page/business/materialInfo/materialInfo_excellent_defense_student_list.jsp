<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>大组评阅分配</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css"/>

    <script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
    <script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>
    <script type="text/javascript" src="<%=path%>/datePicket/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core/dialog/ajax.js"></script>
    <script type="text/javascript">

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
        <li>所带学生信息</li>
    </ul>
</div>
<div>
    <ul class="layui-tab-title">
        <li>
            <a class="selected"
               href="<%=path%>/biz/materialInfo_groupDefenseStudentList.action?view=defense_student_list&flag=13&thisReplyType=00">
                学生列表
                <%--						(<font style="font-weight: bold;font-size: 14px; "color="blue"></font>)--%>
                - 答辩组</a>
        </li>
        <li class="layui-this">
            <a class="selected"
               href="<%=path%>/biz/materialInfo_groupDefenseStudentList.action?view=excellent_defense_student_list&flag=13&thisReplyType=01">
                优秀学生列表(<font style="font-weight: bold;font-size: 14px; " color="blue">${pageResult.total }</font>)-
                大组</a>
        </li>
    </ul>
</div>
<div class="rightinfo">

    <s:if test="groupAllot!=null&&groupAllot.teacherList.size>0">
        <div class="itab">
            <ul>
                <s:iterator id="" value="groupAllot.teacherList">
                <li>
                    <a <s:if test="model.teacherId==teacherId"> class="selected" </s:if>
                            href="<%=path%>/biz/materialInfo_groupDefenseStudentList.action?view=excellent_defense_student_list&thisYear=${thisYear }&model.teacherId=${teacherId}&flag=13&thisReplyType=01">
                            ${teacherName }
                            <s:if test="type==0">(组长)</s:if>
                        <s:if test="type==1">(答辩)</s:if> <s:if test="type==2">(记录员)</s:if>
                    </a>
                <li>
                    </s:iterator>
            </ul>
        </div>
    </s:if>
    <form id="form1" name="form1"
          action="<%=path%>/biz/materialInfo_groupDefenseStudentList.action?view=excellent_defense_student_list&flag=13&thisReplyType=01"
          method="post">
        <div class="place">
            <ul class="placeul">
                <li><span>院系：</span>${teacher.deptName }</li>
                <li><span>大类：</span>${teacher.categoryName }</li>
                <li>当前年度：
                    <input class="dfinput" type="text"
                           id="issueInfo.year" name="thisYear" readonly value="${model.year}"
                           style="text-align: center;"
                           onClick="WdatePicker({dateFmt:'yyyy'});"></td>
                </li>
                <li class="click">
                    <a href="javascript:void(0);" onclick="openSearch(this);"><img src="<%=path%>/images/search.png"/>搜索</a>
                </li>
            </ul>
        </div>
    </form>

    <table class="tablelist">
        <thead>
        <tr>
            <th>序号</th>
            <th colspan="4">学生信息</th>
            <th colspan="2">课题信息</th>

            <th rowspan="2">年度</th>
            <th rowspan="2">分配</th>
        </tr>
        <tr>
            <th>序号</th>
            <th>学院</th>
            <th>专业</th>
            <th>班级</th>
            <th>姓名</th>
            <th>课题</th>
            <th>课题类型</th>
        </tr>
        </thead>
        <tbody>
        <s:if test="pageResult.data!=null&&pageResult.total>0">
            <s:iterator id="p" value="pageResult.data" status="pp">
                <tr id="tr_${taskId }">
                    <td align="center"><s:property value="#pp.count"/></td>
                    <td align="center">
                            ${student.deptName}
                    </td>
                    <td align="center">
                            ${student.majorName}
                    </td>
                    <td align="center">
                            ${student.className}
                    </td>

                    <td align="center">${student.stuName}</td>
                        <%--  <td align="center">
                           <s:if test="issueInfo.issueId==null">
                                   <font color="red">未录入</font>
                           </s:if>
                           <s:else>
                                  <font color="blue">${issueInfo.issueName}</font>
                           </s:else>
                        </td>  --%>
                    <td align="center">
                        <s:if test="issueInfo.issueId==null">
                            <a href="javascript:dialog('90%','90%','【<font color=blue >${student.stuName }</font>】 课题信息',
					        '<%=path%>/biz/issueInfo_openEdit.action?view=add&thisStuId=${student.stuId }&thisYear=${model.year }', 'true','20%');"
                               target="rightFrame">
                                <font color="red">未录入</font></a>
                        </s:if>
                        <s:else>
                            <a href="javascript:dialog('98%','98%','【<font color=blue >${student.stuName }</font>】 课题信息',
					        '<%=path%>/biz/issueInfo_openEdit.action?view=edit&thisStuId=${student.stuId }&thisId=${issueInfo.issueId }&thisYear=${model.year }', 'true','20%');"
                               target="rightFrame">
                                <font color="blue">${issueInfo.issueName}</font></a>
                        </s:else>
                    </td>

                    <td align="center">
                        <s:iterator id="p" value="issueTypeList" status="sp">
                            <s:if test="issueInfo!=null&&issueInfo.issueType!=null&&issueInfo.issueType.contains(\"&\"+issueTypeId+\"&\")">${issueTypeName }&nbsp;</s:if>
                        </s:iterator>
                    </td>

                    <td align="center"> ${model.year} </td>
                    <td align="center"><font color="blue">分配给：</font>
                        <s:select list="groupAllot.teacherList" cssClass="dfinput" cssStyle="width: 100px;"
                                  listKey="teacherId" listValue="teacherName" value="model.teacherId"
                        ></s:select>
                        <a href="javascript:void(0);"
                           onclick="allot(this,${student.id },'${student.stuName}');" id="${student.stuId}"
                           title="${student.stuName}"
                           class="layui-btn layui-btn-primary  layui-btn-small"><font
                                color="blue">保存</font> </a>
                    </td>
                </tr>
            </s:iterator>
        </s:if>
        <s:else>
            <tr><td align="center" colspan="10"><font>暂无数据</font></td></tr>
        </s:else>

        </tbody>
    </table>
    <%@ include file="/WEB-INF/common/pagination.jsp" %>
</div>
<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>
<script type="text/javascript">

    function allot(name, thisId, stuName) {
        var td = $(name).parent();
        var sel = td.find("select");
        var selName = sel.find("option:selected").text();
        var data = {
            "thisId": thisId,
            "model.defenseTeacherId": sel.val()
        };
        var title = '是否确认当前要分配？<br><font color="blue">' + stuName + '</font> &nbsp;-》分配到&nbsp;<font color="blue"> ' + selName + '</font>';
        var url = '<%=path%>/biz/GroupStudent_editStudent.action';
        ajax(url, data, title);
    }
</script>
</body>
</html>


