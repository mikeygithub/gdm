package com.gxwzu.core.model;

public class ZTreeModel {
	private Integer id;
	private Integer pId;
	private String name; 
	private String aliasName;
	private boolean checked;
	private boolean open;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getpId() {
		return pId;
	}
	public void setpId(Integer pId) {
		this.pId = pId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAliasName() {
		return aliasName;
	}
	public void setAliasName(String aliasName) {
		this.aliasName = aliasName;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	
	
	public ZTreeModel(Integer id, Integer pId, String name, String aliasName,boolean open) {
		this(id,pId,name,aliasName,false,open);
	}
	
	public ZTreeModel(Integer id, Integer pId, String name, String aliasName,
			boolean checked, boolean open) {
		super();
		this.id = id;
		this.pId = pId;
		this.name = name;
		this.aliasName = aliasName;
		this.checked = checked;
		this.open = open;
	}
	
	
	public ZTreeModel() {
		super();
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
}
