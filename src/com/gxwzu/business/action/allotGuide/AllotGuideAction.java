package com.gxwzu.business.action.allotGuide;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gxwzu.core.model.ResponeJson;
import com.gxwzu.core.util.SysConstant;
import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.guideCount.GuideCount;
import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.guideCount.IGuideCountSerivce;
import com.gxwzu.business.service.plan.IPlanProgressSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.business.service.teacherDirections.ITeacherDirectionsService;
import com.gxwzu.business.service.teacherMajor.ITeacherMajorService;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListAllotGuide;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListStudentAllotGuide;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.sysVO.ListTeacherGuideCount;
import com.gxwzu.sysVO.ListTeacherMajor;
import com.gxwzu.system.model.sysDirections.SysDirections;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysDirections.ISysDirectionsService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.gxwzu.system.service.userHelp.IUserHelpService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 指导老师分配
 *
 * @author 黎艺侠
 * @date 2017.7.10
 */
public class AllotGuideAction extends BaseAction implements ModelDriven<AllotGuide> {

    private static final long serialVersionUID = -3343014949806289390L;
    protected final Log logger = LogFactory.getLog(getClass());

    /*********************** 实例化ModelDriven ******************************/
    private AllotGuide model = new AllotGuide();

    @Override
    public AllotGuide getModel() {
        return model;
    }

    public void setModel(AllotGuide model) {
        this.model = model;
    }

    /*********************** Service接口注入 ***************************/
    @Autowired
    private IPlanYearSerivce planYearSerivce; // 年度计划接口
    @Autowired
    private IAllotGuideService allotGuideService; // 指导老师分配接口
    @Autowired
    private ISysDepartmentService sysDepartmentService; // 学院接口
    @Autowired
    private ISysMajorService sysMajorService; // 专业接口
    @Autowired
    private ISysStudentService sysStudentService; // 学生接口
    @Autowired
    private ISysTeacherService sysTeacherService; // 教师接口
    @Autowired
    private ISysDirectionsService sysDirectionsService; // 研究方向接口
    @Autowired
    private IGuideCountSerivce guideCountSerivce; // 老师可带学生个数接口
    @Autowired
    private ITeacherMajorService teacherMajorService; // 老师所带专业接口
    @Autowired
    private ITeacherDirectionsService teacherDirectionsService; // 老师研究方向接口
    @Autowired
    private IPlanProgressSerivce planProgressSerivce; // 进度计划接口
    @Autowired
    private IUserHelpService userHelpService;//用户接口

    /*********************** 实体 ***************************/
    private PlanYear planYear = new PlanYear(); // 年度计划实体
    private ListTeacher teacher = new ListTeacher(); // 老师实体
    private ListStudent student = new ListStudent();
    private PlanProgress planProgress = new PlanProgress();//进度计划实体
    /******************** 集合变量声明 *********************/
    private Result<ListTeacherGuideCount> pageResult; // 指导老师分页
    private Result<ListStudentAllotGuide> pageResult1; // 学生分页
    private ListStudentAllotGuide allotGuide = new ListStudentAllotGuide(); // 指导分配实体
    private ListTeacherGuideCount guideCount = new ListTeacherGuideCount();// 老师所带实体
    private List<ListStudentAllotGuide> allotStudentList = new ArrayList<ListStudentAllotGuide>();
    private List<ListAllotGuide> listAllotGuide = new ArrayList<ListAllotGuide>();

    private List<UserHelp> userHelpList = new ArrayList<UserHelp>(); //用户信息列表（用于查询全部）;
    private List<SysMajor> sysMajorList = new ArrayList<SysMajor>(); // 专业信息列表（用于查询全部）
    private List<SysDirections> sysDirectionList = new ArrayList<SysDirections>(); // 研究方向信息列表（用于查询全部）
    private List<ListTeacherMajor> teacherMajorList = new ArrayList<ListTeacherMajor>(); // 老师所带专业信息列表（用于查询全部）

    /************************** 基础变量声明 **************/
    private Integer thisId;
    private String mark;
    private String thisIds;
    private Integer majorId;
    private String teacherName;
    private String stuName;
    private String deptNumber;
    private String tabFlag;
    private String flag;

    /************************** 方法类 **************************************************************************************/
    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }

    /**
     * 指导老师分配显示列表
     *
     * @return deptName 学院名称 sysMajorList 专业集合 pageResult 指导老师/学生集合
     * allotGuideList 已选老师/学生集合
     * @author 黎艺侠
     */
    public String list() {
        logger.info("到这里了");
        return SUCCESS;
    }

    /**
     * 检查是否在操作时间内
     *
     * @return
     */
    public void checkTime() throws IOException {
        PrintWriter out = getResponse().getWriter();
        ResponeJson rJson = new ResponeJson();
        Integer result = 0;//0:false 1:true

        //登录名称 :查询学院
        String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
        //用户类型：1-学生 2-老师
        String userType = (String) getSession().getAttribute(SystemContext.USERTYPE);
        if ("1".equals(userType) || "3".equals(userType)) {
            student = sysStudentService.findByStuNo(loginName);
            planProgress = planProgressSerivce.findByStudMajoId(student.getMajorId(), "01");
        }
        //查询 当前老师所属专业教研室 中的进度计划
        if ("2".equals(userType) || "3".equals(userType)) {
            teacher = sysTeacherService.findByTeacherNo(loginName);
            planProgress = planProgressSerivce.findByTeacStaffroomId(teacher.getStaffroomId(), "01");
        }
        Timestamp d = new Timestamp(System.currentTimeMillis());
        if (planProgress != null && planProgress.getStartTime() != null && d.after(planProgress.getStartTime())&&planProgress.getProgressStart()==1) {
            result = 1;
        }

        rJson.setSuccess(true);
        rJson.setObj(result);
        out.print(new Gson().toJson(rJson));
        out.flush();
        out.close();
    }

    /**
     * 查询分配老師列表
     *
     * @return
     */
    public String allotTeacherList() {

        //登录名称 :查询学院
        String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
        //用户类型：1-学生 2-老师
        String userType = (String) getSession().getAttribute(SystemContext.USERTYPE);

        /************************** 查询教研室信息 *********************************************/


        //查询 当前学生所属专业教研室  进度计划
        if (flag != null && "01".equals(flag)) {
            try {
                if (SystemContext.USER_STUDENT_TYPE.equals(userType) || SystemContext.USER_ADMIN_TYPE.equals(userType)) {
                    student = sysStudentService.findByStuNo(loginName);
                    planProgress = planProgressSerivce.findByStudMajoId(student.getMajorId(), flag);
                }
                //查询 当前老师所属专业教研室 中的进度计划
                if (SystemContext.USER_TEACHER_TYPE.equals(userType) || SystemContext.USER_ADMIN_TYPE.equals(userType)) {
                    teacher = sysTeacherService.findByTeacherNo(loginName);
                    planProgress = planProgressSerivce.findByTeacStaffroomId(teacher.getStaffroomId(), flag);
                }
                Timestamp d = new Timestamp(System.currentTimeMillis());

                logger.info("查询分配老師列表");
                try {
                    /* 专业编号 */
                    List<Integer> majorIds = new ArrayList<Integer>();
                    // 查询安排计划中的年度
                    planYear = planYearSerivce.findPlanYear();
                    if (SystemContext.USER_STUDENT_TYPE.equals(userType)) {
                        student = sysStudentService.findByStuNo(loginName);
                        // 默认筛选学生所在专业的专业老师
                        if (majorId == null) {
                            majorIds.add(student.getMajorId());
                        } else {
                            majorIds.add(majorId);
                        }
                        // 查询所带专业
                        sysMajorList.add(sysMajorService.findById(student.getMajorId()));

                        /*************************** 学生选指导老师查询所带老师 ***************************/

                        if (teacherName != null) guideCount.setTeacherName(teacherName);
                        guideCount.setDeptNumber(student.getDeptNumber());
                        if (allotGuide.getYear() == null&&planYear!=null)
                            guideCount.setYear(planYear.getYear());
                        // 分页查询可分配老师信息
                        pageResult = allotGuideService.findTeacherList(guideCount, majorIds, getPage(), getRow());
                        footer = PageUtil.pageFooter(pageResult, getRequest());
                        // 老师所带专业信息
                        teacherMajorList = teacherMajorService.findByMajorId(student.getMajorId());
                        // 查询指导老师信息
                        model = allotGuideService.findByStuIdAndYear(student.getStuId(), allotGuide.getYear());
                        if (model != null) teacher = sysTeacherService.findModelById(model.getTeacherId());
                    }
                    // 页面显示专业下拉框信息
                    sysMajorList = sysMajorService.findAllSysMajorList();
                    sysDirectionList = sysDirectionsService.findAll();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return SUCCESS;
            } catch (Exception e) {
                e.printStackTrace();
                return SUCCESS;
            }
        } else {
            return SUCCESS;
        }
    }

    /**
     * 查询可选学生列表
     *
     * @return
     */
    public String allotStudentList() {

        /* 登录名称 :查询学院 */
        String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
        /* 用户类型：1-学生 2-老师 */
        String userType = (String) getSession().getAttribute(SystemContext.USERTYPE);
        /************************** 查询教研室信息 *********************************************/
        //查询 当前学生所属专业教研室  进度计划
        if (flag != null && "01".equals(flag)) {
            if ("1".equals(userType)) {
                student = sysStudentService.findByStuNo(loginName);
                planProgress = planProgressSerivce.findByStudMajoId(student.getMajorId(), flag);
            }
            //查询 当前老师所属专业教研室 中的进度计划
            if ("2".equals(userType)) {
                teacher = sysTeacherService.findByTeacherNo(loginName);
                planProgress = planProgressSerivce.findByTeacStaffroomId(teacher.getStaffroomId(), flag);
            }
            Timestamp d = new Timestamp(System.currentTimeMillis());
//					if(planProgress!=null&&planProgress.getStartTime()!=null&&d.after(planProgress.getStartTime())){
            logger.info(" 查询可分配学生列表");//TODO:待修复当前教师所属的教研室未设置进度安排
            try {
                /* 专业编号 */
                List<Integer> majorIds = new ArrayList<Integer>();

                // 查询安排计划中的年度
                planYear = planYearSerivce.findPlanYear();

                if (userType.equals("2")) {
                    teacher = sysTeacherService.findByTeacherNo(loginName);

                    // 找出老师所带的专业学生
                    for (ListTeacherMajor sMajor : teacherMajorList) {
                        majorIds.add(sMajor.getMajorId());
                    }
                    /*************************** 指导老师选学生查询所带学生 ***************************/
                    allotGuide.setDeptNumber(deptNumber);

                    if (stuName != null) {
                        allotGuide.setStuName(stuName);
                    }
                    //教师查询已经选取
//                    if (teacher.getStaffroomId() != null && !tabFlag.equals("01")) {
//                        allotGuide.setMajorId(teacher.getStaffroomId());
//                    }
                    //查询未选取
                    if (majorId!=null){
                        allotGuide.setMajorId(majorId);
                    }


                    if (allotGuide.getYear() == null) {
                        allotGuide.setYear(planYear.getYear());
                    }
                    // 老師可帶人數
                    guideCount = getTeacherGuideCount(loginName);
                    //教师id
                    allotGuide.setTeacherId(teacher.getTeacherId());
                    //老师所带专业
                    teacherMajorList = teacherMajorService.findByTeacherId(teacher.getTeacherId());
                    //查询
                    pageResult1 = allotGuideService.findStudentByDeptAndMajor(allotGuide, majorIds,tabFlag, getPage(), getRow());

                    footer = PageUtil.pageFooter(pageResult1, getRequest());

                    // 查询已分配学生的信息
//                    allotStudentList = allotGuideService.findStudentsByTeacherIdAndYear(teacher.getTeacherId(),allotGuide.getYear());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return SUCCESS;
        } else {
            return SUCCESS;
        }
    }

    /**
     * 获取老师所带学生指导个数（内部方法调用）
     */
    private ListTeacherGuideCount getTeacherGuideCount(String loginName) {
        ListTeacherGuideCount lCount = new ListTeacherGuideCount();
        GuideCount guideCount = new GuideCount();
        guideCount.setGuideTeachId(teacher.getTeacherId());
        guideCount.setYear(planYearSerivce.findPlanYear().getYear());
        List<GuideCount> gclist = guideCountSerivce.findByExample(guideCount);
        if (gclist != null && gclist.size() != 0) {
            lCount.setGuideCount(gclist.get(0));
        }
        return lCount;
    }

    /**
     * 选择指导学生
     *
     * @return
     * @throws IOException
     */
    public void addStudent() {
        try {
            List<String> failList = new ArrayList<String>();
            PrintWriter out = getResponse().getWriter();
            // 获取安排计划年度
            planYear = planYearSerivce.findPlanYear();
            /* 用户类型：1-学生 2-老师 */
            String userType = (String) getSession().getAttribute(
                    SystemContext.USERTYPE);

            if (thisIds != null && "2".equals(userType)) {
                String loginName = (String) getSession().getAttribute(
                        SystemContext.LOGINNAME);
                model.setOpTime(new Date());
                planYear = planYearSerivce.findPlanYear();
                ListTeacher sysTeacher = sysTeacherService
                        .findByTeacherNo(loginName);
                String[] thisIDs = thisIds.split(",");
                for (String stuId : thisIDs) {
                    // 查找指导分配中的学生是否存在指导老师
                    AllotGuide aGuide = allotGuideService.findByStuIdAndYear(
                            Integer.parseInt(stuId), planYear.getYear());
                    if (aGuide == null) {
                        // 添加指导老师 所带学生
                        try {
                            model = new AllotGuide();
                            model.setTeacherId(sysTeacher.getTeacherId());
                            model.setYear(planYear.getYear());
                            model.setStuId(Integer.parseInt(stuId));
                            model.setTeacherId(model.getTeacherId());
                            model.setOpTime(new Date());
                            allotGuideService.add(model);
                        } catch (Exception e) {
                            failList.add(stuId);
                            e.printStackTrace();
                        }
                    } else {
                        failList.add(stuId);
                    }
                }
            } else {
                failList.add("");
            }
            out.print(new Gson().toJson(failList));
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 学生选择指导老师
     *
     * @return
     * @throws IOException
     */
    public void addTeacher() {
        try {
            boolean idTrue = false;
            boolean idAdd = false;
            PrintWriter out = getResponse().getWriter();
            planYear = planYearSerivce.findPlanYear();// 获取安排计划年度
            /* 用户类型：1-学生 2-老师 */
            String userType = (String) getSession().getAttribute(SystemContext.USERTYPE);
            if ("1".equals(userType)) {
                String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
                model.setOpTime(new Date());
                planYear = planYearSerivce.findPlanYear();
                model.setYear(planYear.getYear());

                if (model.getTeacherId() != null) {
                    //添加学生所选指导老师
                    ListStudent sysStudent = sysStudentService.findByStuNo(loginName);
                    model.setStuId(sysStudent.getStuId());
                    model.setTeacherId(model.getTeacherId());
                    idAdd = true;
                }
                if (idAdd) {
                    model = allotGuideService.add(model);
                    if (model.getId() != null) {
                        idTrue = true;
                    }
                }
            }
            out.print(idTrue);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 退选信息
     *
     * @return
     * @throws IOException
     */
    public void del() {
        try {
            List<String> failList = new ArrayList<String>();
            PrintWriter out = getResponse().getWriter();
            if (thisIds != null) {
                String[] thisIDs = thisIds.split(",");
                for (String stuId : thisIDs) {
                    try {
                        allotGuideService.del(Integer.parseInt(stuId));
                    } catch (Exception e) {
                        failList.add(stuId);
                        e.printStackTrace();
                    }
                }
            } else {
                failList.add("");
            }
            out.print(new Gson().toJson(failList));
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /********************************************** getter and setter方法 ************************************************************************/
    public IAllotGuideService getAllotGuideService() {
        return allotGuideService;
    }

    public void setAllotGuideService(IAllotGuideService allotGuideService) {
        this.allotGuideService = allotGuideService;
    }

    public Result<ListTeacherGuideCount> getPageResult() {
        return pageResult;
    }

    public void setPageResult(Result<ListTeacherGuideCount> pageResult) {
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

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    public Log getLogger() {
        return logger;
    }

    public ISysDepartmentService getSysDepartmentService() {
        return sysDepartmentService;
    }

    public void setSysDepartmentService(
            ISysDepartmentService sysDepartmentService) {
        this.sysDepartmentService = sysDepartmentService;
    }

    public ISysMajorService getSysMajorService() {
        return sysMajorService;
    }

    public void setSysMajorService(ISysMajorService sysMajorService) {
        this.sysMajorService = sysMajorService;
    }

    public List<SysMajor> getSysMajorList() {
        return sysMajorList;
    }

    public void setSysMajorList(List<SysMajor> sysMajorList) {
        this.sysMajorList = sysMajorList;
    }

    public ISysStudentService getSysStudentService() {
        return sysStudentService;
    }

    public void setSysStudentService(ISysStudentService sysStudentService) {
        this.sysStudentService = sysStudentService;
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

    public ListStudent getStudent() {
        return student;
    }

    public void setStudent(ListStudent student) {
        this.student = student;
    }

    public ISysTeacherService getSysTeacherService() {
        return sysTeacherService;
    }

    public void setSysTeacherService(ISysTeacherService sysTeacherService) {
        this.sysTeacherService = sysTeacherService;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public Result<ListStudentAllotGuide> getPageResult1() {
        return pageResult1;
    }

    public void setPageResult1(Result<ListStudentAllotGuide> pageResult1) {
        this.pageResult1 = pageResult1;
    }

    public ListTeacherGuideCount getGuideCount() {
        return guideCount;
    }

    public void setGuideCount(ListTeacherGuideCount guideCount) {
        this.guideCount = guideCount;
    }

    public Integer getMajorId() {
        return majorId;
    }

    public void setMajorId(Integer majorId) {
        this.majorId = majorId;
    }

    public PlanYear getPlanYear() {
        return planYear;
    }

    public void setPlanYear(PlanYear planYear) {
        this.planYear = planYear;
    }

    public List<ListTeacherMajor> getTeacherMajorList() {
        return teacherMajorList;
    }

    public void setTeacherMajorList(List<ListTeacherMajor> teacherMajorList) {
        this.teacherMajorList = teacherMajorList;
    }

    public String getDeptNumber() {
        return deptNumber;
    }

    public void setDeptNumber(String deptNumber) {
        this.deptNumber = deptNumber;
    }

    public ListTeacher getTeacher() {
        return teacher;
    }

    public void setTeacher(ListTeacher teacher) {
        this.teacher = teacher;
    }

    public List<SysDirections> getSysDirectionList() {
        return sysDirectionList;
    }

    public void setSysDirectionList(List<SysDirections> sysDirectionList) {
        this.sysDirectionList = sysDirectionList;
    }

    public String getThisIds() {
        return thisIds;
    }

    public void setThisIds(String thisIds) {
        this.thisIds = thisIds;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public List<ListAllotGuide> getListAllotGuide() {
        return listAllotGuide;
    }

    public void setListAllotGuide(List<ListAllotGuide> listAllotGuide) {
        this.listAllotGuide = listAllotGuide;
    }

    public PlanProgress getPlanProgress() {
        return planProgress;
    }

    public void setPlanProgress(PlanProgress planProgress) {
        this.planProgress = planProgress;
    }

    public List<UserHelp> getUserHelpList() {
        return userHelpList;
    }

    public void setUserHelpList(List<UserHelp> userHelpList) {
        this.userHelpList = userHelpList;
    }

    @Override
    public String getTabFlag() {
        return tabFlag;
    }

    @Override
    public void setTabFlag(String tabFlag) {
        this.tabFlag = tabFlag;
    }
}
