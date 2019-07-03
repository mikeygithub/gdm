package com.gxwzu.system.model.sysPermission;

import com.gxwzu.system.model.sysRole.SysRole;

public class SysPermission {
	private Integer id;
	private String   resource;
	private Integer roleId ; //角色Id
	private SysRole role = new SysRole(); //角色
	

	public SysPermission() {
		super();
	}
	

	public SysPermission(String resource) {
		super();
		this.resource = resource;
	}


	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getResource() {
		return resource;
	}
	public void setResource(String resource) {
		this.resource = resource;
	}


	public Integer getRoleId() {
		return roleId;
	}


	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}


	public SysRole getRole() {
		return role;
	}


	public void setRole(SysRole role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "SysPermission{" +
				"id=" + id +
				", resource='" + resource + '\'' +
				", roleId=" + roleId +
				", role=" + role +
				'}';
	}
}
