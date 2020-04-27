package com.gxwzu.system.action.sysMajor;

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
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysCategory.ISysCategoryService;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 专业信息
 * 
 * @author hjy
 * 
 */
public class SysMajorAction extends BaseAction implements ModelDriven<SysMajor> {

	private static final long serialVersionUID = 3400581425620304125L;
	protected static final String LIST_JSP = "/WEB-INF/page/system/sysMajor/sysMajor_list.jsp";
	protected static final String ADD_JSP = "/WEB-INF/page/system/sysMajor/sysMajor_add.jsp";
	protected static final String EDIT_JSP = "/WEB-INF/page/system/sysMajor/sysMajor_edit.jsp";
	protected final Log logger = LogFactory.getLog(getClass());
	/********************************* 实例化对象 ****************************************/
	private SysMajor model = new SysMajor();

	@Override
	public SysMajor getModel() {
		return model;
	}

	public void setModel(SysMajor model) {
		this.model = model;
	}

	/************************************ service接口注入 *********************************/
	@Autowired
	private ISysMajorService sysMajorService;
	@Autowired
	private ISysDepartmentService sysDepartmentService;
	@Autowired
	private ISysCategoryService sysCategoryService;
	/********************************************* 声明参数 *****************************/
	private Result<SysMajor> pageResult;// 分页
	private Integer id;
	private Integer thisId;
	private String mark;
	private List<SysDepartment> departmentList = new ArrayList<SysDepartment>();
	private List<SysCategory> categoryList = new ArrayList<SysCategory>();

	/******************************** 方法体 ******************************************************/
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	/**
	 * 专业列表
	 * 
	 * @return
	 */
	public String list() {
		try {
			pageResult = sysMajorService.find(model, getPage(), getRow());
			footer = PageUtil.pageFooter(pageResult, getRequest());
			// ********************************二级查询// 学院-大类**********************************/
			departmentList = sysDepartmentService.findAllSysDepartmentList();
			if (model.getDeptNumber() == null && departmentList != null && departmentList.size() != 0) {
				model.setDeptNumber(departmentList.get(0).getDeptNumber());
			}
			categoryList = sysCategoryService.findByExample(new SysCategory());//findByDeptNumber(model.getDeptNumber());
			// ********************************二级查询
			logger.warn("大类信息："+categoryList);
			// cend**********************************/
		} catch (Exception e) {
			e.printStackTrace();
		}
		view = LIST_JSP;
		return SUCCESS;
	}

	/**
	 * 页面跳转
	 * 
	 * @return
	 */
	public String openList() {
		return SUCCESS;
	}

	/**
	 * 打开添加专业页面
	 * 
	 * @return
	 */
	public String openAdd() {
		logger.info("## 打开添加专业");
		// ********************************二级查询
		// 学院-大类**********************************/
		departmentList = sysDepartmentService.findAllSysDepartmentList();
		if (model.getDeptNumber() == null && departmentList != null && departmentList.size() != 0) {
			model.setDeptNumber(departmentList.get(0).getDeptNumber());
		}
		categoryList = sysCategoryService.findByDeptNumber(model
				.getDeptNumber());
		// ********************************二级查询
		// cend**********************************/
		view = ADD_JSP;
		return SUCCESS;
	}

	/**
	 * 添加专业
	 * 
	 * @return
	 */
	public String add() {
		try {
			logger.info("添加专业" + model);
			model = sysMajorService.add(model);
			setMark("1");
		} catch (Exception e) {
			e.printStackTrace();
			setMark("0");
		}
		view = ADD_JSP;
		return SUCCESS;
	}

	/**
	 * 删除专业
	 * 
	 * @return
	 */
	public String del() {
		logger.info("删除专业信息");
		boolean isdel = false;
		try {
			PrintWriter out = getResponse().getWriter();
			if (thisId != null) {
				sysMajorService.del(thisId);
				isdel = true;
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
	 * 打开专业修改页面
	 * 
	 * @return
	 */
	public String openEdit() {
		try {
			logger.info("打开专业修改页面");
			model = sysMajorService.findById(thisId);
			// ********************************二级查询
			// 学院-大类**********************************/
			departmentList = sysDepartmentService.findAllSysDepartmentList();
			if (model.getDeptNumber() == null && departmentList != null
					&& departmentList.size() != 0) {
				model.setDeptNumber(departmentList.get(0).getDeptNumber());
			}
			categoryList = sysCategoryService.findByDeptNumber(model
					.getDeptNumber());
			// ********************************二级查询
			// cend**********************************/
		} catch (Exception e) {
			e.printStackTrace();
		}
		view = EDIT_JSP;
		return SUCCESS;
	}

	/**
	 * 修改专业信息
	 * 
	 * @return
	 */
	public String edit() {
		logger.info("修改专业信息");
		try {
			if (thisId != null) {
				SysMajor sysMajor = sysMajorService.findById(thisId);
				sysMajor.setDeptNumber(model.getDeptNumber());
				sysMajor.setCategoryId(model.getCategoryId());
				sysMajorService.edit(sysMajor);
				setMark("1");
			}else{
				setMark("0");
			}
		} catch (Exception e) {
			e.printStackTrace();
			setMark("0");
		}
		view = EDIT_JSP;
		return SUCCESS;
	}

	/**
	 * 检查专业编号和名称是否存在
	 * 
	 * @return
	 */
	public void checkName() throws Exception {
		logger.info("检查用户是否存在");
		try {
			boolean idTrue = true;
			PrintWriter out = getResponse().getWriter();
			List<SysMajor> lists = sysMajorService.findByExample(model);
			if (null != lists && lists.size() > 0) {// 不可用
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
	 * 联动查询 查询专业json数据通过学院编号
	 * 
	 * @return
	 */
	public void findJsonByDept() throws Exception {
		logger.info("查询专业json数据通过学院编号");
		try {
			List<SysMajor> lists = new ArrayList<SysMajor>();
			HttpServletResponse response = getResponse();
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			lists = sysMajorService.findByExample(model);
			out.print(new Gson().toJson(lists));
			out.flush();
			out.close();
		} catch (Exception e) {
			logger.info("查询专业json数据通过学院编号" + e);
		}
	}

	/********************************* 方法体 ************************************************************/
	public ISysMajorService getSysMajorService() {
		return sysMajorService;
	}

	public void setSysMajorService(ISysMajorService sysMajorService) {
		this.sysMajorService = sysMajorService;
	}

	public Result<SysMajor> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<SysMajor> pageResult) {
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

	public List<SysDepartment> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<SysDepartment> departmentList) {
		this.departmentList = departmentList;
	}

	public List<SysCategory> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<SysCategory> categoryList) {
		this.categoryList = categoryList;
	}

}
