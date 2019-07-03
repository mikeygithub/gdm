package com.gxwzu.core.util;

import java.util.Calendar;

public class GeneralUtil {
	/**
	 * 判断一组字符串是否为空，只要有一个空返回true
	 * @param strings
	 * @return 为空返回ture
	 */
	public static boolean isEmpty(String...strings){
		for (String string : strings) {
			if(string==null||string.equals("")||string.equals("{}")||string.equals("[]")){
				return true;
			}
		}
		return false;
	}
	/**
	 * 判断一组数字是否为空，只要有一个空返回true
	 * @param integers
	 * @return 为空返回ture
	 */
	public static boolean isEmpty(Integer...integers){
		for (Integer integer : integers) {
			if(integer==null){
				return true;
			}
		}
		return false;
	}
	/**
	 * 获取当前年份
	 * @return
	 */
	public static int getYear(){
		 Calendar now = Calendar.getInstance(); 
		return now.get(Calendar.YEAR);
	}
}
