package com.gxwzu.core.util.poi;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * 读写Excel数据单元数据集
 * @author Mr.Ab
 * @version 1.0
 */
public class ExcelDataSet {

	public ExcelDataSet() {

	}
	private String[] headers;
	private String[] rowHeaders;
	private  Set<String> conStrctSet;
	private String msg;
    /**
     * 数据集合
     */
	private List<String[]> datasList = new ArrayList<String[]>();

	public List<String[]> getDatasList() {
		return datasList;
	}

	public void setDatasList(List<String[]> datasList) {
		this.datasList = datasList;
	}

	public Set<String> getConStrctSet() {
		return conStrctSet;
	}

	public void setConStrctSet(Set<String> conStrctSet) {
		this.conStrctSet = conStrctSet;
	}

	public String[] getHeaders() {
		return headers;
	}

	public void setHeaders(String[] headers) {
		this.headers = headers;
	}

	public ExcelDataSet(String[] headers, String[] rowHeaders) {
		super();
		this.headers = headers;
		this.rowHeaders = rowHeaders;
	}

	public String[] getRowHeaders() {
		return rowHeaders;
	}

	public void setRowHeaders(String[] rowHeaders) {
		this.rowHeaders = rowHeaders;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
