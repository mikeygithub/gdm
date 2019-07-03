package com.gxwzu.system.model.sysDirections;

/**
 * SysDirections entity. @author MyEclipse Persistence Tools
 */

public class SysDirections implements java.io.Serializable {

	// Fields

	private Integer directionsId;
	private String directionsName;

	// Constructors

	/** default constructor */
	public SysDirections() {
	}

	/** full constructor */
	public SysDirections(String directionsName) {
		this.directionsName = directionsName;
	}

	// Property accessors

	public Integer getDirectionsId() {
		return this.directionsId;
	}

	public void setDirectionsId(Integer directionsId) {
		this.directionsId = directionsId;
	}

	public String getDirectionsName() {
		return this.directionsName;
	}

	public void setDirectionsName(String directionsName) {
		this.directionsName = directionsName;
	}

}