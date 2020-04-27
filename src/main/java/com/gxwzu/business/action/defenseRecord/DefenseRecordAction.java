package com.gxwzu.business.action.defenseRecord;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gxwzu.business.model.group.GroupAllot;
import com.gxwzu.business.service.group.IGroupAllotService;
import com.gxwzu.business.service.group.IGroupTeacherService;
import com.gxwzu.sysVO.*;
import com.gxwzu.system.model.sysIssueType.SysIssueType;
import com.gxwzu.system.service.sysIssueType.ISysIssueTypeService;
import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.defenseRecord.DefenseRecord;
import com.gxwzu.business.model.issueInfo.IssueInfo;
import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.defenseRecord.IDefenseRecordService;
import com.gxwzu.business.service.issueInfo.IIssueInfoSerivce;
import com.gxwzu.business.service.materialInfo.IMaterialInfoSerivce;
import com.gxwzu.business.service.plan.IPlanProgressSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.util.WordUtils;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.system.model.sysClass.SysClass;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.model.sysTechnical.SysTechnical;
import com.gxwzu.system.service.sysClass.ISysClassService;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.gxwzu.system.service.sysTechnical.ISysTechnicalService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 答辩记录
 * 
 * @author 何金燕
 *@date 2017.08.17
 */
public class DefenseRecordAction extends BaseAction implements ModelDriven<DefenseRecord>{
  
	/**
	 * 
	 */
	private static final long serialVersionUID = -1841839186173594001L;
	protected final Log logger = LogFactory.getLog(getClass());
	/************************************实例化ModelDriven******************************************************/
	private DefenseRecord model = new DefenseRecord();

	private ListTeacher teacherVO = new ListTeacher(); // 老师实体

	@Override
	public DefenseRecord getModel() {
		return model;
	}
	public void setModel(DefenseRecord model) {
		this.model = model;
	}
	/*********************** Service接口注入 ***************************/
	@Autowired
	private IDefenseRecordService defenseRecordService;//答辩记录接口
	@Autowired
	private ISysDepartmentService sysDepartmentService; // 学院接口
	@Autowired
	private ISysMajorService sysMajorService; // 专业接口
	@Autowired
	private ISysClassService sysClassService; // 班级接口
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
	private ISysIssueTypeService sysIssueTypeService; // 课题类型接口
	@Autowired
	private ISysTechnicalService sysTechnicalService;
	@Autowired
	private IGroupTeacherService groupTeacherService; // 老师分组接口
	@Autowired
	private IMaterialInfoSerivce materialInfoSerivce; // 学生相关材料接口
	@Autowired
	private IPlanProgressSerivce planProgressSerivce; // 进度计划接口
	@Autowired
	private IGroupAllotService groupAllotService; // 分组接口
	/*********************** 实体 ***************************/
	private PlanYear planYear; // 年度计划实体
	AllotGuide aGuide = new AllotGuide();//指导老师
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
	private Result<DefenseRecordVO> pageResult = new Result<>(); // 答辩记录分页
	private Result<MaterialInfo> pageResult1 = new Result<>(); // 答辩记录分页
	private List<SysDepartment> sysDepartmentList = new ArrayList<SysDepartment>(); // 院系信息列表（用于查询全部）
	private List<SysMajor> sysMajorList = new ArrayList<SysMajor>();; // 专业信息列表（用于查询全部）
	private List<SysClass> sysClassList = new ArrayList<SysClass>(); // 班级信息列表（用于查询全部）
	private List<ListTeacher> sysTeacherList = new ArrayList<ListTeacher>(); // 老师信息列表（用于查询全部）
	private List<SysIssueType> issueTypeList = new ArrayList<SysIssueType>();
	private List<ListPlanProgress> planProgressList = new ArrayList<>();
	/************************** 基础变量声明 **************/
	private Integer thisId;
	private String mark;

	private String templetePath;
	private String fileName;
	private String filePath;

	private Integer thisYear;
	private Integer thisStuId; // 学生Id
	private String flag;

	private String thisReplyType; // 类型：答辩类型： 00答辩小组 01系答辩委员会
	/************************** 方法类 **************************************************************************************/
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
	/**
	 * 个人分页查询答辩记录信息
	 * 
	 * @return
	 */
	public String list() {

		String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
		String type = (String) getSession().getAttribute(SystemContext.USERTYPE);

		/************************** 查询教研室信息 *********************************************/

		//查询 当前学生所属专业教研室  进度计划
		if (flag != null && "11".equals(flag)) {
			if ("1".equals(type)) {
				student = sysStudentService.findByStuNo(loginName);
				planProgress=planProgressSerivce.findByStudMajoId(student.getMajorId(),flag);
				thisStuId = student.getStuId();
				if(planProgress!=null)thisYear=planProgress.getYear();
				}

			//查询 当前老师所属专业教研室 中的进度计划
			if ("2".equals(type)) {
				lTeacher = sysTeacherService.findByTeacherNo(loginName);
				planProgress = planProgressSerivce.findByTeacStaffroomId(lTeacher.getStaffroomId(), flag);
			}

			Timestamp d = new Timestamp(System.currentTimeMillis());
			if (planProgress!=null&&d.after(planProgress.getStartTime())) {
				try {
					if (thisStuId != null && thisYear != null) {

					model.setStuId(thisStuId);

//					model.setYear(thisYear);

						pageResult = defenseRecordService.find(model, getPage(), getRow());

						footer = PageUtil.pageFooter(pageResult, getRequest());
					}
				} catch (Exception e) {
					e.printStackTrace();
 				}
				return SUCCESS;
			} else {
				return SUCCESS;
			}
		} else {
			return SUCCESS;
		}
	}
	/**
	 * 当前教师所答辩学生过程记录列表
	 * @return
	 */
	public String groupAllStudentList(){

		try {
			/* 登录名称 :查询学院 */
			String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
			/* 用户类型：1-学生 2-老师 */
			String type = (String) getSession().getAttribute(SystemContext.USERTYPE);

			if (flag != null && "12".equals(flag)) {
				// 查询 当前老师所属专业教研室 中的进度计划
				if (SystemContext.USER_TEACHER_TYPE.equals(type)) {
					teacherVO = sysTeacherService.findByTeacherNo(loginName);
					planProgress = planProgressSerivce.findByTeacStaffroomId(teacherVO.getStaffroomId(), flag);
					logger.info("当前教师年度计划"+planProgress);
				}
				Timestamp d = new Timestamp(System.currentTimeMillis());
				if (planProgress!=null&&planProgress.getStartTime()!=null&&d.after(planProgress.getStartTime())) {
					logger.info("老师查询所在组已分配评阅的学生信息");
					// 老师查询学生课题信息
					if (SystemContext.USER_TEACHER_TYPE.equals(type)) {
						teacherVO = sysTeacherService.findByTeacherNo(loginName);
						// 设置年度
						if (thisYear != null) {
							model.setYear(thisYear);
						} else {
							planYear = planYearSerivce.findPlanYear();
							model.setYear(planYear.getYear());
						}
						//课题类型
						issueTypeList = sysIssueTypeService.findAll(SysIssueType.class);

						List<ListGroupTeacher> gTeacherList = groupTeacherService.findByTeacherIdAndYear(teacherVO.getTeacherId(), thisYear);

						Integer groupAllotId = 0;
						if (gTeacherList != null) {
							for (int i = 0; i < gTeacherList.size(); i++) {
								Integer gId = gTeacherList.get(i).getGroupAllotId();
								GroupAllot gAllot = groupAllotService.findById(gId);
								if (thisReplyType.equals(gAllot.getGroupType())) { // 赛选大组ID
									groupAllotId = gId;
									break;
								}
							}
						}
						//老师查询所在组的学生信息
//						pageResult1 = materialInfoSerivce.findGroupStudent(groupAllotId,thisReplyType, model.getYear(), getPage(), getRow());
						//老师查询所在组的学生信息
						if (SystemContext.REPLY_TYPE_SMALL_GROUP.equals(thisReplyType)){//答辩组
							pageResult1 = materialInfoSerivce.findGroupStudent(groupAllotId,thisReplyType, model.getYear(), getPage(), getRow());
						}else if (SystemContext.REPLY_TYPE_BIG_GROUP.equals(thisReplyType)){//大组
							pageResult1 = materialInfoSerivce.findGroupStudent(groupAllotId,thisReplyType, model.getYear(), getPage(), getRow());
						}else {//默认答辩组
							pageResult1 = materialInfoSerivce.findGroupStudent(groupAllotId,thisReplyType, model.getYear(), getPage(), getRow());
						}
						footer = PageUtil.pageFooter(pageResult1, getRequest());
						//指导老师查询自己所在教研室进度计划信息
						if (teacher.getStaffroomId() == null) {
							teacher.setStaffroomId(-1);
						}
						planProgressList = planProgressSerivce.findByMajorAndYear(teacher.getStaffroomId(), model.getYear());

					}

					return SUCCESS;

				} else {
					logger.info("pageResult1=>"+pageResult1);
					return SUCCESS;
				}
			} else {
				return SUCCESS;
			}
			/////////////////////////////////////////////////////////////

		} catch (Exception e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}
	//查询当前学生的所有答辩记录
	public String findStudentAllDefenseRecordBy(){
		String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
		String type = (String) getSession().getAttribute(SystemContext.USERTYPE);

	    logger.info("查询当前学生的所有答辩记录|thisStuId："+thisStuId+" thisYear: "+thisYear);

		lTeacher = sysTeacherService.findByTeacherNo(loginName);
		planProgress = planProgressSerivce.findByTeacStaffroomId(lTeacher.getStaffroomId(), flag);
			Timestamp d = new Timestamp(System.currentTimeMillis());

			if (d.after(planProgress.getStartTime())) {
				try {
					DefenseRecord defenseRecord = new DefenseRecord();

					if (thisStuId != null) {
						defenseRecord.setStuId(thisStuId);
					}

					if (thisYear!=null) {
						defenseRecord.setYear(thisYear);
					}

						pageResult = defenseRecordService.find(defenseRecord, getPage(), getRow());

						footer = PageUtil.pageFooter(pageResult, getRequest());

				} catch (Exception e) {
					e.printStackTrace();
				}
				return SUCCESS;
			} else {
				return SUCCESS;
			}
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

		/************************** 查询课题名称 *********************************************/
	
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
	 * 打开添加答辩记录页面
	 * 
	 * @return
	 */
	public String openAdd() {

		String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
		String type = (String) getSession().getAttribute(SystemContext.USERTYPE);

		/************************** 查询教研室信息 *********************************************/
		
		//查询 当前学生所属专业教研室  进度计划
		if(flag!=null&&"11".equals(flag)){
				if ("1".equals(type)) {
					student = sysStudentService.findByStuNo(loginName);		
			        planProgress=planProgressSerivce.findByStudMajoId(student.getMajorId(),flag);
			        thisStuId = student.getStuId();
				}
				//查询 当前老师所属专业教研室 中的进度计划
				if ("2".equals(type)) {
					 lTeacher = sysTeacherService.findByTeacherNo(loginName);
					 planProgress=planProgressSerivce.findByTeacStaffroomId(lTeacher.getStaffroomId(),flag); 
				}
				Timestamp d = new Timestamp(System.currentTimeMillis()); 
				if(planProgress!=null&&d.after(planProgress.getStartTime())){
					logger.info("当前时间大于年度时间");
					try {
						if (thisStuId!= null
//								&&thisYear!=null
						) {
							// 查询学生信息
							student = sysStudentService.findViewModelById(thisStuId);
							//查询课题信息
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
					return SUCCESS;
				}
		}else{
			return null;
		}
	}
	/**
	 * 添加信息到数据库
	 * 
	 * @return
	 */
	public String add() {
		try {
			PrintWriter out = getResponse().getWriter();
			planYear = planYearSerivce.findPlanYear();
//			if (thisStuId != null && thisYear != null) {
				if (thisStuId != null) {
				model.setYear(thisYear);
				//查询课题信息
				issueInfo = issueInfoSerivce.findByStuIdAndYear(thisStuId, thisYear);
				// 查询指导老师信息
				AllotGuide aGuide = allotGuideService.findByStuIdAndYear(thisStuId, thisYear);
				//添加信息
				model.setTeacherId(aGuide.getTeacherId());
				model.setStuId(thisStuId);

				model.setYear(thisYear);
				logger.info("添加答辩记录：Model = "+model);
				model = defenseRecordService.add(model);
				mark = "1";
			} else {
				mark = "0";
			}
		} catch (Exception e) {
			mark = "0";
			e.printStackTrace();
		}
		return list();
	}
	/**
	 * 打开修改答辩记录页面
	 * 
	 * @return
	 */
	public String openEdit() {

		String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
		String type = (String) getSession().getAttribute(SystemContext.USERTYPE);

		/************************** 查询教研室信息 *********************************************/
		
		//查询 当前学生所属专业教研室  进度计划
		if(flag!=null&&"11".equals(flag)){
				if ("1".equals(type)) {
					student = sysStudentService.findByStuNo(loginName);		
			        planProgress=planProgressSerivce.findByStudMajoId(student.getMajorId(),flag);  
				}
				//查询 当前老师所属专业教研室 中的进度计划
				if ("2".equals(type)) {
					student = sysStudentService.findViewModelById(thisStuId);
					 lTeacher = sysTeacherService.findByTeacherNo(loginName);
					 planProgress=planProgressSerivce.findByTeacStaffroomId(lTeacher.getStaffroomId(),flag); 
				}
				Timestamp d = new Timestamp(System.currentTimeMillis()); 
				if(planProgress!=null&&planProgress.getStartTime()!=null&&d.after(planProgress.getStartTime())){
					try {
						if (thisId != null && thisYear != null) {
							if (thisId != null) {

								model = defenseRecordService.findById(thisId);
								//查询课题信息
								issueInfo = issueInfoSerivce.findByStuIdAndYear(model.getStuId(), thisYear);
								// 查询指导老师信息
								aGuide = allotGuideService.findByStuIdAndYear(model.getStuId(), thisYear);
								teacher  =  sysTeacherService.findById(aGuide.getTeacherId());
								logger.info("Model "+model);
								logger.info("学生 "+student);
								logger.info("课题 "+issueInfo);
								logger.info("导师 "+aGuide);

							}else{
								model = defenseRecordService.findByStuIdAndYear(thisStuId, thisYear);
								if(model==null){
									view =  "add";
									return openAdd();
								}
							} 
						}
					}catch (Exception e) {
						e.printStackTrace();
					}
					return SUCCESS;
				}else{
				    return SUCCESS;
				}
	    }else{
	    	return SUCCESS;
	    }
	}
	/**
	 * 打开答辩记录详情页面
	 * 
	 * @return
	 */
	public String openDetail() {
		String loginName = (String) getSession().getAttribute(
				SystemContext.LOGINNAME);
		String type = (String) getSession()
				.getAttribute(SystemContext.USERTYPE);
		/************************** 查询教研室信息 *********************************************/
		
		//查询 当前学生所属专业教研室  进度计划
				if(flag!=null&&"11".equals(flag)){
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
												// 查询学生信息
												student = sysStudentService.findViewModelById(thisStuId);
												//查询课题信息
												issueInfo = issueInfoSerivce.findByStuIdAndYear(thisStuId, thisYear);
												// 查询指导老师信息
												AllotGuide aGuide = allotGuideService.findByStuIdAndYear(thisStuId, thisYear);
												teacher = sysTeacherService.findById(aGuide.getTeacherId());
												model = defenseRecordService.findById(thisId);
											}else{
												model = defenseRecordService.findByStuIdAndYear(thisStuId, thisYear);
											}
									}
								} catch (Exception e) {
									e.printStackTrace();
								}
								return openAdd();
							}else{
							    return "view";
							}
				    }else{
				    	return null;
				    }
	}
	/**
	 * 修改答辩记录信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String edit() {

		logger.info("修改答辩记录："+model);

		try {
			if (thisId != null) {
				DefenseRecord defenseRecord = defenseRecordService.findById(thisId);

				if (StringUtils.isNotEmpty(model.getDefenseContent())) {
					defenseRecord.setDefenseContent(model.getDefenseContent());
				}
				model = defenseRecordService.addOrEdit(defenseRecord);
				thisYear = model.getYear();
				mark = "1";
			} else {
				mark = "0";
			}
		} catch (Exception e) {
			e.printStackTrace();
			mark = "0";
		}
		return list();
	}
	/**
	 * 导出答辩记录
	 * @return
	 */
	public String outDefenseRecord() {
		try {
			SysTechnical sysTechnical = new SysTechnical();
			//查询数据
			if (thisId != null) {
				model = defenseRecordService.findById(thisId);
				sysStudent.setStuId(model.getStuId());
				student = sysStudentService.findByExample(sysStudent).get(0);
				// 查询指导老师信息
				ListAllotGuide aGuide = allotGuideService.findByStuId(student.getStuId());
				teacher = sysTeacherService.findById(aGuide.getTeacherId());
				sysTechnical = sysTechnicalService.findById(teacher.getTechnicalId());
			}

			// ##################根据Word模板导出单个Word文档###################################################
			Map<String, String> map = new HashMap<String, String>();
			//查询课题
			if (model.getStuId() != null) {
				issueInfo = issueInfoSerivce.findByStuIdAndYear(model.getStuId(), thisYear);
			}

			map.put("dN", student.getDeptName());
			map.put("mN", student.getMajorName());
			map.put("cN", student.getClassName());
			map.put("sNo", student.getStuNo());
			map.put("sNa", student.getStuName());
			map.put("dC", model.getDefenseContent());
			map.put("iN", issueInfo.getIssueName());
			map.put("tN", teacher.getTeacherName());
			map.put("lN", sysTechnical.getTechnicalName());


			WordUtils.exportWord(map, getTempletePath(), getFilePath());

			StringBuffer sBuffer = new StringBuffer(student.getClassName());

			sBuffer.append("-").append(student.getStuNo()).append("-")
					.append(student.getStuName()).append("-")
					.append("答辩记录.doc");
			fileName = sBuffer.toString();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return OUT;
	}
	/**
	 * 删除答辩记录信息
	 * 
	 * @return
	 */
	public void del() {
		logger.info("删除答辩记录信息");
		boolean isdel = false;
		try {
			PrintWriter out = getResponse().getWriter();
			if (thisId != null) {
				defenseRecordService.del(thisId);
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

	public Result<DefenseRecordVO> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<DefenseRecordVO> pageResult) {
		this.pageResult = pageResult;
	}

	public PlanYear getPlanYear() {
		return planYear;
	}
	public void setPlanYear(PlanYear planYear) {
		this.planYear = planYear;
	}
	public SysTeacher getTeacher() {
		return teacher;
	}
	public void setTeacher(SysTeacher teacher) {
		this.teacher = teacher;
	}
	public SysStudent getSysStudent() {
		return sysStudent;
	}
	public void setSysStudent(SysStudent sysStudent) {
		this.sysStudent = sysStudent;
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
	public List<ListTeacher> getSysTeacherList() {
		return sysTeacherList;
	}
	public void setSysTeacherList(List<ListTeacher> sysTeacherList) {
		this.sysTeacherList = sysTeacherList;
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
		return ServletActionContext.getServletContext().getRealPath(
				filePath);
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public ListStudent getStudent() {
		return student;
	}
	public void setStudent(ListStudent student) {
		this.student = student;
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
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}

	public ListTeacher getTeacherVO() {
		return teacherVO;
	}

	public void setTeacherVO(ListTeacher teacherVO) {
		this.teacherVO = teacherVO;
	}

	public AllotGuide getaGuide() {
		return aGuide;
	}

	public void setaGuide(AllotGuide aGuide) {
		this.aGuide = aGuide;
	}

	public SysClass getSysClass() {
		return sysClass;
	}

	public void setSysClass(SysClass sysClass) {
		this.sysClass = sysClass;
	}

	public MaterialInfo getMaterialInfo() {
		return materialInfo;
	}

	public void setMaterialInfo(MaterialInfo materialInfo) {
		this.materialInfo = materialInfo;
	}

	public PlanProgress getPlanProgress() {
		return planProgress;
	}

	public void setPlanProgress(PlanProgress planProgress) {
		this.planProgress = planProgress;
	}

	public ListTeacher getlTeacher() {
		return lTeacher;
	}

	public void setlTeacher(ListTeacher lTeacher) {
		this.lTeacher = lTeacher;
	}


	public Result<MaterialInfo> getPageResult1() {
		return pageResult1;
	}

	public void setPageResult1(Result<MaterialInfo> pageResult1) {
		this.pageResult1 = pageResult1;
	}

	public List<SysClass> getSysClassList() {
		return sysClassList;
	}

	public void setSysClassList(List<SysClass> sysClassList) {
		this.sysClassList = sysClassList;
	}

	public List<SysIssueType> getIssueTypeList() {
		return issueTypeList;
	}

	public void setIssueTypeList(List<SysIssueType> issueTypeList) {
		this.issueTypeList = issueTypeList;
	}

	public List<ListPlanProgress> getPlanProgressList() {
		return planProgressList;
	}

	public void setPlanProgressList(List<ListPlanProgress> planProgressList) {
		this.planProgressList = planProgressList;
	}

	public String getThisReplyType() {
		return thisReplyType;
	}

	public void setThisReplyType(String thisReplyType) {
		this.thisReplyType = thisReplyType;
	}


}
