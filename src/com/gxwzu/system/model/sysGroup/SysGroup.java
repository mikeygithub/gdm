package com.gxwzu.system.model.sysGroup;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.gxwzu.system.dao.sysMenu.impl.SysMenuDaoImpl;
import com.gxwzu.system.model.sysMenu.SysMenu;
import com.gxwzu.system.model.sysOperation.SysOperation;
import com.gxwzu.system.model.sysPermission.SysPermission;

/**
 * 操作分组
 * @author he
 *
 */
public class SysGroup {
	private Integer groupId;
	private String groupName;   //分组名称
	private String groupPerm; //分组权限
	private Integer menuId;  //菜单ID
	private Integer weight;  //权值
	private String groupUrl; //访问地址
	private SysMenu sysMenu;  //菜单
	private Set<SysOperation> operations = new HashSet<SysOperation>(); // 操作
	private List<SysOperation> operationList  = new ArrayList<SysOperation>(); // 权限list
	
	public SysGroup() {
		super();
	}
	
	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}


	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	
	public String getGroupPerm() {
		return groupPerm;
	}
	public void setGroupPerm(String groupPerm) {
		this.groupPerm = groupPerm;
	}
	public Set<SysOperation> getOperations() {
		return operations;
	}

	public void setOperations(Set<SysOperation> operations) {
		this.operations = operations;
	}

	
	public SysMenu getSysMenu() {
		return sysMenu;
	}

	public void setSysMenu(SysMenu sysMenu) {
		this.sysMenu = sysMenu;
	}

	public void setOperationList(List<SysOperation> operationList) {
		this.operationList = operationList;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public String getGroupUrl() {
		return groupUrl;
	}

	public void setGroupUrl(String groupUrl) {
		this.groupUrl = groupUrl;
	}

	public List<SysOperation> getOperationList() {
		List<SysOperation> operationList  = new ArrayList<SysOperation>(); // 权限List
		  Iterator it=operations.iterator();
	       while(it.hasNext())
	       {
	    	   SysOperation o=(SysOperation) it.next();
	           operationList.add(o);
	       }
	       
	       return operationList;
	}
}
