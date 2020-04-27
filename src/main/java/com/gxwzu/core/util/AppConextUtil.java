package com.gxwzu.core.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * 从SPRING 容器中
 * @author MR.AB
 * @version 1.0
 * @since 2013-6-19
 */

public class AppConextUtil implements ApplicationContextAware {
    private static ApplicationContext ContextCfg;
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		ContextCfg =context;
	}
	public static Object getBean(String beanName){

		return ContextCfg.getBean(beanName);
	}

}
