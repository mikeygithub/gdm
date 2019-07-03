package com.gxwzu.business.model.guideCount;

/**
 * GuideCount entity. @author MyEclipse Persistence Tools
 */

public class GuideCount implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer maxStuNum;
	private Integer alreadyStuNum;
	private Integer guideTeachId;
	private Integer year;

	// Constructors

	/** default constructor */
	public GuideCount() {
	}

	/** full constructor */
	public GuideCount(Integer maxStuNum, Integer alreadyStuNum, Integer guideTeachId,
			Integer year) {
		this.maxStuNum = maxStuNum;
		this.alreadyStuNum = alreadyStuNum;
		this.guideTeachId = guideTeachId;
		this.year = year;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMaxStuNum() {
		return this.maxStuNum;
	}

	public void setMaxStuNum(Integer maxStuNum) {
		this.maxStuNum = maxStuNum;
	}

	public Integer getAlreadyStuNum() {
		return this.alreadyStuNum;
	}

	public void setAlreadyStuNum(Integer alreadyStuNum) {
		this.alreadyStuNum = alreadyStuNum;
	}

	public Integer getGuideTeachId() {
		return this.guideTeachId;
	}

	public void setGuideTeachId(Integer guideTeachId) {
		this.guideTeachId = guideTeachId;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

}