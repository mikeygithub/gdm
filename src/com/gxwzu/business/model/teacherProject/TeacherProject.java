package com.gxwzu.business.model.teacherProject;

/**
 * TeacherProject entity. @author MyEclipse Persistence Tools
 */

public class TeacherProject implements java.io.Serializable {

	// Fields

	private Integer projectId;
	private String projectName;
	private String projectType;
	private String projectDescrib;
	private Integer teacherId;
	private Integer state;
	private String stuIds;
	private String stuNames;
	private Integer alreadyChoose;
	private Integer maxChoose;
	private Integer projectSign;
	private Integer year;

	// Constructors

	/** default constructor */
	public TeacherProject() {
	}

	/** full constructor */
	public TeacherProject(String projectName, String projectType,
			String projectDescrib, Integer teacherId, Integer state,
			String stuIds, String stuNames, Integer alreadyChoose,
			Integer maxChoose, Integer projectSign, Integer year) {
		this.projectName = projectName;
		this.projectType = projectType;
		this.projectDescrib = projectDescrib;
		this.teacherId = teacherId;
		this.state = state;
		this.stuIds = stuIds;
		this.stuNames = stuNames;
		this.alreadyChoose = alreadyChoose;
		this.maxChoose = maxChoose;
		this.projectSign = projectSign;
		this.year = year;
	}

	// Property accessors

	public Integer getProjectId() {
		return this.projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public String getProjectName() {
		return this.projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectType() {
		return this.projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}

	public String getProjectDescrib() {
		return this.projectDescrib;
	}

	public void setProjectDescrib(String projectDescrib) {
		this.projectDescrib = projectDescrib;
	}

	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getStuIds() {
		return this.stuIds;
	}

	public void setStuIds(String stuIds) {
		this.stuIds = stuIds;
	}

	public String getStuNames() {
		return this.stuNames;
	}

	public void setStuNames(String stuNames) {
		this.stuNames = stuNames;
	}

	public Integer getAlreadyChoose() {
		return this.alreadyChoose;
	}

	public void setAlreadyChoose(Integer alreadyChoose) {
		this.alreadyChoose = alreadyChoose;
	}

	public Integer getMaxChoose() {
		return this.maxChoose;
	}

	public void setMaxChoose(Integer maxChoose) {
		this.maxChoose = maxChoose;
	}

	public Integer getProjectSign() {
		return this.projectSign;
	}

	public void setProjectSign(Integer projectSign) {
		this.projectSign = projectSign;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

}