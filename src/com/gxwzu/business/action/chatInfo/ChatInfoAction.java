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
	private String uploadFileName; // 上传文件名
	private String uploadContentType; // 上传文件类型
	private int code = 0; //判断是否上传成功 0-不成功，1-上传成功
	private Integer teaPrivateChat;//老师发给学生的未读条数
	
	
	/************************** 方法类 **************************************************************************************/
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	/**
	 * 查询年度
	 * 
	 * @return
	 */
	public String list() {
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 打开添加聊天对象
	 * 
	 * @return
	 */
	public String openChat() {
		try {
			String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
			String type = (String) getSession().getAttribute(SystemContext.USERTYPE);
			// 查询安排计划年度
			planYear = planYearSerivce.findPlanYear();
			
			List<ChatInfo> chatInfoPrivateList = null;
			List<ChatInfo> chatInfoGroupList = null;

			//私聊
			if(null != model.getChatType() && "1".equals(model.getChatType())){
				//学生
				if ("1".equals(type)) {
					ListStudent student = sysStudentService.findByStuNo(loginName);
					model.setSenderId(student.getStuId());
				//老师
				} else if ("2".equals(type)) {
					ListTeacher teacherList = sysTeacherService
							.findByTeacherNo(loginName);
					model.setSenderId(teacherList.getTeacherId());
				}
				if (thisType != null && thisId != null) {
					if ("1".equals(thisType)) {
						student = sysStudentService.findViewModelById(thisId);
					} else if ("2".equals(thisType)) {
						teacherList = sysTeacherService.findModelById(thisId);
					}
				}
				chatInfoSerivce.updateReadType(model.getSenderId(),thisId,"0");
		    //群聊
			}else{
				//学生
				if ("1".equals(type)) {
					ListStudent student = sysStudentService.findByStuNo(loginName);
					model.setSenderId(student.getStuId());
					// 指导老师查询自己所带学生相关信息
					AllotGuide allotGuide = allotGuideService.findByStuIdAndYear(
							student.getStuId(), planYear.getYear());
					if (allotGuide != null && allotGuide.getTeacherId() != null) {
						// 指导老师查询自己所带学生
						guideStudentList = materialInfoSerivce.findGuideStudent(
								allotGuide.getTeacherId(), planYear.getYear());
						String s = student.getStuId().toString();
						for (int i = 0; i < guideStudentList.size(); i++) {
							//CategoryId为未阅读条数（群聊）
							chatInfoGroupList = 
									chatInfoSerivce.findByAnswerId(1,guideStudentList.get(i).getStudent().getStuId(),"0","");
							for (int j = 0; j < chatInfoGroupList.size(); j++) {
								String readTypes = "";
								if(chatInfoGroupList.get(j).getReadType().contains(s)){
									String array[] = chatInfoGroupList.get(j).getReadType().split(",");
									for (int k = 0; k < array.length; k++) {
										if(!array[k].equals(s)){
											readTypes += array[k] + ",";
										}
									}
								}else{
									readTypes = chatInfoGroupList.get(j).getReadType();
								}
								chatInfoSerivce.updateByChatId(chatInfoGroupList.get(j).getChatId(),readTypes);
							}
						}
						
						chatInfoGroupList = chatInfoSerivce.findByAnswerId(1,allotGuide.getTeacherId(),"0","");
						for (int j = 0; j < chatInfoGroupList.size(); j++) {
							String readTypes = "";
							if(chatInfoGroupList.get(j).getReadType().contains(s)){
								String array[] = chatInfoGroupList.get(j).getReadType().split(",");
								for (int k = 0; k < array.length; k++) {
									if(!array[k].equals(s)){
										readTypes += array[k] + ",";
									}
								}
							}else{
								readTypes = chatInfoGroupList.get(j).getReadType();
							}
							chatInfoSerivce.updateByChatId(chatInfoGroupList.get(j).getChatId(),readTypes);
						}
					}
				//老师	
				} else if ("2".equals(type)) {
					ListTeacher teacherList = sysTeacherService
							.findByTeacherNo(loginName);
					model.setSenderId(teacherList.getTeacherId());
					
					String tea = teacherList.getTeacherId().toString();
					// 指导老师查询自己所带学生相关信息
					guideStudentList = materialInfoSerivce.findGuideStudent(
							teacherList.getTeacherId(), planYear.getYear());
					for (int i = 0; i < guideStudentList.size(); i++) {
						//CategoryId为未阅读条数（群聊）
						 chatInfoGroupList = 
								chatInfoSerivce.findByAnswerId(1,guideStudentList.get(i).getStudent().getStuId(),"0","");
						 for (int j = 0; j < chatInfoGroupList.size(); j++) {
							String readTypes = ""; 
							if(chatInfoGroupList.get(j).getReadType().contains(tea)){
								String array[] = chatInfoGroupList.get(j).getReadType().split(",");
								for (int k = 0; k < array.length; k++) {
									if(!array[k].equals(tea)){
										readTypes += array[k] + ",";
									}
								}
							}else{
								readTypes = chatInfoGroupList.get(j).getReadType();
							}
							chatInfoSerivce.updateByChatId(chatInfoGroupList.get(j).getChatId(),readTypes);
						 }
					}
				}

				if (thisType != null && thisId != null) {
					if ("1".equals(thisType)) {
						student = sysStudentService.findViewModelById(thisId);
					} else if ("2".equals(thisType)) {
						teacherList = sysTeacherService.findModelById(thisId);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 打开群聊页面
	 * 
	 * @return
	 */
	public String openGroupChat() {
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 交流成员列表
	 * 
	 * @return
	 */
	public void loadChatInfoList() {
		logger.info(" 成员信息列表");
		try {
			PrintWriter out = getResponse().getWriter();

			ResponeJson rJson = new ResponeJson();
			List<Object> list = new ArrayList<Object>();

			String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
			String type = (String) getSession().getAttribute(SystemContext.USERTYPE);
			
			List<ChatInfo> chatInfoPrivateList = null;
			List<ChatInfo> chatInfoGroupList = null;
			
			// 查询安排计划年度
			planYear = planYearSerivce.findPlanYear();
			if (type.equals("2")) {
				ListTeacher teacher = sysTeacherService.findByTeacherNo(loginName);
				thisId = teacher.getTeacherId();
				// 指导老师查询自己所带学生相关信息
				guideStudentList = materialInfoSerivce.findGuideStudent(teacher.getTeacherId(), planYear.getYear());
				for (int i = 0; i < guideStudentList.size(); i++) {
					String s = guideStudentList.get(i).getStudent().getStuId().toString();
					
					chatInfoPrivateList = chatInfoSerivce.findByAnswerId(teacher.getTeacherId(),guideStudentList.get(i).getStudent().getStuId(),"1","1");
				
					//classId为未阅读条数（私聊）
					guideStudentList.get(i).setClassId(chatInfoPrivateList.size());
					//CategoryId为未阅读条数（群聊）
					 chatInfoGroupList = chatInfoSerivce.findByAnswerId(1,guideStudentList.get(i).getStudent().getStuId(),"0","");
					int size = chatInfoGroupList.size();
					for (int j = 0; j < chatInfoGroupList.size(); j++) {
						if(!chatInfoGroupList.get(j).getReadType().contains(s)){
							size = size - 1;
						}
					}
					guideStudentList.get(i).setCategoryId(size);
					chatInfoPrivateList = 
							chatInfoSerivce.findByAnswerId(student.getStuId(),teacher.getTeacherId(),"1","1");
					teaPrivateChat = chatInfoPrivateList.size();
					//TechnicalId为老师发送给学生的未阅读条数（私聊）
					teacher.setTechnicalId(teaPrivateChat);
				}
				list.add(guideStudentList);
				list.add(teacher);
				list.add(thisId);
				list.add(2);
				rJson.setObj(list);
				rJson.setSuccess(true);
			} else if (type.equals("1")) {
				ListStudent student = sysStudentService.findByStuNo(loginName);
				thisId = student.getStuId();
				// 指导老师查询自己所带学生相关信息
				AllotGuide allotGuide = allotGuideService.findByStuIdAndYear(student.getStuId(), planYear!=null&&planYear.getYear()!=null?planYear.getYear():null);
			
				if (allotGuide != null && allotGuide.getTeacherId() != null) {
					ListTeacher teacher = sysTeacherService
							.findModelById(allotGuide.getTeacherId());
					
					// 指导老师查询自己所带学生
					guideStudentList = materialInfoSerivce.findGuideStudent(
							allotGuide.getTeacherId(), planYear.getYear());
					for (int i = 0; i < guideStudentList.size(); i++) {
						String s = guideStudentList.get(i).getStudent().getStuId().toString();
						//System.out.println("s:"+s);
						
					    chatInfoPrivateList = 
								chatInfoSerivce.findByAnswerId(student.getStuId(),guideStudentList.get(i).getStudent().getStuId(),"1","1");
					
						//classId为未阅读条数（私聊）
						guideStudentList.get(i).setClassId(chatInfoPrivateList.size());
						//CategoryId为未阅读条数（群聊）
						chatInfoGroupList = 
								chatInfoSerivce.findByAnswerId(1,guideStudentList.get(i).getStudent().getStuId(),"0","");
						int size = chatInfoGroupList.size();
						for (int j = 0; j < chatInfoGroupList.size(); j++) {
							if(!chatInfoGroupList.get(j).getReadType().contains(s)){
								size = size - 1;
							}
						}
						
						guideStudentList.get(i).setCategoryId(size);
					}
					
					chatInfoPrivateList = chatInfoSerivce.findByAnswerId(student.getStuId(),allotGuide.getTeacherId(),"1","1");
					teaPrivateChat = chatInfoPrivateList.size();
					//TechnicalId为老师发送给学生的未阅读条数（私聊）
					teacher.setTechnicalId(teaPrivateChat);
					
					
					list.add(guideStudentList);
					list.add(teacher);
					list.add(thisId);
					list.add(1);
				}
				rJson.setObj(list);
				rJson.setSuccess(true);
			}
			out.print(new Gson().toJson(rJson));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 加载群聊条数
	public void loadGroupChat(){
		logger.info(" 成员信息列表");
		try {
			PrintWriter out = getResponse().getWriter();

			ResponeJson rJson = new ResponeJson();
			List<Object> list = new ArrayList<Object>();
			String loginName = (String) getSession().getAttribute(
					SystemContext.LOGINNAME);
			String type = (String) getSession().getAttribute(
					SystemContext.USERTYPE);
			
			List<ChatInfo> chatInfoGroupList = null;
			
			Integer groupChatNum = 0;
			
			// 查询安排计划年度
			planYear = planYearSerivce.findPlanYear();
			//老师
			if (type.equals("2")) {
				ListTeacher teacher = sysTeacherService
						.findByTeacherNo(loginName);
				// 指导老师查询自己所带学生相关信息
				guideStudentList = materialInfoSerivce.findGuideStudent(
						teacher.getTeacherId(), planYear.getYear());
				
				String tea = teacher.getTeacherId().toString();
				
				for (int i = 0; i < guideStudentList.size(); i++) {
					//CategoryId为未阅读条数（群聊）
					chatInfoGroupList = 
							chatInfoSerivce.findByAnswerId(1,guideStudentList.get(i).getStudent().getStuId(),"0","");
					int size = chatInfoGroupList.size();
					for (int j = 0; j < chatInfoGroupList.size(); j++) {
						if(!chatInfoGroupList.get(j).getReadType().contains(tea)){
							size = size - 1;
						}
					}
					groupChatNum += size;
				}
				list.add(groupChatNum);
				
				rJson.setObj(list);
				rJson.setSuccess(true);
			//学生
			} else if (type.equals("1")) {
				ListStudent student = sysStudentService.findByStuNo(loginName);
				// 指导老师查询自己所带学生相关信息
				AllotGuide allotGuide = allotGuideService.findByStuIdAndYear(student.getStuId(), planYear!=null&&planYear.getYear()!=null?planYear.getYear():null);

				String stu = student.getStuId().toString();
				
				if (allotGuide != null && allotGuide.getTeacherId() != null) {
					// 指导老师查询自己所带学生
					guideStudentList = materialInfoSerivce.findGuideStudent(
							allotGuide.getTeacherId(), planYear.getYear());
					for (int i = 0; i < guideStudentList.size(); i++) {
						String s = guideStudentList.get(i).getStudent().getStuId().toString();
						
						//CategoryId为未阅读条数（群聊）
						
						chatInfoGroupList = 
								chatInfoSerivce.findByAnswerId(1,guideStudentList.get(i).getStudent().getStuId(),"0","");
						int size = chatInfoGroupList.size();
						for (int j = 0; j < chatInfoGroupList.size(); j++) {
							if(!chatInfoGroupList.get(j).getReadType().contains(stu)){
								size = size - 1;
							}
						}
						groupChatNum += size;
					}
					
					
					chatInfoGroupList = 
							chatInfoSerivce.findByAnswerId(1,allotGuide.getTeacherId(),"0","");
					int size = chatInfoGroupList.size();
					for (int j = 0; j < chatInfoGroupList.size(); j++) {
						if(!chatInfoGroupList.get(j).getReadType().contains(stu)){
							size = size - 1;
						}
					}
					groupChatNum += size;
					
				}
				list.add(groupChatNum);
				rJson.setObj(list);
				rJson.setSuccess(true);
			}
			out.print(new Gson().toJson(rJson));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 私聊天记录
	public void loadChatMessageList() {
		logger.info(" 私聊天记录 ");
		try {
			PrintWriter out = getResponse().getWriter();
			Integer userId = null;
			Integer answerId = null;
			ResponeJson rJson = new ResponeJson();
			try {
				String loginName = (String) getSession().getAttribute(
						SystemContext.LOGINNAME);
				String type = (String) getSession().getAttribute(
						SystemContext.USERTYPE);
				if (thisId != null && thisType != null) {
					if ("1".equals(thisType)) {
						student = sysStudentService.findViewModelById(thisId);
						answerId = student.getStuId();
					} else if ("2".equals(thisType)) {
						teacherList = sysTeacherService.findModelById(thisId);
						answerId = teacherList.getTeacherId();
					}
					if ("1".equals(type)) {
						ListStudent student = sysStudentService
								.findByStuNo(loginName);
						userId = student.getStuId();
					} else if ("2".equals(type)) {
						ListTeacher teacherList = sysTeacherService
								.findByTeacherNo(loginName);
						userId = teacherList.getTeacherId();
					}
					chatInfoList = chatInfoSerivce.findByUserIdAndAnswerId(userId, answerId,model.getChatType());
					rJson.setObj(chatInfoList);
					rJson.setSuccess(true);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			out.print(new Gson().toJson(rJson));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 群聊天记录
	public void loadGuideChatMessageList() {
		logger.info(" 群聊天记录 ");
		try {
			PrintWriter out = getResponse().getWriter();
			ListTeacher teacher = null;
			ResponeJson rJson = new ResponeJson();
			String loginName = (String) getSession().getAttribute(
					SystemContext.LOGINNAME);
			String type = (String) getSession().getAttribute(
					SystemContext.USERTYPE);
			// 查询安排计划年度
			planYear = planYearSerivce.findPlanYear();
			
			int teacherId = -1;//临时的teacherId
			if (type.equals("2")) {
				teacher = sysTeacherService.findByTeacherNo(loginName);
				teacherId = teacher.getTeacherId();
				
			} else if (type.equals("1")) {
				ListStudent student = sysStudentService.findByStuNo(loginName);
				// 指导老师查询自己所带学生相关信息
				AllotGuide allotGuide = allotGuideService.findByStuIdAndYear(
						student.getStuId(), planYear.getYear());
				if (allotGuide != null && allotGuide.getTeacherId() != null) {
					teacher = sysTeacherService.findModelById(allotGuide
							.getTeacherId());
					teacherId = allotGuide.getTeacherId();
					// 指导老师查询自己所带学生相关信息
				}
			}
			logger.info("teacherId:"+teacherId);
			
			if (teacher != null||teacherId != -1) {
				List<ListStudentAllotGuide> allotGuideStudentList = allotGuideService.findStudentsByTeacherIdAndYear(teacherId,
						planYear.getYear());
			    List<ListChatInfo> lt = chatInfoSerivce.findByGuideTreacherId(
						teacher.getTeacherId(), planYear.getYear(),model.getChatType(),allotGuideStudentList);
				rJson.setObj(lt);
				rJson.setSuccess(true);
			}
			out.print(new Gson().toJson(rJson));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 添加聊天信息到数据库
	 * 
	 * @return
	 * @throws IOException
	 */
	public void addChat() throws Exception {
		ResponeJson rJson = new ResponeJson();
		ChatFile cFile = (ChatFile) ActionContext.getContext().getSession().get("cFile"); 
		String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
		String type = (String) getSession().getAttribute(SystemContext.USERTYPE);
		// 查询安排计划年度
		planYear = planYearSerivce.findPlanYear();
		PrintWriter out = getResponse().getWriter();
		if (model != null && model.getAnswerId() != null
				&& model.getSenderContent() != null) {
			if ("1".equals(type)) {
				ListStudent student = sysStudentService.findByStuNo(loginName);
				model.setSenderId(student.getStuId());
				model.setSenderName(student.getStuName());
				if(model.getChatType().equals("1")){
					model.setReadType("1");
				}else{
					AllotGuide allotGuide = allotGuideService.findByStuIdAndYear(
							student.getStuId(), planYear.getYear());
					guideStudentList = materialInfoSerivce.findGuideStudent(
							allotGuide.getTeacherId(), planYear.getYear());
					
					String readTypes = allotGuide.getTeacherId()+",";
					for (int i = 0; i < guideStudentList.size(); i++) {
						if(student.getStuId() - guideStudentList.get(i).getStudent().getStuId() != 0){
							readTypes += guideStudentList.get(i).getStudent().getStuId()+","; 
						}
					}
					
					System.out.println("readTypes:"+readTypes);
					model.setReadType(readTypes);
				}
			} else if ("2".equals(type)) {
				ListTeacher teacherList = sysTeacherService
						.findByTeacherNo(loginName);
				model.setSenderId(teacherList.getTeacherId());
				model.setSenderName(teacherList.getTeacherName());
				if(model.getChatType().equals("1")){
					model.setReadType("1");
				}else{
					guideStudentList = materialInfoSerivce.findGuideStudent(
							teacherList.getTeacherId(), planYear.getYear());
					String readTypes = "";
					for (int i = 0; i < guideStudentList.size(); i++) {
						readTypes += guideStudentList.get(i).getStudent().getStuId()+","; 
					}
					System.out.println("readTypes:"+readTypes);
					model.setReadType(readTypes);
				}
			}

			model.setSendTime(Timestamp.valueOf(DateUtils.formatTime(new Date())));
            model.setYear(planYear.getYear());
            if(cFile != null){
             	if(cFile.getFileType().equals("1")){
            		model.setContType("1");
            	}else{
            		model.setContType("2");
            	}
            }else{
            	model.setContType("0");
            }
            //添加交流信息到数据库
			model = chatInfoSerivce.add(model);
			if(cFile != null){
				//保存上传的文件消息
				cFile.setChatInfoId(model.getChatId());
		    	cFile = chatFileSerivce.add(cFile);
			}
			//保存成功后，销毁chatFile实体
			getSession().removeAttribute(SystemContext.CFILE);  
			if (model.getChatId() != null && fileIds != null) {
				String[] chatFiles = fileIds.split(",");
				for (String fileId : chatFiles) {
					ChatFile chatFile = chatFileSerivce.get(ChatFile.class,
							Integer.parseInt(fileId));
					chatFile.setChatInfoId(model.getChatId());
					chatFileSerivce.update(chatFile);
				}
			}
			ListChatInfo chatInfo = chatInfoSerivce.findViewModelById(model.getChatId());
			
			rJson.setSuccess(true);
			rJson.setObj(chatInfo);
		}
		out.print(new Gson().toJson(rJson));
		out.flush();
		out.close();
	}

	/**
	 * 上传聊天信息文件
	 * 
	 * @return
	 * @throws IOException
	 */
	public void uploadChartFile() throws Exception {
		logger.info("聊天文件上传 ");
		ResponeJson rJson = new ResponeJson();
		PrintWriter out = getResponse().getWriter();
		String filePath = upload();
		ChatFile cFile = new ChatFile();
		if (filePath != null) {
			cFile.setFileName(uploadFileName);
			cFile.setFilePath(filePath);
			String targetFileName = uploadFileName.substring(uploadFileName
					.lastIndexOf(".")); // 文件后缀

			if (".jpg,.png,.gif,.jpeg".contains(targetFileName)) {
				cFile.setFileType("1");
			} else {
				cFile.setFileType("2");
			}
			//cFile = chatFileSerivce.add(cFile);
			cFile.setCode(code);
			ActionContext.getContext().getSession().put("cFile", cFile);
			rJson.setSuccess(true);
			rJson.setObj(cFile);
		}
		out.print(new Gson().toJson(cFile));
		out.flush();
		out.close();
	}
	/**
	 * 上传文件
	 * @return
	 */
	public String upload() {
		String filePath = null;
		logger.info("上传 ");
		logger.info("文件： "+upload);
		if (upload != null) {
			
			String targetFileName = uploadFileName.substring(uploadFileName
					.lastIndexOf(".")); // 文件后缀
			logger.info("后缀： "+targetFileName);
			// 得到文件后缀判断文件类型
			String name = uploadFileName.substring(0,
					uploadFileName.lastIndexOf(".")); // 文件名
			logger.info("名： "+name);

			// 文件名组装：UUID.后缀
			targetFileName = UidUtils.UID() + "_" + name + targetFileName; // 上传的文件
			// 1-保存附件；
			String targetDirectory = ServletActionContext.getServletContext()
					.getRealPath(savePath); // 文件的绝对路径

			File target = new File(targetDirectory, targetFileName);

			logger.info("路径： "+savePath);

			try {
				FileUtils.copyFile(upload, target);
				filePath = savePath + "/" + targetFileName;
				code = 1;
			} catch (IOException e) {
				System.out.println("上传出错：" + e);
				code = 0;
				return null;
			}
		}
		return filePath;
	}
	
	/**
	 * 下载单个文件
	 * @return
	 * @throws UnsupportedEncodingException
	 */
   	public String downLoad() throws UnsupportedEncodingException{
   		savePath = java.net.URLDecoder.decode(savePath,"UTF-8");
   		String name = java.net.URLDecoder.decode(model.getSenderContent(),"UTF-8");
   		ServletOutputStream ouputStream = null;
   		InputStream inputStream = null;
   		try {
   		    //取得绝对路径
   			String path = ServletActionContext.getServletContext()
					.getRealPath(savePath); // 文件的绝对路径
   	        //下载的文件名
	   	    byte[] bytes = name.getBytes();
	   	    
	   	    String fileName = new String(bytes,"ISO-8859-1");
	   	    File file = new File(path);
   			if(!file.exists()){
			    System.out.println("文件不存在");
		    }
   			response = getResponse();
			response.reset();
			//设置相应类型application/octet-stream
			response.setContentType("application/octet-stream;charset=ISO8859-1");
			//设置头信息
			response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\"");
			inputStream = new FileInputStream(file);
			ouputStream = response.getOutputStream();
			byte b[] = new byte[1024];
			int n ;
			while((n = inputStream.read(b)) != -1){
				ouputStream.write(b,0,n);
				
			}
		} catch (Exception e) {
			
		}finally{
				//关闭流、释放资源
			if(null != ouputStream){
				try {
					ouputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(null != inputStream){
				try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}	
		}
		return null;		
   	}


   	////////////////////////////////////////////重构聊天//////////////////////////////////////////

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


}
