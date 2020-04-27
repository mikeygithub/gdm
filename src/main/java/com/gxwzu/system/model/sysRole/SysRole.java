package com.gxwzu.system.model.sysRole;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.commons.collections.map.HashedMap;

import com.gxwzu.system.model.sysPermission.SysPermission;
import com.gxwzu.system.model.userHelp.UserHelp;

public class SysRole  implements Serializable{
	private Integer id;
	private String roleName; // 角色名
	private String description; // 角色详情
	private Set<UserHelp> userHelps = new HashSet<UserHelp>(); // 用户
	private List<UserHelp> userHelpList  = new ArrayList<UserHelp>(); // 用户list
	private Set<SysPermission> permissions = new HashSet<SysPermission>(); // 权限
	private List<SysPermission> permissionList  = new ArrayList<SysPermission>(); // 权限list

	public SysRole() {
		super();
	}

	public SysRole(Integer id, String roleName, String description,
			Set<UserHelp> userHelps, Set<SysPermission> permissions) {
		super();
		this.id = id;
		this.roleName = roleName;
		this.description = description;
		this.userHelps = userHelps;
		this.permissions = permissions;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<UserHelp> getUserHelps() {
		return userHelps;
	}

	public void setUserHelps(Set<UserHelp> userHelps) {
		this.userHelps = userHelps;
	}

	public Set<SysPermission> getPermissions() {
		return permissions;
	}

	public void setPermissions(Set<SysPermission> permissions) {
		this.permissions = permissions;
	}


	
	public void setPermissionList(List<SysPermission> permissionList) {
		this.permissionList = permissionList;
	}

	public List<SysPermission> getPermissionList() {
		List<SysPermission> permissionList  = new ArrayList<SysPermission>(); // 权限List
		  Iterator it=permissions.iterator();
	       while(it.hasNext())
	       {
	           SysPermission o=(SysPermission) it.next();
	           permissionList.add(o);
	       }
	       
	       return permissionList;
	}
	
	public void setUserHelpList(List<UserHelp> userHelpList) {
		this.userHelpList = userHelpList;
	}

	public List<UserHelp> getUserHelpList() {
		List<UserHelp> userHelpList  = new ArrayList<UserHelp>(); 
		  Iterator it=userHelps.iterator();
	       while(it.hasNext())
	       {
	    	   UserHelp o=(UserHelp) it.next();
	           userHelpList.add(o);
	       }
	       
	       return userHelpList;
	}

	@Override
	public String toString() {
		return "SysRole{" +
				"id=" + id +
				", roleName='" + roleName + '\'' +
				", description='" + description + '\'' +
				", userHelps=" + userHelps +
				", userHelpList=" + userHelpList +
				", permissions=" + permissions +
				", permissionList=" + permissionList +
				'}';
	}
}
