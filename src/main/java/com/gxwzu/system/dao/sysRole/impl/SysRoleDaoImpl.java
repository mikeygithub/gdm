package com.gxwzu.system.dao.sysRole.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.dao.sysRole.ISysRoleDao;
import com.gxwzu.system.model.sysRole.SysRole;
/**
 * 角色dao
 * @author he
 *
 */
@SuppressWarnings("unchecked")
@Repository("sysRoleDao")
public class SysRoleDaoImpl  extends BaseDaoImpl<SysRole>  implements ISysRoleDao{
	
	public Result<SysRole> find(SysRole model ,int page,int size){
		String queryString="from SysRole model where 1=1";
		int start=(page-1)*size;
		int limit =size;
		List params=new ArrayList<Object>();
		if(model.getId()!=null){
			 queryString =queryString+" and model.id=?";
	    	 params.add(model.getId());
		}
		if(model.getRoleName()!=null){
			queryString=queryString+"and model.roleName=?";
			params.add(model.getRoleName());
		}
		if(model.getDescription()!=null){
			queryString=queryString+"and model.description=?";
			params.add(model.getDescription());
		}
		queryString = queryString + " ORDER BY model.id DESC";
		return (Result<SysRole>)super.find(queryString, params.toArray(), null, start, limit);
	}

	public SysRole findById(Integer id) {
		log.debug("getting SysRole instance with id: " + id);
		try {
			SysRole instance = (SysRole) getHibernateTemplate().get(
					"com.gxwzu.system.model.sysRole.SysRole", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	  public List<SysRole> findByExample(SysRole model){
		  List  params=new ArrayList<Object>();
		  String queryString="from SysRole model where 1=1";
		  if(model.getId()!=null){
				 queryString =queryString+" and model.id=?";
		    	 params.add(model.getId());
			}
		  if(model.getRoleName()!=null){
				queryString=queryString+"and model.roleName=?";
				params.add(model.getRoleName());
			}
			if(model.getDescription()!=null){
				queryString=queryString+"and model.description=?";
				params.add(model.getDescription());
			}
			queryString = queryString + " ORDER BY model.id DESC";
			return super.findByExample(queryString, params.toArray());
	  }
	

}
