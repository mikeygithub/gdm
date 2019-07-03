package com.gxwzu.system.service.sysDuties;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.system.model.sysDuties.SysDuties;
import com.gxwzu.system.model.sysTechnical.SysTechnical;

public interface ISysDutiesService extends BaseService<SysDuties>{
    /**
     * 列表查询
     * @param model
     * @param page
     * @param row
     * @return
     */
	public Result<SysDuties> find(SysDuties model, int page, int size);
	/**
	 * 添加职务
	 * @return
	 */
	public SysDuties add(SysDuties model);
	/**
	 * 修改职务
	 * @return
	 */
	public SysDuties findById(Integer id);
	
	public SysDuties edit(SysDuties model);
	/**
	 * 删除职务
	 * @return
	 */
	public SysDuties del(Integer id);
	/**
	 * 检查职务是否存在
	 * @author 何金燕
	 * @return                         
	 */
	public List<SysDuties> findByExample(SysDuties model);
	
	/**
	 * 查找所有职务
	 * @param string 
	 * @return
	 */
	public List<SysDuties> findAllSysDutiesList();

}
