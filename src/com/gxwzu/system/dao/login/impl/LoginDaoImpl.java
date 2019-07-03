package com.gxwzu.system.dao.login.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.system.dao.login.LoginDao;
import com.gxwzu.system.model.userHelp.UserHelp;

@SuppressWarnings("unchecked")
@Repository("loginDao")
public class LoginDaoImpl extends BaseDaoImpl<UserHelp> implements LoginDao {

	@Override
	public List<UserHelp> findByLoginName(String loginName) {
			List<Object> params = new ArrayList<Object>();
			List<UserHelp> list = new ArrayList<UserHelp>();
			if(StringUtils.isNotEmpty(loginName)){
				String queryString = "from UserHelp model where model.loginName=?";
				params.add(loginName);
				list = super.findByExample(queryString, params.toArray());
			}
			return  list;
	}

}
