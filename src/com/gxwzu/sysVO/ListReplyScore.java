package com.gxwzu.sysVO;

/**
 * ReplyScore entity. @author MyEclipse Persistence Tools
 */

public class ListReplyScore implements java.io.Serializable {

	// Fields

	private Integer replyId;
	private String replyLink;
	private Float replyScore;
	private int replyScoreFinish;
	private String grade;
	private Integer stuId;
	private Integer year;
	private String replyType;
	
	
	private String openReport;//开题报告 0-通过 1-不通过 2-缺席
	private Float guideScore;  //指导老师评分
	private Float checkScore; //指导老师规范审查查评分
	private Float readScore;  //评阅老师评阅评分
	
	// Constructors

	/** default constructor */
	public ListReplyScore() {
	}

	/** full constructor */
	public ListReplyScore(String replyLink, Float replyScore,
			int replyScoreFinish, String grade, Integer stuId, Integer year,
			String replyType) {
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

	public int getReplyScoreFinish() {
		return this.replyScoreFinish;
	}

	public void setReplyScoreFinish(int replyScoreFinish) {
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

	public Float getGuideScore() {
		return guideScore;
	}

	public void setGuideScore(Float guideScore) {
		this.guideScore = guideScore;
	}

	public Float getCheckScore() {
		return checkScore;
	}

	public void setCheckScore(Float checkScore) {
		this.checkScore = checkScore;
	}

	public Float getReadScore() {
		return readScore;
	}

	public void setReadScore(Float readScore) {
		this.readScore = readScore;
	}

	public String getOpenReport() {
		return openReport;
	}

	public void setOpenReport(String openReport) {
		this.openReport = openReport;
	}
                
}