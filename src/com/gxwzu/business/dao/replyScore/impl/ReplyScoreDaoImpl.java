package com.gxwzu.business.dao.replyScore.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.replyScore.IReplyScoreDao;
import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.business.model.replyScore.ReplyScore;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListReplyScore;

@SuppressWarnings("unchecked")
@Repository("replyScoreDao")
public class ReplyScoreDaoImpl extends BaseDaoImpl<ReplyScore>implements IReplyScoreDao {

	@Override
	public Result<ReplyScore> find(ReplyScore model, int page, int size) {
		StringBuffer queryString = new StringBuffer("FROM ReplyScore model where 1=1 ");
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		
		if(model.getStuId()!=null){
			queryString.append("and model.stuId=?");
			params.add(model.getStuId());
		}
		if(StringUtils.isNotEmpty(model.getReplyType())){
			queryString.append("and model.replyType=?");
			params.add(model.getReplyType());
		}
		if(model.getYear()!=null){
			queryString.append("and model.year=?");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.replyId DESC");
		
		return super.find(queryString.toString(), params.toArray(), null, start, limit);
	}


	@Override
	public List<ReplyScore> findByExample(ReplyScore model) {
		StringBuffer queryString = new StringBuffer(" FROM ReplyScore model where 1=1 ");

		List<Object> params = new ArrayList<Object>();
		if(model.getStuId()!=null){
			queryString.append(" and model.stuId=? ");
			params.add(model.getStuId());
		}
		if(StringUtils.isNotEmpty(model.getReplyType())){
			queryString.append(" and model.replyType=? ");
			params.add(model.getReplyType());
		}
		
		if(model.getYear()!=null){
			queryString.append(" and model.year=? ");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.replyId DESC");
		
		return super.findByExample(queryString.toString(),params.toArray() );
	}


	@Override
	public void updateByStuId(Integer stuId, int replyScoreFinish, String grade,float replyScore) {
		List<Object> params = new ArrayList<Object>();
		if(stuId != null && !"".equals(stuId)){
			String updateString = "update ReplyScore set replyScoreFinish = ? , grade = ? , replyScore = ? where  stuId = ?";
			params.add(replyScoreFinish);
			params.add(grade);
			params.add(replyScore);
			params.add(stuId);
			
			super.bulkUpdate(updateString, params.toArray(), null);
		}
	}


	@Override
	public ReplyScore findExcellentStudntBySudentReplyType(int replyScoreFinish, String replyType) {
		List<Object> params=new ArrayList<Object>();
		ReplyScore model=null;
		String queryString=" from ReplyScore model where 1=1 ";
		if(model.getReplyScoreFinish()!=null&&model.getReplyScoreFinish()>=90){
			queryString+=" and model.replyScoreFinish=? ";
			params.add(replyScoreFinish);
		}
		if(replyType != null && !"".equals(replyType)){
			 queryString+=" and model.replyType=? ";
			 params.add(replyType);
		}
		System.out.println(queryString);
		List<ReplyScore> list = super.findByExample(queryString, params.toArray());	 
        if(list!=null&&list.size()!=0){
    	   model = list.get(0);
        }
		return model;
	
	}

}
