package com.gxwzu.system.dao.sysMenu.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.dao.sysMenu.ISysMenuDao;
import com.gxwzu.system.model.sysMenu.SysMenu;
/**
 * 系统菜单dao
 * @author he
 *
 */
@SuppressWarnings("unchecked")
@Repository("sysMenuDao")
public class SysMenuDaoImpl  extends BaseDaoImpl<SysMenu>  implements ISysMenuDao{
	
	public Result<SysMenu> find(SysMenu model ,int page,int size){
		String queryString="from SysMenu model where 1=1";
		int start=(page-1)*size;
		int limit =size;
		List params=new ArrayList<Object>();
		if(model.getMenuId()!=null){
			 queryString =queryString+" and model.menuId=?";
	    	 params.add(model.getMenuId());
		}
		if(model.getMenuName()!=null){
			queryString=queryString+"and model.menuName=?";
			params.add(model.getMenuName());
		}
		if(model.getMenuPerm()!=null){
			queryString=queryString+"and model.menuPerm=?";
			params.add(model.getMenuPerm());
		}
		queryString = queryString + " ORDER BY model.menuId DESC";
		return (Result<SysMenu>)super.find(queryString, params.toArray(), null, start, limit);
	}

	public SysMenu findById(Integer id) {
		log.debug("getting SysMenu instance with id: " + id);
		try {
			SysMenu instance = (SysMenu) getHibernateTemplate().get(
					"com.gxwzu.system.model.sysMenu.SysMenu", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	  public List<SysMenu> findByExample(SysMenu model){
		  List  params=new ArrayList<Object>();
		  String queryString="from SysMenu model where 1=1";
		  if(model.getMenuId()!=null){
				 queryString =queryString+" and model.menuId=?";
		    	 params.add(model.getMenuId());
			}
			if(model.getMenuName()!=null){
				queryString=queryString+"and model.menuName=?";
				params.add(model.getMenuName());
			}
			if(model.getMenuPerm()!=null){
				queryString=queryString+"and model.menuPerm=?";
				params.add(model.getMenuPerm());
			}
			queryString = queryString + " ORDER BY model.weight ASC";
			return super.findByExample(queryString, params.toArray());
	  }
	

}
