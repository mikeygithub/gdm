package com.gxwzu.business.model.group;

import java.sql.Timestamp;

/**
 * GroupStudent entity. @author MyEclipse Persistence Tools
 */

public class GroupStudent implements java.io.Serializable {

	// Fields

	private Integer id;
	private String studentNo;
	private Integer studentId;
	private Integer groupAllotId;
	private Integer defenseTeacherId;
	private Timestamp opTime;
	private Integer year;

	// Constructors

	/** default constructor */
	public GroupStudent() {
	}

	/** full constructor */
	public GroupStudent(String studentNo, Integer studentId,
			Integer groupAllotId, Integer defenseTeacherId, Timestamp opTime,
			Integer year) {
		this.studentNo = studentNo;
		this.studentId = studentId;
		this.groupAllotId = groupAllotId;
		this.defenseTeacherId = defenseTeacherId;
		this.opTime = opTime;
		this.year = year;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStudentNo() {
		return this.studentNo;
	}

	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}

	public Integer getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public Integer getGroupAllotId() {
		return this.groupAllotId;
	}

	public void setGroupAllotId(Integer groupAllotId) {
		this.groupAllotId = groupAllotId;
	}

	public Integer getDefenseTeacherId() {
		return this.defenseTeacherId;
	}

	public void setDefenseTeacherId(Integer defenseTeacherId) {
		this.defenseTeacherId = defenseTeacherId;
	}

	public Timestamp getOpTime() {
		return this.opTime;
	}

	public void setOpTime(Timestamp opTime) {
		this.opTime = opTime;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	@Override
	public String toString() {
		return "GroupStudent{" +
				"id=" + id +
				", studentNo='" + studentNo + '\'' +
				", studentId=" + studentId +
				", groupAllotId=" + groupAllotId +
				", defenseTeacherId=" + defenseTeacherId +
				", opTime=" + opTime +
				", year=" + year +
				'}';
	}
}