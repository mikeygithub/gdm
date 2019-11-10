package com.gxwzu.system.action.sysCategory;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.system.model.sysCategory.SysCategory;
import com.gxwzu.system.model.sysClass.SysClass;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.service.sysCategory.ISysCategoryService;
import com.gxwzu.system.service.sysClass.ISysClassService;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 大类信息
 * @author 黎艺侠
 * @date 2017.7.29
 */
public class SysCategoryAction extends BaseAction implements ModelDriven<SysCategory>{

	
	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());
	
	/*********************** 实例化ModelDriven ******************************/
	private SysCategory model = new SysCategory();
	
 
	public void setModel(SysCategory model){
		this.model = model;
	}
	
	@Override
	public SysCategory getModel() {
		return model;
	}
	
	
	/*********************** Service接口注入 ***************************/
	@Autowired
	private ISysCategoryService sysCategoryService;              //大类接口
	@Autowired
	private ISysDepartmentService sysDepartmentService;    //院系接口

	/******************** 变量声明 *********************/
	private Result<SysCategory> pageResult;                   //分页
	private List<SysDepartment> departmentList = new ArrayList<SysDepartment>();         //院系信息列表（用于页面判断）
	private Integer id;
	private Integer thisId;
	private String mark;
	
	/************************** 方法类 **************************/
	@Override
	public String execute() throws Exception{
		return SUCCESS;
	}

	
	/**
	 * 大类显示列表
	 * @return
	 */
     public String list(){
		try {
			pageResult = sysCategoryService.find(model, getPage(), getRow());
			departmentList=sysDepartmentService.findAllSysDepartmentList();

			footer = PageUtil.pageFooter(pageResult, getRequest());
			
			setMark("1");
		} catch (Exception e) {
			e.printStackTrace();
			setMark("0");
		}
		return SUCCESS;
	}
	
     /**
 	 * 打开添加大类页面
 	 * @return
 	 */
 	public String openAdd() {
 		logger.info("## 打开添加大类");
 		departmentList=sysDepartmentService.findAllSysDepartmentList();
 		return SUCCESS;
 	}
 	/**
 	 * 添加大类
 	 * @return
 	 */
 	public String add() {
 		try {
 				logger.info("添加大类"+model);
 				model = sysCategoryService.add(model);
 				mark = "1";
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
 		return SUCCESS;
 	}
	
 	/**
	 * 打开大类修改页面
	 * @return
	 */
	public String openEdit() {
		try {
			logger.info("打开大类修改页面:"+thisId);
			model = sysCategoryService.findById(thisId);
			departmentList=sysDepartmentService.findAllSysDepartmentList();
			logger.info("Model:"+model);
			logger.info("Dept:"+departmentList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("view : "+view);
		return SUCCESS;
	}
	/**
	 * 修改大类信息
	 * @return
	 */
	public String edit() {
		logger.info("修改大类信息");
		try {
			sysCategoryService.edit(model);
			setMark("1");
		} catch (Exception e) {
			e.printStackTrace();
			setMark("0");
		}
		return SUCCESS;
	}
 	
	
	/**
	 * 检查专业编号和名称是否存在
	 * @return
	 */
	public void checkName()throws Exception{
		logger.info("检查用户是否存在");
		try {
			boolean idTrue = true;
			PrintWriter out=getResponse().getWriter();
			List<SysCategory> lists=sysCategoryService.findByExample(model);
			if(null!=lists && lists.size()>0){//不可用
				idTrue = false;
		}
			out.print(idTrue);
			out.flush();
			out.close();
		} catch (Exception e) {
			logger.info("检查用户出错");
		}
	}
	
     /**
 	 * 删除大类
 	 * @return
 	 */
 	public String del(){
 		logger.info("删除大类信息");
 		boolean isdel = false;
 		try {
 			PrintWriter out=getResponse().getWriter();
 			if(thisId!=null){
 				sysCategoryService.del(thisId);
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
	 * 联动查询
	 * 查询大类json数据通过学院编号
	 * @return
	 */
	public void findJsonByDept()throws Exception{
		logger.info("查询大类json数据通过学院编号");
		try {
			List<SysCategory> lists = new ArrayList<SysCategory>();
			HttpServletResponse response = getResponse();
			response.setCharacterEncoding("utf-8");
			PrintWriter out=response.getWriter();
			if(StringUtils.isNotEmpty(model.getDeptNumber())){
			 lists=sysCategoryService.findByDeptNumber(model.getDeptNumber());
			 logger.info("编号="+model.getDeptNumber()+"\t的大类信息="+lists);
			}
			out.print(new Gson().toJson(lists));
			out.flush();
			out.close();
		} catch (Exception e) {
			logger.info("查询大类json数据通过学院编号"+e);
		}
	}
	/*************************getter/setter方法*****************************************/
	public ISysCategoryService getSysCategoryService() {
		return sysCategoryService;
	}

	public void setSysCategoryService(ISysCategoryService sysCategoryService) {
		this.sysCategoryService = sysCategoryService;
	}

	public ISysDepartmentService getSysDepartmentService() {
		return sysDepartmentService;
	}

	public void setSysDepartmentService(ISysDepartmentService sysDepartmentService) {
		this.sysDepartmentService = sysDepartmentService;
	}

	public Result<SysCategory> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<SysCategory> pageResult) {
		this.pageResult = pageResult;
	}

	public List<SysDepartment> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<SysDepartment> departmentList) {
		this.departmentList = departmentList;
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
	
	
	
}
