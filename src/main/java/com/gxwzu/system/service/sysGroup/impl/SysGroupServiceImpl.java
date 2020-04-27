package com.gxwzu.system.service.sysGroup.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.system.dao.sysGroup.ISysGroupDao;
import com.gxwzu.system.model.sysGroup.SysGroup;
import com.gxwzu.system.service.sysGroup.ISysGroupService;

@Service("sysGroupService")
public class SysGroupServiceImpl extends BaseServiceImpl<SysGroup> implements ISysGroupService {
	@Autowired
	private ISysGroupDao sysGroupDao;

	public void setSysGroupDao(ISysGroupDao sysGroupDao) {
		this.sysGroupDao = sysGroupDao;
	}

	@Override
	public BaseDao<SysGroup> getDao() {

		return this.sysGroupDao;
	}

	public Result<SysGroup> find(SysGroup model, int page, int size) {
		return sysGroupDao.find(model, page, size);
	}

	public SysGroup add(SysGroup model) {
		return sysGroupDao.save(model);
	}

	public SysGroup del(Integer id) {
		SysGroup model = sysGroupDao.findById(id);
		sysGroupDao.remove(model);
		return model;

	}

	public SysGroup findById(Integer id) {
		return sysGroupDao.findById(id);
	}

	public SysGroup edit(SysGroup model) {
		sysGroupDao.update(model);
		return model;
	}

	@Override
	public List<SysGroup> findByExample(SysGroup model) {
		
		return sysGroupDao.findByExample(model);
	}

}
