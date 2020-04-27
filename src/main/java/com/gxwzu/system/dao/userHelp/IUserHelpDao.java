package com.gxwzu.system.dao.userHelp;

import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.userHelp.UserHelp;

public interface IUserHelpDao  extends BaseDao<UserHelp>{
	public Result<UserHelp> find(UserHelp model ,int page,int size);
	 public List<UserHelp> findByExample(UserHelp model);
	 public List<UserHelp> findByNamePawd(UserHelp model);
	 public UserHelp findById(Integer id);
	 public List<UserHelp> findByLoginName(String loginName);
}
