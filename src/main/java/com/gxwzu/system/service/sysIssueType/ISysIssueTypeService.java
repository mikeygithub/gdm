package com.gxwzu.system.service.sysIssueType;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.system.model.sysDuties.SysDuties;
import com.gxwzu.system.model.sysIssueType.SysIssueType;

public interface ISysIssueTypeService extends BaseService<SysIssueType>{

	public	Result<SysIssueType> find(SysIssueType model, int page, int size);

	public SysIssueType add(SysIssueType model);

	public SysIssueType findById(Integer id);

	public SysIssueType edit(SysIssueType model);

	public SysIssueType del(Integer id);

	public List<SysIssueType> findByExample(SysIssueType model);
	/**
	 * 查找所有课题类型
	 * @param Integer 
	 * @return
	 */
	public List<SysIssueType> findAllSysIssueTypeList(Integer issueTypeId);

	public List<SysIssueType> findSysIssueTypeListAll();
}
