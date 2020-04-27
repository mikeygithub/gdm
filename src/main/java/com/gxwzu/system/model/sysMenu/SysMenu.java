package com.gxwzu.system.model.sysMenu;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.gxwzu.system.model.sysGroup.SysGroup;
import com.gxwzu.system.model.sysPermission.SysPermission;

/**
 * 系统菜单
 * @author he
 *
 */
public class SysMenu {
	private Integer menuId;
	private String menuName;   //菜单名称
	private String menuPerm;   //菜单权限
	private Integer weight;  //权值
	private Set<SysGroup> sysGroups = new HashSet<SysGroup>(); // 权限
	private List<SysGroup> sysGroupList  = new ArrayList<SysGroup>(); // 权限list
	
	public SysMenu() {
		super();
	}
	

	public Integer getMenuId() {
		return menuId;
	}



	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}



	
	public String getMenuName() {
		return menuName;
	}



	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuPerm() {
		return menuPerm;
	}


	public void setMenuPerm(String menuPerm) {
		this.menuPerm = menuPerm;
	}


	public Set<SysGroup> getSysGroups() {
		return sysGroups;
	}

	public void setSysGroups(Set<SysGroup> sysGroups) {
		this.sysGroups = sysGroups;
	}

	public void setSysGroupList(List<SysGroup> sysGroupList) {
		this.sysGroupList = sysGroupList;
	}

	public Integer getWeight() {
		return weight;
	}


	public void setWeight(Integer weight) {
		this.weight = weight;
	}


	public List<SysGroup> getSysGroupList() {
		List<SysGroup> sysGroupList  = new ArrayList<SysGroup>(); // 子菜单项目List
		  Iterator it=sysGroups.iterator();
	       while(it.hasNext())
	       {
	    	   SysGroup o=(SysGroup) it.next();
	    	   sysGroupList.add(o);
	       }
	       
	       return sysGroupList;
	}
}
