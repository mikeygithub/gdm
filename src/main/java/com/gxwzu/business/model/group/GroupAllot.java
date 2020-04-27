package com.gxwzu.business.model.group;

import java.sql.Timestamp;

/**
 * GroupAllot entity. @author MyEclipse Persistence Tools
 */

public class GroupAllot implements java.io.Serializable {

	// Fields

	private Integer groupId;
	private String deptNumber;
	private Integer classRoomId;
	private Timestamp replyTime;
	private String groupName;
	private String groupType;
	private String firstDefense;
	private Integer year;

	// Constructors

	/** default constructor */
	public GroupAllot() {
	}

	/** full constructor */
	public GroupAllot(String deptNumber, Integer classRoomId,
			Timestamp replyTime, String groupName, String groupType,
			String firstDefense, Integer year) {
		this.deptNumber = deptNumber;
		this.classRoomId = classRoomId;
		this.replyTime = replyTime;
		this.groupName = groupName;
		this.groupType = groupType;
		this.firstDefense = firstDefense;
		this.year = year;
	}

	// Property accessors

	public Integer getGroupId() {
		return this.groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public String getDeptNumber() {
		return this.deptNumber;
	}

	public void setDeptNumber(String deptNumber) {
		this.deptNumber = deptNumber;
	}

	public Integer getClassRoomId() {
		return this.classRoomId;
	}

	public void setClassRoomId(Integer classRoomId) {
		this.classRoomId = classRoomId;
	}

	public Timestamp getReplyTime() {
		return this.replyTime;
	}

	public void setReplyTime(Timestamp replyTime) {
		this.replyTime = replyTime;
	}

	public String getGroupName() {
		return this.groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupType() {
		return this.groupType;
	}

	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	public String getFirstDefense() {
		return this.firstDefense;
	}

	public void setFirstDefense(String firstDefense) {
		this.firstDefense = firstDefense;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

}