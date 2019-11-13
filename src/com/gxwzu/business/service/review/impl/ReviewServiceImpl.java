package com.gxwzu.business.service.review.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.review.IReviewDao;
import com.gxwzu.business.dao.review.IReviewScoreDao;
import com.gxwzu.business.model.review.Review;
import com.gxwzu.business.model.review.ReviewScore;
import com.gxwzu.business.service.review.IReviewSerivce;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListReview;

@Service("reviewService")
public class ReviewServiceImpl extends BaseServiceImpl<Review> implements IReviewSerivce{
    @Autowired
    private IReviewDao reviewDao;
    @Autowired
    private IReviewScoreDao reviewScoreDao;
    public BaseDao<Review> getDao() {
		return this.reviewDao;
	}

	@Override
	public Result<ListReview> find(Review model, int page, int size) {
		Result<Review> oldResult = reviewDao.find(model, page, size);
		Result<ListReview> newResult = new Result<ListReview>();
		List<ListReview> newList = new ArrayList<ListReview>();
		if (oldResult != null && oldResult.getData() != null
				&& oldResult.getData().size() != 0) {

			for (Review m : oldResult.getData()) {
				ListReview newModel =new  ListReview();
				ReviewScore rScore  = new ReviewScore();
				rScore.setReviewId(m.getReviewId());
				rScore.setYear(rScore.getYear());
				List<ReviewScore> rList =  reviewScoreDao.findByExample(rScore);
				newModel.setReviewId(m.getReviewId());
				newModel.setStuId(m.getStuId());
				newModel.setTeacherId(m.getTeacherId());
				newModel.setReviewContent(m.getReviewContent());
				newModel.setTotalScore(m.getTotalScore());
				newModel.setYear(m.getYear());
				newModel.setReplyLink(m.getReplyLink());
				newModel.setReviewScoreList(rList);
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
	public List<ListReview> findByExample(Review model) {
		List<Review> oldList =  reviewDao.findByExample(model);
		List<ListReview> newList = new ArrayList<ListReview>();
		if (oldList != null && oldList.size() != 0) {

			for (Review m : oldList) {
				ListReview newModel =new  ListReview();
				ReviewScore rScore  = new ReviewScore();
				rScore.setReviewId(m.getReviewId());
				rScore.setYear(rScore.getYear());
			
				List<ReviewScore> rList =  reviewScoreDao.findByExample(rScore);
				newModel.setReviewId(m.getReviewId());
				newModel.setStuId(m.getStuId());
				newModel.setTeacherId(m.getTeacherId());
				newModel.setReviewContent(m.getReviewContent());
				newModel.setTotalScore(m.getTotalScore());
				newModel.setYear(m.getYear());
				newModel.setReplyLink(m.getReplyLink());
				newModel.setReviewType(m.getReviewType());
				newModel.setReviewScoreList(rList);
				newList.add(newModel);
			}
		}
		return newList;
	}


	@Override
	public Review findById(Integer id) {
		return reviewDao.get(Review.class, id);
	}

	@Override
	public void del(Integer id) {
		remove(Review.class,id);
	}

	@Override
	public ListReview findViewModelById(Integer id) {
		if(id==null)return null;
		Review model = new Review();
		model.setReviewId(id);
		List<ListReview> list = findByExample(model);
		if(list==null||list.size()<=0)
			return null;
		else{
			return list.get(0);
		}
	}

	@Override
	public ListReview findByStuIdAndReviewTypeAndYear(Integer stuId, String reviewType, Integer year) {
		Review model = new Review();
		model.setStuId(stuId);
		model.setYear(year);
		model.setReviewType(reviewType);
		List<ListReview> list= findByExample(model);
		if(list==null||list.size()<=0)
			return null;
		else{
			return list.get(0);
		}
	}

}
