package com.gxwzu.core.model;

/**
 * 图表模型实体
 * @author he
 *
 */
public class ChartModel {

	private String year;
	private String type;
	private String count;
	private String layname;
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getLayname() {
		return layname;
	}
	public void setLayname(String layname) {
		this.layname = layname;
	}
	@Override
	public String toString() {
		return "ChartModel [year=" + year + ", type=" + type + ", count="
				+ count + ", layname=" + layname + "]";
	}
	
}
