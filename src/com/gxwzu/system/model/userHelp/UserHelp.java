package com.gxwzu.system.model.userHelp;

import java.util.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.gxwzu.system.model.sysRole.SysRole;

/**
 * UserHlep entity. @author MyEclipse Persistence Tools
 */

public class UserHelp implements java.io.Serializable {

	// Fields

	protected Integer id;
	protected String userName;
	protected String loginName;
	protected String password;
	protected String userType;
	protected String userSex;
	protected String userAge;
	protected String userTel;
	protected String  userEmail;
	protected String userImg;
	protected Date opTime;
	protected String sign;
	protected Set<SysRole> sysRoles = new HashSet<SysRole>(); // 权限
	protected List<SysRole> sysRoleList  = new ArrayList<SysRole>(); // 权限list
	// Constructors

	/** default constructor */
	public UserHelp() {
	}

	/** full constructor */
	public UserHelp( String userId,String userName, String loginName, String password,
			String userType, Date opTime, String sign) {
		this.userName = userName;
		this.loginName = loginName;
		this.password = password;
		this.userType = userType;
		this.opTime = opTime;
		this.sign = sign;
	
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return this.userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Date getOpTime() {
		return this.opTime;
	}

	public void setOpTime(Date opTime) {
		this.opTime = opTime;
	}

	public String getSign() {
		return this.sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public Set<SysRole> getSysRoles() {
		return sysRoles;
	}

	public void setSysRoles(Set<SysRole> sysRoles) {
		this.sysRoles = sysRoles;
	}

	public List<SysRole> getSysRoleList() {
		List<SysRole> sysRoleList  = new ArrayList<SysRole>(); 
		  Iterator it=sysRoles.iterator();
	       while(it.hasNext())
	       {
	    	   SysRole o=(SysRole) it.next();
	    	   sysRoleList.add(o);
	       }
	       return sysRoleList;
	}

	public void setSysRoleList(List<SysRole> sysRoleList) {
		this.sysRoleList = sysRoleList;
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

	@Override
	public String toString() {
		return "UserHelp{" +
				"id=" + id +
				", userName='" + userName + '\'' +
				", loginName='" + loginName + '\'' +
				", password='" + password + '\'' +
				", userType='" + userType + '\'' +
				", userSex='" + userSex + '\'' +
				", userAge='" + userAge + '\'' +
				", userTel='" + userTel + '\'' +
				", userEmail='" + userEmail + '\'' +
				", userImg='" + userImg + '\'' +
				", opTime=" + opTime +
				", sign='" + sign + '\'' +
				", sysRoles=" + sysRoles +
				", sysRoleList=" + sysRoleList +
				'}';
	}
}