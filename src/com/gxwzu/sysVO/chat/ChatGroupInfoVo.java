package com.gxwzu.sysVO.chat;

import java.util.ArrayList;
import java.util.List;

/**
 * @ProjectName gdm
 * @Author 麦奇
 * @Email biaogejiushibiao@outlook.com
 * @Date 4/26/20 9:48 AM
 * @Version 1.0
 * @Title: ChatGroupInfoVo
 * @Description:　聊天组别类
 **/

public class ChatGroupInfoVo {

    private int id;

    private String avatar;//群头像

    private String groupname;//群名

    private ChatUserInfoVo owner;//群主

    private List<ChatUserInfoVo> list = new ArrayList<>();//成员

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname;
    }

    public ChatUserInfoVo getOwner() {
        return owner;
    }

    public void setOwner(ChatUserInfoVo owner) {
        this.owner = owner;
    }

    public List<ChatUserInfoVo> getList() {
        return list;
    }

    public void setList(List<ChatUserInfoVo> list) {
        this.list = list;
    }

    public ChatGroupInfoVo add(ChatUserInfoVo chatUserInfoVo){
        this.list.add(chatUserInfoVo);
        return this;
    }
}
