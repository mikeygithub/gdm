package com.gxwzu.business.dao.progressSitu;

import java.util.List;

import com.gxwzu.business.model.progressSitu.ProgressSitu;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListProgressSitu;

public interface IProgressSituDao extends BaseDao<ProgressSitu>{

	public	Result<ProgressSitu> find(ProgressSitu model, int page, int size);

	public	ProgressSitu findById(Integer id);
	
	public List<ProgressSitu> findByExample(ProgressSitu model);

	public List<ProgressSitu> finAll(ProgressSitu model);

}
