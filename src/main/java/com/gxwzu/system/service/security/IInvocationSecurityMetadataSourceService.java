package com.gxwzu.system.service.security;


import java.util.ArrayList;  
import java.util.Collection;  
import java.util.List;  
 








import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;  
import org.springframework.security.access.SecurityConfig;  
import org.springframework.security.web.FilterInvocation;  
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;  

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.system.model.sysPermission.SysPermission;
import com.gxwzu.system.model.sysRole.SysRole;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysPermission.ISysPermissionService;

 
/**
 * 资源和权限
 * @author he
 *
 */
public interface IInvocationSecurityMetadataSourceService  extends BaseService<SysPermission> {  
	

}  