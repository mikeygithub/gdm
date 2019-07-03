package com.gxwzu.business.dao.plan;

import java.util.List;

import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;

public interface IPlanYearDao extends BaseDao<PlanYear> {
	
	public Result<PlanYear> find(PlanYear model, int page, int size);

	public List<PlanYear> findByExample(PlanYear model);
}
