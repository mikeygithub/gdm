package com.gxwzu.business.dao.plan.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.plan.IPlanYearDao;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;

@SuppressWarnings("unchecked")
@Repository("planYearDao")
public class PlanYearDaoImpl extends BaseDaoImpl<PlanYear>implements IPlanYearDao {

	@Override
	public Result<PlanYear> find(PlanYear model, int page, int size) {
		String queryString = "from PlanYear model where 1=1";
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		
		if(model.getYear()!=null){
			queryString=queryString+"and model.year=?";
			params.add(model.getYear());
		}
		
		queryString = queryString + " ORDER BY model.id DESC";
		return (Result<PlanYear>) super.find(queryString, params.toArray(),null, start, limit);
	}


	@Override
	public List<PlanYear> findByExample(PlanYear model) {
		String queryString = "from PlanYear model where 1=1";
		List<Object> params = new ArrayList<Object>();
		
		if(model.getYear()!=null){
			queryString=queryString+"and model.year=?";
			params.add(model.getYear());
		}
		
		queryString = queryString + " ORDER BY model.id DESC";
		return super.findByExample(queryString, params.toArray());
	}

}
