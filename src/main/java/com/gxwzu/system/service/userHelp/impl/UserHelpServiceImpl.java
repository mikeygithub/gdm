package com.gxwzu.system.service.userHelp.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.system.dao.userHelp.IUserHelpDao;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.userHelp.IUserHelpService;

@Service("userHelpService")
public class UserHelpServiceImpl extends BaseServiceImpl<UserHelp> implements IUserHelpService {
	@Autowired
	private IUserHelpDao UserHelpDao;

	public void setUserHelpDao(IUserHelpDao UserHelpDao) {
		this.UserHelpDao = UserHelpDao;
	}

	@Override
	public BaseDao<UserHelp> getDao() {

		return this.UserHelpDao;
	}
	
	public Result<UserHelp> find(UserHelp model, int page, int size) {
		Result<UserHelp> newResultUserHelp = new Result<UserHelp>();
		Result<UserHelp> oldResultUserHelp = UserHelpDao.find(model, page, size);
		// 先写入Result的基本数据
		newResultUserHelp.setOffset(oldResultUserHelp.getOffset());
		newResultUserHelp.setPage(oldResultUserHelp.getPage());
		newResultUserHelp.setSize(oldResultUserHelp.getSize());
		newResultUserHelp.setTotal(oldResultUserHelp.getTotal());
		newResultUserHelp.setTotalPage(oldResultUserHelp.getTotalPage());

		List<UserHelp> listUserHelp = new ArrayList<UserHelp>();
		for (int i = 0; i < oldResultUserHelp.getData().size(); i++) {
			UserHelp UserHelp = new UserHelp();
			UserHelp thisUserHelp = oldResultUserHelp.getData().get(i);
			UserHelp.setUserName(thisUserHelp.getUserName());
			UserHelp.setLoginName(thisUserHelp.getLoginName());
			UserHelp.setUserType(thisUserHelp.getUserType());
			UserHelp.setOpTime(thisUserHelp.getOpTime());
			UserHelp.setId(thisUserHelp.getId());
			UserHelp.setSysRoleList(thisUserHelp.getSysRoleList());
			UserHelp.setSysRoles(thisUserHelp.getSysRoles());
			listUserHelp.add(UserHelp);
		}
		newResultUserHelp.setData(listUserHelp);
		return newResultUserHelp;
	}

	public UserHelp add(UserHelp model) {
		return UserHelpDao.save(model);
	}

	public UserHelp del(Integer id) {
		UserHelp model = UserHelpDao.findById(id);
		UserHelpDao.remove(model);
		return model;

	}

	public UserHelp findById(Integer id) {
		return UserHelpDao.findById(id);
	}

	public UserHelp edit(UserHelp model) {
		UserHelpDao.update(model);
		return model;
	}

	@Override
	public List<UserHelp> findByExample(UserHelp model) {
		
		return UserHelpDao.findByExample(model);
	}

	@Override
	public List<UserHelp> findByNamePawd(UserHelp model) {

		return UserHelpDao.findByNamePawd(model);
	}

	@Override
	public List<UserHelp> findByLoginName(String loginName) {
		return UserHelpDao.findByLoginName(loginName);
	}

}
