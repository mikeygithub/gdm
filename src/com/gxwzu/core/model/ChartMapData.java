package com.gxwzu.core.model;

import java.util.List;

/**
 * 图表数据集合
 * @author he
 *
 */
public class ChartMapData {
	//图表横坐标数据
	List<String> pList;
	//图表类别数据
	List<String> typeList;
	//图表年份数据
	List<String> yearList;
	
	List<IssueTypeValue<String,List<String>>> valueList;
	//图表横坐标对应类别数据
	List<Options> options;
	public List<String> getpList() {
		return pList;
	}
	public void setpList(List<String> pList) {
		this.pList = pList;
	}
	public List<String> getTypeList() {
		return typeList;
	}
	public void setTypeList(List<String> typeList) {
		this.typeList = typeList;
	}
	public List<String> getYearList() {
		return yearList;
	}
	public void setYearList(List<String> yearList) {
		this.yearList = yearList;
	}
	public List<Options> getOptions() {
		return options;
	}
	public void setOptions(List<Options> options) {
		this.options = options;
	}
	public List<IssueTypeValue<String,List<String>>> getValueList() {
		return valueList;
	}
	public void setValueList(List<IssueTypeValue<String,List<String>>> valueList) {
		this.valueList = valueList;
	}
	
	
	
}
