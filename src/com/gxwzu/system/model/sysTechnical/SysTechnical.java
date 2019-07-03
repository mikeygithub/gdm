package com.gxwzu.system.model.sysTechnical;

/**
 * SysTechnical entity. @author MyEclipse Persistence Tools
 */

public class SysTechnical implements java.io.Serializable {

	// Fields

	private Integer technicalId;
	private String technicalNo;
	private String technicalName;

	// Constructors

	/** default constructor */
	public SysTechnical() {
	}

	/** full constructor */
	public SysTechnical(String technicalNo, String technicalName) {
		this.technicalNo = technicalNo;
		this.technicalName = technicalName;
	}

	// Property accessors

	public Integer getTechnicalId() {
		return this.technicalId;
	}

	public void setTechnicalId(Integer technicalId) {
		this.technicalId = technicalId;
	}

	public String getTechnicalNo() {
		return this.technicalNo;
	}

	public void setTechnicalNo(String technicalNo) {
		this.technicalNo = technicalNo;
	}

	public String getTechnicalName() {
		return this.technicalName;
	}

	public void setTechnicalName(String technicalName) {
		this.technicalName = technicalName;
	}

}