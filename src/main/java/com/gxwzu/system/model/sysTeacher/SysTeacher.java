package com.gxwzu.system.model.sysTeacher;

/**
 * SysTeacher entity. @author MyEclipse Persistence Tools
 */

public class SysTeacher implements java.io.Serializable {

	// Fields

	private Integer teacherId;
	private String teacherNo;
	private String teacherName;
	private String deptNumber;
	private Integer categoryId;
	private Integer staffroomId;
	private Integer technicalId;
	private String dutiesNo;
	private Integer userId;

	// Constructors

	/** default constructor */
	public SysTeacher() {
	}

	/** full constructor */
	public SysTeacher(String teacherNo, String teacherName, String deptNumber,
			Integer categoryId, Integer staffroomId, Integer technicalId,
			String dutiesNo, Integer userId) {
		this.teacherNo = teacherNo;
		this.teacherName = teacherName;
		this.deptNumber = deptNumber;
		this.categoryId = categoryId;
		this.staffroomId = staffroomId;
		this.technicalId = technicalId;
		this.dutiesNo = dutiesNo;
		this.userId = userId;
	}

	// Property accessors

	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacherNo() {
		return this.teacherNo;
	}

	public void setTeacherNo(String teacherNo) {
		this.teacherNo = teacherNo;
	}

	public String getTeacherName() {
		return this.teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
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

	public Integer getStaffroomId() {
		return this.staffroomId;
	}

	public void setStaffroomId(Integer staffroomId) {
		this.staffroomId = staffroomId;
	}

	public Integer getTechnicalId() {
		return this.technicalId;
	}

	public void setTechnicalId(Integer technicalId) {
		this.technicalId = technicalId;
	}

	public String getDutiesNo() {
		return this.dutiesNo;
	}

	public void setDutiesNo(String dutiesNo) {
		this.dutiesNo = dutiesNo;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}