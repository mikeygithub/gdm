package com.gxwzu.sysVO;

import java.util.Date;

import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.model.sysTeacher.SysTeacher;

public class ListAllotGuide extends ListStudent{
	
	private Integer id;
	private Integer teacherId;
	private Integer stuId;
	private String stuName;
	private String teacherName;
	private Date opTime;
	private Integer year;
	public ListAllotGuide() {
		super();
	}

	public ListAllotGuide(Integer id, Integer teacherId, Integer stuId, String stuName, String teacherName,
			String maxStuNum, String alreadyStuNum, Date opTime, Integer year) {
		super();
		this.id = id;
		this.teacherId = teacherId;
		this.stuId = stuId;
		this.stuName = stuName;
		this.teacherName = teacherName;
		this.opTime = opTime;
		this.year = year;
	}
	
	public void setAllotGuide(AllotGuide model,SysStudent student, SysTeacher teacher) {
		this.id = model.getId();
		this.teacherId = model.getTeacherId();
		this.stuId = model.getStuId();
		this.stuName = student.getStuName();
		this.teacherName = teacher.getTeacherName();
		this.opTime = model.getOpTime();
		this.year = model.getYear();
		this.setDeptNumber(student.getDeptNumber());
		this.setMajorId(student.getMajorId());
		this.setClassId(student.getClassId());
//		this.setUserSex(student.getUserSex());
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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


	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
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
	
	

}
