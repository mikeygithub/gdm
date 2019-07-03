package com.gxwzu.sysVO;

import com.gxwzu.core.util.ObjectUtil;

/**
 * GroupDefenseDirection entity. @author MyEclipse Persistence Tools
 */

public class ListGroupDefenseDirection implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer groupAllotId;
	private Integer majorId;
	private Integer year;
	private String majorName;
	private String staffName;
	private String majorNum; //各专业学生人数 
	// Constructors

	/** default constructor */
	public ListGroupDefenseDirection(Object[] o) {
		this.id = ObjectUtil.getInteger(o[0]);
		this.groupAllotId = ObjectUtil.getInteger(o[1]);
		this.majorId = ObjectUtil.getInteger(o[2]);
		this.year = ObjectUtil.getInteger(o[3]);
		this.majorName =ObjectUtil.getString(o[4]);
		this.staffName =ObjectUtil.getString(o[5]);
		if(o.length==7){
		this.majorNum =ObjectUtil.getString(o[6]);
		}
	}
	

	// Property accessors

	public ListGroupDefenseDirection() {
		// TODO Auto-generated constructor stub
	}

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
		return majorId;
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

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}


	public String getMajorNum() {
		return majorNum;
	}


	public void setMajorNum(String majorNum) {
		this.majorNum = majorNum;
	}


	
	
}