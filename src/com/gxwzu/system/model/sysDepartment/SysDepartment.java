package com.gxwzu.system.model.sysDepartment;

/**
 * SysDepartment entity. @author MyEclipse Persistence Tools
 */

public class SysDepartment implements java.io.Serializable {

	// Fields

	private Integer id;
	private String deptNumber;
	private String deptName;
	private String deptDescription;

	// Constructors

	/** default constructor */
	public SysDepartment() {
	}

	/** full constructor */
	public SysDepartment(String deptNumber, String deptName, String deptDescription) {
		this.deptNumber = deptNumber;
		this.deptName = deptName;
		this.deptDescription = deptDescription;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDeptNumber() {
		return this.deptNumber;
	}

	public void setDeptNumber(String deptNumber) {
		this.deptNumber = deptNumber;
	}

	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptDescription() {
		return this.deptDescription;
	}

	public void setDeptDescription(String deptDescription) {
		this.deptDescription = deptDescription;
	}

}