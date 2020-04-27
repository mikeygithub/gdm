package com.gxwzu.core.util.page;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.gxwzu.core.util.SysConstant;



/**
 * 参数过滤器
 * @author MR.AMU
 * @version  1.0
 * @since 2014
 * <br> create time:2014-5-3
 */
public class QueryFilter {

	public final static Log logger=LogFactory.getLog(QueryFilter.class);
	private HttpServletRequest request=null;
	private Map<String,Object> paramsMap=null;
	private PageBean pageBean=null;
	
	/**
	 * Request请求参数集合
	 */
	private List<Object>paramValues=new ArrayList<Object>();
	private List<Object>paramNames=new ArrayList<Object>();
	/**
	 * 构造过滤对象
	 * @param request
	 */
	
	public QueryFilter(HttpServletRequest request,String url) {
    	this.request=request;
    	Enumeration<String> paramEnu= (Enumeration<String>)request.getParameterNames();
    	while(paramEnu.hasMoreElements()){
    		String paramName=(String)paramEnu.nextElement();
    		if(paramName.startsWith("Q_")){
    			String paramValue=(String)request.getParameter(paramName);
    			if(paramValue!=null){
    				paramValues.add(paramValue);
        			paramNames.add(paramName);
        			paramsMap.put(paramName, paramValue);
    			}
    			
    		}
    	}
    	//取得分页的信息
    	Integer start=0;
    	Integer limit=SysConstant.DEFAULT_PAGESIZE;//默认分页条数
    	String s_start=request.getParameter("page");
    	String pagesize=request.getParameter("pagesize");
    	if(StringUtils.isNotEmpty(s_start)){
    		start=new Integer(s_start);
    	}
    	if(StringUtils.isNotEmpty(pagesize)){
    		limit=new Integer(pagesize);
    	}
    	this.pageBean=new PageBean(start, limit);
    }
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public List<Object> getParamValues() {
		return paramValues;
	}
	public void setParamValues(List<Object> paramValues) {
		this.paramValues = paramValues;
	}
	public List<Object> getParamNames() {
		return paramNames;
	}
	public void setParamNames(List<Object> paramNames) {
		this.paramNames = paramNames;
	}
}
