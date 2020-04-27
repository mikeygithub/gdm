package com.gxwzu.system.service.sysMenu.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.system.dao.sysMenu.ISysMenuDao;
import com.gxwzu.system.model.sysMenu.SysMenu;
import com.gxwzu.system.service.sysMenu.ISysMenuService;

@Service("sysMenuService")
public class SysMenuServiceImpl extends BaseServiceImpl<SysMenu> implements ISysMenuService {
	@Autowired
	private ISysMenuDao sysMenuDao;

	@Override
	public BaseDao<SysMenu> getDao() {

		return this.sysMenuDao;
	}

	public Result<SysMenu> find(SysMenu model, int page, int size) {
		return sysMenuDao.find(model, page, size);
	}

	public SysMenu add(SysMenu model) {
		return sysMenuDao.save(model);
	}

	public SysMenu del(Integer id) {
		SysMenu model = sysMenuDao.findById(id);
		sysMenuDao.remove(model);
		return model;

	}

	public SysMenu findById(Integer id) {
		return sysMenuDao.findById(id);
	}

	public SysMenu edit(SysMenu model) {
		sysMenuDao.update(model);
		return model;
	}

	@Override
	public List<SysMenu> findByExample(SysMenu model) {
		return sysMenuDao.findByExample(model);
	}

}
