package com.gxwzu.business.model.teacherDirections;

/**
 * TeacherDirections entity. @author MyEclipse Persistence Tools
 */

public class TeacherDirections implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer directionsId;
	private Integer teacherId;
	private Integer year;

	// Constructors

	/** default constructor */
	public TeacherDirections() {
	}

	/** full constructor */
	public TeacherDirections(Integer directionsId, Integer teacherId, Integer year) {
		this.directionsId = directionsId;
		this.teacherId = teacherId;
		this.year = year;
	}

	// Property accessors

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


}