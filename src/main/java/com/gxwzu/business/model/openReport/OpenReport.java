package com.gxwzu.business.model.openReport;

import java.util.Date;

/**
 * OpenReport entity. @author MyEclipse Persistence Tools
 */

public class OpenReport implements java.io.Serializable {

	// Fields

	private Integer reportId;
	private String background;
	private String reportContent;
	private String reportMethod;
	private String reportDocument;
	private Integer stuId;
	private Integer teacherId;
	private Integer year;
	private String replyLink;
	// Constructors

	/** default constructor */
	public OpenReport() {
	}

	/** full constructor */
	public OpenReport(String background, String reportContent,
			String reportMethod, String reportDocument, Integer stuId,
			Integer teacherId, Integer year,String replyLink) {
		this.background = background;
		this.reportContent = reportContent;
		this.reportMethod = reportMethod;
		this.reportDocument = reportDocument;
		this.stuId = stuId;
		this.teacherId = teacherId;
		this.year = year;
		this.replyLink = replyLink;
	}

	// Property accessors

	public Integer getReportId() {
		return this.reportId;
	}

	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}

	public String getBackground() {
		return this.background;
	}

	public void setBackground(String background) {
		this.background = background;
	}

	public String getReportContent() {
		return this.reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public String getReportMethod() {
		return this.reportMethod;
	}

	public void setReportMethod(String reportMethod) {
		this.reportMethod = reportMethod;
	}

	public String getReportDocument() {
		return this.reportDocument;
	}

	public void setReportDocument(String reportDocument) {
		this.reportDocument = reportDocument;
	}

	public Integer getStuId() {
		return this.stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
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

	public String getReplyLink() {
		return replyLink;
	}

	public void setReplyLink(String replyLink) {
		this.replyLink = replyLink;
	}

	@Override
	public String toString() {
		return "OpenReport{" +
				"reportId=" + reportId +
				", background='" + background + '\'' +
				", reportContent='" + reportContent + '\'' +
				", reportMethod='" + reportMethod + '\'' +
				", reportDocument='" + reportDocument + '\'' +
				", stuId=" + stuId +
				", teacherId=" + teacherId +
				", year=" + year +
				", replyLink='" + replyLink + '\'' +
				'}';
	}
}