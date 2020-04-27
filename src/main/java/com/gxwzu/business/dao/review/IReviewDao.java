package com.gxwzu.business.dao.review;

import java.util.List;

import com.gxwzu.business.model.review.Review;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;

/**
 * 评阅、审查DAO
 * @author he
 *
 */
public interface IReviewDao extends BaseDao<Review> {
	
	public Result<Review> find(Review model, int page, int size);

	public List<Review> findByExample(Review model);
}
