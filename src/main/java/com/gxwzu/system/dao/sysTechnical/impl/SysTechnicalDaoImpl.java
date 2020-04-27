package com.gxwzu.system.dao.sysTechnical.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.dao.sysTeacher.ISysTeacherDao;
import com.gxwzu.system.dao.sysTechnical.ISysTechnicalDao;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.model.sysTechnical.SysTechnical;
import com.gxwzu.system.service.sysTechnical.ISysTechnicalService;
@SuppressWarnings("unchecked")
@Repository("sysTechnicalDao")
public class SysTechnicalDaoImpl extends BaseDaoImpl<SysTechnical> implements ISysTechnicalDao {

	@Override
	public Result<SysTechnical> find(SysTechnical model, int page, int size) {
		String queryString = "from SysTechnical model where 1=1";
		int start = (page - 1) * size;
		int limit = size;
		List params = new ArrayList<Object>();
		if(model.getTechnicalName()!=null){
			queryString=queryString+"and model.technicalName=?";
			params.add(model.getTechnicalName());
		}
		  queryString = queryString+"ORDER BY technicalId DESC";
		return (Result<SysTechnical>) super.find(queryString, params.toArray(),null, start, limit);
	}


	@Override
	public SysTechnical findById(Integer id) {
		log.debug("############ " + id);
		try {
			SysTechnical instance = (SysTechnical) getHibernateTemplate().get(
					"com.gxwzu.system.model.sysTechnical.SysTechnical", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}


	@Override
	public SysTechnical findByName(String technicalName) {
		 List<Object>  params=new ArrayList<Object>();
		 SysTechnical model = null;
		  if(StringUtils.isNotEmpty(technicalName)){
			  String queryString="from SysTechnical model where model.technicalName=?";
		    	 params.add(technicalName);
		    	 
		       List<SysTechnical> list = super.findByExample(queryString, params.toArray());	 
		        if(list!=null&&list.size()!=0){
		    	   model = list.get(0);
		       }
		   }
		return model;
	}

	/**
	 * 通过编号查询
	 * @param technicalNo
	 * @return
	 */
	@Override
	public SysTechnical findByNo(String technicalNo) {
		List<Object>  params=new ArrayList<Object>();
		SysTechnical model = null;
		if(StringUtils.isNotEmpty(technicalNo)){
			String queryString="from SysTechnical model where model.technicalNo=?";
			params.add(technicalNo);

			List<SysTechnical> list = super.findByExample(queryString, params.toArray());
			if(list!=null&&list.size()!=0){
				model = list.get(0);
			}
		}
		return model;
	}


	@Override
	public List<SysTechnical> findAllSysTechnicalList() {
		return getAll(SysTechnical.class);
	}


	@Override
	public List<SysTechnical> findByExample(SysTechnical model) {
		 List<Object> params = new ArrayList<Object>();
	        String queryString = "from SysTechnical model where 1=1";
	        if(model.getTechnicalId()!=null){
	        	queryString = queryString+"and model.technicalId=?";
	        	params.add(model.getTechnicalId());
	        }
	        if(model.getTechnicalNo()!=null){
	        	queryString = queryString+"and model.technicalNo=?";
	        	params.add(model.getTechnicalNo());
	        }
	        if(model.getTechnicalName()!=null&&!"".equals(model.getTechnicalName())){
	        queryString = queryString+"and model.technicalName=?";
	        params.add(model.getTechnicalName());
	        }
	        queryString = queryString+"ORDER BY technicalId DESC";
			return super.findByExample(queryString, params.toArray());
		}

	
	
}
