package com.gxwzu.system.dao.sysPermission.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.dao.sysPermission.ISysPermissionDao;
import com.gxwzu.system.model.sysPermission.SysPermission;
/**
 * 权限dao
 * @author he
 *
 */
@SuppressWarnings("unchecked")
@Repository("sysPermissionDao")
public class SysPermissionDaoImpl  extends BaseDaoImpl<SysPermission>  implements ISysPermissionDao{
	
	public Result<SysPermission> find(SysPermission model ,int page,int size){
		String queryString="from SysPermission model where 1=1";
		int start=(page-1)*size;
		int limit =size;
		List params=new ArrayList<Object>();
		if(model.getId()!=null){
			 queryString =queryString+" and model.id=?";
	    	 params.add(model.getId());
		}
		if(model.getRoleId()!=null){
			 queryString =queryString+" and model.roleId=?";
	    	 params.add(model.getRoleId());
		}
		if(model.getResource()!=null){
			queryString=queryString+" and model.resource=?";
			params.add(model.getResource());
		}
		queryString = queryString + " ORDER BY model.id DESC";
		return (Result<SysPermission>)super.find(queryString, null, null, start, limit);
	}

	public SysPermission findById(Integer id) {
		log.debug("getting SysPermission instance with id: " + id);
		try {
			SysPermission instance = (SysPermission) getHibernateTemplate().get(
					"com.gxwzu.system.model.sysPermission.SysPermission", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	  public List<SysPermission> findByExample(SysPermission model){
		  List  params=new ArrayList<Object>();
		  String queryString="from SysPermission model where 1=1 ";
		  if(model.getId()!=null){
				 queryString =queryString+" and model.id=? ";
		    	 params.add(model.getId());
			}
		  if(model.getId()!=null){
				 queryString =queryString+" and model.id=? ";
		    	 params.add(model.getId());
			}
		  if(model.getRoleId()!=null){
				 queryString =queryString+" and model.roleId=? ";
		    	 params.add(model.getRoleId());
			}
			if(model.getResource()!=null){
				queryString=queryString+" and model.resource=? ";
				params.add(model.getResource());
			}
			Object[] objects = new Object[params.size()];
			for(int i = 0;i<params.size();i++){
				objects[i] = params.get(i);
			}
			queryString = queryString + " ORDER BY model.id DESC";

			return super.findByExample(queryString, objects);
	  }

	@Override
	public Long delByRoleId(Integer id) {
		  String queryString="delete from SysPermission model where model.roleId=?";
		  List  params=new ArrayList<Object>();
		  params.add(id);
		return super.update(queryString, params.toArray());
	}
	

}
