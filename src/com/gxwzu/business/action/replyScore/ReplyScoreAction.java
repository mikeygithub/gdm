package com.gxwzu.business.action.replyScore;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gxwzu.business.model.group.GroupAllot;
import com.gxwzu.business.service.group.IGroupTeacherService;
import com.gxwzu.business.service.materialInfo.IMaterialInfoSerivce;
import com.gxwzu.sysVO.*;
import com.gxwzu.system.model.sysIssueType.SysIssueType;
import com.gxwzu.system.service.sysIssueType.ISysIssueTypeService;
import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.issueInfo.IssueInfo;
import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.replyScore.ReplyScore;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.group.IGroupAllotService;
import com.gxwzu.business.service.group.IGroupStudentService;
import com.gxwzu.business.service.issueInfo.IIssueInfoSerivce;
import com.gxwzu.business.service.plan.IPlanProgressSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.business.service.replyScore.IReplyScoreSerivce;
import com.gxwzu.business.service.review.IReviewSerivce;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.model.ResponeJson;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.util.WordUtils;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 答辩成绩及评语
 *
 * @author 何志明
 * @date 2017.7.21
 */
public class ReplyScoreAction extends BaseAction implements ModelDriven<ReplyScore> {

    private static final long serialVersionUID = -3343014949806289390L;

    protected final Log logger = LogFactory.getLog(getClass());

    /*********************** 实例化ModelDriven ******************************/
    private ReplyScore model = new ReplyScore();

    @Override
    public ReplyScore getModel() {
        return model;
    }

    public void setModel(ReplyScore model) {
        this.model = model;
    }

    /*********************** Service接口注入 ***************************/
    @Autowired
    private IReplyScoreSerivce replyScoreSerivce; // 答辩成绩及评语接口
    @Autowired
    private ISysTeacherService sysTeacherService; // 老师接口
    @Autowired
    private ISysStudentService sysStudentService; // 学生接口
    @Autowired
    private IAllotGuideService allotGuideService; // 指导分配接口
    @Autowired
    private IIssueInfoSerivce issueInfoSerivce; // 课题接口
    @Autowired
    private IGroupAllotService groupAllotService; // 分组接口
    @Autowired
    private IGroupStudentService groupStudentService; // 分组学生接口
    @Autowired
    private IGroupTeacherService getGroupTeacherService;//教师分组接口
    @Autowired
    private IReviewSerivce reviewSerivce; // 评阅审查接口
    @Autowired
    private IPlanYearSerivce planYearSerivce; // 年度计划接口
    @Autowired
    private IPlanProgressSerivce planProgressSerivce; // 进度计划接口
    @Autowired
    private ISysIssueTypeService sysIssueTypeService; // 课题类型接口
    @Autowired
    private IGroupTeacherService groupTeacherService; // 老师分组接口
    @Autowired
    private IMaterialInfoSerivce materialInfoSerivce; // 学生相关材料接口
    /*********************** 实体 ***************************/
    private PlanYear planYear; // 年度计划实体
    private SysTeacher teacher = new SysTeacher(); // 老师实体
    private ListTeacher teacherVO = new ListTeacher(); // 老师实体
    private ListStudent student = new ListStudent(); // 学生实体
    private IssueInfo issueInfo = new IssueInfo(); // 课题列表实体
    private ListGroupAllot groupAllot = new ListGroupAllot(); // 分组名单
    private ListReplyScore replyScore = new ListReplyScore();
    private PlanProgress planProgress = new PlanProgress();//进度计划实体
    private List<ListPlanProgress> planProgressList = new ArrayList<>();
    private ListTeacher lTeacher = new ListTeacher(); // 老师实体
    private List<ListGroupTeacher> groupTeachers;//
    private ListReplyScore listReplyScore;//成绩及评阅
    /******************** 集合变量声明 *********************/
    private Result<ListReplyScore> pageResult = new Result<>(); // 评阅审查分页
    private Result<MaterialInfo> pageResult1 = new Result<>(); // 评阅审查分页
    private List<ListReplyScore> replyScoreList = new ArrayList<ListReplyScore>(); // 论文信息列表（用于查询全部）
    private List<SysIssueType> issueTypeList = new ArrayList<SysIssueType>();
    /************************** 基础变量声明 **************/
    private Integer thisId;
    private String mark;
    private Integer thisYear;
    private String thisReplyType; // 类型：答辩类型： 00答辩小组 01系答辩委员会
    private Integer thisStuId; // 学生Id
    private String thisScore; // 答辩成绩
    private String ReplyScoreType;
    private String thisReplyLink;

    Float guideScore;
    Float readScore;
    Float checkScore;


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
     * 个人分页查询评阅审查信息
     *
     * @return
     */
    public String list() {

        logger.info("查询个人分页查询评阅审查信息列表：" + model);

        try {
            /* 登录名称 :查询学院 */
            String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
            /* 用户类型：1-学生 2-老师 */
            String type = (String) getSession().getAttribute(SystemContext.USERTYPE);

//			pageResult = replyScoreSerivce.find(model, getPage(), getRow());
//			logger.info("pageResult : "+pageResult);
//			footer = PageUtil.pageFooter(pageResult, getRequest());

            /////////////////////////////////////////////////////////////
            if (flag != null && "12".equals(flag)) {
                // 查询 当前老师所属专业教研室 中的进度计划
                if ("2".equals(type)) {
                    teacherVO = sysTeacherService.findByTeacherNo(loginName);
                    planProgress = planProgressSerivce.findByTeacStaffroomId(teacherVO.getStaffroomId(), flag);
                    logger.info("当前教师年度计划" + planProgress);
                }
                Timestamp d = new Timestamp(System.currentTimeMillis());
                if (planProgress != null && planProgress.getStartTime() != null && d.after(planProgress.getStartTime())) {
                    logger.info("老师查询所在组已分配评阅的学生信息");
                    // 老师查询学生课题信息
                    if (type.equals("2")) {
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
                        pageResult1 = materialInfoSerivce.findGroupStudent(groupAllotId, thisReplyType, model.getYear(), getPage(), getRow());


                        logger.info("pageResult1=>" + pageResult1);

                        footer = PageUtil.pageFooter(pageResult1, getRequest());
                        //指导老师查询自己所在教研室进度计划信息
                        if (teacher.getStaffroomId() == null) {
                            teacher.setStaffroomId(-1);
                        }
                        planProgressList = planProgressSerivce.findByMajorAndYear(teacher.getStaffroomId(), model.getYear());

                    }

                    return SUCCESS;

                } else {
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

    /**
     * 学生查询课题信息
     *
     * @return
     */
    public String info() {
        String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
        String type = (String) getSession().getAttribute(SystemContext.USERTYPE);

        if (type.equals("1")) {
            ListStudent s = sysStudentService.findByStuNo(loginName);
            model.setStuId(s.getStuId());
        }


        /************************** 查询学生信息 *********************************************/
        return openAdd();
    }

    /**
     * 添加信息到数据库
     *
     * @return
     */
    public void add() {
        boolean isSuccess = false;
        String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
        String type = (String) getSession().getAttribute(SystemContext.USERTYPE);
        ResponeJson rJson = new ResponeJson();
        logger.info(thisReplyType + "," + thisStuId + "," + thisYear + "," + thisScore + model.getReplyLink());
        /************************** 查询教研室信息 *********************************************/
        try {
            ListReplyScore replyScoreList = replyScoreSerivce.findByStuIdAndReplyTypeAndYear(thisStuId, thisReplyType, thisYear);

            if (thisStuId != null && thisYear != null && thisReplyType != null) {
                model.setYear(thisYear);
                // 添加信息
                model.setStuId(thisStuId);
                model.setYear(thisYear);
                model.setReplyType(thisReplyType);
                // 90分×25%=22.8
                model.setReplyScore(Float.parseFloat(thisScore));
                Float replyScore = (float) (Float.parseFloat(thisScore) * 0.25);
                // 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
                // 指导老师评阅评分 90分×45%=40.5
                ListReview reviewGuide = reviewSerivce.findByStuIdAndReviewTypeAndYear(thisStuId, "00", thisYear);
                if (reviewGuide != null) {
                    guideScore = (float) (reviewGuide.getTotalScore() * 0.45);
                }
                // 指导评阅审查评分 93分×10%= 9.3
                ListReview reviewCheck = reviewSerivce.findByStuIdAndReviewTypeAndYear(thisStuId, "02", thisYear);
                if (reviewCheck != null) {
                    checkScore = (float) (reviewCheck.getTotalScore() * 0.1);
                }
                // 评阅老师评阅评分 88分×20%= 17.6
                ListReview reviewRead = reviewSerivce.findByStuIdAndReviewTypeAndYear(thisStuId, "01", thisYear);
                if (reviewRead != null) {
                    readScore = (float) (reviewRead.getTotalScore() * 0.2);
                }
                //优”（90分以上）；“良”（80～89）；“中”（70～79）；“及格”（60～69）；“不及格”（60以下）
                if (replyScore != null && checkScore != null && guideScore != null && replyScore != null) {
                    logger.info(readScore + "," + checkScore + "," + guideScore + "," + replyScore);
                    int replyScoreFinish = (int) (readScore + checkScore + guideScore + replyScore);
                    model.setReplyScoreFinish(replyScoreFinish);
                    logger.info("最终成绩：" + replyScoreFinish);
                    if (replyScoreFinish < 60) {
                        model.setGrade("不及格");
                    } else if (replyScoreFinish < 60) {
                        model.setGrade("不及格");
                    } else if (replyScoreFinish >= 60 && replyScoreFinish < 69) {
                        model.setGrade("及格");
                    } else if (replyScoreFinish >= 70 && replyScoreFinish < 79) {
                        model.setGrade("中");
                    } else if (replyScoreFinish >= 80 && replyScoreFinish < 90) {
                        model.setGrade("良");
                    } else if (replyScoreFinish >= 90) {
                        model.setGrade("优");
                    }
                    logger.info("Grade " + model.getGrade());
                }
                if (replyScoreList != null) {
                    logger.info("更新" + model);
                    if (model.getReplyScoreFinish() == null) {
                        model.setReplyScoreFinish(0);
                    }
                    if (model.getGrade() == null) {
                        model.setGrade("未评分");
                    }
                    replyScoreSerivce.updateByStuId(thisStuId, model.getReplyLink(), model.getReplyScoreFinish(), model.getGrade(), Float.parseFloat(thisScore),thisReplyType);

                } else {
                    logger.debug("保存 " + model);
                    model = replyScoreSerivce.save(model);
                }
                rJson.setObj(model);
                rJson.setSuccess(true);
            } else {
                rJson.setObj(model);
                rJson.setSuccess(false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            mark = "0";
        }
        mark = "1";
        isSuccess = true;
        PrintWriter out = null;
        try {
            out = getResponse().getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        out.print(isSuccess);
        out.flush();
        out.close();
    }

    /**
     * 打开添加评阅审查页面
     *
     * @return 学生信息 + 指导老师信息+ 课题
     */
    public String openAdd() {
        try {
            if (thisStuId != null && thisYear != null && thisReplyType != null) {
                listReplyScore = replyScoreSerivce.findByStuIdAndReplyTypeAndYear(thisStuId, thisReplyType, thisYear);
                // 查询学生信息
                student = sysStudentService.findViewModelById(thisStuId);
                // 查询课题信息
                issueInfo = issueInfoSerivce.findByStuIdAndYear(thisStuId, thisYear);
                // 查询指导老师信息
                AllotGuide aGuide = allotGuideService.findByStuIdAndYear(thisStuId, thisYear);
                teacher = sysTeacherService.findById(aGuide.getTeacherId());
                // 查询分组老师信息
                ListGroupStudent groupStudent = groupStudentService.findByStuIdAndYear(thisStuId, thisYear);
                if (groupStudent != null) {
                    //查询学生所属答辩组
                    groupAllot = groupAllotService.findViewModelById(groupStudent.getGroupAllotId());
                    //查询答辩小组老师
                    ListGroupTeacher listGroupTeacher = new ListGroupTeacher();
                    listGroupTeacher.setGroupAllotId(groupStudent.getGroupAllotId());
                    groupTeachers = groupTeacherService.findByExample(listGroupTeacher);

                    logger.info("分组老师信息：" + groupTeachers);
                }
                logger.info(listReplyScore);

            }
            // 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
            // 指导老师评阅评分 90分×45%=40.5
            ListReview reviewGuide = reviewSerivce.findByStuIdAndReviewTypeAndYear(thisStuId, "00", thisYear);
            if (reviewGuide != null) {
                guideScore = (float) (reviewGuide.getTotalScore() * 0.45);
                replyScore.setGuideScore(guideScore);
            }
            // 指导评阅审查评分 93分×10%= 9.3
            ListReview reviewCheck = reviewSerivce.findByStuIdAndReviewTypeAndYear(thisStuId, "02", thisYear);
            if (reviewCheck != null) {
                checkScore = (float) (reviewGuide.getTotalScore() * 0.1);
                replyScore.setCheckScore(checkScore);
            }
            // 评阅老师评阅评分 88分×20%= 17.6
            ListReview reviewRead = reviewSerivce.findByStuIdAndReviewTypeAndYear(thisStuId, "01", thisYear);
            if (reviewRead != null) {
                readScore = (float) (reviewRead.getTotalScore() * 0.2);
                replyScore.setReadScore(readScore);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    /**
     * 打开修改评阅审查页面
     *
     * @return 学生信息 + 指导老师信息 + 课题
     */
    public String openEdit() {
        try {
            if (thisStuId != null && thisYear != null) {
                // 查询评阅信息
                if (thisReplyType != null && !"".equals(thisReplyType)) {
                    model.setReplyType(thisReplyType);
                }
                model.setStuId(thisStuId);
                model.setYear(thisYear);
                replyScore = replyScoreSerivce.find(model, 1, 1).getData().get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return openAdd();
    }

    /**
     * 修改评阅审查信息
     *
     * @return
     * @throws IOException
     */
    public String edit() {
        try {
            if (thisId != null) {
                ReplyScore rScore = replyScoreSerivce.findById(thisId);

                if (StringUtils.isNotEmpty(model.getReplyLink())) {
                    rScore.setReplyLink(model.getReplyLink());
                }
                rScore.setReplyLink(model.getReplyLink());
                replyScoreSerivce.update(rScore); // 更改信息
                replyScore = replyScoreSerivce.findViewModelById(thisId);
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
     * 导出评阅审查
     *
     * @return
     */
    public String outReplyScore() {
        try {
            if (thisId != null) {
                ListReplyScore model = replyScoreSerivce.findViewModelById(thisId);
                ListStudent student = sysStudentService.findViewModelById(model.getStuId());
                // 查询指导老师信息
                AllotGuide aGuide = allotGuideService.findByStuIdAndYear(model.getStuId(), model.getYear());
                teacher = sysTeacherService.findById(aGuide.getTeacherId());
                // ##################根据Word模板导出单个Word文档###################################################
                Map<String, String> map = new HashMap<String, String>();
                map.put("dT", student.getDeptName());
                map.put("mR", student.getMajorName());
                map.put("tN", teacher.getTeacherName());
                map.put("sN", student.getStuName());

                WordUtils.exportWord(map, getTempletePath(), getFilePath());
                StringBuffer sBuffer = new StringBuffer(student.getClassName());
                sBuffer.append("-").append(student.getStuId()).append("-").append(student.getStuName()).append("-").append("梧州学院本科生毕业论文答辩成绩及评语表.doc");
                fileName = sBuffer.toString();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "out";
    }

    /**
     * 删除信息
     *
     * @return
     */
    public void del() {
        logger.info("删除信息");
        boolean isdel = false;
        try {
            if (thisStuId != null && thisYear != null && thisReplyType != null) {
                //查询
                ListReplyScore byStuIdAndReplyTypeAndYear = replyScoreSerivce.findByStuIdAndReplyTypeAndYear(thisStuId, thisReplyType, thisYear);
                //删除
                replyScoreSerivce.del(byStuIdAndReplyTypeAndYear.getReplyId());
                //删除标识
                isdel = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            PrintWriter out = null;
            try {
                out = getResponse().getWriter();
            } catch (IOException e) {
                e.printStackTrace();
            }
            out.print(isdel);
            out.flush();
            out.close();
        }
    }


    /**
     * 毕业设计成绩列表
     *
     * @return
     */
    public void loadReplyScoreList() {
        logger.info(" 毕业设计成绩列表 ");
        try {
            PrintWriter out = getResponse().getWriter();

            String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
            String type = (String) getSession().getAttribute(SystemContext.USERTYPE);
            if (type.equals("1")) {
                student = sysStudentService.findByStuNo(loginName);
            }
            //查询安排计划年度
            planYear = planYearSerivce.findPlanYear();
            // 毕业设计成绩列表(非学生不进行查询)
            if (SystemContext.USER_STUDENT_TYPE.equals(type))replyScore = replyScoreSerivce.findByStudentIdAndYear(student.getStuId(), planYear.getYear());
            //type是判断学生老师的字段

            if (replyScore != null) {
                //TODO:NullPoint bug
                replyScore.setReplyType(type);
            } else {
                logger.info("毕业设计成绩列表为空");
                replyScore = new ListReplyScore();
            }
            out.print(new Gson().toJson(replyScore));
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

    public Result<ListReplyScore> getPageResult() {
        return pageResult;
    }

    public void setPageResult(Result<ListReplyScore> pageResult) {
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

    public SysTeacher getTeacher() {
        return teacher;
    }

    public void setTeacher(SysTeacher teacher) {
        this.teacher = teacher;
    }

    public Integer getThisYear() {
        return thisYear;
    }

    public void setThisYear(Integer thisYear) {
        this.thisYear = thisYear;
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

    public String getTempletePath() {
        return templetePath;
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
        return filePath;
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

    public ListGroupAllot getGroupAllot() {
        return groupAllot;
    }

    public void setGroupAllot(ListGroupAllot groupAllot) {
        this.groupAllot = groupAllot;
    }

    public ListReplyScore getReplyScore() {
        return replyScore;
    }

    public void setReplyScore(ListReplyScore replyScore) {
        this.replyScore = replyScore;
    }

    public Float getGuideScore() {
        return guideScore;
    }

    public void setGuideScore(Float guideScore) {
        this.guideScore = guideScore;
    }

    public Float getReadScore() {
        return readScore;
    }

    public void setReadScore(Float readScore) {
        this.readScore = readScore;
    }

    public Float getCheckScore() {
        return checkScore;
    }

    public void setCheckScore(Float checkScore) {
        this.checkScore = checkScore;
    }

    public String getThisScore() {
        return thisScore;
    }

    public void setThisScore(String thisScore) {
        this.thisScore = thisScore;
    }

    public List<ListReplyScore> getReplyScoreList() {
        return replyScoreList;
    }

    public void setReplyScoreList(List<ListReplyScore> replyScoreList) {
        this.replyScoreList = replyScoreList;
    }

    public String getReplyScoreType() {
        return ReplyScoreType;
    }

    public void setReplyScoreType(String replyScoreType) {
        ReplyScoreType = replyScoreType;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getThisReplyLink() {
        return thisReplyLink;
    }

    public void setThisReplyLink(String thisReplyLink) {
        this.thisReplyLink = thisReplyLink;
    }

    public ListTeacher getTeacherVO() {
        return teacherVO;
    }

    public void setTeacherVO(ListTeacher teacherVO) {
        this.teacherVO = teacherVO;
    }

    public PlanProgress getPlanProgress() {
        return planProgress;
    }

    public void setPlanProgress(PlanProgress planProgress) {
        this.planProgress = planProgress;
    }

    public List<ListPlanProgress> getPlanProgressList() {
        return planProgressList;
    }

    public void setPlanProgressList(List<ListPlanProgress> planProgressList) {
        this.planProgressList = planProgressList;
    }

    public ListTeacher getlTeacher() {
        return lTeacher;
    }

    public Result<MaterialInfo> getPageResult1() {
        return pageResult1;
    }

    public void setPageResult1(Result<MaterialInfo> pageResult1) {
        this.pageResult1 = pageResult1;
    }

    public void setlTeacher(ListTeacher lTeacher) {
        this.lTeacher = lTeacher;
    }

    public List<SysIssueType> getIssueTypeList() {
        return issueTypeList;
    }

    public void setIssueTypeList(List<SysIssueType> issueTypeList) {
        this.issueTypeList = issueTypeList;
    }

    public List<ListGroupTeacher> getGroupTeachers() {
        return groupTeachers;
    }

    public void setGroupTeachers(List<ListGroupTeacher> groupTeachers) {
        this.groupTeachers = groupTeachers;
    }

    public ListReplyScore getListReplyScore() {
        return listReplyScore;
    }

    public void setListReplyScore(ListReplyScore listReplyScore) {
        this.listReplyScore = listReplyScore;
    }
}
