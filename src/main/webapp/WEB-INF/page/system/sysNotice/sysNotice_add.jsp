<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>添加添加公告</title>
    <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    <link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/css/newStyle.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css"/>

    <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>

    <script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
    <script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>
    <script type="text/javascript" src="<%=path%>/datePicket/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>




</head>
<body style="min-width: 200px">

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">新增公告</a></li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>公告信息</span></div>

    <form id="form1" action="<%= basePath%>/sys/notice_add.action?view=add" method="post" enctype="multipart/form-data">
        <ul class="forminfo">
            <li></li>
            <br/>
            <li></li>
            <li>
            </li>
            <%--
            <li>
                <label>文件类型：</label><img id="imgShow" width="150" height="150" src="noticeImages/"/>
                            <input type="file" name="imagey" id="portrait"/>
                                            <span id="msgPortrait" class="msgRed"></span></li>
            </li>
            --%>
            <li><label>&nbsp;</label></li>
        </ul>
        <table>
            <tr>
                <td align="right"><label>发布人：
                </label></td>
                <td><%=session.getAttribute(SystemContext.USERNAME) %></td>
            </tr>
            <tr>
                <td align="right"><label>公告标题：</label></td>
<%--                <td><input name="model.noticeName" maxlength="255" type="text" class="dfinput" /></td>--%>
                <td><textarea name="model.noticeName" maxlength="255" class="textinput" ></textarea></td>
            </tr>
            <tr>
                <td align="right"><label>公告内容：</label></td>
                <td><textarea name="model.noticeContent" cols="" rows="" class="textinput"></textarea></td>
            </tr>
            <tr style="margin-top: 10px">
                <td></td>
                <td><input name="" type="submit" class="btn" value="发布公告"/></td>
            </tr>
        </table>

    </form>
</div>
<script type="text/javascript">

    $(function () {
        $("#form1").validate({
            errorClass: "errorInfo", //默认为错误的样式类为：error
            errorElement: "em",
            focusInvalid: false, //当为false时，验证无效时，没有焦点响应
            onkeyup: false,
            submitHandler: function (form) {   //表单提交句柄,为一回调函数，带一个参数：form
                layer.confirm('您确定要发布 '+$("input[name='model.noticeName']").val()+' 吗?', {icon: 1, title:'提示'}, function(){
                    var index = layer.load(1);
                    layer.close(index)
                    form.submit();
                });
            },
            rules: {
                "model.noticeName": {
                    required: true
                },
                "model.noticeContent": {
                    required: true
                }
            },
            messages: {
                "model.noticeName": {
                    required: "请输入公告名称"
                },
                "model.noticeContent": {
                    required: "请输入公告内容"
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
                layer.msg('保存成功', {icon: 1});
                setTimeout(function () {
                    parent.location.reload();
                    // layer.close(index);
                }, 1000);
            } else if (flag == "0") {
                layer.msg('保存失败', {icon: 2});
            }
        }
    });

    layui.use('form', function () {
        var form = layui.form;
    });
</script>
<script type="text/javascript">
    $("#usual1 ul").idTabs;
</script>
</body>
</html>
