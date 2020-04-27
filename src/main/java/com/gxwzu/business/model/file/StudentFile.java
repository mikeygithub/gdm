package com.gxwzu.business.model.file;

/**
 * StudentFile entity. @author MyEclipse Persistence Tools
 */

public class StudentFile implements java.io.Serializable {

	// Fields

	private Integer fileId;
	private String fileName;
	private Integer stuId;
	private Integer teacherId;
	private Integer year;

	// Constructors

	/** default constructor */
	public StudentFile() {
	}

	/** full constructor */
	public StudentFile(String fileName, Integer stuId, Integer teacherId,
			Integer year) {
		this.fileName = fileName;
		this.stuId = stuId;
		this.teacherId = teacherId;
		this.year = year;
	}

	// Property accessors

	public Integer getFileId() {
		return this.fileId;
	}

	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}

	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
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

}