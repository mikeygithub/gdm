package com.gxwzu.sysVO;

import com.gxwzu.core.util.ObjectUtil;

/**
 * TeacherDirections entity. @author MyEclipse Persistence Tools
 */

public class ListTeacherDirections implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer directionsId;
	private Integer teacherId;
	private Integer year;
	
	private String directionsName;
	// Constructors

	/** default constructor */
	public ListTeacherDirections() {
	}

	/** full constructor */
	public ListTeacherDirections(Integer directionsId, Integer teacherId, Integer year) {
		this.directionsId = directionsId;
		this.teacherId = teacherId;
		this.year = year;
	}

	// Property accessors

	public ListTeacherDirections(Object[] o) {
		this.id = ObjectUtil.getInteger(o[0]);
		this.directionsId = ObjectUtil.getInteger(o[1]);
		this.teacherId = ObjectUtil.getInteger(o[2]);
		this.year = ObjectUtil.getInteger(o[3]);
		this.directionsName = ObjectUtil.getString(o[4]);
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDirectionsId() {
		return this.directionsId;
	}

	public void setDirectionsId(Integer directionsId) {
		this.directionsId = directionsId;
	}

	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public String getDirectionsName() {
		return directionsName;
	}

	public void setDirectionsName(String directionsName) {
		this.directionsName = directionsName;
	}

	@Override
	public String toString() {
		return "ListTeacherDirections{" +
				"id=" + id +
				", directionsId=" + directionsId +
				", teacherId=" + teacherId +
				", year=" + year +
				", directionsName='" + directionsName + '\'' +
				'}';
	}
}