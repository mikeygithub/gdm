package com.gxwzu.system.dao.sysMenu;

import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysMenu.SysMenu;

public interface ISysMenuDao  extends BaseDao<SysMenu>{
	public Result<SysMenu> find(SysMenu model ,int page,int size);
	 public List<SysMenu> findByExample(SysMenu model);
	 public SysMenu findById(Integer id);

}
