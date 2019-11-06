package com.gxwzu.system.model.sysMajor;

/**
 * SysMajor entity. @author MyEclipse Persistence Tools
 */

public class SysMajor implements java.io.Serializable {

	// Fields

	private Integer majorId;
	private String deptNumber;
	private Integer categoryId;
	private String majorNo;
	private String majorName;
	private String staffName;

	// Constructors

	/** default constructor */
	public SysMajor() {
	}

	/** full constructor */
	public SysMajor(String deptNumber, Integer categoryId, String majorNo,
			String majorName, String staffName) {
		this.deptNumber = deptNumber;
		this.categoryId = categoryId;
		this.majorNo = majorNo;
		this.majorName = majorName;
		this.staffName = staffName;
	}

	// Property accessors

	public Integer getMajorId() {
		return this.majorId;
	}

	public void setMajorId(Integer majorId) {
		this.majorId = majorId;
	}

	public String getDeptNumber() {
		return this.deptNumber;
	}

	public void setDeptNumber(String deptNumber) {
		this.deptNumber = deptNumber;
	}

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getMajorNo() {
		return this.majorNo;
	}

	public void setMajorNo(String majorNo) {
		this.majorNo = majorNo;
	}

	public String getMajorName() {
		return this.majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public String getStaffName() {
		return this.staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	@Override
	public String toString() {
		return "SysMajor{" +
				"majorId=" + majorId +
				", deptNumber='" + deptNumber + '\'' +
				", categoryId=" + categoryId +
				", majorNo='" + majorNo + '\'' +
				", majorName='" + majorName + '\'' +
				", staffName='" + staffName + '\'' +
				'}';
	}
}