package com.gxwzu.system.model.sysFileType;

/**
 * SysFileType entity. @author MyEclipse Persistence Tools
 */

public class SysFileType implements java.io.Serializable {

	// Fields

	private Integer fileId;
	private String fileName;
	private String fileTypeNo;

	// Constructors

	/** default constructor */
	public SysFileType() {
	}

	/** full constructor */
	public SysFileType(String fileName, String fileTypeNo) {
		this.fileName = fileName;
		this.fileTypeNo = fileTypeNo;
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

	public String getFileTypeNo() {
		return this.fileTypeNo;
	}

	public void setFileTypeNo(String fileTypeNo) {
		this.fileTypeNo = fileTypeNo;
	}

}