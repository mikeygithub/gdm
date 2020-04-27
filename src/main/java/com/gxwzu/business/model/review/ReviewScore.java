package com.gxwzu.business.model.review;

import java.util.Date;

/**
 * ReviewScore entity. @author MyEclipse Persistence Tools
 */

public class ReviewScore implements java.io.Serializable {

	// Fields

	private Integer reviewScoreId;
	private Integer reviewId;
	private Integer scoreItemId;
	private Float score;
	private Integer weight;
	private String remark;
	private Integer year;
	private Date opTime;
	// Constructors

	/** default constructor */
	public ReviewScore() {
	}

	/** minimal constructor */
	public ReviewScore(Integer scoreItemId) {
		this.scoreItemId = scoreItemId;
	}

	/** full constructor */
	public ReviewScore(Integer reviewId, Integer scoreItemId, Float score,
			Integer weight, String remark, Integer year, Date opTime) {
		this.reviewId = reviewId;
		this.scoreItemId = scoreItemId;
		this.score = score;
		this.weight = weight;
		this.remark = remark;
		this.year = year;
		this.opTime = opTime;
	}

	// Property accessors

	public Integer getReviewScoreId() {
		return this.reviewScoreId;
	}

	public void setReviewScoreId(Integer reviewScoreId) {
		this.reviewScoreId = reviewScoreId;
	}

	public Integer getReviewId() {
		return this.reviewId;
	}

	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}

	public Integer getScoreItemId() {
		return this.scoreItemId;
	}

	public void setScoreItemId(Integer scoreItemId) {
		this.scoreItemId = scoreItemId;
	}

	public Float getScore() {
		return this.score;
	}

	public void setScore(Float score) {
		this.score = score;
	}

	public Integer getWeight() {
		return this.weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Date getOpTime() {
		return opTime;
	}

	public void setOpTime(Date opTime) {
		this.opTime = opTime;
	}

}