package com.gxwzu.websocket;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.gxwzu.business.model.chatInfo.ChatInfo;

/**
 * @ProjectName gdm
 * @Author 麦奇
 * @Email biaogejiushibiao@outlook.com
 * @Date 4/28/20 12:17 PM
 * @Version 1.0
 * @Title: ChatType
 * @Description:
 **/

public enum ChatType {

    REGISTER, SINGLE_SENDING, GROUP_SENDING, FILE_MSG_SINGLE_SENDING, FILE_MSG_GROUP_SENDING;

    public static void main(String[] args) {
        System.out.println(ChatType.REGISTER);
        System.out.println(ChatType.GROUP_SENDING);
    }
}