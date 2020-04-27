package com.gxwzu.system.service.sysCategory.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.dao.sysCategory.ISysCategoryDao;
import com.gxwzu.system.dao.sysClass.ISysClassDao;
import com.gxwzu.system.model.sysCategory.SysCategory;
import com.gxwzu.system.model.sysClass.SysClass;
import com.gxwzu.system.service.sysCategory.ISysCategoryService;

@Service("sysCategroyService")
public class SysCategroyServiceImpl implements ISysCategoryService{


	@Autowired
	private ISysCategoryDao sysCategroyDao;
	
	@Override
	public Result<SysCategory> find(SysCategory model, int page, int row) {
		return sysCategroyDao.find( model,  page,  row);
	}

	/**
	 * 删除大类
	 */
	@Override
	public SysCategory del(Integer id) {
		SysCategory model = sysCategroyDao.findById(id);
		sysCategroyDao.remove(model);
		return model;
	}

	/**
	 * 添加大类
	 */
	@Override
	public SysCategory add(SysCategory model) {
		return sysCategroyDao.save(model);
	}

	@Override
	public SysCategory findById(Integer id) {
		return sysCategroyDao.findById(id);
	}

	@Override
	public SysCategory edit(SysCategory model) {
		sysCategroyDao.update(model);
		 return model;
	}

	@Override
	public List<SysCategory> findByExample(SysCategory model) {
		return sysCategroyDao.findByExample(model);
	}

	@Override
	public List<SysCategory> findAllSysCategoryList() {
		return sysCategroyDao.findAllSysCategoryList();
	}

	/**
	 * 通过院系编号查找大类
	 */
	@Override
	public List<SysCategory> findByDeptNumber(String deptNumber) {
		SysCategory	model = new SysCategory();
		List<SysCategory> list = new ArrayList<SysCategory>();
			model.setDeptNumber(deptNumber);
			list =   sysCategroyDao.findByExample(model);
			if(list==null){
				list =  new ArrayList<SysCategory>();
			}
		return list;
	}
}
