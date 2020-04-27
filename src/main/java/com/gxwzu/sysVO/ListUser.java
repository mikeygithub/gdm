package com.gxwzu.sysVO;

import java.util.Date;

/**
 * SysTeacher entity. @author MyEclipse Persistence Tools
 */

public class ListUser implements java.io.Serializable {

	// Fields

	protected String userName;
	protected String loginName;
	protected String password;
	protected String userType;
	protected String userSex;
	protected String userAge;
	protected String userTel;
	protected String  userEmail;
	protected String  userImg;
	protected Date opTime;
	protected String sign;
	
	// Constructors

	/** default constructor */
	public ListUser() {
	}

	
	public ListUser(String userName, String loginName, String password,
			String userType, String userSex, String userAge, String userTel,
			String userEmail,String userImg, Date opTime, String sign) {
		this();
		this.userName = userName;
		this.loginName = loginName;
		this.password = password;
		this.userType = userType;
		this.userSex = userSex;
		this.userAge = userAge;
		this.userTel = userTel;
		this.userEmail = userEmail;
		this.userImg = userImg;
		this.opTime = opTime;
		this.sign = sign;
	}




	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserAge() {
		return userAge;
	}

	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	
	
	public String getUserImg() {
		return userImg;
	}


	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}


	public Date getOpTime() {
		return opTime;
	}

	public void setOpTime(Date opTime) {
		this.opTime = opTime;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	/** full constructor */
	

}