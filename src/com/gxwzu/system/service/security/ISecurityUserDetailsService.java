package com.gxwzu.system.service.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.GrantedAuthority;  
import org.springframework.stereotype.Service;

import com.gxwzu.core.service.BaseService;
import com.gxwzu.system.model.sysPermission.SysPermission;
import com.gxwzu.system.model.sysRole.SysRole;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.userHelp.IUserHelpService;
import com.opensymphony.xwork2.interceptor.annotations.Allowed;


public interface ISecurityUserDetailsService extends BaseService<UserHelp> {
	 

}
