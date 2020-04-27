package com.gxwzu.business.dao.openReport.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.openReport.IOpenReportDao;
import com.gxwzu.business.model.openReport.OpenReport;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;

@SuppressWarnings("unchecked")
@Repository("openReportDao")
public class OpenReportDaoImpl extends BaseDaoImpl<OpenReport>implements IOpenReportDao {

	@Override
	public Result<OpenReport> find(OpenReport model, int page, int size) {
		StringBuffer queryString = new StringBuffer("FROM OpenReport model where 1=1 ");
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();

		if(model.getYear()!=null){
			queryString.append("and model.year=?");
			params.add(model.getYear());
		}

		if(model.getTeacherId()!=null){
			queryString.append("and model.teacherId=?");
			params.add(model.getTeacherId());
		}
		
		if(model.getStuId()!=null){
			queryString.append("and model.stuId=?");
			params.add(model.getStuId());
		}
		
		queryString.append(" ORDER BY model.reportId DESC");

		return super.find(queryString.toString(), params.toArray(), null, start, limit);
	}


	@Override
	public List<OpenReport> findByExample(OpenReport model) {
		StringBuffer queryString = new StringBuffer("FROM OpenReport model where 1=1 ");

		List<Object> params = new ArrayList<Object>();
		if(model.getYear()!=null){
			queryString.append("and model.year=?");
			params.add(model.getYear());
		}

		if(model.getTeacherId()!=null){
			queryString.append("and model.teacherId=?");
			params.add(model.getTeacherId());
		}
		
		if(model.getStuId()!=null){
			queryString.append("and model.stuId=?");
			params.add(model.getStuId());
		}
		if(model.getReportId()!=null){
			queryString.append("and model.reportId=?");
			params.add(model.getReportId());
		}
		
		queryString.append(" ORDER BY model.reportId DESC");
		
		return super.findByExample(queryString.toString(),params.toArray() );
	}

}
