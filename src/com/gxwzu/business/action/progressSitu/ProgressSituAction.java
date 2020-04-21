package com.gxwzu.business.action.progressSitu;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.issueInfo.IssueInfo;
import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.business.model.progressSitu.ProgressSitu;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.issueInfo.IIssueInfoSerivce;
import com.gxwzu.business.service.materialInfo.IMaterialInfoSerivce;
import com.gxwzu.business.service.plan.IPlanProgressSerivce;
import com.gxwzu.business.service.progressSitu.IProgressSituSerivce;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.DateUtils;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.util.WordUtils;
import com.gxwzu.core.util.poi.ExcelSheetModel;
import com.gxwzu.core.util.poi.ExcelUtils;
import com.gxwzu.core.util.poi.MergingExcelUtils;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListAllotGuide;
import com.gxwzu.sysVO.ListProgressSitu;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.sysVO.MaterialInfo;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.model.sysTechnical.SysTechnical;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.gxwzu.system.service.userHelp.IUserHelpService;
import com.gxwzu.util.DateUtil;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 进度情况
 * 
 * @author 韦东连
 * @data 2017.09.03
 */

public class ProgressSituAction extends BaseAction implements ModelDriven<ProgressSitu> {

	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());

	/*********************** 实例化ModelDriven ******************************/
	private ProgressSitu model = new ProgressSitu();
	private Class<ProgressSitu> progressSituClass;
    private SysStudent stuMsg = new SysStudent();

	@Override
	public ProgressSitu getModel() {
		return model;
	}

	public void setModel(ProgressSitu model) {
		this.model = model;
	}

	/*********************** Service接口注入 ***************************/
	@Autowired
	private IUserHelpService userHelpService;
	@Autowired
	private ISysTeacherService sysTeacherService; // 老师接口
	@Autowired
	private ISysStudentService sysStudentService; // 学生接口
	@Autowired
	private IProgressSituSerivce progressSituSerivce;// 进度计划接口
	@Autowired
	private IAllotGuideService allotGuideService; // 指导分配接口
	@Autowired
	private IMaterialInfoSerivce materialInfoSerivce; // 学生相关材料接口
	@Autowired
	private IIssueInfoSerivce issueInfoSerivce; // 课题接口
	@Autowired
	private IPlanProgressSerivce planProgressSerivce; // 进度计划接口
	/*********************** 实体 ***************************/
	private SysStudent student = new SysStudent(); // 学生实体
	private SysTeacher teacher = new SysTeacher(); // 老师实体
	private SysStudent sysStudent = new SysStudent(); // 学生实体
	private MaterialInfo materialInfo = new MaterialInfo();
	private IssueInfo issueInfo = new IssueInfo(); // 课题列表实体
	private ListStudent LStudent = new ListStudent();
	private PlanProgress planProgress = new PlanProgress();//进度计划实体
	private ListTeacher lTeacher = new ListTeacher(); // 老师实体
	/*********************** 声明参数 ******************************/
	private Result<ListProgressSitu> pageResult;// 分页

	private Integer id;
	private Integer thisId;
	private String mark;
    
	private Integer thisTaskId;
	private Integer thisYear;
	private Integer thisStuId; // 学生Id
	private String flag;
	/******************** 报表导出参数 *************************/
	private InputStream isStream;
	private String fileName; // 文件名称
	private Integer fileLength; // 文件大小
	private String modelPath;// 直接在struts.xml文件中配置的属性

	/************************** 方法类 **************************/

	@Override
	public String execute() throws Exception {

		return SUCCESS;
	}

	/**
	 * 进度情况列表显示
	 * @return
	 * @author 俸捷 
	 * @data 2017.09.26
	 */
	public String list() {
		String loginName = (String)getSession().getAttribute(SystemContext.LOGINNAME);
		String usertype = (String)getSession().getAttribute(SystemContext.USERTYPE);
			if(thisYear==null){
				//获取当前年份并set进去
				thisYear = Calendar.getInstance().get(Calendar.YEAR);
				model.setYear(thisYear);
			}
			//根据类型查找相应的表,获取登录类型，2的话直接去教师表查询，
			//3的话说明是管理员并且管理员只可能是老师？如果根据这个设计，3也应该去教师表查询。
			if(usertype.equals("3")||usertype.equals("2")){
				int teacherid=sysTeacherService.findByTeacherNo(loginName).getTeacherId();
				model.setTeacherId(teacherid);
			}else if(usertype.equals("1")){
				//如果登录类型是1说明是学生，应该去学生表那里查询。
				thisStuId = sysStudentService.findByStuNo(loginName).getStuId();
				model.setStuId(thisStuId);
			}
			if (thisStuId!=null){
				model.setStuId(thisStuId);
			}
			materialInfo = materialInfoSerivce.findByStuIdAndYear(thisStuId,thisYear);
			pageResult = progressSituSerivce.find(model, getPage(), getRow());
			footer = PageUtil.pageFooter(pageResult, getRequest());
			return SUCCESS;
}

	/**
	 * 添加进度情况
	 * 
	 * @return
	 */
	public String add() {
		logger.info("到这里？" );
		try {
			logger.info("添加进度情况" + model);
			if (thisStuId != null && thisYear != null&&model!=null) {
				// 查询指导老师信息
				AllotGuide aGuide = allotGuideService.findByStuIdAndYear(thisStuId, thisYear);
				
				//添加信息
				model.setTeacherId(aGuide.getTeacherId());
				model.setStuId(thisStuId);
				model.setYear(thisYear);
				model.setProgressTime(DateUtils.formatTime(new Date()));
				
			model = progressSituSerivce.add(model);
			mark = "1";
			}else{
				mark = "0";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			setMark("0");
		}
		return list();
	}

	/**
	 * 打开添加进度情况界面
	 * 
	 * @return
	 */
	public String openAdd() {
		ProgressSitu progressSitu = new ProgressSitu();
		String loginName = (String)getSession().getAttribute(SystemContext.LOGINNAME);
		String usertype = (String)getSession().getAttribute(SystemContext.USERTYPE);
		//查询 当前学生所属专业教研室  进度计划
				if(flag!=null&&"05".equals(flag)){
						if ("1".equals(usertype)) {
							LStudent = sysStudentService.findByStuNo(loginName);		
					        planProgress=planProgressSerivce.findByStudMajoId(student.getMajorId(),flag);  
						}
						//查询 当前老师所属专业教研室 中的进度计划
						if ("2".equals(usertype)) {
							 lTeacher = sysTeacherService.findByTeacherNo(loginName);
							 planProgress=planProgressSerivce.findByTeacStaffroomId(lTeacher.getStaffroomId(),flag); 
						}
						Timestamp d = new Timestamp(System.currentTimeMillis()); 
						if(planProgress!=null&&d.after(planProgress.getStartTime())){
							try {
								if (thisStuId != null && thisYear != null) {
									// 查询学生信息
									student = sysStudentService.findById(thisStuId);
									// 查询课题信息
									issueInfo = issueInfoSerivce.findByStuIdAndYear(thisStuId,thisYear);
									// 查询指导老师信息
									AllotGuide aGuide = allotGuideService.findByStuIdAndYear(thisStuId, thisYear);
									teacher = sysTeacherService.findById(aGuide.getTeacherId());
									materialInfo = materialInfoSerivce.findByStuIdAndYear(thisStuId,thisYear);
								}
							} catch (Exception e) {
								e.printStackTrace();
							}
							return SUCCESS;
						}else{
						    return SUCCESS;
						}
			    }else{
			    	return null;
			    }
	
	}

	/**
	 * 打开修改进度情况界面
	 * 
	 * @return
	 */
	public String openEdit() {
		String loginName = (String)getSession().getAttribute(SystemContext.LOGINNAME);
		String usertype = (String)getSession().getAttribute(SystemContext.USERTYPE);
		//查询 当前学生所属专业教研室  进度计划
				if(flag!=null&&"05".equals(flag)){
						if ("1".equals(usertype)) {
							LStudent = sysStudentService.findByStuNo(loginName);		
					        planProgress=planProgressSerivce.findByStudMajoId(student.getMajorId(),flag);  
						}
						//查询 当前老师所属专业教研室 中的进度计划
						if ("2".equals(usertype)) {
							 lTeacher = sysTeacherService.findByTeacherNo(loginName);
							 planProgress=planProgressSerivce.findByTeacStaffroomId(lTeacher.getStaffroomId(),flag); 
						}
						Timestamp d = new Timestamp(System.currentTimeMillis()); 
						if(planProgress!=null&&planProgress.getStartTime()!=null&&d.after(planProgress.getStartTime())){
							try {
								logger.info("打开进度情况修改界面");
								model = progressSituSerivce.findById(thisId);
								materialInfo = materialInfoSerivce.findByStuIdAndYear(thisStuId,thisYear);
                                stuMsg = sysStudentService.findByStuId(model.getStuId());
							} catch (Exception e) {
								e.printStackTrace();
							}
							return SUCCESS;
						}else{
						    return SUCCESS;
						}
			    }else{
			    	return null;
			    }

	}

	/**
	 * 修改
	 * 
	 * @return
	 */
	public String edit() {

		logger.info("修改进度情况:"+model);
		try {
			progressSituSerivce.edit(model);
			thisYear = Calendar.getInstance().get(Calendar.YEAR);
			model.setYear(thisYear);
			mark = "1";
		} catch (Exception e) {
			e.printStackTrace();
			setMark("0");
		}
		return list();
	}

	/**
	 * 删除
	 * 
	 * @return
	 */
	public void del() {

		logger.info("删除进度情况");
		boolean isdel = false;
		try {
			PrintWriter out = getResponse().getWriter();
			if (thisId != null) {
				progressSituSerivce.del(thisId);
				isdel = true;
			}
			out.print(isdel);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 导出进展情况
	 * @author hjy
	 * @date 2017.9.11
	 * @return
	 */
	public String outProgressSitu() {
		logger.info("导出当前页报表");
		try {
			ProgressSitu progressSitu = new ProgressSitu();
			
			if (model == null) {
				model = progressSitu;				
			}	
			
			if (thisStuId != null && thisYear != null) {				
				model.setStuId(thisStuId);
				model.setYear(thisYear);
				//student = sysStudentService.findById(thisStuId);
				LStudent = sysStudentService.findViewModelById(thisStuId);
				pageResult = progressSituSerivce.find(model, getPage(), getRow());
			
			List<String> dates = new ArrayList<String>();
			if(StringUtils.isNotEmpty(model.getProgressTime())){
				dates.add(model.getProgressTime());
			}
			if(StringUtils.isNotEmpty(model.getProgressWork())){
				dates.add(model.getProgressWork());
			}
			if(StringUtils.isNotEmpty(model.getProgressRecord())){ 
				dates.add(model.getProgressRecord());
			}
			Result<Object[]> pageResult = progressSituSerivce.outModelByExample(
					model, getPage(), getRow());
			List result = pageResult.getData();// 记录数据
	
			int rowIndex = 3;// 行序号
			ExcelSheetModel excelSheetModel = new ExcelSheetModel(0, "进展情况调查表",
					result, rowIndex);
			
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			filename = df.format(new Date()) + "进展情况调查表" + ".xlsx";
			filename = (new String((filename).getBytes(), "ISO-8859-1"));
			
			List<ListProgressSitu> LProgressSitu= progressSituSerivce.findByStuIdAndYear(model.getStuId(), model.getYear());
			
			isStream = new BufferedInputStream(MergingExcelUtils.merginExport(excelSheetModel, getModelPath(),LProgressSitu,LStudent));
			}
			
			//state = "1";
		} catch (Exception e) {
			e.printStackTrace();
			//state = "0";
		}
		return OUT;
	}
	
	
	
	
	/************************** getter/setter方法 **************************/
	public String getModelPath() {
		return ServletActionContext.getServletContext().getRealPath(modelPath);
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
	public void setModelPath(String modelPath) {
		this.modelPath = modelPath;
	}
	public ISysTeacherService getSysTeacherService() {
		return sysTeacherService;
	}

	public void setSysTeacherService(ISysTeacherService sysTeacherService) {
		this.sysTeacherService = sysTeacherService;
	}

	public ISysStudentService getSysStudentService() {
		return sysStudentService;
	}

	public void setSysStudentService(ISysStudentService sysStudentService) {
		this.sysStudentService = sysStudentService;
	}

	public IProgressSituSerivce getProgressSituSerivce() {
		return progressSituSerivce;
	}

	public void setProgressSituSerivce(IProgressSituSerivce progressSituSerivce) {
		this.progressSituSerivce = progressSituSerivce;
	}

	public SysStudent getStudent() {
		return student;
	}

	public void setStudent(SysStudent student) {
		this.student = student;
	}

	public SysTeacher getTeacher() {
		return teacher;
	}

	public void setTeacher(SysTeacher teacher) {
		this.teacher = teacher;
	}

	public Result<ListProgressSitu> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<ListProgressSitu> pageResult) {
		this.pageResult = pageResult;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Integer getThisYear() {
		return thisYear;
	}

	public void setThisYear(Integer thisYear) {
		this.thisYear = thisYear;
	}

	public Integer getThisStuId() {
		return thisStuId;
	}

	public void setThisStuId(Integer thisStuId) {
		this.thisStuId = thisStuId;
	}

	public MaterialInfo getMaterialInfo() {
		return materialInfo;
	}

	public void setMaterialInfo(MaterialInfo materialInfo) {
		this.materialInfo = materialInfo;
	}

	public SysStudent getSysStudent() {
		return sysStudent;
	}

	public void setSysStudent(SysStudent sysStudent) {
		this.sysStudent = sysStudent;
	}

	public IssueInfo getIssueInfo() {
		return issueInfo;
	}

	public void setIssueInfo(IssueInfo issueInfo) {
		this.issueInfo = issueInfo;
	}

	public InputStream getIsStream() {
		return isStream;
	}

	public void setIsStream(InputStream isStream) {
		this.isStream = isStream;
	}

	public ListStudent getLStudent() {
		return LStudent;
	}

	public void setLStudent(ListStudent lStudent) {
		LStudent = lStudent;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public SysStudent getStuMsg() {
		return stuMsg;
	}

	public void setStuMsg(SysStudent stuMsg) {
		this.stuMsg = stuMsg;
	}
}
