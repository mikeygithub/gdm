package com.gxwzu.core.model;


public class Series<T> {

	private T data;
	private String name;
	private String value;

	
	public Series() {
		super();
	}
	

	public Series(T data) {
		super();
		this.data = data;
	}


	public Series(String name, String value) {
		super();
		this.name = name;
		this.value = value;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	
	@Override
	public String toString() {
		return "Series [data=" + data + ", name=" + name + ", value=" + value
				+ "]";
	}

}
