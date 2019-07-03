package com.gxwzu.sysVO;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gxwzu.core.util.ObjectUtil;

/**
 * GroupAllot entity. @author MyEclipse Persistence Tools
 */

public class ListGroupAllotExport implements java.io.Serializable {
	
	// Fields
	private Integer stuId;
	private String stuNo;
	private String stuName;
	private Integer classId;
	private String className;
	private Integer studentId;
	private Integer groupAllotId;
	private Integer groupId;
	private String groupName;
	private Integer classroomId;
	private String classroomName;
	private Integer teacherId;
	private String teacherName;//指导教师名字
	private String issueName;//课题名
	
	private String tName;    //答辩教师名
	private String groupTeacherNames;
	
	
	private List<ListGroupTeacher> teacherList = new ArrayList<ListGroupTeacher>(); //答辩老师
	
	/** default constructor 
	 * @param o */
	public ListGroupAllotExport(){
		
	}

	public ListGroupAllotExport(Integer stuId, String stuNo, String stuName,
			Integer classId, String className, Integer studentId,Integer groupAllotId,
			Integer groupId, String groupName,Integer classroomId,
			String classroomName, Integer teacherId, String teacherName,
			String issueName, String tName, String groupTeacherNames,
			List<ListGroupTeacher> teacherList) {
		super();
		this.stuId = stuId;
		this.stuNo = stuNo;
		this.stuName = stuName;
		this.classId = classId;
		this.className = className;
		this.studentId = studentId;
		this.groupAllotId = groupAllotId;
		this.groupId = groupId;
		this.groupName = groupName;
		this.classroomId = classroomId;
		this.classroomName = classroomName;
		this.teacherId = teacherId;
		this.teacherName = teacherName;
		this.issueName = issueName;
		this.tName = tName;
		this.groupTeacherNames = groupTeacherNames;
		this.teacherList = teacherList;
	}

	public ListGroupAllotExport(Object[] o) {
		this.stuId = ObjectUtil.getInteger(o[0]);
		this.stuNo = ObjectUtil.getString(o[1]);
		this.stuName = ObjectUtil.getString(o[2]);
		this.classId =  ObjectUtil.getInteger(o[3]);
		this.className = ObjectUtil.getString(o[4]);
		this.studentId =  ObjectUtil.getInteger(o[5]);
		this.groupAllotId =  ObjectUtil.getInteger(o[6]);
		this.groupId =  ObjectUtil.getInteger(o[7]);
		this.groupName = ObjectUtil.getString(o[8]);
		this.classroomId =  ObjectUtil.getInteger(o[9]);
		this.classroomName = ObjectUtil.getString(o[10]);
		this.teacherId = ObjectUtil.getInteger(o[11]);
		this.teacherName = ObjectUtil.getString(o[12]);
		this.issueName = ObjectUtil.getString(o[13]);
		this.tName = ObjectUtil.getString(o[14]);
		this.groupTeacherNames = ObjectUtil.getString(o[15]);
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getStuNo() {
		return stuNo;
	}

	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public Integer getGroupAllotId() {
		return groupAllotId;
	}

	public void setGroupAllotId(Integer groupAllotId) {
		this.groupAllotId = groupAllotId;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public Integer getClassroomId() {
		return classroomId;
	}

	public void setClassroomId(Integer classroomId) {
		this.classroomId = classroomId;
	}

	public String getClassroomName() {
		return classroomName;
	}

	public void setClassroomName(String classroomName) {
		this.classroomName = classroomName;
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

	public String getIssueName() {
		return issueName;
	}

	public void setIssueName(String issueName) {
		this.issueName = issueName;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupTeacherNames() {
		return groupTeacherNames;
	}

	public void setGroupTeacherNames(String groupTeacherNames) {
		this.groupTeacherNames = groupTeacherNames;
	}

	public List<ListGroupTeacher> getTeacherList() {
		return teacherList;
	}

	public void setTeacherList(List<ListGroupTeacher> teacherList) {
		this.teacherList = teacherList;
	}

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}
	
}
