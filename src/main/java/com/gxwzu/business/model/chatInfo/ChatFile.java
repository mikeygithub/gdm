package com.gxwzu.business.model.chatInfo;

/**
 * ChatFile entity. @author MyEclipse Persistence Tools
 */

public class ChatFile implements java.io.Serializable {

	// Fields

	private Integer fileId;
	private Integer chatInfoId;
	private String fileName;
	private String fileType;
	private String filePath;
	private Integer code;//判断是否上传成功 0-不成功，1-上传成功

	// Constructors

	/** default constructor */
	public ChatFile() {
	}

	/** full constructor */
	public ChatFile(Integer chatInfoId, String fileName, String fileType,
			String filePath, Integer code) {
		this.chatInfoId = chatInfoId;
		this.fileName = fileName;
		this.fileType = fileType;
		this.filePath = filePath;
		this.code = code;
	}

	// Property accessors

	public Integer getFileId() {
		return this.fileId;
	}

	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}

	public Integer getChatInfoId() {
		return this.chatInfoId;
	}

	public void setChatInfoId(Integer chatInfoId) {
		this.chatInfoId = chatInfoId;
	}

	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return this.fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getFilePath() {
		return this.filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

}