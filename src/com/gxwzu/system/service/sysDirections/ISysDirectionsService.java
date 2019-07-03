package com.gxwzu.system.service.sysDirections;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysDirections.SysDirections;

public interface ISysDirectionsService {

	/**
	 * 列表查询
	 * @param model
	 * @param page
	 * @param row
	 * @return
	 * @author wdl
	 */
	public Result<SysDirections> find(SysDirections model, int page, int row);

	public SysDirections add(SysDirections model);//添加

	public SysDirections findById(Integer Id);
	
	public SysDirections edit(SysDirections sysDirections);

	public SysDirections del(Integer thisId);

	public List<SysDirections> findByExample(SysDirections model);//检查研究方向名称是否存在

	public List<SysDirections> findAll();

}
