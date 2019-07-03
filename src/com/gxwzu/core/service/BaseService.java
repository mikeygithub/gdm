package com.gxwzu.core.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.dao.DataAccessException;
/**
 *  
 * @version $ BaseService.java 2015-7-14 ����11:37:01
 */
public interface BaseService<T> {

	  /**
       * Generic method to save an object.
	   * @param entity the object to save
	   * @return
	   */
	  public  T save(T entity);
	  /**
	   * 
	   * @param entity  model class to lookup
	   * @return
	   */
	  public  T merge(T entity);
	  /**
	   * 
	   * @param entity  model class to lookup
	   */
	  public  boolean update(T entity);
	  
	  /**
	   * 
	   * @param clazz  model class to lookup
	   * @param id  the identifier (primary key) of the class
	   * @return
	   */
	  public  T get(Class<T> clazz,Serializable id);
	  /**
	   * delete an object based on class and id
	   * @param clazz
	   * @param id
	   */
	  public  void remove(Class <T> clazz,Serializable id);
	  /**
	   * delete an object based on class
	   * @param entity
	   */
	  public boolean remove(T entity);
	 
	  /**
		 * 查找所有
		 * @param entity
		 * @return
		 */
		public List<T> findAll(Class<T> clazz);
	

}
