package com.gxwzu.system.service.sysRole.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.system.dao.sysRole.ISysRoleDao;
import com.gxwzu.system.model.sysRole.SysRole;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysRole.ISysRoleService;

@Service("sysRoleService")
public class SysRoleServiceImpl extends BaseServiceImpl<SysRole> implements ISysRoleService {
	@Autowired
	private ISysRoleDao sysRoleDao;

	public void setSysRoleDao(ISysRoleDao sysRoleDao) {
		this.sysRoleDao = sysRoleDao;
	}

	@Override
	public BaseDao<SysRole> getDao() {

		return this.sysRoleDao;
	}

	public Result<SysRole> find(SysRole model, int page, int size) {
		Result<SysRole> newResultSysRole = new Result<SysRole>();
		Result<SysRole> oldResultSysRole = sysRoleDao.find(model, page, size);
		// 先写入Result的基本数据
		newResultSysRole.setOffset(oldResultSysRole.getOffset());
		newResultSysRole.setPage(oldResultSysRole.getPage());
		newResultSysRole.setSize(oldResultSysRole.getSize());
		newResultSysRole.setTotal(oldResultSysRole.getTotal());
		newResultSysRole.setTotalPage(oldResultSysRole.getTotalPage());

		List<SysRole> listSysRole = new ArrayList<SysRole>();
		for (int i = 0; i < oldResultSysRole.getData().size(); i++) {
			SysRole sysRole = new SysRole();
			SysRole thisSysRole = oldResultSysRole.getData().get(i);
			sysRole.setRoleName(thisSysRole.getRoleName());
			sysRole.setDescription(thisSysRole.getDescription());
			sysRole.setPermissions(thisSysRole.getPermissions());
			sysRole.setPermissionList(thisSysRole.getPermissionList());
			sysRole.setId(thisSysRole.getId());
			sysRole.setUserHelps(thisSysRole.getUserHelps());
			listSysRole.add(sysRole);
		}
		newResultSysRole.setData(listSysRole);
		return newResultSysRole;
	}

	public SysRole add(SysRole model) {
		return sysRoleDao.save(model);
	}

	public SysRole del(Integer id) {
		SysRole model = sysRoleDao.findById(id);
		sysRoleDao.remove(model);
		return model;

	}

	public SysRole findById(Integer id) {
		return sysRoleDao.findById(id);
	}

	public SysRole edit(SysRole model) {
		sysRoleDao.update(model);
		return model;
	}

	@Override
	public List<SysRole> findByExample(SysRole model) {
		
		return sysRoleDao.findByExample(model);
	}

	@Override
	public Result<UserHelp> findUserRoleList(SysRole model, int page, int size) {
		int start=(page-1)*size;
		int sCount = start;
		int eCount = start+size;
		
		model  = sysRoleDao.findById(model.getId());
		Result<UserHelp> newResult = new Result<UserHelp>();
		List<UserHelp> userHelps = model.getUserHelpList();
		
		// 写入Result的基本数据
		newResult.setOffset(start);
		newResult.setPage(page);
		newResult.setSize(size);
		newResult.setTotal(userHelps.size());
		newResult.setTotalPage(userHelps.size()/size);
		
		if(userHelps.size()<=sCount){
			newResult.setData(userHelps);
		}else if(sCount<userHelps.size()&& userHelps.size()<=eCount){
			newResult.setData(userHelps.subList(sCount, userHelps.size()));
		}else if(userHelps.size()>eCount){
			newResult.setData(userHelps.subList(sCount, eCount));
		}
		return newResult;
	}

}
