package com.gxwzu.business.action.teacherProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.guideCount.GuideCount;
import com.gxwzu.business.model.issueInfo.IssueInfo;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.business.model.teacherProject.TeacherProject;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.guideCount.IGuideCountSerivce;
import com.gxwzu.business.service.issueInfo.IIssueInfoSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.business.service.teacherDirections.ITeacherDirectionsService;
import com.gxwzu.business.service.teacherMajor.ITeacherMajorService;
import com.gxwzu.business.service.teacherProject.ITeacherProjectService;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListChatInfo;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListStudentAllotGuide;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.sysVO.ListTeacherGuideCount;
import com.gxwzu.sysVO.ListTeacherMajor;
import com.gxwzu.system.model.sysDirections.SysDirections;
import com.gxwzu.system.model.sysIssueType.SysIssueType;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysDirections.ISysDirectionsService;
import com.gxwzu.system.service.sysIssueType.ISysIssueTypeService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 指导老师课题
 * 
 * @author 黎艺侠
 * @date 2017.11.14
 */
public class TeacherProjectAction extends BaseAction implements ModelDriven<TeacherProject> {

	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());

	/*********************** 实例化ModelDriven ******************************/
	private TeacherProject model = new TeacherProject();

	@Override
	public TeacherProject getModel() {
		return model;
	}

	public void setModel(TeacherProject model) {
		this.model = model;
	}

	/*********************** Service接口注入 ***************************/
	@Autowired
	private ITeacherProjectService teacherProjectService; // 导师课题接口
	@Autowired
	private IPlanYearSerivce planYearSerivce; // 年度计划接口
	@Autowired
	private ISysIssueTypeService sysIssueTypeService; // 课题类型接口
	@Autowired
	private IAllotGuideService allotGuideService; // 指导老师分配接口
	@Autowired
	private ISysStudentService sysStudentService; // 学生接口
	@Autowired
	private ISysTeacherService sysTeacherService; // 教师接口
	@Autowired
	private IIssueInfoSerivce issueInfoSerivce; // 课题接口

	/*********************** 实体 ***************************/

	private PlanYear planYear = new PlanYear(); // 年度计划实体
	private ListTeacher teacher = new ListTeacher(); // 老师实体
	private ListStudent student = new ListStudent();
	private IssueInfo issueInfo = new IssueInfo();
	private SysStudent sysStudent = new SysStudent();

	/******************** 集合变量声明 *********************/
	private Result<TeacherProject> pageResult; // 指导老师课题分页
	private List<SysIssueType> issueTypeList = new ArrayList<SysIssueType>();
	private ListStudentAllotGuide allotGuide = new ListStudentAllotGuide(); // 指导分配实体
	private List<ListStudentAllotGuide> allotStudentList = new ArrayList<ListStudentAllotGuide>();
	private List<TeacherProject> teacherProjectList = new ArrayList<TeacherProject>(); // 导师课题信息列表
	private List<IssueInfo> issueInfoList = new ArrayList<IssueInfo>();
	
	/************************** 基础变量声明 **************/
	private Integer thisId;
	private String mark;
	private String thisIds;
	private Integer chooseProSign;//学生本人是否已选课标识
	private Integer thisProSign;//该课题是否可选标志
	
	/************************** 方法类 ***********************************/
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	/**
	 * 导师列表查询
	 * @return
	 *
	 */
	public String list(){
		logger.info("显示导师课题"+model.getProjectName());
		try{
			String loginName = (String) getSession().getAttribute(
					SystemContext.LOGINNAME);
			String type = (String) getSession().getAttribute(
					SystemContext.USERTYPE);
			planYear = planYearSerivce.findPlanYear();
			if(model.getYear() ==null){
				model.setYear(planYear.getYear());
			}
			//课题类型
			issueTypeList = sysIssueTypeService.findAll(SysIssueType.class);
			// 导师自己的课题信息
		    teacher = sysTeacherService.findByTeacherNo(loginName);
			model.setTeacherId(teacher.getTeacherId());
			pageResult = teacherProjectService.find(model,getPage(),getRow());
    		footer = PageUtil.pageFooter(pageResult, getRequest());
		}catch(Exception e){
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 学生查询导师课题列表
	 * @return
	 *
	 */
	public String detail(){
		logger.info("显示导师课题"+model.getProjectName());
		try{
			String loginName = (String) getSession().getAttribute(
					SystemContext.LOGINNAME);
			String type = (String) getSession().getAttribute(
					SystemContext.USERTYPE);
			planYear = planYearSerivce.findPlanYear();
			if(model.getYear() ==null){
				model.setYear(planYear.getYear());
			}
			//课题类型
			issueTypeList = sysIssueTypeService.findAll(SysIssueType.class);
			
			if (type.equals("1")) {
				student = sysStudentService.findByStuNo(loginName);
				// 指导老师查询自己所带学生相关信息
				AllotGuide allotGuide = allotGuideService.findByStuIdAndYear(
						student.getStuId(), planYear.getYear());
				issueInfoList = issueInfoSerivce.findByStuId(student.getStuId(), planYear.getYear());
				
				if(issueInfoList != null && issueInfoList.size()>0){
					chooseProSign = 1;//已选课
				}else{
					chooseProSign = 0;//未选课
				}
				
				//查询导师信息
				teacher = sysTeacherService.findModelById(allotGuide.getTeacherId());
				teacherProjectList = teacherProjectService.findAllByTeacherId(teacher.getTeacherId(),planYear.getYear());
				
                for (int i = 0; i < teacherProjectList.size(); i++) {
                	Integer maxChoose = teacherProjectList.get(i).getMaxChoose();
                	Integer alreadyChoose = teacherProjectList.get(i).getAlreadyChoose();
                	String stuIds = teacherProjectList.get(i).getStuIds();
                	Integer state = 0;
                	String studentName = "";
                	if(stuIds != null && !"".equals(stuIds)){
        				String[] stuIdsArray = stuIds.split(",");
        				for (int j = 0; j < stuIdsArray.length; j++) {
        					if(stuIdsArray[j] != null && !"".equals(stuIdsArray[j])){
            					sysStudent = sysStudentService.findByStuId(Integer.parseInt(stuIdsArray[j]));
            					studentName += sysStudent.getStuName() + ",";
        					}
        				}
        				teacherProjectList.get(i).setStuNames(studentName);
                    	if(chooseProSign == 0 && maxChoose - alreadyChoose > 0){
                    		if (!stuIds.contains(student.getStuId().toString())){
                    			state = 1; //可选
                    		}
                    	}
                    	if(chooseProSign == 1 && maxChoose-alreadyChoose > 0){
                    		if (!stuIds.contains(student.getStuId().toString())){
                    			state = 2; //不可选
                    		}
                    	}
                    	if(chooseProSign == 1){
                    		if (stuIds.contains(student.getStuId().toString())){
                    			state = 3; //退选
                    		}
                    	}
                    	if((chooseProSign == 1 || chooseProSign == 0) && maxChoose-alreadyChoose <= 0){
                    		if (!stuIds.contains(student.getStuId().toString())){
                    			state = 4; //已选完
                    		}
                    	}
                    	
                	}else{
                		state = 1; //可选
                	}
                	teacherProjectList.get(i).setState(state);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 添加课题
	 * @return
	 */
	    public String add(){
	    	try {
				logger.info("添加课题"+model);
				String loginName = (String) getSession().getAttribute(
						SystemContext.LOGINNAME);
				String type = (String) getSession().getAttribute(
						SystemContext.USERTYPE);
				String issueType  = "";
				for(SysIssueType ite: issueTypeList){
					if(ite!=null&&ite.getIssueTypeId()!=null)
					issueType +="&"+ite.getIssueTypeId()+"&_";
				}
				// 老师的课题信息
				if (type.equals("2")) {
					teacher = sysTeacherService.findByTeacherNo(loginName);
					model.setTeacherId(teacher.getTeacherId());
				}
				planYear = planYearSerivce.findPlanYear();
				if(model.getYear() ==null){
					model.setYear(planYear.getYear());
				}
				//model.setAlreadyChoose(0);
				model.setProjectType(issueType);
				model = teacherProjectService.add(model);
				mark = "1";
			} catch (Exception e) {
				e.printStackTrace();
				setMark("0");
			}
			return list();
	    }
	
	    /**
	     * 打开添加课题界面
	     * @return
	     */
	    public String openAdd(){
	    	logger.info("##打开添加课题");
	    	//课题类型
			issueTypeList = sysIssueTypeService.findAll(SysIssueType.class);
			return SUCCESS;
	    }
	    /**
	     * 打开修改课题界面
	     * @return
	     */
	    public String openEdit() {
			try {
				logger.info("打开教师课题界面");
				//课题类型
				issueTypeList = sysIssueTypeService.findAll(SysIssueType.class);
				model = teacherProjectService.findById(thisId);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return SUCCESS;
		}
	    
	    /**
	     * 修改课题
	     * @return
	     */
	    public String edit(){
	    	logger.info("修改课题");
	    	try {
	    		String loginName = (String) getSession().getAttribute(
						SystemContext.LOGINNAME);
				String type = (String) getSession().getAttribute(
						SystemContext.USERTYPE);
				// 老师自己的课题信息
				if (type.equals("2")) {
					teacher = sysTeacherService.findByTeacherNo(loginName);
					model.setTeacherId(teacher.getTeacherId());
				}
	    		String issueType  = "";
				for(SysIssueType ite: issueTypeList){
					if(ite!=null&&ite.getIssueTypeId()!=null){
						issueType +="&"+ite.getIssueTypeId()+"&_";
						System.out.println(ite.getIssueTypeId());
					}
					
				}
				planYear = planYearSerivce.findPlanYear();
				if(model.getYear() ==null){
					model.setYear(planYear.getYear());
				}
				model.setProjectType(issueType);
	    		teacherProjectService.edit(model);
				setMark("1");
			} catch (Exception e) {
				e.printStackTrace();
				setMark("0");
			}
			return list();
	    }
	    
	    /**
	     * 删除课题
	     * @return
	     */
	    public void del(){
	    	logger.info("删除课题信息"+model.getProjectId());
	    	boolean isdel = false;
	    	try {
				PrintWriter out = getResponse().getWriter();
				if(thisId!=null){
					teacherProjectService.del(thisId);
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

	public ListTeacher getTeacher() {
		return teacher;
	}

	public void setTeacher(ListTeacher teacher) {
		this.teacher = teacher;
	}

	public ListStudent getStudent() {
		return student;
	}

	public void setStudent(ListStudent student) {
		this.student = student;
	}

	public Result<TeacherProject> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<TeacherProject> pageResult) {
		this.pageResult = pageResult;
	}

	public ListStudentAllotGuide getAllotGuide() {
		return allotGuide;
	}

	public void setAllotGuide(ListStudentAllotGuide allotGuide) {
		this.allotGuide = allotGuide;
	}

	public List<ListStudentAllotGuide> getAllotStudentList() {
		return allotStudentList;
	}

	public void setAllotStudentList(List<ListStudentAllotGuide> allotStudentList) {
		this.allotStudentList = allotStudentList;
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

	public String getThisIds() {
		return thisIds;
	}

	public void setThisIds(String thisIds) {
		this.thisIds = thisIds;
	}

	public List<SysIssueType> getIssueTypeList() {
		return issueTypeList;
	}

	public void setIssueTypeList(List<SysIssueType> issueTypeList) {
		this.issueTypeList = issueTypeList;
	}

	public List<TeacherProject> getTeacherProjectList() {
		return teacherProjectList;
	}

	public void setTeacherProjectList(List<TeacherProject> teacherProjectList) {
		this.teacherProjectList = teacherProjectList;
	}

	public IssueInfo getIssueInfo() {
		return issueInfo;
	}

	public void setIssueInfo(IssueInfo issueInfo) {
		this.issueInfo = issueInfo;
	}

	public List<IssueInfo> getIssueInfoList() {
		return issueInfoList;
	}

	public void setIssueInfoList(List<IssueInfo> issueInfoList) {
		this.issueInfoList = issueInfoList;
	}

	public Integer getChooseProSign() {
		return chooseProSign;
	}

	public void setChooseProSign(Integer chooseProSign) {
		this.chooseProSign = chooseProSign;
	}

	public Integer getThisProSign() {
		return thisProSign;
	}

	public void setThisProSign(Integer thisProSign) {
		this.thisProSign = thisProSign;
	}

	public SysStudent getSysStudent() {
		return sysStudent;
	}

	public void setSysStudent(SysStudent sysStudent) {
		this.sysStudent = sysStudent;
	}

	
	
	
}
