package com.gxwzu.sysVO;

import com.gxwzu.core.util.ObjectUtil;

/**
 * TeacherMajor entity. @author MyEclipse Persistence Tools
 */

public class ListTeacherMajor implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer teacherId;
	private Integer majorId;
	private Integer year;

	private String  majorName;
	// Constructors

	/** default constructor */
	public ListTeacherMajor() {
	}

	/** full constructor */
	public ListTeacherMajor(Integer teacherId, Integer majorId, Integer year) {
		this.teacherId = teacherId;
		this.majorId = majorId;
		this.year = year;
	}

	// Property accessors

	public ListTeacherMajor(Object[] o) {
		this.id = ObjectUtil.getInteger(o[0]);
		this.teacherId = ObjectUtil.getInteger(o[1]);
		this.majorId = ObjectUtil.getInteger(o[2]);
		this.year = ObjectUtil.getInteger(o[3]);
		this.majorName = ObjectUtil.getString(o[4]);
	}

	

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

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

}