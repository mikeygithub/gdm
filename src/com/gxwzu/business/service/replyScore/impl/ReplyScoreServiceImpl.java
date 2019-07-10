package com.gxwzu.business.service.replyScore.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.replyScore.IReplyScoreDao;
import com.gxwzu.business.model.openReport.OpenReport;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.replyScore.ReplyScore;
import com.gxwzu.business.service.openReport.IOpenReportSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.business.service.replyScore.IReplyScoreSerivce;
import com.gxwzu.business.service.review.IReviewSerivce;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListReplyScore;
import com.gxwzu.sysVO.ListReview;

@Service("replyScoreService")
public class ReplyScoreServiceImpl extends BaseServiceImpl<ReplyScore> implements IReplyScoreSerivce{
    @Autowired
    private IReplyScoreDao replyScoreDao;
    @Autowired
	private IReviewSerivce reviewSerivce; // 评阅审查接口
    @Autowired
   	private IOpenReportSerivce openReportSerivce; // 评阅审查接口
    @Autowired
	private IPlanYearSerivce planYearSerivce; // 年度计划接口
    
    public BaseDao<ReplyScore> getDao() {
		return this.replyScoreDao;
	}

	@Override
	public Result<ListReplyScore> find(ReplyScore model, int page, int size) {
		Result<ReplyScore> oldResult = replyScoreDao.find(model, page, size);
		Result<ListReplyScore> newResult = new Result<ListReplyScore>();
		List<ListReplyScore> newList = new ArrayList<ListReplyScore>();
		//查询安排计划年度
		PlanYear planYear = planYearSerivce.findPlanYear();
		if (oldResult != null && oldResult.getData() != null
				&& oldResult.getData().size() != 0) {

			for (ReplyScore m : oldResult.getData()) {
				ListReplyScore newModel =new  ListReplyScore();
				newModel.setReplyId(m.getReplyId());
				newModel.setStuId(m.getStuId());
				newModel.setReplyType(m.getReplyType());
				newModel.setGrade(m.getGrade());
				newModel.setReplyScoreFinish(m.getReplyScoreFinish());
				newModel.setReplyScore(m.getReplyScore());
				newModel.setYear(m.getYear());
				newModel.setReplyLink(m.getReplyLink());
				
				
				//开题报告结论 0-通过 1-不通过 2-缺席
				OpenReport report  = openReportSerivce.findByStuIdAndYear(m.getStuId(),planYear.getYear());
				if (report != null) {
					String openReport =  report.getReplyLink(); 
					newModel.setOpenReport(openReport);
				}
				
				 //评阅审查表类型：00 指导老师评阅  01评阅人评阅  02指导老师审查 
				// 指导老师评阅评分  90分×45%=40.5 
				ListReview reviewGuide  = reviewSerivce.findByStuIdAndReviewTypeAndYear(m.getStuId(),"00",model.getYear());
				if (reviewGuide != null) {
					Float guideScore =  (float) (reviewGuide.getTotalScore()*0.45);
					newModel.setGuideScore(guideScore);
				}
				//  指导评阅审查评分  93分×10%= 9.3
				ListReview reviewCheck  = reviewSerivce.findByStuIdAndReviewTypeAndYear(m.getStuId(),"02",model.getYear());
				if (reviewCheck != null) {
					Float checkScore =  (float) (reviewGuide.getTotalScore()*0.1);
					newModel.setCheckScore(checkScore);
				}
				// 评阅老师评阅评分 88分×20%= 17.6
				ListReview reviewRead  = reviewSerivce.findByStuIdAndReviewTypeAndYear(m.getStuId(),"01",model.getYear());
				if (reviewRead != null) {
					Float readScore =  (float) (reviewGuide.getTotalScore()*0.2);
					newModel.setReadScore(readScore);
				}
				
				
				newList.add(newModel);
			}
		}
		newResult.setData(newList);
		newResult.setOffset(oldResult.getOffset());
		newResult.setPage(oldResult.getPage());
		newResult.setSize(oldResult.getSize());
		newResult.setTotal(oldResult.getTotal());
		newResult.setTotalPage(oldResult.getTotalPage());
		return newResult;
	}


	@Override
	public List<ListReplyScore> findByExample(ReplyScore model) {
		List<ReplyScore> oldList =  replyScoreDao.findByExample(model);
		List<ListReplyScore> newList = new ArrayList<ListReplyScore>();
		if (oldList != null && oldList.size() != 0) {

			for (ReplyScore m : oldList) {
				ListReplyScore newModel =new  ListReplyScore();
				newModel.setReplyId(m.getReplyId());
				newModel.setStuId(m.getStuId());
				newModel.setReplyType(m.getReplyType());
				newModel.setGrade(m.getGrade());
				newModel.setReplyScoreFinish(m.getReplyScoreFinish()!=null?m.getReplyScoreFinish():0);
				newModel.setReplyScore(m.getReplyScore());
				newModel.setYear(m.getYear());
				newModel.setReplyLink(m.getReplyLink());
				
				//评阅审查表类型：00 指导老师评阅  01评阅人评阅  02指导老师审查  03开题报告
				
				
				
				// 指导老师评阅评分  90分×45%=40.5 
				ListReview reviewGuide  = reviewSerivce.findByStuIdAndReviewTypeAndYear(m.getStuId(),"00",model.getYear());
				if (reviewGuide != null) {
					Float guideScore =  (float) (reviewGuide.getTotalScore()*0.45);
					newModel.setGuideScore(guideScore);
				}
				//  指导评阅审查评分  93分×10%= 9.3
				ListReview reviewCheck  = reviewSerivce.findByStuIdAndReviewTypeAndYear(m.getStuId(),"02",model.getYear());
				if (reviewCheck != null) {
					Float checkScore =  (float) (reviewGuide.getTotalScore()*0.1);
					newModel.setCheckScore(checkScore);
				}
				// 评阅老师评阅评分 88分×20%= 17.6
				ListReview reviewRead  = reviewSerivce.findByStuIdAndReviewTypeAndYear(m.getStuId(),"01",model.getYear());
				if (reviewRead != null) {
					Float readScore =  (float) (reviewGuide.getTotalScore()*0.2);
					newModel.setReadScore(readScore);
				}
				newList.add(newModel);	
			}
		}
		return newList;
	}


	@Override
	public ReplyScore findById(Integer id) {
		return replyScoreDao.get(ReplyScore.class, id);
	}

	@Override
	public void del(Integer id) {
		remove(ReplyScore.class,id);
	}

	@Override
	public ListReplyScore findViewModelById(Integer id) {
		if(id==null)
			return null;
		
		ReplyScore model = new ReplyScore();
		model.setReplyId(id);
		List<ListReplyScore> list = findByExample(model);
		if(list==null||list.size()<=0)
			return null;
		else{
			return list.get(0);
		}
	}

	@Override
	public ListReplyScore findByStuIdAndReplyTypeAndYear(Integer stuId,
			String replyType, Integer year) {
		ReplyScore model = new ReplyScore();
		model.setStuId(stuId);
		model.setReplyType(replyType);
		model.setYear(year);
		List<ListReplyScore> list= findByExample(model);
		if(list==null||list.size()<=0)
			return null;
		else{
			return list.get(0);
		}
	}

	@Override
	public ListReplyScore findByStudentIdAndYear(Integer stuId, Integer year) {
		ReplyScore model = new ReplyScore();
		model.setStuId(stuId);
		model.setYear(year);
		List<ListReplyScore> list= findByExample(model);
		if(list==null||list.size()<=0)
			return null;
		else{
			return list.get(0);
		}
	}

	@Override
	public void updateByStuId(Integer stuId,String replyLink, int replyScoreFinish, String grade, float replyScore) {
	    replyScoreDao.updateByStuId(stuId,replyLink,replyScoreFinish,grade,  replyScore);
	}

	@Override
	public ReplyScore findExcellentStudntBySudentReplyType(int replyScoreFinish, String replyType) {
		return replyScoreDao.findExcellentStudntBySudentReplyType(replyScoreFinish,replyType);
	}



}
