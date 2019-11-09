package com.gxwzu.business.model.issueInfo;

import java.sql.Timestamp;
import java.util.Date;

/**
 * IssueInfo entity. @author MyEclipse Persistence Tools
 */

public class IssueInfo implements java.io.Serializable {

	// Fields

	private Integer issueId;
	private Integer stuId;
	private String issueName;
	private String issueType;
	private Integer year;
	private Integer isPass;

	// Constructors

	/** default constructor */
	public IssueInfo() {
	}

	public IssueInfo(Integer issueId, Integer stuId, String issueName, String issueType, Integer year, Integer isPass) {
		this.issueId = issueId;
		this.stuId = stuId;
		this.issueName = issueName;
		this.issueType = issueType;
		this.year = year;
		this.isPass = isPass;
	}

	/** full constructor */


	// Property accessors

	public Integer getIssueId() {
		return this.issueId;
	}

	public void setIssueId(Integer issueId) {
		this.issueId = issueId;
	}

	public Integer getStuId() {
		return this.stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getIssueName() {
		return this.issueName;
	}

	public void setIssueName(String issueName) {
		this.issueName = issueName;
	}

	public String getIssueType() {
		return this.issueType;
	}

	public void setIssueType(String issueType) {
		this.issueType = issueType;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getIsPass() {
		return isPass;
	}

	public void setIsPass(Integer isPass) {
		this.isPass = isPass;
	}
}