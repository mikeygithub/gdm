package com.gxwzu.system.model.sysStudent;

import java.util.Date;

/**
 * SysStudent entity. @author MyEclipse Persistence Tools
 */

public class SysStudent implements java.io.Serializable {

	// Fields

	private Integer stuId;
	private String stuNo;
	private String stuName;
	private String stuIdcart;
	private String stuAddress;
	private String stuArrangement;
	private String stuSchoollength;
	private Date stuEntrance;
	private String stuGrade;
	private String deptNumber;
	private Integer categoryId;
	private Integer majorId;
	private Integer classId;
	private Integer userId;

	// Constructors

	/** default constructor */
	public SysStudent() {
	}

	/** minimal constructor */
	public SysStudent(String stuName) {
		this.stuName = stuName;
	}

	/** full constructor */
	public SysStudent(String stuNo, String stuName, String stuIdcart,
			String stuAddress, String stuArrangement, String stuSchoollength,
			Date stuEntrance, String stuGrade, String deptNumber,
			Integer categoryId, Integer majorId, Integer classId, Integer userId) {
		this.stuNo = stuNo;
		this.stuName = stuName;
		this.stuIdcart = stuIdcart;
		this.stuAddress = stuAddress;
		this.stuArrangement = stuArrangement;
		this.stuSchoollength = stuSchoollength;
		this.stuEntrance = stuEntrance;
		this.stuGrade = stuGrade;
		this.deptNumber = deptNumber;
		this.categoryId = categoryId;
		this.majorId = majorId;
		this.classId = classId;
		this.userId = userId;
	}

	// Property accessors

	public Integer getStuId() {
		return this.stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getStuNo() {
		return this.stuNo;
	}

	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}

	public String getStuName() {
		return this.stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getStuIdcart() {
		return this.stuIdcart;
	}

	public void setStuIdcart(String stuIdcart) {
		this.stuIdcart = stuIdcart;
	}

	public String getStuAddress() {
		return this.stuAddress;
	}

	public void setStuAddress(String stuAddress) {
		this.stuAddress = stuAddress;
	}

	public String getStuArrangement() {
		return this.stuArrangement;
	}

	public void setStuArrangement(String stuArrangement) {
		this.stuArrangement = stuArrangement;
	}

	public String getStuSchoollength() {
		return this.stuSchoollength;
	}

	public void setStuSchoollength(String stuSchoollength) {
		this.stuSchoollength = stuSchoollength;
	}

	public Date getStuEntrance() {
		return this.stuEntrance;
	}

	public void setStuEntrance(Date stuEntrance) {
		this.stuEntrance = stuEntrance;
	}

	public String getStuGrade() {
		return this.stuGrade;
	}

	public void setStuGrade(String stuGrade) {
		this.stuGrade = stuGrade;
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

	public Integer getMajorId() {
		return this.majorId;
	}

	public void setMajorId(Integer majorId) {
		this.majorId = majorId;
	}

	public Integer getClassId() {
		return this.classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}