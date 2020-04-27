package com.gxwzu.core.model;

import java.io.Serializable;
/**
 * base model
 * @author <a href=mailto:amu_1115@126.com> amu </a>
 * @version $ BaseModel.java 2015-7-9 ����08:33:16
 */
public abstract class BaseModel implements Serializable{
	private static final long serialVersionUID = -6388545626195096054L;
	public abstract String toString();
	
	private Integer version;
	protected static final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
	public Integer getVersion() {
		return version;
	}
	public void setVersion(Integer version) {
		this.version = version;
	}
}
