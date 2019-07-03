package com.gxwzu.sysVO;

import com.gxwzu.core.util.ObjectUtil;

/**
 * IssueInfo entity. @author MyEclipse Persistence Tools
 */

public class ListIssueInfo extends ListStudent {

	// Fields
	private Integer issueId;
	private String issueName;
	private String issueType;
	private Integer year;
	private Integer taskId;

	/** default constructor */
	public ListIssueInfo() {
	}

	public ListIssueInfo(Object[] o) {
		super(o);
		this.issueId = ObjectUtil.getInteger(o[21]);
		this.issueName = ObjectUtil.getString(o[22]);
		this.issueType = ObjectUtil.getString(o[23]);
		this.year = ObjectUtil.getInteger(o[24]);
		
		this.taskId = ObjectUtil.getInteger(o[25]);
	}

	public Integer getIssueId() {
		return issueId;
	}

	public void setIssueId(Integer issueId) {
		this.issueId = issueId;
	}

	public String getIssueName() {
		return issueName;
	}

	public void setIssueName(String issueName) {
		this.issueName = issueName;
	}

	public String getIssueType() {
		return issueType;
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

	public Integer getTaskId() {
		return taskId;
	}

	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}

}