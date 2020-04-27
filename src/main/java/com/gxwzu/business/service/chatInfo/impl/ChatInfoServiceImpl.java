package com.gxwzu.business.service.chatInfo.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.materialInfo.IMaterialInfoSerivce;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.util.UidUtils;
import com.gxwzu.sysVO.*;
import com.gxwzu.sysVO.chat.ChatGroupInfoVo;
import com.gxwzu.sysVO.chat.ChatUserInfoVo;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.gxwzu.system.service.userHelp.IUserHelpService;
import com.gxwzu.util.ExportDocUtil;
import com.gxwzu.util.R;
import org.apache.commons.io.FileUtils;
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
            chatGroupInfoVo.setId(teacher.getUserId());//根据指导老师的id来命名群id
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

            r.add("owner", new ChatUserInfoVo(teacher));//教师信息
        } else if (SystemContext.USER_TEACHER_TYPE.equals(userHelp.getUserType())) {//教师
            teacher = iSysTeacherService.findByTeacherNo(loginName);
            // 指导老师查询自己所带学生相关信息
            guideStudentList = iMaterialInfoSerivce.findGuideStudent(teacher.getTeacherId(), planYear.getYear());

            r.add("owner", new ChatUserInfoVo(teacher));//教师信息
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
            if (!tmp.getStudent().getStuNo().equals(student.getStuNo())) {//移除自己
                studentGroup.add(new ChatUserInfoVo(tmp.getStudent()));
            }
        }
        r.add("members", studentGroup.getList().size() + 1)//好友列表
                .add("list", studentGroup.getList());//群聊列表

        return r;
    }

    /**
     * 上传聊天文件
     *
     * @param upload
     * @return * {
     * *   "code": 0 //0表示成功，其它表示失败
     * *   ,"msg": "" //失败信息
     * *   ,"data": {
     * *     "src": "http://cdn.xxx.com/upload/images/a.jpg" //图片url
     * *   }
     * * }
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

            return R.ok(0).add("src", filePath).add("name", uploadFileName);

        } catch (IOException e) {

            log.info("图片上传出错：" + e);

            return R.ok();
        }
    }

}
