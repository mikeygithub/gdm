//package com.gxwzu.config;
//
//import com.google.common.util.concurrent.ThreadFactoryBuilder;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.ApplicationListener;
//import org.springframework.context.event.ContextStartedEvent;
//import org.springframework.web.context.WebApplicationContext;
//import org.springframework.web.context.support.WebApplicationContextUtils;
//
//import javax.annotation.PostConstruct;
//import javax.annotation.PreDestroy;
//import javax.servlet.ServletContextEvent;
//import javax.servlet.ServletContextListener;
//import javax.servlet.annotation.WebListener;
//import java.util.Calendar;
//import java.util.concurrent.*;
//
///**
// * @ProjectName gdm
// * @Author 麦奇
// * @Email biaogejiushibiao@outlook.com
// * @Date 4/26/20 8:27 PM
// * @Version 1.0
// * @Title: NettyServerListener
// * @Description:
// **/
//
//@WebListener
//public class NettyServerListener implements ApplicationListener<ContextStartedEvent>,ServletContextListener
//{
//    private static final Logger log= LoggerFactory.getLogger(NettyServerListener.class);
//    private ExecutorService webSocketSinglePool;
//    private  ChatWebsocketServer chatWebsocketServer= null;
//    @Override
//    public void contextInitialized(ServletContextEvent sce) {
//        log.info("tomcat is going start");
//        WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
//        log.info("chatWebsocketServer is ready");
//
//        chatWebsocketServer = context.getBean(ChatWebsocketServer.class);
//
//        Thread t=Thread.currentThread();
//        log.info("run() of netty"+ Calendar.getInstance().getTime()+"___"+t.getName()+"  flag:"+(null==chatWebsocketServer));
//        webSocketSinglePool.execute(() -> {
//            try {
//                log.info("running......");
//                chatWebsocketServer.init();
//            } catch (Exception e) {
//                log.error("webSocket listen and serve error.", e);
//            }
//            //在这儿启动netty会阻塞tomcat
//            // new Thread(()->echoServer.run()).run();
//        });
//    }
//    @Override
//    public void contextDestroyed(ServletContextEvent sce) {
//        log.info("tomcat is deading");
//        log.info("destroy() of netty"+ Calendar.getInstance().getTime()+"  flag:"+(null==chatWebsocketServer));
////        new Thread(()-> {
////            try {
////                chatWebsocketServer.destroy();
////            } catch (Exception e) {
////                e.printStackTrace();
////            }
////        }).run();
//    }
//
//    @PostConstruct
//    public  void setup() {
//        ThreadFactory namedThreadFactory = new ThreadFactoryBuilder()
//                .setNameFormat("webSocketSinglePool-%d").build();
//        webSocketSinglePool = new ThreadPoolExecutor(1, 1, 0L,
//                TimeUnit.MILLISECONDS, new LinkedBlockingQueue<>(1024),
//                namedThreadFactory, new ThreadPoolExecutor.AbortPolicy());
//        log.info("webSocketSinglePool init.");
//    }
//
//    @Override
//    public void onApplicationEvent(ContextStartedEvent event) {
//        log.info("监听到事件了");
//        runWebSocketServer(event.getApplicationContext());
//    }
//
//    private void runWebSocketServer(ApplicationContext applicationContext) {
//        final ChatWebsocketServer webSocketServer = applicationContext.getBean(ChatWebsocketServer.class);
//        new Thread(() -> {
//            try { //开始启动netty服务
//                log.info("ready to start Netty");
//                webSocketServer.init();
//            } catch (Exception e) {
//                log.error("webSocket listen and serve error.", e);
//            }
//        }).run();
//    }
//    @PreDestroy
//    public void  cleanup(){
//        webSocketSinglePool.shutdown();
//        log.info("webSocketSinglePool destroyed.");
//    }
//
//}
