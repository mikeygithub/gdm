package com.gxwzu.business.model.paln;

import java.sql.Timestamp;

/**
 * PlanProgress entity. @author MyEclipse Persistence Tools
 */

public class PlanProgress implements java.io.Serializable {

	// Fields

	private Integer progressId;
	private String deptNumber;
	private Integer categoryId;
	private Integer majorId;
	private Timestamp startTime;
	private Timestamp endTime;
	private Integer year;
	private String progressItemNo;
	private Integer progressStart;

	// Constructors

	/** default constructor */
	public PlanProgress() {
	}

	/** full constructor */
	public PlanProgress(String deptNumber, Integer categoryId, Integer majorId,
			Timestamp startTime, Timestamp endTime, Integer year,
			String progressItemNo, Integer progressStart) {
		this.deptNumber = deptNumber;
		this.categoryId = categoryId;
		this.majorId = majorId;
		this.startTime = startTime;
		this.endTime = endTime;
		this.year = year;
		this.progressItemNo = progressItemNo;
		this.progressStart = progressStart;
	}

	// Property accessors

	public Integer getProgressId() {
		return this.progressId;
	}

	public void setProgressId(Integer progressId) {
		this.progressId = progressId;
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

	public Integer getMajorId() {
		return this.majorId;
	}

	public void setMajorId(Integer majorId) {
		this.majorId = majorId;
	}

	public Timestamp getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public String getProgressItemNo() {
		return this.progressItemNo;
	}

	public void setProgressItemNo(String progressItemNo) {
		this.progressItemNo = progressItemNo;
	}

	public Integer getProgressStart() {
		return this.progressStart;
	}

	public void setProgressStart(Integer progressStart) {
		this.progressStart = progressStart;
	}

	@Override
	public String toString() {
		return "PlanProgress{" +
				"progressId=" + progressId +
				", deptNumber='" + deptNumber + '\'' +
				", categoryId=" + categoryId +
				", majorId=" + majorId +
				", startTime=" + startTime +
				", endTime=" + endTime +
				", year=" + year +
				", progressItemNo='" + progressItemNo + '\'' +
				", progressStart=" + progressStart +
				'}';
	}
}