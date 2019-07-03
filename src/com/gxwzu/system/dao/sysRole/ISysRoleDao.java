package com.gxwzu.system.dao.sysRole;

import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysRole.SysRole;

public interface ISysRoleDao  extends BaseDao<SysRole>{
	public Result<SysRole> find(SysRole model ,int page,int size);
	 public List<SysRole> findByExample(SysRole model);
	 public SysRole findById(Integer id);

}
