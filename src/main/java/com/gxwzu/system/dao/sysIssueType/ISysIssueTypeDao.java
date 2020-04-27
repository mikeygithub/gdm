package com.gxwzu.system.dao.sysIssueType;

import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysIssueType.SysIssueType;

public interface ISysIssueTypeDao extends BaseDao<SysIssueType>{
	/**
	 * 修改课题类型
	 * @return
	 */
	public	SysIssueType findById(Integer id);
	/**
	 * 检查课题类型是否存在
	 * @author 何金燕
	 * @return
	 */
	public List<SysIssueType> findByExample(SysIssueType model);
	/**
	 * 列表查询
	 */
	public Result<SysIssueType> find(SysIssueType model, int page, int size);
	/**
	 * 查找所有课题类型
	 * @param Integer 
	 * @return
	 */
	public List<SysIssueType> findAllSysIssueTypeList(Integer issueTypeId);
	
	public List<SysIssueType> findSysIssueTypeListAll();

}
