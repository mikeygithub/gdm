package com.gxwzu.business.action.group;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.group.GroupAllot;
import com.gxwzu.business.model.group.GroupStudent;
import com.gxwzu.business.model.group.GroupTeacher;
import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.replyScore.ReplyScore;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.group.IGroupAllotService;
import com.gxwzu.business.service.group.IGroupStudentService;
import com.gxwzu.business.service.group.IGroupTeacherService;
import com.gxwzu.business.service.plan.IPlanProgressSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.business.service.replyScore.IReplyScoreSerivce;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.DateUtils;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListClass;
import com.gxwzu.sysVO.ListGroupAllot;
import com.gxwzu.sysVO.ListGroupStudent;
import com.gxwzu.sysVO.ListGroupTeacher;
import com.gxwzu.sysVO.ListReplyScore;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.system.model.sysCategory.SysCategory;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysIssueType.SysIssueType;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.service.sysCategory.ISysCategoryService;
import com.gxwzu.system.service.sysClass.ISysClassService;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysIssueType.ISysIssueTypeService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 学生 分组
 * 
 */
public class GroupStudentAction extends BaseAction implements
		ModelDriven<GroupStudent> {

	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());

	/*********************** 实例化ModelDriven ******************************/
	private GroupStudent model = new GroupStudent();
	private ListGroupAllot groupAllot = new ListGroupAllot();
	private ListStudent sysStudent = new ListStudent();
	private PlanYear planYear = new PlanYear(); // 年度计划实体
	private AllotGuide allotGuide = new AllotGuide();
	private ListTeacher teacher = new ListTeacher();
	private GroupStudent groupStudent = new GroupStudent();

	@Override
	public GroupStudent getModel() {
		return model;
	}

	public void setModel(GroupStudent model) {
		this.model = model;
	}

	/*********************** 注入Service ******************************/
	@Autowired
	private IPlanYearSerivce planYearSerivce; // 年度计划接口
	@Autowired
	private IAllotGuideService allotGuideService; // 指导老师分配接口
	@Autowired
	private ISysDepartmentService sysDepartmentService;// 学院接口注入
	@Autowired
	private IGroupStudentService groupStudentService; // 学生分组接口注入
	@Autowired
	private ISysCategoryService sysCategoryService; // 大类接口注入
	@Autowired
	private IGroupAllotService groupAllotService; // 组分配接口注入
	@Autowired
	private IGroupTeacherService groupTeacherService; // 组分配接口注入
	@Autowired
	private ISysIssueTypeService sysIssueTypeService; // 课题类型接口
	@Autowired
	private ISysStudentService sysStudentService; // 学生接口注入
	@Autowired
	private ISysClassService sysClassService; // 班级接口
	@Autowired
	private ISysMajorService sysMajorService; // 专业接口
	@Autowired
	private ISysTeacherService sysTeacherService; // 教师接口
	@Autowired
	private IPlanProgressSerivce planProgressSerivce; // 进度计划接口
	@Autowired
	private IReplyScoreSerivce replyScoreSerivce; // 答辩成绩及评语接口
	/*********************** 声明列表参数 ******************************/
	private Result<ListGroupStudent> pageResult; // 学生结果集
	private Result<ListGroupStudent> ExpageResult; // 学生结果集
	private List<SysCategory> sysCategoryList = new ArrayList<SysCategory>();
	private List<SysDepartment> sysDepartmentList = new ArrayList<SysDepartment>();
	private Map<Integer, SysStudent> sysStudentList = new HashMap<Integer, SysStudent>(); // 临时存储已选教师列表
	private List<ListGroupAllot> groupAllotList = new ArrayList<ListGroupAllot>(); // 分组列表
	private List<ListGroupStudent> groupStudentList = new ArrayList<ListGroupStudent>(); // 学生已分组列表
	private List<String> failList = new ArrayList<String>(); // 学生分组失敗列表
	private ListGroupStudent listGroupStudent = new ListGroupStudent();
	private List<ListClass> sysClassList = new ArrayList<ListClass>(); // 班级信息列表（用于查询全部）
	private List<SysMajor> sysMajorList = new ArrayList<SysMajor>(); // 专业信息列表（用于查询全部）
	private List<SysIssueType> issueTypeList = new ArrayList<SysIssueType>();
	private ListStudent student = new ListStudent(); // 学生实体
	private PlanProgress planProgress = new PlanProgress();//进度计划实体
	private ListTeacher lTeacher = new ListTeacher(); // 老师实体
	private ReplyScore replyScore = new ReplyScore();
	/*********************** 声明参数 ******************************/
	private Integer id;
	private Integer thisId;
	private Integer thisGroupId; // 分组Id
	private String mark;
	private String stuIds;
	private Integer year;
	private Integer teacherId;
	private Integer majorId;//
	private String flag;
	private String sudentReplyType;
	/************************** 方法类 **************************/
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	/**
	 * 学生分组显示列表
	 * 
	 * @return
	 */
	public String list(){
		logger.info("请求分组列表："+model);
		String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
		String userType = (String) getSession().getAttribute(SystemContext.USERTYPE);
		/************************** 查询教研室信息 *********************************************/
		//查询 当前学生所属专业教研室  进度计划
		if(flag!=null&&"08".equals(flag)){
				if ("1".equals(userType)) {
					student = sysStudentService.findByStuNo(loginName);		
			        planProgress=planProgressSerivce.findByStudMajoId(student.getMajorId(),flag);  
				}
				//查询 当前老师所属专业教研室 中的进度计划
				if ("2".equals(userType)) {
					 lTeacher = sysTeacherService.findByTeacherNo(loginName);
					 planProgress=planProgressSerivce.findByTeacStaffroomId(lTeacher.getStaffroomId(),flag); 
				}
				Timestamp d = new Timestamp(System.currentTimeMillis()); 
				if(planProgress!=null&&planProgress.getStartTime()!=null&&d.after(planProgress.getStartTime())) {
					logger.info("给学生分组列表");
					try {
						//查询安排计划年度
						planYear = planYearSerivce.findPlanYear();
						/*登录名称	 :查询学院*/
						//String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
						/*用户类型：1-学生 2-老师*/


						/************************************三级查询，通学院编号查询大类 下拉选择信息 start******************************************/
						sysDepartmentList = sysDepartmentService.findAllSysDepartmentList();
						if (userType.equals("2")) {
							teacher = sysTeacherService.findByTeacherNo(loginName);

							if (StringUtils.isEmpty(listGroupStudent.getDeptNumber())) {
								listGroupStudent.setDeptNumber(teacher.getDeptNumber());
							}
						}
						sysMajorList = sysMajorService.findByDeptNumber(listGroupStudent.getDeptNumber());
						sysClassList = sysClassService.findByMajorId(listGroupStudent.getMajorId());

						/***************************三级查询 通学院编号查询大类 下拉选择信息 end*******************************************/


						if (listGroupStudent.getYear() == null) {
							listGroupStudent.setYear(planYear.getYear()); //默认安排年度
						}
						if (listGroupStudent.getGroupType() == null) {
							listGroupStudent.setGroupType("00"); //默认为答辩组
						}

						/************************************分组信息******************************************/
						groupAllotList = groupAllotService.findByGroupTypeAndYear(listGroupStudent.getGroupType(), listGroupStudent.getYear());
						//分组详细信息
						if (model.getGroupAllotId() != null) {
							groupAllot = groupAllotService.findViewModelById(model.getGroupAllotId());
						}
						//课题类型
						issueTypeList = sysIssueTypeService.findAll(SysIssueType.class);

						/************************************可分組學生信息******************************************/
						pageResult = groupStudentService.find(listGroupStudent, groupAllot, getPage(), getRow());

						//System.out.println(pageResult.getData().get(0).get);
						footer = PageUtil.pageFooter(pageResult, getRequest());
						/************************************已分組學生信息******************************************/
						if (listGroupStudent.getGroupAllotId() != null) {
							groupStudentList = groupStudentService.findByExample(listGroupStudent);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					return SUCCESS;
				}
	    }
	    	return SUCCESS;
	}

	/**
	 * 添加学生信息数组
	 * 
	 * @return
	 */
	public void addStudentGroup() {
		logger.info("添加学生分组");
		boolean isSave = false;
		SysStudent student = null;
		try {
			PrintWriter out = getResponse().getWriter();

			if (thisGroupId != null && stuIds != null) {
				planYear = planYearSerivce.findPlanYear();
				String[] ids = stuIds.split(",");
				for (String id : ids) {
					Integer studentId = Integer.parseInt(id);
					// 通过学生id 年度 查询分配表中的 指导老师
					allotGuide = allotGuideService.findByStuIdAndYear(
							studentId, planYear.getYear());
					// 学生信息
					student = sysStudentService.findById(studentId);
					// 先通过组id查询分组信息
					GroupAllot groupAllot = groupAllotService.findById(thisGroupId);
                    List<ListGroupTeacher> gt = groupTeacherService.findByGroupIdAndTypeAndYear(thisGroupId, "0", planProgress.getYear());
					// 若如果学生分配有指导老师 则查询 指导老师是否在当前分组中
					if (allotGuide!=null&&allotGuide.getTeacherId() != null) {
						ListGroupTeacher groupTeacher = groupTeacherService
								.findByGroupAllotIdAndTeacherIdAndYear(
										thisGroupId, allotGuide.getTeacherId(),
										planYear.getYear());

						// 如果 指导老师是否在当前分组中 则添加失败 在页面显示添加失败的学生信息
						if (groupTeacher != null) {
							failList.add(student.getStuName() + ":该学生指导老师存在该组！");
							continue;
						} else {
							isSave = true;
						}
						// 是否保存分组学生信息
						if (isSave) {
							GroupStudent groupStudent = new GroupStudent();
							if (gt.size()>0)groupStudent.setDefenseTeacherId(gt.get(0).getTeacherId());//先自动分配给组长评阅
							groupStudent.setGroupAllotId(thisGroupId);
							groupStudent.setStudentId(studentId);
							groupStudent.setStudentNo(student.getStuNo());
							groupStudent.setYear(planYear.getYear());
							groupStudent.setOpTime(Timestamp.valueOf(DateUtils
									.formatTime(new Date())));
							groupStudent = groupStudentService
									.add(groupStudent);
							isSave = false;
							
							if("01".equals(groupAllot.getFirstDefense())){
								groupAllot.setFirstDefense("00");
								groupAllotService.update(groupAllot);
							}
						}
					}
				}
			} else {
				failList.add("");
			}
			out.print(new Gson().toJson(failList));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 删除分组学生数组信息
	 * 
	 * @return
	 * @return
	 * @throws IOException
	 */
	public void delStudent() {
		logger.info("到删除方法了");
		boolean idTrue = false;
		try {
			PrintWriter out = getResponse().getWriter();
			if (stuIds != null) {
				String[] ids = stuIds.split(",");
				for (String id : ids) {
					Integer gdsId = Integer.parseInt(id);
					groupStudentService.del(gdsId);
				}
				idTrue = true;
			}
			out.print(idTrue);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 修改分组学生数组信息
	 * 
	 * @return
	 * @return
	 * @throws IOException
	 */
	public void editStudent() {
		logger.info("修改分组学生数组信息");
		boolean idTrue = false;
		try {
			PrintWriter out = getResponse().getWriter();
			if (thisId != null&&model!=null) {
			GroupStudent gStudent = groupStudentService.get(GroupStudent.class, thisId);
				if(model.getDefenseTeacherId()!=null){
					gStudent.setDefenseTeacherId(model.getDefenseTeacherId());
				}
				groupStudentService.update(gStudent);
				idTrue = true;
			}
			out.print(idTrue);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 查看学生分组列表
	 * 
	 * @author 黎艺侠
	 */
	public String detailList() {
		try {
			if (thisId != null) {
				listGroupStudent.setGroupAllotId(thisId);
				pageResult = groupStudentService.findStuGroupList(
						listGroupStudent, getPage(), getRow());
				footer = PageUtil.pageFooter(pageResult, getRequest());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/***************************** get/set方法 *******************************/

	public ListStudent getSysStudent() {
		return sysStudent;
	}

	public void setSysStudent(ListStudent sysStudent) {
		this.sysStudent = sysStudent;
	}

	public PlanYear getPlanYear() {
		return planYear;
	}

	public void setPlanYear(PlanYear planYear) {
		this.planYear = planYear;
	}

	public AllotGuide getAllotGuide() {
		return allotGuide;
	}

	public void setAllotGuide(AllotGuide allotGuide) {
		this.allotGuide = allotGuide;
	}

	public Result<ListGroupStudent> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<ListGroupStudent> pageResult) {
		this.pageResult = pageResult;
	}

	public List<SysCategory> getSysCategoryList() {
		return sysCategoryList;
	}

	public void setSysCategoryList(List<SysCategory> sysCategoryList) {
		this.sysCategoryList = sysCategoryList;
	}

	public List<SysDepartment> getSysDepartmentList() {
		return sysDepartmentList;
	}

	public void setSysDepartmentList(List<SysDepartment> sysDepartmentList) {
		this.sysDepartmentList = sysDepartmentList;
	}

	public Map<Integer, SysStudent> getSysStudentList() {
		return sysStudentList;
	}

	public void setSysStudentList(Map<Integer, SysStudent> sysStudentList) {
		this.sysStudentList = sysStudentList;
	}

	public List<ListGroupAllot> getGroupAllotList() {
		return groupAllotList;
	}

	public void setGroupAllotList(List<ListGroupAllot> groupAllotList) {
		this.groupAllotList = groupAllotList;
	}

	public ListGroupStudent getListGroupStudent() {
		return listGroupStudent;
	}

	public void setListGroupStudent(ListGroupStudent listGroupStudent) {
		this.listGroupStudent = listGroupStudent;
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

	public String getStuIds() {
		return stuIds;
	}

	public void setStuIds(String stuIds) {
		this.stuIds = stuIds;
	}

	public List<ListGroupStudent> getGroupStudentList() {
		return groupStudentList;
	}

	public void setGroupStudentList(List<ListGroupStudent> groupStudentList) {
		this.groupStudentList = groupStudentList;
	}

	public List<String> getFailList() {
		return failList;
	}

	public void setFailList(List<String> failList) {
		this.failList = failList;
	}

	public ListGroupAllot getGroupAllot() {
		return groupAllot;
	}

	public void setGroupAllot(ListGroupAllot groupAllot) {
		this.groupAllot = groupAllot;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public Integer getMajorId() {
		return majorId;
	}

	public void setMajorId(Integer majorId) {
		this.majorId = majorId;
	}

	public ListTeacher getTeacher() {
		return teacher;
	}

	public void setTeacher(ListTeacher teacher) {
		this.teacher = teacher;
	}

	public List<SysMajor> getSysMajorList() {
		return sysMajorList;
	}

	public void setSysMajorList(List<SysMajor> sysMajorList) {
		this.sysMajorList = sysMajorList;
	}

	public List<ListClass> getSysClassList() {
		return sysClassList;
	}

	public void setSysClassList(List<ListClass> sysClassList) {
		this.sysClassList = sysClassList;
	}

	public Integer getThisGroupId() {
		return thisGroupId;
	}

	public void setThisGroupId(Integer thisGroupId) {
		this.thisGroupId = thisGroupId;
	}

	public List<SysIssueType> getIssueTypeList() {
		return issueTypeList;
	}

	public void setIssueTypeList(List<SysIssueType> issueTypeList) {
		this.issueTypeList = issueTypeList;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getSudentReplyType() {
		return sudentReplyType;
	}

	public void setSudentReplyType(String sudentReplyType) {
		this.sudentReplyType = sudentReplyType;
	}

	public Result<ListGroupStudent> getExpageResult() {
		return ExpageResult;
	}

	public void setExpageResult(Result<ListGroupStudent> expageResult) {
		ExpageResult = expageResult;
	}

}
