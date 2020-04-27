<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>指导人数安排</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css"
          type="text/css"/>

    <script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
    <script type="text/javascript"
            src="<%=path%>/third/layer/extend/layer.ext.js"></script>
    <script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>
    <script type="text/javascript" src="<%=path%>/datePicket/WdatePicker.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#form1").validate({
                errorClass: "errorInfo", //默认为错误的样式类为：error
                errorElement: "em",
                focusInvalid: false, //当为false时，验证无效时，没有焦点响应
                onkeyup: false,
                submitHandler: function (form) { //表单提交句柄,为一回调函数，带一个参数：form
                    form.submit(); //提交表单
                    var index = layer.load(2, {
                        time: 10 * 1000
                    }); //又换了种风格，并且设定最长等待10秒
                },
                rules: {
                    "model.year": {
                        required: true
                    },
                },
                messages: {
                    "model.year": {
                        required: "请选择年度"
                    },
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
        <li>指导安排</li>
    </ul>
</div>

<div class="rightinfo">
    <%@include file="/WEB-INF/page/business/plan/plan_tab.jsp" %>
    <form id="form1" name="form1"
          action="<%=path%>/biz/PlanGuide_list.action?view=guide_list"
          method="post">
        <table border="10" cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td align="center" width="100px">当前年度：</td>
                <td width="20px"><input class="dfinput" type="text"
                                        id="guideCount.year" name="guideCount.year" readonly value="${guideCount.year}"
                                        style="text-align: center;"
                                        onClick="WdatePicker({dateFmt:'yyyy'});"></td>
                <td align="center" width="140px"><input type="button" name=""
                                                        class="btn" value="查询" onclick="$('#form1').submit()"/></td>
                <td align="center" width="140px"><input type="button" name=""
                                                        class="btn" value="一键设置人数" onclick="setAllNum();"/></td>
                <td align="center"></td>
            </tr>
        </table>
        <div class="place">
            <ul class="placeul">
                <li class="click">
	        	<span>学院：<s:select cssClass="dfinput" list="departmentList"
                                   cssStyle="width: auto;" onchange="$('#form1').submit();"
                                   value="guideCount.deptNumber"
                                   listKey="deptNumber" listValue="deptName" id="deptNumber"
                                   name="guideCount.deptNumber"/></span>
                </li>
                <li class="click">
	        	<span>大类：<s:select cssClass="dfinput" list="categoryList"
                                   cssStyle="width: auto;" onchange="$('#form1').submit();"
                                   value="guideCount.categoryId"
                                   listKey="categoryId" listValue="categoryName" id="category"
                                   name="guideCount.categoryId"/></span>
                </li>
                <li class="click">
	        	<span>教研室：<s:select cssClass="dfinput" list="sysMajorList"
                                    cssStyle="width: auto;" onchange="$('#form1').submit();"
                                    value="guideCount.staffroomId"
                                    listKey="majorId" listValue="staffName" id="major"
                                    name="guideCount.staffroomId"/>	</span>
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
            <th><input type="checkbox" id="checkList"/>全选</th>
            <th>序号</th>
            <th>老师名称</th>
            <th>所在学院</th>
            <th>所在教研室</th>
            <th>教师职称</th>
            <th>性别</th>
            <th>所带专业</th>
            <th>年度</th>
            <th>已选人数</th>
            <th>可带人数</th>
            <th>修改人数</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator id="p" value="pageResult.data" status="pp">
            <tr id="tr_${id}">
                <td align="center"><input type="checkbox" name="check_sel"
                                          value="${teacherId }" alt="${guideCountId }" title="${teacherName}"/></td>
                <td align="center"><s:property value="#pp.count"/></td>
                <td align="center">${teacherName}</td>
                <td align="center"> ${deptName} </td>
                <td align="center"> ${staffName}</td>
                <td align="center">${technicalName}</td>
                <td align="center">
                    <s:if test="userSex==1">男</s:if>
                    <s:if test="userSex==0">女</s:if></td>

                <td align="center">
                    <s:iterator id="tml" value="teacherMajorList">
                        ${majorName} &nbsp;
                    </s:iterator></td>
                <td align="center" id="year_${teacherId }">
                    <s:if test="year==null">${guideCount.year}</s:if>
                    <s:else> ${year}</s:else></td>

                <td align="center" id="alreadyStuNum_${teacherId }">
                        <%--								${alreadyStuNum}--%>
                    <s:if test="alreadyStuNum==null||alreadyStuNum==''">
                        <font color="red">未选取</font>
                    </s:if>
                    <s:else>
                        <font color="blue">${alreadyStuNum}</font>
                    </s:else>
                </td>

                <td align="center">
                        <%--                        ${maxStuNum}--%>
                    <s:if test="maxStuNum==null||maxStuNum==''">
                        <font color="red">未分配</font>
                    </s:if>
                    <s:else>
                        <font color="blue">${maxStuNum}</font>
                    </s:else>
                </td>

                <td align="center" width="auto">
                    <div name="laypage1.3" class="laypage_main laypageskin_molv">
								<span class="laypage_total"> <input type="number" style="text-align: center;"
                                                                    min="1"
                                                                    onkeyup="this.value=this.value.replace(/\D/, '');"
                                                                    class="laypage_skip" value="${maxStuNum}"
                                                                    name="maxStuNum" id="maxStuNum_${teacherId }">
									<button type="button" class="laypage_btn"
                                            onclick="option(this,${teacherId },'${teacherName}')">
									<font color="blue">确定</font></button>
								</span>
                    </div>


                </td>

            </tr>
        </s:iterator>
        </tbody>
        <p align="center">
    </table>
    <%@ include file="/WEB-INF/common/pagination.jsp" %>
    <script type="text/javascript">
        //选择教师
        function option(name, teacherId, teacherName) {
            var year = $("#year_" + teacherId).html();
            var already = $("#alreadyStuNum_" + teacherId).html();
            var thisCount = $("#maxStuNum_" + teacherId).val();
            if (parseInt(already) > parseInt(thisCount)) {
                layer.confirm('已选人数' + already + '大于可带人数' + thisCount + '，不可修改！', {icon: 1});
            } else {
                layer.confirm('当前 <font color=blue >' + teacherName + '</font> 老师 <p >可带人数为 ' + thisCount + '<p>您确定要修改吗?', {
                    icon: 3,
                    title: '提示'
                }, function (index) {
                    layer.close(index);
                    var index = layer.load(1);
                    $.ajax({
                        type: "post",
                        cache: false,
                        url: '<%=path%>/biz/PlanGuide_add.action',
                        dataType: "json",
                        data: {
                            "year": parseInt(year),
                            "thisId": teacherId + ",",
                            "maxStuNum": thisCount
                        }, success: function (result) {
                            layer.close(index);
                            if (result) {
                                layer.alert('修改成功', {icon: 1}, function () {
                                    location.reload();
                                });
                            } else {
                                layer.msg('修改失败', {icon: 2});
                            }
                        },
                        error: function (result) {
                            layer.close(index);
                            layer.msg('修改失败', {icon: 2});
                        }
                    });
                });
            }
        }

        function setAllNum() {
            var isChecked = false;
            var ids = '';
            var names = '';
            var year = $("input[name='guideCount.year']").val();
            $("input[name='check_sel']").each(function (index, content) {
                if (this.checked == true) {
                    isChecked = true;
                    ids = ids + $(this).val() + ",";
                    names = names + $(this).attr("title") + ' ';
                }
            });
            if (!isChecked) {
                layer.alert('请勾选需要设置人数的老师！', {icon: 1});
            } else {
                var index = layer.confirm('' + names + '	<div   class=laypage_main  ><span > 默认可带人数<input type=number name=allNum id=allNum  min=1   >人</span></div>',
                    {icon: 6}, function () {
                        var allNum = $("#allNum").val();
                        if (allNum == '' || allNum == undefined) alert('请输入有效的数字！', {icon: 1});
                        else {
                            layer.close(index);
                            var index = layer.load(1);
                            $.ajax({
                                type: "post",
                                cache: false,
                                url: '<%=path%>/biz/PlanGuide_add.action',
                                dataType: "json",
                                data: {
                                    "year": parseInt(year),
                                    "thisId": ids,
                                    "maxStuNum": allNum
                                }, success: function (result) {
                                    layer.close(index);
                                    if (result) {
                                        layer.alert('修改成功', {icon: 1}, function () {
                                            location.reload();
                                        });
                                    } else {
                                        layer.msg('修改失败', {icon: 2});
                                    }
                                },
                                error: function (result) {
                                    layer.close(index);
                                    layer.msg('修改失败', {icon: 2});
                                }
                            });
                        }
                    });
            }
        }

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

    </script>
</div>
</body>
</html>
