package com.gxwzu.business.service.plan;

import java.util.List;

import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListPlanProgress;

public interface IPlanProgressSerivce extends BaseService<PlanProgress> {

	Result<ListPlanProgress> find(PlanProgress planProgress, int page, int row);

	PlanProgress add(PlanProgress model);

	PlanProgress findById(int id);

	void updateStartById(Integer progressId);

	List<ListPlanProgress> findByExample(PlanProgress model);

	boolean addOrEdit(PlanProgress model);

	List<ListPlanProgress> findByMajorAndYear(Integer staffroomId, Integer year);

	PlanProgress findByStudMajoId(Integer majorId, String progressItemNo );

	PlanProgress findByTeacStaffroomId(Integer staffroomId, String progressItemNo);

}
