package com.gxwzu.business.model.review;

import java.util.Date;

/**
 * Review entity. @author MyEclipse Persistence Tools
 */

public class Review implements java.io.Serializable {

	// Fields

	private Integer reviewId;
	private Integer stuId;
	private Float totalScore;
	private Integer teacherId;
	private String reviewContent;
	private String reviewType;
	private String replyLink;
	private Integer year;
	private Date opTime;

	// Constructors

	/** default constructor */
	public Review() {
	}

	/** full constructor */
	public Review(Integer stuId, Float totalScore, Integer teacherId,
			String reviewContent, String reviewType, String replyLink,
			Integer year, Date opTime) {
		this.stuId = stuId;
		this.totalScore = totalScore;
		this.teacherId = teacherId;
		this.reviewContent = reviewContent;
		this.reviewType = reviewType;
		this.replyLink = replyLink;
		this.year = year;
		this.opTime = opTime;
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

	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public String getReviewContent() {
		return this.reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewType() {
		return this.reviewType;
	}

	public void setReviewType(String reviewType) {
		this.reviewType = reviewType;
	}

	public String getReplyLink() {
		return this.replyLink;
	}

	public void setReplyLink(String replyLink) {
		this.replyLink = replyLink;
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

	@Override
	public String toString() {
		return "Review{" +
				"reviewId=" + reviewId +
				", stuId=" + stuId +
				", totalScore=" + totalScore +
				", teacherId=" + teacherId +
				", reviewContent='" + reviewContent + '\'' +
				", reviewType='" + reviewType + '\'' +
				", replyLink='" + replyLink + '\'' +
				", year=" + year +
				", opTime=" + opTime +
				'}';
	}
}