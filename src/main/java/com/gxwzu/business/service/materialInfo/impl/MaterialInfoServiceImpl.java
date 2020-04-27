package com.gxwzu.business.service.materialInfo.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.defenseRecord.DefenseRecord;
import com.gxwzu.business.model.issueInfo.IssueInfo;
import com.gxwzu.business.model.openReport.OpenReport;
import com.gxwzu.business.model.paper.StudentPaper;
import com.gxwzu.business.model.replyScore.ReplyScore;
import com.gxwzu.business.model.taskBook.TaskBook;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.defenseRecord.IDefenseRecordService;
import com.gxwzu.business.service.group.IGroupStudentService;
import com.gxwzu.business.service.issueInfo.IIssueInfoSerivce;
import com.gxwzu.business.service.materialInfo.IMaterialInfoSerivce;
import com.gxwzu.business.service.openReport.IOpenReportSerivce;
import com.gxwzu.business.service.paper.IStudentPaperSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.business.service.progressSitu.IProgressSituSerivce;
import com.gxwzu.business.service.replyScore.IReplyScoreSerivce;
import com.gxwzu.business.service.review.IReviewSerivce;
import com.gxwzu.business.service.taskBook.ITaskBookSerivce;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListGroupStudent;
import com.gxwzu.sysVO.ListProgressSitu;
import com.gxwzu.sysVO.ListReplyScore;
import com.gxwzu.sysVO.ListReview;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListStudentAllotGuide;
import com.gxwzu.sysVO.MaterialInfo;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.service.sysStudent.ISysStudentService;

@Service("materialInfoService")
public class MaterialInfoServiceImpl implements IMaterialInfoSerivce {

    @Autowired
    private ISysStudentService sysStudentService; // 学生接口
    @Autowired
    private IAllotGuideService allotGuideService; // 指导分配接口
    @Autowired
    private IPlanYearSerivce planYearSerivce; // 年度计划接口
    @Autowired
    private IIssueInfoSerivce issueInfoSerivce; // 课题接口
    @Autowired
    private ITaskBookSerivce taskBookSerivce; // 任务书接口
    @Autowired
    private IOpenReportSerivce openReportSerivce; // 开题报告接口
    @Autowired
    private IProgressSituSerivce progressSituSerivce; // 进展情况接口
    @Autowired
    private IDefenseRecordService defenseRecordService;// 答辩记录接口
    @Autowired
    private IReviewSerivce reviewSerivce; // 评阅审查接口
    @Autowired
    private IReplyScoreSerivce replyScoreSerivce; // 答辩成绩及评语接口
    @Autowired
    private IGroupStudentService groupStudentService; // 指导老师分配接口
    @Autowired
    private IStudentPaperSerivce studentPaperService;//学生论文接口

    @Override
    public Result<MaterialInfo> find(MaterialInfo model, int page, int size) {
        SysStudent student = new SysStudent();
        List<Integer> sList = new ArrayList<Integer>();
        /**************************** 条件判断 *********************************************/
        if (model.getStuId() != null) {
            student.setStuId(model.getStuId());
        }
        if (StringUtils.isNotEmpty(model.getStuNo())) {
            student.setStuNo(model.getStuNo());
        }
        if (StringUtils.isNotEmpty(model.getDeptNumber())) {
            student.setDeptNumber(model.getDeptNumber());
        }
        if (model.getCategoryId() != null) {
            student.setCategoryId(model.getCategoryId());
        }
        if (model.getMajorId() != null) {
            student.setMajorId(model.getMajorId());
        }
        if (model.getClassId() != null) {
            student.setClassId(model.getClassId());
        }
        if (model.getTeacherId() != null) {
            AllotGuide allotGuide = new AllotGuide();
            allotGuide.setTeacherId(model.getTeacherId());
            allotGuide.setYear(model.getYear());
            List<AllotGuide> aList = allotGuideService.findByExample(allotGuide);
            for (AllotGuide a : aList) {
                sList.add(a.getStuId());
            }
        }

        /************************* 填充结果集 ************************************************/
        Result<ListStudent> oldResult = sysStudentService.find(model, page,size);
        Result<MaterialInfo> newResult = new Result<MaterialInfo>();
        List<MaterialInfo> newList = new ArrayList<MaterialInfo>();
        if (oldResult != null && oldResult.getData() != null
                && oldResult.getData().size() != 0) {

            for (ListStudent m : oldResult.getData()) {
                if (sList.size() != 0 && !sList.contains(m.getStuId())) {
                    continue;
                }
                MaterialInfo newModel = new MaterialInfo();
                // 课题信息
                IssueInfo issueInfo = issueInfoSerivce.findByStuIdAndYear(
                        m.getStuId(), model.getYear());
                if (issueInfo != null) {
                    newModel.setIssueInfo(issueInfo);
                }
                // 任务书信息
                TaskBook taskBook = taskBookSerivce.findByStuIdAndYear(
                        m.getStuId(), model.getYear());
                if (taskBook != null) {
                    newModel.setTaskId(taskBook.getTaskId());
                }
                // 开题报告信息
                OpenReport openReport = openReportSerivce.findByStuIdAndYear(
                        m.getStuId(), model.getYear());
                if (openReport != null) {
                    newModel.setReportId(openReport.getReportId());
                }

                // 进展情况信息
                List<ListProgressSitu> pList = progressSituSerivce
                        .findByStuIdAndYear(m.getStuId(), model.getYear());
                if (pList != null && pList.size() > 0) {
                    newModel.setProgressId(pList.size());
                }

                // 指导老师评阅信息 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
                ListReview reviewGuide = reviewSerivce
                        .findByStuIdAndReviewTypeAndYear(m.getStuId(), "00",
                                model.getYear());
                if (reviewGuide != null) {
                    newModel.setReviewGuideId(reviewGuide.getReviewId());
                }
                // 指导评阅审查信息 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
                ListReview reviewCheck = reviewSerivce
                        .findByStuIdAndReviewTypeAndYear(m.getStuId(), "02",
                                model.getYear());
                if (reviewCheck != null) {
                    newModel.setReviewCheckId(reviewCheck.getReviewId());
                }
                // 评阅老师评阅信息 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
                ListReview reviewRead = reviewSerivce
                        .findByStuIdAndReviewTypeAndYear(m.getStuId(), "01",
                                model.getYear());
                if (reviewRead != null) {
                    newModel.setReviewReadId(reviewRead.getReviewId());
                }

                // 答辩记录信息
                DefenseRecord defenseRecord = defenseRecordService
                        .findByStuIdAndYear(m.getStuId(), model.getYear());
                if (defenseRecord != null) {
                    newModel.setDefenseId(defenseRecord.getDefenseId());
                }

                // 答辩小组答辩成绩及评语 类型：答辩类型： 00答辩小组 01系答辩委员会
                ListReplyScore groupReply = replyScoreSerivce
                        .findByStuIdAndReplyTypeAndYear(m.getStuId(), "00",
                                model.getYear());
                if (groupReply != null) {
                    newModel.setGroupReply(groupReply);
                }
                // 系答辩委员会答辩成绩及评语 类型：答辩类型： 00答辩小组 01系答辩委员会
                ListReplyScore deptReply = replyScoreSerivce
                        .findByStuIdAndReplyTypeAndYear(m.getStuId(), "01",
                                model.getYear());
                if (deptReply != null) {
                    newModel.setDeptReply(deptReply);
                }

                newModel.setStudent(m);
                newList.add(newModel);
            }
        }
        newResult.setData(newList);
        newResult.setOffset(oldResult.getOffset());
        newResult.setPage(oldResult.getPage());
        newResult.setSize(oldResult.getSize());
        newResult.setTotal(oldResult.getTotal());
        newResult.setTotalPage(oldResult.getTotalPage());
        return newResult;
    }

    @Override
    public List<MaterialInfo> findByExample(MaterialInfo model) {
        SysStudent student = new SysStudent();
        List<Integer> sList = new ArrayList<Integer>();
        if (model.getStuId() != null) {
            student.setStuId(model.getStuId());
        }
        if (StringUtils.isNotEmpty(model.getStuNo())) {
            student.setStuNo(model.getStuNo());
        }
        if (StringUtils.isNotEmpty(model.getDeptNumber())) {
            student.setDeptNumber(model.getDeptNumber());
        }
        if (model.getMajorId() != null) {
            student.setMajorId(model.getMajorId());
        }
        if (model.getClassId() != null) {
            student.setClassId(model.getClassId());
        }
        if (model.getTeacherId() != null) {
            AllotGuide allotGuide = new AllotGuide();
            allotGuide.setTeacherId(model.getTeacherId());
            allotGuide.setYear(model.getYear());
            List<AllotGuide> aList = allotGuideService
                    .findByExample(allotGuide);
            for (AllotGuide a : aList)
                sList.add(a.getStuId());
        }
        List<ListStudent> oldList = sysStudentService.findByExample(student);

        List<MaterialInfo> newList = new ArrayList<MaterialInfo>();

        if (oldList != null && oldList.size() != 0) {
            for (ListStudent m : oldList) {
                if (sList.size() != 0 && !sList.contains(m.getStuId())) {
                    continue;
                }
                MaterialInfo newModel = new MaterialInfo();
                // 课题信息
                IssueInfo issueInfo = issueInfoSerivce.findByStuIdAndYear(
                        m.getStuId(), model.getYear());
                if (issueInfo != null) {
                    newModel.setIssueInfo(issueInfo);
                }

                // 任务书信息
                TaskBook taskBook = taskBookSerivce.findByStuIdAndYear(
                        m.getStuId(), model.getYear());
                if (taskBook != null) {
                    newModel.setTaskId(taskBook.getTaskId());
                }
                // 开题报告信息
                OpenReport openReport = openReportSerivce.findByStuIdAndYear(
                        m.getStuId(), model.getYear());
                if (openReport != null) {
                    newModel.setReportId(openReport.getReportId());
                }
                // 进展情况信息
                List<ListProgressSitu> progress = progressSituSerivce
                        .findByStuIdAndYear(m.getStuId(), model.getYear());
                if (progress != null && progress.size() != 0) {
                    newModel.setProgressId(progress.size());
                }
                // 指导老师评阅信息 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
                ListReview reviewGuide = reviewSerivce
                        .findByStuIdAndReviewTypeAndYear(m.getStuId(), "00",
                                model.getYear());
                if (reviewGuide != null) {
                    newModel.setReviewGuideId(reviewGuide.getReviewId());
                }
                // 指导评阅审查信息 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
                ListReview reviewCheck = reviewSerivce
                        .findByStuIdAndReviewTypeAndYear(m.getStuId(), "02",
                                model.getYear());
                if (reviewCheck != null) {
                    newModel.setReviewCheckId(reviewCheck.getReviewId());
                }
                // 评阅老师评阅信息 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
                ListReview reviewRead = reviewSerivce
                        .findByStuIdAndReviewTypeAndYear(m.getStuId(), "01",
                                model.getYear());
                if (reviewRead != null) {
                    newModel.setReviewReadId(reviewRead.getReviewId());
                }
                // 答辩小组答辩成绩及评语  类型：答辩类型： 00答辩小组  01系答辩委员会
                ListReplyScore groupReply = replyScoreSerivce.findByStuIdAndReplyTypeAndYear(m.getStuId(), "00", model.getYear());

                if (groupReply != null) {
                    newModel.setGroupReply(groupReply);
                }
                // 系答辩委员会答辩成绩及评语  类型：答辩类型： 00答辩小组  01系答辩委员会
                ListReplyScore deptReply = replyScoreSerivce.findByStuIdAndReplyTypeAndYear(m.getStuId(), "01", model.getYear());
                if (deptReply != null) {
                    newModel.setDeptReply(deptReply);
                }
                // 答辩记录
                DefenseRecord defense = defenseRecordService
                        .findByStuIdAndYear(m.getStuId(), model.getYear());
                if (defense != null) {
                    newModel.setDefenseId(defense.getDefenseId());
                }

                newModel.setStudent(m);
                newList.add(newModel);
            }
        }
        return newList;
    }

    @Override
    public MaterialInfo findByStuIdAndYear(Integer thisStuId, Integer thisYear) {
        MaterialInfo model = new MaterialInfo();
        if (thisStuId == null || thisYear == null) {
            return null;
        }
        model.setStuId(thisStuId);
        model.setYear(thisYear);
        List<MaterialInfo> list = this.findByExample(model);
        if (list != null && list.size() != 0) {
            return list.get(0);
        } else {
            return null;
        }
    }

    @Override
    public List<MaterialInfo> findGuideStudent(Integer teacherId, Integer year) {

        /************************* 填充结果集 ************************************************/
        List<ListStudentAllotGuide> oldList = allotGuideService
                .findStudentsByTeacherIdAndYear(teacherId, year);

        List<MaterialInfo> newList = new ArrayList<MaterialInfo>();

        if (oldList != null && oldList.size() != 0) {
            for (ListStudent m : oldList) {
                MaterialInfo newModel = new MaterialInfo();
                // 课题信息
                IssueInfo issueInfo = issueInfoSerivce.findByStuIdAndYear(
                        m.getStuId(), year);
                if (issueInfo != null) {
                    newModel.setIssueInfo(issueInfo);
                }

                // 任务书信息
                TaskBook taskBook = taskBookSerivce.findByStuIdAndYear(
                        m.getStuId(), year);
                if (taskBook != null) {
                    newModel.setTaskId(taskBook.getTaskId());
                }
                // 开题报告信息
                OpenReport openReport = openReportSerivce.findByStuIdAndYear(
                        m.getStuId(), year);
                if (openReport != null) {
                    newModel.setReportId(openReport.getReportId());
                }
                // 进展情况信息
                List<ListProgressSitu> progress = progressSituSerivce
                        .findByStuIdAndYear(m.getStuId(), year);
                if (progress != null && progress.size() != 0) {
                    newModel.setProgressId(progress.size());
                }

                // 指导老师评阅信息 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
                ListReview reviewGuide = reviewSerivce
                        .findByStuIdAndReviewTypeAndYear(m.getStuId(), "00",
                                year);
                if (reviewGuide != null) {
                    newModel.setReviewGuideId(reviewGuide.getReviewId());
                }
                // 指导评阅审查信息 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
                ListReview reviewCheck = reviewSerivce
                        .findByStuIdAndReviewTypeAndYear(m.getStuId(), "02",
                                year);
                if (reviewCheck != null) {
                    newModel.setReviewCheckId(reviewCheck.getReviewId());
                }
                // 评阅老师评阅信息 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
                ListReview reviewRead = reviewSerivce
                        .findByStuIdAndReviewTypeAndYear(m.getStuId(), "01",
                                year);
                if (reviewRead != null) {
                    newModel.setReviewReadId(reviewRead.getReviewId());
                }

                // 答辩小组答辩成绩及评语  类型：答辩类型： 00答辩小组  01系答辩委员会
                ListReplyScore groupReply = replyScoreSerivce.findByStuIdAndReplyTypeAndYear(m.getStuId(), "00", year);
                if (groupReply != null) {
                    newModel.setGroupReply(groupReply);
                }
                // 系答辩委员会答辩成绩及评语  类型：答辩类型： 00答辩小组  01系答辩委员会
                ListReplyScore deptReply = replyScoreSerivce.findByStuIdAndReplyTypeAndYear(m.getStuId(), "01", year);
                if (deptReply != null) {
                    newModel.setDeptReply(deptReply);
                }
                // 答辩记录
                DefenseRecord defense = defenseRecordService
                        .findByStuIdAndYear(m.getStuId(), year);
                if (defense != null) {
                    newModel.setDefenseId(defense.getDefenseId());
                }
                newModel.setStudent(m);
                newList.add(newModel);
            }
        }
        return newList;
    }

    @Override
    public Result<MaterialInfo> findGroupStudent(Integer groupAllotId, String groupType, Integer year, int page, int size) {
        /************************* 填充结果集 ************************************************/
        Result<ListGroupStudent> oldResult = groupStudentService.findByGroupAllotIdAndYearAndGroupType(groupAllotId, groupType, year, page, size);
        Result<MaterialInfo> newResult = new Result<MaterialInfo>();
        List<MaterialInfo> newList = new ArrayList<MaterialInfo>();
        if (oldResult != null && oldResult.getData() != null && oldResult.getData().size() != 0) {

            for (ListStudent m : oldResult.getData()) {
                MaterialInfo newModel = new MaterialInfo();
                // 课题信息
                IssueInfo issueInfo = issueInfoSerivce.findByStuIdAndYear(m.getStuId(), year);
                if (issueInfo != null) {
                    newModel.setIssueInfo(issueInfo);
                }
                // 最终成绩信息
                ListReplyScore replyScore = replyScoreSerivce.findByStuIdAndReplyTypeAndYear(m.getStuId(), groupType, year);
                if (replyScore != null) {
                    newModel.setGroupReply(replyScore);
                }
                // 任务书信息
                TaskBook taskBook = taskBookSerivce.findByStuIdAndYear(
                        m.getStuId(), year);
                if (taskBook != null) {
                    newModel.setTaskId(taskBook.getTaskId());
                }
                // 开题报告信息
                OpenReport openReport = openReportSerivce.findByStuIdAndYear(
                        m.getStuId(), year);
                if (openReport != null) {
                    newModel.setReportId(openReport.getReportId());
                }
                // 进展情况信息
                List<ListProgressSitu> progress = progressSituSerivce
                        .findByStuIdAndYear(m.getStuId(), year);
                if (progress != null && progress.size() != 0) {
                    newModel.setProgressId(progress.size());
                }

                // 指导老师评阅信息 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
                ListReview reviewGuide = reviewSerivce
                        .findByStuIdAndReviewTypeAndYear(m.getStuId(), "00",
                                year);
                if (reviewGuide != null) {
                    newModel.setReviewGuideId(reviewGuide.getReviewId());
                }
                // 指导评阅审查信息 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
                ListReview reviewCheck = reviewSerivce
                        .findByStuIdAndReviewTypeAndYear(m.getStuId(), "02",
                                year);
                if (reviewCheck != null) {
                    newModel.setReviewCheckId(reviewCheck.getReviewId());
                }
                // 评阅老师评阅信息 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
                ListReview reviewRead = reviewSerivce
                        .findByStuIdAndReviewTypeAndYear(m.getStuId(), "01",
                                year);
                if (reviewRead != null) {
                    newModel.setReviewReadId(reviewRead.getReviewId());
                }

                // 答辩记录
                DefenseRecord defense = defenseRecordService
                        .findByStuIdAndYear(m.getStuId(), year);
                if (defense != null) {
                    newModel.setDefenseId(defense.getDefenseId());
                }
                newModel.setStudent(m);
                newList.add(newModel);
            }
        }
        newResult.setData(newList);
        newResult.setOffset(oldResult.getOffset());
        newResult.setPage(oldResult.getPage());
        newResult.setSize(oldResult.getSize());
        newResult.setTotal(oldResult.getTotal());
        newResult.setTotalPage(oldResult.getTotalPage());
        return newResult;
    }

    @Override
    public Result<MaterialInfo> findGroupDefenseStudent(Integer groupAllotId, Integer teacherId, Integer year, int page, int size) {
        /************************* 填充结果集 ************************************************/
        Result<ListGroupStudent> oldResult = groupStudentService.findByGroupAllotIdAndDefenseTeacherIdAndYear(groupAllotId, teacherId, year, page, size);

        Result<MaterialInfo> newResult = new Result<MaterialInfo>();

        List<MaterialInfo> newList = new ArrayList<MaterialInfo>();

        if (oldResult != null && oldResult.getData() != null && oldResult.getData().size() != 0) {

            for (ListStudent m : oldResult.getData()) {
                MaterialInfo newModel = new MaterialInfo();
                // 课题信息
                IssueInfo issueInfo = issueInfoSerivce.findByStuIdAndYear(
                        m.getStuId(), year);
                if (issueInfo != null) {
                    newModel.setIssueInfo(issueInfo);
                }
                // 任务书信息
                TaskBook taskBook = taskBookSerivce.findByStuIdAndYear(
                        m.getStuId(), year);
                if (taskBook != null) {
                    newModel.setTaskId(taskBook.getTaskId());
                }
                // 开题报告信息
                OpenReport openReport = openReportSerivce.findByStuIdAndYear(
                        m.getStuId(), year);
                if (openReport != null) {
                    newModel.setReportId(openReport.getReportId());
                }
                //学生论文
                System.out.println(m.getStuId());
                StudentPaper paper = studentPaperService.findByStuIdAndYear(m.getStuId(), year, "00");
                if (paper != null) {
                    newModel.setPaperId(paper.getPaperId());
                }
                // 进展情况信息
                List<ListProgressSitu> progress = progressSituSerivce
                        .findByStuIdAndYear(m.getStuId(), year);
                if (progress != null && progress.size() != 0) {
                    newModel.setProgressId(progress.size());
                }
                // 指导老师评阅信息 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
                ListReview reviewGuide = reviewSerivce
                        .findByStuIdAndReviewTypeAndYear(m.getStuId(), "00",
                                year);
                if (reviewGuide != null) {
                    newModel.setReviewGuideId(reviewGuide.getReviewId());
                }
                // 指导评阅审查信息 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
                ListReview reviewCheck = reviewSerivce
                        .findByStuIdAndReviewTypeAndYear(m.getStuId(), "02",
                                year);
                if (reviewCheck != null) {
                    newModel.setReviewCheckId(reviewCheck.getReviewId());
                }
                // 评阅老师评阅信息 评阅审查表类型：00 指导老师评阅 01评阅人评阅 02指导老师审查
                ListReview reviewRead = reviewSerivce
                        .findByStuIdAndReviewTypeAndYear(m.getStuId(), "01",
                                year);
                if (reviewRead != null) {
                    newModel.setReviewReadId(reviewRead.getReviewId());
                }
                // 答辩记录
                DefenseRecord defense = defenseRecordService
                        .findByStuIdAndYear(m.getStuId(), year);
                if (defense != null) {
                    newModel.setDefenseId(defense.getDefenseId());
                }
                newModel.setStudent(m);
                newList.add(newModel);
            }
        }
        newResult.setData(newList);
        newResult.setOffset(oldResult.getOffset());
        newResult.setPage(oldResult.getPage());
        newResult.setSize(oldResult.getSize());
        newResult.setTotal(oldResult.getTotal());
        newResult.setTotalPage(oldResult.getTotalPage());
        return newResult;
    }
}
