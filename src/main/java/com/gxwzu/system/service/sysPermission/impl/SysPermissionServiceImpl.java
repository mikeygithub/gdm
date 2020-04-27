package com.gxwzu.system.service.sysPermission.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.system.dao.sysPermission.ISysPermissionDao;
import com.gxwzu.system.model.sysPermission.SysPermission;
import com.gxwzu.system.service.sysPermission.ISysPermissionService;

@Service("sysPermissionService")
public class SysPermissionServiceImpl extends BaseServiceImpl<SysPermission> implements ISysPermissionService {
	@Autowired
	private ISysPermissionDao sysPermissionDao;

	public void setSysPermissionDao(ISysPermissionDao sysPermissionDao) {
		this.sysPermissionDao = sysPermissionDao;
	}

	@Override
	public BaseDao<SysPermission> getDao() {

		return this.sysPermissionDao;
	}

	public Result<SysPermission> find(SysPermission model, int page, int size) {
		return sysPermissionDao.find(model, page, size);
	}

	public SysPermission add(SysPermission SysPermission) {
		return sysPermissionDao.save(SysPermission);
	}

	public SysPermission del(Integer id) {
		SysPermission SysPermission = sysPermissionDao.findById(id);
		sysPermissionDao.remove(SysPermission);
		return SysPermission;

	}

	public SysPermission findById(Integer id) {
		return sysPermissionDao.findById(id);
	}

	public SysPermission edit(SysPermission SysPermission) {
		sysPermissionDao.update(SysPermission);
		return SysPermission;
	}

	@Override
	public List<SysPermission> findByExample(SysPermission model) {
		
		return sysPermissionDao.findByExample(model);
	}

	@Override
	public Long delByRoleId(Integer id) {
		return sysPermissionDao.delByRoleId(id);
	}

}
