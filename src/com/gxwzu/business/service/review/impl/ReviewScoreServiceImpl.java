package com.gxwzu.business.service.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.review.IReviewScoreDao;
import com.gxwzu.business.model.review.ReviewScore;
import com.gxwzu.business.service.review.IReviewScoreSerivce;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;

@Service("reviewScoreService")
public class ReviewScoreServiceImpl extends BaseServiceImpl<ReviewScore> implements IReviewScoreSerivce{
    @Autowired
    private IReviewScoreDao reviewScoreDao;
    
    public BaseDao<ReviewScore> getDao() {
		return this.reviewScoreDao;
	}

	@Override
	public ReviewScore addOrEdit(ReviewScore model) {
		return reviewScoreDao.saveOrUpdate(model);
	}


	@Override
	public Result<ReviewScore> find(ReviewScore model, int page, int size) {
		 return reviewScoreDao.find(model, page, size);
	}


	@Override
	public List<ReviewScore> findByExample(ReviewScore model) {
		return reviewScoreDao.findByExample(model);
	}


	@Override
	public ReviewScore findById(Integer id) {
		return reviewScoreDao.get(ReviewScore.class, id);
	}

	@Override
	public void del(Integer id) {
		remove(ReviewScore.class,id);
	}

}
