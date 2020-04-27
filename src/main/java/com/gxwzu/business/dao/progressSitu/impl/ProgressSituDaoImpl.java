package com.gxwzu.business.dao.progressSitu.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.progressSitu.IProgressSituDao;
import com.gxwzu.business.model.progressSitu.ProgressSitu;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListProgressSitu;

@SuppressWarnings("unchecked")
@Repository("progressSituDao")
public class ProgressSituDaoImpl extends BaseDaoImpl<ProgressSitu> implements IProgressSituDao{

	@Override
	public Result<ProgressSitu> find(ProgressSitu model, int page, int size) {
		String queryString = "from ProgressSitu model where 1=1 ";
		int start = (page-1)*size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		logger.info("到这里了"+model);
		if(model.getProgressId()!=null){
        	queryString = queryString+" and model.progressId like '%"+model.getProgressId()+"%'";
        }
        if(model.getProgressTime()!=null){
        	queryString = queryString+" and model.progressTime like '%"+model.getProgressTime()+"%'";
        }
        if(model.getProgressRecord()!=null){
        	queryString = queryString+"and model.progressRecord like '%"+model.getProgressRecord()+"%'";
        }
        if(model.getStuId()!=null){
        	queryString = queryString+"and model.stuId =?";
        	params.add(model.getStuId());
        }
        if(model.getTeacherId()!=null){
        	queryString = queryString+"and model.teacherId =?";
        	params.add(model.getTeacherId());
        }
        if(model.getYear()!=null){
        	queryString = queryString+"and model.year =?";
        	params.add(model.getYear());
        }
        logger.info("进度情况"+queryString);
        queryString = queryString + "ORDER BY model.progressId DESC";
		return (Result<ProgressSitu>) super.find(queryString, params.toArray(), null, start, limit);
	
	}

	@Override
	public ProgressSitu findById(Integer id) {
		try {
			ProgressSitu instance = (ProgressSitu)getHibernateTemplate().get("com.gxwzu.business.model.progressSitu.ProgressSitu", id);
			return instance;
		} catch (RuntimeException re) {
			 log.error("get failed", re);
			 throw re;
		}
		
	}

	@Override
	public List<ProgressSitu> findByExample(ProgressSitu model) {
		String queryString = "from ProgressSitu model where 1=1";
		List<Object> params = new ArrayList<Object>();
		if(model.getProgressId()!=null){
        	queryString = queryString+"and model.progressId =?";
        	params.add(model.getProgressId());
        }
        if(model.getStuId()!=null){
        	queryString = queryString+"and model.stuId =?";
        	params.add(model.getStuId());
        }
        if(model.getTeacherId()!=null){
        	queryString = queryString+"and model.teacherId =?";
        	params.add(model.getTeacherId());
        }
        if(model.getYear()!=null){
        	queryString = queryString+"and model.year =?";
        	params.add(model.getYear());
        }
        queryString = queryString + "ORDER BY model.progressId DESC";
        
		return  super.findByExample(queryString, params.toArray());
	}

	@Override
	public List<ProgressSitu> finAll(ProgressSitu model) {
		String queryString = "from ProgressSitu model where 1=1 ";
		List<Object> params = new ArrayList<Object>();
		if(model.getProgressId()!=null){
        	queryString = queryString+"and model.progressId =?";
        	params.add(model.getProgressId());
		}
        if(model.getProgressTime()!=null){
        	queryString = queryString+"and model.progressTime =?";
        	params.add(model.getProgressTime());
        }	
        if(model.getStuId()!=null){
        	queryString = queryString+"and model.stuId =?";
        	params.add(model.getStuId());
        }	
        if(model.getProgressRecord()!=null){
        	queryString = queryString+"and model.progressRecord =?";
        	params.add(model.getProgressRecord());
        }	
        if(model.getProgressWork()!=null){
        	queryString = queryString+"and model.progressWork =?";
        	params.add(model.getProgressWork());
        }	
        if(model.getYear()!=null){
        	queryString = queryString+"and model.year =?";
        	params.add(model.getYear());
        }	
        if(model.getTeacherId()!=null){
        	queryString = queryString+"and model.teacherId =?";
        	params.add(model.getTeacherId());
        }	
        	queryString = queryString + "ORDER BY model.progressId DESC";  		        
		   return  super.findByExample(queryString, params.toArray());

	}
	}

	
	
	
	
	

