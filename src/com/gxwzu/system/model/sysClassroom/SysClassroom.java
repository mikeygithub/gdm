package com.gxwzu.system.model.sysClassroom;

/**
 * SysClassroom entity. @author MyEclipse Persistence Tools
 */

public class SysClassroom implements java.io.Serializable {

	// Fields

	private Integer id;
	private String classroomName;

	// Constructors

	/** default constructor */
	public SysClassroom() {
	}

	/** full constructor */
	public SysClassroom(String classroomName) {
		this.classroomName = classroomName;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getClassroomName() {
		return this.classroomName;
	}

	public void setClassroomName(String classroomName) {
		this.classroomName = classroomName;
	}

}