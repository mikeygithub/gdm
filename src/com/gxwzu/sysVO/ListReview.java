package com.gxwzu.sysVO;

import java.util.ArrayList;
import java.util.List;

import com.gxwzu.business.model.review.ReviewScore;
import com.gxwzu.business.model.score.ScoreItem;

/**
 * Review entity. @author MyEclipse Persistence Tools
 */

public class ListReview implements java.io.Serializable {

	// Fields

	private Integer reviewId;
	private Integer issueId;
	private Integer stuId;
	private Float totalScore;
	private String reviewContent;
	private String replyLink;
	private Integer teacherId;
	private String reviewType;
	
	private Integer year;
	private List<ReviewScore> reviewScoreList = new ArrayList<ReviewScore>(); 
	// Constructors

	/** default constructor */
	public ListReview() {
	}

	/** full constructor */
	public ListReview(Integer stuId, Float totalScore, String reviewContent,
			String replyLink, Integer teacherId, Integer year) {
		this.stuId = stuId;
		this.totalScore = totalScore;
		this.reviewContent = reviewContent;
		this.replyLink = replyLink;
		this.teacherId = teacherId;
		this.year = year;
	}

	// Property accessors

	public Integer getReviewId() {
		return this.reviewId;
	}

	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}

	public Integer getStuId() {
		return this.stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public Float getTotalScore() {
		return this.totalScore;
	}

	public void setTotalScore(Float totalScore) {
		this.totalScore = totalScore;
	}

	public String getReviewContent() {
		return this.reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReplyLink() {
		return this.replyLink;
	}

	public void setReplyLink(String replyLink) {
		this.replyLink = replyLink;
	}

	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}


	public List<ReviewScore> getReviewScoreList() {
		return reviewScoreList;
	}

	public void setReviewScoreList(List<ReviewScore> reviewScoreList) {
		this.reviewScoreList = reviewScoreList;
	}

	public Integer getIssueId() {
		return issueId;
	}

	public void setIssueId(Integer issueId) {
		this.issueId = issueId;
	}

	public String getReviewType() {
		return reviewType;
	}

	public void setReviewType(String reviewType) {
		this.reviewType = reviewType;
	}
	

}