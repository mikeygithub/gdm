package com.gxwzu.business.action.plan;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxwzu.business.model.guideCount.GuideCount;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.business.service.guideCount.IGuideCountSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.business.service.teacherMajor.ITeacherMajorService;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.sysVO.ListTeacherGuideCount;
import com.gxwzu.system.model.sysCategory.SysCategory;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.service.sysCategory.ISysCategoryService;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 指导安排可带学生个数
 * 
 * @author 何志明
 * @date 2017.7.10
 */
public class PlanGuideAction extends BaseAction implements
		ModelDriven<GuideCount> {

	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());

	/*********************** 实例化ModelDriven ******************************/
	private GuideCount model = new GuideCount();

	@Override
	public GuideCount getModel() {
		return model;
	}

	public void setModel(GuideCount model) {
		this.model = model;
	}

	/*********************** Service接口注入 ***************************/
	@Autowired
	private IGuideCountSerivce guideCountSerivce; // 老师可带学生个数接口
	@Autowired
	private ISysTeacherService sysTeacherService; // 老师分配接口
	@Autowired
	private IPlanYearSerivce planYearSerivce; // 年度计划接口
	@Autowired
	private ISysMajorService sysMajorService; // 专业接口
	@Autowired
	private ISysCategoryService sysCategoryService;
	@Autowired
	private ISysDepartmentService sysDepartmentService; // 学院接口
	
	/*********************** 实体 ***************************/
	private ListTeacher teacher = new ListTeacher(); // 老师实体
	private ListTeacherGuideCount guideCount = new ListTeacherGuideCount();
	private PlanYear planYear = new PlanYear(); // 年度
	
	/******************** 集合变量声明 *********************/
	private Result<ListTeacherGuideCount> pageResult; // 老师可带学生个数分页
	private List<SysDepartment> departmentList = new ArrayList<SysDepartment>();
	private List<SysCategory> categoryList = new ArrayList<SysCategory>();
	private List<SysMajor> sysMajorList = new ArrayList<SysMajor>();
	
	/************************** 基础变量声明 **************/
	private String thisId;
	private String mark;
	private SysDepartment department;

	/************************** 方法类 **************************************************************************************/
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	/**
	 * 查询年度老师所带学生人数
	 * 
	 * @return
	 */
	public String list() {
		try {
			String loginName = (String) getSession().getAttribute(
					SystemContext.LOGINNAME);
			String userType = (String) getSession().getAttribute(
					SystemContext.USERTYPE);
			//查询 当前老师所属专业教研室
			if ("2".equals(userType)) {
				teacher = sysTeacherService.findByTeacherNo(loginName);
				if(guideCount.getDeptNumber()==null)
					guideCount.setDeptNumber(teacher.getDeptNumber());
				if(guideCount.getCategoryId()==null)
					guideCount.setCategoryId(teacher.getCategoryId());
				if(guideCount.getStaffroomId()==null)
					guideCount.setStaffroomId(teacher.getStaffroomId());
			}
			planYear = planYearSerivce.findPlanYear();
			if(guideCount.getYear() ==null){
				guideCount.setYear(planYear.getYear());
			}
			/******************** 三级查询 学院-大类-专业 *****************************/
			departmentList = sysDepartmentService.findAllSysDepartmentList();

			if (departmentList != null && departmentList.size() != 0) {
				if (guideCount.getDeptNumber() == null) {
					guideCount.setDeptNumber(departmentList.get(0).getDeptNumber());
				}
				
			categoryList = sysCategoryService.findByDeptNumber(guideCount.getDeptNumber());
				if (categoryList != null && categoryList.size() != 0) {
					if (guideCount.getCategoryId() == null) {
						guideCount.setCategoryId(categoryList.get(0).getCategoryId());
					}
				}
			sysMajorList = sysMajorService.findByCategoryId(guideCount.getCategoryId());
			}
			/******************** 三级查询 end ***********************************/

			pageResult = guideCountSerivce.findGuideCount(guideCount,  getPage(), getRow());
			footer = PageUtil.pageFooter(pageResult, getRequest());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 添加信息到数据库 如果数据库存在信息则修改
	 * @return
	 * @throws IOException
	 */
	public void add() {
		logger.info("到添加方法了" + thisId);
		boolean idTrue = false;
		try {
			PrintWriter out = getResponse().getWriter();
			if (thisId != null && model != null && model.getMaxStuNum() != null
					&& model.getYear() != null) {
				String[] ids = thisId.split(",");
				for (String id : ids) {
					Integer teachId = Integer.parseInt(id);
					model.setGuideTeachId(teachId);
					List<GuideCount> list = guideCountSerivce
							.findByExample(model);
					if (list != null && list.size() != 0) {
						GuideCount gCount = list.get(0);
						gCount.setMaxStuNum(model.getMaxStuNum());
						model = guideCountSerivce.add(gCount);
						idTrue = true;
					} else if (sysTeacherService.findById(teachId) != null) {
						GuideCount gCount = new GuideCount();
						gCount.setMaxStuNum(model.getMaxStuNum());
						gCount.setGuideTeachId(teachId);
						gCount.setAlreadyStuNum(0);
						gCount.setYear(model.getYear());
						model = guideCountSerivce.add(gCount);
						idTrue = true;
					}
				}
			}
			out.print(idTrue);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/********************************************** getter and setter方法 ************************************************************************/

	public Result<ListTeacherGuideCount> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<ListTeacherGuideCount> pageResult) {
		this.pageResult = pageResult;
	}

	public String getThisId() {
		return thisId;
	}

	public void setThisId(String thisId) {
		this.thisId = thisId;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}


	public ListTeacher getTeacher() {
		return teacher;
	}

	public void setTeacher(ListTeacher teacher) {
		this.teacher = teacher;
	}

	public ListTeacherGuideCount getGuideCount() {
		return guideCount;
	}

	public void setGuideCount(ListTeacherGuideCount guideCount) {
		this.guideCount = guideCount;
	}

	public SysDepartment getDepartment() {
		return department;
	}

	public void setDepartment(SysDepartment department) {
		this.department = department;
	}


	public List<SysMajor> getSysMajorList() {
		return sysMajorList;
	}

	public void setSysMajorList(List<SysMajor> sysMajorList) {
		this.sysMajorList = sysMajorList;
	}

	public PlanYear getPlanYear() {
		return planYear;
	}

	public void setPlanYear(PlanYear planYear) {
		this.planYear = planYear;
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
