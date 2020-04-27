package com.gxwzu.core.util;

public class RandomLetterUtil {

	/**
	 * 随机生成大写字母组合
	 * @param n 生成字母组合位数
	 * @return
	 */
	public  String getUpperCaseLetter(int n) {
		
		return getLetter(n).toUpperCase();
	}
	/**
	 * 随机生成小写字母组合
	 * @param n 生成字母组合位数
	 * @return
	 */
	public  String getLowerCaseLetter(int n) {
		
		return getLetter(n).toLowerCase();
	}
	/**
	 * 随机生成字母组合
	 * @param n 生成字母组合位数
	 * @return
	 */
	private  String getLetter(int n) {
		String letter = "";
		for(int i = 0;i<n;i++){
		String chars = "abcdefghijklmnopqrstuvwxyz";
		letter =letter+chars.charAt((int)(Math.random() * 26));
		}
		return letter;
	}
	
}
