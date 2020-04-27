package com.gxwzu.business.dao.plan.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.plan.IPlanProgressDao;
import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListPlanProgress;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysMajor.SysMajor;

@SuppressWarnings("unchecked")
@Repository("planProgressDao")
public class PlanProgressDaoImpl extends BaseDaoImpl<PlanProgress>implements IPlanProgressDao {

	@Override
	public Result<Object> find(PlanProgress model, int page, int size) {
		int start=(page-1)*size;
		int limit =size;
		
		StringBuffer queryString= new StringBuffer();
		queryString.append(" SELECT model.progress_id,model.dept_number,model.category_id,model.major_id,model.startTime,model.endTime,model.`year`,model.progress_start")
		.append(",pim.progress_item_id,pim.progress_item_no,pim.progress_name,dt.dept_name,cy.category_name,mr.major_name,mr.staff_name  ")
		.append(" from progress_item pim ")
		.append(" LEFT JOIN plan_progress model ON pim.progress_item_no = model.progress_item_no  ");
		
		List<Object> params=new ArrayList<Object>();
		
		if(StringUtils.isNotEmpty(model.getDeptNumber())){
			 queryString.append(" and model.dept_number=? ");
			params.add(model.getDeptNumber());
		}
		if(model.getCategoryId()!=null){
			 queryString.append(" and model.category_id=? ");
	    	 params.add(model.getCategoryId());
		}
		if(model.getMajorId()!=null){
			 queryString.append(" and model.major_id=? ");
	    	 params.add(model.getMajorId());
		}
		if(model.getProgressId()!=null){
			 queryString.append(" and model.progress_id=? ");
	    	 params.add(model.getProgressId());
		}
		if(model.getProgressItemNo()!=null){
			 queryString.append(" and pim.progress_no=? ");
			params.add(model.getProgressItemNo());
		}
		if(model.getYear()!=null){
			 queryString.append(" and model.year=? ");
			params.add(model.getYear());
		}
		queryString.append(" LEFT JOIN sys_department dt ON  model.dept_number = dt.dept_number ")
		.append(" LEFT JOIN sys_category cy ON model.category_id = cy.category_id ")
		.append(" LEFT JOIN sys_major mr ON model.major_id = mr.major_id ");
		
		return super.findBySQL(queryString.toString(), params.toArray(), start, limit);
	}

	@Override
	public void updateStartById(Integer progressId) {
		String queryString = "update PlanProgress set progressStart=1 where progressId='"+progressId+"' ";
		getHibernateTemplate().bulkUpdate(queryString);
	}

	@Override
	public List<Object> findByExample(PlanProgress model) {
		
		StringBuffer queryString= new StringBuffer();
		queryString.append(" SELECT model.progress_id,model.dept_number,model.category_id,model.major_id,model.startTime,model.endTime,model.`year`,model.progress_start")
		.append(",pim.progress_item_id,pim.progress_item_no,pim.progress_name,dt.dept_name,cy.category_name,mr.major_name,mr.staff_name  ")
		.append(" from progress_item pim ")
		.append(" LEFT JOIN plan_progress model ON pim.progress_item_no = model.progress_item_no  ");
		
		List<Object> params=new ArrayList<Object>();
		
		if(StringUtils.isNotEmpty(model.getDeptNumber())){
			 queryString.append(" and model.dept_number=? ");
			params.add(model.getDeptNumber());
		}
		if(model.getCategoryId()!=null){
			 queryString.append(" and model.category_id=? ");
	    	 params.add(model.getCategoryId());
		}
		if(model.getMajorId()!=null){
			 queryString.append(" and model.major_id=? ");
	    	 params.add(model.getMajorId());
		}
		if(model.getProgressId()!=null){
			 queryString.append(" and model.progress_id=? ");
	    	 params.add(model.getProgressId());
		}
		if(model.getProgressItemNo()!=null){
			 queryString.append(" and pim.progress_no=? ");
			params.add(model.getProgressItemNo());
		}
		if(model.getYear()!=null){
			 queryString.append(" and model.year=? ");
			params.add(model.getYear());
		}
		queryString.append(" LEFT JOIN sys_department dt ON  model.dept_number = dt.dept_number ")
		.append(" LEFT JOIN sys_category cy ON model.category_id = cy.category_id ")
		.append(" LEFT JOIN sys_major mr ON model.major_id = mr.major_id ");
	
		return query(queryString.toString(), params.toArray());
	}

	@Override
	public PlanProgress findByStudMajoId(Integer majorId, String progressItemNo) {
		List<Object>  params=new ArrayList<Object>();
		PlanProgress model = null;
		String queryString=" from PlanProgress model where 1=1 ";
		if(majorId != null && !"".equals(majorId)){
			queryString+=" and model.majorId=? ";
			params.add(majorId);
		}
		if(progressItemNo != null && !"".equals(progressItemNo)){
			 queryString+=" and model.progressItemNo=? ";
			 params.add(progressItemNo);
		}
		List<PlanProgress> list = super.findByExample(queryString, params.toArray());	 
        if(list!=null&&list.size()!=0){
    	   model = list.get(0);
        }
		return model;
	}

	@Override
	public PlanProgress findByTeacStaffroomId(Integer staffroomId, String progressItemNo) {
		List<Object> params=new ArrayList<Object>();
		PlanProgress model=null;
		String queryString=" from PlanProgress model where 1=1 ";
		if(staffroomId != null && !"".equals(staffroomId)){
			queryString+=" and model.majorId=? ";
			params.add(staffroomId);
		}
		if(progressItemNo != null && !"".equals(progressItemNo)){
			 queryString+=" and model.progressItemNo=? ";
			 params.add(progressItemNo);
		}
		List<PlanProgress> list = super.findByExample(queryString, params.toArray());	 
        if(list!=null&&list.size()!=0){
    	   model = list.get(0);
        }
		return model;
	}



}
