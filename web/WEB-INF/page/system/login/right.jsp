<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>欢迎页</title>
    <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    <link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css" type="text/css"/>
    <link rel="stylesheet" href="<%=basePath %>/third/layui/css/layui.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath %>/third/layer/skin/layer.css" id="layui_layer_skinlayercss">
    <link id="layuicss-skinlayimcss" rel="stylesheet"
          href="<%=basePath %>/third/layui/css/modules/layim/layim.css?v=3.60Pro" media="all">
    <link id="layuicss-skinlayercss" rel="stylesheet"
          href="<%=basePath %>/third/layui/css/modules/layer/default/layer.css?v=3.0.3303" media="all">

    <script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
    <script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
    <script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
    <script type="text/javascript" src="<%=path%>/third/layui/lay/modules/layim.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>
    <script type="text/javascript" src="<%=path%>/datePicket/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=path%>/js/business/replyScore/replyScore.js"></script>

    <script type="text/javascript">

        /*打开聊天框  */
        function openChat(thisId, type, chatType) {
            layer.open({
                type: 2,
                area: ['45%', '84%'],
                offset: '100px',
                fix: false, //不固定
                title: false,
                maxmin: true,
                content: '<%=path%>/biz/chatInfo_openChat.action?view=client&thisId=' + thisId + '&thisType=' + type + '&chatType=' + chatType
            });

        }

        /*打开公告通知页面  */
        function openNotice(noticeId) {

            // console.log("公告ID："+noticeId)

            layer.open({
                type: 2,
                area: ['99%', '99%'],
                offset: '10px',
                fix: false, //不固定
                title: false,
                maxmin: true,
                content: '<%=path%>/sys/notice_openNotice.action?view=detail&model.noticeId=' + noticeId,
                //去除最大化最小化
                success: function(layero) {
                    layero.find('.layui-layer-min').remove();
                    layero.find('.layui-layer-max').remove();
                }
            });

        }

        /*打开公告通知列表*/
        function openNoticeList() {

            layer.open({
                type: 2,
                area: ['99%', '99%'],
                offset: '10px',
                fix: false, //不固定
                title: false,
                maxmin: true,
                content: '<%=path%>/sys/notice_list.action?view=list',
                //去除最大化最小化
                success: function(layero) {
                    layero.find('.layui-layer-min').remove();
                    layero.find('.layui-layer-max').remove();
                }
            });

        }
    </script>

    <style type="text/css">
        #chatbutton {
            margin-top: 163px;
            margin-left: 100px;
        }

        #notime {
            float: right;
        }

        a {
            font-size: 14px;
        }

        a:hover {
            cursor: pointer;
            color: red;
        }

    </style>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="<%=path%>/sys/login_view.action?view=right" target="_parent"></a></li>
<%--        <li><a href="#" target="_parent">首页</a>--%>
        </li>
        <li><a href="#">工作台</a>
        </li>
    </ul>
</div>
<c:choose>
    <c:when test="${userType==1}">
        <%@ include file="/WEB-INF/common/right_student.jsp" %>
    </c:when>
    <c:when test="${userType==2}">
        <%@ include file="/WEB-INF/common/right_teacher.jsp" %>
    </c:when>
    <c:when test="${userType==3}">
        <%@ include file="/WEB-INF/common/right_admin.jsp" %>
    </c:when>
</c:choose>
</body>

<!--显示或隐藏聊天框  -->
<script type="text/javascript">

    /*点击右下角按钮，聊天室显示 */
    $("#chatbottom").click(function () {
        $("#myChat").show();
    });
    /*点击打叉，聊天室隐藏 */
    $("#chatclose").click(function () {
        $("#myChat").hide();
        $("#chatframe").hide();
    });

    layui.use('element', function () {
        var element = layui.element;
        var active = {
            tabChange: function () {
                //切换到指定Tab项
                element.tabChange('demochat', 'layid'); //切换群聊私聊
            }
        };
    });
</script>

<script type="text/javascript">
    //传入从数据库中取出的日期类型数据
    function getformatdate(startTime) {
        var formate_datetime;
        if(startTime == undefined) {
            // return formate_datetime;
            return "";
        }
        var array = startTime.split(" ");
        var date = array[0];
        var time = array[1];
        var array_date = date.split("-");
        var array_time = time.split(":");
        var second = array_time[2].split(".")[0];
        formate_datetime = array_date[0] + " 年 "
            + removeZero(array_date[1]) + " 月  "
            + removeZero(array_date[2]) + " 日   "
            + removeZero(array_time[0]) + "点";
        return formate_datetime;
    }

    //去掉月、日、时、分前的0
    function removeZero(data) {
        if (data.charAt(0) == "0") {
            return data.charAt(1);
        } else {
            return data;
        }
    }


    function Todate(num) { //Fri Oct 31 18:00:00 UTC+0800 2008  Dec 29, 2017 10:29:23 PM
        num = num + "";
        var date = "";
        var month = new Array();
        month["Jan"] = 1;
        month["Feb"] = 2;
        month["Mar"] = 3;
        month["Apr"] = 4;
        month["May"] = 5;
        month["Jan"] = 6;
        month["Jul"] = 7;
        month["Aug"] = 8;
        month["Sep"] = 9;
        month["Oct"] = 10;
        month["Nov"] = 11;
        month["Dec"] = 12;
        var week = new Array();
        week["Mon"] = "一";
        week["Tue"] = "二";
        week["Wed"] = "三";
        week["Thu"] = "四";
        week["Fri"] = "五";
        week["Sat"] = "六";
        week["Sun"] = "日";

        str = num.split(" ");

        date = str[2] + "-";
        date = date + month[str[0]] + "-" + str[1].replace(/,/g, '') + " " + str[3];
        return date;
    }

    $(function () {

        loadPlanProgress();
        loadScore();
        loadNotice();
        loadChatInfo();
        loadGroupChat();

        /* 时间安排 */
        function loadPlanProgress() {
            $.post('<%=path%>/biz/PlanProgress_loadPlanProgressList.action', function (res) {
                var timeline = $('#planProgress');
                var result = eval('(' + res + ')');
                $.each(result, function (index, con) {

                    var timeline_li = $('<li class=\"layui-timeline-item\"> </li>');
                    var timeline_i = $('<i class=\"layui-icon layui-timeline-axis\">&#xe63f;</i>');
                    var timeline_div = $('<div class=\"layui-timeline-content layui-text\"></div>');
                    var timeline_h3 = $('<h3 class=\"layui-timeline-title\">' + con.progressName + '&nbsp;'
                        + (con.progressStart == 1 ? '<font color=\"#5FB878\" class=\"layui-btn  layui-btn-mini layui-btn-radius  layui-btn-danger\">已开始</font>'
                            : '<font color=\"#5FB878\" class=\"layui-btn  layui-btn-mini layui-btn-radius layui-btn-primary\">未开始</font>') + '</h3>');
                    var timeline_p = $('<p>&nbsp开始时间：&nbsp;' + getformatdate(con.startTime)
                        + '<p>&nbsp;结束时间 ：&nbsp;' + getformatdate(con.endTime) + '</p>');

                    timeline_h3.appendTo(timeline_div);
                    timeline_p.appendTo(timeline_div);
                    timeline_i.appendTo(timeline_li);
                    timeline_div.appendTo(timeline_li);
                    timeline_li.appendTo(timeline);

                });
            });
        }

        /*毕业设计成绩  */
        function loadScore() {

            $.post('<%=path%>/biz/replyScore_loadReplyScoreList.action', function (res) {
                if (res === null) return;
                var scoreMenu = getReplyScore();
                var scorelist = $('#gradscore');
                var result = eval('(' + res + ')');
                if (result.replyType == 1) {
                        scorelist.find("li").each(function (index, con) {
                            var timeline_title_div = $(this).children("div").children("div");
                            switch (index) {
                                case 0:
                                    timeline_title_div.html(result.openReport);
                                    break;
                                case 1:
                                    timeline_title_div.html(result.checkScore);
                                    break;
                                case 2:
                                    timeline_title_div.html(result.guideScore);
                                    break;
                                case 3:
                                    timeline_title_div.html(result.readScore);
                                    break;
                                case 4:
                                    timeline_title_div.html(result.replyScore);
                                    break;
                                case 5:
                                    timeline_title_div.html(result.replyScoreFinish);
                                    break;
                                case 6:
                                    timeline_title_div.html(result.grade);
                                    break;
                            }
                        });
                    }
            });
        }

        /*公告信息  */
        function loadNotice() {
            $.post('<%=path%>/sys/notice_loadNoticeList.action?newNum=16', function (res) {
                var noticelist = $('#sysNotice');
                var result = eval('(' + res + ')');
                $.each(result, function (index, con) {
                    // var noticelist_li = $('<li onclick="openNotice(' + con.noticeId + ')" class="noli"></li>');
                    var noticelist_li = $('<li class="noli"></li>');

                    var noticeName = con.noticeName
                    if (noticeName.length>12){//通知名称超出用...代替
                        noticeName = noticeName.substring(0,12)+"......"
                    }

                    var noticelist_a = $('<a id="noa" href="javascript:dialog(\'100%\',\'100%\',\'通知详情\',\'<%=path%>/sys/notice_openNotice.action?view=detail&model.noticeId='+con.noticeId+'\', \'true\',\'0\');">&nbsp;&nbsp;' + noticeName + '</a>');
                    var dataArray = Todate(con.noticeTime).split(' ');
                    var noticelist_time = $('<span id="notime" >' + dataArray[0] + '</span>');//date.getFullYear()

                    noticelist_a.appendTo(noticelist_li);
                    noticelist_time.appendTo(noticelist_li);
                    noticelist_li.appendTo(noticelist);
                });
            });
        }


        /*群聊条数  */
        function loadGroupChat() {
            $.post('<%=path%>/biz/chatInfo_loadGroupChat.action', function (res) {
                var result = eval('(' + res + ')');
                if (!result.success) {
                    return;
                } else {
                    var chatinfolist = $('#groupChatIl');//
                    var chatinfolist_img = $('<img src=\"<%=path%>/images/charqun.jpg\">');
                    var chatinfolist_span1 = $('<span>交流群</span>');
                    if (result.obj[0] > 0) {
                        var chatinfolist_span2 = $('<span class=\"layui-badge\">' + result.obj[0] + '</span>');
                    } else {
                        var chatinfolist_span2 = $('<font color="#5FB878" class=\"layui-btn  layui-btn-mini layui-btn-radius layui-btn-primary\"><b>' + result.obj[0] + '</b></font>');
                    }
                    chatinfolist_img.appendTo(chatinfolist);
                    chatinfolist_span1.appendTo(chatinfolist);
                    chatinfolist_span2.appendTo(chatinfolist);
                }

            });
        }

        /* 交流互动 */
        function loadChatInfo() {
            $.post('<%=path%>/biz/chatInfo_loadChatInfoList.action', function (res) {
                var result = eval('(' + res + ')');
                if (!result.success) {
                    return;
                } else {
                    var thisId = result.obj[2];
                    var userType = result.obj[3];
                    if (userType == 2) {
                        $.each(result.obj[0], function (index, con) {
                            setChatinfoItem(con.student.stuId, 1, con.student.stuName, con.student.userImg, con.student.majorName, con.classId, con.categoryId, 0);
                        });
                    } else {
                        var teacher = result.obj[1];
                        if (teacher==null)return;
                        setChatinfoItem(teacher.teacherId, 2, teacher.teacherName, teacher.userImg, teacher.staffName, 0, 0, teacher.technicalId);
                        $.each(result.obj[0], function (index, con) {
                            if (con.student.stuId != thisId) {
                                console.log(con.student.majorName);
                                setChatinfoItem(con.student.stuId, 1, con.student.stuName, con.student.userImg, con.student.majorName, con.classId, con.categoryId, 0);
                            }
                        });
                    }
                }
            });
        }

        function setChatinfoItem(thisId, type, name, icon, contents, classId, categoryId, technicalId) {
            var chatinfolist = $('#openpeoul');//src='+icon+'
            var chatinfolist_img = $('<img src="<%=path%>/images/qq.jpg" />');
            if (type == 1) {
                if (classId > 0) {
                    var chatinfolist_span = $('<span>' + name + '</span><span class="layui-badge">' + classId + '</span>');
                } else {
                    var chatinfolist_span = $('<span>' + name + '</span><font color="#5FB878" class=\"layui-btn  layui-btn-mini layui-btn-radius layui-btn-primary\"><b>' + classId + '</b></font>');
                }
            } else {
                if (classId > 0) {
                    var chatinfolist_span = $('<span>' + name + '</span><span class="layui-badge">' + technicalId + '</span>');
                } else {
                    var chatinfolist_span = $('<span>' + name + '</span><font color="#5FB878" class=\"layui-btn  layui-btn-mini layui-btn-radius layui-btn-primary\"><b>' + technicalId + '</b></font>');
                }
            }
            var chatinfolist_p = $('<p>' + contents + '</p>');
            var chatinfolist_span2 = $('<span class="layim-msg-status">new</span>');
            var chatType = '1';//私聊标志（0-群聊，1-私聊）
            var chatinfolist_li = $('<li onclick="openChat(' + thisId + ',' + type + ',' + chatType + ')" layim-event="chat" data-type="friend" data-index="0" class="layim-friend100001"></li>');
            var chatinfolist_ul = $('#openpeolist');
            chatinfolist_img.appendTo(chatinfolist_li);
            chatinfolist_span.appendTo(chatinfolist_li);
            chatinfolist_p.appendTo(chatinfolist_li);
            chatinfolist_span2.appendTo(chatinfolist_li);
            chatinfolist_li.appendTo(chatinfolist_ul);
        }
    });
</script>

<script type="text/javascript">
    setWidth();
    $(window).resize(function () {
        setWidth();
    });

    function setWidth() {
        var width = ($(window).width() - $('.mainright').width() - 16);
        $('.leftinfos').width(width);

        var width = ($('.leftinfos').width() - 12) / 2;
        $('.infoleft,.inforight').width(width);
    }
</script>