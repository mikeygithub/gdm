package com.gxwzu.system.action.sysDepartment;

import java.io.PrintWriter;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class SysDepartmentAction extends BaseAction implements Preparable,ModelDriven<SysDepartment>{

	private static final long serialVersionUID = 4916412819354298067L;
	protected static final String LIST_JSP = "/WEB-INF/page/system/sysDepartment/sysDepartment_list.jsp";
	protected static final String ADD_JSP = "/WEB-INF/page/system/sysDepartment/sysDepartment_add.jsp";
	protected static final String EDIT_JSP = "/WEB-INF/page/system/sysDepartment/sysDepartment_edit.jsp";
	protected final Log logger = LogFactory.getLog(getClass());
	/*****************************对象实例化**************************************************/
	
      private SysDepartment model = new SysDepartment();
	
	@Override
	public SysDepartment getModel() {
		return model;
	}
 
	public void setModel(SysDepartment model){
		this.model = model;
	}

	@Override
	public void prepare() throws Exception {
		if(null == sysDepartment){
			sysDepartment = new SysDepartment();
		}
	}
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	/******************************service接口注入****************************************************/
	@Autowired
	private ISysDepartmentService sysDepartmentService;//学院接口注入
	
  /**************************************变量声明********************************************/
	private Result<SysDepartment> pageResult;//分页
	private SysDepartment sysDepartment;//学院
	private List<SysDepartment> sysDepartmentList;  //院系信息列表（用于查询全部）
	private String mark;
	private Integer thisId;
	private Integer id;
	/**************************************方法体************************************************/
	/**
	 * 列表
	 * @return
	 * @throws Exception
	 */
	public String list(){
		try {
			setPageResult(sysDepartmentService.find(model, getPage(), getRow()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		view =  LIST_JSP;
		return SUCCESS;
	}
	/**
	 * 页面跳转
	 * @return
	 */
	public String openList(){
		return SUCCESS;
	}
	/**
	 * 打开学院添加页面
	 * @return
	 */
	public String openAdd() {
		logger.info("打开学院添加页面");
		view =ADD_JSP;
		return SUCCESS;
	}
	/**
	 * 添加学院
	 * @return
	 */
	public String add(){
		try {
			logger.info("添加学院"+model);
			model = sysDepartmentService.add(model);
			setMark("1");
	} catch (Exception e) {
		e.printStackTrace();
		setMark("0");
	}
		view =ADD_JSP;
		return SUCCESS;
	}
	/**
	 * 删除学院信息
	 * @return
	 */
	public void del() {
		logger.info("删除学院信息"+model.getId());
		boolean isdel = false;
		try {
			PrintWriter out=getResponse().getWriter();
			if(thisId!=null){
				sysDepartmentService.del(thisId);
			 isdel= true;
			}
			out.print(isdel);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 打开学院信息修改页面
	 * @return
	 */
	public String openEdit() {
		logger.info("打开学院信息修改页面");
		try {
			model = sysDepartmentService.findById(thisId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		view =EDIT_JSP;
		return SUCCESS;
	}
	/**
	 * 修改学院信息
	 * @return
	 */
	public String edit() {
		logger.info("修改学院信息");
		try {
			sysDepartmentService.edit(model);
			setMark("1");
		} catch (Exception e) {
			e.printStackTrace();
			setMark("0");
		}
		view =EDIT_JSP;
		return SUCCESS;
	}
	/**
	 * 检查学院编号和名称是否存在
	 * @return
	 */
	public void checkName()throws Exception{
		logger.info("检查用户是否存在");
		try {
			boolean idTrue = true;
			PrintWriter out=getResponse().getWriter();
			List<SysDepartment> lists=sysDepartmentService.findByExample(model);
			
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
	
	/************************************getter and setter 方法*********************************************************/
	public Result<SysDepartment> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<SysDepartment> pageResult) {
		this.pageResult = pageResult;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
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

	public List<SysDepartment> getSysDepartmentList() {
		return sysDepartmentList;
	}

	public void setSysDepartmentList(List<SysDepartment> sysDepartmentList) {
		this.sysDepartmentList = sysDepartmentList;
}

	public SysDepartment getSysDepartment() {
		return sysDepartment;
	}

	public void setSysDepartment(SysDepartment sysDepartment) {
		this.sysDepartment = sysDepartment;
	}

	public ISysDepartmentService getSysDepartmentService() {
		return sysDepartmentService;
	}

	public void setSysDepartmentService(ISysDepartmentService sysDepartmentService) {
		this.sysDepartmentService = sysDepartmentService;
	}

	public Log getLogger() {
		return logger;

	} 
	
}
