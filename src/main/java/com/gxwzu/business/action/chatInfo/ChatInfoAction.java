package com.gxwzu.business.action.chatInfo;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;

import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.userHelp.IUserHelpService;
import com.gxwzu.util.R;
import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.chatInfo.ChatFile;
import com.gxwzu.business.model.chatInfo.ChatInfo;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.chatInfo.IChatFileService;
import com.gxwzu.business.service.chatInfo.IChatInfoService;
import com.gxwzu.business.service.materialInfo.IMaterialInfoSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.model.ResponeJson;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.DateUtils;
import com.gxwzu.core.util.UidUtils;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListAllotGuide;
import com.gxwzu.sysVO.ListChatInfo;
import com.gxwzu.sysVO.ListGroupAllot;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListStudentAllotGuide;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.sysVO.ListTeacherGuideCount;
import com.gxwzu.sysVO.MaterialInfo;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 交流互动信息
 * 
 * @author 黎艺侠
 * @date 2017.10.07
 */
public class ChatInfoAction extends BaseAction implements ModelDriven<ChatInfo> {

	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());

	/*********************** 实例化ModelDriven ******************************/
	private ChatInfo model = new ChatInfo();

	@Override
	public ChatInfo getModel() {
		return model;
	}

	public void setModel(ChatInfo model) {
		this.model = model;
	}

	/*********************** Service接口注入 ***************************/
	@Autowired
	private IChatInfoService chatInfoSerivce; // 年度计划接口
	@Autowired
	private IPlanYearSerivce planYearSerivce; // 年度计划接口
	@Autowired
	private ISysTeacherService sysTeacherService; // 老师分配接口
	@Autowired
	private ISysStudentService sysStudentService; // 学生接口
	@Autowired
	private IAllotGuideService allotGuideService; // 指导分配接口
	@Autowired
	private IMaterialInfoSerivce materialInfoSerivce; // 学生相关材料接口
	@Autowired
	private IChatFileService chatFileSerivce; // 聊天文件接口

	/*********************** 实体 ***************************/
	private PlanYear planYear; // 年度计划实体
	private ListTeacher teacherList = new ListTeacher(); // 老师实体
	private List<MaterialInfo> guideStudentList = new ArrayList<MaterialInfo>(); // 学生相关材料信息

	/******************** 集合变量声明 *********************/
	private Result<ListTeacherGuideCount> pageResult; // 年度计划分页
	private List<ListAllotGuide> planYearList; // 年度计划信息列表（用于查询全部）
	private ListStudent student = new ListStudent(); // 学生实体
	private List<ListChatInfo> chatInfoList = new ArrayList<ListChatInfo>(); // 聊天信息信息列表
	private SysTeacher sysTeacher = new SysTeacher(); // 老师实体
	private ListGroupAllot groupAllot = new ListGroupAllot();

	/************************** 基础变量声明 **************/
	private Integer thisId;
	private String thisType;
	private String fileIds; // 已上传文件ID
	private String mark;
	private String savePath; // 保存路径

	private File upload;// 上传的文件
    private File file;//上传文件
	private String fileFileName;
	private String uploadFileName; // 上传文件名
	private String uploadContentType; // 上传文件类型
	private int code = 0; //判断是否上传成功 0-不成功，1-上传成功
	private Integer teaPrivateChat;//老师发给学生的未读条数

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}


	/************************** 方法类 **************************************************************************************/

	/**
	 * 加载聊天面板好友
	 */
	public void loadChatFriend() throws Exception{
		//获取输出流
		PrintWriter out = getResponse().getWriter();
		//判断用户角色
		String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
		//当前年度
		planYear = planYearSerivce.findPlanYear();
		//查询获取好友列表
		R r = chatInfoSerivce.loadChatFriend(planYear, loginName);
		out.print(new Gson().toJson(r));
		out.flush();
		out.close();
	}

	/**
	 * 获取群员列表
	 */
	public void loadGroupMembers() throws Exception{
		//获取输出流
		PrintWriter out = getResponse().getWriter();
		//判断用户角色
		String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
		//当前年度
		planYear = planYearSerivce.findPlanYear();
		//查询获取好友列表
		R r = chatInfoSerivce.loadGroupMembers(planYear, loginName);
		out.print(new Gson().toJson(r));
		out.flush();
		out.close();
	}

	/**
	 * 上传聊天文件
	 * @Return
     */
	public void uploadChatFile() throws Exception{
		logger.info("上传文件接口调用"+fileFileName);
        //获取输出流
        PrintWriter out = getResponse().getWriter();
        out.print(chatInfoSerivce.uploadChatFile(file,fileFileName).toString());
        out.flush();
        out.close();
	}




	/********************************************** getter and setter方法 ************************************************************************/

	public PlanYear getPlanYear() {
		return planYear;
	}

	public void setPlanYear(PlanYear planYear) {
		this.planYear = planYear;
	}

	public Result<ListTeacherGuideCount> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<ListTeacherGuideCount> pageResult) {
		this.pageResult = pageResult;
	}

	public List<ListAllotGuide> getPlanYearList() {
		return planYearList;
	}

	public void setPlanYearList(List<ListAllotGuide> planYearList) {
		this.planYearList = planYearList;
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

	public ListTeacher getTeacherList() {
		return teacherList;
	}

	public void setTeacherList(ListTeacher teacherList) {
		this.teacherList = teacherList;
	}

	public ListStudent getStudent() {
		return student;
	}

	public void setStudent(ListStudent student) {
		this.student = student;
	}

	public List<ListChatInfo> getChatInfoList() {
		return chatInfoList;
	}

	public void setChatInfoList(List<ListChatInfo> chatInfoList) {
		this.chatInfoList = chatInfoList;
	}

	public SysTeacher getSysTeacher() {
		return sysTeacher;
	}

	public void setSysTeacher(SysTeacher sysTeacher) {
		this.sysTeacher = sysTeacher;
	}

	public List<MaterialInfo> getGuideStudentList() {
		return guideStudentList;
	}

	public void setGuideStudentList(List<MaterialInfo> guideStudentList) {
		this.guideStudentList = guideStudentList;
	}

	public ListGroupAllot getGroupAllot() {
		return groupAllot;
	}

	public void setGroupAllot(ListGroupAllot groupAllot) {
		this.groupAllot = groupAllot;
	}

	public String getThisType() {
		return thisType;
	}

	public void setThisType(String thisType) {
		this.thisType = thisType;
	}

	public String getFileIds() {
		return fileIds;
	}

	public void setFileIds(String fileIds) {
		this.fileIds = fileIds;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public Integer getTeaPrivateChat() {
		return teaPrivateChat;
	}

	public void setTeaPrivateChat(Integer teaPrivateChat) {
		this.teaPrivateChat = teaPrivateChat;
	}

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }
}
