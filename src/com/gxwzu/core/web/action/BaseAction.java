package com.gxwzu.core.web.action;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.gxwzu.core.util.DycContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author <a href=mailto:amu_1115@126.com> amu </a>
 * @version $ BaseAction.java 2015-7-26 下午04:20:18
 */
public class BaseAction extends ActionSupport {
	

	private static final long serialVersionUID = -5391490758289533136L;
	public final String SEARCH = "find";
	public final String FINDPAGE = "findpage";
	public final String DELETE = "del";
	public final String SAVE = "Add";
	public final String UPDATE = "del";
	public final String QUERY = "query";
	public final String LOGIN = "login";
	public final String LOGOUT = "logout";
	public final String OUT = "out";
	
	protected String forwardView;//自定义的跳转页面
	protected Integer page=1;
	protected Integer row=DycContext.DEFUALT_PAGE_SIZE;
	protected String action;
	protected String footer;
    public String filename;
    
    protected  final String HANDLES = "0";
    protected  final String HANDLER = "1";
    protected String handle; // 处理状态  0失败   1成功
    
    protected String tabFlag; // 选择卡 切换标识 
	/**
	 * 模板路径
	 */
	protected String view;
	protected String resUri;
	protected String result="success";

	protected PrintWriter printWriter;//获取输出
	
	protected HttpServletResponse response;//获取response
	protected HttpServletRequest request;//获取response
	
	

    public void setPage(Integer page) {
		this.page = page;
	}

	public void setRow(Integer row) {
		this.row = row;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public int getPage() {
		if(page==null||page==0){
			page=DycContext.DEFUALT_PAGE_NUM;
		}
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	public int getRow() {
		if(row==null||row==0){
		   row=DycContext.DEFUALT_PAGE_SIZE;
		}
		return row;
	}

	public void setRow(int row) {
		this.row = row;
	}
	
	public String getFooter() {
		return footer;
	}

	public void setFooter(String footer) {
		this.footer = footer;
	}

	private String[] delids;


	public String[] getDelids() {
		return delids;
	}
	public static String getParameter(HttpServletRequest request){
		String parameter = "";
		//遍历所有Request请求参数
		Enumeration<String> paramNames = request.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String paramName = paramNames.nextElement();
			String paramValue = request.getParameter(paramName);
			if (!"page".equals(paramName)) {
				parameter = parameter + "&" + paramName + "=" + paramValue;
			}

		}
		return parameter;
	}
	public void setDelids(String[] delids) {
		this.delids = delids;
	}
	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}
	protected String getContextPath() {
		return getRequest().getContextPath();
	}
	
	public PrintWriter getPrintWriter() {
    	if(null == printWriter){
    		try {
    			printWriter = getResponse().getWriter();
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
    	}
		return printWriter;
	}
	
	protected String getParameters(String paramName) {
		HttpServletRequest req =ServletActionContext.getRequest();
		return req.getParameter(paramName);
	}
	
	protected HttpServletResponse getResponse() {
		response =  ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control","no-cache"); 
		 return response;
	}
	
	protected HttpSession getSession() {
		return getRequest().getSession();
	}
	
	public String getRootPath(){
		ActionContext ac = ActionContext.getContext();
		ServletContext sc = (ServletContext) ac
				.get(ServletActionContext.SERVLET_CONTEXT);
		String rootURL = sc.getRealPath("/");
		return rootURL;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

	public String getResUri() {
		return resUri;
	}

	public void setResUri(String resUri) {
		this.resUri = resUri;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	//格式化数字显示
	  public String formatDouble(double s){
	      DecimalFormat fmt = new DecimalFormat("\u00A4##0.00");
	      return fmt.format(s);
	  }

	public String getHandle() {
		return handle;
	}

	public void setHandle(String handle) {
		this.handle = handle;
	}
	public void setForwardView(String forwardView) {
		this.forwardView = forwardView;
	}

	public String getTabFlag() {
		return tabFlag;
	}

	public void setTabFlag(String tabFlag) {
		this.tabFlag = tabFlag;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	
}
