package com.gxwzu.business.service.plan.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.plan.IPlanYearDao;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.service.impl.BaseServiceImpl;

@Service("planYearService")
public class PlanYearServiceImpl extends BaseServiceImpl<PlanYear> implements IPlanYearSerivce{
    @Autowired
    private IPlanYearDao planYearDao;
    
    public BaseDao<PlanYear> getDao() {
		return this.planYearDao;
	}


	@Override
	public PlanYear add(PlanYear model) {
		return planYearDao.saveOrUpdate(model);
	}

	@Override
	public PlanYear findPlanYear() {
		PlanYear model = null;
		List<PlanYear> list =  planYearDao.findByExample(new PlanYear());
		if(list!=null&&list.size()!=0){
			model = list.get(0);
		}
		return model;
	}

}
