package com.gxwzu.sysVO;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.gxwzu.core.util.ObjectUtil;

/**
 * GroupAllot entity. @author MyEclipse Persistence Tools
 */

public class ListGroupAllot implements java.io.Serializable {
	
	// Fields

	private Integer groupId;
	private String deptNumber;
	private Integer classRoomId;
	private Timestamp replyTime;
	private String groupName;
	private String groupType;
	private String firstDefense;
	private Integer year;
	
	private String deptName; 
	private String classroomName;
	private String teacherNum; //已分配老师人数
	private String studentNum; //已分配学生人数
	
	private List<ListGroupTeacher> teacherList = new ArrayList<ListGroupTeacher>(); //答辩老师
	private List<ListGroupDefenseDirection>  directionList= new ArrayList<ListGroupDefenseDirection>(); //答辩方向
	
	/** default constructor 
	 * @param o */
	public ListGroupAllot(){
		
	}
	

	public ListGroupAllot(Object[] o) {
		this.groupId = ObjectUtil.getInteger(o[0]);
		this.deptNumber = ObjectUtil.getString(o[1]);
		this.classRoomId = ObjectUtil.getInteger(o[2]);
		if(o[3]!=null){
		this.replyTime = (Timestamp) o[3];
		}
		this.groupName = ObjectUtil.getString(o[4]);
		this.groupType = ObjectUtil.getString(o[5]);
		this.firstDefense= ObjectUtil.getString(o[6]);
		this.year = ObjectUtil.getInteger(o[7]);
		
		this.deptName = ObjectUtil.getString(o[8]);
		this.classroomName = ObjectUtil.getString(o[9]);
		
		this.teacherNum = ObjectUtil.getString(o[10]);
		this.studentNum = ObjectUtil.getString(o[11]);
	}


	public Integer getGroupId() {
		return groupId;
	}



	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}




	public Integer getClassRoomId() {
		return classRoomId;
	}


	public void setClassRoomId(Integer classRoomId) {
		this.classRoomId = classRoomId;
	}




	public Integer getYear() {
		return year;
	}


	public void setYear(Integer year) {
		this.year = year;
	}


	public String getDeptNumber() {
		return deptNumber;
	}


	public void setDeptNumber(String deptNumber) {
		this.deptNumber = deptNumber;
	}

	

	public String getDeptName() {
		return deptName;
	}


	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}


	public String getClassroomName() {
		return classroomName;
	}


	public void setClassroomName(String classroomName) {
		this.classroomName = classroomName;
	}


	public String getGroupName() {
		return groupName;
	}


	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}



	public Timestamp getReplyTime() {
		return replyTime;
	}


	public void setReplyTime(Timestamp replyTime) {
		this.replyTime = replyTime;
	}


	public String getGroupType() {
		return groupType;
	}


	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}


	public List<ListGroupTeacher> getTeacherList() {
		return teacherList;
	}


	public void setTeacherList(List<ListGroupTeacher> teacherList) {
		this.teacherList = teacherList;
	}


	public List<ListGroupDefenseDirection> getDirectionList() {
		return directionList;
	}


	public void setDirectionList(List<ListGroupDefenseDirection> directionList) {
		this.directionList = directionList;
	}


	public String getTeacherNum() {
		return teacherNum;
	}


	public void setTeacherNum(String teacherNum) {
		this.teacherNum = teacherNum;
	}


	public String getStudentNum() {
		return studentNum;
	}


	public void setStudentNum(String studentNum) {
		this.studentNum = studentNum;
	}


	public String getFirstDefense() {
		return firstDefense;
	}


	public void setFirstDefense(String firstDefense) {
		this.firstDefense = firstDefense;
	}

	@Override
	public String toString() {
		return "ListGroupAllot{" +
				"groupId=" + groupId +
				", deptNumber='" + deptNumber + '\'' +
				", classRoomId=" + classRoomId +
				", replyTime=" + replyTime +
				", groupName='" + groupName + '\'' +
				", groupType='" + groupType + '\'' +
				", firstDefense='" + firstDefense + '\'' +
				", year=" + year +
				", deptName='" + deptName + '\'' +
				", classroomName='" + classroomName + '\'' +
				", teacherNum='" + teacherNum + '\'' +
				", studentNum='" + studentNum + '\'' +
				", teacherList=" + teacherList +
				", directionList=" + directionList +
				'}';
	}
}
