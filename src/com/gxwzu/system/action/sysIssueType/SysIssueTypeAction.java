package com.gxwzu.system.action.sysIssueType;

import java.io.PrintWriter;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.system.model.sysIssueType.SysIssueType;
import com.gxwzu.system.service.sysIssueType.ISysIssueTypeService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 课程类型
 * @author 何金燕
 * @date 2017.9.28
 *
 */
public class SysIssueTypeAction extends BaseAction implements ModelDriven<SysIssueType> {
      
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3736415237244591806L;
	protected final Log logger = LogFactory.getLog(getClass());
	/*********************** 实例化ModelDriven ******************************/
	private SysIssueType model =new SysIssueType();

	@Override
	public SysIssueType getModel() {
		return this.model;
		}
	public void setModel(SysIssueType model) {
		this.model = model;
	}
	/*********************** 注入Service ******************************/
	@Autowired
	private ISysIssueTypeService sysIssueTypeService;
	/*********************** 声明参数 ******************************/
	private Result<SysIssueType> pageResult;// 分页
	private Integer id;
	private Integer thisId;
	private String mark;
	/************************** 方法类 **************************/
	@Override
	public String execute() throws Exception{
		return SUCCESS;
	}
	/**
	 * 列表查询
	 */
	public String list(){
			try{
				logger.info("拿到值了吗 ？"+model.getIssueTypeName());
				pageResult = sysIssueTypeService.find(model,getPage(),getRow());
				footer = PageUtil.pageFooter(pageResult, getRequest());
			}catch(Exception e){
				e.printStackTrace();
			}
			return SUCCESS;
		} 
	
	public String openAdd() {
		logger.info("## 打开添加课题类型");
		return SUCCESS;
	}
	/**
	 * 添加课题类型
	 * @return
	 */
	public String add() {
		try {
				logger.info("添加课题类型"+model);
				model = sysIssueTypeService.add(model);
			    model =new SysIssueType();
			    /*mark = "1";*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list();
	}
	/**
	 * 修改课题类型
	 * @return
	 */
	public String openEdit() {
		try {
			logger.info("打开课题类型修改页面");
			model = sysIssueTypeService.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list();
	}
	
	public String edit() {
		logger.info("修改课题类型信息");
		try {
			sysIssueTypeService.edit(model);
			setMark("1");
		} catch (Exception e) {
			e.printStackTrace();
			 setMark("0");
		}
		return list();
	}
	/**
	 * 删除课题类型
	 * @return
	 */
	public String del() {
		logger.info("删除课题类型信息");
		boolean isdel = false;
		try {
			PrintWriter out=getResponse().getWriter();
			if(thisId!=null){
				sysIssueTypeService.del(thisId);
			 isdel= true;
			}
			out.print(isdel);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 检查课题类型是否存在
	 * @author 何金燕
	 * @return
	 */
	public void checkName()throws Exception{
		logger.info("检查课题类型是否存在");
		try {
			boolean idTrue = true;
			PrintWriter out = getResponse().getWriter();
			List<SysIssueType> lists = sysIssueTypeService.findByExample(model);
			
			if(null!=lists && lists.size()>0){
				idTrue = false;
			}
			out.print(idTrue);
			out.flush();
			out.close();
		} catch (Exception e) {
            logger.info("检查课题类型出错");
		}
	}
	/***********************getter and setter 方法*************************************/
	public ISysIssueTypeService getSysIssueTypeService() {
		return sysIssueTypeService;
	}
	public void setSysIssueTypeService(ISysIssueTypeService sysIssueTypeService) {
		this.sysIssueTypeService = sysIssueTypeService;
	}
	
	public Result<SysIssueType> getPageResult() {
		return pageResult;
	}
	public void setPageResult(Result<SysIssueType> pageResult) {
		this.pageResult = pageResult;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getThisId() {
		return thisId;
	}
	public void setThisId(Integer thisId) {
		this.thisId = thisId;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public Log getLogger() {
		return logger;
	}
}
