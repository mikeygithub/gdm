package com.gxwzu.core.util;


public class ObjectUtil {

	/**
	 * 检查替换String为空字符串
	 * @param o
	 * @return
	 */
	public static String getString(Object o){
		return o!=null?""+o:"";
	}
	/**
	 * 检查替换为Integer空为默认值
	 * @param o
	 * @return
	 */
	public static Integer getInteger(Object o){
	   
		try {
			return (Integer) (o!=null?o:"");
		} catch (Exception e) {
			return null;
		}
	}
}
