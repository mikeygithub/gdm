package com.gxwzu.system.dao.sysPermission;

import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysPermission.SysPermission;

public interface ISysPermissionDao  extends BaseDao<SysPermission>{
	public Result<SysPermission> find(SysPermission model ,int page,int size);
	 public List<SysPermission> findByExample(SysPermission model);
	 public SysPermission findById(Integer id);
	 public Long delByRoleId(Integer id);
}
