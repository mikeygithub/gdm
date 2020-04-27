package com.gxwzu.business.model.group;

/**
 * GroupDefenseDirection entity. @author MyEclipse Persistence Tools
 */

public class GroupDefenseDirection implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer groupAllotId;
	private Integer majorId;
	private Integer year;

	// Constructors

	/** default constructor */
	public GroupDefenseDirection() {
	}

	/** full constructor */
	public GroupDefenseDirection(Integer groupAllotId, Integer majorId,
			Integer year) {
		this.groupAllotId = groupAllotId;
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

	public Integer getGroupAllotId() {
		return this.groupAllotId;
	}

	public void setGroupAllotId(Integer groupAllotId) {
		this.groupAllotId = groupAllotId;
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