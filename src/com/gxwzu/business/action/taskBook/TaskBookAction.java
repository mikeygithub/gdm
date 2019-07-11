package com.gxwzu.business.action.taskBook;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.issueInfo.IssueInfo;
import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.taskBook.TaskBook;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.issueInfo.IIssueInfoSerivce;
import com.gxwzu.business.service.materialInfo.IMaterialInfoSerivce;
import com.gxwzu.business.service.plan.IPlanProgressSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.business.service.taskBook.ITaskBookSerivce;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.util.WordUtils;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListAllotGuide;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.sysVO.MaterialInfo;
import com.gxwzu.system.model.sysClass.SysClass;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.service.sysClass.ISysClassService;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 任务书
 * 
 * @author 何志明
 * @date 2017.7.21
 */
public class TaskBookAction extends BaseAction implements ModelDriven<TaskBook> {

	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());

	/*********************** 实例化ModelDriven ******************************/
	private TaskBook model = new TaskBook();

	@Override
	public TaskBook getModel() {
		return model;
	}

	public void setModel(TaskBook model) {
		this.model = model;
	}

	/*********************** Service接口注入 ***************************/
	@Autowired
	private ISysDepartmentService sysDepartmentService; // 学院接口
	@Autowired
	private ISysMajorService sysMajorService; // 专业接口
	@Autowired
	private ISysClassService sysClassService; // 班级接口
	@Autowired
	private ITaskBookSerivce taskBookSerivce; // 任务书接口
	@Autowired
	private ISysTeacherService sysTeacherService; // 老师接口
	@Autowired
	private ISysStudentService sysStudentService; // 学生接口
	@Autowired
	private IAllotGuideService allotGuideService; // 指导分配接口
	@Autowired
	private IPlanYearSerivce planYearSerivce; // 年度计划接口
	@Autowired
	private IIssueInfoSerivce issueInfoSerivce; // 课题接口
	@Autowired
	private IMaterialInfoSerivce materialInfoSerivce; // 学生相关材料接口
	@Autowired
	private IPlanProgressSerivce planProgressSerivce; // 进度计划接口
	/*********************** 实体 ***************************/
	private PlanYear planYear; // 年度计划实体
	private SysTeacher teacher = new SysTeacher(); // 老师实体
	private ListStudent student = new ListStudent(); // 学生实体
	private SysStudent sysStudent = new SysStudent(); // 学生实体
	private SysDepartment department = new SysDepartment(); // 学院实体
	private IssueInfo issueInfo = new IssueInfo(); // 课题列表实体
	private SysMajor major = new SysMajor(); // 专业实体
	private SysClass sysClass = new SysClass(); // 班级实体
	private MaterialInfo materialInfo = new MaterialInfo();
	private PlanProgress planProgress = new PlanProgress();//进度计划实体
	private ListTeacher lTeacher = new ListTeacher(); // 老师实体
	/******************** 集合变量声明 *********************/
	private Result<TaskBook> pageResult; // 任务书分页
	private List<SysDepartment> sysDepartmentList = new ArrayList<SysDepartment>(); // 院系信息列表（用于查询全部）
	private List<SysMajor> sysMajorList = new ArrayList<SysMajor>();; // 专业信息列表（用于查询全部）
	private List<SysClass> sysClassList = new ArrayList<SysClass>(); // 班级信息列表（用于查询全部）
	private List<ListTeacher> sysTeacherList = new ArrayList<ListTeacher>(); // 班级信息列表（用于查询全部）
	/************************** 基础变量声明 **************/
	private Integer thisId;
	private String mark;
	private Integer thisYear; // 年度
	private Integer thisStuId; // 学生Id

	private String templetePath;
	private String fileName;
	private String filePath;
	private String flag;
	/************************** 方法类 **************************************************************************************/
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	/**
	 * 个人分页查询任务书信息
	 * 
	 * @return
	 */
	public String list() {
		try {
			/* 登录名称 :查询学院 */
			String loginName = (String) getSession().getAttribute(
					SystemContext.LOGINNAME);
			/* 用户类型：1-学生 2-老师 */
			String userType = (String) getSession().getAttribute(
					SystemContext.USERTYPE);

			pageResult = taskBookSerivce.find(model, getPage(), getRow());
			footer = PageUtil.pageFooter(pageResult, getRequest());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}

	/**
	 * 学生查询课题信息
	 * 
	 * @return
	 */
	public String info() {
		String loginName = (String) getSession().getAttribute(
				SystemContext.LOGINNAME);
		String type = (String) getSession()
				.getAttribute(SystemContext.USERTYPE);
		
		if (type.equals("1")) {
			ListStudent s = sysStudentService.findByStuNo(loginName);
			model.setStuId(s.getStuId());
		}

		/************************** 查询学生信息 *********************************************/
		if (model.getStuId() != null) {
			sysStudent.setStuId(model.getStuId());
			student = sysStudentService.findByExample(sysStudent).get(0);
			ListAllotGuide aGuide = allotGuideService.findByStuId(model
					.getStuId());
			teacher = sysTeacherService.findById(aGuide.getTeacherId());

		}
		return list();
	}

	/**
	 * 打开添加任务书页面
	 * 
	 * @return
	 */
	public String openAdd() {
		String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
		String type = (String) getSession().getAttribute(SystemContext.USERTYPE);
		/************************** 查询教研室信息 *********************************************/
		//查询 当前学生所属专业教研室  进度计划
		if(flag!=null&&"03".equals(flag)){
				if ("1".equals(type)) {
					student = sysStudentService.findByStuNo(loginName);		
			        planProgress=planProgressSerivce.findByStudMajoId(student.getMajorId(),flag);  
				}
				//查询 当前老师所属专业教研室 中的进度计划
				if ("2".equals(type)) {
					 lTeacher = sysTeacherService.findByTeacherNo(loginName);
					 planProgress=planProgressSerivce.findByTeacStaffroomId(lTeacher.getStaffroomId(),flag); 
				}
				Timestamp d = new Timestamp(System.currentTimeMillis()); 
				if(d.after(planProgress.getStartTime())){
					try {
						if (thisStuId != null && thisYear != null) {
						// 查询学生信息
						student = sysStudentService.findViewModelById(thisStuId);
						// 查询课题信息
						issueInfo = issueInfoSerivce.findByStuIdAndYear(thisStuId, thisYear);
						// 查询指导老师信息
						AllotGuide aGuide = allotGuideService.findByStuIdAndYear(thisStuId, thisYear);
						teacher = sysTeacherService.findById(aGuide.getTeacherId());
						materialInfo = materialInfoSerivce.findByStuIdAndYear(thisStuId,thisYear);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					return SUCCESS;
				}else{
				    return "view";
				}
	    }else{
	    	return SUCCESS;
	    }
	}

	/**
	 * 添加信息到数据库
	 * 
	 * @return
	 */
	public String add() {
		try {
			
			if (thisStuId != null && thisYear != null) {
				// 查询指导老师信息
				AllotGuide aGuide = allotGuideService.findByStuIdAndYear(thisStuId, thisYear);
				model.setYear(thisYear);
				model.setTeacherId(aGuide.getTeacherId());
				model.setStuId(thisStuId);
				model = taskBookSerivce.add(model);
				mark = "1";
			} else {
				mark = "0";
			}
		} catch (Exception e) {
			e.printStackTrace();
			mark = "0";
		}
		return info();
	}

	/**
	 * 打开修改任务书页面
	 * 
	 * @return
	 */
	public String openEdit() {
		String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
		String type = (String) getSession().getAttribute(SystemContext.USERTYPE);
		/************************** 查询教研室信息 *********************************************/
		//查询 当前学生所属专业教研室  进度计划
		if(flag!=null&&"03".equals(flag)){
				if ("1".equals(type)) {
					student = sysStudentService.findByStuNo(loginName);		
			        planProgress=planProgressSerivce.findByStudMajoId(student.getMajorId(),flag);  
				}
				//查询 当前老师所属专业教研室 中的进度计划
				if ("2".equals(type)) {
					 lTeacher = sysTeacherService.findByTeacherNo(loginName);
					 planProgress=planProgressSerivce.findByTeacStaffroomId(lTeacher.getStaffroomId(),flag); 
				}
				Timestamp d = new Timestamp(System.currentTimeMillis()); 
				if(d.after(planProgress.getStartTime())){
				try {
					if (thisStuId != null && thisYear != null) {
						if ( thisId != null){
							model = taskBookSerivce.findById(thisId);
						}else{
							model = taskBookSerivce.findByStuIdAndYear(thisStuId, thisYear);
							if(model==null){
								view =  "add";
							}
						}
						thisId = model.getTaskId();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
		        return openAdd();
			}else{
			    return "view";
			}
	    }else{
	    	return SUCCESS;
	    }
	}
	/**
	 * 打开任务书页面
	 * 
	 * @return
	 */
	public String openDetail() {
		try {
			if (thisStuId != null && thisYear != null) {
				
				if ( thisId != null){
					model = taskBookSerivce.findById(thisId);
				}else{
					model = taskBookSerivce.findByStuIdAndYear(thisStuId, thisYear);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return openAdd();
	}

	/**
	 * 修改任务书信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String edit() {
		try {
		System.out.println("执行修改方法");
			if (thisId != null) {
				TaskBook taskBook = taskBookSerivce.findById(thisId);

				if (StringUtils.isNotEmpty(model.getTaskContent())) {
					taskBook.setTaskContent(model.getTaskContent());
				}
				if (StringUtils.isNotEmpty(model.getTaskPlanJob())) {
					taskBook.setTaskPlanJob(model.getTaskPlanJob());
				}
				if (StringUtils.isNotEmpty(model.getTaskDocument())) {
					taskBook.setTaskDocument(model.getTaskDocument());
				}
				 taskBookSerivce.update(taskBook);

				mark = "1";
			} else {
				mark = "0";
			}
		} catch (Exception e) {
			e.printStackTrace();
			mark = "0";
		}
		return openEdit();
	}

	/**
	 * 导出任务书
	 * 
	 * @return
	 */
	public String outTaskBook() {
		try {
			if (thisId != null) {
				model = taskBookSerivce.findById(thisId);
				student = sysStudentService.findViewModelById(model.getStuId());
				//查询课题信息
				issueInfo = issueInfoSerivce.findByStuIdAndYear(model.getStuId(), model.getYear());
				AllotGuide aGuide = allotGuideService.findByStuIdAndYear(thisStuId, thisYear);
				teacher = sysTeacherService.findById(aGuide.getTeacherId());

				logger.info("导出信息："+student.toString());
				logger.info("导出信息："+model.toString());
				logger.info("导出信息："+teacher.toString());

				// ##################根据Word模板导出单个Word文档###################################################
				Map<String, String> map = new HashMap<String, String>();

				if (issueInfo != null) {
					map.put("issueName", issueInfo.getIssueName());
				} else {
					map.put("issueName", "");
				}
				map.put("deptName", student.getDeptName());
				map.put("majorName", student.getMajorName());
				map.put("className", student.getClassName());
				map.put("stuNo", student.getStuNo());
				map.put("stunName", student.getStuName());
				map.put("content", model.getTaskContent());
				map.put("planJob", model.getTaskPlanJob());
				map.put("document", model.getTaskDocument());
				map.put("teacherName",teacher.getTeacherName());

				logger.info(map.toString());

				WordUtils.exportWord(map, getTempletePath(), getFilePath());

				StringBuffer sBuffer = new StringBuffer(student.getClassName());
				sBuffer.append("-").append(student.getStuId()).append("-")
						.append(student.getStuName()).append("-")
						.append("毕业论文（设计）任务书.doc");
				fileName = sBuffer.toString();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "out";
	}

	/**
	 * 删除任务信息
	 * 
	 * @return
	 */
	public void del() {
		logger.info("删除任务信息");
		boolean isdel = false;
		try {
			PrintWriter out = getResponse().getWriter();
			if (thisId != null) {
				taskBookSerivce.del(thisId);
				isdel = true;
			}
			out.print(isdel);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/********************************************** getter and setter方法 ************************************************************************/

	public PlanYear getPlanYear() {
		return planYear;
	}

	public void setPlanYear(PlanYear planYear) {
		this.planYear = planYear;
	}

	public Result<TaskBook> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<TaskBook> pageResult) {
		this.pageResult = pageResult;
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

	public SysStudent getSysStudent() {
		return sysStudent;
	}

	public void setSysStudent(SysStudent sysStudent) {
		this.sysStudent = sysStudent;
	}

	public ListStudent getStudent() {
		return student;
	}

	public void setStudent(ListStudent student) {
		this.student = student;
	}

	public List<SysDepartment> getSysDepartmentList() {
		return sysDepartmentList;
	}

	public void setSysDepartmentList(List<SysDepartment> sysDepartmentList) {
		this.sysDepartmentList = sysDepartmentList;
	}

	public List<SysMajor> getSysMajorList() {
		return sysMajorList;
	}

	public void setSysMajorList(List<SysMajor> sysMajorList) {
		this.sysMajorList = sysMajorList;
	}

	public List<SysClass> getSysClassList() {
		return sysClassList;
	}

	public void setSysClassList(List<SysClass> sysClassList) {
		this.sysClassList = sysClassList;
	}

	public SysDepartment getDepartment() {
		return department;
	}

	public void setDepartment(SysDepartment department) {
		this.department = department;
	}

	public SysMajor getMajor() {
		return major;
	}

	public void setMajor(SysMajor major) {
		this.major = major;
	}

	public SysClass getSysClass() {
		return sysClass;
	}

	public void setSysClass(SysClass sysClass) {
		this.sysClass = sysClass;
	}

	public String getTempletePath() {
		return ServletActionContext.getServletContext().getRealPath(
				templetePath);
	}

	public void setTempletePath(String templetePath) {
		this.templetePath = templetePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return ServletActionContext.getServletContext().getRealPath(filePath);
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public SysTeacher getTeacher() {
		return teacher;
	}

	public void setTeacher(SysTeacher teacher) {
		this.teacher = teacher;
	}

	public List<ListTeacher> getSysTeacherList() {
		return sysTeacherList;
	}

	public void setSysTeacherList(List<ListTeacher> sysTeacherList) {
		this.sysTeacherList = sysTeacherList;
	}

	public IssueInfo getIssueInfo() {
		return issueInfo;
	}

	public void setIssueInfo(IssueInfo issueInfo) {
		this.issueInfo = issueInfo;
	}

	public Integer getThisYear() {
		return thisYear;
	}

	public void setThisYear(Integer thisYear) {
		this.thisYear = thisYear;
	}

	public Integer getThisStuId() {
		return thisStuId;
	}

	public void setThisStuId(Integer thisStuId) {
		this.thisStuId = thisStuId;
	}

	public MaterialInfo getMaterialInfo() {
		return materialInfo;
	}

	public void setMaterialInfo(MaterialInfo materialInfo) {
		this.materialInfo = materialInfo;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

}
