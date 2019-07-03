package com.gxwzu.sysVO;

import java.util.Date;

import com.gxwzu.core.util.MyTime;
import com.gxwzu.core.util.ObjectUtil;

/**
 * SysStudent entity. @author MyEclipse Persistence Tools
 */

public class ListStudent  extends ListUser   {

	// Fields
	protected Integer stuId;
	protected String stuNo;
	protected String stuName;
	
	
	protected String stuIdcart;
	protected String stuAddress;
	protected String stuArrangement;
	protected String stuSchoollength;
	protected Date stuEntrance;
	protected String stuGrade;
	protected String deptNumber;
	protected Integer categoryId;
	protected Integer majorId;
	protected Integer classId;
	protected Integer userId;
	
	protected String deptName;
	protected String categoryName;
	protected String majorName;
	protected String className;

	// Constructors

	/** default constructor 
	 * @param o */
	public ListStudent() {
	}

	public ListStudent(Object[] o) {
		this.stuId = ObjectUtil.getInteger(o[0]);
		this.stuNo = ObjectUtil.getString(o[1]);
		this.stuName = ObjectUtil.getString(o[2]);
		this.stuIdcart = ObjectUtil.getString(o[3]);
		this.stuAddress = ObjectUtil.getString(o[4]);
		this.stuArrangement = ObjectUtil.getString(o[5]);
		this.stuSchoollength = ObjectUtil.getString(o[6]);
		try {
			if(o[7]!=null){
			this.stuEntrance = (Date) o[7];
			}
		} catch (Exception e) {
		}
		this.stuGrade = ObjectUtil.getString(o[8]);
		this.deptNumber = ObjectUtil.getString(o[9]);
		this.categoryId = ObjectUtil.getInteger(o[10]);
		this.majorId = ObjectUtil.getInteger(o[11]);
		this.classId = ObjectUtil.getInteger(o[12]);
		this.userId = ObjectUtil.getInteger(o[13]);
		

		this.userSex = ObjectUtil.getString(o[14]);
		this.userAge = ObjectUtil.getString(o[15]);
		this.userEmail =ObjectUtil.getString(o[16]);
		
		this.userTel =  ObjectUtil.getString(o[17]);
		this.userImg =ObjectUtil.getString(o[18]);
		this.userType =  ObjectUtil.getString(o[19]);
		
		this.deptName =  ObjectUtil.getString(o[20]);
		this.categoryName =  ObjectUtil.getString(o[21]);
		this.majorName = ObjectUtil.getString(o[22]);
		this.className = ObjectUtil.getString(o[23]);
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getStuNo() {
		return stuNo;
	}

	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getStuIdcart() {
		return stuIdcart;
	}

	public void setStuIdcart(String stuIdcart) {
		this.stuIdcart = stuIdcart;
	}

	public String getStuAddress() {
		return stuAddress;
	}

	public void setStuAddress(String stuAddress) {
		this.stuAddress = stuAddress;
	}

	public String getStuArrangement() {
		return stuArrangement;
	}

	public void setStuArrangement(String stuArrangement) {
		this.stuArrangement = stuArrangement;
	}

	public String getStuSchoollength() {
		return stuSchoollength;
	}

	public void setStuSchoollength(String stuSchoollength) {
		this.stuSchoollength = stuSchoollength;
	}

	public Date getStuEntrance() {
		return stuEntrance;
	}

	public void setStuEntrance(Date stuEntrance) {
		this.stuEntrance = stuEntrance;
	}

	public String getStuGrade() {
		return stuGrade;
	}

	public void setStuGrade(String stuGrade) {
		this.stuGrade = stuGrade;
	}

	public String getDeptNumber() {
		return deptNumber;
	}

	public void setDeptNumber(String deptNumber) {
		this.deptNumber = deptNumber;
	}

	public Integer getMajorId() {
		return majorId;
	}

	public void setMajorId(Integer majorId) {
		this.majorId = majorId;
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	

	
}