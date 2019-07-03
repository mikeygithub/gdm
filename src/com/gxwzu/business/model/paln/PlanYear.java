package com.gxwzu.business.model.paln;

import java.util.Date;

/**
 * PlanYear entity. @author MyEclipse Persistence Tools
 */

public class PlanYear implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer opUserId;
	private Date opTime;
	private Integer year;

	// Constructors

	/** default constructor */
	public PlanYear() {
	}

	/** full constructor */
	public PlanYear(Integer opUserId, Date opTime, Integer year) {
		this.opUserId = opUserId;
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

	public Integer getOpUserId() {
		return this.opUserId;
	}

	public void setOpUserId(Integer opUserId) {
		this.opUserId = opUserId;
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