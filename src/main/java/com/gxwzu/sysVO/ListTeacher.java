package com.gxwzu.sysVO;

import java.util.ArrayList;
import java.util.List;

import com.gxwzu.core.util.ObjectUtil;
import com.gxwzu.system.model.sysTeacher.SysTeacher;

/**
 * SysTeacher entity. @author MyEclipse Persistence Tools
 */

public class ListTeacher extends ListUser implements java.io.Serializable {

	// Fields

	protected Integer teacherId;
	protected String teacherNo;
	protected String teacherName;
	protected String deptNumber;
	protected Integer categoryId;
	protected Integer staffroomId;
	protected Integer technicalId;
	protected String dutiesNo;
	protected Integer userId;
	
	protected String deptName;
	protected String categoryName;
	protected String staffName;
	protected String technicalName;
	protected String dutiesName;
	

	private List<ListTeacherMajor> teacherMajorList = new ArrayList<ListTeacherMajor>();
	private List<ListTeacherDirections> teacherDirectionList= new ArrayList<ListTeacherDirections>() ;
	
	// Constructors

	/** default constructor */
	public ListTeacher() {
	}

	/** full constructor */
	

	// Property accessors


	public ListTeacher(Object[] o) {
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
		this.dutiesName =  ObjectUtil.getString(o[19]);
		this.sign =  ObjectUtil.getString(o[20]);

	}

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
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

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
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


	public String getDutiesNo() {
		return dutiesNo;
	}

	public void setDutiesNo(String dutiesNo) {
		this.dutiesNo = dutiesNo;
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

	public String getTechnicalName() {
		return technicalName;
	}

	public void setTechnicalName(String technicalName) {
		this.technicalName = technicalName;
	}

	public String getDutiesName() {
		return dutiesName;
	}

	public void setDutiesName(String dutiesName) {
		this.dutiesName = dutiesName;
	}

	public List<ListTeacherMajor> getTeacherMajorList() {
		return teacherMajorList;
	}

	public void setTeacherMajorList(List<ListTeacherMajor> teacherMajorList) {
		this.teacherMajorList = teacherMajorList;
	}

	public List<ListTeacherDirections> getTeacherDirectionList() {
		return teacherDirectionList;
	}

	public void setTeacherDirectionList(
			List<ListTeacherDirections> teacherDirectionList) {
		this.teacherDirectionList = teacherDirectionList;
	}

	@Override
	public String toString() {
		return "ListTeacher{" +
				"teacherId=" + teacherId +
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
				", teacherMajorList=" + teacherMajorList +
				", teacherDirectionList=" + teacherDirectionList +
				'}';
	}
}