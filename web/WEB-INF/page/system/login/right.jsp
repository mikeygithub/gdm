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
    <link id="layuicss-skinlayimcss" rel="stylesheet" href="<%=basePath %>/third/layui/css/modules/layim/layim.css?v=3.60Pro" media="all">
    <link id="layuicss-skinlayercss" rel="stylesheet" href="<%=basePath %>/third/layui/css/modules/layer/default/layer.css?v=3.0.3303" media="all">

    <script type="text/javascript" src="<%=path%>/third/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=path%>/third/jquery.validate.js"></script>
    <script type="text/javascript" src="<%=path%>/third/layer/layer.js"></script>
    <script type="text/javascript" src="<%=path%>/third/layui/layui.js"></script>
    <script type="text/javascript" src="<%=path%>/third/layui/lay/modules/layim.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core/dialog/dialog.js"></script>
    <script type="text/javascript" src="<%=path%>/js/core/dialog/enable.js"></script>
    <script type="text/javascript" src="<%=path%>/datePicket/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=path%>/js/business/replyScore/replyScore.js"></script>
<%--    聊天--%>
    <link rel="stylesheet" href="<%=path%>/third/layui/layim/layui/css/layui.css">
    <script type="text/javascript" src="<%=path%>/third/layui/layim/layui/layui.js"></script>
    <script type="text/javascript">
        /*打开聊天框  */
        function openChat(thisId, type, chatType) {
            layer.open({
                type: 2,
                area: ['60%', '84%'],
                offset: '100px',
                // fix: false, //不固定
                title: false,
                maxmin: true,
                scrollbar: false,
                content: '<%=path%>/biz/chatInfo_openChat.action?view=client&thisId=' + thisId + '&thisType=' + type + '&chatType=' + chatType,
                success: function(layero){
                layero.find('.layui-layer-min').remove(); //去掉最小化按钮
                layero.find('.layui-layer-max').remove(); //去掉最大化按钮
            }
            });

        }

        /*打开公告通知页面  */
        function openNotice(noticeId) {
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
        /*body .layui-layim, body .layui-layim-chat {*/
        /*    border: 1px solid #D9D9D9;*/
        /*    border-color: rgba(0,0,0,.05);*/
        /*    background-repeat: no-repeat;*/
        /*    background-color: #F6F6F6;*/
        /*    color: #333;*/
        /*    font-family: \5FAE\8F6F\96C5\9ED1;*/
        /*    top: 40%!important;*/
        /*}*/
    </style>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">首页</a></li>
        </li>
        <li><a href="<%=path%>/sys/login_view.action?view=right" target="rightFrame">工作台</a></li>
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
                    var timeline_p = $('<p>&nbsp开始时间：&nbsp;' + getformatdate(con.startTime) + '<p>&nbsp;结束时间 ：&nbsp;' + getformatdate(con.endTime) + '</p>');

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
                // console.log(res)
                var noticelist = $('#sysNotice');
                var result = eval('(' + res + ')');
                $.each(result, function (index, con) {
                    // var noticelist_li = $('<li onclick="openNotice(' + con.noticeId + ')" class="noli"></li>');
                    var noticelist_li = $('<li class="noli"></li>');

                    var noticeName = con.noticeName
                    if (noticeName.length>25){//通知名称超出用...代替
                        noticeName = noticeName.substring(0,25)+"..."
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
                        chatinfolist_span2.appendTo(chatinfolist);
                    } else {
                        // var chatinfolist_span2 = $('<font color="#5FB878" class=\"layui-btn  layui-btn-mini layui-btn-radius layui-btn-primary\"><b>' + result.obj[0] + '</b></font>');
                        // var chatinfolist_span2 = $('<font color="#5FB878" class=\"layui-btn  layui-btn-mini layui-btn-radius layui-btn-primary\"><b>' + result.obj[0] + '</b></font>');
                    }
                    chatinfolist_img.appendTo(chatinfolist);
                    chatinfolist_span1.appendTo(chatinfolist);

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
                                // console.log(con.student.majorName);
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
                    // var chatinfolist_span = $('<span>' + name + '</span><font color="#5FB878" class=\"layui-btn  layui-btn-mini layui-btn-radius layui-btn-primary\"><b>' + classId + '</b></font>');
                    var chatinfolist_span = $('<span>' + name + '</span>');
                }
            } else {
                if (classId > 0) {
                    var chatinfolist_span = $('<span>' + name + '</span><span class="layui-badge">' + technicalId + '</span>');//有消息
                } else {
                    // var chatinfolist_span = $('<span>' + name + '</span><font color="#5FB878" class=\"layui-btn  layui-btn-mini layui-btn-radius layui-btn-primary\"><b>' + technicalId + '</b></font>');//无消息
                    var chatinfolist_span = $('<span>' + name + '</span>');//无消息
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

    function loginOutTip() {
        layer.open({
            title:'系统提示'
            ,content: '您确认退出吗？'
            ,offset: ['40%', '40%']
            ,btn: ['确定退出', '取消']
            ,shadeClose: true
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                layer.msg('退出成功',{icon:1})
                top.location = "<%=path%>/Userlogin_logout.action";
            }
            ,btn2: function(index, layero){
                //按钮【按钮二】的回调

                //return false 开启该代码可禁止点击该按钮关闭
            }
            ,cancel: function(){
                //右上角关闭回调

                //return false 开启该代码可禁止点击该按钮关闭
            }
        });
    }
    //TODO:聊天


    if(!/^http(s*):\/\//.test(location.href)){
        alert('请部署到localhost上查看该演示');
    }

    layui.use('layim', function(layim){

        //演示自动回复
        var autoReplay = [
            '您好，我现在有事不在，一会再和您联系。',
            '你没发错吧？face[微笑] ',
            '洗澡中，请勿打扰，偷窥请购票，个体四十，团体八折，订票电话：一般人我不告诉他！face[哈哈] ',
            '你好，我是主人的美女秘书，有什么事就跟我说吧，等他回来我会转告他的。face[心] face[心] face[心] ',
            'face[威武] face[威武] face[威武] face[威武] ',
            '<（@￣︶￣@）>',
            '你要和我说话？你真的要和我说话？你确定自己想说吗？你一定非说不可吗？那你说吧，这是自动回复。',
            'face[黑线]  你慢慢说，别急……',
            '(*^__^*) face[嘻嘻] ，是贤心吗？'
        ];

        //基础配置
        layim.config({

            //初始化接口
            init: {
                url: '<%=path%>/third/layui/json/getList.json'
                ,data: {}
            }

            //或采用以下方式初始化接口
            /*
            ,init: {
              mine: {
                "username": "LayIM体验者" //我的昵称
                ,"id": "100000123" //我的ID
                ,"status": "online" //在线状态 online：在线、hide：隐身
                ,"remark": "在深邃的编码世界，做一枚轻盈的纸飞机" //我的签名
                ,"avatar": "a.jpg" //我的头像
              }
              ,friend: []
              ,group: []
            }
            */


            //查看群员接口
            ,members: {
                url: '/gdm_war_exploded/third/layui/json/getMembers.json'
                ,data: {}
            }

            //上传图片接口
            ,uploadImage: {
                url: '/upload/image' //（返回的数据格式见下文）
                ,type: '' //默认post
            }

            //上传文件接口
            ,uploadFile: {
                url: '/upload/file' //（返回的数据格式见下文）
                ,type: '' //默认post
            }

            //扩展工具栏
            ,tool: [{
                alias: 'code'
                ,title: '代码'
                ,icon: '&#xe64e;'
            }]

            //,brief: true //是否简约模式（若开启则不显示主面板）

            //,title: 'WebIM' //自定义主面板最小化时的标题
            //,right: '100px' //主面板相对浏览器右侧距离
            //,minRight: '90px' //聊天面板最小化时相对浏览器右侧距离
            ,initSkin: '5.jpg' //1-5 设置初始背景
            //,skin: ['aaa.jpg'] //新增皮肤
            //,isfriend: false //是否开启好友
            //,isgroup: false //是否开启群组
            //,min: true //是否始终最小化主面板，默认false
            ,notice: true //是否开启桌面消息提醒，默认false
            //,voice: false //声音提醒，默认开启，声音文件为：default.wav

            ,msgbox: layui.cache.dir + 'css/modules/layim/html/msgbox.html' //消息盒子页面地址，若不开启，剔除该项即可
            ,find: layui.cache.dir + 'css/modules/layim/html/find.html' //发现页面地址，若不开启，剔除该项即可
            ,chatLog: layui.cache.dir + 'css/modules/layim/html/chatLog.html' //聊天记录页面地址，若不开启，剔除该项即可

        });

        /*
        layim.chat({
          name: '在线客服-小苍'
          ,type: 'kefu'
          ,avatar: 'http://tva3.sinaimg.cn/crop.0.0.180.180.180/7f5f6861jw1e8qgp5bmzyj2050050aa8.jpg'
          ,id: -1
        });
        layim.chat({
          name: '在线客服-心心'
          ,type: 'kefu'
          ,avatar: 'http://tva1.sinaimg.cn/crop.219.144.555.555.180/0068iARejw8esk724mra6j30rs0rstap.jpg'
          ,id: -2
        });
        layim.setChatMin();*/

        //监听在线状态的切换事件
        layim.on('online', function(data){
            //console.log(data);
        });

        //监听签名修改
        layim.on('sign', function(value){
            //console.log(value);
        });

        //监听自定义工具栏点击，以添加代码为例
        layim.on('tool(code)', function(insert){
            layer.prompt({
                title: '插入代码'
                ,formType: 2
                ,shade: 0
            }, function(text, index){
                layer.close(index);
                insert('[pre class=layui-code]' + text + '[/pre]'); //将内容插入到编辑器
            });
        });

        //监听layim建立就绪
        layim.on('ready', function(res){

            //console.log(res.mine);

            layim.msgbox(5); //模拟消息盒子有新消息，实际使用时，一般是动态获得

            //添加好友（如果检测到该socket）
            layim.addList({
                type: 'group'
                ,avatar: "http://tva3.sinaimg.cn/crop.64.106.361.361.50/7181dbb3jw8evfbtem8edj20ci0dpq3a.jpg"
                ,groupname: 'Angular开发'
                ,id: "12333333"
                ,members: 0
            });
            layim.addList({
                type: 'friend'
                ,avatar: "http://tp2.sinaimg.cn/2386568184/180/40050524279/0"
                ,username: '冲田杏梨'
                ,groupid: 2
                ,id: "1233333312121212"
                ,remark: "本人冲田杏梨将结束AV女优的工作"
            });

            setTimeout(function(){
                //接受消息（如果检测到该socket）
                layim.getMessage({
                    username: "Hi"
                    ,avatar: "http://qzapp.qlogo.cn/qzapp/100280987/56ADC83E78CEC046F8DF2C5D0DD63CDE/100"
                    ,id: "10000111"
                    ,type: "friend"
                    ,content: "临时："+ new Date().getTime()
                });

                /*layim.getMessage({
                  username: "贤心"
                  ,avatar: "http://tp1.sinaimg.cn/1571889140/180/40030060651/1"
                  ,id: "100001"
                  ,type: "friend"
                  ,content: "嗨，你好！欢迎体验LayIM。演示标记："+ new Date().getTime()
                });*/

            }, 3000);
        });

        //监听发送消息
        layim.on('sendMessage', function(data){
            var To = data.to;
            //console.log(data);

            if(To.type === 'friend'){
                layim.setChatStatus('<span style="color:#FF5722;">对方正在输入。。。</span>');
            }

            //演示自动回复
            setTimeout(function(){
                var obj = {};
                if(To.type === 'group'){
                    obj = {
                        username: '模拟群员'+(Math.random()*100|0)
                        ,avatar: layui.cache.dir + 'images/face/'+ (Math.random()*72|0) + '.gif'
                        ,id: To.id
                        ,type: To.type
                        ,content: autoReplay[Math.random()*9|0]
                    }
                } else {
                    obj = {
                        username: To.name
                        ,avatar: To.avatar
                        ,id: To.id
                        ,type: To.type
                        ,content: autoReplay[Math.random()*9|0]
                    }
                    layim.setChatStatus('<span style="color:#FF5722;">在线</span>');
                }
                layim.getMessage(obj);
            }, 1000);
        });

        //监听查看群员
        layim.on('members', function(data){
            //console.log(data);
        });

        //监听聊天窗口的切换
        layim.on('chatChange', function(res){
            var type = res.data.type;
            console.log(res.data.id)
            if(type === 'friend'){
                //模拟标注好友状态
                //layim.setChatStatus('<span style="color:#FF5722;">在线</span>');
            } else if(type === 'group'){
                //模拟系统消息
                layim.getMessage({
                    system: true
                    ,id: res.data.id
                    ,type: "group"
                    ,content: '模拟群员'+(Math.random()*100|0) + '加入群聊'
                });
            }
        });



    });

</script>