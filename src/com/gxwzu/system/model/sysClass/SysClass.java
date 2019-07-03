package com.gxwzu.system.model.sysClass;

/**
 * SysClass entity. @author MyEclipse Persistence Tools
 */

public class SysClass implements java.io.Serializable {

	// Fields

	private Integer classId;
	private String classNo;
	private String className;
	private String deptNumber;
	private Integer majorId;

	// Constructors

	/** default constructor */
	public SysClass(Object[] o) {
		super();
		this.classId = (Integer) o[0];
		this.classNo = ""+ o[1];
		this.className = ""+ o[2];
		this.deptNumber = ""+ o[3];
		this.majorId = (Integer) o[4];
		
	}

	/** full constructor */
	public SysClass(String classNo, String className, String deptNumber,
			Integer majorId) {
		this.classNo = classNo;
		this.className = className;
		this.deptNumber = deptNumber;
		this.majorId = majorId;
	}

	// Property accessors

	public SysClass() {
		
	}

	public Integer getClassId() {
		return this.classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public String getClassNo() {
		return this.classNo;
	}

	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}

	public String getClassName() {
		return this.className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getDeptNumber() {
		return this.deptNumber;
	}

	public void setDeptNumber(String deptNumber) {
		this.deptNumber = deptNumber;
	}

	public Integer getMajorId() {
		return this.majorId;
	}

	public void setMajorId(Integer majorId) {
		this.majorId = majorId;
	}

}