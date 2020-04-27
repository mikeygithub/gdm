package com.gxwzu.core.extendInterface;

import java.util.List;

import com.gxwzu.core.pagination.Result;
/**
 * 扩展基础数据库操作接口1
 * @author Administrator
 *
 * @param <T>
 */
public interface BaseDaoExtend1<T> {

	/**
	 * 分页查找实体
	 * @param model
	 * @param page
	 * @param size
	 * @return
	 */
	public Result<T> find(T model,int page,int size);
	/**
	 * 根据该实体查找实体（模糊查询）
	 * @param model
	 * @return
	 */
	public List<T> findByExample(T model);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public T findById(Integer id);
	
}
