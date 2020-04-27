package com.gxwzu.business.dao.review.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.review.IReviewScoreDao;
import com.gxwzu.business.model.review.ReviewScore;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;

@SuppressWarnings("unchecked")
@Repository("reviewScoreDao")
public class ReviewScoreScoreDaoImpl extends BaseDaoImpl<ReviewScore>implements IReviewScoreDao {

	@Override
	public Result<ReviewScore> find(ReviewScore model, int page, int size) {
		StringBuffer queryString = new StringBuffer("FROM ReviewScore model where 1=1 ");
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		
		if(model.getReviewId()!=null){
			queryString.append("and model.reviewId=?");
			params.add(model.getReviewId());
		}
		if(model.getScoreItemId()!=null){
			queryString.append("and model.scoreItemId=?");
			params.add(model.getScoreItemId());
		}
		if(model.getYear()!=null){
			queryString.append("and model.year=?");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.reviewScoreId DESC");
		
		return super.find(queryString.toString(), params.toArray(), null, start, limit);
	}


	@Override
	public List<ReviewScore> findByExample(ReviewScore model) {
		StringBuffer queryString = new StringBuffer("FROM ReviewScore model where 1=1 ");

		List<Object> params = new ArrayList<Object>();
		if(model.getReviewScoreId()!=null){
			queryString.append("and model.reviewScoreId=?");
			params.add(model.getReviewScoreId());
		}
		if(model.getReviewId()!=null){
			queryString.append("and model.reviewId=?");
			params.add(model.getReviewId());
		}
		if(model.getScoreItemId()!=null){
			queryString.append("and model.scoreItemId=?");
			params.add(model.getScoreItemId());
		}
		if(model.getYear()!=null){
			queryString.append("and model.year=?");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.weight ASC");
		
		return super.findByExample(queryString.toString(),params.toArray() );
	}

}
