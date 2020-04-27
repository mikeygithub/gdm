package com.gxwzu.sysVO.chat;

import java.util.List;

/**
 * @ProjectName gdm
 * @Author 麦奇
 * @Email biaogejiushibiao@outlook.com
 * @Date 4/26/20 10:07 AM
 * @Version 1.0
 * @Title: ChatFriendInfoVo
 * @Description: 好友分组列表
 **/

public class ChatFriendInfoVo {

    private int id;

    private String groupname;

    private int online;

    private List<ChatUserInfoVo> list;//该分组成员列表

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname;
    }

    public int getOnline() {
        return online;
    }

    public void setOnline(int online) {
        this.online = online;
    }

    public List<ChatUserInfoVo> getList() {
        return list;
    }

    public void setList(List<ChatUserInfoVo> list) {
        this.list = list;
    }
}
