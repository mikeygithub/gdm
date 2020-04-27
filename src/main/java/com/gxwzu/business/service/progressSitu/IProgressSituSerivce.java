package com.gxwzu.business.service.progressSitu;

import java.util.List;

import com.gxwzu.business.model.progressSitu.ProgressSitu;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListProgressSitu;

public interface IProgressSituSerivce extends BaseService<ProgressSitu>{

	/**
	 * 列表查询
	 * @param model
	 * @param page
	 * @param row
	 * @return
	 * @author wdl
	 */
	public Result<ListProgressSitu> find(ProgressSitu model, int page, int row);
	
	public List<ListProgressSitu> findByExample(ProgressSitu model);
	
	public ProgressSitu add(ProgressSitu model);//添加

	public ProgressSitu findById(Integer Id);

	public ProgressSitu edit(ProgressSitu progressSitu);

	public ProgressSitu del(Integer thisId);

	public List<ListProgressSitu> findByStuIdAndYear(Integer stuId, Integer year);

	public Result<Object[]> outModelByExample(ProgressSitu model, int page, int row);

	public List<ProgressSitu> findAll(ProgressSitu progressSitu);

}
