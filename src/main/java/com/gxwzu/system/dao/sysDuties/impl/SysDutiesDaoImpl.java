package com.gxwzu.system.dao.sysDuties.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.dao.sysDuties.ISysDutiesDao;
import com.gxwzu.system.model.sysDuties.SysDuties;

@SuppressWarnings("unchecked")
@Repository("SysDutiesDao")
public class SysDutiesDaoImpl extends BaseDaoImpl<SysDuties>implements ISysDutiesDao{

	@Override
	public Result<SysDuties> find(SysDuties model, int page, int size) {
	String queryString = "from SysDuties model where 1=1";
	int start = (page - 1) * size;
	int limit = size;
	List params = new ArrayList<Object>();
	if(model.getDutiesName()!=null){
		queryString=queryString+"and model.dutiesName=?";
		params.add(model.getDutiesName());
	}
	  queryString = queryString+"ORDER BY dutiesId DESC";
	return (Result<SysDuties>) super.find(queryString, params.toArray(),null, start, limit);
	}

	@Override
	public SysDuties findById(Integer id) {
		log.debug("############ " + id);
		try {
			SysDuties instance = (SysDuties) getHibernateTemplate().get(
					"com.gxwzu.system.model.sysDuties.SysDuties", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@Override
	public List<SysDuties> findByExample(SysDuties model) {
		 List<Object> params = new ArrayList<Object>();
	        String queryString = "from SysDuties model where 1=1";
	        if(model.getDutiesId()!=null){
	        	queryString = queryString+"and model.dutiesId=?";
	        	params.add(model.getDutiesId());
	        }
	        if(model.getDutiesNo()!=null){
	        	queryString = queryString+"and model.dutiesNo=?";
	        	params.add(model.getDutiesNo());
	        }
	        if(model.getDutiesName()!=null&&!"".equals(model.getDutiesName())){
	        queryString = queryString+"and model.dutiesName=?";
	        params.add(model.getDutiesName());
	        }
	        queryString = queryString+"ORDER BY dutiesId DESC";
			return super.findByExample(queryString, params.toArray());
	}

	@Override
	public List<SysDuties> findAllSysDutiesList(String dutiesId) {
		if(null != dutiesId && !"".equals(dutiesId)) {
			String queryString = "from  SysDuties  where dutiesId='"+dutiesId+"'";
			return getHibernateTemplate().find(queryString);
		}else{
			String queryString = "from SysDuties where 1 = 1";
			return getHibernateTemplate().find(queryString);
		}
	}

	@Override
	public SysDuties findByDutiesNo(String dutiesNo) {
		List<Object>  params=new ArrayList<Object>();
		SysDuties model = null;
		if(StringUtils.isNotEmpty(dutiesNo)){
			String queryString="from SysDuties model where model.dutiesNo=?";
			params.add(dutiesNo);

			List<SysDuties> list = super.findByExample(queryString, params.toArray());
			if(list!=null&&list.size()!=0){
				model = list.get(0);
			}
		}
		return model;
	}

}
