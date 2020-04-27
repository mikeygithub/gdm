package com.gxwzu.business.model.teacherMajor;

/**
 * TeacherMajor entity. @author MyEclipse Persistence Tools
 */

public class TeacherMajor implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer teacherId;
	private Integer majorId;
	private Integer year;

	// Constructors

	/** default constructor */
	public TeacherMajor() {
	}

	/** full constructor */
	public TeacherMajor(Integer teacherId, Integer majorId, Integer year) {
		this.teacherId = teacherId;
		this.majorId = majorId;
		this.year = year;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public Integer getMajorId() {
		return this.majorId;
	}

	public void setMajorId(Integer majorId) {
		this.majorId = majorId;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

}