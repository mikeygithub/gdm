package com.gxwzu.system.service.sysOperation.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.system.dao.sysOperation.ISysOperationDao;
import com.gxwzu.system.model.sysOperation.SysOperation;
import com.gxwzu.system.service.sysOperation.ISysOperationService;

@Service("sysOperationService")
public class SysOperationServiceImpl extends BaseServiceImpl<SysOperation> implements ISysOperationService {
	@Autowired
	private ISysOperationDao sysOperationDao;

	@Override
	public BaseDao<SysOperation> getDao() {

		return this.sysOperationDao;
	}

	public Result<SysOperation> find(SysOperation model, int page, int size) {
		return sysOperationDao.find(model, page, size);
	}

	public SysOperation add(SysOperation model) {
		return sysOperationDao.save(model);
	}

	public SysOperation del(Integer id) {
		SysOperation model = sysOperationDao.findById(id);
		sysOperationDao.remove(model);
		return model;

	}

	public SysOperation findById(Integer id) {
		return sysOperationDao.findById(id);
	}

	public SysOperation edit(SysOperation model) {
		sysOperationDao.update(model);
		return model;
	}

	@Override
	public List<SysOperation> findByExample(SysOperation model) {
		return sysOperationDao.findByExample(model);
	}

}
