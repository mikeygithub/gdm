package com.gxwzu.business.service.review;

import java.util.List;

import com.gxwzu.business.model.review.ReviewScore;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;

public interface IReviewScoreSerivce extends BaseService<ReviewScore> {

	public Result<ReviewScore> find(ReviewScore model, int page, int size);

	public List<ReviewScore> findByExample(ReviewScore model);
	
	public ReviewScore findById(Integer id);
	
	public ReviewScore addOrEdit(ReviewScore model);

	public void del(Integer id);
}
