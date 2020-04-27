package com.gxwzu.system.service.login.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.system.dao.login.LoginDao;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.login.ILoginService;

@Service("loginService")
public class LoginServiceImpl extends BaseServiceImpl<UserHelp> implements ILoginService{

	@Autowired
	private LoginDao loginDao;
	
	@Override
	public BaseDao<UserHelp> getDao() {
		return loginDao;
	}

	@Override
	public UserHelp findByLoginNamePassword(String loginName,String password) {
		List<UserHelp> userHelps =  loginDao.findByLoginName(loginName);
		if(userHelps!=null&&userHelps.size()>0&&userHelps.get(0).getPassword().equals(password)){
			return userHelps.get(0);
		}
		return null;
	}

	
}
