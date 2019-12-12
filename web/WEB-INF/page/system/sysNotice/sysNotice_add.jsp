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
            <li><label>公告人：<%=session.getAttribute(SystemContext.USERNAME) %>
            </label></li>
            <br/>
            <li><label>公告标题：</label><input name="model.noticeName" type="text" class="dfinput"/><i>标题不能超过30个字符</i></li>
            <li><label>公告内容：</label><textarea name="model.noticeContent" cols="" rows="" class="textinput"></textarea>
            </li>
            <%--
            <li>
                <label>文件类型：</label><img id="imgShow" width="150" height="150" src="noticeImages/"/>
                            <input type="file" name="imagey" id="portrait"/>
                                            <span id="msgPortrait" class="msgRed"></span></li>
            </li>
            --%>
            <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="发布公告"/></li>
        </ul>

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
                layer.confirm('您确定要保存 '+$("input[name='model.noticeName']").val()+' 吗?', {icon: 1, title:'提示'}, function(){
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
