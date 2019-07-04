package com.gxwzu.sysVO;

import com.gxwzu.business.model.issueInfo.IssueInfo;
import com.gxwzu.business.model.openReport.OpenReport;
import com.gxwzu.business.model.replyScore.ReplyScore;
import com.gxwzu.business.model.review.Review;
import com.gxwzu.business.model.taskBook.TaskBook;


/**
 * 材料信息
 * @author he
 *
 */
public class MaterialInfo {

	private String deptNumber;
	private Integer majorId;
	private Integer classId;

	private Integer stuId;
	private String stuNo;
	
	private Integer teacherId;
	private Integer year;
	private ListStudent student ;
	private Integer categoryId;
	
	private IssueInfo issueInfo  = new IssueInfo();    //课题
	private Integer taskId ;     //任务书
	private Integer reportId ;   //开题报告
	private Integer progressId ;   //进度情况
	private Integer defenseId;   //答辩记录
	private Integer reviewGuideId; //指导老师评阅表
	private Integer reviewCheckId ;//指导老师审查表
	private Integer reviewReadId; //评阅老师评阅表
	private Integer paperId; //文件表
	private  ListReplyScore groupReply = new ListReplyScore(); //答辩小组成绩及评语表
	private  ListReplyScore deptReply = new ListReplyScore(); //系答辩委员会成绩及评语表
	
	public ListStudent getStudent() {
		return student;
	}
	public void setStudent(ListStudent student) {
		this.student = student;
	}
	
	public String getDeptNumber() {
		return deptNumber;
	}
	public void setDeptNumber(String deptNumber) {
		this.deptNumber = deptNumber;
	}
	public Integer getMajorId() {
		return majorId;
	}
	public void setMajorId(Integer majorId) {
		this.majorId = majorId;
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public Integer getStuId() {
		return stuId;
	}
	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}
	public String getStuNo() {
		return stuNo;
	}
	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}
	public Integer getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}
	
	public IssueInfo getIssueInfo() {
		return issueInfo;
	}
	public void setIssueInfo(IssueInfo issueInfo) {
		this.issueInfo = issueInfo;
	}
	public Integer getTaskId() {
		return taskId;
	}
	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}
	public Integer getReportId() {
		return reportId;
	}
	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}
	public Integer getReviewGuideId() {
		return reviewGuideId;
	}
	public void setReviewGuideId(Integer reviewGuideId) {
		this.reviewGuideId = reviewGuideId;
	}
	public Integer getReviewCheckId() {
		return reviewCheckId;
	}
	public void setReviewCheckId(Integer reviewCheckId) {
		this.reviewCheckId = reviewCheckId;
	}
	public Integer getReviewReadId() {
		return reviewReadId;
	}
	public void setReviewReadId(Integer reviewReadId) {
		this.reviewReadId = reviewReadId;
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
	public Integer getProgressId() {
		return progressId;
	}
	public void setProgressId(Integer progressId) {
		this.progressId = progressId;
	}
	public Integer getDefenseId() {
		return defenseId;
	}
	public void setDefenseId(Integer defenseId) {
		this.defenseId = defenseId;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public Integer getPaperId() {
		return paperId;
	}
	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}

	@Override
	public String toString() {
		return "MaterialInfo{" +
				"deptNumber='" + deptNumber + '\'' +
				", majorId=" + majorId +
				", classId=" + classId +
				", stuId=" + stuId +
				", stuNo='" + stuNo + '\'' +
				", teacherId=" + teacherId +
				", year=" + year +
				", student=" + student +
				", categoryId=" + categoryId +
				", issueInfo=" + issueInfo +
				", taskId=" + taskId +
				", reportId=" + reportId +
				", progressId=" + progressId +
				", defenseId=" + defenseId +
				", reviewGuideId=" + reviewGuideId +
				", reviewCheckId=" + reviewCheckId +
				", reviewReadId=" + reviewReadId +
				", paperId=" + paperId +
				", groupReply=" + groupReply +
				", deptReply=" + deptReply +
				'}';
	}
}
