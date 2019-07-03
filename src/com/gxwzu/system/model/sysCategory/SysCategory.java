package com.gxwzu.system.model.sysCategory;

/**
 * SysCategory entity. @author MyEclipse Persistence Tools
 */

public class SysCategory implements java.io.Serializable {

	// Fields

	private Integer categoryId;
	private String categoryName;
	private String deptNumber;

	// Constructors

	/** default constructor */
	public SysCategory() {
	}

	/** full constructor */
	public SysCategory(String categoryName, String deptNumber) {
		this.categoryName = categoryName;
		this.deptNumber = deptNumber;
	}

	// Property accessors

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getDeptNumber() {
		return this.deptNumber;
	}

	public void setDeptNumber(String deptNumber) {
		this.deptNumber = deptNumber;
	}

}