package com.gxwzu.business.service.issueInfo;

import java.util.List;

import com.gxwzu.business.model.issueInfo.IssueInfo;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;

/**
 * 课题service
 * 
 * @author he
 * 
 */
public interface IIssueInfoSerivce extends BaseService<IssueInfo> {
	
	public Result<IssueInfo> find(IssueInfo model, int page, int size);

	public List<IssueInfo> findByExample(IssueInfo model);

	public IssueInfo addOrEdit(IssueInfo model);

	public void del(Integer thisId);

	public IssueInfo findById(Integer thisId);

	public IssueInfo findByStuIdAndYear(Integer stuId, Integer thisYear);

	public List<IssueInfo> findByStuId(Integer stuId, Integer year);

	public void delByStuId(Integer stuId);

	public List<IssueInfo> findByStuIdAndIssueType(Integer stuId, String issueType);
	

}
