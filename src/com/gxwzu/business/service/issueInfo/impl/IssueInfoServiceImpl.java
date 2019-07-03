package com.gxwzu.business.service.issueInfo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.issueInfo.IIssueInfoDao;
import com.gxwzu.business.model.issueInfo.IssueInfo;
import com.gxwzu.business.model.review.Review;
import com.gxwzu.business.service.issueInfo.IIssueInfoSerivce;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListReview;

@Service("issueInfoService")
public class IssueInfoServiceImpl extends BaseServiceImpl<IssueInfo> implements
		IIssueInfoSerivce {
	@Autowired
	private IIssueInfoDao issueInfoDao;
	public BaseDao<IssueInfo> getDao() {
		return this.issueInfoDao;
	}

	@Override
	public Result<IssueInfo> find(IssueInfo model, int page, int size) {
		return issueInfoDao.find(model, page, size);
	}

	@Override
	public List<IssueInfo> findByExample(IssueInfo model) {
		return issueInfoDao.findByExample(model);
	}

	
	
	
	@Override
	public IssueInfo addOrEdit(IssueInfo model) {
		return issueInfoDao.saveOrUpdate(model);
	}

	@Override
	public void del(Integer thisId) {
		issueInfoDao.remove(IssueInfo.class, thisId);
	}

	@Override
	public IssueInfo findById(Integer thisId) {
		return issueInfoDao.get(IssueInfo.class, thisId);
	}

	@Override
	public IssueInfo findByStuIdAndYear(Integer stuId, Integer thisYear) {
		IssueInfo model = new IssueInfo();
		model.setStuId(stuId);
		model.setYear(thisYear);
		List<IssueInfo> list= findByExample(model);
		if(list==null||list.size()<=0)
			return null;
		else{
			return list.get(0);
		}
	}

	@Override
	public List<IssueInfo> findByStuId(Integer stuId, Integer year) {
		return issueInfoDao.findByStuId(stuId,year);
	}

	@Override
	public void delByStuId(Integer stuId) {
		issueInfoDao.delByStuId(stuId);
	}

	@Override
	public List<IssueInfo> findByStuIdAndIssueType(Integer stuId, String issueType) {
		return issueInfoDao.findByStuIdAndIssueType( stuId,  issueType);
	}

}
