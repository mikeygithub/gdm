package com.gxwzu.sysVO;

import com.gxwzu.business.model.defenseRecord.DefenseRecord;
import com.gxwzu.business.model.issueInfo.IssueInfo;
import com.gxwzu.system.model.sysTeacher.SysTeacher;

import java.io.Serializable;

/**
 * @Program: gdm
 * @Author: 麦奇
 * @Email： 1625017540@qq.com
 * @Create: 2019-07-06 11:55
 * @Describe：毕业设计答辩记录vo对象
 **/
public class DefenseRecordVO implements Serializable {
    //答辩记录
    private Integer defenseId;
    private String defenseContent;
    private Integer stuId;
    private Integer teacherId;
    private Integer year;
    //课题
    private Integer issueId;
    private String issueName;
    private String issueType;
    //指导老师
    private String teacherNo;
    private String teacherName;
    private String deptNumber;
    private Integer categoryId;
    private Integer staffroomId;
    private Integer technicalId;
    private String dutiesNo;
    private Integer userId;

    public Integer getDefenseId() {
        return defenseId;
    }

    public void setDefenseId(Integer defenseId) {
        this.defenseId = defenseId;
    }

    public String getDefenseContent() {
        return defenseContent;
    }

    public void setDefenseContent(String defenseContent) {
        this.defenseContent = defenseContent;
    }

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getIssueId() {
        return issueId;
    }

    public void setIssueId(Integer issueId) {
        this.issueId = issueId;
    }

    public String getIssueName() {
        return issueName;
    }

    public void setIssueName(String issueName) {
        this.issueName = issueName;
    }

    public String getIssueType() {
        return issueType;
    }

    public void setIssueType(String issueType) {
        this.issueType = issueType;
    }

    public String getTeacherNo() {
        return teacherNo;
    }

    public void setTeacherNo(String teacherNo) {
        this.teacherNo = teacherNo;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getDeptNumber() {
        return deptNumber;
    }

    public void setDeptNumber(String deptNumber) {
        this.deptNumber = deptNumber;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getStaffroomId() {
        return staffroomId;
    }

    public void setStaffroomId(Integer staffroomId) {
        this.staffroomId = staffroomId;
    }

    public Integer getTechnicalId() {
        return technicalId;
    }

    public void setTechnicalId(Integer technicalId) {
        this.technicalId = technicalId;
    }

    public String getDutiesNo() {
        return dutiesNo;
    }

    public void setDutiesNo(String dutiesNo) {
        this.dutiesNo = dutiesNo;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public DefenseRecordVO() {
    }

    public DefenseRecordVO(Integer defenseId, String defenseContent, Integer stuId, Integer teacherId, Integer year, Integer issueId, String issueName, String issueType, String teacherNo, String teacherName, String deptNumber, Integer categoryId, Integer staffroomId, Integer technicalId, String dutiesNo, Integer userId) {
        this.defenseId = defenseId;
        this.defenseContent = defenseContent;
        this.stuId = stuId;
        this.teacherId = teacherId;
        this.year = year;
        this.issueId = issueId;
        this.issueName = issueName;
        this.issueType = issueType;
        this.teacherNo = teacherNo;
        this.teacherName = teacherName;
        this.deptNumber = deptNumber;
        this.categoryId = categoryId;
        this.staffroomId = staffroomId;
        this.technicalId = technicalId;
        this.dutiesNo = dutiesNo;
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "DefenseRecordVO{" +
                "defenseId=" + defenseId +
                ", defenseContent='" + defenseContent + '\'' +
                ", stuId=" + stuId +
                ", teacherId=" + teacherId +
                ", year=" + year +
                ", issueId=" + issueId +
                ", issueName='" + issueName + '\'' +
                ", issueType='" + issueType + '\'' +
                ", teacherNo='" + teacherNo + '\'' +
                ", teacherName='" + teacherName + '\'' +
                ", deptNumber='" + deptNumber + '\'' +
                ", categoryId=" + categoryId +
                ", staffroomId=" + staffroomId +
                ", technicalId=" + technicalId +
                ", dutiesNo='" + dutiesNo + '\'' +
                ", userId=" + userId +
                '}';
    }
}
