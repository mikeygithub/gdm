package com.gxwzu.business.action.plan;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.progressItem.ProgressItem;
import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.business.service.plan.IPlanProgressSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.business.service.progressItem.IProgressItemService;
import com.gxwzu.business.service.teacherMajor.ITeacherMajorService;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.MyTime;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListPlanProgress;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.sysVO.ListTeacherGuideCount;
import com.gxwzu.system.model.sysCategory.SysCategory;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.model.sysTechnical.SysTechnical;
import com.gxwzu.system.service.sysCategory.ISysCategoryService;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 计划进度
 * @author 黎艺侠
 * @date 2017.9.11
 */
public class PlanProgressAction extends BaseAction implements
		ModelDriven<PlanProgress> {

	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());

	/*********************** 实例化ModelDriven ******************************/
	private PlanProgress model = new PlanProgress();

	@Override
	public PlanProgress getModel() {
		return model;
	}

	public void setModel(PlanProgress model) {
		this.model = model;
	}

	/*********************** Service接口注入 ***************************/
	@Autowired
	private IPlanProgressSerivce planProgressSerivce; // 进度计划接口
	@Autowired
	private IPlanYearSerivce planYearSerivce; // 年度计划接口
	@Autowired
	private ISysTeacherService sysTeacherService;
	@Autowired
	private ISysStudentService studentService;
	@Autowired
	private ISysDepartmentService sysDepartmentService; // 学院接口
	@Autowired
	private IProgressItemService progressItemService; // 学院接口
	@Autowired
	private ISysCategoryService sysCategoryService;
	@Autowired
	private ISysMajorService sysMajorService;
	
	/*********************** 实体 ***************************/
	private ListPlanProgress planProgress = new ListPlanProgress(); // 进度计划实体
	private ListTeacher teacher = new ListTeacher(); // 老师实体
	private ListStudent student = new ListStudent(); // 学生实体
	private PlanYear planYear = new PlanYear(); // 计年度
	private ProgressItem progressItem = new ProgressItem(); // 

	/******************** 集合变量声明 *********************/
	private Result<ListPlanProgress> pageResult; // 进度计划分页
	private List<TeacherMajor> teacherMajorList = new ArrayList<TeacherMajor>();
	private List<ProgressItem> progressItemList = new ArrayList<ProgressItem>();
	private ListTeacherGuideCount guideCount = new ListTeacherGuideCount();
	private List<ListPlanProgress> planProgressList = new ArrayList<ListPlanProgress>(); //进度计划

	/************************** 基础变量声明 **************/
	private String thisId;
	private String mark;
	private SysDepartment department;
	private String progressItemName;
	private String thisType;

	private List<SysDepartment> departmentList = new ArrayList<SysDepartment>();
	private List<SysCategory> categoryList = new ArrayList<SysCategory>();
	private List<SysMajor> sysMajorList = new ArrayList<SysMajor>();

	/************************** 方法类 **************************************************************************************/
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	/**
	 * 查询年度老师所带学生
	 * 
	 * @return
	 */
	@SuppressWarnings("static-access")
	public String list() {
		try {

			String loginName = (String) getSession().getAttribute(
					SystemContext.LOGINNAME);
			String userType = (String) getSession().getAttribute(
					SystemContext.USERTYPE);
			//查询 当前老师所属专业教研室
			if ("2".equals(userType)) {
				teacher = sysTeacherService.findByTeacherNo(loginName);
				if(model.getDeptNumber()==null)
				model.setDeptNumber(teacher.getDeptNumber());
				if(model.getCategoryId()==null)
				model.setCategoryId(teacher.getCategoryId());
				if(model.getMajorId()==null ){
					
				     model.setMajorId(teacher.getStaffroomId());
				}
				if(-1 == model.getCategoryId())
					model.setMajorId(-1);
			}
			planYear = planYearSerivce.findPlanYear();
			if(model.getYear() ==null){
				model.setYear(planYear.getYear());
			}
			
			/******************** 三级查询 学院-大类-专业 ***********************************/
			departmentList = sysDepartmentService.findAllSysDepartmentList();

			if (departmentList != null && departmentList.size() != 0) {
				if (model.getDeptNumber() == null) {
					model.setDeptNumber(departmentList.get(0).getDeptNumber());
				}
			categoryList = sysCategoryService.findByDeptNumber(model.getDeptNumber());

				if (categoryList != null && categoryList.size() != 0) {
					if (model.getCategoryId() == null) {
						model.setCategoryId(categoryList.get(0).getCategoryId());
					}
				}
			sysMajorList = sysMajorService.findByCategoryId(model.getCategoryId());
			}
			/******************** 三级查询 end ***********************************/

			progressItemList = progressItemService.findProgressItemList();

			pageResult = planProgressSerivce.find(model, getPage(), getRow());
			/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//初始化
			for (int i = 0; i < pageResult.getData().size(); i++) {
				MyTime myTime = new MyTime();
				Date sTime = myTime.strToDate(pageResult.getData().get(i).getStartTime());
				Date eTime = myTime.strToDate(pageResult.getData().get(i).getEndTime());
				String startTime = myTime.dateToStr(sTime);
				String endTime = myTime.dateToStr(eTime);
				pageResult.getData().get(i).setStartTime(startTime);
				pageResult.getData().get(i).setEndTime(endTime);
			}*/
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
		boolean idTrue = false;
		try {
			PrintWriter out = getResponse().getWriter();
			String[] info = thisId.split("_");
			if (thisId != null && model != null&&info!=null&&info.length==9) {
				// info[0]-过程名称No, info[1]-年度, info[2]-开始时间, info[3]-结束时间
				// info[4]-planProgressID, info[5]-状态
				// info[6]-deptNumber, info[7]-categoryId, info[8]-majorId
				model.setProgressItemNo(info[0]);
				model.setYear(Integer.parseInt(info[1]));
				model.setStartTime(Timestamp.valueOf(info[2]));
				model.setEndTime(Timestamp.valueOf(info[3]));
				model.setProgressId(Integer.parseInt(info[4]));
				model.setProgressStart(Integer.parseInt(info[5]));
				model.setDeptNumber(info[6]);
				model.setCategoryId(Integer.parseInt(info[7]));
				model.setMajorId(Integer.parseInt(info[8]));
				
				idTrue = planProgressSerivce.addOrEdit(model);
			}
			out.print(idTrue);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 时间安排计划
	 * 
	 * @return
	 */
	public void loadPlanProgressList() {
		logger.info(" 时间安排计划");
		try {
			PrintWriter out = getResponse().getWriter();
			String loginName = (String) getSession().getAttribute(
					SystemContext.LOGINNAME);
			String userType = (String) getSession().getAttribute(
					SystemContext.USERTYPE);
			//查询 当前老师所属专业教研室 中的进度计划
			if ("2".equals(userType)) {
				teacher = sysTeacherService.findByTeacherNo(loginName);
				if(model.getDeptNumber()==null)
				model.setDeptNumber(teacher.getDeptNumber());
				if(model.getCategoryId()==null)
				model.setCategoryId(teacher.getCategoryId());
				if(model.getMajorId()==null)
				model.setMajorId(teacher.getStaffroomId());
			}
			
			//查询 当前学生所属专业教研室  进度计划
			if ("1".equals(userType)) {
				student = studentService.findByStuNo(loginName);
				if(model.getDeptNumber()==null)
				model.setDeptNumber(student.getDeptNumber());
				if(model.getCategoryId()==null)
				model.setCategoryId(student.getCategoryId());
				if(model.getMajorId()==null)
				model.setMajorId(student.getMajorId());
			}
			
			// 时间安排计划列表
			planProgressList = planProgressSerivce.findByExample(model);
			out.print(new Gson().toJson(planProgressList));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/********************************************** getter and setter方法 ************************************************************************/

	public ListTeacherGuideCount getGuideCount() {
		return guideCount;
	}

	public ListTeacher getTeacher() {
		return teacher;
	}

	public void setTeacher(ListTeacher teacher) {
		this.teacher = teacher;
	}

	public void setGuideCount(ListTeacherGuideCount guideCount) {
		this.guideCount = guideCount;
	}

	public Result<ListPlanProgress> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<ListPlanProgress> pageResult) {
		this.pageResult = pageResult;
	}

	public List<TeacherMajor> getTeacherMajorList() {
		return teacherMajorList;
	}

	public void setTeacherMajorList(List<TeacherMajor> teacherMajorList) {
		this.teacherMajorList = teacherMajorList;
	}

	public List<SysMajor> getSysMajorList() {
		return sysMajorList;
	}

	public void setSysMajorList(List<SysMajor> sysMajorList) {
		this.sysMajorList = sysMajorList;
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

	public SysDepartment getDepartment() {
		return department;
	}

	public void setDepartment(SysDepartment department) {
		this.department = department;
	}

	public ListPlanProgress getPlanProgress() {
		return planProgress;
	}

	public void setPlanProgress(ListPlanProgress planProgress) {
		this.planProgress = planProgress;
	}

	public List<ProgressItem> getProgressItemList() {
		return progressItemList;
	}

	public void setProgressItemList(List<ProgressItem> progressItemList) {
		this.progressItemList = progressItemList;
	}

	public PlanYear getPlanYear() {
		return planYear;
	}

	public void setPlanYear(PlanYear planYear) {
		this.planYear = planYear;
	}

	public String getProgressItemName() {
		return progressItemName;
	}

	public void setProgressItemName(String progressItemName) {
		this.progressItemName = progressItemName;
	}

	public ProgressItem getProgressItem() {
		return progressItem;
	}

	public void setProgressItem(ProgressItem progressItem) {
		this.progressItem = progressItem;
	}

	public String getThisType() {
		return thisType;
	}

	public void setThisType(String thisType) {
		this.thisType = thisType;
	}

	public List<ListPlanProgress> getPlanProgressList() {
		return planProgressList;
	}

	public void setPlanProgressList(List<ListPlanProgress> planProgressList) {
		this.planProgressList = planProgressList;
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

	public ListStudent getStudent() {
		return student;
	}

	public void setStudent(ListStudent student) {
		this.student = student;
	}

}
