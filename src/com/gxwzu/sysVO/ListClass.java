package com.gxwzu.sysVO;

import com.gxwzu.system.model.sysClass.SysClass;
/**
 * 
 * SysClass entity. @author MyEclipse Persistence Tools
 *
 */
public class ListClass extends SysClass{

	//Fields
	private String deptName;
	private String majorName;
	
	
	// Constructors
	
	/**
	 * default constructor 
	 * @param o
	 */
	public ListClass(){
		
	}
	
	public ListClass(Object[] o) {
		super(o);
		this.deptName = ""+o[5];
		this.majorName = ""+o[6];
	}
	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
}
