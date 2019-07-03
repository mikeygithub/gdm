package com.gxwzu.system.model.sysIssueType;

/**
 * SysIssueType entity. @author MyEclipse Persistence Tools
 */

public class SysIssueType implements java.io.Serializable {

	// Fields

	private Integer issueTypeId;
	private String issueTypeName;

	// Constructors

	/** default constructor */
	public SysIssueType() {
	}

	/** full constructor */
	public SysIssueType(String issueTypeName) {
		this.issueTypeName = issueTypeName;
	}

	// Property accessors

	public Integer getIssueTypeId() {
		return this.issueTypeId;
	}

	public void setIssueTypeId(Integer issueTypeId) {
		this.issueTypeId = issueTypeId;
	}

	public String getIssueTypeName() {
		return this.issueTypeName;
	}

	public void setIssueTypeName(String issueTypeName) {
		this.issueTypeName = issueTypeName;
	}

}