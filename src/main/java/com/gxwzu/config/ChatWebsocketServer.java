///**
// ***************************************************************************************
// *  @Author     1044053532@qq.com
// *  @License    http://www.apache.org/licenses/LICENSE-2.0
// ***************************************************************************************
// */
//package com.gxwzu.config;
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
//import org.springframework.stereotype.Component;
//
//
///**
// * 聊天服务器
// */
//@Component
//public class ChatWebsocketServer {
//
//    private final static Logger log = LoggerFactory.getLogger(ChatWebsocketServer.class);
//    //端口
//    private int port;
//    //事件组
//    private EventLoopGroup bossGroup = null;
//
//    private EventLoopGroup group = null;
//    /**
//     * 建立服务器
//     * @throws Exception
//     */
//    public void init() {
//
//        //事件组
//      bossGroup = new NioEventLoopGroup();
//        //
//      group = new NioEventLoopGroup();
////        new Thread(() -> {
//            try {
//                System.out.println(Thread.currentThread().getName());
//                Thread.sleep(2000);
//                //服务器
//                ServerBootstrap serverBootstrap = new ServerBootstrap();
//                //端口
//                serverBootstrap.option(ChannelOption.SO_BACKLOG,1024);
//                serverBootstrap.group(group,bossGroup)
//                        .channel(NioServerSocketChannel.class)
//                        .localAddress(port)
//                        .childHandler(new ChannelInitializer<SocketChannel>() {
//                            @Override
//                            protected void initChannel(SocketChannel socketChannel) throws Exception {
//                                log.info("接收新连接："+socketChannel.localAddress());
//                                socketChannel.pipeline()
//                                        .addLast(new HttpServerCodec())
//                                        .addLast(new ChunkedWriteHandler())
//                                        .addLast(new HttpObjectAggregator(8192))
//                                        .addLast(new WebSocketServerProtocolHandler("/ws","WebSocket",true,65536*10))
//                                        .addLast(new ChatWebsocketServerHandler());
//                            }
//                        });
//                ChannelFuture sync = serverBootstrap.bind(port).sync();//服务器异步创建绑定端口
//                sync.channel().closeFuture().sync();
//            }catch (Exception e){
//                e.printStackTrace();
//            }finally {
//                //优雅关闭
//                try {
//                    group.shutdownGracefully().sync();
//                    bossGroup.shutdownGracefully().sync();
//                } catch (InterruptedException e) {
//                    e.printStackTrace();
//                }
//            }
////        }).start();
//
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
