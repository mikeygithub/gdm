package com.gxwzu.business.model.progressSitu;

import java.util.Date;

/**
 * ProgressSitu entity. @author MyEclipse Persistence Tools
 */

public class ProgressSitu implements java.io.Serializable {

	// Fields

	private Integer progressId;
	private Integer stuId;
	private Integer teacherId;
	private String progressTime;
	private String progressWork;
	private String progressRecord;
	private Integer year;

	// Constructors


	/** full constructor */
	public ProgressSitu(Integer stuId, Integer teacherId, String progressTime, String progressWork,
			String progressRecord) {
		this.stuId = stuId;
		this.teacherId = teacherId;
		this.progressTime = progressTime;
		this.progressWork = progressWork;
		this.progressRecord = progressRecord;
		
	}

	// Property accessors

	public ProgressSitu() {
	}
	
	public Integer getProgressId() {
		return this.progressId;
	}

	public void setProgressId(Integer progressId) {
		this.progressId = progressId;
	}

	public Integer getStuId() {
		return this.stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public String getProgressTime() {
		return this.progressTime;
	}

	public void setProgressTime(String progressTime) {
		this.progressTime = progressTime;
	}

	public String getProgressWork() {
		return this.progressWork;
	}

	public void setProgressWork(String progressWork) {
		this.progressWork = progressWork;
	}

	public String getProgressRecord() {
		return this.progressRecord;
	}

	public void setProgressRecord(String progressRecord) {
		this.progressRecord = progressRecord;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

}