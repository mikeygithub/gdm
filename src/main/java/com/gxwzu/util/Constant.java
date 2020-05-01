package com.gxwzu.util;

import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.http.websocketx.WebSocketServerHandshaker;


import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 描述: 全局常量
 * 2. webSocketServerHandshaker表，用channelId为键，存放握手实例。用来响应CloseWebSocketFrame的请求；
 * 3. onlineUser表，用userId为键，存放在线的客户端连接上下文
 *
 * @author Kanarien
 * @version 1.0
 * @date 2018年5月18日 下午9:17:35
 */
public class Constant {

    public static Map<String, WebSocketServerHandshaker> webSocketHandShakerMap = new ConcurrentHashMap<String, WebSocketServerHandshaker>();

    public static Map<String, ChannelHandlerContext> onlineUserMap = new ConcurrentHashMap<String, ChannelHandlerContext>();
}
