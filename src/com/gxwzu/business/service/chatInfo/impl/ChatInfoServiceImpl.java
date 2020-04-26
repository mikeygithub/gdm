package com.gxwzu.business.service.chatInfo.impl;

import java.util.ArrayList;
import java.util.List;

import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.materialInfo.IMaterialInfoSerivce;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.sysVO.*;
import com.gxwzu.sysVO.chat.ChatGroupInfoVo;
import com.gxwzu.sysVO.chat.ChatUserInfoVo;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.gxwzu.system.service.userHelp.IUserHelpService;
import com.gxwzu.util.R;
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
    @Autowired
    private IChatInfoDao chatInfoDao;
    @Autowired
    private IUserHelpService iUserHelpService;//用户接口
    @Autowired
    private IChatFileService chatFileService;
    @Autowired
    private ISysTeacherService iSysTeacherService;
    @Autowired
    private IMaterialInfoSerivce iMaterialInfoSerivce;
    @Autowired
    private ISysStudentService iSysStudentService;
    @Autowired
    private IAllotGuideService iAllotGuideService;

    public BaseDao<ChatInfo> getDao() {
        return this.chatInfoDao;
    }


    @Override
    public ChatInfo add(ChatInfo model) {
        return chatInfoDao.saveOrUpdate(model);
    }


    @Override
    public List<ListChatInfo> findByUserIdAndAnswerId(Integer userId,
                                                      Integer answerId, String chatType) {
        List<ListChatInfo> list = new ArrayList<ListChatInfo>();
        List<ChatInfo> oldList = chatInfoDao.findByUserIdAndAnswerId(userId, answerId, chatType);
        if (oldList != null) {
            for (ChatInfo model : oldList) {
                ListChatInfo lInfo = new ListChatInfo();
                lInfo.setChatId(model.getChatId());
                lInfo.setAnswerId(model.getAnswerId());
                lInfo.setAnswerName(model.getAnswerName());
                lInfo.setReadType(model.getReadType());
                lInfo.setSenderContent(model.getSenderContent());
                lInfo.setSenderId(model.getSenderId());
                lInfo.setSenderName(model.getSenderName());
                lInfo.setChatType(model.getChatType());
                lInfo.setContType(model.getContType());
                if (model.getSendTime() != null)
                    lInfo.setSendTime(DateUtils.timestampFormatTime(model.getSendTime()));

                lInfo.setYear(model.getYear());

                List<ChatFile> chatFileList = chatFileService.findByChatInfoId(model.getChatId());
                lInfo.setChatFileList(chatFileList);

                list.add(lInfo);
            }
        }
        return list;
    }


    @Override
    public ListChatInfo findViewModelById(Integer chatId) {
        if (chatId != null) {
            ChatInfo model = chatInfoDao.get(ChatInfo.class, chatId);
            ListChatInfo lInfo = null;
            if (model != null) {
                lInfo = new ListChatInfo();
                lInfo.setChatId(model.getChatId());
                lInfo.setAnswerId(model.getAnswerId());
                lInfo.setAnswerName(model.getAnswerName());
                lInfo.setReadType(model.getReadType());
                lInfo.setSenderContent(model.getSenderContent());
                lInfo.setSenderId(model.getSenderId());
                lInfo.setSenderName(model.getSenderName());
                lInfo.setChatType(model.getChatType());
                lInfo.setContType(model.getContType());
                if (model.getSendTime() != null)
                    lInfo.setSendTime(DateUtils.timestampFormatTime(model.getSendTime()));
                lInfo.setYear(model.getYear());

                List<ChatFile> chatFileList = chatFileService.findByChatInfoId(model.getChatId());
                lInfo.setChatFileList(chatFileList);
            }
            return lInfo;

        } else {
            return null;
        }
    }


    @Override
    public List<ListChatInfo> findByGuideTreacherId(Integer treacherId,
                                                    Integer year, String chatType, List<ListStudentAllotGuide> allotGuideStudentList) {
        List<ListChatInfo> list = new ArrayList<ListChatInfo>();
        List<ChatInfo> oldList = chatInfoDao.findByGuideTreacherId(treacherId, year, chatType, allotGuideStudentList);
        if (oldList != null) {
            for (ChatInfo model : oldList) {
                ListChatInfo lInfo = new ListChatInfo();
                lInfo.setChatId(model.getChatId());
                lInfo.setAnswerId(model.getAnswerId());
                lInfo.setAnswerName(model.getAnswerName());
                lInfo.setReadType(model.getReadType());
                lInfo.setSenderContent(model.getSenderContent());
                lInfo.setSenderId(model.getSenderId());
                lInfo.setSenderName(model.getSenderName());
                lInfo.setChatType(model.getChatType());
                lInfo.setContType(model.getContType());
                if (model.getSendTime() != null)
                    lInfo.setSendTime(DateUtils.timestampFormatTime(model.getSendTime()));

                lInfo.setYear(model.getYear());
                List<ChatFile> chatFileList = chatFileService.findByChatInfoId(model.getChatId());
                lInfo.setChatFileList(chatFileList);

                list.add(lInfo);
            }
        }
        return list;
    }


    @Override
    public List<ChatInfo> findByAnswerId(Integer answerId, Integer senderId, String chatType, String readType) {
        return chatInfoDao.findByAnswerId(answerId, senderId, chatType, readType);
    }

    /**
     * 更新消息阅读状态
     *
     * @param readType
     */
    @Override
    public void updateReadType(Integer answerId, Integer senderId, String readType) {
        chatInfoDao.updateReadType(answerId, senderId, readType);
    }


    @Override
    public void updateByChatId(Integer chatId, String readType) {
        chatInfoDao.updateByChatId(chatId, readType);

    }

    /**
     * 通过教师或学生的ID查询未读的聊天信息数量
     *
     * @param userId
     * @return
     */
    @Override
    public Integer findChatCountByTeacherIdOrStudentId(Integer userId) {
        return chatInfoDao.findChatCountByTeacherIdOrStudentId(userId);
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

        if (SystemContext.USER_STUDENT_TYPE.equals(userHelp.getUserType())) {//学生
            student = iSysStudentService.findByStuNo(loginName);
            AllotGuide allotGuide = iAllotGuideService.findByStuIdAndYear(student.getStuId(), planYear.getYear());
            teacher = iSysTeacherService.findModelById(allotGuide.getTeacherId());
            //学生列表
            guideStudentList = iMaterialInfoSerivce.findGuideStudent(allotGuide.getTeacherId(), planYear.getYear());
            //自己信息
            mine = new ChatUserInfoVo(student);
            //教师列表
            ChatGroupInfoVo teacherGroup = new ChatGroupInfoVo();
            teacherGroup.setGroupname("指导老师");
            teacherGroup.add(new ChatUserInfoVo(teacher));
            friend.add(teacherGroup);
        }

        if (SystemContext.USER_TEACHER_TYPE.equals(userHelp.getUserType())) {//教师

            teacher = iSysTeacherService.findByTeacherNo(loginName);
            // 指导老师查询自己所带学生相关信息
            guideStudentList = iMaterialInfoSerivce.findGuideStudent(teacher.getTeacherId(), planYear.getYear());

            mine = new ChatUserInfoVo(teacher);

        }

        ChatGroupInfoVo studentGroup = new ChatGroupInfoVo();

        for (MaterialInfo tmp:guideStudentList){
            if (!tmp.getStudent().getStuNo().equals(student.getStuNo())) {//移除自己
                studentGroup.add(new ChatUserInfoVo(tmp.getStudent()));
            }
        }

        //群聊
        ChatGroupInfoVo chatGroupInfoVo = new ChatGroupInfoVo();
        chatGroupInfoVo.setId(teacher.getUserId());//根据指导老师的id来命名群id
        chatGroupInfoVo.setGroupname("毕业设计交流群");
        chatGroupInfoVo.setAvatar(SystemContext.DEFAULT_GROUP_AVATAR);
        chatGroupInfoVo.setOwner(new ChatUserInfoVo(teacher));

        ArrayList<ChatGroupInfoVo> groupList = new ArrayList<>();
        groupList.add(chatGroupInfoVo);

        //学生列表
        studentGroup.setGroupname("学生分组");
        friend.add(studentGroup);

        r.add("mine", mine)//自己信息
         .add("friend", friend)//好友列表
         .add("group", groupList);//群聊列表

        return r;
    }


}
