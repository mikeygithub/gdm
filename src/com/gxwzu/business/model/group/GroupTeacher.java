package com.gxwzu.business.model.group;

import java.sql.Timestamp;

/**
 * GroupTeacher entity. @author MyEclipse Persistence Tools
 */

public class GroupTeacher implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer groupAllotId;
	private Integer teacherId;
	private Timestamp opTime;
	private Integer year;
	private String type;

	// Constructors

	/** default constructor */
	public GroupTeacher() {
	}

	/** full constructor */
	public GroupTeacher(Integer groupAllotId, Integer teacherId,
			Timestamp opTime, Integer year, String type) {
		this.groupAllotId = groupAllotId;
		this.teacherId = teacherId;
		this.opTime = opTime;
		this.year = year;
		this.type = type;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getGroupAllotId() {
		return this.groupAllotId;
	}

	public void setGroupAllotId(Integer groupAllotId) {
		this.groupAllotId = groupAllotId;
	}

	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public Timestamp getOpTime() {
		return this.opTime;
	}

	public void setOpTime(Timestamp opTime) {
		this.opTime = opTime;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

}