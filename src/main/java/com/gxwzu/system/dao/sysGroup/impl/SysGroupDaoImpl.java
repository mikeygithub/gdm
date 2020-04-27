package com.gxwzu.system.dao.sysGroup.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.dao.sysGroup.ISysGroupDao;
import com.gxwzu.system.model.sysGroup.SysGroup;
/**
 * 子菜单分组dao
 * @author he
 *
 */
@SuppressWarnings("unchecked")
@Repository("sysGroupDao")
public class SysGroupDaoImpl  extends BaseDaoImpl<SysGroup>  implements ISysGroupDao{
	
	public Result<SysGroup> find(SysGroup model ,int page,int size){
		String queryString="from SysGroup model where 1=1";
		int start=(page-1)*size;
		int limit =size;
		List params=new ArrayList<Object>();
		if(model.getGroupId()!=null){
			 queryString =queryString+" and model.groupId=?";
	    	 params.add(model.getGroupId());
		}
		if(model.getGroupName()!=null){
			queryString=queryString+"and model.groupName=?";
			params.add(model.getGroupName());
		}
		if(model.getGroupPerm()!=null){
			queryString=queryString+"and model.groupPerm=?";
			params.add(model.getGroupPerm());
		}
		queryString = queryString + " ORDER BY model.id DESC";
		return (Result<SysGroup>)super.find(queryString, params.toArray(), null, start, limit);
	}

	public SysGroup findById(Integer id) {
		log.debug("getting SysGroup instance with id: " + id);
		try {
			SysGroup instance = (SysGroup) getHibernateTemplate().get(
					"com.gxwzu.system.model.sysGroup.SysGroup", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	  public List<SysGroup> findByExample(SysGroup model){
		  List  params=new ArrayList<Object>();
		  String queryString="from SysGroup model where 1=1";
		  if(model.getGroupId()!=null){
				 queryString =queryString+" and model.groupId=?";
		    	 params.add(model.getGroupId());
			}
		  if(model.getGroupName()!=null){
				queryString=queryString+"and model.groupName=?";
				params.add(model.getGroupName());
			}
			if(model.getGroupPerm()!=null){
				queryString=queryString+"and model.groupPerm=?";
				params.add(model.getGroupPerm());
			}
			queryString = queryString + " ORDER BY model.id DESC";
			return super.findByExample(queryString, params.toArray());
	  }
	

}
