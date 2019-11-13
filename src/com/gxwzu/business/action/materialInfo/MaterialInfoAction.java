package com.gxwzu.business.action.materialInfo;

import java.sql.Timestamp;
import java.util.*;

import com.gxwzu.business.model.defenseRecord.DefenseRecord;
import com.gxwzu.business.model.progressSitu.ProgressSitu;
import com.gxwzu.business.model.review.ReviewScore;
import com.gxwzu.business.service.defenseRecord.IDefenseRecordService;
import com.gxwzu.business.service.issueInfo.IIssueInfoSerivce;
import com.gxwzu.business.service.openReport.IOpenReportSerivce;
import com.gxwzu.business.service.openReport.impl.OpenReportServiceImpl;
import com.gxwzu.business.service.progressSitu.IProgressSituSerivce;
import com.gxwzu.business.service.replyScore.IReplyScoreSerivce;
import com.gxwzu.business.service.review.IReviewSerivce;
import com.gxwzu.business.service.taskBook.ITaskBookSerivce;
import com.gxwzu.core.util.WordUtils;
import com.gxwzu.sysVO.*;
import com.gxwzu.system.service.sysTechnical.ISysTechnicalService;
import com.gxwzu.util.ExportDocUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
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
public class MaterialInfoAction extends BaseAction implements ModelDriven<MaterialInfo> {

    private static final long serialVersionUID = -3343014949806289390L;
    protected final Log logger = LogFactory.getLog(getClass());

    /*********************** 实例化ModelDriven ******************************/
    private MaterialInfo model = new MaterialInfo();
    private Integer thisStuId;

    private String thisIds;//批量导出过程文档ids

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
    private ISysTechnicalService iSysTechnicalService;//
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
    private IIssueInfoSerivce issueInfoService;//课题
    @Autowired
    private IGroupTeacherService groupTeacherService; // 老师分组接口
    @Autowired
    private ITeacherDirectionsService teacherDirectionsService; // 老师研究接口
    @Autowired
    private ISysDutiesService sysDutiesService; // 老师分组接口
    @Autowired
    private ISysFileTypeService sysFileTypeService; //文件类型接口
    @Autowired
    private IProgressSituSerivce progressSituSerivce;//进展情况
    @Autowired
    private ITaskBookSerivce iTaskBookSerivce;//任务书
    @Autowired
    private IOpenReportSerivce iOpenReportSerivce;//开题报告
    @Autowired
    private IReviewSerivce iReviewSerivce;//论文评阅
    @Autowired
    private IDefenseRecordService iDefenseRecordService;//答辩过程
    @Autowired
    private IReplyScoreSerivce iReplyScoreSerivce;//评语及成绩



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
    private Result<ListProgressSitu> pageResult1; // 学生相关材料分页
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

    private String templetePath;
    private String fileName;
    private String filePath;
    private String zipPath;

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
                guideStudentList = materialInfoSerivce.findGuideStudent(teacher.getTeacherId(), model.getYear());

                //指导老师查询自己所在教研室进度计划信息
                if (teacher.getStaffroomId() == null)
                    teacher.setStaffroomId(-1);
                planProgressList = planProgressSerivce.findByMajorAndYear(teacher.getStaffroomId(), model.getYear());

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
        String type = (String) getSession().getAttribute(SystemContext.USERTYPE);
        String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);

        if (flag != null && "13".equals(flag)) {
            // 查询 当前老师所属专业教研室 中的进度计划
            if (SystemContext.USER_TEACHER_TYPE.equals(type)) {
                teacher = sysTeacherService.findByTeacherNo(loginName);
                planProgress = planProgressSerivce.findByTeacStaffroomId(teacher.getStaffroomId(), flag);
            }
            Timestamp d = new Timestamp(System.currentTimeMillis());
            if (planProgress != null && planProgress.getStartTime() != null && d.after(planProgress.getStartTime())) {
                logger.info("老师查询所在组已分配评阅的学生信息");
                try {
                    // 老师查询学生课题信息
                    if (SystemContext.USER_TEACHER_TYPE.equals(type)) {
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
                        if (SystemContext.REPLY_TYPE_SMALL_GROUP.equals(thisReplyType)){//答辩组
                            pageResult = materialInfoSerivce.findGroupStudent(groupAllotId,thisReplyType, model.getYear(), getPage(), getRow());
                        }else if (SystemContext.REPLY_TYPE_BIG_GROUP.equals(thisReplyType)){//大组
                            pageResult = materialInfoSerivce.findGroupStudent(groupAllotId,thisReplyType, model.getYear(), getPage(), getRow());
                        }else {//默认答辩组
                            pageResult = materialInfoSerivce.findGroupStudent(groupAllotId,thisReplyType, model.getYear(), getPage(), getRow());
                        }
                        footer = PageUtil.pageFooter(pageResult, getRequest());
                        //指导老师查询自己所在教研室进度计划信息
                        if (teacher.getStaffroomId() == null) teacher.setStaffroomId(-1);
                        planProgressList = planProgressSerivce.findByMajorAndYear(teacher.getStaffroomId(), model.getYear());
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
     * 老师查询所在答辩组——已分配评阅的学生信息
     *
     * @return
     */
    public String groupDefenseStudentList() {

        String type = (String) getSession().getAttribute(SystemContext.USERTYPE);
        String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);

        /************************** 查询教研室信息 *********************************************/
        if (flag != null && "13".equals(flag)) {
            // 查询 当前老师所属专业教研室 中的进度计划
            if ("2".equals(type)) {
                teacher = sysTeacherService.findByTeacherNo(loginName);
                planProgress = planProgressSerivce.findByTeacStaffroomId(teacher.getStaffroomId(), flag);
            }
            Timestamp d = new Timestamp(System.currentTimeMillis());
            if (planProgress != null && planProgress.getStartTime() != null && d.after(planProgress.getStartTime())) {
                logger.info("老师查询所在组已分配评阅的学生信息");
                try {
                    // 老师查询学生课题信息
                    if (SystemContext.USER_TEACHER_TYPE.equals(type)) {
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

                        if (model.getTeacherId() == null) {
                            model.setTeacherId(teacher.getTeacherId());
                        }
                        List<ListGroupTeacher> gTeacherList = groupTeacherService.findByTeacherIdAndYear(model.getTeacherId(), model.getYear());
                        //查询教师所在分组
                        ListGroupTeacher gTeacher = null;
                        if (gTeacherList != null) {
                            for (int i = 0; i < gTeacherList.size(); i++) {
                                Integer gId = gTeacherList.get(i).getGroupAllotId();
                                GroupAllot gAllot = groupAllotService.findById(gId);
                                if (thisReplyType.equals(gAllot.getGroupType())) { //普通组
                                    gTeacher = gTeacherList.get(i);
                                    break;
                                }
                            }
                        }
                        groupAllot = groupAllotService.findViewModelById(gTeacher.getGroupAllotId());

                        if ("00".equals(groupAllot.getFirstDefense()))groupStudentService.updateAutoAllotTeacher(groupAllot);
                        //老师查询所在组的学生信息
                        pageResult = materialInfoSerivce.findGroupDefenseStudent(gTeacher.getGroupAllotId(), gTeacher.getTeacherId(), model.getYear(), getPage(), getRow());
                        footer = PageUtil.pageFooter(pageResult, getRequest());
                        //指导老师查询自己所在教研室进度计划信息
                        if (teacher.getStaffroomId() == null) teacher.setStaffroomId(-1);
                        planProgressList = planProgressSerivce.findByMajorAndYear(teacher.getStaffroomId(), model.getYear());

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
     * 学生个人查询学生相关材料信息
     *
     * @return
     */
    public String info() {
        try {
            String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
            String type = (String) getSession().getAttribute(SystemContext.USERTYPE);

            logger.info("当前用户：" + loginName + "||用户类型：" + type);

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
                    AllotGuide aGuide = allotGuideService.findByStuIdAndYear(model.getStuId(), model.getYear());
                    teacher = sysTeacherService.findModelById(aGuide.getTeacherId());
                    // 老师研究方向
                    teacherDirectionsList = teacherDirectionsService.findByTeacherId(teacher.getTeacherId());
                }
                /************************** 查询分组信息 *********************************************/
                if (model.getStuId() != null && model.getYear() != null) {
                    ListGroupStudent gStudent = groupStudentService.findByStuIdAndYear(model.getStuId(), model.getYear());
                    if (gStudent != null) {
                        groupAllot = groupAllotService.findViewModelById(gStudent.getGroupAllotId());
                    }
                }
                pageResult = materialInfoSerivce.find(model, getPage(), getRow());
                footer = PageUtil.pageFooter(pageResult, getRequest());
                //课题类型
                issueTypeList = sysIssueTypeService.findAll(SysIssueType.class);
                allotGuideList = allotGuideService.findByLoginName(allotGuide);
                //加载文件类型个数
                fileTypeList = sysFileTypeService.findAll(SysFileType.class);
                if (fileTypeList != null) {
                    fileTypeSize = fileTypeList.size();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    /**
     * 进度情况
     *
     * @return
     */
    public String progressSitu() {

        String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
        String usertype = (String) getSession().getAttribute(SystemContext.USERTYPE);
        ProgressSitu model = new ProgressSitu();
        if (thisYear == null) {
            //获取当前年份并set进去
            thisYear = Calendar.getInstance().get(Calendar.YEAR);
            model.setYear(thisYear);
        }
        //根据类型查找相应的表,获取登录类型，2的话直接去教师表查询，
        //3的话说明是管理员并且管理员只可能是老师？如果根据这个设计，3也应该去教师表查询。
        if (usertype.equals("3") || usertype.equals("2")) {
            int teacherid = sysTeacherService.findByTeacherNo(loginName).getTeacherId();
            model.setTeacherId(teacherid);
        } else if (usertype.equals("1")) {
            //如果登录类型是1说明是学生，应该去学生表那里查询。
            thisStuId = sysStudentService.findByStuNo(loginName).getStuId();
            model.setStuId(thisStuId);
        }
        if (thisStuId != null) {
            model.setStuId(thisStuId);
        }
        materialInfo = materialInfoSerivce.findByStuIdAndYear(thisStuId, thisYear);
        pageResult1 = progressSituSerivce.find(model, getPage(), getRow());
        footer = PageUtil.pageFooter(pageResult1, getRequest());
        return SUCCESS;
    }

    /**
     * 导出过程文档
     *
     * @return
     */
    public String exportStudentProcessDoc() {

        try {

            String[] stuIds = thisIds.split(",");//需导出学生id数组

            List<Map<String,String>> maps = new ArrayList<>();

            for (int i = 0; i < stuIds.length; i++) {

                StudentProcessDocVO doc = findStudentProcessDocVOByStuId(Integer.parseInt(stuIds[i]), thisYear);
                //初始化map
                Map<String, String> map = ExportDocUtil.initMapMsg();
                //数据填充
                ExportDocUtil.putData(doc,map);

                maps.add(map);//add
            }

        WordUtils.exportWordByBatch(maps, getTempletePath(), getFilePath(),getZipPath());

    }catch (Exception e){
        e.printStackTrace();
    }
        fileName = "学生毕业设计过程文档.zip";
        return OUT;
    }

    /**
     * 返回过程文档对象
     *
     * @param id
     * @param year
     * @return
     */
    private StudentProcessDocVO findStudentProcessDocVOByStuId(Integer id, Integer year) {
        //查询相关信息
        StudentProcessDocVO studentProcessDocVO = new StudentProcessDocVO();
        //学生
        studentProcessDocVO.setListStudent(sysStudentService.findViewModelById(id));
        //分组
        AllotGuide aGuide = allotGuideService.findByStuIdAndYear(id, year);
        //教师
        studentProcessDocVO.setSysTeacher(sysTeacherService.findById(aGuide.getTeacherId()));
        //教师
        studentProcessDocVO.setSysTechnical(iSysTechnicalService.findById(studentProcessDocVO.getSysTeacher().getTechnicalId()));
        //任务书
        studentProcessDocVO.setTaskBook(iTaskBookSerivce.findByStuIdAndYear(id, year));
        studentProcessDocVO.setIssueInfo(issueInfoService.findByStuIdAndYear(id, year));
        //开题报告
        studentProcessDocVO.setOpenReport(iOpenReportSerivce.findByStuIdAndYear(id, year));
        //进展情况记录
        studentProcessDocVO.setProgressSitus(progressSituSerivce.findByStuIdAndYear(id, year));
        //论文（设计）评阅表（指导教师用）type:00
        studentProcessDocVO.setListReviewReadGuide(iReviewSerivce.findByStuIdAndReviewTypeAndYear(id, "00", year));
        //论文（设计）评阅表（评阅教师用）type:01
        studentProcessDocVO.setListReviewReadTeacher(iReviewSerivce.findByStuIdAndReviewTypeAndYear(id, "01", year));
        //规范审查表（指导教师用）type:02
        studentProcessDocVO.setListReviewCheckTeacher(iReviewSerivce.findByStuIdAndReviewTypeAndYear(id, "02", year));
        //答辩过程记录表
        studentProcessDocVO.setDefenseRecordVOS(iDefenseRecordService.findByExample(new DefenseRecord().setStuId(id).setYear(year)));
        //答辩成绩及评语表// 00答辩小组
        studentProcessDocVO.setGroupReply(iReplyScoreSerivce.findByStuIdAndReplyTypeAndYear(id, "00", year));
        ListGroupStudent gStudent = groupStudentService.findByStuIdAndYearAndType(id, year,"00");
        if (gStudent != null) {
            studentProcessDocVO.setDefenceGroup(groupAllotService.findViewModelById(gStudent.getGroupAllotId()));
        }
        //01系答辩委员会
        studentProcessDocVO.setDeptReply(iReplyScoreSerivce.findByStuIdAndReplyTypeAndYear(id, "01", year));
        ListGroupStudent gCommitee = groupStudentService.findByStuIdAndYearAndType(id, year,"01");//系答辩委员会
        if (gCommitee != null) {
            studentProcessDocVO.setCommiteeGroup(groupAllotService.findViewModelById(gCommitee.getGroupAllotId()));
        }
        return studentProcessDocVO;
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

    public Integer getThisStuId() {
        return thisStuId;
    }

    public void setThisStuId(Integer thisStuId) {
        this.thisStuId = thisStuId;
    }

    public Result<ListProgressSitu> getPageResult1() {
        return pageResult1;
    }

    public void setPageResult1(Result<ListProgressSitu> pageResult1) {
        this.pageResult1 = pageResult1;
    }

    public String getThisIds() {
        return thisIds;
    }

    public void setThisIds(String thisIds) {
        this.thisIds = thisIds;
    }

    public String getTempletePath() {
        return ServletActionContext.getServletContext().getRealPath(templetePath);
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

    public String getZipPath() {
        return ServletActionContext.getServletContext().getRealPath(zipPath);
    }

    public void setZipPath(String zipPath) {
        this.zipPath = zipPath;
    }
}
