package com.gxwzu.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @ProjectName gdm
 * @Author 麦奇
 * @Email biaogejiushibiao@outlook.com
 * @Date 5/1/20 10:43 AM
 * @Version 1.0
 * @Title: Config
 * @Description:
 **/
@Component
public class WebConfig {

    @Value("${chat.server.port}")
    public String chatServerPort;

    @Value("${chat.server.url}")
    public String chatServerUrl;


    public String getChatServerUrlAndPort() {
        return chatServerUrl+":"+chatServerPort;
    }
}
