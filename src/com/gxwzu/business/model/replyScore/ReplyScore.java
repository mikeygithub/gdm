package com.gxwzu.business.model.replyScore;

/**
 * ReplyScore entity. @author MyEclipse Persistence Tools
 */

public class ReplyScore implements java.io.Serializable {

	// Fields

	private Integer replyId;
	private String replyLink;
	private Float replyScore;
	private Integer replyScoreFinish;
	private String grade;
	private Integer stuId;
	private Integer year;
	private String replyType;

	// Constructors

	/** default constructor */
	public ReplyScore() {
	}

	/** full constructor */
	public ReplyScore(String replyLink, Float replyScore, Integer replyScoreFinish, String grade, Integer stuId,
			Integer year, String replyType) {
		this.replyLink = replyLink;
		this.replyScore = replyScore;
		this.replyScoreFinish = replyScoreFinish;
		this.grade = grade;
		this.stuId = stuId;
		this.year = year;
		this.replyType = replyType;
	}

	// Property accessors

	public Integer getReplyId() {
		return this.replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}

	public String getReplyLink() {
		return this.replyLink;
	}

	public void setReplyLink(String replyLink) {
		this.replyLink = replyLink;
	}

	public Float getReplyScore() {
		return this.replyScore;
	}

	public void setReplyScore(Float replyScore) {
		this.replyScore = replyScore;
	}

	public Integer getReplyScoreFinish() {
		return this.replyScoreFinish;
	}

	public void setReplyScoreFinish(Integer replyScoreFinish) {
		this.replyScoreFinish = replyScoreFinish;
	}

	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Integer getStuId() {
		return this.stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public String getReplyType() {
		return this.replyType;
	}

	public void setReplyType(String replyType) {
		this.replyType = replyType;
	}

	@Override
	public String toString() {
		return "ReplyScore{" +
				"replyId=" + replyId +
				", replyLink='" + replyLink + '\'' +
				", replyScore=" + replyScore +
				", replyScoreFinish=" + replyScoreFinish +
				", grade='" + grade + '\'' +
				", stuId=" + stuId +
				", year=" + year +
				", replyType='" + replyType + '\'' +
				'}';
	}
}