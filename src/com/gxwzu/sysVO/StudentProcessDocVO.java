package com.gxwzu.sysVO;

import com.gxwzu.business.model.defenseRecord.DefenseRecord;
import com.gxwzu.business.model.openReport.OpenReport;
import com.gxwzu.business.model.taskBook.TaskBook;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.model.sysTechnical.SysTechnical;

import java.util.ArrayList;
import java.util.List;

/**
 * @ProjectName gdm
 * @Author 麦奇
 * @Email biaogejiushibiao@outlook.com
 * @Date 8/14/19 11:15 AM
 * @Version 1.0
 * 学生过程文档：包含全部信息
 **/

public class StudentProcessDocVO {
    //学生
    private ListStudent listStudent = new ListStudent();
    //指导老师
    private SysTeacher sysTeacher = new SysTeacher();
    private SysTechnical sysTechnical = new SysTechnical();
    //任务书
    private TaskBook taskBook = new TaskBook();
    //开题报告
    private OpenReport openReport = new OpenReport();
    //进展情况记录
    private List<ListProgressSitu> progressSitus = new ArrayList<>();
    //论文（设计）评阅表（指导教师用）
    private ListReview listReviewReadGuide = new ListReview();
    //论文（设计）评阅表（评阅教师用）
    private ListReview listReviewReadTeacher = new ListReview();
    //规范审查表（指导教师用）
    private ListReview listReviewCheckTeacher = new ListReview();
    //答辩过程记录表
    private List<DefenseRecord> defenseRecordVOS = new ArrayList<>();
    //答辩小组成绩及评语表
    private  ListReplyScore groupReply = new ListReplyScore();
    //系答辩委员会成绩及评语表
    private  ListReplyScore deptReply = new ListReplyScore();

    public ListStudent getListStudent() {
        return listStudent;
    }

    public void setListStudent(ListStudent listStudent) {
        this.listStudent = listStudent;
    }


    public OpenReport getOpenReport() {
        return openReport;
    }

    public void setOpenReport(OpenReport openReport) {
        this.openReport = openReport;
    }

    public List<ListProgressSitu> getProgressSitus() {
        return progressSitus;
    }

    public void setProgressSitus(List<ListProgressSitu> progressSitus) {
        this.progressSitus = progressSitus;
    }

    public ListReview getListReviewReadGuide() {
        return listReviewReadGuide;
    }

    public void setListReviewReadGuide(ListReview listReviewReadGuide) {
        this.listReviewReadGuide = listReviewReadGuide;
    }

    public ListReview getListReviewReadTeacher() {
        return listReviewReadTeacher;
    }

    public void setListReviewReadTeacher(ListReview listReviewReadTeacher) {
        this.listReviewReadTeacher = listReviewReadTeacher;
    }

    public ListReview getListReviewCheckTeacher() {
        return listReviewCheckTeacher;
    }

    public void setListReviewCheckTeacher(ListReview listReviewCheckTeacher) {
        this.listReviewCheckTeacher = listReviewCheckTeacher;
    }

    public List<DefenseRecord> getDefenseRecordVOS() {
        return defenseRecordVOS;
    }

    public void setDefenseRecordVOS(List<DefenseRecord> defenseRecordVOS) {
        this.defenseRecordVOS = defenseRecordVOS;
    }

    public ListReplyScore getGroupReply() {
        return groupReply;
    }

    public void setGroupReply(ListReplyScore groupReply) {
        this.groupReply = groupReply;
    }

    public ListReplyScore getDeptReply() {
        return deptReply;
    }

    public void setDeptReply(ListReplyScore deptReply) {
        this.deptReply = deptReply;
    }

    public TaskBook getTaskBook() {
        return taskBook;
    }

    public void setTaskBook(TaskBook taskBook) {
        this.taskBook = taskBook;
    }

    public SysTeacher getSysTeacher() {
        return sysTeacher;
    }

    public void setSysTeacher(SysTeacher sysTeacher) {
        this.sysTeacher = sysTeacher;
    }

    public SysTechnical getSysTechnical() {
        return sysTechnical;
    }

    public void setSysTechnical(SysTechnical sysTechnical) {
        this.sysTechnical = sysTechnical;
    }
}
