package com.gxwzu.system.dao.sysOperation.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.dao.sysOperation.ISysOperationDao;
import com.gxwzu.system.model.sysOperation.SysOperation;
/**
 * 系统菜单dao
 * @author he
 *
 */
@SuppressWarnings("unchecked")
@Repository("sysOperationDao")
public class SysOperationDaoImpl  extends BaseDaoImpl<SysOperation>  implements ISysOperationDao{
	
	public Result<SysOperation> find(SysOperation model ,int page,int size){
		String queryString="from SysOperation model where 1=1";
		int start=(page-1)*size;
		int limit =size;
		List params=new ArrayList<Object>();
		if(model.getOperationId()!=null){
			 queryString =queryString+" and model.operationId=?";
	    	 params.add(model.getOperationId());
		}
		if(model.getOperationName()!=null){
			queryString=queryString+"and model.operationName=?";
			params.add(model.getOperationName());
		}
		if(model.getOperationPerm()!=null){
			queryString=queryString+"and model.operationPerm=?";
			params.add(model.getOperationPerm());
		}
		queryString = queryString + " ORDER BY model.operationId DESC";
		return (Result<SysOperation>)super.find(queryString, params.toArray(), null, start, limit);
	}

	public SysOperation findById(Integer id) {
		log.debug("getting SysOperation instance with id: " + id);
		try {
			SysOperation instance = (SysOperation) getHibernateTemplate().get(
					"com.gxwzu.system.model.sysOperation.SysOperation", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	  public List<SysOperation> findByExample(SysOperation model){
		  List  params=new ArrayList<Object>();
		  String queryString="from SysOperation model where 1=1";
		  if(model.getOperationId()!=null){
				 queryString =queryString+" and model.operationId=?";
		    	 params.add(model.getOperationId());
			}
			if(model.getOperationName()!=null){
				queryString=queryString+"and model.operationName=?";
				params.add(model.getOperationName());
			}
			if(model.getOperationPerm()!=null){
				queryString=queryString+"and model.operationPerm=?";
				params.add(model.getOperationPerm());
			}
			queryString = queryString + " ORDER BY model.operationId DESC";
			return super.findByExample(queryString, params.toArray());
	  }
	

}
