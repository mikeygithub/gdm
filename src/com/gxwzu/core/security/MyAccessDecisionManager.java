package com.gxwzu.core.security;


import java.util.Collection;  
import java.util.Iterator;  
 


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.springframework.security.access.AccessDecisionManager;  
import org.springframework.security.access.AccessDeniedException;  
import org.springframework.security.access.ConfigAttribute;  
import org.springframework.security.access.SecurityConfig;  
import org.springframework.security.authentication.InsufficientAuthenticationException;  
import org.springframework.security.core.Authentication;  
import org.springframework.security.core.GrantedAuthority;  
 /**
  * 决策管理器
  * @author he
  *
  */
public class MyAccessDecisionManager implements AccessDecisionManager {  
	 protected final Log logger = LogFactory.getLog(getClass());
   @Override  
   public void decide(Authentication authentication, Object object,  
           Collection<ConfigAttribute> configAttributes)  
           throws AccessDeniedException, InsufficientAuthenticationException {  
	   logger.info("决策管理"+configAttributes+authentication.getAuthorities());
      
	   if( configAttributes == null ) {  
		   
           return ;  
       }  
	   
       Iterator<ConfigAttribute> ite = configAttributes.iterator();  
         
       //权限比较
       while( ite.hasNext()){  
           ConfigAttribute ca = ite.next();  
           String needRole = ((SecurityConfig)ca).getAttribute();  
           for( GrantedAuthority ga: authentication.getAuthorities()){ 
        	  
               if(needRole.trim().equals(ga.getAuthority().trim())){
            logger.info("决策通过");  	   
                   return;  
               }  
           }  
           
       }  
     
       throw new AccessDeniedException("无权限！"); 
 
   }  
 
   @Override  
   public boolean supports(ConfigAttribute attribute) {  
       return true;  
   }  
 
   @Override  
   public boolean supports(Class<?> clazz) {  
       return true;  
   }  
 
}  
