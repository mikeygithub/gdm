package com.gxwzu.sysVO;

import java.util.ArrayList;
import java.util.List;

import com.gxwzu.core.util.ObjectUtil;


/**
 * SysTeacher entity. @author MyEclipse Persistence Tools
 */

public class ListGroupTeacher extends ListTeacher implements java.io.Serializable{

	
	// Fields
	private Integer id;
	private Integer groupAllotId;
	private String groupName;
	private String type;
	private Integer year;
	
	private String groupType; //组类型
	
	private List<ListTeacherMajor> teacherMajorList = new ArrayList<ListTeacherMajor>();
	// Constructors

	/** default constructor */
	public ListGroupTeacher() {
	}


	public ListGroupTeacher(Object[] o) {
		this.teacherId = ObjectUtil.getInteger(o[0]);
		this.teacherNo = ObjectUtil.getString(o[1]);
		this.teacherName = ObjectUtil.getString(o[2]);
		this.deptNumber = ObjectUtil.getString(o[3]);
		this.categoryId = ObjectUtil.getInteger(o[4]);
		this.staffroomId =  ObjectUtil.getInteger(o[5]);
		this.technicalId =  ObjectUtil.getInteger(o[6]);
		this.dutiesNo =  ObjectUtil.getString(o[7]);
		this.userId =  ObjectUtil.getInteger(o[8]);
		
		this.userSex = ObjectUtil.getString(o[9]);
		this.userAge = ObjectUtil.getString(o[10]);
		this.userEmail =ObjectUtil.getString(o[11]);
		this.userTel =  ObjectUtil.getString(o[12]);
		this.userImg =  ObjectUtil.getString(o[13]);
		this.userType =  ObjectUtil.getString(o[14]);
		
		this.deptName =  ObjectUtil.getString(o[15]);
		this.categoryName =  ObjectUtil.getString(o[16]);
		this.staffName =  ObjectUtil.getString(o[17]);
		this.technicalName =  ObjectUtil.getString(o[18]);
		
		this.id = ObjectUtil.getInteger(o[19]);
		this.groupAllotId = ObjectUtil.getInteger(o[20]);
		this.groupName = ObjectUtil.getString(o[21]);
		this.type = ObjectUtil.getString(o[22]);
		this.year = ObjectUtil.getInteger(o[23]);
		
		this.groupType = ObjectUtil.getString(o[24]);
		
	}

	public String getTeacherNo() {
		return teacherNo;
	}


	public void setTeacherNo(String teacherNo) {
		this.teacherNo = teacherNo;
	}


	public String getTeacherName() {
		return teacherName;
	}


	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}


	public String getDeptNumber() {
		return deptNumber;
	}


	public void setDeptNumber(String deptNumber) {
		this.deptNumber = deptNumber;
	}


	public Integer getStaffroomId() {
		return staffroomId;
	}


	public void setStaffroomId(Integer staffroomId) {
		this.staffroomId = staffroomId;
	}


	public Integer getTechnicalId() {
		return technicalId;
	}


	public void setTechnicalId(Integer technicalId) {
		this.technicalId = technicalId;
	}


	public Integer getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}


	public Integer getUserId() {
		return userId;
	}


	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	public String getDeptName() {
		return deptName;
	}


	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}


	public String getStaffName() {
		return staffName;
	}


	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}


	public String getTechnicalName() {
		return technicalName;
	}


	public void setTechnicalName(String technicalName) {
		this.technicalName = technicalName;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getGroupAllotId() {
		return groupAllotId;
	}


	public void setGroupAllotId(Integer groupAllotId) {
		this.groupAllotId = groupAllotId;
	}


	public Integer getYear() {
		return year;
	}


	public void setYear(Integer year) {
		this.year = year;
	}


	public String getGroupName() {
		return groupName;
	}


	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getGroupType() {
		return groupType;
	}


	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}


	public List<ListTeacherMajor> getTeacherMajorList() {
		return teacherMajorList;
	}


	public void setTeacherMajorList(List<ListTeacherMajor> teacherMajorList) {
		this.teacherMajorList = teacherMajorList;
	}

	@Override
	public String toString() {
		return "ListGroupTeacher{" +
				"id=" + id +
				", groupAllotId=" + groupAllotId +
				", groupName='" + groupName + '\'' +
				", type='" + type + '\'' +
				", year=" + year +
				", groupType='" + groupType + '\'' +
				", teacherMajorList=" + teacherMajorList +
				", teacherId=" + teacherId +
				", teacherNo='" + teacherNo + '\'' +
				", teacherName='" + teacherName + '\'' +
				", deptNumber='" + deptNumber + '\'' +
				", categoryId=" + categoryId +
				", staffroomId=" + staffroomId +
				", technicalId=" + technicalId +
				", dutiesNo='" + dutiesNo + '\'' +
				", userId=" + userId +
				", deptName='" + deptName + '\'' +
				", categoryName='" + categoryName + '\'' +
				", staffName='" + staffName + '\'' +
				", technicalName='" + technicalName + '\'' +
				", dutiesName='" + dutiesName + '\'' +
				", userName='" + userName + '\'' +
				", loginName='" + loginName + '\'' +
				", password='" + password + '\'' +
				", userType='" + userType + '\'' +
				", userSex='" + userSex + '\'' +
				", userAge='" + userAge + '\'' +
				", userTel='" + userTel + '\'' +
				", userEmail='" + userEmail + '\'' +
				", userImg='" + userImg + '\'' +
				", opTime=" + opTime +
				", sign='" + sign + '\'' +
				'}';
	}
}