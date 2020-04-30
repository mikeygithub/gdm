package com.gxwzu.business.service.chatInfo.impl;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.MessageFormat;
import java.util.*;

import com.alibaba.fastjson.JSONObject;
import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.materialInfo.IMaterialInfoSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.util.UidUtils;
import com.gxwzu.sysVO.*;
import com.gxwzu.sysVO.chat.ChatGroupInfoVo;
import com.gxwzu.sysVO.chat.ChatUserInfoVo;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.gxwzu.system.service.userHelp.IUserHelpService;
import com.gxwzu.util.Constant;
import com.gxwzu.util.ExportDocUtil;
import com.gxwzu.util.R;
import com.gxwzu.websocket.ChatType;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.chatInfo.IChatInfoDao;
import com.gxwzu.business.model.chatInfo.ChatFile;
import com.gxwzu.business.model.chatInfo.ChatInfo;
import com.gxwzu.business.service.chatInfo.IChatFileService;
import com.gxwzu.business.service.chatInfo.IChatInfoService;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.core.util.DateUtils;

@Service("chatInfoService")
public class ChatInfoServiceImpl extends BaseServiceImpl<ChatInfo> implements IChatInfoService {


    protected static final Log logger = LogFactory.getLog(ChatInfo.class);

    @Autowired
    private IChatInfoDao chatInfoDao;
    @Autowired
    private IUserHelpService iUserHelpService;//用户接口
    @Autowired
    private ISysTeacherService iSysTeacherService;
    @Autowired
    private IMaterialInfoSerivce iMaterialInfoSerivce;
    @Autowired
    private ISysStudentService iSysStudentService;
    @Autowired
    private IAllotGuideService iAllotGuideService;
    @Autowired
    private IPlanYearSerivce iPlanYearSerivce;

    public BaseDao<ChatInfo> getDao() {
        return this.chatInfoDao;
    }

    @Override
    public R loadChatFriend(PlanYear planYear, String loginName) {

        R r = new R();

        UserHelp userHelp = iUserHelpService.findByLoginName(loginName).get(0);

        List<MaterialInfo> guideStudentList = new ArrayList<>();//所带学生
        ListTeacher teacher = null;//指导老师
        List<ChatGroupInfoVo> friend = new ArrayList<>();//分组
        ChatUserInfoVo mine = null;
        ListStudent student = new ListStudent();

        //群聊
        ChatGroupInfoVo chatGroupInfoVo = new ChatGroupInfoVo();
        chatGroupInfoVo.setGroupname("毕业设计交流群");
        chatGroupInfoVo.setAvatar(SystemContext.DEFAULT_GROUP_AVATAR);

        ChatGroupInfoVo teacherGroup = new ChatGroupInfoVo();
        teacherGroup.setGroupname("指导老师");

        ArrayList<ChatGroupInfoVo> groupList = new ArrayList<>();

        //学生列表
        ChatGroupInfoVo studentGroup = new ChatGroupInfoVo();

        if (SystemContext.USER_STUDENT_TYPE.equals(userHelp.getUserType())) {//学生
            student = iSysStudentService.findByStuNo(loginName);


            AllotGuide allotGuide = iAllotGuideService.findByStuIdAndYear(student.getStuId(), planYear.getYear());
            if (allotGuide != null) {//过滤未分配的
                teacher = iSysTeacherService.findModelById(allotGuide.getTeacherId());
                //学生列表
                guideStudentList = iMaterialInfoSerivce.findGuideStudent(allotGuide.getTeacherId(), planYear.getYear());
                //教师列表
                teacherGroup.add(new ChatUserInfoVo(teacher));
            }
            //自己信息
            mine = new ChatUserInfoVo(student);
            friend.add(teacherGroup);
        } else if (SystemContext.USER_TEACHER_TYPE.equals(userHelp.getUserType())) {//教师

            teacher = iSysTeacherService.findByTeacherNo(loginName);
            // 指导老师查询自己所带学生相关信息
            guideStudentList = iMaterialInfoSerivce.findGuideStudent(teacher.getTeacherId(), planYear.getYear());

            mine = new ChatUserInfoVo(teacher);

        } else if (SystemContext.USER_ADMIN_TYPE.equals(userHelp.getUserType())) {//管理员
            //全部学生//全部教师
            List<UserHelp> all = iUserHelpService.findAll(UserHelp.class);

            all.remove(userHelp);//移除自己

            for (UserHelp tmp : all) {
                ChatUserInfoVo tmpChat = new ChatUserInfoVo(tmp);
                if (SystemContext.USER_TEACHER_TYPE.equals(tmp.getUserType())) {
                    teacherGroup.add(tmpChat);
                }
                if (SystemContext.USER_STUDENT_TYPE.equals(tmp.getUserType())) {
                    studentGroup.add(tmpChat);
                }
                chatGroupInfoVo.add(tmpChat);
            }
            mine = new ChatUserInfoVo(userHelp);
            chatGroupInfoVo.setId(userHelp.getId());
            groupList.add(chatGroupInfoVo);
            r.add("group", groupList);//群聊列表
            friend.add(teacherGroup);
        }


        for (MaterialInfo tmp : guideStudentList) {
            if (!tmp.getStudent().getStuNo().equals(student.getStuNo())) {//移除自己
               studentGroup.add(new ChatUserInfoVo(tmp.getStudent()));
            }
        }

        if (teacher != null) {
            chatGroupInfoVo.setOwner(new ChatUserInfoVo(teacher));
            chatGroupInfoVo.setId(teacher.getUserId() + 1);//根据指导老师的id+1来命名群id
            groupList.add(chatGroupInfoVo);
            r.add("group", groupList);//群聊列表
        }


        //学生列表
        studentGroup.setGroupname("学生分组");
        friend.add(studentGroup);

        r.add("mine", mine)//自己信息
                .add("friend", friend);//好友列表

        return r;
    }

    @Override
    public R loadGroupMembers(PlanYear planYear, String loginName) {

        R r = new R();

        UserHelp userHelp = iUserHelpService.findByLoginName(loginName).get(0);

        ListStudent student = null;

        ListTeacher teacher = null;

        List<MaterialInfo> guideStudentList = new ArrayList<>();

        ChatGroupInfoVo studentGroup = new ChatGroupInfoVo();

        if (SystemContext.USER_STUDENT_TYPE.equals(userHelp.getUserType())) {//学生
            student = iSysStudentService.findByStuNo(loginName);
            AllotGuide allotGuide = iAllotGuideService.findByStuIdAndYear(student.getStuId(), planYear.getYear());
            teacher = iSysTeacherService.findModelById(allotGuide.getTeacherId());
            //学生列表
            guideStudentList = iMaterialInfoSerivce.findGuideStudent(allotGuide.getTeacherId(), planYear.getYear());
            //教师信息
            r.add("owner", new ChatUserInfoVo(teacher));
            //添加教师到群聊成员列表
            studentGroup.add(new ChatUserInfoVo(teacher));

        } else if (SystemContext.USER_TEACHER_TYPE.equals(userHelp.getUserType())) {//教师
            teacher = iSysTeacherService.findByTeacherNo(loginName);
            // 指导老师查询自己所带学生相关信息
            guideStudentList = iMaterialInfoSerivce.findGuideStudent(teacher.getTeacherId(), planYear.getYear());
            //教师信息
            r.add("owner", new ChatUserInfoVo(teacher));
        } else if (SystemContext.USER_ADMIN_TYPE.equals(userHelp.getUserType())) {//管理员
            //全部学生//全部教师
            List<UserHelp> all = iUserHelpService.findAll(UserHelp.class);

            all.remove(userHelp);//移除自己

            for (UserHelp tmp : all) {
                studentGroup.add(new ChatUserInfoVo(tmp));
            }
            r.add("owner", new ChatUserInfoVo(userHelp));//教师信息
        }


        for (MaterialInfo tmp : guideStudentList) {
            if (SystemContext.USER_STUDENT_TYPE.equals(userHelp.getUserType())&&tmp.getStudent().getUserId().intValue()==student.getUserId())continue;//移除自己
                studentGroup.add(new ChatUserInfoVo(tmp.getStudent()));
        }
        r.add("members", studentGroup.getList().size() + 1)//好友列表学生+1老师
                .add("list", studentGroup.getList());//群聊列表

        return r;
    }

    /**
     * 上传聊天文件
     *
     * @param upload
     * @return
     */
    @Override
    public R uploadChatFile(File upload, String uploadFileName) {

        String filePath = null;

        String targetFileName = uploadFileName.substring(uploadFileName.lastIndexOf(".")); // 文件后缀
        String name = uploadFileName.substring(0, uploadFileName.lastIndexOf(".")); // 文件名
        // 文件名组装：UUID.后缀
        targetFileName = UidUtils.UID() + "_" + name + targetFileName; // 上传的文件
        // 1-保存附件；
        String targetDirectory = ServletActionContext.getServletContext().getRealPath(SystemContext.DEFAULT_CHAT_IMG_SAVE_PATH); // 文件的绝对路径

        File target = new File(targetDirectory, targetFileName);

        try {

            FileUtils.copyFile(upload, target);

            filePath = SystemContext.DEFAULT_CHAT_IMG_SAVE_PATH + "/" + targetFileName;

            return R.ok().add("src", filePath.substring(1)).add("name", uploadFileName);

        } catch (IOException e) {

            log.info("图片上传出错：" + e);

            return R.ok(500,"上传文件出错");
        }
    }

    /**
     * 用户上线注册
     *
     * @param param
     * @param ctx
     */
    @Override
    public void register(JSONObject param, ChannelHandlerContext ctx) {

        String username = (String) param.get("username");
        //查询用户
        UserHelp userHelp = iUserHelpService.findByLoginName(username).get(0);
        //将当前用户加入在线Map
        Constant.onlineUserMap.put(userHelp.getId().toString(), ctx);
        //查询私聊未读消息
        List<ChatInfo> newChatMessageList = chatInfoDao.findNewChatMessage(userHelp);
        //查询群聊未读消息
        List<ChatInfo> groupChatMessage = chatInfoDao.findNewGroupChatMessage(userHelp);
        //回复上线成功通知
        sendMessage(ctx, R.ok().add("type", ChatType.REGISTER).add("data", newChatMessageList).add("group", groupChatMessage).toString());
        //
        log.info(MessageFormat.format("用户名为 {0} 的用户登记到在线用户表，当前在线人数为：{1}", username, Constant.onlineUserMap.size()));
        //
        System.out.println(MessageFormat.format("用户名为 {0} 的用户登记到在线用户表，当前在线人数为：{1}", username, Constant.onlineUserMap.size()));
    }

    /**
     * 私聊
     *
     * @param param
     * @param ctx
     */
    @Override
    public void singleSend(JSONObject param, ChannelHandlerContext ctx) {
        //获取数据
        ChatInfo chatInfo = analysisChatInfo(param);
        //发送给接收方
        ChannelHandlerContext toUserCtx = Constant.onlineUserMap.get(chatInfo.getAnswerId().toString());
        //处理头像
        String sendUserImg = iUserHelpService.findById(chatInfo.getSenderId()).getUserImg();
        chatInfo.setAvatar(StringUtils.isNotBlank(sendUserImg) ? sendUserImg : SystemContext.DEFAULT_PERSON_AVATAR);
        if (toUserCtx != null) {
            sendMessage(toUserCtx, R.ok().add("type", ChatType.SINGLE_SENDING).add("data", chatInfo).toString());
        }
        //保存到数据库
        chatInfoDao.save(chatInfo);
    }

    /**
     * 群聊
     *
     * @param param
     * @param ctx
     */
    @Override
    public void groupSend(JSONObject param, ChannelHandlerContext ctx) {
        //获取数据
        ChatInfo chatInfo = analysisChatInfo(param);
        //查询该群下所有的群员
        SysTeacher teacher = iSysTeacherService.findTeacherByUserId(chatInfo.getAnswerId() - 1);//教师的id+1命名的群号id
        // 指导老师查询自己所带学生相关信息
        PlanYear planYear = iPlanYearSerivce.findPlanYear();

        List<MaterialInfo> guideStudent = iMaterialInfoSerivce.findGuideStudent(teacher.getTeacherId(), planYear.getYear());

        //拼接接收者id
        String allAnswerId = "";

        for (MaterialInfo tmp : guideStudent) {
            allAnswerId += tmp.getStudent().getUserId() + ",";
            if (chatInfo.getSenderId().intValue()!=tmp.getStudent().getUserId().intValue()) {//not send self
                ChannelHandlerContext toUserCtx = Constant.onlineUserMap.get(tmp.getStudent().getUserId().toString());
                if (toUserCtx != null) {
                    sendMessage(toUserCtx, R.ok()
                            .add("type", ChatType.GROUP_SENDING)
                            .add("data", chatInfo)
                            .add("avatar",StringUtils.isNotEmpty(tmp.getStudent().getUserImg())?tmp.getStudent().getUserImg():SystemContext.DEFAULT_PERSON_AVATAR)
                            .toString());
                }
            }
        }
        //send to teacher (if sender not is teacher)
        ChannelHandlerContext toUserCtx = Constant.onlineUserMap.get(String.valueOf(chatInfo.getAnswerId() - 1));
        if (toUserCtx != null && chatInfo.getSenderId().intValue()!= teacher.getUserId().intValue()) {
            sendMessage(toUserCtx, R.ok().add("type", ChatType.GROUP_SENDING).add("data", chatInfo).toString());
           allAnswerId +=  teacher.getUserId();
        }

        //移除自己
        allAnswerId = allAnswerId.replace(chatInfo.getSenderId().toString(), "");
        //保存到数据库
        chatInfo.setAnswerName(allAnswerId);
        chatInfoDao.save(chatInfo);
    }

    private ChatInfo analysisChatInfo(JSONObject param) {
        String send_id = (String) param.get("send_id");
        String send_name = (String) param.get("send_name");
        String chat_content = (String) param.get("chat_content");
        String answer_id = (String) param.get("answer_id");
        String answer_name = (String) param.get("answer_name");
        String chat_type = (String) param.get("chat_type");
        String content_type = (String) param.get("content_type");
        return new ChatInfo(Integer.parseInt(send_id), send_name, chat_content, Integer.parseInt(answer_id), answer_name, SystemContext.CHAT_NOT_READ_STATUS, null, new Timestamp(new Date().getTime()), chat_type, content_type);
    }

    @Override
    public void remove(ChannelHandlerContext ctx) {
        Iterator<Map.Entry<String, ChannelHandlerContext>> iterator = Constant.onlineUserMap.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<String, ChannelHandlerContext> entry = iterator.next();
            if (entry.getValue() == ctx) {
                log.info("正在移除握手实例...");
                Constant.webSocketHandshakerMap.remove(ctx.channel().id().asLongText());
                log.info(MessageFormat.format("已移除握手实例，当前握手实例总数为：{0}", Constant.webSocketHandshakerMap.size()));
                iterator.remove();
                log.info(MessageFormat.format("userId为 {0} 的用户已退出聊天，当前在线人数为：{1}", entry.getKey(), Constant.onlineUserMap.size()));
                break;
            }
        }
    }

    @Override
    public void typeError(ChannelHandlerContext ctx) {
        sendMessage(ctx, R.error("该类型不存在").toString());
    }

    /**
     * 已读消息
     *
     * @param param
     * @param ctx
     */
    @Override
    public void readChat(JSONObject param, ChannelHandlerContext ctx) {
        //判断是群聊还是私聊
        String chatType = param.getString("chat-type");
        //群聊id
        String groupId = param.getString("group-id");
        //发送者id
        String sendId = param.getString("send-id");
        //本人id
        String answerId = param.getString("answer-id");
        switch (chatType) {
            case "GROUP_CHAT"://处理群聊消息设置为已读
                chatInfoDao.updateReadGroupChatStatus(groupId, answerId);
                break;
            case "SINGLE_CHAT"://处理私聊消息为已读
                chatInfoDao.updateReadSingleChatStatus(sendId, answerId);
                break;
            default:
                log.info("聊天类型错误");
        }
    }

    /**
     * 查询聊天信息
     * @param id
     * @param type
     * @param curr
     * @param limit
     * @return
     */
    @Override
    public R loadChatLog(Integer id, String type, int curr, int limit,String username) {

        if (SystemContext.CHAT_LOG_TYPE_GROUP.equals(type)){//查询群聊消息记录
            return chatInfoDao.findGroupChatLog(id,curr,limit);
        }
        if (SystemContext.CHAT_LOG_TYPE_FRIEND.equals(type)) {//查询私聊消息记录
            return chatInfoDao.findFriendChatLog(id,iUserHelpService.findByLoginName(username).get(0).getId(), curr, limit);
        }

        return R.error();
    }

    /**
     * 发送消息
     * @param ctx
     * @param message
     */
    private void sendMessage(ChannelHandlerContext ctx, String message) {
        System.out.println("服务器发送消息：" + message);
        ctx.channel().writeAndFlush(new TextWebSocketFrame(message));
    }


}
