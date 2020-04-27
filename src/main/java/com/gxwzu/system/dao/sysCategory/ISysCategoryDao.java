package com.gxwzu.system.dao.sysCategory;

import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysCategory.SysCategory;

public interface ISysCategoryDao extends BaseDao<SysCategory>{

	Result<SysCategory> find(SysCategory model, int page, int row);

	SysCategory findById(Integer id);

	List<SysCategory> findByExample(SysCategory model);

	List<SysCategory> findAllSysCategoryList();
}
