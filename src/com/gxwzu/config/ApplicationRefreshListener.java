//package com.gxwzu.config;
//
//import com.google.common.util.concurrent.ThreadFactoryBuilder;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.ApplicationListener;
//import org.springframework.context.event.ContextStartedEvent;
//import org.springframework.stereotype.Component;
//
//import javax.annotation.PostConstruct;
//import javax.annotation.PreDestroy;
//import java.util.concurrent.*;
//
///**
// * @ProjectName gdm
// * @Author 麦奇
// * @Email biaogejiushibiao@outlook.com
// * @Date 4/26/20 8:03 PM
// * @Version 1.0
// * @Title: ApplicationRefreshListener
// * @Description:
// **/
//@Component
//public class ApplicationRefreshListener implements ApplicationListener<ContextStartedEvent> {
//
//    private static final Logger LOG = LoggerFactory.getLogger(ApplicationRefreshListener.class);
//
//    private ExecutorService webSocketSinglePool;
//
//    @PostConstruct
//    public void setup() {
//        ThreadFactory namedThreadFactory = new ThreadFactoryBuilder().setNameFormat("webSocketSinglePool-%d").build();
//        webSocketSinglePool = new ThreadPoolExecutor(1, 1, 0L, TimeUnit.MILLISECONDS, new LinkedBlockingQueue<>(1024), namedThreadFactory, new ThreadPoolExecutor.AbortPolicy());
//        LOG.info("webSocketSinglePool init.");
//    }
//
//    private void runWebSocketServer(ApplicationContext applicationContext) {
//        LOG.error("启动Netty...");
//        final ChatWebsocketServer webSocketServer = applicationContext.getBean(ChatWebsocketServer.class);
//        webSocketSinglePool.execute(() -> {
//            try {
//                webSocketServer.init();
//            } catch (Exception e) {
//                LOG.error("webSocket listen and serve error.", e);
//            }
//        });
//    }
//
//    @PreDestroy
//    public void cleanup() {
//        webSocketSinglePool.shutdown();
//        LOG.info("webSocketSinglePool destroyed.");
//    }
//
//    @Override
//    public void onApplicationEvent(ContextStartedEvent contextStartedEvent) {
//        runWebSocketServer(contextStartedEvent.getApplicationContext());
//    }
//}
