package com.gxwzu.business.model.allotGuide;

import java.util.Date;

/**
 * AllotGuide entity. @author MyEclipse Persistence Tools
 */

public class AllotGuide implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer teacherId;
	private Integer stuId;
	private Date opTime;
	private Integer year;

	// Constructors

	/** default constructor */
	public AllotGuide() {
	}

	/** full constructor */
	public AllotGuide(Integer teacherId, Integer stuId, Date opTime,
			Integer year) {
		this.teacherId = teacherId;
		this.stuId = stuId;
		this.opTime = opTime;
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

	public Integer getStuId() {
		return this.stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public Date getOpTime() {
		return this.opTime;
	}

	public void setOpTime(Date opTime) {
		this.opTime = opTime;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

}