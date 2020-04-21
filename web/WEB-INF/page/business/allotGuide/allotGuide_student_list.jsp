<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>指导分配管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css"/>

    <script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
    <script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
    <script type="text/javascript" src="<%=path%>/third/layer/extend/layer.ext.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>


    <script type="text/javascript">
        //搜索
        function openSearch(name) {
            $("#form1").submit();
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
        <li>选择所带学生</li>
    </ul>
</div>

<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">已选学生/最多可选
            (${guideCount.alreadyStuNum }/<font style="font-weight: bold;font-size: 14px; " color="blue">${guideCount.maxStuNum }</font>)</font>
        </li>
        <li>
            <a href="<%=path%>/biz/allotGuide_allotStudentList.action?view=student_list_late&flag=01&tabFlag=01">可选学生
            </a>
        </li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">

            <div class="rightinfo" id="stu">
                <form id="form1" name="form1" action="<%=path%>/biz/allotGuide_allotStudentList.action?view=student_list&page=${pageResult1.page}&tabFlag=00&flag=01" method="post">
                    <div class="place">
                        <ul class="placeul">
                            <li><span>院系：</span>${teacher.deptName }</li>
                            <li class="click" style="font-size: 12px">
                                <span>专业：</span><s:select cssClass="dfinput" list="teacherMajorList"
                                                          headerKey="" headerValue="所带专业"
                                                          cssStyle="width: auto;" onchange="$('#form1').submit();"
                                                          listKey="majorId" listValue="majorName" name="majorId"
                                                          id="majorId"/>

                                <input type="text" class="dfinput" id="selectValue" name="stuName"
                                       placeholder="学生姓名">
                            </li>
                            <li class="click">
                                <a href="javascript:void(0);" onclick="openSearch(this);"><img
                                        src="<%=path%>/images/search.png"/>搜索</a>
                            </li>
                            <li class="click"><a href="javascript:void(0)" target="rightFrame"
                                                 onclick="optionAllDel();">
                                <font color="red">&nbsp;&nbsp; <i class="layui-icon">&#xe640;</i>&nbsp;&nbsp;批量退选</font>
                            </a></li>
                        </ul>
                    </div>
                </form>
            </div>
            <table class="tablelist">
                <thead>
                <tr>
                    <th width="130px;">
                        <input onclick="selectAllDel()" type="checkbox" name="controlAllDel" id="controlAllDel"/>&nbsp;全选
                    </th>
                    <th>序号</th>
                    <th>所在学院</th>
                    <th>专业</th>
                    <th>班级</th>
                    <th>学生学号</th>
                    <th>学生姓名</th>
                    <th>性别</th>
                    <th>年度</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <s:if test="pageResult1.data!=null">
                    <s:iterator id="p" value="pageResult1.data" status="pp">
                        <tr id="tr_${stuId}">
                            <td align="center">
                                <input value="${allotGuideId}" title="${stuName}" type="checkbox" name="delSelected"/>
                            </td>
                            <td align="center"><s:property value="#pp.count"/></td>
                            <td align="center">${deptName} </td>
                            <td align="center">${majorName} </td>
                            <td align="center">${className} </td>
                            <td align="center">${stuNo}</td>
                            <td align="center">${stuName}</td>
                            <td align="center">
                                <s:if test="userSex==1">男</s:if>
                                <s:if test="userSex==0">女</s:if></td>
                            <td align="center">${planYear.year}</td>
                            <td align="center" width="20%">
                                <a href="javascript:void(0);" onclick="del('${allotGuideId},','${stuName }');">
                                    <font color="red"> <i class="layui-icon">&#x1006;</i>退选</font></a>
                            </td>
                        </tr>
                    </s:iterator>
                </s:if>
                <s:else>
                    <tr><td align="center" colspan="10"><font>暂无数据</font></td></tr>
                </s:else>
                </tbody>
            </table>
            <%@ include file="/WEB-INF/common/pagination1.jsp" %>
        </div>
    </div>
</div>
<script>
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<script type="text/javascript">
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

    // 执行选取
    function optionHandler(stuId, stuName) {
        $.ajax({
            type: "post",
            cache: false,
            url: '<%=path%>/biz/allotGuide_checkTime.action',
            dataType: "json",
            data: {
                "thisIds": stuId
            }, success: function (result) {
                if (result.obj == 1) {
                    option(stuId, stuName);
                } else {
                    layer.msg('未在操作时间段内操作', {icon: 2});
                }
            },
            error: function (result) {
                layer.msg('操作失败', {icon: 2});
            }
        });
    }

    function selectAllDel() {
        var checklist = document.getElementsByName("delSelected");
        if (document.getElementById("controlAllDel").checked) {
            for (var i = 0; i < checklist.length; i++) {
                checklist[i].checked = 1;
            }
        } else {
            for (var j = 0; j < checklist.length; j++) {
                checklist[j].checked = 0;
            }
        }
    }

    //选择学生
    function optionAllDel() {
        var stuIds = "";
        var stuName = "<br><font color='blue'> ";
        $("input[name='delSelected']").each(function (index, content) {
            if (this.checked == true) {
                stuIds = stuIds + $(this).val() + ",";
                stuName = stuName + (index + 1) + "." + $(this).attr('title') + "<br>";
            }
        });
        stuName = stuName + "</font>";
        if (stuIds == "") {
            layer.alert('请勾选学生', {icon: 3});
        } else {
            del(stuIds, stuName);
        }

    }

    //删除已选学生
    function del(thisId, stuName) {
        var re = $(name).parent().parent();
        layer.confirm('您确定要退选以下学生吗?<br>' + stuName + '', {icon: 3, title: '提示'}, function (index) {
            layer.close(index);
            var index = layer.load(1);
            $.ajax({
                type: "post",
                cache: false,
                url: '<%=path%>/biz/allotGuide_del.action',
                dataType: "json",
                data: {
                    "thisIds": thisId
                }, success: function (result) {
                    layer.close(index);
                    if (result.length == 0) {
                        re.remove();
                        layer.alert('取消选择成功', {icon: 1}, function () {
                            location.reload();
                        });
                    } else {
                        layer.msg('操作失败', {icon: 2});
                    }
                },
                error: function (result) {
                    layer.close(index);
                    layer.msg('请求失败', {icon: 2});
                }
            });
        });
    }
</script>
</body>
</html>
