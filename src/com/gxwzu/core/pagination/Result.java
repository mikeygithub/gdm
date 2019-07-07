package com.gxwzu.core.pagination;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
/**
 * 
 * @author <a href=mailto:amu_1115@126.com> amu </a>
 * @version $ Result.java 2015-7-12 02:30:18
 */
public class Result<T> implements Serializable {

	
	private int offset;
    private int size;
    private int total;
    private int page;
    private String pageUrl;
    private int totalPage;

    private HashMap<String,Object> dataMap = new HashMap<>();

    private List<T> data=new ArrayList<T>();
    
    public boolean isFirst() {
    	return offset == 0;
    }
    
    public boolean isLast() {
    	return !hasNext();
    }
    
    public boolean hasNext() {
    	if (data == null || size < 0) {
    		return false;
    	}
    	return data.size() > size;
    }
    
    public int getTotalPage() {
    	if (size < 0) return 1;
    	
    	return total % size == 0 ? total/size : total/size + 1;
    }
    
    public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
    
    public int getPage() {
    	return offset/size + 1;
    }
    
    public void setPage(int page) {
		this.page = page;
	}
    
    public Result() {
    }
    
    public Result(int offset, int size) {
    	this(null, offset, size);
    }
    
    public Result(List<T> data, int offset, int size) {
    	this.data = data;
    	this.offset = offset;
    	this.size = size;
    }

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public String getPageUrl() {
		return pageUrl;
	}

	public void setPageUrl(String pageUrl) {
		this.pageUrl = pageUrl;
	}

	public HashMap<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(HashMap<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	@Override
	public String toString() {
		return "Result{" +
				"offset=" + offset +
				", size=" + size +
				", total=" + total +
				", page=" + page +
				", pageUrl='" + pageUrl + '\'' +
				", totalPage=" + totalPage +
				", dataMap=" + dataMap +
				", data=" + data +
				'}';
	}
}
