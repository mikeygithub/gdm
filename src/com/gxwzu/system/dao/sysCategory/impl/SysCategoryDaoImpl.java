package com.gxwzu.system.dao.sysCategory.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.dao.sysCategory.ISysCategoryDao;
import com.gxwzu.system.model.sysCategory.SysCategory;

@SuppressWarnings("unchecked")
@Repository("sysCategoryDao")
public class SysCategoryDaoImpl  extends BaseDaoImpl<SysCategory> implements ISysCategoryDao{

	/**
	 * 大类显示列表
	 * @return
	 */
	@Override
	public Result<SysCategory> find(SysCategory model, int page, int size) {
		String queryString = "from SysCategory model where 1=1";
		int start=(page-1)*size;
		int limit =size;	
		List<Object> peram = new ArrayList<Object>();
		
		if(StringUtils.isNotEmpty(model.getDeptNumber())){
			queryString = queryString + " and deptNumber =?";
			peram.add(model.getDeptNumber());
		}
		if(StringUtils.isNotEmpty(model.getCategoryName())){
			queryString = queryString + " and categoryName like '%"+model.getCategoryName()+"%'";
			peram.add("%"+model.getCategoryName()+"%");
		}
		return super.find(queryString, peram.toArray(), null, start, limit);
	}

	/**
	 * 通过id查找
	 */
	@Override
	public SysCategory findById(Integer id) {
		log.debug("############ " + id);
		try {
			SysCategory instance = (SysCategory) getHibernateTemplate().get(
					"com.gxwzu.system.model.sysCategory.SysCategory", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/**
	 * 对大类编号和名称查重
	 *  @author liyixia
	 *   @date 2017.7.30
	 */
	@Override
	public List<SysCategory> findByExample(SysCategory model) {
		
		List<Object>  params=new ArrayList<Object>();
		  String queryString="from SysCategory model where 1=1";
			if(model.getCategoryName()!=null&&!"".equals(model.getCategoryName())){
				queryString=queryString+"and model.majorName=?";
				params.add(model.getCategoryName());
			}
			if(StringUtils.isNotEmpty(model.getDeptNumber())){
				queryString=queryString+"and model.deptNumber=?";
				params.add(model.getDeptNumber());
			}
			Object[] objects = new Object[params.size()];
			for(int i = 0;i<params.size();i++){
				objects[i] = params.get(i);
			}
			queryString = queryString+" ORDER BY id DESC";
			return super.findByExample(queryString, objects);
	}

	@Override
	public List<SysCategory> findAllSysCategoryList() {
		return getAll(SysCategory.class);
	}
}
