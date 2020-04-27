package com.gxwzu.core.model;

import java.io.Serializable;
/**
 * 自动匹配数据类
 * @author author
 *
 */
public class AutoCompleteHttpModel implements Serializable{

	private static final long serialVersionUID = 9127641351170424771L;
	private String itemId;
	private String itemValue;
	private String itemName;
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getItemValue() {
		return itemValue;
	}
	public void setItemValue(String itemValue) {
		this.itemValue = itemValue;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	

}
