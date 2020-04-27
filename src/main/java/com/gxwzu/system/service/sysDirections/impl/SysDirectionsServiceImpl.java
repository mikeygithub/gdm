package com.gxwzu.system.service.sysDirections.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.system.dao.sysDirections.ISysDirectionsDao;
import com.gxwzu.system.model.sysDirections.SysDirections;
import com.gxwzu.system.service.sysDirections.ISysDirectionsService;

@SuppressWarnings("unchecked")
@Service("sysDirectionsService")
public class SysDirectionsServiceImpl extends BaseServiceImpl<SysDirections> implements ISysDirectionsService{

	@Autowired
	private ISysDirectionsDao sysDirectionsDao;
	
	@Override
	public Result<SysDirections> find(SysDirections model, int page, int size) {
		return sysDirectionsDao.find(model,page,size);
	}

	@Override
	public BaseDao<SysDirections> getDao() {
		return this.sysDirectionsDao;
	}

	@Override
	public SysDirections add(SysDirections model) {
		return sysDirectionsDao.save(model);
	}

	@Override
	public SysDirections findById(Integer id) {
		return sysDirectionsDao.findById(id);
	}

	@Override
	public SysDirections edit(SysDirections sysDirections) {
		 sysDirectionsDao.update(sysDirections);
		return sysDirections;
		 
	}

	@Override
	public SysDirections del(Integer id) {
		SysDirections model = sysDirectionsDao.findById(id);
		sysDirectionsDao.remove(model);
		return model;
	}

	@Override
	public List<SysDirections> findByExample(SysDirections model) {

		return sysDirectionsDao.findByExample(model);
	}

	@Override
	public List<SysDirections> findAll() {
		return sysDirectionsDao.getAll(SysDirections.class);
	}
}
