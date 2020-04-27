package com.gxwzu.core.util;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gxwzu.core.pagination.Result;

/**
 * 
 * PageUtil-主要完成分页导航条
 * @author  梧州学院 软件研发中心 Mr.aben
 * @version  1.0
 * <br>Copyright (C), 2015, 梧州学院 软件研发中心
 * <br>This program is protected by copyright laws.
 * <br>Program Name: PageUtil
 * <br>Date: 2015-8-14
 */
public class PageUtil {

	
	/**
	 * 
	 * @param grid- 分页结果集
	 * @param url
	 * @param request
	 * @return
	 */
	public static String pageFooter(Result grid, HttpServletRequest request) {
		try{
		String firstPage = "";// 第一页
		String lastPage = "";// 最后一页
		String footer = "";// 底部导航菜单
		String parameter = "";
		String midPage = "";
		String uri=request.getRequestURI();
		String url=uri;
		
		
		//遍历所有Request请求参数
		Enumeration<String> paramNames = request.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String paramName = paramNames.nextElement();
			String paramValue = request.getParameter(paramName);
			String page=request.getParameter("page");
			page=page==null?"1":page;
			if(Integer.parseInt(page)>1){
			  paramValue = new String(paramValue.getBytes("ISO-8859-1"), "UTF-8");
			
			}
			
			if (!"page".equals(paramName)) {
				parameter = parameter + "&" + paramName + "=" + paramValue;
			}

		}

		if (grid.getPage() == 1) {
			firstPage = " 第一页  ";
		} else {
			firstPage = " <a class=\"big\" target=\"_self\" href=\"" + url + "?page=1" + parameter
					+ "\">第一页</a> " ;
		}
		List<Integer> pageList = genLinkPageNums(grid.getPage(),
				grid.getTotalPage(), 10);

		for (int i = 0; i < pageList.size(); i++) {
			int p_i = pageList.get(i);
			if (grid.getPage() == p_i) {
				midPage = midPage + " <a class=\"big\"  target=\"_self\" href=\"" + url + "?page=1" + parameter + "\"><strong>"

				+ pageList.get(i) + "</strong> </a> ";
			} else {
				midPage = midPage + " <a class=\"big\" target=\"_self\"  href=\"" + url + "?page=" + p_i
						+ parameter + "\">" + pageList.get(i) + " </a> ";
			}

		}
		if (grid.getPage() < grid.getTotalPage()) {
			lastPage = "<a class=\"big\" target=\"_self\" href=\"" + url + "?page=" + (grid.getPage() + 1)
					+ parameter + "\">" + "</a> " + "<a href=\"" + url
					+ "?page=" + grid.getTotalPage() + parameter
					+ "\">最后一页</a> ";
		} else {
			lastPage = "  最后一页 ";
		}

		footer = "共 " + grid.getTotal() + " 记录   共 " + grid.getTotalPage()
				+ " 页";
		footer = footer + " 当前 " + grid.getPage() + " 页";
		footer = footer + firstPage + midPage + lastPage;

		grid.setPageUrl(url+"?"+parameter+"&page="); //设置分页页面地址
		return footer;
		}catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	
	private static List<Integer> genLinkPageNums(int currentPageNumber,
			int lastPageNumber, int count) {
		int avg = count / 2;
		int startPageNumber = currentPageNumber - avg;
		if (startPageNumber <= 0) {
			startPageNumber = 1;
		}
		int endPageNumber = startPageNumber + count - 1;
		if (endPageNumber > lastPageNumber) {
			endPageNumber = lastPageNumber;
		}
		if (endPageNumber - startPageNumber < count) {
			startPageNumber = endPageNumber - count;
			if (startPageNumber <= 0) {
				startPageNumber = 1;
			}
		}
		java.util.List<Integer> result = new java.util.ArrayList<Integer>();
		for (int i = startPageNumber; i <= endPageNumber; i++) {
			result.add(new Integer(i));
		}
		return result;
	}
	
}
