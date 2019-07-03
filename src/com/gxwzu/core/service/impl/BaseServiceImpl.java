package com.gxwzu.core.service.impl;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.service.BaseService;
/**
 * Base class for Business Services - use this class for utility methods and
 * generic CRUD methods.
 * @author <a href=mailto:amu_1115@126.com> amu </a>
 * @version $ BaseServiceImpl.java 2015-7-15 07:10:48
 */


public abstract  class BaseServiceImpl<T> implements BaseService<T> {
	protected final Log log = LogFactory.getLog(getClass());
	
	protected BaseDao<T> dao;
	
	public  void setDao(BaseDao<T> dao){
		this.dao=dao;
	}

	@Override
	public T save(T entity) {
		return getDao().save(entity);
	}

	public abstract BaseDao<T> getDao();

	@Override
	public T merge(T entity) {
		
		return getDao().merge(entity);
	}

	@Override
	public boolean update(T entity) {
		try {
			getDao().update(entity);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		
	}

	@Override
	public T get(Class<T> clazz, Serializable id) {
		
		return getDao().get(clazz, id);
	}

	@Override
	public void remove(Class<T> clazz, Serializable id) {
		getDao().remove(clazz, id);
	}
	
	@Override
	public boolean remove(T entity) {
		try {
			getDao().remove(entity);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	/**
	 * 查找所有
	 * @param entity
	 * @return
	 */
	@Override
	public List<T> findAll(Class<T> clazz){
		return getDao().getAll(clazz);
	}

}
