package com.gxwzu.sysVO;

import java.util.Date;

import com.gxwzu.core.util.ObjectUtil;


/**
 * SysTeacher entity. @author MyEclipse Persistence Tools
 */

public class ListGroupStudent extends ListStudent {

	// Fields
	
	private Integer teacherId;
	private String teacherName;
	
	private Integer id;
	private Integer groupAllotId;
	private String groupName;
	private Integer year;
	
	private String issueName;
	private String issueType;
	
	private String groupType;
	private Integer defenseTeacherId;
	//学生最终成绩
	private Integer replyScoreFinish;
	// Constructors


	/** default constructor */
	public ListGroupStudent() {
	}

	public ListGroupStudent(Object[] o) {
		super(o);
		this.teacherId = ObjectUtil.getInteger(o[24]);
		this.teacherName = ObjectUtil.getString(o[25]);
		
		this.id = ObjectUtil.getInteger(o[26]);
		this.groupAllotId = ObjectUtil.getInteger(o[27]);
		this.groupName = ObjectUtil.getString(o[28]);
		this.year = ObjectUtil.getInteger(o[29]);
	
		this.issueName = ObjectUtil.getString(o[30]);
		this.issueType = ObjectUtil.getString(o[31]);
		
		this.groupType = ObjectUtil.getString(o[32]);
		
		this.defenseTeacherId = ObjectUtil.getInteger(o[33]);
		
		this.replyScoreFinish = ObjectUtil.getInteger(o[34]);
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getGroupAllotId() {
		return groupAllotId;
	}

	public void setGroupAllotId(Integer groupAllotId) {
		this.groupAllotId = groupAllotId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public String getIssueName() {
		return issueName;
	}

	public void setIssueName(String issueName) {
		this.issueName = issueName;
	}

	public String getIssueType() {
		return issueType;
	}

	public void setIssueType(String issueType) {
		this.issueType = issueType;
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

	public String getGroupType() {
		return groupType;
	}

	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	public Integer getDefenseTeacherId() {
		return defenseTeacherId;
	}

	public void setDefenseTeacherId(Integer defenseTeacherId) {
		this.defenseTeacherId = defenseTeacherId;
	}

	public Integer getReplyScoreFinish() {
		return replyScoreFinish;
	}

	public void setReplyScoreFinish(Integer replyScoreFinish) {
		this.replyScoreFinish = replyScoreFinish;
	}


}