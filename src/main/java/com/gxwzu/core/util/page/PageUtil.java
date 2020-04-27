package com.gxwzu.core.util.page;

/**
 * @author 梧州学院 软件研发中心
 * @version 1.0 <br>
 *          Copyright (C), 2009, 梧州学院 软件研发中心 <br>
 *          This program is protected by copyright laws. <br>
 *          Program Name: 分页功能集合 <br>
 *          作用：分页中的某一些功能进行封装 <br>
 *          Date: 2009/07/25
 */

public class PageUtil {	
	/**
	 * 对分页中底部的导航条
	 * 
	 * @param pageBean
	 *            分页对象
	 * @return 底部导航菜单
	 */
	public static String pageFooter(PageBean pageBean, String url,
			String parameter, String pagename) {
		String firstPage = "";// 第一页
		String jumpPage = "";//跳转页面下拉框
		String lastPage = "";// 最后一页
		String footer = "";// 底部导航菜单
		
		// 如果现在是第一页，则第一页和上一页为没有连接的字符
		if (pageBean.getCurrentPage() == 1) {
			firstPage = " 第一页 上一页 ";
		} else {
			firstPage = " <a href=\"" + url + pagename + "=1&" + parameter + "\">第一页</a> " 
					+ "<a href=\"" + url + pagename + "="+ (pageBean.getCurrentPage() - 1) + "&" + parameter + "\">" + "上一页</a> ";
		}
		
		jumpPage += "<select name=" +pagename+ ">";
		for(int i=1;i<=pageBean.getTotalPage();i++){
			jumpPage += "<option value="+i+">第"+i+"页</option>";
		}
		jumpPage += "</select>";
		jumpPage += "<input type=\"button\" value=\"跳转\" onClick=\"jump_submit('" + pagename + "','" + url+parameter + "')\">";
		
		if (pageBean.getCurrentPage() < pageBean.getTotalPage()) {
			lastPage = "<a href=\"" + url + pagename + "=" + (pageBean.getCurrentPage() + 1) + "&" + parameter + "\">" + "<下一页 /a> " 
					+ "<a href=\"" + url + pagename + "=" + pageBean.getTotalPage() + "&" + parameter + "\">最后一页</a> ";
		} else {
			lastPage = " 下一页 最后一页 ";
		}

		footer = "共 " + pageBean.getAllRow() + " 记录   共 "
				+ pageBean.getTotalPage() + " 页";
		footer = footer + " 当前 " + pageBean.getCurrentPage() + " 页";
		footer = "<form id=\"" + pagename + "\" action=\"" + url + "\" method=\"post\">"+ footer + firstPage + jumpPage + lastPage + "</form>";
		return footer;
	}

	}
