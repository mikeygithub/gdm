package com.gxwzu.business.dao.issueInfo.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.issueInfo.IIssueInfoDao;
import com.gxwzu.business.model.issueInfo.IssueInfo;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;

@SuppressWarnings("unchecked")
@Repository("issueInfoDao")
public class IssueInfoDaoImpl extends BaseDaoImpl<IssueInfo>implements IIssueInfoDao {

	@Override
	public Result<IssueInfo> find(IssueInfo model, int page, int size) {
		StringBuffer queryString = new StringBuffer("FROM IssueInfo model where 1=1 ");
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		
		if(model.getStuId()!=null){
			queryString.append("and model.stuId=?");
			params.add(model.getStuId());
		}

		if(StringUtils.isNotEmpty(model.getIssueType())){
			queryString.append("and model.issueType=?");
			params.add(model.getIssueType());
		}
		
		if(model.getYear()!=null){
			queryString.append("and model.year=?");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.issueId DESC");
		
		return super.find(queryString.toString(), params.toArray(), null, start, limit);
	}

	@Override
	public List<IssueInfo> findByExample(IssueInfo model) {
		StringBuffer queryString = new StringBuffer("FROM IssueInfo model where 1=1 ");
		List<Object> params = new ArrayList<Object>();
		
		if(model.getIssueId()!=null){
			queryString.append("and model.issueId=?");
			params.add(model.getIssueId());
		}
		if(model.getStuId()!=null){
			queryString.append("and model.stuId=?");
			params.add(model.getStuId());
		}

		if(StringUtils.isNotEmpty(model.getIssueName())){
			queryString.append("and model.issueName=?");
			params.add(model.getIssueName());
		}
		
		
		if(StringUtils.isNotEmpty(model.getIssueType())){
			queryString.append("and model.issueType=?");
			params.add(model.getIssueType());
		}
		
		if(model.getYear()!=null){
			queryString.append("and model.year=?");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.issueId DESC");
		
		return super.findByExample(queryString.toString(), params.toArray());
	}

	@Override
	public List<IssueInfo> findByStuId(Integer stuId, Integer year) {
		
		StringBuffer queryString = new StringBuffer("FROM IssueInfo model where 1=1 ");
		List<Object> params = new ArrayList<Object>();
		
		if(stuId!=null && !"".equals(stuId)){
			queryString.append("and model.stuId=? ");
			params.add(stuId);
		}
		
		if(year!=null && !"".equals(year)){
			queryString.append("and model.year=?");
			params.add(year);
		}
		queryString.append(" ORDER BY model.issueId DESC");
		
		return super.findByExample(queryString.toString(), params.toArray());
	}

	@Override
	public void delByStuId(Integer stuId) {
		StringBuffer delString = new StringBuffer("delete  FROM IssueInfo model where model.stuId = ? ");
		List<Object> params = new ArrayList<Object>();
		params.add(stuId);
		super.bulkUpdate(delString.toString(), params.toArray(), null);
	}

	@Override
	public List<IssueInfo> findByStuIdAndIssueType(Integer stuId, String issueType) {
		StringBuffer queryString = new StringBuffer("FROM IssueInfo model where 1=1 ");
		List<Object> params = new ArrayList<Object>();
		
		if(stuId!=null && !"".equals(stuId)){
			queryString.append("and model.stuId=? ");
			params.add(stuId);
		}
		
		if(issueType!=null && !"".equals(issueType)){
			queryString.append("and model.issueType=?");
			params.add(issueType);
		}
		queryString.append(" ORDER BY model.issueId DESC");
		
		return super.findByExample(queryString.toString(), params.toArray());
	}

}
