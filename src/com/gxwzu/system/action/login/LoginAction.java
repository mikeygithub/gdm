package com.gxwzu.system.action.login;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextImpl;

import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.util.SysConstant;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.system.model.sysMenu.SysMenu;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.login.ILoginService;
import com.gxwzu.system.service.sysMenu.ISysMenuService;
import com.gxwzu.system.service.userHelp.IUserHelpService;

/**
 * 登陆
 * 
 * @author liqing
 * @version 1.0 <br>
 *          Copyright (C), 2015, 梧州学院 软件研发中心 <br>
 *          This program is protected by copyright laws. <br>
 *          Program Name: LoginAction <br>
 *          Date: 2015-8-28下午06:39:24 <br>
 *          log:1.创建登陆方法类（liqing）
 */
public class LoginAction extends BaseAction {

	private static final long serialVersionUID = -2874663229964813880L;

	protected final Log logger = LogFactory.getLog(getClass());

	private static final String VIEW = "view";

	/*********************** 注入Service ******************************/
	@Autowired
	private ILoginService loginService;
	@Autowired
	private IUserHelpService userHelpService;
	@Autowired
	private ISysMenuService sysMenuService ;
	/*********************** 参数列表 ******************************/
	private List<SysMenu> menuList = new ArrayList<SysMenu>(); //左侧菜单
	
	
	/************************** 方法类Start **************************/
	/**
	 * 安全框架登录
	 */
	@Override
	public String execute() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
		SecurityContextImpl securityContextImpl = (SecurityContextImpl) request
				.getSession().getAttribute(
						SystemContext.SPRING_SECURITY_CONTEXT);
		if (securityContextImpl != null) {
			String name = securityContextImpl.getAuthentication().getName();

			UserHelp user = new UserHelp();
			user.setLoginName(name);

			List<UserHelp> listAdmin = userHelpService.findByExample(user);
			if (listAdmin.size() > 0) {
				UserHelp userHelp = listAdmin.get(0);
				getSession().setAttribute(SystemContext.USERID,
						userHelp.getId()); // 用户id
				getSession().setAttribute(SystemContext.USERNAME,
						userHelp.getUserName()); // 用户姓名
				getSession().setAttribute(SystemContext.LOGINNAME,
						userHelp.getLoginName()); // 用户登录名
				getSession().setAttribute(SystemContext.USERTYPE,
						userHelp.getUserType()); // 用户类型
				
				getSession().setAttribute(SysConstant.GRANT, SysConstant.GRANT);
				
			}
		}
		return SUCCESS;
	}

	/**
	 * 登陆
	 * 
	 * @return
	 * @throws Exception
	 * @log：1.创建方法（mengyiwen）
	 */
	public String login() throws Exception {
	
		try {
			String LoginName = getParameters("LoginName");
			String Password = getParameters("Password");
			if (null != LoginName && !"".equals(LoginName) && null != Password
					&& !"".equals(Password)) {
				UserHelp user = new UserHelp();
				user.setLoginName(LoginName);
				user.setPassword(Password);
				List<UserHelp> listAdmin = userHelpService.findByExample(user);

				if (!listAdmin.isEmpty()) {// 登录成功
					UserHelp userHelp = listAdmin.get(0);
					getSession().setAttribute("HQ_USERID", userHelp.getId()); // 用户id
					getSession().setAttribute("HQ_USERNAME",userHelp.getUserName()); // 用户姓名
					getSession().setAttribute("HQ_USERTEL", userHelp.getUserTel());// 用户电话号码
//					getSession().setAttribute("HQ_USERDEPART",userHelp.getDepartment().getDeptName()); // 所在部门
					getSession().setAttribute(SysConstant.GRANT,SysConstant.GRANT);

					return SUCCESS;

				} else {
					return errorHint(LoginName, Password, "用户名或密码错误");
				}
			} else {
				return errorHint(LoginName, Password, "用户名或密码不能为空");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return VIEW;
	
	}

	/**
	 * 错误提示
	 * 
	 * @param loginName
	 *            登陆账号
	 * @param password
	 *            密码
	 * @param errorInfo
	 *            错误提示信息
	 * @return
	 */
	@SuppressWarnings("unused")
	private String errorHint(String loginName, String password, String errorInfo) {
		getRequest().setAttribute("LoginName", loginName);
		getRequest().setAttribute("Password", password);
		getRequest().setAttribute("errorInfo", errorInfo);
		return LOGOUT;
	}

	/**
	 * 系统页面跳转
	 * 
	 * @return
	 * @throws Exception
	 */
	public String view() throws Exception {
		if (null != getSession().getAttribute(SystemContext.USERID)) {
			
			if("left".equals(view)){
				menuList = sysMenuService.findByExample(new SysMenu());
			}
			return VIEW;
		} else {
			return ERROR;
		}
	}

	public String toIndex() {
		return "toIndex";
	}


	/**
	 * 退出
	 * 
	 * @return
	 * @throws Exception
	 * @log：1.创建方法（liqing）
	 */
	public String logout() throws Exception {
		getSession().removeAttribute(SystemContext.USERID); // 用户ID
		getSession().removeAttribute(SystemContext.USERNAME); // 用户姓名
		getSession().removeAttribute(SystemContext.LOGINNAME); // 用户登录名
		getSession().removeAttribute(SystemContext.USERTYPE); // 用户电话号码
		getSession().removeAttribute(SysConstant.GRANT);
		return LOGOUT;
	}
	/************************** 方法类End **************************/



	/**************** 参数的getter和setter方法Start ****************/
	public List<SysMenu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<SysMenu> menuList) {
		this.menuList = menuList;
	}
}
