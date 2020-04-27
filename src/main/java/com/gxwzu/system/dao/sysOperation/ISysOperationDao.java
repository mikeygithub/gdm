package com.gxwzu.system.dao.sysOperation;

import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysOperation.SysOperation;

public interface ISysOperationDao  extends BaseDao<SysOperation>{
	public Result<SysOperation> find(SysOperation model ,int page,int size);
	 public List<SysOperation> findByExample(SysOperation model);
	 public SysOperation findById(Integer id);

}
