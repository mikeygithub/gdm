package com.gxwzu.business.dao.review.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.review.IReviewDao;
import com.gxwzu.business.model.review.Review;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;

@SuppressWarnings("unchecked")
@Repository("reviewDao")
public class ReviewDaoImpl extends BaseDaoImpl<Review>implements IReviewDao {

	@Override
	public Result<Review> find(Review model, int page, int size) {
		StringBuffer queryString = new StringBuffer("FROM Review model where 1=1 ");
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		
		if(model.getStuId()!=null){
			queryString.append("and model.stuId=?");
			params.add(model.getStuId());
		}
		if(model.getTeacherId()!=null){
			queryString.append("and model.teacherId=?");
			params.add(model.getTeacherId());
		}

		if(StringUtils.isNotEmpty(model.getReplyLink())){
			queryString.append("and model.replyLink=?");
			params.add(model.getReplyLink());
		}
		if(model.getYear()!=null){
			queryString.append("and model.year=?");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.reviewId DESC");
		
		return super.find(queryString.toString(), params.toArray(), null, start, limit);
	}


	@Override
	public List<Review> findByExample(Review model) {
		StringBuffer queryString = new StringBuffer("FROM Review model where 1=1 ");

		List<Object> params = new ArrayList<Object>();
		if(model.getReviewId()!=null){
			queryString.append("and model.reviewId=?");
			params.add(model.getReviewId());
		}
		
		if(model.getStuId()!=null){
			queryString.append("and model.stuId=?");
			params.add(model.getStuId());
		}
		if(model.getTeacherId()!=null){
			queryString.append("and model.teacherId=?");
			params.add(model.getTeacherId());
		}
		if(StringUtils.isNotEmpty(model.getReviewType())){
			queryString.append(" and model.reviewType=? ");
			params.add(model.getReviewType());
		}

		if(StringUtils.isNotEmpty(model.getReplyLink())){
			queryString.append("and model.replyLink=?");
			params.add(model.getReplyLink());
		}
		if(model.getYear()!=null){
			queryString.append("and model.year=?");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.reviewId DESC");
		
		return super.findByExample(queryString.toString(),params.toArray() );
	}

}
