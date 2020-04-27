package com.gxwzu.system.service.sysPermission;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.system.model.sysPermission.SysPermission;

public interface ISysPermissionService extends BaseService<SysPermission> {
	public Result<SysPermission> find(SysPermission model ,int page,int size);
	public SysPermission del(Integer id);
	public SysPermission  findById(Integer id);
	public SysPermission edit(SysPermission SysPermission);
	public  SysPermission add(SysPermission SysPermission);
	public List<SysPermission> findByExample(SysPermission model);
	 public Long delByRoleId(Integer id);
}