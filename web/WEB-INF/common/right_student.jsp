<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<div class="mainbox">
    <div class="mainleft">
        <!--leftinfo end-->
        <div class="leftinfos">
            <div class="infoleft">
                <div class="listtitle">
                    <a href="#" class="more1"></a>时间安排
                </div>
                <div class="format-main">
                    <ul class="layui-timeline" id="planProgress">
                    </ul>
                </div>
            </div>
            <div class="infomiddel">
                <div class="listtitle">
                    <a href="#" class="more1"></a>毕业设计成绩
                </div>
             <div class="format-main" style="overflow-y: hidden">
                <ul class="layui-timeline" id="gradscore">
                    <li class="layui-timeline-item"><i
                            class="layui-icon layui-timeline-axis"></i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title" id="gradscore">开题报告</h3>
                            <s:if test="openReport!=null&&openReport.replyLink==0">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius  layui-btn-warm">未审批</div>
                            </s:if>
                            <s:if test="openReport!=null&&openReport.replyLink==1">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius  layui-btn-dangere">通过</div>
                            </s:if>
                            <s:if test="openReport!=null&&openReport.replyLink==2">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius  layui-btn-danger">未通过</div>
                            </s:if>
                            <s:if test="openReport==null">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius  layui-btn-warm">未填写</div>
                            </s:if>
                        </div>
                    </li>

                    <li class="layui-timeline-item"><i
                            class="layui-icon layui-timeline-axis"></i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title" id="gradscore">规范审查</h3>
                            <s:if test="normativeReview!=null">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius layui-btn-dangere">已审查,得分：
                                    <s:property value="normativeReview.totalScore"></s:property>
                                </div>
                            </s:if>
                            <s:if test="normativeReview==null">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius  layui-btn-warm">未审查</div>
                            </s:if>
                        </div>
                    </li>

                    <li class="layui-timeline-item"><i
                            class="layui-icon layui-timeline-axis"></i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title" id="gradscore">指导教师评阅打分</h3>
                            <s:if test="teacherReview!=null&&teacherReview.replyLink == '01'">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius layui-btn-dangere">
                                    <span>已通过,得分：</span>
                                    <div>
                                        <s:property value="teacherReview.totalScore"></s:property>
                                    </div>
                                </div>
                            </s:if>
                            <s:if test="teacherReview!=null&&teacherReview.replyLink == '00'">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius  layui-btn-danger">未通过,得分：
                                    <s:property value="teacherReview.totalScore"></s:property></div>
                            </s:if>
                            <s:if test="teacherReview==null">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius  layui-btn-warm">未审查</div>
                            </s:if>
                        </div>
                    </li>

                    <li class="layui-timeline-item"><i
                            class="layui-icon layui-timeline-axis"></i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title" id="gradscore">评阅人评阅打分</h3>
                            <s:if test="reviewerReview!=null&&reviewerReview.replyLink == 01">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius  layui-btn-dangere">已通过,得分：
                                    <s:property value="reviewerReview.totalScore"></s:property>
                                </div>
                            </s:if>
                            <s:if test="reviewerReview!=null&&reviewerReview.replyLink== 00">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius  layui-btn-danger">
                                    未通过,得分：<s:property value="reviewerReview.totalScore"></s:property></div>
                            </s:if>
                            <s:if test="reviewerReview==null">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius  layui-btn-warm">未审查</div>
                            </s:if>
                        </div>
                    </li>

                    <li class="layui-timeline-item"><i
                            class="layui-icon layui-timeline-axis"></i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title" id="gradscore">答辩成绩</h3>
                            <s:if test="studentScore!=null">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius  layui-btn-dangere"><s:property
                                        value="studentScore.replyScore"></s:property></div>
                            </s:if>
                            <s:if test="studentScore==null">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius  layui-btn-warm">未评分</div>
                            </s:if>
                        </div>
                    </li>

                    <li class="layui-timeline-item"><i
                            class="layui-icon layui-timeline-axis"></i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title" id="gradscore">最终成绩</h3>
                            <s:if test="studentScore!=null">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius  layui-btn-dangere"><s:property
                                        value="studentScore.replyScoreFinish"></s:property></div>
                            </s:if>
                            <s:if test="studentScore==null">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius  layui-btn-warm">未评分</div>
                            </s:if>
                        </div>
                    </li>

                    <li class="layui-timeline-item"><i
                            class="layui-icon layui-anim layui-anim-rotate layui-anim-loop layui-timeline-axis"></i>
                        <div class="layui-timeline-content layui-text">
                            <h3 class="layui-timeline-title" id="gradscore">等级</h3>
                            <%--								<div class="layui-timeline-title"></div>--%>
                            <s:if test="studentScore!=null">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius  layui-btn-dangere"><s:property
                                        value="studentScore.grade"></s:property></div>
                            </s:if>
                            <s:if test="studentScore==null">
                                <div class="layui-btn  layui-btn-mini layui-btn-radius  layui-btn-warm">未评分</div>
                            </s:if>
                        </div>
                    </li>
                </ul>
           </div>
            </div>
            <div class="inforight">
<%--                <div class="dflist">--%>
                    <div class="listtitle">
                        <%--                <a href="javascript:dialog('100%','100%','通知列表','<%=path%>/sys/notice_list.action?view=list', 'true','0');" class="more1">更多</a><img src="<%=path%>/images/i09.png" style="width:40px"/>&nbsp;公告信息--%>
                        <a href="<%=path%>/sys/notice_list.action?view=list" class="more1">更多</a><img src="<%=path%>/images/i09.png" style="width:40px"/>&nbsp;公告信息

                        <%--                <a href="javascript:void(0);" onclick="openNoticeList()" class="more1">更多</a>--%>

                        <%--                <img src="<%=path%>/images/i09.png" style="width:40px"/>&nbsp;公告信息--%>
                    </div>
    <div class="format-main" style="overflow-y: hidden">
        <ul class="newlist" id="sysNotice">

        </ul>
    </div>

<%--                </div>--%>
            </div>
        </div>
    </div>
    <!--mainleft end-->
<%--    <div class="mainright">--%>

<%--        <!--公告信息 satrt-->--%>
<%--        <div class="dflist">--%>
<%--            <div class="listtitle">--%>
<%--&lt;%&ndash;                <a href="javascript:dialog('100%','100%','通知列表','<%=path%>/sys/notice_list.action?view=list', 'true','0');" class="more1">更多</a><img src="<%=path%>/images/i09.png" style="width:40px"/>&nbsp;公告信息&ndash;%&gt;--%>
<%--                <a href="<%=path%>/sys/notice_list.action?view=list" class="more1">更多</a><img src="<%=path%>/images/i09.png" style="width:40px"/>&nbsp;公告信息--%>

<%--                &lt;%&ndash;                <a href="javascript:void(0);" onclick="openNoticeList()" class="more1">更多</a>&ndash;%&gt;--%>

<%--                &lt;%&ndash;                <img src="<%=path%>/images/i09.png" style="width:40px"/>&nbsp;公告信息&ndash;%&gt;--%>
<%--            </div>--%>
<%--            <ul class="newlist" id="sysNotice">--%>

<%--            </ul>--%>
<%--        </div>--%>

    </div>
    <!--mainright end-->
</div>


<!--我的聊天室 -->
<%--<div id="myChat"--%>
<%--     style="width: 260px;height: 520px;position: absolute;bottom: 0; right: 3px;box-shadow: 1px 1px 50px rgba(0,0,0,.3);">--%>
<%--    <div class="layui-layer layui-layer-page layui-box layui-layim"--%>
<%--         id="layui-layer1" type="page" times="1" showtime="0" contype="string"--%>
<%--         style="z-index: 19891015; width: 260px; height: 520px; position:absolute;right: 3px;top:0; background-image: url(http://res.layui.com/layui/dist/css/modules/layim/skin/3.jpg);">--%>
<%--        <div class="layui-layer-title" style="cursor: move;"></div>--%>
<%--        <div id="layui-layim" class="layui-layer-content"--%>
<%--             style="height: 520px;">--%>
<%--            <div class="layui-layim-main">--%>
<%--                <div class="layui-layim-info">--%>
<%--                    <div class="layui-layim-user">本人${student.stuName }${teacher.teacherName }</div>--%>
<%--                    <div class="layui-layim-status">--%>
<%--							<span class="layui-icon layim-status-online" layim-event="status"--%>
<%--                                  lay-type="show"></span>--%>
<%--                        <ul class="layui-anim layim-menu-box">--%>
<%--                            <li class="layim-this" layim-event="status" lay-type="online">--%>
<%--                                <i class="layui-icon"></i><cite class="layui-icon layim-status-online"></cite>在线--%>
<%--                            </li>--%>
<%--                            <li layim-event="status" lay-type="hide"><i--%>
<%--                                    class="layui-icon"></i><cite--%>
<%--                                    class="layui-icon layim-status-hide"></cite>隐身--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                    &lt;%&ndash;                    <input class="layui-layim-remark" placeholder="编辑签名" value="在深邃的编码世界，做一枚轻盈的纸飞机">&ndash;%&gt;--%>
<%--                </div>--%>

<%--                <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">--%>
<%--                    <!--组成员列表start  -->--%>
<%--                    <ul class="layui-tab-title">--%>
<%--                        <li class="layui-this"><i class="layui-icon">&#xe612;</i>--%>
<%--                        </li>--%>
<%--                        <li><i class="layui-icon">&#xe613;</i>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                    <!--组成员列表end  -->--%>

<%--                    <div class="layui-tab-content">--%>
<%--                        <div class="layui-tab-item layui-show">--%>
<%--                            <ul--%>
<%--                                    class="layui-unselect layim-tab-content layui-show layim-list-friend"--%>
<%--                                    id="openpeoul">--%>
<%--                                <li>--%>
<%--                                    <ul id="openpeolist" class="layui-layim-list"--%>
<%--                                        style="display: block;">--%>

<%--                                    </ul>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                        <div class="layui-tab-item">--%>
<%--                            <ul class="layui-unselect layim-tab-content"--%>
<%--                                style="display: block;"--%>
<%--                                id="opengroupul">--%>
<%--                                <li>--%>
<%--                                    <ul id="openpeogrouplist" class="layui-layim-list layui-show layim-list-group">--%>
<%--                                        <li onclick="openChat(1,'0','0');" class="layim-group101" id="groupChatIl">--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>

<%--                    </div>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--        <span class="layui-layer-setwin">--%>
<%--				<a id="chatclose" class="layui-layer-ico layui-layer-close layui-layer-close1" href="javascript:;"></a> --%>
<%--			</span>--%>
<%--    </div>--%>
<%--</div>--%>

<!--右下角聊天室按钮 -->
<%--<div id="chatbottom" onclick="loadChatInfo()"--%>
<%--     style="position: absolute;bottom: 0;width: 150px;right: 0;border: 1px solid #ddd;height: 50px;box-shadow: 1px 1px 50px rgba(0,0,0,.3);">--%>
<%--    <img src="<%=path%>/images/qq.jpg" style="width: 40px;height: 40px;--%>
<%--           border-radius: 25px;float: left;margin: 6px;"><span style="height: 50px;line-height: 50px;font-size:16px;">最新消息--%>
<%--    <s:if test="chatCount!=null&&chatCount!=0">--%>
<%--        <span class="layui-badge message-count"><s:property value="chatCount"></s:property></span>--%>
<%--    </s:if>--%>
<%--</span>--%>
<%--</div>--%>