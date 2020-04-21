package com.gxwzu.system.service.sysDuties.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.system.dao.sysDuties.ISysDutiesDao;
import com.gxwzu.system.dao.sysDuties.impl.SysDutiesDaoImpl;
import com.gxwzu.system.model.sysDuties.SysDuties;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.sysTechnical.SysTechnical;
import com.gxwzu.system.service.sysDuties.ISysDutiesService;
@Service("SysDutiesService")
public class SysDutiesServiceImpl extends BaseServiceImpl<SysDuties>implements ISysDutiesService{
       @Autowired
       private ISysDutiesDao SysDutiesDao;
       
	@Override
	public BaseDao<SysDuties> getDao() {
	return this.SysDutiesDao;
	}
	public ISysDutiesDao getSysDutiesDao() {
		return SysDutiesDao;
	}
	public void setSysDutiesDao(ISysDutiesDao sysDutiesDao) {
		SysDutiesDao = sysDutiesDao;
	}
	/**
	 * 列表查询
	 */
	@Override
	public Result<SysDuties> find(SysDuties model, int page, int size) {
		return SysDutiesDao.find(model,page,size);
	}
	@Override
	public SysDuties add(SysDuties model) {
		return SysDutiesDao.save(model);
	}
	@Override
	public SysDuties findById(Integer id) {
		return SysDutiesDao.findById(id);
	}
	@Override
	public  SysDuties edit(SysDuties model) {
	SysDutiesDao.update(model);
	return model;
		
	}
	@Override
	public SysDuties del(Integer id) {
		SysDuties model = SysDutiesDao.findById(id);  
	   	SysDutiesDao.remove(model);
	   	return model;
		
	}
	@Override
	public List<SysDuties> findByExample(SysDuties model) {
		return SysDutiesDao.findByExample(model);
	}
	/*@Override
	public List<SysDuties> findAllSysDutiesList(String dutiesId) {
		return SysDutiesDao.findAllSysDutiesList(dutiesId);
	}*/
	@Override
	public List<SysDuties> findAllSysDutiesList() {
		return SysDutiesDao.findAllSysDutiesList(null);
	}

	@Override
	public SysDuties findByDutiesNo(String dutiesNo) {
		return SysDutiesDao.findByDutiesNo(dutiesNo);
	}

}
