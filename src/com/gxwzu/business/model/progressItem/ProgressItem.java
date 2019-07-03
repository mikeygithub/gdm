package com.gxwzu.business.model.progressItem;

/**
 * ProgressItem entity. @author MyEclipse Persistence Tools
 */

public class ProgressItem implements java.io.Serializable {

	// Fields

	private Integer progressItemId;
	private String progressItemNo;
	private String progressName;

	// Constructors

	/** default constructor */
	public ProgressItem() {
	}

	/** full constructor */
	public ProgressItem(String progressItemNo, String progressName) {
		this.progressItemNo = progressItemNo;
		this.progressName = progressName;
	}

	// Property accessors

	public Integer getProgressItemId() {
		return this.progressItemId;
	}

	public void setProgressItemId(Integer progressItemId) {
		this.progressItemId = progressItemId;
	}

	public String getProgressItemNo() {
		return this.progressItemNo;
	}

	public void setProgressItemNo(String progressItemNo) {
		this.progressItemNo = progressItemNo;
	}

	public String getProgressName() {
		return this.progressName;
	}

	public void setProgressName(String progressName) {
		this.progressName = progressName;
	}

}