package com.gxwzu.system.dao.sysIssueType.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.dao.sysIssueType.ISysIssueTypeDao;
import com.gxwzu.system.model.sysDuties.SysDuties;
import com.gxwzu.system.model.sysIssueType.SysIssueType;
@Repository("SysIssueTypeDao")
@SuppressWarnings("unchecked")
public class SysIssueTypeDaoImpl extends BaseDaoImpl< SysIssueType>implements ISysIssueTypeDao{
	@Override
	public Result<SysIssueType> find(SysIssueType model, int page, int size) {
		String queryString = "from SysIssueType model where 1=1";
		int start = (page - 1) * size;
		int limit = size;
		List params = new ArrayList<Object>();
		if(model.getIssueTypeName()!=null){
			queryString=queryString+"and model.issueTypeName=?";
			params.add(model.getIssueTypeName());
		}
		  queryString = queryString+"ORDER BY issueTypeId DESC";
		return (Result<SysIssueType>) super.find(queryString, params.toArray(),null, start, limit);
	}
	@Override
	public SysIssueType findById(Integer id) {
		log.debug("############ " + id);
		try {
			SysIssueType instance = (SysIssueType) getHibernateTemplate().get(
					"com.gxwzu.system.model.sysIssueType.SysIssueType", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@Override
	public List<SysIssueType> findByExample(SysIssueType model) {
		 List<Object> params = new ArrayList<Object>();
	        String queryString = "from SysIssueType model where 1=1";
	        if(model.getIssueTypeId()!=null){
	        	queryString = queryString+"and model.issueTypeId=?";
	        	params.add(model.getIssueTypeId());
	        }
	        if(model.getIssueTypeName()!=null&&!"".equals(model.getIssueTypeName())){
	        queryString = queryString+"and model.issueTypeName=?";
	        params.add(model.getIssueTypeName());
	        }
	        queryString = queryString+"ORDER BY issueTypeId DESC";
			return super.findByExample(queryString, params.toArray());
	}
	@Override
	public List<SysIssueType> findAllSysIssueTypeList(Integer issueTypeId) {
		if(null != issueTypeId && !"".equals(issueTypeId)) {
			String queryString = "from  SysIssueType  where issueTypeId='"+issueTypeId+"'";
			return getHibernateTemplate().find(queryString);
		}else{
			String queryString = "from SysIssueType where 1!=1";
			return getHibernateTemplate().find(queryString);
		}
	}
	@Override
	public List<SysIssueType> findSysIssueTypeListAll() {
			String queryString = "from SysIssueType where 1=1";
			return getHibernateTemplate().find(queryString);
	}

	

}
