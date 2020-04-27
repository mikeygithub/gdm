package com.gxwzu.sysVO;

import java.io.Serializable;

/**
 * ProgressSitu entity. @author MyEclipse Persistence Tools
 */
public class ListProgressSitu implements Serializable{

	// Fields

	private Integer progressId;
	private Integer stuId;
	private Integer teacherId;
	private String progressTime;
	private String progressWork;
	private String progressRecord;
	private Integer year;

	//Fields
	private String stuName;
	
	// Constructors
	
	/**
	 * default constructor 
	 * @param o
	 */
	public ListProgressSitu(){
		
	}

	public String getStuName() {
		return stuName;
	}


	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public Integer getProgressId() {
		return progressId;
	}

	public void setProgressId(Integer progressId) {
		this.progressId = progressId;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public String getProgressTime() {
		return progressTime;
	}

	public void setProgressTime(String progressTime) {
		this.progressTime = progressTime;
	}

	public String getProgressWork() {
		return progressWork;
	}

	public void setProgressWork(String progressWork) {
		this.progressWork = progressWork;
	}

	public String getProgressRecord() {
		return progressRecord;
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
