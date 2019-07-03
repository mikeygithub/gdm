package com.gxwzu.business.service.review;

import java.util.List;

import com.gxwzu.business.model.review.Review;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListReview;

public interface IReviewSerivce extends BaseService<Review> {

	public Result<ListReview> find(Review model, int page, int size);

	public List<ListReview> findByExample(Review model);
	
	public ListReview findViewModelById(Integer id);
	
	public Review findById(Integer id);

	public void del(Integer id);

	public ListReview findByStuIdAndReviewTypeAndYear(Integer stuId,
			String reviewType, Integer year);
}
