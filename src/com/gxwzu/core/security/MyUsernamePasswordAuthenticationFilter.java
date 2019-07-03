package com.gxwzu.core.security;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.login.ILoginService;
import com.gxwzu.system.service.userHelp.IUserHelpService;

/**
 * 用户验证登录过滤器
 * 
 * @author he
 * 
 */
public class MyUsernamePasswordAuthenticationFilter extends
		UsernamePasswordAuthenticationFilter {

	public static final String USERNAME = "LoginName";
	public static final String PASSWORD = "Password";
	protected final Log logger = LogFactory.getLog(getClass());
	
	/****************************************************/
	@Autowired
	private ILoginService loginService;
 /****************************************************/
	@Override
	public Authentication attemptAuthentication(HttpServletRequest request,
			HttpServletResponse response) throws AuthenticationException {
		
		if (!request.getMethod().equals("POST")) { // 拦截过滤POST请求
			throw new AuthenticationServiceException("不支持的请求认证的方法: "+ request.getMethod());
		}
		logger.info("登录效验");
		String username = obtainUsername(request);
		String password = obtainPassword(request);
		// 验证用户账号与密码是否对应
		UserHelp us = loginService.findByLoginNamePassword(username, password);

		if (us == null) {
			request.setAttribute("LoginName",username);
			request.setAttribute("Password",password);
			
			throw new AuthenticationServiceException("用户名或者密码错误！");
		}
		
		// UsernamePasswordAuthenticationToken实现 Authentication
		UsernamePasswordAuthenticationToken authRequest =
				new UsernamePasswordAuthenticationToken(username, password);
		// 允许子类设置详细属性
		setDetails(request, authRequest);
		// 运行UserDetailsService的loadUserByUsername 再次封装Authentication
		return this.getAuthenticationManager().authenticate(authRequest);
	}
	
	
	
	/**
	 * 设置编码
	 * @param request
	 * @param response
	 */
	protected void setCharacterEncoding(HttpServletRequest request,
			HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected String obtainUsername(HttpServletRequest request) {
		Object obj = request.getParameter(USERNAME);
		return null == obj ? "" : obj.toString();
	}

	@Override
	protected String obtainPassword(HttpServletRequest request) {
		Object obj = request.getParameter(PASSWORD);
		return null == obj ? "" : obj.toString();
	}

}