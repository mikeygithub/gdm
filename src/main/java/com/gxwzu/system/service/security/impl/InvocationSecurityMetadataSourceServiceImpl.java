package com.gxwzu.system.service.security.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.system.dao.sysPermission.ISysPermissionDao;
import com.gxwzu.system.model.sysPermission.SysPermission;
import com.gxwzu.system.model.sysRole.SysRole;
import com.gxwzu.system.service.security.IInvocationSecurityMetadataSourceService;
import com.gxwzu.system.service.sysPermission.ISysPermissionService;

/**
 * 获取系统资源和权限
 * 
 * @author he
 * 
 */
@Service("invocationSecurityMetadataSourceService")
public class InvocationSecurityMetadataSourceServiceImpl extends
		BaseServiceImpl<SysPermission> implements
		IInvocationSecurityMetadataSourceService,
		FilterInvocationSecurityMetadataSource {
	protected final Log logger = LogFactory.getLog(getClass());
	@Autowired
	private ISysPermissionDao sysPermissionDao;

	@Override
	public BaseDao<SysPermission> getDao() {
		return this.sysPermissionDao;
	}

	/**
	 * 加载系统当前资源拥有的权限
	 */
	@Override
	public Collection<ConfigAttribute> getAttributes(Object object)
			throws IllegalArgumentException {
		
		String url = ((FilterInvocation) object).getRequestUrl();
		int firstQuestionMarkIndex = url.indexOf("?");
		
		if (firstQuestionMarkIndex != -1) {
			url = url.substring(0, firstQuestionMarkIndex);
		}
		if (firstQuestionMarkIndex != -1) {
			url = url.substring(0, firstQuestionMarkIndex);
		}
		
		System.out.println("url:\n" + url);
		List<ConfigAttribute> result = new ArrayList<ConfigAttribute>();
		try {
			SysPermission sysPermission = new SysPermission();
			sysPermission.setResource(url);

			List<SysPermission> permList = sysPermissionDao.findByExample(sysPermission);
			for (SysPermission permission : permList) {
					ConfigAttribute conf = new SecurityConfig(permission.getResource());
					result.add(conf);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		return null;
	}

	@Override
	public boolean supports(Class<?> arg0) {
		return true;
	}

}