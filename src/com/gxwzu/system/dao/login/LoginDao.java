package com.gxwzu.system.dao.login;


import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.system.model.userHelp.UserHelp;

/**
 * 登录dao
 * @author he
 *
 */
public interface LoginDao extends BaseDao<UserHelp>  {

	/**
	 * 通过loginName查询
	 * @param nameloginName
	 * @return
	 */
	public List<UserHelp> findByLoginName(String loginName);
	
}
