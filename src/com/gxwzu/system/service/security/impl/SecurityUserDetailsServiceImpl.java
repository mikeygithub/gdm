package com.gxwzu.system.service.security.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.system.dao.userHelp.IUserHelpDao;
import com.gxwzu.system.model.sysPermission.SysPermission;
import com.gxwzu.system.model.sysRole.SysRole;
import com.gxwzu.system.model.userHelp.UserHelp;

/**
 * 安全框架加载用户信息 1.缓存用户信息 2.获取用户角色权限
 * 
 * @author he
 * 
 */
@Service("securityUserDetailsService")
public class SecurityUserDetailsServiceImpl extends BaseServiceImpl<UserHelp>
		implements UserDetailsService {
	protected final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private IUserHelpDao userHelpDao;

	public void setUserHelpDao(IUserHelpDao userHelpDao) {
		this.userHelpDao = userHelpDao;
	}

	@Override
	public BaseDao<UserHelp> getDao() {

		return this.userHelpDao;
	}

	private UserHelp userHelp;

	/**
	 * 通过MyUsernamePasswordAuthenticationFilter拦截器登录验证成功 才执行
	 * 1.加载用户信息到security框架缓存中
	 * 
	 * @param 用户登录名
	 */
	@Override
	public UserDetails loadUserByUsername(String name)
			throws UsernameNotFoundException, DataAccessException {

		UserDetails user = null;
		try {
			userHelp = new UserHelp();
			userHelp.setLoginName(name);
			List<UserHelp> userHelps = userHelpDao.findByExample(userHelp);
			if (userHelps != null && userHelps.size() > 0) {
				userHelp = userHelps.get(0);
			}
			return new User(userHelp.getLoginName(), userHelp.getPassword()
					.toLowerCase(), true, true, true, true, getAuthorities());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	/**
	 * 2.获得访问角色权限
	 * 
	 * @param access
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public Collection<GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
		List<SysRole> roles = userHelp.getSysRoleList();

		for (SysRole sysRole : roles)
			for (SysPermission sysPermission : sysRole.getPermissionList()) {
				authList.add(new GrantedAuthorityImpl(sysPermission
						.getResource()));
			}

		return authList;
	}

}
