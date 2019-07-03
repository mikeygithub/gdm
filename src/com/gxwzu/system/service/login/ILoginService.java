package com.gxwzu.system.service.login;

import com.gxwzu.core.service.BaseService;
import com.gxwzu.system.model.userHelp.UserHelp;

public interface ILoginService extends BaseService<UserHelp> {
	
	/**
	 * 登录效验
	 * @param loginName
	 * @param password
	 * @return
	 */
	public UserHelp findByLoginNamePassword(String loginName,String password);
}
