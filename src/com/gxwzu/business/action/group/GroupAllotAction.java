package com.gxwzu.business.action.group;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxwzu.business.model.group.GroupAllot;
import com.gxwzu.business.model.group.GroupDefenseDirection;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.progressSitu.ProgressSitu;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.group.IGroupAllotService;
import com.gxwzu.business.service.group.IGroupDefenseDirectionService;
import com.gxwzu.business.service.group.IGroupStudentService;
import com.gxwzu.business.service.group.IGroupTeacherService;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.util.poi.ExcelSheetModel;
import com.gxwzu.core.util.poi.MergingExcelUtils;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListGroupAllot;
import com.gxwzu.sysVO.ListGroupAllotExport;
import com.gxwzu.sysVO.ListProgressSitu;
import com.gxwzu.system.model.sysClassroom.SysClassroom;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.service.sysClassroom.ISysClassroomService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 分组管理
 * @author 黎艺侠
 */
public class GroupAllotAction extends BaseAction implements ModelDriven<GroupAllot>{
	
	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());
	
	/*********************** 实例化ModelDriven ******************************/
	private GroupAllot model = new GroupAllot();
	private ListGroupAllot groupAllot = new ListGroupAllot();
	private PlanYear planYear; // 年度计划实体
	
	@Override
	public GroupAllot getModel() {
		return model;
	}
 
	public void setModel(GroupAllot model){
		this.model = model;
	}
	
	/*********************** 注入Service ******************************/
	@Autowired
	private IGroupAllotService groupAllotService;
	@Autowired
	private IGroupTeacherService groupTeacherService;
	@Autowired
	private IGroupStudentService groupStudentService;
	@Autowired
	private IGroupDefenseDirectionService groupDefenseDirectionService;//分组答辩方向接口
	@Autowired
	private ISysTeacherService sysTeacherService;      //老师
	@Autowired
	private IAllotGuideService allotGuideService;      //指导老师分配接口
	@Autowired
	private ISysStudentService sysStudentService;      //学生接口
	@Autowired
	private ISysClassroomService sysClassroomService; //教师接口
	@Autowired
	private ISysMajorService sysMajorService; // 专业教研室
	
	@Autowired
	private IPlanYearSerivce planYearSerivce; // 年度计划接口
	/*********************** 声明列表参数 ******************************/
	private Result<ListGroupAllot> pageResult = new Result<ListGroupAllot>();        //分组集合
	private List<SysClassroom> classRoomList = new ArrayList<SysClassroom>();        //教室组集合
	private List<SysMajor> majorList = new ArrayList<SysMajor>();
	/*********************** 声明参数 ******************************/
	private Integer thisId;
	private String mark;
	private String categoryIds; //答辩方向Id ,隔开
	
	private String  teachType;  //分组老师类型
	private Integer thisGroupId; //分组Id
	private Integer thisYear; //分组年度
	private List<Integer> categoryList = new ArrayList<Integer>(); //答辩方向Id 
	
	/******************** 报表导出参数 *************************/
	private InputStream isStream;
	private String fileName; // 文件名称
	private Integer fileLength; // 文件大小
	private String modelPath;// 直接在struts.xml文件中配置的属性

	//导入excel
	private List<File> excelFile;
	
	/************************** 方法类 **************************/
	@Override
	public String execute() throws Exception{
		return SUCCESS;
	}
	
	/**
	 * 老师分组管理列表
	 * @return
	 */
	public String list(){
		try{
			//查询安排计划年度
			planYear = planYearSerivce.findPlanYear();
			if(model.getYear()==null){
				model.setYear(planYear.getYear());
			}
			
			pageResult = groupAllotService.find(model,getPage(),getRow());
			
			footer = PageUtil.pageFooter(pageResult, getRequest());
		}catch(Exception e){
			e.printStackTrace();
		}
		return SUCCESS;
	}

	
	/**
	 * 打开添加分组页面
	 * @return
	 */
	public String openAdd(){
		try{
			//查询安排计划年度
			planYear = planYearSerivce.findPlanYear();
			if(model.getYear()==null){
				model.setYear(planYear.getYear());
			}
			if(model!=null&&model.getDeptNumber()!=null){  //查询大类 添加分组时的答辩方向
				majorList = sysMajorService.findByDeptNumber(model.getDeptNumber());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 添加分组信息
	 * 
	 * @return
	 */
	public void add() {
		logger.info("添加分组信息"+model.getGroupName());
		boolean isSave = false;
		try {
			PrintWriter out=getResponse().getWriter();
			if(model!=null&&model.getGroupName()!=null&&categoryIds!=null&&model.getDeptNumber()!=null){
				planYear = planYearSerivce.findPlanYear();
				model.setYear(planYear.getYear());
				model.setFirstDefense("00"); //是否是第一次分配评阅：00-是 01-否
				model 	= groupAllotService.add(model);
				String[] thisIDs = categoryIds.split(",");
				isSave= true;
				for(String thisId:thisIDs){
					GroupDefenseDirection gDirection = new GroupDefenseDirection();
					gDirection.setMajorId(Integer.parseInt(thisId));
					gDirection.setGroupAllotId(model.getGroupId());
					gDirection.setYear(planYear.getYear());
					groupDefenseDirectionService.save(gDirection);
				}
			}
			out.print(isSave);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 检查组名是否存在
	 * @author何志明
	 * @return
	 */
	public void checkName()throws Exception{
		logger.info("检查组名是否存在");
		try {
			boolean idTrue = true;
			PrintWriter out = getResponse().getWriter();
			List<ListGroupAllot> lists = groupAllotService.findByExample(model);
			if(null!=lists && lists.size()>0){
				idTrue = false;
			}
			out.print(idTrue);
			out.flush();
			out.close();
		} catch (Exception e) {
            logger.info("检查组名出错");
		}
	}
	
	/**
	 * 打开分组修改页面
	 * @return
	 */
	public String openEdit() {
		try {
			logger.info("打开分组修改页面");
			if(thisId!=null){
			  groupAllot = groupAllotService.findViewModelById(thisId);
			  classRoomList = sysClassroomService.findSysClassRoomList();
			  majorList = sysMajorService.findByDeptNumber(groupAllot.getDeptNumber());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 修改分组信息
	 * @return
	 */
	public String edit() {
		logger.info("修改分组信息");
		try {
			if(model!=null&&thisId!=null){
				GroupAllot gAllot =	groupAllotService.findById(thisId);
				if(model.getClassRoomId()!=null)
					gAllot.setClassRoomId(model.getClassRoomId());
				if(model.getReplyTime()!=null)
					gAllot.setReplyTime(model.getReplyTime());
				
			   model=  groupAllotService.edit(gAllot);
			  
			   if(categoryList!=null&&categoryList.size()!=0){
			   groupDefenseDirectionService.delByGroupIdAndYear(thisId,gAllot.getYear());
			   
			   for(Integer thisId:categoryList){
					GroupDefenseDirection gDirection = new GroupDefenseDirection();
					gDirection.setMajorId(thisId);
					gDirection.setGroupAllotId(gAllot.getGroupId());
					gDirection.setYear(gAllot.getYear());
					groupDefenseDirectionService.save(gDirection);
				}
			   }
			   groupAllot = groupAllotService.findViewModelById(thisId);
			   classRoomList = sysClassroomService.findSysClassRoomList();
			mark ="1";
			}else{
			   mark ="0";
			}
		} catch (Exception e) {
			mark ="0";
			e.printStackTrace();
		}
		return openEdit();
	}
	
	/**
	 * 按专业导出分组
	 * 
	 * @return
	 */
	public String exportGroupByExcel(){
		logger.info("按专业导出分组");
		try {
			List<ListGroupAllotExport> list = new ArrayList<ListGroupAllotExport>();
			list = sysStudentService.findGroupAllotByStuId();
			
			List result = list;// 记录数据	
			int rowIndex = 2;// 行序号
			ExcelSheetModel excelSheetModel = new ExcelSheetModel(0, "答辩分组表",
					result, rowIndex);
			
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			
			filename = df.format(new Date()) + "答辩分组表" + ".xlsx";
			filename = (new String((filename).getBytes(), "ISO-8859-1"));
			isStream = new BufferedInputStream(MergingExcelUtils.groupExport(excelSheetModel, getModelPath(),list));
			System.out.println("isStream:"+isStream);
			}catch (Exception e) {
				e.printStackTrace();
		}
		return "out";
	}
	
	/**
	 * 删除分组信息
	 */
	public void del() {
		logger.info("删除分组信息"+thisId);
		boolean isdel = false;
		try {
			PrintWriter out=getResponse().getWriter();
			if(thisId!=null){
			GroupAllot gAllot =	groupAllotService.findById(thisId);	
			if(gAllot!=null){
			  groupAllotService.del(thisId);
			  groupDefenseDirectionService.delByGroupIdAndYear(thisId,gAllot.getYear());
			  groupTeacherService.delByGroupIdAndYear(thisId,gAllot.getYear());  
			  groupStudentService.delByGroupIdAndYear(thisId,gAllot.getYear());  
			}
			  isdel= true;
			}
			out.print(isdel);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*****************************get/set方法*******************************/
	public ListGroupAllot getGroupAllot() {
		return groupAllot;
	}

	public void setGroupAllot(ListGroupAllot groupAllot) {
		this.groupAllot = groupAllot;
	}

	public Result<ListGroupAllot> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<ListGroupAllot> pageResult) {
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

	public List<File> getExcelFile() {
		return excelFile;
	}

	public void setExcelFile(List<File> excelFile) {
		this.excelFile = excelFile;
	}

	public List<SysClassroom> getClassRoomList() {
		return classRoomList;
	}

	public void setClassRoomList(List<SysClassroom> classRoomList) {
		this.classRoomList = classRoomList;
	}

	public PlanYear getPlanYear() {
		return planYear;
	}

	public void setPlanYear(PlanYear planYear) {
		this.planYear = planYear;
	}



	public List<SysMajor> getMajorList() {
		return majorList;
	}

	public void setMajorList(List<SysMajor> majorList) {
		this.majorList = majorList;
	}

	public String getCategoryIds() {
		return categoryIds;
	}

	public void setCategoryIds(String categoryIds) {
		this.categoryIds = categoryIds;
	}

	public List<Integer> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Integer> categoryList) {
		this.categoryList = categoryList;
	}

	public InputStream getIsStream() {
		return isStream;
	}

	public void setIsStream(InputStream isStream) {
		this.isStream = isStream;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Integer getFileLength() {
		Integer size = 0;
		try {
			size = isStream.available();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return size;
	}
	public void setFileLength(Integer fileLength) {
		this.fileLength = fileLength;
	}

	public String getModelPath() {
		return ServletActionContext.getServletContext().getRealPath(modelPath);
	}

	public void setModelPath(String modelPath) {
		this.modelPath = modelPath;
	}
	
}
