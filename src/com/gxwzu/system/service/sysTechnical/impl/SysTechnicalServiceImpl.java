package com.gxwzu.system.service.sysTechnical.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.system.dao.sysTeacher.ISysTeacherDao;
import com.gxwzu.system.dao.sysTechnical.ISysTechnicalDao;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.model.sysTechnical.SysTechnical;
import com.gxwzu.system.service.sysTechnical.ISysTechnicalService;
@Service("sysTechnicalService")
public class SysTechnicalServiceImpl extends BaseServiceImpl<SysTechnical> implements ISysTechnicalService {
	
	@Autowired
	private ISysTechnicalDao sysTechnicalDao;
	
	@Override
	public BaseDao<SysTechnical> getDao() {
		return this.sysTechnicalDao;
	}
	
	@Override
	public Result<SysTechnical> find(SysTechnical model, int page, int size) {
		return sysTechnicalDao.find(model, page, size);
	}

	@Override
	public SysTechnical add(SysTechnical sysTechnical) {
		return sysTechnicalDao.save(sysTechnical);
	}

	@Override
	public SysTechnical findById(Integer id) {
		return sysTechnicalDao.findById(id);
	}

	@Override
	public SysTechnical del(Integer id) {
		SysTechnical model = sysTechnicalDao.findById(id);
		sysTechnicalDao.remove(model);
		return model;
	}

	@Override
	public SysTechnical edit(SysTechnical model) {
		sysTechnicalDao.update(model);
		return model;
	}

	@Override
	public SysTechnical findByName(String technicalName) {
		return sysTechnicalDao.findByName(technicalName);
	}

	@Override
	public List<SysTechnical> findAllSysTechnicalList() {
		return sysTechnicalDao.findAllSysTechnicalList();
	}

	@Override
	public List<SysTechnical> findByExample(SysTechnical model) {
	    
		return sysTechnicalDao.findByExample(model);
	}

	
	
}
