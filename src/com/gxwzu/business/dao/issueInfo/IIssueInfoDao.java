package com.gxwzu.business.dao.issueInfo;

import java.util.List;

import com.gxwzu.business.model.issueInfo.IssueInfo;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;

/**
 * 课题dao接口
 * @author he
 *
 */
public interface IIssueInfoDao extends BaseDao<IssueInfo> {
	
	public Result<IssueInfo> find(IssueInfo model, int page, int size);

	public List<IssueInfo> findByExample(IssueInfo model);

	public List<IssueInfo> findByStuId(Integer stuId, Integer year);

	public void delByStuId(Integer stuId);

	public List<IssueInfo> findByStuIdAndIssueType(Integer stuId, String issueType);
}
