package com.gxwzu.business.model.taskBook;

import java.util.Date;

/**
 * TaskBook entity. @author MyEclipse Persistence Tools
 */

public class TaskBook implements java.io.Serializable {

	// Fields

	private Integer taskId;
	private String taskContent;
	private String taskPlanJob;
	private String taskDocument;
	private Integer stuId;
	private Integer teacherId;
	private Integer year;
	// Constructors

	/** default constructor */
	public TaskBook() {
	}

	/** full constructor */
	public TaskBook(String taskContent, String taskPlanJob,
			String taskDocument, Integer stuId, Integer teacherId, Integer year) {
		this.taskContent = taskContent;
		this.taskPlanJob = taskPlanJob;
		this.taskDocument = taskDocument;
		this.stuId = stuId;
		this.teacherId = teacherId;
		this.year = year;
	}

	// Property accessors

	public Integer getTaskId() {
		return this.taskId;
	}

	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}

	public String getTaskContent() {
		return this.taskContent;
	}

	public void setTaskContent(String taskContent) {
		this.taskContent = taskContent;
	}

	public String getTaskPlanJob() {
		return this.taskPlanJob;
	}

	public void setTaskPlanJob(String taskPlanJob) {
		this.taskPlanJob = taskPlanJob;
	}

	public String getTaskDocument() {
		return this.taskDocument;
	}

	public void setTaskDocument(String taskDocument) {
		this.taskDocument = taskDocument;
	}

	public Integer getStuId() {
		return this.stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	@Override
	public String toString() {
		return "TaskBook{" +
				"taskId=" + taskId +
				", taskContent='" + taskContent + '\'' +
				", taskPlanJob='" + taskPlanJob + '\'' +
				", taskDocument='" + taskDocument + '\'' +
				", stuId=" + stuId +
				", teacherId=" + teacherId +
				", year=" + year +
				'}';
	}
}