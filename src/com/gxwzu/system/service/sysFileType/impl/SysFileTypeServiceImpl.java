package com.gxwzu.system.service.sysFileType.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.model.group.GroupAllot;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListGroupAllot;
import com.gxwzu.system.dao.sysFileType.ISysFileTypeDao;
import com.gxwzu.system.model.sysFileType.SysFileType;
import com.gxwzu.system.service.sysFileType.ISysFileTypeService;


@Service("SysFileTypeService")
public class SysFileTypeServiceImpl extends BaseServiceImpl<SysFileType>implements ISysFileTypeService{
       @Autowired
       private ISysFileTypeDao SysFileTypeDao;
       
	@Override
	public BaseDao<SysFileType> getDao() {
	return this.SysFileTypeDao;
	}
	public ISysFileTypeDao getSysFileTypeDao() {
		return SysFileTypeDao;
	}
	public void setSysFileTypeDao(ISysFileTypeDao SysFileTypeDao) {
		SysFileTypeDao = SysFileTypeDao;
	}
	/**
	 * 列表查询
	 */
	@Override
	public Result<SysFileType> find(SysFileType model, int page, int size) {
		return SysFileTypeDao.find(model,page,size);
	}
	@Override
	public SysFileType add(SysFileType model) {
		return SysFileTypeDao.save(model);
	}
	@Override
	public SysFileType findById(Integer id) {
		return SysFileTypeDao.findById(id);
	}
	@Override
	public  SysFileType edit(SysFileType model) {
	SysFileTypeDao.update(model);
	return model;
		
	}
	@Override
	public SysFileType del(Integer id) {
		SysFileType model = SysFileTypeDao.findById(id);  
	   	SysFileTypeDao.remove(model);
	   	return model;
		
	}
	@Override
	public List<SysFileType> findByExample(SysFileType model) {
		return SysFileTypeDao.findByExample(model);
	}
	@Override
	public List<SysFileType> findAllSysFileTypeList(String fileId) {
		return SysFileTypeDao.findAllSysFileTypeList(fileId);
	}

}
