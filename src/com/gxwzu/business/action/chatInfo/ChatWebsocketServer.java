///**
// ***************************************************************************************
// *  @Author     1044053532@qq.com
// *  @License    http://www.apache.org/licenses/LICENSE-2.0
// ***************************************************************************************
// */
//package com.gxwzu.business.action.chatInfo;
//
//
//import io.netty.bootstrap.ServerBootstrap;
//import io.netty.channel.ChannelFuture;
//import io.netty.channel.ChannelInitializer;
//import io.netty.channel.ChannelOption;
//import io.netty.channel.EventLoopGroup;
//import io.netty.channel.nio.NioEventLoopGroup;
//import io.netty.channel.socket.SocketChannel;
//import io.netty.channel.socket.nio.NioServerSocketChannel;
//import io.netty.handler.codec.http.HttpObjectAggregator;
//import io.netty.handler.codec.http.HttpServerCodec;
//import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;
//import io.netty.handler.stream.ChunkedWriteHandler;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
//import javax.annotation.PostConstruct;
//import java.net.Socket;
//
//
///**
// * 聊天服务器
// */
//public class ChatWebsocketServer {
//
//    private final static Logger log = LoggerFactory.getLogger(ChatWebsocketServer.class);
//    //端口
//    private int port;
//    //事件组
//    private EventLoopGroup bossGroup = new NioEventLoopGroup();
//    //
//    private EventLoopGroup group = new NioEventLoopGroup();
//    /**
//     * 建立服务器
//     * @throws Exception
//     */
//    @PostConstruct
//    public void init() throws Exception {
//
//        try {
//            //服务器
//            ServerBootstrap serverBootstrap = new ServerBootstrap();
//            //端口
//            serverBootstrap.option(ChannelOption.SO_BACKLOG,1024);
//            serverBootstrap.group(group,bossGroup)
//                    .channel(NioServerSocketChannel.class)
//                    .localAddress(this.port)
//                    .childHandler(new ChannelInitializer<SocketChannel>() {
//                        @Override
//                        protected void initChannel(SocketChannel socketChannel) throws Exception {
//                            log.info("接收新连接："+socketChannel.localAddress());
//                            socketChannel.pipeline()
//                                    .addLast(new HttpServerCodec())
//                                    .addLast(new ChunkedWriteHandler())
//                                    .addLast(new HttpObjectAggregator(8192))
//                                    .addLast(new WebSocketServerProtocolHandler("/ws","WebSocket",true,65536*10))
//                                    .addLast(new ChatWebsocketServerHandler());
//                        }
//                    });
//            ChannelFuture sync = serverBootstrap.bind(port).sync();//服务器异步创建绑定端口
//            sync.channel().closeFuture().sync();
//        }catch (Exception e){
//            throw e;
//        }finally {
//            //优雅关闭
//            group.shutdownGracefully().sync();
//            bossGroup.shutdownGracefully().sync();
//        }
//
//    }
//
//    /**
//     * 销毁
//     */
//    public void destroy() throws Exception{
//
//        if (group.isShutdown()){
//            group.shutdownGracefully().sync();
//        }
//
//        if (bossGroup.isShutdown()){
//            bossGroup.shutdownGracefully().sync();
//        }
//
//    }
//
//    /**
//     * 设置端口
//     * @param port
//     */
//    public void setPort(int port) {
//        this.port = port;
//    }
//
//
//}
