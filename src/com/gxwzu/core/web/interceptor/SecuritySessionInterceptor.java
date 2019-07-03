package com.gxwzu.core.web.interceptor;

import com.gxwzu.core.util.SysConstant;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
/**
 * session 失效拦截
 * @author MR.AMU
 * @version 1.0
 * @since 2014-
 *
 */
public class SecuritySessionInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 14542323232L;

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		Object grant = ActionContext.getContext().getSession().get(SysConstant.GRANT);
		if(grant!=null){
			return arg0.invoke(); 
		}
		return SysConstant.LOGOUT;
	}

}
