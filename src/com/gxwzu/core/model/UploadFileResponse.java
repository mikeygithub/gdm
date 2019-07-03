package com.gxwzu.core.model;

import java.util.ArrayList;
import java.util.List;

public class UploadFileResponse<T> {
	private Integer code;  //0 成功 1 失败
	private List<T> data = new ArrayList<T>();
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	
}
