package com.gxwzu.system.action.sysNotice;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.progressItem.ProgressItem;
import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.model.ZTreeModel;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.DateUtils;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.sysVO.ListTeacherGuideCount;
import com.gxwzu.system.model.sysGroup.SysGroup;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.sysMenu.SysMenu;
import com.gxwzu.system.model.sysNotice.SysNotice;
import com.gxwzu.system.model.sysOperation.SysOperation;
import com.gxwzu.system.model.sysPermission.SysPermission;
import com.gxwzu.system.model.sysRole.SysRole;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysMenu.ISysMenuService;
import com.gxwzu.system.service.sysNotice.ISysNoticeService;
import com.gxwzu.system.service.sysPermission.ISysPermissionService;
import com.gxwzu.system.service.sysRole.ISysRoleService;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.gxwzu.system.service.userHelp.IUserHelpService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 公告管理
 * 
 * @author 黎艺侠
 * 
 */
public class SysNoticeAction extends BaseAction implements ModelDriven<SysNotice>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected final Log logger = LogFactory.getLog(getClass());

	/********************** 对象实例化 *******************/
	private SysNotice model = new SysNotice();
	private ListTeacher teacher = new ListTeacher(); // 老师实体

	
	@Override
	public SysNotice getModel() {
		return model;
	}

	public void setModel(SysNotice model) {
		this.model = model;
	}

	/*********************** Service接口注入 ***************************/
	@Autowired
	private ISysNoticeService sysNoticeService;   // 公告service
	@Autowired
	private ISysDepartmentService departmentService;
	@Autowired
	private ISysTeacherService sysTeacherService;//老师分配接口
	@Autowired
	private ISysStudentService sysStudentService;//学生接口
	@Autowired
	private IUserHelpService userHelpService;//用户接口
	@Autowired
	private IPlanYearSerivce planYearSerivce; // 年度计划接口
	
	/******************** 变量声明 *********************/
	private Result<SysNotice> pageResult;
	private List<SysNotice> sysNoticeList = new ArrayList<SysNotice>(); //论文信息列表（用于查询全部）
	private ListStudent student = new ListStudent(); // 学生实体
	private ListTeacher teacherList = new ListTeacher();                            //老师实体
	private List<UserHelp> userHelpList = new ArrayList<UserHelp>(); //用户信息列表（用于查询全部）;               
	private PlanYear planYear = new PlanYear(); // 计年度
	private UserHelp userHelp = new UserHelp(); // 用户实体
	private SysDepartment sysDepartment = new SysDepartment();//部门
	
	private Integer thisId;
	private String thisIds; // 批量删除Ids
	private String thisType;
	private String mark;
	private Integer noticeId;
	
	private File imagey;//图片上传
	private String imageyFileName;
	private String imageyContentType;
	private Integer newNum;//获取最新的通知条数

	private UserHelp LoginUser;//用户类型：1.学生 2.老师 3.管理员
	/************************ 方法体 ********************/

	/**
	 * 公告管理列表     
	 * 
	 * @return
	 */
	public String list() {
		logger.info("角色管理列表");
		try {
			String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
			String userType = (String) getSession().getAttribute(SystemContext.USERTYPE);
			
			userHelpList = userHelpService.findAll(UserHelp.class);
			
		    List<UserHelp> userHelp = userHelpService.findByLoginName(loginName);
		    
			model.setUserId(userHelp.get(0).getId());
			LoginUser = userHelp.get(0);//当前登入的用户

			logger.info("当前登入的用户"+userHelp);

			pageResult = sysNoticeService.find(new SysNotice(), getPage(), getRow());
			footer = PageUtil.pageFooter(pageResult, getRequest());


		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 打开公告通知详情页面
	 * @return
	 */
	public String openNotice() {

		logger.info("打开公告通知详情页面");

		try {
			 //通知
			 model = sysNoticeService.findById(model.getNoticeId());

			//查询部门
			if (model.getDeptNumber()!=null) {
				sysDepartment = departmentService.findSysDepartmentByDeptNumber(model.getDeptNumber().toString());
			}else if (-2==model.getMajorId()){
				sysDepartment.setDeptName("管理员");
			}

			 logger.info("公告："+model);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 打开公告添加页面
	 * 
	 * @return
	 */
	public String openAdd() {
		logger.info("打开角色添加页面");
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 添加公告
	 * 
	 * @return
	 */
	public String add() {
		logger.info("添加公告" + model);
		try {
			  if (null != model) {
			  
				String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
				String userType = (String) getSession().getAttribute(SystemContext.USERTYPE);
				//查询 当前老师所属专业教研室
				if ("2".equals(userType)) {
					teacher = sysTeacherService.findByTeacherNo(loginName);
					model.setDeptNumber(Integer.parseInt(teacher.getDeptNumber()));
					model.setMajorId(teacher.getStaffroomId());
				}else{
					model.setMajorId(-2);
				}
				planYear = planYearSerivce.findPlanYear();
				if(model.getYear() ==null&&planYear!=null){
					model.setYear(planYear.getYear());
				}
				
				List<UserHelp> userList = userHelpService.findByLoginName(loginName);
				model.setUserId(userList.get(0).getId());
				
				model.setNoticeTime(Timestamp.valueOf(DateUtils.formatTime(new Date())));
				model = sysNoticeService.add(model);
				
				mark = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
			mark = "0";
		}
		return list();
	}

	/**
	 * 删除公告信息
	 */
	public void del() {
		logger.info("删除公告信息");
		boolean isdel = false;
		try {
			PrintWriter out = getResponse().getWriter();
			if (thisId != null) {
			sysNoticeService.del(thisId);
			isdel = true;
			}
			out.print(isdel);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 公告信息列表
	 * 
	 * @return
	 */
	public void loadNoticeList() {
		logger.info(" 公告信息列表");
		try {
			PrintWriter out = getResponse().getWriter();
			//公告信息列表
			String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
			String userType = (String) getSession().getAttribute(SystemContext.USERTYPE);
			//查询 当前老师所属专业教研室
			if (SystemContext.USER_STUDENT_TYPE.equals(userType)) {
				student = sysStudentService.findByStuNo(loginName);		
				model.setMajorId(student.getMajorId());
			}else if (SystemContext.USER_TEACHER_TYPE.equals(userType)) {
				teacher = sysTeacherService.findByTeacherNo(loginName);
				model.setMajorId(teacher.getStaffroomId());
			}
			if (newNum!=null&&newNum>0){//查询最新的通知
				logger.info("查询公告条数"+newNum);
				sysNoticeList = sysNoticeService.findByMostNew(model,newNum);
			}else {
				sysNoticeList = sysNoticeService.findAll(model);
			}
			out.print(new Gson().toJson(sysNoticeList));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*********************** setter/getter方法 ***************************/

	public Result<SysNotice> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<SysNotice> pageResult) {
		this.pageResult = pageResult;
	}

	public Integer getThisId() {
		return thisId;
	}

	public void setThisId(Integer thisId) {
		this.thisId = thisId;
	}

	public String getThisIds() {
		return thisIds;
	}

	public void setThisIds(String thisIds) {
		this.thisIds = thisIds;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public File getImagey() {
		return imagey;
	}

	public void setImagey(File imagey) {
		this.imagey = imagey;
	}

	public String getImageyFileName() {
		return imageyFileName;
	}

	public void setImageyFileName(String imageyFileName) {
		this.imageyFileName = imageyFileName;
	}

	public String getImageyContentType() {
		return imageyContentType;
	}

	public void setImageyContentType(String imageyContentType) {
		this.imageyContentType = imageyContentType;
	}

	public List<SysNotice> getSysNoticeList() {
		return sysNoticeList;
	}

	public void setSysNoticeList(List<SysNotice> sysNoticeList) {
		this.sysNoticeList = sysNoticeList;
	}

	public ListStudent getStudent() {
		return student;
	}

	public void setStudent(ListStudent student) {
		this.student = student;
	}

	public ListTeacher getTeacherList() {
		return teacherList;
	}

	public void setTeacherList(ListTeacher teacherList) {
		this.teacherList = teacherList;
	}

	public String getThisType() {
		return thisType;
	}

	public void setThisType(String thisType) {
		this.thisType = thisType;
	}

	public Integer getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(Integer noticeId) {
		this.noticeId = noticeId;
	}

	public List<UserHelp> getUserHelpList() {
		return userHelpList;
	}

	public void setUserHelpList(List<UserHelp> userHelpList) {
		this.userHelpList = userHelpList;
	}

	public SysDepartment getSysDepartment() {
		return sysDepartment;
	}

	public void setSysDepartment(SysDepartment sysDepartment) {
		this.sysDepartment = sysDepartment;
	}

	public Integer getNewNum() {
		return newNum;
	}

	public void setNewNum(Integer newNum) {
		this.newNum = newNum;
	}

	public UserHelp getLoginUser() {
		return LoginUser;
	}

	public void setLoginUser(UserHelp loginUser) {
		LoginUser = loginUser;
	}
}