package com.gxwzu.system.service.sysIssueType.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.system.dao.sysIssueType.ISysIssueTypeDao;
import com.gxwzu.system.model.sysIssueType.SysIssueType;
import com.gxwzu.system.service.sysIssueType.ISysIssueTypeService;
@Service("sysIssueTypeService")
public class SysIssueTypeServiceImpl extends BaseServiceImpl<SysIssueType> implements ISysIssueTypeService{
    
	@Autowired
	private ISysIssueTypeDao SysIssueTypeDao;

	@Override
	public BaseDao<SysIssueType> getDao() {
		return   this.SysIssueTypeDao;
	}
	public ISysIssueTypeDao getSysIssueTypeDao() {
		return SysIssueTypeDao;
	}

	public void setSysIssueTypeDao(ISysIssueTypeDao sysIssueTypeDao) {
		SysIssueTypeDao = sysIssueTypeDao;
	}
	
	@Override
	public Result<SysIssueType> find(SysIssueType model, int page, int size) {
		return SysIssueTypeDao.find(model, page, size);
	}

	@Override
	public SysIssueType add(SysIssueType model) {
		return SysIssueTypeDao.save(model);
	}

	@Override
	public SysIssueType findById(Integer id) {
		return SysIssueTypeDao.findById(id);
	}

	@Override
	public SysIssueType edit(SysIssueType model) {
		SysIssueTypeDao.update(model);
		return model;
	}

	@Override
	public SysIssueType del(Integer id) {
		SysIssueType model = SysIssueTypeDao.findById(id);  
		SysIssueTypeDao.remove(model);
	   	return model;
	}

	@Override
	public List<SysIssueType> findByExample(SysIssueType model) {
		return SysIssueTypeDao.findByExample(model);
	}
	@Override
	public List<SysIssueType> findAllSysIssueTypeList(Integer issueTypeId) {
		return SysIssueTypeDao.findAllSysIssueTypeList(issueTypeId);
	}
	@Override
	public List<SysIssueType> findSysIssueTypeListAll() {
		// TODO Auto-generated method stub
		return SysIssueTypeDao.findSysIssueTypeListAll();
	}

}
