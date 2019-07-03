package com.gxwzu.business.dao.review;

import java.util.List;

import com.gxwzu.business.model.review.ReviewScore;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;

/**
 * 评阅、审查评分DAO
 * @author he
 *
 */
public interface IReviewScoreDao extends BaseDao<ReviewScore> {
	
	public Result<ReviewScore> find(ReviewScore model, int page, int size);

	public List<ReviewScore> findByExample(ReviewScore model);
}
