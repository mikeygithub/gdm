<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>成绩录入</title>
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
    <script type="text/javascript"
            src="<%=path%>/js/core/dialog/closeDialog.js"></script>
    <script type="text/javascript">
        $(function () {

            $("#form1").validate({
                errorClass: "errorInfo", //默认为错误的样式类为：error
                errorElement: "em",
                focusInvalid: false, //当为false时，验证无效时，没有焦点响应
                onkeyup: false,
                submitHandler: function (form) { //表单提交句柄,为一回调函数，带一个参数：form
                    if (confirm("是否要保存信息？")) {
                        form.submit(); //提交表单
                        var index = layer.load(2, {
                            time: 10 * 1000
                        }); //又换了种风格，并且设定最长等待10秒
                    }
                },
                rules: {
                    "report.replyLink": {
                        required: true
                    }
                },
                messages: {
                    "report.replyLink": {
                        required: "请填写内容"
                    }
                },
                errorPlacement: function (error, element) { //错误信息位置设置方法
                    error.appendTo(element.parent()); //这里的element是录入数据的对象
                }
            });
        });

        $(function () {
            var flag = "${mark}";
            if (flag != '' && flag != undefined) {
                if (flag == "1") {
                    $('#submit').attr('disabled', 'disabled');
                    layer.msg('添加成功');
                    setTimeout(function () {
                        //parent.location.reload();
                        layer.close(index);
                    }, 1000);
                } else if (flag == "0") {
                    layer.msg('添加失败');
                }
            }
        });

        function getData() {
            var score = '';
            $("input[name='score']").each(function (index, content) {
                score = score + this.id + '-' + this.value + '-' + this.alt + ',';
            });
            $("#scoreIds").val('');
            $("#scoreIds").val(score);
        }

        function selectAll() {
            var checklist = document.getElementsByName("selected");
            if (document.getElementById("controlAll").checked) {
                for (var i = 0; i < checklist.length; i++) {
                    checklist[i].checked = 1;
                }
            } else {
                for (var j = 0; j < checklist.length; j++) {
                    checklist[j].checked = 0;
                }
            }
        }
        function del(year,stuId,type) {
            layer.confirm('您确定删除评阅信息吗?', {icon: 3, title: '提示'}, function (index) {
                layer.close(index);
                var index = layer.load(1);
                $.ajax({
                    type: "post",
                    cache: false,
                    url: '<%=path%>/biz/replyScore_del.action',
                    dataType: "json",
                    data: {
                        "thisStuId": stuId,
                        "thisYear": year,
                        "thisReplyType": '00',
                    }, success: function (result) {
                        layer.close(index);
                        if (result) {
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
    <style>
    </style>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>
        <li>成绩及评阅</li>
    </ul>
</div>
<div class="rightinfo">
    <div class="formtitle">
        <span>评阅录入列表</span>
    </div>
    <ul class="layui-tab-title">
        <li>
            <a class="selected" href="<%=path%>/biz/replyScore_list.action?view=list&flag=12&thisReplyType=00">
                评阅录入- 答辩组</a>
        </li>
        <li class="layui-this">
            <a class="selected" href="<%=path%>/biz/replyScore_list.action?view=excellent_list&flag=12&thisReplyType=01">
                评阅录入- 大组</a>
        </li>
    </ul>


    <form id="form1" name="form1"
          action="<%=path%>/biz/replyScore_list.action?view=list&page=${pageResult1.page}&thisReplyType=00&flag=12"
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
            <th rowspan="2">最终成绩</th>
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

        <s:if test="pageResult1.data!=null&&pageResult1.total>0">
            <s:iterator id="p" value="pageResult1.data" status="pp">
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
                            <s:if test="issueInfo!=null&&issueInfo.issueType!=null&&issueInfo.issueType.contains(\"&\"+issueTypeId+\"&\")">${issueTypeName }&nbsp;</s:if>
                            <%--                        <s:if test="issueInfo.issueType.contains(\"&\"+issueTypeId+\"&\")">${issueTypeName }&nbsp;</s:if>--%>
                        </s:iterator>
                    </td>

                        <%--<td align="center">--%>
                        <%--<input type="radio"    name="replyLink${student.stuId }" value="01"--%>
                        <%--<s:if test="report.replyLink==''|report.replyLink==null|report.replyLink==01">checked="checked"</s:if>--%>
                        <%--alt="是"checked="checked">是&nbsp;--%>
                        <%--<input type="radio"--%>
                        <%--name="replyLink${student.stuId }" value="00" alt="否"--%>
                        <%--<s:if test="report.replyLink==00">checked="checked"</s:if>>--%>
                        <%--否&nbsp;--%>
                        <%--<input type="radio"--%>
                        <%--name="replyLink${student.stuId }" value="02"--%>
                        <%--<s:if test="report.replyLink==02">checked="checked"</s:if>--%>
                        <%--alt="缺席">缺席--%>
                        <%--</td>--%>
                    <td align="center" width="auto">${groupReply.replyScore!=null&&groupReply.replyScore!=""?groupReply.replyScore:'未录入'}</td>
                    <td align="center" width="auto">${groupReply.replyScoreFinish!=null&&groupReply.replyScoreFinish!=""?groupReply.replyScoreFinish:'未录入'} </td>


                    <td align="center"> ${model.year} </td>

                    <td align="center" width="20%">
                        <a href="javascript:dialog('70%','90%','添加评阅信息','<%=path%>/biz/replyScore_openAdd.action?view=add&thisYear=${model.year}&thisReplyType=01&thisStuId=${student.stuId}','true', '5%', '15%');">
                            <font color="blue"><img src="<%=path%>/images/t01.png" width="10px"/>&nbsp;编辑</font>
                        </a>
                        <a href="javascript:dialog('70%','90%','查看评阅信息','<%=path%>/biz/replyScore_info.action?view=detail&thisYear=${model.year}&thisReplyType=01&thisStuId=${student.stuId }','true', '5%', '15%');">
                            <font color="blue"><img src="<%=path%>/images/eye_visible.png" width="10px"/>&nbsp;查看</font>
                        </a>
                        <!--<a href="javascript:dialog('70%','90%','修改评阅信息','<%=path%>/biz/replyScore_openEdit.action?view=edit&thisYear=${model.year}&thisStuId=${student.stuId }', 'true','20%');">-->
                            <%--<font color="blue"> <i class="layui-icon">&#xe642;</i>修改</font>--%>
                            <%--</a>&nbsp;&nbsp;&nbsp;--%>
                        <a href="javascript:void(0);" onclick="del(${model.year},${student.stuId},'00');">
                            <font color="red"> <i class="layui-icon">&#x1006;</i>删除</font></a>&nbsp;&nbsp;&nbsp;
                            <%--  <a href="<%=path%>/biz/taskBook_outTaskBook.action?thisId=${taskId }">
                                      <font> <img src="<%=path%>/images/i01.png" width="20px" />导出
                              </font></a> --%>
                    </td>
                </tr>
            </s:iterator>
        </s:if>
        <s:else>
            <tr><td align="center" colspan="12"><font>暂无数据</font></td></tr>
        </s:else>

        </tbody>
    </table>
    <%@ include file="/WEB-INF/common/pagination1.jsp" %>
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
<script type="text/javascript">
    function selStart(name) {
        var isChecked = false;
        var stuId = $(name).attr('id');
        var replyScore = $("#thisScore" + stuId).val();
        var reply = '';
        var replyLink = $(name).parent().parent().find("input[name='replyLink" + stuId + "'  ]");
        replyLink.each(function (index, con) {
            if (this.checked == true) {
                reply = this.value;
            }
        });
        var year = '${planYear.year}';
        layer.confirm('您确定保存信息吗?', {icon: 3, title: '提示'}, function (index) {
            layer.close(index);
            var index = layer.load(1);
            $.ajax({
                type: "post",
                cache: false,
                url: '<%=path%>/biz/replyScore_add.action',
                dataType: "json",
                data: {
                    "flag": 13,
                    "thisYear": year,
                    "thisStuId": stuId,
                    "thisReplyLink": reply,
                    "thisReplyType": "00",//答辩小组
                    "thisScore": replyScore
                }, success: function (result) {
                    layer.close(index);
                    if (result) {
                        layer.alert('保存成功', {icon: 1}, function () {
                            location.reload();
                        });
                    } else {
                        layer.msg('保存失败', {icon: 2});
                    }
                },
                error: function (result) {
                    layer.close(index);
                    layer.msg('保存失败', {icon: 2});
                }
            });
        });
    }
</script>
</body>
</html>


