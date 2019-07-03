package com.gxwzu.system.dao.sysDuties;

import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysDuties.SysDuties;
import com.gxwzu.system.model.sysTechnical.SysTechnical;

public interface ISysDutiesDao extends BaseDao<SysDuties>{
	/**
	 * 列表查询
	 */
	public Result<SysDuties> find(SysDuties model, int page, int row);
	/**
	 * 修改职务
	 * @return
	 */
	public SysDuties findById(Integer id);
	/**
	 * 检查职务是否存在
	 * @author 何金燕
	 * @return
	 */
	public List<SysDuties> findByExample(SysDuties model);
	
	/**
	 * 查找所有职务
	 * @param dutiesId 
	 * @return
	 */
	public List<SysDuties> findAllSysDutiesList(String dutiesId);




}
