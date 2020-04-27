package com.gxwzu.business.dao.plan;

import java.util.List;

import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;

public interface IPlanProgressDao extends BaseDao<PlanProgress> {

	Result<Object> find(PlanProgress model, int page, int row);

	void updateStartById(Integer progressId);
	
	List<Object> findByExample(PlanProgress model);

	PlanProgress findByStudMajoId(Integer majorId, String progressItemNo);

	PlanProgress findByTeacStaffroomId(Integer staffroomId, String progressItemNo);

	
}
