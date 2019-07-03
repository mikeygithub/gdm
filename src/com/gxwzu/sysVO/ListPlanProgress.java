package com.gxwzu.sysVO;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import com.gxwzu.core.util.DateUtils;
import com.gxwzu.core.util.ObjectUtil;

/**
 * PlanProgress entity. @author MyEclipse Persistence Tools
 */

public class ListPlanProgress implements java.io.Serializable {

	// Fields

	private Integer progressId;
	private String deptNumber;
	private Integer categoryId;
	private Integer majorId;
	private String startTime;
	private String endTime;
	private Integer year;
	private Integer progressStart;
	
	private Integer progressItemId;
	private String progressItemNo;
	private String progressName;

	protected String deptName;
	protected String categoryName;
	protected String staffName;
	// Constructors

	/** default constructor */
	public ListPlanProgress() {
	}


	// Property accessors

	public ListPlanProgress(Object[] o) {
		this.progressId = ObjectUtil.getInteger(o[0]);
		this.deptNumber = ObjectUtil.getString(o[1]);
		this.categoryId = ObjectUtil.getInteger(o[2]);
		this.majorId = ObjectUtil.getInteger(o[3]);
	
		if( o[4]!=null)
			this.startTime = DateUtils.timestampFormatTime((Timestamp)o[4]);
		if( o[5]!=null)
		this.endTime =DateUtils.timestampFormatTime((Timestamp)o[5]);
		this.year = ObjectUtil.getInteger(o[6]);
		this.progressStart = ObjectUtil.getInteger(o[7]);
		
		this.progressItemId = ObjectUtil.getInteger(o[8]);
		this.progressItemNo = ObjectUtil.getString(o[9]);
		this.progressName = ObjectUtil.getString(o[10]);
		
		this.deptName = ObjectUtil.getString(o[11]);
		this.categoryName = ObjectUtil.getString(o[12]);
		this.staffName = ObjectUtil.getString(o[13]);
	}


	


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

	public String getProgressName() {
		return this.progressName;
	}

	public void setProgressName(String progressName) {
		this.progressName = progressName;
	}

	public String getStartTime() {
		return this.startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return this.endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	
	public String getProgressItemNo() {
		return progressItemNo;
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


	public String getDeptName() {
		return deptName;
	}


	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public String getStaffName() {
		return staffName;
	}


	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}


	public Integer getProgressItemId() {
		return progressItemId;
	}


	public void setProgressItemId(Integer progressItemId) {
		this.progressItemId = progressItemId;
	}

}