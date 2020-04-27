package com.gxwzu.system.service.userHelp;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.system.model.userHelp.UserHelp;

public interface IUserHelpService extends BaseService<UserHelp> {
	public Result<UserHelp> find(UserHelp model ,int page,int size);
	public UserHelp del(Integer id);
	public UserHelp  findById(Integer id);
	public UserHelp edit(UserHelp UserHelp);
	public  UserHelp add(UserHelp UserHelp);
	public List<UserHelp> findByExample(UserHelp model);
	 public List<UserHelp> findByNamePawd(UserHelp model);
	 public List<UserHelp> findByLoginName(String loginName);

}
