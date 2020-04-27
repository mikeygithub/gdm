package com.gxwzu.business.service.plan;

import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.core.service.BaseService;

public interface IPlanYearSerivce extends BaseService<PlanYear> {
	public PlanYear findPlanYear();
	public PlanYear add(PlanYear model);
}
