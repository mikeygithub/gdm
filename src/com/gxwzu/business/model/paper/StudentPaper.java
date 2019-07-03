package com.gxwzu.business.model.paper;

import java.util.Date;

/**
 * StudentPaper entity. @author MyEclipse Persistence Tools
 */

public class StudentPaper implements java.io.Serializable {

	// Fields

	private Integer paperId;
	private String paperName;
	private Integer stuId;
	private Integer teacherId;
	private Integer year;
	private String path;
	private Integer fileSize;
	private String fileType;

	// Constructors

	/** default constructor */
	public StudentPaper() {
	}

	/** full constructor */
	public StudentPaper(String paperName, Integer stuId, Integer teacherId,
			Integer year, String path, Integer fileSize, String fileType) {
		this.paperName = paperName;
		this.stuId = stuId;
		this.teacherId = teacherId;
		this.year = year;
		this.path = path;
		this.fileSize = fileSize;
		this.fileType = fileType;
	}

	// Property accessors

	public Integer getPaperId() {
		return this.paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}

	public String getPaperName() {
		return this.paperName;
	}

	public void setPaperName(String paperName) {
		this.paperName = paperName;
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

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Integer getFileSize() {
		return this.fileSize;
	}

	public void setFileSize(Integer fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileType() {
		return this.fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
}