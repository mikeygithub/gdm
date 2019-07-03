package com.gxwzu.core.model;

import java.io.Serializable;
/**
 * 
 * @author MR.AMU
 * @version  1.0
 * @since 2014
 * <br> create time:2014-10-26
 */
public class ResponeJson implements Serializable {

	private static final long serialVersionUID = -2103814599219109825L;
	public ResponeJson() {
		
	}
	/**
	 * 
	 * @param success-成功-true
	 * @param msg-提示信息
	 */
	public ResponeJson(boolean success, String msg) {
		this.success = success;
		this.msg = msg;
	}

	private boolean success = false;// 是否成功
	private String msg = "";// 提示信息
	private Object obj = null;// 其他信息
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

}
