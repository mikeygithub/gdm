package com.gxwzu.business.action.materialInfo;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.group.GroupAllot;
import com.gxwzu.business.model.group.GroupTeacher;
import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.group.IGroupAllotService;
import com.gxwzu.business.service.group.IGroupStudentService;
import com.gxwzu.business.service.group.IGroupTeacherService;
import com.gxwzu.business.service.materialInfo.IMaterialInfoSerivce;
import com.gxwzu.business.service.plan.IPlanProgressSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.business.service.teacherDirections.ITeacherDirectionsService;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListAllotGuide;
import com.gxwzu.sysVO.ListGroupAllot;
import com.gxwzu.sysVO.ListGroupStudent;
import com.gxwzu.sysVO.ListGroupTeacher;
import com.gxwzu.sysVO.ListPlanProgress;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.sysVO.ListTeacherDirections;
import com.gxwzu.sysVO.MaterialInfo;
import com.gxwzu.system.model.sysDuties.SysDuties;
import com.gxwzu.system.model.sysFileType.SysFileType;
import com.gxwzu.system.model.sysIssueType.SysIssueType;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysDuties.ISysDutiesService;
import com.gxwzu.system.service.sysFileType.ISysFileTypeService;
import com.gxwzu.system.service.sysIssueType.ISysIssueTypeService;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.gxwzu.system.service.userHelp.IUserHelpService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 学生相关材料
 * 
 * @author 何志明
 * @date 2017.7.21
 */
public class MaterialInfoAction extends BaseAction implements
		ModelDriven<MaterialInfo> {

	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());

	/*********************** 实例化ModelDriven ******************************/
	private MaterialInfo model = new MaterialInfo();

	@Override
	public MaterialInfo getModel() {
		return model;
	}

	public void setModel(MaterialInfo model) {
		this.model = model;
	}

	/*********************** Service接口注入 ***************************/
	@Autowired
	private ISysStudentService sysStudentService; // 学生接口
	@Autowired
	private ISysTeacherService sysTeacherService; // 老师接口
	@Autowired
	private IMaterialInfoSerivce materialInfoSerivce; // 学生相关材料接口
	@Autowired
	private IPlanYearSerivce planYearSerivce; // 年度计划接口
	@Autowired
	private IPlanProgressSerivce planProgressSerivce; // 进度计划接口
	@Autowired
	private IAllotGuideService allotGuideService; // 指导老师分配接口
	@Autowired
	private IGroupStudentService groupStudentService; // 指导老师分配接口
	@Autowired
	private IUserHelpService userHelpService; // 指导老师分配接口
	@Autowired
	private IGroupAllotService groupAllotService; // 分组接口
	@Autowired
	private ISysIssueTypeService sysIssueTypeService; // 课题类型接口
	@Autowired
	private IGroupTeacherService groupTeacherService; // 老师分组接口
	@Autowired
	private ITeacherDirectionsService teacherDirectionsService; // 老师研究接口
	@Autowired
	private ISysDutiesService sysDutiesService; // 老师分组接口
	@Autowired
	private ISysFileTypeService sysFileTypeService; //文件类型接口
	/*********************** 实体 ***************************/
	private PlanYear planYear; // 年度计划实体
	private AllotGuide allotGuide; // 指导分配实体
	private GroupTeacher groupTeacher; // 指导分配实体
	private MaterialInfo materialInfo = new MaterialInfo(); // 学生相关材料列表实体
	private PlanProgress planProgress = new PlanProgress(); // 进度计划实体
	private UserHelp userHelp = new UserHelp(); // 用户实体
	private SysStudent sysStudent = new SysStudent(); // 学生实体
	private ListTeacher teacher = new ListTeacher(); // 老师实体
	private ListGroupAllot groupAllot = new ListGroupAllot(); // 分组实体
	private ListStudent studentModel = new ListStudent(); // 學生实体
	
	private List<ListAllotGuide> allotGuideList = new ArrayList<ListAllotGuide>(); // 指导老师分配信息列表
	private List<ListTeacherDirections> teacherDirectionsList = new ArrayList<ListTeacherDirections>(); // 老师研究方向信息列表
	private List<MaterialInfo> guideStudentList = new ArrayList<MaterialInfo>(); // 学生相关材料信息
	private List<SysDuties> sysDutiesList = new ArrayList<SysDuties>(); // 职务信息列表（用于查询全部）
	private List<SysFileType> fileTypeList = new ArrayList<SysFileType>(); //论文信息列表（用于查询全部
	private List<ListPlanProgress> planProgressList = new ArrayList<ListPlanProgress>(); //进度计划
	/******************** 集合变量声明 *********************/
	private Result<MaterialInfo> pageResult; // 学生相关材料分页
	private List<SysIssueType> issueTypeList = new ArrayList<SysIssueType>();
	/************************** 基础变量声明 **************/

	private Integer thisId;
	private String mark;
	private Integer thisType;// 页面功能跳转类别
	private Integer thisYear;
	private Integer stuId;
	private Integer fileTypeSize = 0; //默认文件类型个数 0 
	private String flag;
	private String thisReplyType; // 类型：答辩类型： 00答辩小组 01系答辩委员会

	/************************** 方法类 **************************************************************************************/
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	/**
	 * 老师分页查询学生相关材料信息
	 * 
	 * @return
	 */
	public String list() {

		String type = (String) getSession()
				.getAttribute(SystemContext.USERTYPE);

		String loginName = (String) getSession().getAttribute(
				SystemContext.LOGINNAME);
		try {
			// 老师查询学生课题信息
			if (type.equals("2")) {
				teacher = sysTeacherService.findByTeacherNo(loginName);
				model.setDeptNumber(teacher.getDeptNumber()); // 学院
				model.setCategoryId(teacher.getCategoryId()); // 大类
			}
			// 设置年度
			if (thisYear != null) {
				model.setYear(thisYear);
			} else {
				planYear = planYearSerivce.findPlanYear();
				model.setYear(planYear.getYear());
			}
			pageResult = materialInfoSerivce.find(model, getPage(), getRow());
			footer = PageUtil.pageFooter(pageResult, getRequest());

			allotGuideList = allotGuideService.findByLoginName(allotGuide);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 指导老师查询自己所带学生相关材料信息
	 * 
	 * @return
	 */
	public String guideStudentList() {
		logger.info("指导老师查询自己所带学生相关材料信息");
		String type = (String) getSession()
				.getAttribute(SystemContext.USERTYPE);

		String loginName = (String) getSession().getAttribute(
				SystemContext.LOGINNAME);
		try {
			// 老师查询学生课题信息
			if (type.equals("2")) {
				teacher = sysTeacherService.findByTeacherNo(loginName);
				
				
			// 设置年度
			if (thisYear != null) {
				model.setYear(thisYear);
			} else {
				planYear = planYearSerivce.findPlanYear();
				model.setYear(planYear.getYear());
			}
			//课题类型
			issueTypeList = sysIssueTypeService.findAll(SysIssueType.class);
			
			//指导老师查询自己所带学生相关材料信息
			guideStudentList = materialInfoSerivce.findGuideStudent(teacher.getTeacherId(),model.getYear());
			
			//指导老师查询自己所在教研室进度计划信息
			if(teacher.getStaffroomId()==null)
				teacher.setStaffroomId(-1);
			planProgressList = planProgressSerivce.findByMajorAndYear(teacher.getStaffroomId(),model.getYear());
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 老师查询所在组的学生信息
	 * 
	 * @return
	 */
	public String groupStudentList() {
		logger.info("老师查询所在组的学生信息");
		String type = (String) getSession()
				.getAttribute(SystemContext.USERTYPE);

		String loginName = (String) getSession().getAttribute(
				SystemContext.LOGINNAME);
		if (flag != null && "13".equals(flag)) {
			// 查询 当前老师所属专业教研室 中的进度计划
			if ("2".equals(type)) {
				teacher = sysTeacherService.findByTeacherNo(loginName);
				planProgress = planProgressSerivce.findByTeacStaffroomId(teacher.getStaffroomId(), flag);
			}
			Timestamp d = new Timestamp(System.currentTimeMillis());
			if (d.after(planProgress.getStartTime())) {
				logger.info("老师查询所在组已分配评阅的学生信息");
			try {
				// 老师查询学生课题信息
				if (type.equals("2")) {
					teacher = sysTeacherService.findByTeacherNo(loginName);
					
				// 设置年度
				if (thisYear != null) {
					model.setYear(thisYear);
				} else {
					planYear = planYearSerivce.findPlanYear();
					model.setYear(planYear.getYear());
				}
				//课题类型
				issueTypeList = sysIssueTypeService.findAll(SysIssueType.class);
				
				List<ListGroupTeacher> gTeacherList = groupTeacherService.findByTeacherIdAndYear(teacher.getTeacherId(),
						thisYear);
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
				pageResult = materialInfoSerivce.findGroupStudent(groupAllotId,model.getYear(), getPage(), getRow());
				
				
				footer = PageUtil.pageFooter(pageResult, getRequest());
				//指导老师查询自己所在教研室进度计划信息
				if(teacher.getStaffroomId()==null)
					teacher.setStaffroomId(-1);
				planProgressList = planProgressSerivce.findByMajorAndYear(teacher.getStaffroomId(),model.getYear());
				
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return SUCCESS;
			
		    } else {
			    return "view";
		   }
	     }else {
		    return SUCCESS;
	     }
	  }
	
	/**
	 * 老师查询所在答辩组——已分配评阅的学生信息
	 * 
	 * @return
	 */
	public String groupDefenseStudentList() {
		logger.info("老师查询所在组已分配评阅的学生信息");
		String type = (String) getSession()
				.getAttribute(SystemContext.USERTYPE);

		String loginName = (String) getSession().getAttribute(
				SystemContext.LOGINNAME);
		/************************** 查询教研室信息 *********************************************/
		if (flag != null && "13".equals(flag)) {
			// 查询 当前老师所属专业教研室 中的进度计划
			if ("2".equals(type)) {
				teacher = sysTeacherService.findByTeacherNo(loginName);
				planProgress = planProgressSerivce.findByTeacStaffroomId(teacher.getStaffroomId(), flag);
			}
			Timestamp d = new Timestamp(System.currentTimeMillis());
			if (d.after(planProgress.getStartTime())) {
				logger.info("老师查询所在组已分配评阅的学生信息");
				try {
					// 老师查询学生课题信息
					if (type.equals("2")) {
						teacher = sysTeacherService.findByTeacherNo(loginName);
						
					// 设置年度
					if (thisYear != null) {
						model.setYear(thisYear);
					} else {
						planYear = planYearSerivce.findPlanYear();
						model.setYear(planYear.getYear());
					}
					//课题类型
					issueTypeList = sysIssueTypeService.findAll(SysIssueType.class);
					
					if(model.getTeacherId()==null){
						model.setTeacherId(teacher.getTeacherId());
					}
					List<ListGroupTeacher> gTeacherList = groupTeacherService.findByTeacherIdAndYear(model.getTeacherId(), model.getYear());
					
					ListGroupTeacher gTeacher = null;
					if (gTeacherList != null) {
						for (int i = 0; i < gTeacherList.size(); i++) {
							Integer gId = gTeacherList.get(i).getGroupAllotId();
							GroupAllot gAllot = groupAllotService.findById(gId);
							if ( "00".equals(gAllot.getGroupType())) { //普通组
								gTeacher = gTeacherList.get(i);
								break;
							} 
						}
					}
					
					groupAllot = groupAllotService.findViewModelById(gTeacher.getGroupAllotId());
					
					if("00".equals(groupAllot.getFirstDefense())){
						groupStudentService.updateAutoAllotTeacher(groupAllot);
					}
					//老师查询所在组的学生信息
					pageResult = materialInfoSerivce.findGroupDefenseStudent(
							gTeacher.getGroupAllotId()
							,gTeacher.getTeacherId()
							,model.getYear(),
							getPage(), getRow());
					footer = PageUtil.pageFooter(pageResult, getRequest());
					//指导老师查询自己所在教研室进度计划信息
					if(teacher.getStaffroomId()==null)
						teacher.setStaffroomId(-1);
					planProgressList = planProgressSerivce.findByMajorAndYear(teacher.getStaffroomId(),model.getYear());
					
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return SUCCESS;
			
	    } else {
		    return "view";
	   }
     }else {
	    return null;
     }
  }

	/**
	 * 学生个人查询学生相关材料信息
	 * 
	 * @return
	 */
	public String info() {
		try {
			String loginName = (String) getSession().getAttribute(
					SystemContext.LOGINNAME);
			String type = (String) getSession().getAttribute(
					SystemContext.USERTYPE);

			// 设置年度
			if (thisYear != null) {
				model.setYear(thisYear);
			} else {
				planYear = planYearSerivce.findPlanYear();
				model.setYear(planYear.getYear());
			}
			thisYear = model.getYear();
			if (type.equals("1")) {
				studentModel = sysStudentService.findByStuNo(loginName);
				model.setStuId(studentModel.getStuId());

				/************************** 查询导师信息 *********************************************/
				if (model.getStuId() != null) {
					sysStudent.setStuId(model.getStuId());
					AllotGuide aGuide = allotGuideService.findByStuIdAndYear(
							model.getStuId(), model.getYear());
					teacher = sysTeacherService.findModelById(aGuide
							.getTeacherId());
					// 老师研究方向
					teacherDirectionsList = teacherDirectionsService
							.findByTeacherId(teacher.getTeacherId());
				}

				/************************** 查询分组信息 *********************************************/
				if (model.getStuId() != null && model.getYear() != null) {
					ListGroupStudent gStudent = groupStudentService
							.findByStuIdAndYear(model.getStuId(),
									model.getYear());
					groupAllot = groupAllotService.findViewModelById(gStudent
							.getGroupAllotId());
				}

				pageResult = materialInfoSerivce.find(model, getPage(),
						getRow());
				footer = PageUtil.pageFooter(pageResult, getRequest());
				//课题类型
				issueTypeList = sysIssueTypeService.findAll(SysIssueType.class);
				
				allotGuideList = allotGuideService.findByLoginName(allotGuide);
				
				//加载文件类型个数
				fileTypeList = sysFileTypeService.findAll(SysFileType.class);
				if(fileTypeList!=null){
				 fileTypeSize=fileTypeList.size();	
				}
			}
		} catch (Exception e) {
		}
		return SUCCESS;
	}

	
	
	/********************************************** getter and setter方法 ************************************************************************/

	public PlanYear getPlanYear() {
		return planYear;
	}

	public void setPlanYear(PlanYear planYear) {
		this.planYear = planYear;
	}

	public Result<MaterialInfo> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<MaterialInfo> pageResult) {
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

	public ListTeacher getTeacher() {
		return teacher;
	}

	public void setTeacher(ListTeacher teacher) {
		this.teacher = teacher;
	}

	public MaterialInfo getMaterialInfo() {
		return materialInfo;
	}

	public void setMaterialInfo(MaterialInfo materialInfo) {
		this.materialInfo = materialInfo;
	}

	public Integer getThisYear() {
		return thisYear;
	}

	public void setThisYear(Integer thisYear) {
		this.thisYear = thisYear;
	}

	public Integer getThisType() {
		return thisType;
	}

	public void setThisType(Integer thisType) {
		this.thisType = thisType;
	}

	public ListStudent getStudentModel() {
		return studentModel;
	}

	public void setStudentModel(ListStudent studentModel) {
		this.studentModel = studentModel;
	}

	public List<ListAllotGuide> getAllotGuideList() {
		return allotGuideList;
	}

	public void setAllotGuideList(List<ListAllotGuide> allotGuideList) {
		this.allotGuideList = allotGuideList;
	}

	public AllotGuide getAllotGuide() {
		return allotGuide;
	}

	public void setAllotGuide(AllotGuide allotGuide) {
		this.allotGuide = allotGuide;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public UserHelp getUserHelp() {
		return userHelp;
	}

	public void setUserHelp(UserHelp userHelp) {
		this.userHelp = userHelp;
	}

	public SysStudent getSysStudent() {
		return sysStudent;
	}

	public void setSysStudent(SysStudent sysStudent) {
		this.sysStudent = sysStudent;
	}

	public GroupTeacher getGroupTeacher() {
		return groupTeacher;
	}

	public void setGroupTeacher(GroupTeacher groupTeacher) {
		this.groupTeacher = groupTeacher;
	}

	public List<ListTeacherDirections> getTeacherDirectionsList() {
		return teacherDirectionsList;
	}

	public void setTeacherDirectionsList(
			List<ListTeacherDirections> teacherDirectionsList) {
		this.teacherDirectionsList = teacherDirectionsList;
	}

	public List<SysDuties> getSysDutiesList() {
		return sysDutiesList;
	}

	public void setSysDutiesList(List<SysDuties> sysDutiesList) {
		this.sysDutiesList = sysDutiesList;
	}

	public ListGroupAllot getGroupAllot() {
		return groupAllot;
	}

	public void setGroupAllot(ListGroupAllot groupAllot) {
		this.groupAllot = groupAllot;
	}

	public List<SysFileType> getFileTypeList() {
		return fileTypeList;
	}

	public void setFileTypeList(List<SysFileType> fileTypeList) {
		this.fileTypeList = fileTypeList;
	}

	public Integer getFileTypeSize() {
		return fileTypeSize;
	}

	public void setFileTypeSize(Integer fileTypeSize) {
		this.fileTypeSize = fileTypeSize;
	}

	public List<MaterialInfo> getGuideStudentList() {
		return guideStudentList;
	}

	public void setGuideStudentList(List<MaterialInfo> guideStudentList) {
		this.guideStudentList = guideStudentList;
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

	public PlanProgress getPlanProgress() {
		return planProgress;
	}

	public void setPlanProgress(PlanProgress planProgress) {
		this.planProgress = planProgress;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getThisReplyType() {
		return thisReplyType;
	}

	public void setThisReplyType(String thisReplyType) {
		this.thisReplyType = thisReplyType;
	}
	
}
