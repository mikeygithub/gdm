package com.gxwzu.core.extendInterface;

import java.util.List;

import com.gxwzu.core.pagination.Result;

public interface BaseServiceExtend1<T> {

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
	/**
	 * 删除实体
	 * @param model
	 * @return 成功返回true
	 */
	public boolean del(T model);
}
