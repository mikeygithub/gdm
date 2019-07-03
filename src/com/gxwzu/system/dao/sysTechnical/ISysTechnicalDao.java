package com.gxwzu.system.dao.sysTechnical;

import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysTechnical.SysTechnical;

public interface ISysTechnicalDao extends BaseDao<SysTechnical>{
	
	public Result<SysTechnical> find(SysTechnical model, int page, int size);

	public SysTechnical findById(Integer id);
	
	public  SysTechnical findByName(String technicalName);

	public List<SysTechnical> findAllSysTechnicalList();

	public List<SysTechnical> findByExample(SysTechnical model);
	
}
