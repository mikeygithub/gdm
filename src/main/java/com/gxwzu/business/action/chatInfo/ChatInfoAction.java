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
	private int limit;//每页数目
	private int curr;//当前页码

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

    private File file;//上传文件
	private String fileFileName;//文件名
    private Integer id;//发送者id或群聊id
	private String type;//私聊｜群聊

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

	/**
	 *
	 * @throws Exception
	 */
	public void loadChatLog() throws Exception{

		logger.info("聊天记录接口调用"+fileFileName);

		String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);

		//获取输出流
		PrintWriter out = getResponse().getWriter();
		//发送者id｜群聊id
        out.print(chatInfoSerivce.loadChatLog(id,type,curr,limit,loginName));
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

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }


    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getCurr() {
		return curr;
	}

	public void setCurr(int curr) {
		this.curr = curr;
	}
}
