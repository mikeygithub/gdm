package com.gxwzu.sysVO;

import java.util.Date;

import com.gxwzu.business.model.taskBook.TaskBook;
import com.gxwzu.core.util.DateUtils;
import com.gxwzu.core.util.ObjectUtil;

/**
 * TaskBook entity. @author MyEclipse Persistence Tools
 */

public class ListTaskBook  implements java.io.Serializable{

	// Fields
	private Integer taskId;
	private Integer issueId;
	private String taskContent;
	private String taskPlanJob;
	private String taskDocument;
	private Integer stuId;
	private Integer teacherId;
	private Integer year;
	
	private String issueName;
	private String teacherName;
	private String stuName;
	// Constructors

	/** default constructor */
	public ListTaskBook() {
	}
	


	// Property accessors


	public Integer getTaskId() {
		return this.taskId;
	}

	public ListTaskBook(Object[] o) {
		super();
		this.taskId = ObjectUtil.getInteger(o[0]);
		this.issueId = ObjectUtil.getInteger(o[1]);;
		this.taskContent = ObjectUtil.getString(o[2]);
		this.taskPlanJob = ObjectUtil.getString(o[3]);;
		this.taskDocument = ObjectUtil.getString(o[4]);;
		this.stuId = ObjectUtil.getInteger(o[5]);;
		this.teacherId = ObjectUtil.getInteger(o[6]);;
		this.year = ObjectUtil.getInteger(o[7]);;
		this.issueName = ObjectUtil.getString(o[8]);;
		this.teacherName = ObjectUtil.getString(o[9]);;
		this.stuName = ObjectUtil.getString(o[10]);;
	}



	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}



	public String getIssueName() {
		return issueName;
	}



	public void setIssueName(String issueName) {
		this.issueName = issueName;
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



	public String getTaskContent() {
		return taskContent;
	}



	public void setTaskContent(String taskContent) {
		this.taskContent = taskContent;
	}



	public String getTaskPlanJob() {
		return taskPlanJob;
	}



	public void setTaskPlanJob(String taskPlanJob) {
		this.taskPlanJob = taskPlanJob;
	}



	public String getTaskDocument() {
		return taskDocument;
	}



	public void setTaskDocument(String taskDocument) {
		this.taskDocument = taskDocument;
	}



	public Integer getYear() {
		return year;
	}



	public void setYear(Integer year) {
		this.year = year;
	}



	public Integer getIssueId() {
		return issueId;
	}

	public void setIssueId(Integer issueId) {
		this.issueId = issueId;
	}



	public String getTeacherName() {
		return teacherName;
	}



	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}



	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	
}