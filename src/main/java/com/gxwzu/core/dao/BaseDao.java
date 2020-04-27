package com.gxwzu.core.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.gxwzu.core.pagination.QueryFilter;
import com.gxwzu.core.pagination.Result;

/**
 * 
 * Data Access Object (DAO) interface.   This is an interface
 * used to tag our DAO classes and to provide common methods to all DAOs.
 *
 */
public interface BaseDao<T> {
	
	  /**
	   * 
	   * @param entity
	   * @return
	   */
	  public  T save(T entity);
	  /**
	   * 
	   * @param entity
	   * @return
	   */
	  public  T merge(T entity);
	  /**
	   * 
	   * @param entity
	   */
	  public  void update(T entity)throws DataAccessException;
	  /**
	   * 
	   * @param entity
	   */
		public T saveOrUpdate(T entity); 
	  /**
	   * 
	   * @param clazz
	   * @param id
	   * @return
	   */
	  public  T get(Class<T> clazz,Serializable id);
	  /**
	   * 
	   * @param clazz
	   * @param id
	   */
	  public  void remove(Class <T> clazz,Serializable id);
	  /**
	   * 
	   * @param entity
	   */
	  public  void remove(T entity)throws DataAccessException;
	  /**
	   * 
	   * @param entity
	   */
	  public T getById(T entity,Integer id);
	  /**
	   * 
	   * @return
	   */
	  public  List<T> getAll(Class<T> clazz);
	  /**
	   * 
	   * @param queryString
	   * @param params
	   * @return
	   */
	  public  List<T> findByHql(String queryString, Object[] params);
	  /**
	   * 
	   * @param queryString
	   * @param params
	   * @param start
	   * @param limit
	   * @return
	   */
	  public  List<T> findByHql(String queryString, Object[] params, int start, int limit);
	  
	  public  List<Object[]> queryByHql(String queryString);

	  /**
	   * Remove the given object from the Session cache
	   * @param entity
	   */
	  public  void evict(T entity);
	  /**
	   * 
	   */
	  public  void flush();
	  /**
	   * 
	   * @param paramString
	   * @param paramArrayOfObject
	   * @return
	   */
	  public  Long update(String queryString, Object[] values);
	  
	  public  Long updateBySql(String queryString, Object[] values);
	
	  public List<T> findByExample(String queryString, Object[] valueArray);
	  
	  public List<Object[]> query(String queryString);
	 
	  public List<Object[]> query(final String queryString,final Object[] values);
	  
	  public List<T> find(String hql);
	  
	  public int findCount(String hql);
	  
	public Result findBySQL(final String sql,  final Object[] values,
				final int start, final int limit);
	}
