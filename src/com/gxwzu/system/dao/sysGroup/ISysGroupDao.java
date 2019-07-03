package com.gxwzu.system.dao.sysGroup;

import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysGroup.SysGroup;

public interface ISysGroupDao  extends BaseDao<SysGroup>{
	public Result<SysGroup> find(SysGroup model ,int page,int size);
	 public List<SysGroup> findByExample(SysGroup model);
	 public SysGroup findById(Integer id);

}
