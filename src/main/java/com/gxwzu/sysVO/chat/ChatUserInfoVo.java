package com.gxwzu.sysVO.chat;

import com.gxwzu.core.context.SystemContext;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.system.model.userHelp.UserHelp;
import org.apache.commons.lang.xwork.StringUtils;

/**
 * @ProjectName gdm
 * @Author 麦奇
 * @Email biaogejiushibiao@outlook.com
 * @Date 4/26/20 9:43 AM
 * @Version 1.0
 * @Title: ChatUserInfoVo
 * @Description: 聊天信息类
 **/

public class ChatUserInfoVo {

    private int id;
    private String username;
    private String status = "online";
    private String sign;
    private String avatar;

    public ChatUserInfoVo() { }


    public ChatUserInfoVo(UserHelp userHelp) {

        this.id = userHelp.getId();
        this.username = userHelp.getUserName();
        this.sign = userHelp.getSign();
        this.avatar = SystemContext.DEFAULT_PERSON_AVATAR;
        if (StringUtils.isNotBlank(userHelp.getUserImg()))this.avatar = userHelp.getUserImg();

    }

    public ChatUserInfoVo(ListStudent listStudent){
        this.id = listStudent.getUserId();
        this.username = listStudent.getStuName();
        this.sign = listStudent.getSign();
        this.avatar = SystemContext.DEFAULT_PERSON_AVATAR;
        if (StringUtils.isNotBlank(listStudent.getUserImg()))this.avatar = listStudent.getUserImg().substring(1);
    }

    public ChatUserInfoVo(ListTeacher teacher) {
        this.id = teacher.getUserId();
        this.username = teacher.getTeacherName();
        this.sign = teacher.getSign();
        this.avatar = SystemContext.DEFAULT_PERSON_AVATAR;
        if (StringUtils.isNotBlank(teacher.getUserImg()))this.avatar = teacher.getUserImg().substring(1);

    }

    public ChatUserInfoVo(int id, String username, String status, String sign, String avatar) {
        this.id = id;
        this.username = username;
        this.status = status;
        this.sign = sign;
        this.avatar = avatar;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
