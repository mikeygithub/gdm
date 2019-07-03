package com.gxwzu.sysVO;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gxwzu.business.model.teacherDirections.TeacherDirections;
import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.core.util.DateUtils;
import com.gxwzu.core.util.ObjectUtil;
import com.gxwzu.system.model.sysStudent.SysStudent;

public class ListStudentAllotGuide extends ListStudent {
	
	private Integer allotGuideId;
	private Integer teacherId;
	private String teacherName;
	private Integer year;
	
	
	public ListStudentAllotGuide() {
	}
	
	public ListStudentAllotGuide(Object[] o) {
		super(o);
		this.allotGuideId = ObjectUtil.getInteger( o[24]);	
		this.teacherId = ObjectUtil.getInteger( o[25]);
		this.teacherName = ObjectUtil.getString( o[26]);
		this.year = ObjectUtil.getInteger( o[26]);
	}
	public Integer getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public Date getOpTime() {
		return opTime;
	}
	public void setOpTime(Date opTime) {
		this.opTime = opTime;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getAllotGuideId() {
		return allotGuideId;
	}

	public void setAllotGuideId(Integer allotGuideId) {
		this.allotGuideId = allotGuideId;
	}


}
