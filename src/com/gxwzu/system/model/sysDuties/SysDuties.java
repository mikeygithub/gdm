
package com.gxwzu.system.model.sysDuties;

/**
 * SysDuties entity. @author MyEclipse Persistence Tools
 */

public class SysDuties implements java.io.Serializable {

	// Fields

	private Integer dutiesId;
	private String dutiesNo;
	private String dutiesName;

	// Constructors

	/** default constructor */
	public SysDuties() {
	}

	/** full constructor */
	public SysDuties(String dutiesNo, String dutiesName) {
		this.dutiesNo = dutiesNo;
		this.dutiesName = dutiesName;
	}

	// Property accessors

	public Integer getDutiesId() {
		return this.dutiesId;
	}

	public void setDutiesId(Integer dutiesId) {
		this.dutiesId = dutiesId;
	}

	public String getDutiesNo() {
		return this.dutiesNo;
	}

	public void setDutiesNo(String dutiesNo) {
		this.dutiesNo = dutiesNo;
	}

	public String getDutiesName() {
		return this.dutiesName;
	}

	public void setDutiesName(String dutiesName) {
		this.dutiesName = dutiesName;
	}

}
