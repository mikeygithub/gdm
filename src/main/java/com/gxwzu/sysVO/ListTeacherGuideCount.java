package com.gxwzu.sysVO;

import java.util.ArrayList;
import java.util.List;

import com.gxwzu.business.model.guideCount.GuideCount;
import com.gxwzu.core.util.ObjectUtil;

/**
 * SysTeacher entity. @author MyEclipse Persistence Tools
 */

public class ListTeacherGuideCount extends ListTeacher implements java.io.Serializable {

	// Fields
	private Integer guideCountId;
	private Integer maxStuNum;
	private Integer alreadyStuNum;
	private Integer year;

	private List<ListTeacherMajor> teacherMajorList = new ArrayList<ListTeacherMajor>();
	private List<ListTeacherDirections> teacherDirectionList= new ArrayList<ListTeacherDirections>() ;
	
	// Constructors

	/** default constructor */
	public ListTeacherGuideCount() {
	}

	/** full constructor */

	// Property accessors

	

	public ListTeacherGuideCount(Object[] o) {
             super(o);
         	this.guideCountId =  ObjectUtil.getInteger(o[20]);
         	this.maxStuNum =  ObjectUtil.getInteger(o[21]) ;
    		this.alreadyStuNum =  ObjectUtil.getInteger(o[22]) ;
    		this.year =  ObjectUtil.getInteger(o[23]) ; 
	}
	
	public void setGuideCount(GuideCount guideCount) {
		this.guideCountId = guideCount.getId();
    	this.maxStuNum = guideCount.getMaxStuNum();
		this.alreadyStuNum = guideCount.getAlreadyStuNum();
		this.year = guideCount.getYear(); 
}

	public ListTeacherGuideCount(Integer maxStuNum, Integer alreadyStuNum,Integer year) {
		super();
		this.maxStuNum = maxStuNum;
		this.alreadyStuNum = alreadyStuNum;
		this.year = year;
	}

	
	public Integer getMaxStuNum() {
		return maxStuNum;
	}

	public void setMaxStuNum(Integer maxStuNum) {
		this.maxStuNum = maxStuNum;
	}

	public Integer getAlreadyStuNum() {
		return alreadyStuNum;
	}

	public void setAlreadyStuNum(Integer alreadyStuNum) {
		this.alreadyStuNum = alreadyStuNum;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getGuideCountId() {
		return guideCountId;
	}

	public void setGuideCountId(Integer guideCountId) {
		this.guideCountId = guideCountId;
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

	public void setTeacherDirectionList(List<ListTeacherDirections> teacherDirectionList) {
		this.teacherDirectionList = teacherDirectionList;
	}
}