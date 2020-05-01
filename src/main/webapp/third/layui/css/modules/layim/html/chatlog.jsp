<%--
  Created by IntelliJ IDEA.
  User: mikey
  Date: 4/30/20
  Time: 4:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/common/common.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>聊天记录</title>

    <link rel="stylesheet" href="<%=path%>/third/layui/css/layui.css">
    <style>
        body .layim-chat-main {
            height: auto;
        }
    </style>
</head>
<body>


<div class="layim-chat-main">
    <ul id="LAY_view">

    </ul>
</div>
<div style="margin-left:auto;margin-right:auto;width:95%; padding:0px;text-align: center">
    <%--    <div style="width:50%;background-color: bisque">--%>
    <%--        <div style="width:50%;background-color: blueviolet">--%>
    <div id="LAY_page"></div>
    <%--        </div>--%>
</div>
<%--</div>--%>


<textarea title="消息模版" id="LAY_tpl" style="display:none;">
{{# layui.each(d.data, function(index, item){
  if(item.id == parent.layui.layim.cache().mine.id){ }}
    <li class="layim-chat-mine"><div class="layim-chat-user"><img src="{{ item.avatar }}"><cite><i>{{ layui.data.date(item.timestamp) }}</i>{{ item.username }}</cite></div><div
            class="layim-chat-text">{{ layui.layim.content(item.content) }}</div></li>
  {{# } else { console.log(item) }}
    <li><div class="layim-chat-user"><img src="{{ item.avatar }}"><cite>{{ item.username }}<i>{{ layui.data.date(item.timestamp) }}</i></cite></div><div>
            class="layim-chat-text">{{ layui.layim.content(item.content) }}</div></li>
  {{# }
}); }}
</textarea>


<script src="<%=path%>/third/layui/layui.js"></script>
<script>
    layui.use(['layim', 'laypage'], function () {
        var layim = layui.layim
            , layer = layui.layer
            , laytpl = layui.laytpl
            , $ = layui.jquery
            , laypage = layui.laypage
            , index;

        //实际使用时，下述的res一般是通过Ajax获得，而此处仅仅只是演示数据格式
        //请求数据
        $.ajax({
            url: "<%=path%>/biz/chatInfo_loadChatLog.action" + location.search,
            data: {curr: 1, limit: 25},
            type: "post",
            success: function (data) {
                var res = JSON.parse(data);
                if (res.code == 200) {
                    laypage.render({
                        elem: 'LAY_page' //注意，这里的 test1 是 ID，不用加 # 号
                        , count: res.data.total          //数据总数
                        , limit: 25                      //每页显示条数
                        , curr: 1                        //起始页
                        , groups: 3                      //连续页码个数
                        , prev: '上一页'                 //上一页文本
                        , next: '下一页'                 //下一页文本
                        , first: 1                      //首页文本
                        , last: parseInt(res.data.total / 25) + 1                     //尾页文本
                        , layout: ['prev', 'page', 'next']
                        , theme: 'center',
                        jump: function (obj, first) {
                            index = layer.load(1);
                            $.post('<%=path%>/biz/chatInfo_loadChatLog.action' + location.search,
                                {
                                    curr: obj.curr,
                                    limit: obj.limit
                                }
                                , function (result) {
                                    var data = JSON.parse(result)
                                    if (data.code == 200) {// 渲染
                                        console.log(data)
                                        view(data.data.list)
                                    } else {
                                        layer.close(index);
                                        layer.msg(data.code)
                                    }
                                });
                        }
                    })

                } else {
                    layer.msg('请求数据出错')
                }
            },
            error: function (data) {
                layer.alert('请求错误', data.msg);
            }
        });

        //聊天记录的分页此处不做演示，你可以采用laypage，不了解的同学见文档：http://www.layui.com/doc/modules/laypage.html

        function view(data) {

            // console.log('渲染的数据：'+JSON.stringify(data),data.length)

            // var prefix = ''

            var context = ''

            for (var i = 0; i < data.length; i++) {

                var value = data[i]

                <%--if (value.senderId == parent.layui.layim.cache().mine.id) {--%>

                <%--    var tmp = ''--%>

                <%--    prefix += '<li class="layim-chat-mine"><div class="layim-chat-user"><img src="<%=basePath%>/' + value.avatar + '"><cite><i>' + layui.data.date(value.sendTime) + '</i>' + value.senderName + '</cite></div><div class="layim-chat-text">'--%>

                <%--    if (value.senderContent.indexOf("img[") != -1 ){--%>
                <%--        tmp = layui.layim.content(value.senderContent.slice(0,4)+'<%=basePath%>/'+value.senderContent.slice(4))//图片--%>
                <%--    }else if (value.senderContent.indexOf("file(") != -1) {--%>
                <%--        tmp = layui.layim.content(value.senderContent.slice(0,5)+'<%=basePath%>/'+value.senderContent.slice(5))//图片--%>
                <%--    } else {--%>
                <%--        tmp = layui.layim.content(value.senderContent)//普通消息--%>
                <%--    }--%>

                <%--    prefix = prefix +tmp+'</div></li>'--%>

                <%--} else {--%>

                <%--    var tmp = ''--%>

                <%--    prefix += '<li><div class="layim-chat-user"><img src="<%=basePath%>/' + value.avatar + '"><cite>' + value.senderName + '<i>' + layui.data.date(value.sendTime) + '</i></cite></div><div class="layim-chat-text">'--%>

                <%--    if (value.senderContent.indexOf("img[") != -1 ){--%>
                <%--        tmp = layui.layim.content(value.senderContent.slice(0,4)+'<%=basePath%>/'+value.senderContent.slice(4))//图片--%>
                <%--    }else if (value.senderContent.indexOf("file(") != -1) {--%>
                <%--        tmp = layui.layim.content(value.senderContent.slice(0,5)+'<%=basePath%>/'+value.senderContent.slice(5))//图片--%>
                <%--    } else {--%>
                <%--        tmp = layui.layim.content(value.senderContent)//普通消息--%>
                <%--    }--%>

                <%--    prefix = prefix +tmp+'</div></li>'--%>
                <%--}--%>


                var tmp = ''

                var prefix = '<li '

                if (value.senderId == parent.layui.layim.cache().mine.id) prefix += 'class="layim-chat-mine"'

                context += prefix+'><div class="layim-chat-user"><img src="<%=basePath%>/' + value.avatar + '"><cite><i>' + layui.data.date(value.sendTime) + '</i>' + value.senderName + '</cite></div><div class="layim-chat-text">'

                if (value.senderContent.indexOf("img[") != -1) {
                    tmp = layui.layim.content(value.senderContent.slice(0, 4) + '<%=basePath%>' + value.senderContent.slice(4))//图片
                } else if (value.senderContent.indexOf("file(") != -1) {
                    tmp = layui.layim.content(value.senderContent.slice(0, 5) + '<%=basePath%>' + value.senderContent.slice(5))//图片
                } else {
                    tmp = layui.layim.content(value.senderContent)//普通消息
                }

                context += tmp + '</div></li>'

                // console.log(context)
            }

            // console.log(context)

            $('#LAY_view').html(context);

            layer.close(index);
        }
    });
</script>
</body>
</html>
