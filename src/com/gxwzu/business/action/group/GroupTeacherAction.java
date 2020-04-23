package com.gxwzu.business.action.group;

import java.io.File;
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

import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.group.GroupAllot;
import com.gxwzu.business.model.group.GroupTeacher;
import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.group.IGroupAllotService;
import com.gxwzu.business.service.group.IGroupTeacherService;
import com.gxwzu.business.service.plan.IPlanProgressSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.DateUtils;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListAllotGuide;
import com.gxwzu.sysVO.ListGroupAllot;
import com.gxwzu.sysVO.ListGroupTeacher;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.system.model.sysCategory.SysCategory;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.service.sysCategory.ISysCategoryService;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 老师分组
 */
public class GroupTeacherAction extends BaseAction implements ModelDriven<GroupTeacher> {

    private static final long serialVersionUID = -3343014949806289390L;
    protected final Log logger = LogFactory.getLog(getClass());

    /*********************** 实例化ModelDriven ******************************/
    private GroupTeacher model = new GroupTeacher();
    private ListGroupAllot groupAllot = new ListGroupAllot();
    private ListGroupTeacher listGroupTeacher = new ListGroupTeacher();
    private PlanYear planYear; // 年度计划实体
    private GroupTeacher groupTeacher = new GroupTeacher();
    private AllotGuide allotGuide = new AllotGuide();
    private ListTeacher teacher = new ListTeacher();

    @Override
    public GroupTeacher getModel() {
        return model;
    }

    public void setModel(GroupTeacher model) {
        this.model = model;
    }

    /*********************** 注入Service ******************************/
    @Autowired
    private IPlanYearSerivce planYearSerivce; // 年度计划接口
    @Autowired
    private IGroupAllotService groupAllotService;
    @Autowired
    private IGroupTeacherService groupTeacherService;
    @Autowired
    private ISysTeacherService sysTeacherService; // 老师
    @Autowired
    private IAllotGuideService allotGuideService; // 指导老师分配接口
    @Autowired
    private ISysDepartmentService sysDepartmentService;// 学院接口注入
    @Autowired
    private ISysCategoryService sysCategoryService; // 大类
    @Autowired
    private ISysMajorService sysMajorService; // 专业教研室
    @Autowired
    private IPlanProgressSerivce planProgressSerivce; // 进度计划接口
    @Autowired
    private ISysStudentService sysStudentService; // 学生接口
    /*********************** 声明列表参数 ******************************/
    private Result<ListGroupTeacher> pageResult; // 分组集合
    private List<ListAllotGuide> allotGuideList; // 指导老师分配信息列表（用于查询全部）

    private List<SysCategory> sysCategoryList = new ArrayList<SysCategory>();
    private List<SysDepartment> sysDepartmentList = new ArrayList<SysDepartment>();
    private Map<Integer, SysTeacher> sysTeacherList = new HashMap<Integer, SysTeacher>(); // 临时存储已选教师列表
    private List<ListGroupAllot> groupAllotList = new ArrayList<ListGroupAllot>(); // 分组列表
    private List<SysMajor> sysMajorList = new ArrayList<SysMajor>(); //专业教研室
    private List<SysMajor> majorList = new ArrayList<SysMajor>();
    private ListStudent student = new ListStudent(); // 学生实体
    private PlanProgress planProgress = new PlanProgress();//进度计划实体
    private ListTeacher lTeacher = new ListTeacher(); // 老师实体
    /*********************** 声明参数 ******************************/
    private Integer thisId;
    private String mark;
    private String teacherIdArry;
    private String allGroupName;

    private Integer thisTeacherId; // 分组老师Id
    private String teachType; // 分组老师类型
    private Integer thisGroupId; // 分组Id
    private Integer thisYear; // 年度
    private String flag;
    // 导入excel
    private List<File> excelFile;

    /************************** 方法类 **************************/
    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }

    /**
     * 教师分组显示列表
     *
     * @return
     */
    public String list() {

        String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
        String userType = (String) getSession().getAttribute(SystemContext.USERTYPE);
        /************************** 查询教研室信息 *********************************************/
        //查询 当前学生所属专业教研室  进度计划
        if (flag != null && "08".equals(flag)) {
            if (SystemContext.USER_STUDENT_TYPE.equals(userType)) {
                student = sysStudentService.findByStuNo(loginName);
                planProgress = planProgressSerivce.findByStudMajoId(student.getMajorId(), flag);
            }
            //查询 当前老师所属专业教研室 中的进度计划
            if (SystemContext.USER_TEACHER_TYPE.equals(userType)) {
                lTeacher = sysTeacherService.findByTeacherNo(loginName);
                planProgress = planProgressSerivce.findByTeacStaffroomId(lTeacher.getStaffroomId(), flag);
            }
            Timestamp d = new Timestamp(System.currentTimeMillis());
            if (planProgress != null && planProgress.getStartTime() != null && d.after(planProgress.getStartTime())) {
                logger.info("给教师分组列表");
                try {
                    //查询安排计划年度
                    planYear = planYearSerivce.findPlanYear();

                    /*************************** 三级查询，通学院编号查询学院 start ***************************/
                    sysDepartmentList = sysDepartmentService.findAllSysDepartmentList();

                    if (SystemContext.USER_TEACHER_TYPE.equals(userType)) {
                        teacher = sysTeacherService.findByTeacherNo(loginName);

                        if (StringUtils.isEmpty(listGroupTeacher.getDeptNumber())) {
                            listGroupTeacher.setDeptNumber(teacher.getDeptNumber());
                        }
                    }
                    sysCategoryList = sysCategoryService.findByDeptNumber(listGroupTeacher.getDeptNumber());
                    sysMajorList = sysMajorService.findByCategoryId(listGroupTeacher.getCategoryId());
                    /*************************** 三级查询，通学院编号查询学院 end ***************************/

                    if (listGroupTeacher.getYear() == null) {
                        listGroupTeacher.setYear(planYear.getYear()); //默认安排年度
                    }
                    if (listGroupTeacher.getGroupType() == null) {
                        listGroupTeacher.setGroupType(SystemContext.REPLY_TYPE_SMALL_GROUP); //默认为答辩组
                    }
                    /*************************** end *******************************************/
                    pageResult = groupTeacherService.find(listGroupTeacher, getPage(), getRow());

                    footer = PageUtil.pageFooter(pageResult, getRequest());

                    /************************************分组信息******************************************/
                    groupAllotList = groupAllotService.findByGroupTypeAndYear(listGroupTeacher.getGroupType(), listGroupTeacher.getYear());
                    //分组详细信息
                    if (model.getGroupAllotId() != null) {
                        groupAllot = groupAllotService.findViewModelById(model.getGroupAllotId());
                    }
                    majorList = sysMajorService.findByDeptNumber(listGroupTeacher.getDeptNumber());
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
     * 添加老师信息数组
     *
     * @return
     * @throws IOException
     */
    public void addTeacherGroup() {
        logger.info("添加教师答辩组:");
        boolean idTrue = false;
        try {
            PrintWriter out = getResponse().getWriter();
            if (thisTeacherId != null && teachType != null && thisGroupId != null) {
                planYear = planYearSerivce.findPlanYear();
                // 先通过组id查询分组信息
                GroupAllot groupAllot = groupAllotService.findById(thisGroupId);

                // 如果分组为空 则添加分组信息
                if (groupAllot != null) {
                    // 获取分组年度
                    model.setYear(groupAllot.getYear());
                    // 检查分组老师 中有没有存在当前所选类型 的老师
                    List<ListGroupTeacher> gTeacher = null;
                    //组长 跟记录员只有一个可以多个
                    if (!teachType.equals("1")) {  //0-组长 1-答辩老师  2-记录员
                        gTeacher = groupTeacherService.findByGroupIdAndTypeAndYear(thisGroupId, teachType, planYear.getYear());
                    }
                    // 添加分组老师 如果组没有该类型的老师则添加
                    if (gTeacher == null) {
                        groupTeacher.setYear(model.getYear());
                        groupTeacher.setGroupAllotId(thisGroupId);
                        groupTeacher.setTeacherId(thisTeacherId);
                        groupTeacher.setType(teachType);
                        groupTeacher.setOpTime(Timestamp.valueOf(DateUtils.formatTime(new Date())));
                        groupTeacher = groupTeacherService.add(groupTeacher);

                        // 如果getId不为则 添加成功
                        if (groupTeacher.getId() != null) {
                            idTrue = true;
                            if ("01".equals(groupAllot.getFirstDefense())) {
                                groupAllot.setFirstDefense("00");
                                groupAllotService.update(groupAllot);
                            }
                        }
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


    /**
     * 删除已选教师信息
     *
     * @return
     * @throws IOException
     */
    public void delSelTeacher() throws Exception {
        logger.info("删除分组已选教师");
        boolean idTrue = false;
        PrintWriter out = getResponse().getWriter();
        if (thisTeacherId != null && thisYear != null && thisGroupId != null) {
            ListGroupTeacher gTeacher = groupTeacherService.findByGroupAllotIdAndTeacherIdAndYear(thisGroupId, thisTeacherId, thisYear);

            if (gTeacher != null) {
                groupTeacherService.del(gTeacher.getId());
                idTrue = true;
            }

        }
        out.print(idTrue);
        out.flush();
        out.close();
    }

    /***************************** get/set方法 *******************************/

    public AllotGuide getAllotGuide() {
        return allotGuide;
    }

    public void setAllotGuide(AllotGuide allotGuide) {
        this.allotGuide = allotGuide;
    }

    public List<ListAllotGuide> getAllotGuideList() {
        return allotGuideList;
    }

    public void setAllotGuideList(List<ListAllotGuide> allotGuideList) {
        this.allotGuideList = allotGuideList;
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

    public List<File> getExcelFile() {
        return excelFile;
    }

    public void setExcelFile(List<File> excelFile) {
        this.excelFile = excelFile;
    }

    public Log getLogger() {
        return logger;
    }

    public GroupTeacher getGroupTeacher() {
        return groupTeacher;
    }

    public void setGroupTeacher(GroupTeacher groupTeacher) {
        this.groupTeacher = groupTeacher;
    }

    public String getTeacherIdArry() {
        return teacherIdArry;
    }

    public void setTeacherIdArry(String teacherIdArry) {
        this.teacherIdArry = teacherIdArry;
    }

    public Map<Integer, SysTeacher> getSysTeacherList() {
        return sysTeacherList;
    }

    public void setSysTeacherList(Map<Integer, SysTeacher> sysTeacherList) {
        this.sysTeacherList = sysTeacherList;
    }

    public PlanYear getPlanYear() {
        return planYear;
    }

    public void setPlanYear(PlanYear planYear) {
        this.planYear = planYear;
    }

    public List<SysDepartment> getSysDepartmentList() {
        return sysDepartmentList;
    }

    public void setSysDepartmentList(List<SysDepartment> sysDepartmentList) {
        this.sysDepartmentList = sysDepartmentList;
    }

    public List<SysCategory> getSysCategoryList() {
        return sysCategoryList;
    }

    public void setSysCategoryList(List<SysCategory> sysCategoryList) {
        this.sysCategoryList = sysCategoryList;
    }

    public List<ListGroupAllot> getGroupAllotList() {
        return groupAllotList;
    }

    public void setGroupAllotList(List<ListGroupAllot> groupAllotList) {
        this.groupAllotList = groupAllotList;
    }

    public String getAllGroupName() {
        return allGroupName;
    }

    public void setAllGroupName(String allGroupName) {
        this.allGroupName = allGroupName;
    }

    public ListGroupTeacher getListGroupTeacher() {
        return listGroupTeacher;
    }

    public void setListGroupTeacher(ListGroupTeacher listGroupTeacher) {
        this.listGroupTeacher = listGroupTeacher;
    }

    public Result<ListGroupTeacher> getPageResult() {
        return pageResult;
    }

    public void setPageResult(Result<ListGroupTeacher> pageResult) {
        this.pageResult = pageResult;
    }

    public Integer getThisTeacherId() {
        return thisTeacherId;
    }

    public void setThisTeacherId(Integer thisTeacherId) {
        this.thisTeacherId = thisTeacherId;
    }

    public String getTeachType() {
        return teachType;
    }

    public void setTeachType(String teachType) {
        this.teachType = teachType;
    }

    public Integer getThisGroupId() {
        return thisGroupId;
    }

    public void setThisGroupId(Integer thisGroupId) {
        this.thisGroupId = thisGroupId;
    }

    public Integer getThisYear() {
        return thisYear;
    }

    public void setThisYear(Integer thisYear) {
        this.thisYear = thisYear;
    }

    public List<SysMajor> getSysMajorList() {
        return sysMajorList;
    }

    public void setSysMajorList(List<SysMajor> sysMajorList) {
        this.sysMajorList = sysMajorList;
    }

    public ListGroupAllot getGroupAllot() {
        return groupAllot;
    }

    public void setGroupAllot(ListGroupAllot groupAllot) {
        this.groupAllot = groupAllot;
    }

    public ListTeacher getTeacher() {
        return teacher;
    }

    public void setTeacher(ListTeacher teacher) {
        this.teacher = teacher;
    }

    public List<SysMajor> getMajorList() {
        return majorList;
    }

    public void setMajorList(List<SysMajor> majorList) {
        this.majorList = majorList;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

}
