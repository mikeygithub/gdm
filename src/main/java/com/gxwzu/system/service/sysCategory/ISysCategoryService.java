package com.gxwzu.system.service.sysCategory;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysCategory.SysCategory;

public interface ISysCategoryService {

	Result<SysCategory> find(SysCategory model, int page, int row);

	SysCategory del(Integer id);

	SysCategory add(SysCategory model);

	SysCategory findById(Integer id);

	SysCategory edit(SysCategory model);

	List<SysCategory> findByExample(SysCategory model);

	List<SysCategory> findAllSysCategoryList();

	List<SysCategory> findByDeptNumber(String deptNumber);

}
