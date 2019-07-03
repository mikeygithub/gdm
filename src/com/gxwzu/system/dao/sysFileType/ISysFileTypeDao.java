package com.gxwzu.system.dao.sysFileType;

import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysDuties.SysDuties;
import com.gxwzu.system.model.sysFileType.SysFileType;
import com.gxwzu.system.model.sysTechnical.SysTechnical;

public interface ISysFileTypeDao extends BaseDao<SysFileType>{
	/**
	 * 列表查询
	 */
	public Result<SysFileType> find(SysFileType model, int page, int row);
	/**
	 * 修改职务
	 * @return
	 */
	public SysFileType findById(Integer id);
	/**
	 * 检查职务是否存在
	 * @return
	 */
	public List<SysFileType> findByExample(SysFileType model);
	
	/**
	 * 查找所有职务
	 * @param dutiesId 
	 * @return
	 */
	public List<SysFileType> findAllSysFileTypeList(String dutiesId);




}
