package com.gxwzu.system.model.sysNotice;

import java.sql.Timestamp;

/**
 * SysNotice entity. @author MyEclipse Persistence Tools
 */

public class SysNotice implements java.io.Serializable {

	// Fields

	private Integer noticeId;
	private String noticeName;
	private String noticeContent;
	private Timestamp noticeTime;
	private Integer userId;
	private String noticePath;
	private Integer noticeType;
	private Integer majorId;
	private Integer deptNumber;
	private Integer year;

	// Constructors

	/** default constructor */
	public SysNotice() {
	}

	/** full constructor */
	public SysNotice(String noticeName, String noticeContent,
			Timestamp noticeTime, Integer userId, String noticePath,
			Integer noticeType, Integer majorId, Integer deptNumber,
			Integer year) {
		this.noticeName = noticeName;
		this.noticeContent = noticeContent;
		this.noticeTime = noticeTime;
		this.userId = userId;
		this.noticePath = noticePath;
		this.noticeType = noticeType;
		this.majorId = majorId;
		this.deptNumber = deptNumber;
		this.year = year;
	}

	// Property accessors

	public Integer getNoticeId() {
		return this.noticeId;
	}

	public void setNoticeId(Integer noticeId) {
		this.noticeId = noticeId;
	}

	public String getNoticeName() {
		return this.noticeName;
	}

	public void setNoticeName(String noticeName) {
		this.noticeName = noticeName;
	}

	public String getNoticeContent() {
		return this.noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Timestamp getNoticeTime() {
		return this.noticeTime;
	}

	public void setNoticeTime(Timestamp noticeTime) {
		this.noticeTime = noticeTime;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getNoticePath() {
		return this.noticePath;
	}

	public void setNoticePath(String noticePath) {
		this.noticePath = noticePath;
	}

	public Integer getNoticeType() {
		return this.noticeType;
	}

	public void setNoticeType(Integer noticeType) {
		this.noticeType = noticeType;
	}

	public Integer getMajorId() {
		return this.majorId;
	}

	public void setMajorId(Integer majorId) {
		this.majorId = majorId;
	}

	public Integer getDeptNumber() {
		return this.deptNumber;
	}

	public void setDeptNumber(Integer deptNumber) {
		this.deptNumber = deptNumber;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

}