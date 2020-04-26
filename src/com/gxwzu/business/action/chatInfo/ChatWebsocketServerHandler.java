//package com.gxwzu.business.action.chatInfo;
//
//import com.gxwzu.business.model.chatInfo.ChatInfo;
//import com.gxwzu.business.service.chatInfo.IChatInfoService;
//import com.gxwzu.core.context.SystemContext;
//import io.netty.channel.Channel;
//import io.netty.channel.ChannelHandler;
//import io.netty.channel.ChannelHandlerContext;
//import io.netty.channel.SimpleChannelInboundHandler;
//import io.netty.channel.group.ChannelGroup;
//import io.netty.channel.group.DefaultChannelGroup;
//import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
//import io.netty.util.concurrent.EventExecutorGroup;
//import io.netty.util.concurrent.GlobalEventExecutor;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//
//import java.net.SocketAddress;
//
///**
// * @ProjectName gdm
// * @Author 麦奇
// * @Email biaogejiushibiao@outlook.com
// * @Date 4/24/20 8:21 AM
// * @Version 1.0
// * @Title: ChatWebsocketServerHandler
// * @Description:
// **/
//public class ChatWebsocketServerHandler extends SimpleChannelInboundHandler<ChatInfo>  {
//
//    @Autowired
//    private IChatInfoService iChatInfoSerivce;
//
//    private final static Logger log = LoggerFactory.getLogger(ChatWebsocketServerHandler.class);
//
//    public static ChannelGroup channelGroup;
//
//    static {
//        channelGroup = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);
//    }
//
//    /**
//     * 客户端与服务器建立连接的时候触发
//     * @param ctx
//     * @throws Exception
//     */
//    @Override
//    public void channelActive(ChannelHandlerContext ctx) throws Exception {
//        log.info("客户端与服务器建立连接－开启通道");
//        //加入群聊
//        channelGroup.add(ctx.channel());
//        //检查未读信息
//
//
//    }
//
//    /**
//     * 服务器接收数据时触发
//     * @param channelHandlerContext
//     * @param chatInfo
//     * @throws Exception
//     */
//    @Override
//    protected void channelRead0(ChannelHandlerContext channelHandlerContext, ChatInfo chatInfo) throws Exception {
//
//        log.info("服务器接收到数据："+chatInfo.getSenderContent());
//
//        //判断私聊还是群聊
//        if (SystemContext.CHAT_PRIVATE_TYPE.equals(chatInfo.getChatType())) {//1:私聊　0:群聊
//            //私聊
//            chatPrivate(channelHandlerContext, chatInfo);
//        }
//        if (true) {
//            //群聊
//            chatGroup(channelHandlerContext,chatInfo);
//        }
//    }
//
//    /**
//     * 客户端与服务器关闭连接时触发
//     * @param ctx
//     * @throws Exception
//     */
//    @Override
//    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
//        log.info("客户端与服务器断开连接－关闭通道");
//        channelGroup.remove(ctx.channel());
//    }
//
//    /**
//     * 私聊
//     * @param ctx
//     * @param chatInfo
//     */
//    private void chatPrivate(ChannelHandlerContext ctx, ChatInfo chatInfo){
//
//        //远程地址
//        SocketAddress socketAddress = ctx.channel().remoteAddress();
//        log.info("向远程地址发送消息："+socketAddress);
//        ctx.writeAndFlush(chatInfo);
//
//    }
//
//    /**
//     * 群聊
//     * @param ctx
//     * @param chatInfo
//     */
//    private void chatGroup(ChannelHandlerContext ctx,ChatInfo chatInfo){
//        Channel channel = ctx.channel();
//        //移除给自己发送消息
//        ChannelGroup tmpChannelGroup = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);
//        channelGroup.forEach(v->{
//            if (v != channel){
//                tmpChannelGroup.add(v);
//            }
//        });
//        tmpChannelGroup.writeAndFlush(chatInfo);
//    }
//
//    /**
//     * 保存聊天记录
//     * @param chatInfo
//     */
//    private void saveSendMessage(ChatInfo chatInfo){
//        iChatInfoSerivce.save(chatInfo);
//    }
//}
