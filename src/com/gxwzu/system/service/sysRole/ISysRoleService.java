package com.gxwzu.system.service.sysRole;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.system.model.sysRole.SysRole;
import com.gxwzu.system.model.userHelp.UserHelp;

public interface ISysRoleService extends BaseService<SysRole> {
	public Result<SysRole> find(SysRole model ,int page,int size);
	public SysRole del(Integer id);
	public SysRole  findById(Integer id);
	public SysRole edit(SysRole SysRole);
	public  SysRole add(SysRole SysRole);
	public List<SysRole> findByExample(SysRole model);
	/**
	 * 查询角色用户列表
	 * @param model
	 * @param page
	 * @param size
	 * @return
	 */
	public Result<UserHelp> findUserRoleList(SysRole model ,int page,int size);

}
