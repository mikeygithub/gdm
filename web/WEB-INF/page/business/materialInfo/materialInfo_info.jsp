<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>课题信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css"/>

    <script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
    <script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
    <script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>
    <script type="text/javascript" src="<%=path%>/datePicket/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>

    <script type="text/javascript">

        $(function () {
            var mark = '${mark}';
            if (mark == 'taskBook') {
                layer.open({
                    type: 2,
                    area: ['100%', '100%'],
                    fix: false, //不固定
                    title: '我的任务书',
                    maxmin: true,
                    content: '<%=path%>/biz/taskBook_openEdit.action?view=edit&thisStuId=${studentModel.stuId }&thisId=${taskId }&thisYear=${model.year }&tabFlag=01&flag=03'
                });
            }

            if (mark == 'openingReport') {
                layer.open({
                    type: 2,
                    area: ['100%', '100%'],
                    fix: false, //不固定
                    title: '填写开题报告',
                    maxmin: true,
                    content: '<%=path%>/biz/openReport_openEdit.action?view=edit&thisStuId=${studentModel.stuId }&thisId=${reportId }&thisYear=${model.year }&tabFlag=02&flag=04'
                });
            }

            if (mark == 'progressStatus') {
                layer.open({
                    type: 2,
                    area: ['100%', '100%'],
                    fix: false, //不固定
                    title: '填写进展情况',
                    maxmin: true,
                    content: ' <%=path%>/biz/progressSitu_list.action?view=list&thisStuId=${studentModel.stuId }&thisId=${progressId }&thisYear=${model.year }&tabFlag=03&flag=05'
                });
            }
            <%-- 	if(mark=='paper'){
                    layer.open({
                    type: 2,
                    area: ['90%', '90%'],
                    fix: false, //不固定
                    title:'填写毕业论文',
                    maxmin: true,
                    content: ' <%=path%>/biz/paper_openEdit.action?view=edit&thisStuId=${studentModel.stuId }&thisId=${reportId }&thisYear=${model.year }&tabFlag=04&flag=06'
                });
                } --%>
            if (mark == 'defenseRecord') {
                layer.open({
                    type: 2,
                    area: ['100%', '100%'],
                    fix: false, //不固定
                    title: '答辩记录列表',
                    maxmin: true,
                    content: ' <%=path%>/biz/defenseRecord_openEdit.action?view=edit&thisStuId=${studentModel.stuId }&thisId=${defenseId }&thisYear=${model.year }&tabFlag=04&flag=11'
                });
            }
            if (mark == 'defenseRecord') {
                layer.open({
                    type: 2,
                    area: ['100%', '100%'],
                    fix: false, //不固定
                    title: '答辩记录列表',
                    maxmin: true,
                    content: ' <%=path%>/biz/defenseRecord_list.action?view=list&thisYear=${thisYear }&tabFlag=03&flag=11'
                });
            }

        });

        //搜索
        function openSearch(name) {
            // console.log(name)
            $("#form1").submit();
        }
    </script>


</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>
        <li>毕业设计相关流程信息</li>
    </ul>
</div>
<div class="rightinfo">
    <div class="formbody">
        <div id="usual1" class="usual">
            <%@ include file="/WEB-INF/page/business/materialInfo/select_info_tab.jsp" %>
            <div id="tab2" class="tabson">
                <form id="form1" name="form1"
                      action="<%=path%>/biz/materialInfo_info.action?view=info&page=${pageResult.page}" method="post">
                    <div class="place">
                        <ul class="placeul">
                            <li><span>院系：</span>${deptName }</li>
                            <li>当前年度：
                                <input class="dfinput" type="text"
                                       id="issueInfo.year" name="thisYear" readonly value="${model.year}"
                                       style="text-align: center;"
                                       onClick="WdatePicker({dateFmt:'yyyy'});"></td>
                            </li>
                            <li class="click">
                                <a href="javascript:void(0);" onclick="openSearch(this);"><img
                                        src="<%=path%>/images/search.png"/>搜索</a>
                            </li>
                        </ul>
                    </div>
                </form>
                <table class="tablelist" align="right">
                    <thead>
                    <tr>
                        <th rowspan="2">序号</th>
                        <th rowspan="2">姓名</th>
                        <th colspan="2">课题信息</th>
                        <th rowspan="2">任务书</th>
                        <th rowspan="2">开题报告</th>
                        <th rowspan="2">进度情况</th>
                        <th rowspan="2">答辩记录</th>
                        <th rowspan="2">年度</th>
                        <th rowspan="2">操作</th>
                    </tr>
                    <tr>
                        <th>课题</th>
                        <th>课题类型</th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:if test="pageResult.data!=null&&pageResult.total>0">
                        <s:iterator id="p" value="pageResult.data" status="pp">
                            <tr id="tr_${taskId }">
                                <td align="center"><s:property value="#pp.count"/></td>
                                <td align="center">${student.stuName}</td>
                                <td align="center">
                                    <s:if test="issueInfo.issueId==null">
                                        <a href="javascript:dialog('100%','100%','【<font color=blue >${student.stuName }</font>】 课题信息',
						        '<%=path%>/biz/issueInfo_openEdit.action?view=add&thisStuId=${student.stuId }&thisYear=${model.year }&tabFlag=00', 'true','20%');"
                                           target="rightFrame">
                                            <font color="red">未录入</font></a>
                                    </s:if>
                                    <s:else>
                                        <a href="javascript:dialog('100%','100%','【<font color=blue >${student.stuName }</font>】 课题信息',
						        '<%=path%>/biz/issueInfo_openEdit.action?view=edit&thisStuId=${student.stuId }&thisId=${issueInfo.issueId }&thisYear=${model.year }&tabFlag=00', 'true','20%');"
                                           target="rightFrame">
                                            <s:if test="issueInfo.issueId!=null&(issueInfo.issueName==null|issueInfo.issueName=='')">
                                                <font color="red">未录入</font></s:if>
                                            <s:else>
                                                <font color="blue">${issueInfo.issueName}</font></s:else>
                                        </a>
                                    </s:else>
                                </td>
                                <td align="center">
                                    <s:iterator id="p" value="issueTypeList" status="sp">
                                        <s:if test="issueInfo!=null&&issueInfo.issueType!=null">
                                            <s:if test="issueInfo.issueType.contains(\"&\"+issueTypeId+\"&\")">${issueTypeName }&nbsp;</s:if>
                                        </s:if>
                                    </s:iterator>
                                </td>
                                <td align="center">
                                    <s:if test="taskId==null">
                                        <a href="javascript:dialog('100%','100%','【<font color=blue >${student.stuName }</font> 】任务书信息','
				          <%=path%>/biz/taskBook_openAdd.action?view=add&thisStuId=${student.stuId }&thisYear=${model.year }&tabFlag=01&flag=03', 'true','20%');"
                                           target="rightFrame">
                                            <font color="red">未录入</font></a>
                                    </s:if><s:else>
                                    <a href="javascript:dialog('100%','100%','【<font color=blue >${student.stuName }</font>】 任务书信息','
				          <%=path%>/biz/taskBook_openEdit.action?view=edit&thisStuId=${student.stuId }&thisId=${taskId }&thisYear=${model.year }&tabFlag=01&flag=03', 'true','20%');"
                                       target="rightFrame">
                                        <font color="blue">查看</font></a></s:else>
                                </td>

                                <td align="center">
                                    <s:if test="reportId==null">
                                        <a href="javascript:dialog('100%','100%','【<font color=blue >${student.stuName }</font>】 开题报告信息','
				          <%=path%>/biz/openReport_openAdd.action?view=add&thisStuId=${student.stuId }&thisYear=${model.year }&tabFlag=02&flag=04', 'true','20%');"
                                           target="rightFrame">
                                            <font color="red">未录入</font></a>
                                    </s:if><s:else>
                                    <a href="javascript:dialog('100%','100%','【<font color=blue >${student.stuName }</font>】 开题报告信息','
				          <%=path%>/biz/openReport_openEdit.action?view=edit&thisStuId=${student.stuId }&thisId=${reportId }&thisYear=${model.year }&tabFlag=02&flag=04', 'true','20%');"
                                       target="rightFrame">
                                        <font color="blue">查看</font></a></s:else>
                                </td>
                                <td align="center">
                                    <s:if test="reportId==null">-</s:if><s:else>
                                    <a href="javascript:dialog('100%','100%','【<font color=blue >${student.stuName }</font>】 进度情况信息','
				          <%=path%>/biz/progressSitu_list.action?view=list&thisStuId=${student.stuId }&thisId=${progressId }&thisYear=${model.year }&tabFlag=03&flag=05', 'true','20%');"
                                       target="rightFrame">
                                        <s:if test="progressId==null"><font color="red">未录入</font>
                                        </s:if><s:else><font color="blue">查看</font></s:else></a>
                                </s:else>
                                </td>
                                <td align="center">
                                    <s:if test="defenseId==null">
                                        <a href="javascript:dialog('100%','100%','【<font color=blue >${student.stuName }</font>】 答辩记录信息','
				           <%=path%>/biz/defenseRecord_list.action?view=list&thisYear=${thisYear }&tabFlag=0&flag=11
				           ', 'true','20%');" target="rightFrame">
                                            <font color="red">未录入</font></a>
                                    </s:if>
                                    <s:else>
                                        <a href="javascript:dialog('100%','100%','【<font color=blue >${student.stuName }</font>】 答辩记录信息','
				           <%=path%>/biz/defenseRecord_list.action?view=list&thisYear=${thisYear }&tabFlag=0&flag=11
				           ', 'true','20%');" target="rightFrame">
                                            <font color="blue">查看</font></a>
                                        <%--                                <a href="javascript:dialog('100%','100%','【<font color=blue >${student.stuName }</font>】 答辩记录信息','--%>
                                        <%--				           <%=path%>/biz/defenseRecord_openEdit.action?view=edit&thisStuId=${student.stuId }&thisId=${defenseId }&thisYear=${model.year }&tabFlag=04&flag=11', 'true','20%');"--%>
                                        <%--                                   target="rightFrame">--%>
                                        <%--                                    <font color="blue">查看</font></a>--%>
                                    </s:else>
                                </td>

                                <td align="center">
                                        ${model.year}
                                </td>
                                <td align="center">
                                    <a href="javascript:dialog('100%','100%','<font color=blue >${stuName }</font> 课题信息','
					      <%=path%>/biz/issueInfo_openEdit.action?view=edit&thisStuId=${student.stuId }&thisId=${issueInfo.issueId }&thisYear=${model.year }', 'true','20%');"
                                       target="rightFrame">
                                        <font color="blue"> <i class="layui-icon">&#xe642;</i>修改</font></a>
                                </td>
                            </tr>
                        </s:iterator>
                    </s:if>
                    <s:else>
                        <tr><td align="center" colspan="10"><font>暂无数据</font></td></tr>
                    </s:else>

                    </tbody>
                </table>
            </div>


            <script type="text/javascript">
                //删除
                function del(name, id) {
                    var re = $(name).parent().parent();
                    layer.confirm('您确定要删除该课题吗?', {icon: 3, title: '提示'}, function (index) {
                        layer.close(index);
                        var index = layer.load(1);
                        $.ajax({
                            type: "post",
                            cache: false,
                            url: '<%=path%>/biz/materialInfo_del.action',
                            dataType: "json",
                            data: {
                                "thisId": id
                            }, success: function (result) {
                                layer.close(index);
                                if (result) {
                                    re.remove();
                                    layer.alert('删除成功', {icon: 1}, function () {
                                        location.reload();
                                    });
                                } else {
                                    layer.msg('删除失败', {icon: 2});
                                }
                            },
                            error: function (result) {
                                layer.close(index);
                                layer.msg('删除失败', {icon: 2});
                            }
                        });
                    });
                }
            </script>
</body>
</html>


