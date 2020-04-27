package com.gxwzu.system.dao.sysDirections;

import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysDirections.SysDirections;

public interface ISysDirectionsDao extends BaseDao<SysDirections>{

	Result<SysDirections> find(SysDirections model, int page, int size);

	SysDirections findById(Integer id);

	List<SysDirections> findByExample(SysDirections model);

}
