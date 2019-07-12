<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>答辩过程记录</title>
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
    <script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
    <script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core/dialog/closeDialog.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="<%=path %>/Userlogin.action">首页</a></li>
        <li>答辩过程记录</li>
    </ul>
</div>
<div class="rightinfo">
    <div class="formtitle">
        <span>答辩过程记录</span>
    </div>
    <ul class="layui-tab-title">
        <li class="layui-this">
            <a class="selected" href="<%=path%>/biz/defenseRecord_groupAllStudentList.action?view=groupAllStudentList&flag=12&thisReplyType=00">
                答辩过程记录录入- 答辩组</a>
        </li>
        <li>
            <a class="selected" href="<%=path%>/biz/defenseRecord_groupAllStudentList.action?view=groupAllStudentList&flag=12&thisReplyType=01">
                答辩过程记录录入- 大组</a>
        </li>
    </ul>


    <form id="form1" name="form1"
          action="<%=path%>/biz/replyScore_list.action?view=list&page=${pageResults.page}&thisReplyType=00&flag=12"
          method="post">
        <div class="place">
            <ul class="placeul">
                <li><span>院系：</span>${teacherVO.deptName }</li>
                <li><span>大类：</span>${teacherVO.categoryName }</li>
                <li>当前年度：
                    <input class="dfinput" type="text"
                           id="issueInfo.year" name="thisYear" readonly value="${model.year}"
                           style="text-align: center;"
                           onClick="WdatePicker({dateFmt:'yyyy'});"></td>
                </li>
                <li class="click">
                    <a href="javascript:void();" onclick="openSearch(this);"><img src="<%=path%>/images/search.png"/>搜索</a>
                </li>
            </ul>
        </div>
    </form>

    <table class="tablelist">
        <thead>
        <tr>
            <th rowspan="2"><input type="checkbox" id="checkList"/>全选</th>
            <th rowspan="2">序号</th>
            <th colspan="4">学生信息</th>
            <th colspan="2">课题信息</th>
            <%--<th rowspan="2">开题报告结论</th>--%>
            <th rowspan="2">答辩成绩</th>
            <%--<th rowspan="2">最终成绩</th>--%>
            <th rowspan="2">年度</th>
            <th rowspan="2">操作</th>
        </tr>
        <tr>

            <th>学院</th>
            <th>专业</th>
            <th>班级</th>
            <th>姓名</th>
            <th>课题</th>
            <th>课题类型</th>

        </tr>
        </thead>
        <tbody>
        <s:iterator id="p" value="pageResults.data" status="pp">
            <tr id="tr_${student.stuId }">
                <td align="center"><input type="checkbox" name="check_sel"
                                          value="${student.stuId }" title="${student.stuName}"/></td>
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
                <td align="center">
                    <s:if test="issueInfo.issueId==null">
                        <a href="javascript:dialog('50%','50%','【<font color=blue >${student.stuName }</font>】 课题信息',
					        '<%=path%>/biz/issueInfo_openEdit.action?view=add&thisStuId=${student.stuId }&thisYear=${model.year }', 'true','20%');"
                           target="rightFrame">
                            <font color="red">未录入</font></a>
                    </s:if>
                    <s:else>
                        <a href="javascript:dialog('98%','98%','【<font color=blue >${student.stuName }</font>】 课题信息',
					        '<%=path%>/biz/issueInfo_openEdit.action?view=edit&thisStuId=${student.stuId }&thisId=${issueInfo.issueId }&thisYear=${model.year }', 'true','20%');" target="rightFrame" >
                            <font color="blue">${issueInfo.issueName}</font></a>
                    </s:else>
                </td>
                <td align="center">
                    <s:iterator id="p" value="issueTypeList" status="sp">
                        <s:if test="issueInfo.issueType.contains(\"&\"+issueTypeId+\"&\")">${issueTypeName }&nbsp;</s:if>
                    </s:iterator>
                </td>
                <td align="center"
                    width="auto">${groupReply.replyScore!=null&&groupReply.replyScore!=""?groupReply.replyScore:'0'}</td>
                <%--<td align="center" width="auto">${groupReply.replyScoreFinish} </td>--%>

                <td align="center"> ${model.year} </td>

                <td align="center" width="10%">
                    <a href="javascript:dialog('70%','90%','查看答辩记录信息','<%=path%>/biz/defenseRecord_findStudentAllDefenseRecordBy.action?view=list&thisYear=${model.year}&thisStuId=${student.stuId }','true', '5%', '15%');">
                        <font color="blue"><img src="<%=path%>/images/eye_visible.png" width="10px"/>&nbsp;查看</font>
                    </a>
                    &nbsp;&nbsp;&nbsp;
                        <%--  <a href="<%=path%>/biz/taskBook_outTaskBook.action?thisId=${taskId }">
                                  <font> <img src="<%=path%>/images/i01.png" width="20px" />导出
                          </font></a> --%>
                </td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
    <%@ include file="/WEB-INF/common/pagination.jsp" %>
</div>

<script type="text/javascript">
    $(function () {
        $("#checkList").click(function () {
            $("input[name='check_sel']").each(function (index, content) {
                if (this.checked) {
                    this.checked = false;
                } else {
                    this.checked = true;
                }
            });

        });
    });

    layui.use('form', function () {
        var form = layui.form;
        form.on('switch(switch)', function (data) {
            this.value = this.checked ? 1 : 0;
        });
    });
</script>
</body>
</html>


