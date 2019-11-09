package com.gxwzu.business.action.issueInfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.issueInfo.IssueInfo;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.teacherProject.TeacherProject;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.issueInfo.IIssueInfoSerivce;
import com.gxwzu.business.service.materialInfo.IMaterialInfoSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.business.service.teacherProject.ITeacherProjectService;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.model.ChartMapData;
import com.gxwzu.core.model.IssueTypeValue;
import com.gxwzu.core.model.Options;
import com.gxwzu.core.model.Series;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.MaterialInfo;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysIssueType.SysIssueType;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.sysPermission.SysPermission;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysIssueType.ISysIssueTypeService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.opensymphony.xwork2.ModelDriven;
import com.sun.jmx.snmp.SnmpUnknownSubSystemException;

/**
 * 课题
 * 
 * @author 何志明
 * @date 2017.7.21
 */
public class IssueInfoAction extends BaseAction implements
		ModelDriven<IssueInfo> {

	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());

	/*********************** 实例化ModelDriven ******************************/
	private IssueInfo model = new IssueInfo();

	@Override
	public IssueInfo getModel() {
		return model;
	}

	public void setModel(IssueInfo model) {
		this.model = model;
	}

	/*********************** Service接口注入 ***************************/

	@Autowired
	private ISysTeacherService sysTeacherService; // 老师接口
	@Autowired
	private ISysStudentService sysStudentService; // 学生接口
	@Autowired
	private IAllotGuideService allotGuideService; // 指导分配接口
	@Autowired
	private IIssueInfoSerivce issueInfoSerivce; // 课题接口
	@Autowired
	private ISysIssueTypeService sysIssueTypeService; // 课题类型接口
	@Autowired
	private IPlanYearSerivce planYearSerivce; // 年度计划接口
	@Autowired
	private IMaterialInfoSerivce materialInfoSerivce; // 学生相关材料接口
	@Autowired
	private ITeacherProjectService teacherProjectService; // 导师课题接口
	@Autowired
	private ISysMajorService sysMajorService; // 导师课题接口
	@Autowired
	private ISysDepartmentService sysDepartmentService; // 导师课题接口
	
	/*********************** 实体 ***************************/
	private PlanYear planYear; // 年度计划实体
	private IssueInfo issueInfo = new IssueInfo(); // 课题列表实体
	private ListStudent student = new ListStudent(); // 学生实体
	private SysTeacher teacher = new SysTeacher(); // 老师实体
	private MaterialInfo materialInfo = new MaterialInfo();
	private TeacherProject teacherProject = new TeacherProject();
	
	/******************** 集合变量声明 *********************/
	private Result<IssueInfo> pageResult; // 课题分页
	private List<SysIssueType> issueTypeList = new ArrayList<SysIssueType>();
	private List<IssueInfo> issueInfoList = new ArrayList<IssueInfo>();
	private List<SysMajor> sysMajorList = new ArrayList<SysMajor>();
	private List<SysIssueType> sysIssueTypeList = new ArrayList<SysIssueType>();
	private List<SysDepartment> departmentList = new ArrayList<SysDepartment>();         //院系信息列表（用于页面判断）
	
	private List<Options> options = new ArrayList<Options>();
	private List<String> yearList = new ArrayList<String>();
	private List<String> typeList = new ArrayList<String>();
	private List<String> titleList = new ArrayList<String>();
	private List<IssueTypeValue<String,List<String>>> valueList = new ArrayList<IssueTypeValue<String,List<String>>>();
	
	/************************** 基础变量声明 **************/
	private Integer thisId;
	private String mark;
	private Integer thisYear; // 年度
	private Integer thisStuId; // 学生Id	
	private Integer thisProjectId; // 学生Id	
	private Integer ownOrChoose;//判断自拟题目还是选择导师题目 1-选择导师题目  null-自拟题目
	private String thisStuIds;//学生Id集合（字符串）
	
	private Integer thisAlreadyChoose;//已经选择该课题的人数
	
	private String jsonData;
	
	/************************** 方法类 **************************************************************************************/
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	/**
	 * 分页查询课题信息
	 * 
	 * @return
	 */
	public String list() {
		try {
			pageResult = issueInfoSerivce.find(model, getPage(), getRow());
			footer = PageUtil.pageFooter(pageResult, getRequest());
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
		String loginName = (String) getSession().getAttribute(
				SystemContext.LOGINNAME);
		String type = (String) getSession()
				.getAttribute(SystemContext.USERTYPE);
		if (type.equals("1")) {
			ListStudent s = sysStudentService.findByStuNo(loginName);
			issueInfo.setStuId(s.getStuId());
		}

		if (model.getStuId() != null) {
			SysStudent s = new SysStudent();
			s.setStuId(model.getStuId());
			student = sysStudentService.findByExample(s).get(0);
		}
		return list();
	}

	/**
	 * 打开添加任务书页面
	 * 
	 * @return
	 */
	public String openAdd() {
		try {
			if (thisStuId != null && thisYear != null) {
				// 查询学生信息
				student = sysStudentService.findViewModelById(thisStuId);
				// 查询课题信息
				issueInfo = issueInfoSerivce.findByStuIdAndYear(thisStuId,
						thisYear);
				//课题类型
				issueTypeList = sysIssueTypeService.findAll(SysIssueType.class);
				// 查询指导老师信息
				AllotGuide aGuide = allotGuideService.findByStuIdAndYear(
						thisStuId, thisYear);
				teacher = sysTeacherService.findById(aGuide.getTeacherId());
				
				materialInfo = materialInfoSerivce.findByStuIdAndYear(thisStuId,thisYear);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	
	/**
	 * 添加信息到数据库
	 * 
	 * @return
	 * @throws IOException 
	 */
	public String addTeacher() throws IOException {
		boolean idTrue = false;
		PrintWriter out = getResponse().getWriter();
		try {
			if (thisStuId != null && thisYear != null) {
				model.setYear(thisYear);
				model.setStuId(thisStuId);
				
				if(ownOrChoose != null && !"".equals(ownOrChoose) && ownOrChoose == 1){
					//model.setIssueType(model.getIssueType());
				}else{
					String issueType  = "";
					for(SysIssueType ite: issueTypeList){
						if(ite!=null&&ite.getIssueTypeId()!=null)
						issueType +="&"+ite.getIssueTypeId()+"&_";
					}
					model.setIssueType(issueType);
				}
				model = issueInfoSerivce.save(model);
				idTrue = true;
			}
			if(ownOrChoose != null && !"".equals(ownOrChoose) && ownOrChoose == 1){
				mark = "0";
				thisStuIds += thisStuId+",";
				teacherProjectService.updateByProjectId(thisProjectId,thisAlreadyChoose+1,thisStuIds);
				idTrue = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			idTrue = false;
		}
		out.print(idTrue);
		out.flush();
		out.close();
		return null;
	}
	
	
	/**
	 * 添加信息到数据库
	 * 
	 * @return
	 * @throws IOException 
	 */
	public String add() throws IOException {
		try {
			if (thisStuId != null && thisYear != null) {
				model.setYear(thisYear);
				model.setStuId(thisStuId);
				
				if(ownOrChoose != null && !"".equals(ownOrChoose) && ownOrChoose == 1){
					//model.setIssueType(model.getIssueType());
				}else{
					String issueType  = "";
					for(SysIssueType ite: issueTypeList){
						if(ite!=null&&ite.getIssueTypeId()!=null)
						issueType +="&"+ite.getIssueTypeId()+"&_";
					}
					model.setIssueType(issueType);
				}
				model = issueInfoSerivce.save(model);
				mark = "1";
			}
			if(ownOrChoose != null && !"".equals(ownOrChoose) && ownOrChoose == 1){
				thisStuIds += thisStuId+",";
				teacherProjectService.updateByProjectId(thisProjectId,thisAlreadyChoose+1,thisStuIds);
				mark = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
			mark = "0";
		}
		return list();
	}
	
	
	public String findByStuId(){
		boolean isFind = false;
		try {
			PrintWriter out = getResponse().getWriter();
			Map<Object, Object> map = new HashMap<Object, Object>();
			
			model.setStuId(thisStuId);
			teacherProject = teacherProjectService.findById(thisProjectId);
			issueInfoList = issueInfoSerivce.findByExample(model);
			if(issueInfoList == null || issueInfoList.size()<= 0 ){
				isFind = true;
			}
			map.put("isFind", isFind);
			map.put("maxChoose", teacherProject.getMaxChoose());
			map.put("alreadyChoose", teacherProject.getAlreadyChoose());
			map.put("projectType", teacherProject.getProjectType());
			map.put("stuIds", teacherProject.getStuIds());
			Gson g = new Gson();
			String json = g.toJson(map);
			out.print(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 打开修改课题页面
	 * 
	 * @return
	 */
	public String openEdit() {
		try {
			if (thisStuId != null && thisYear != null) {
			if ( thisId != null){
				model = issueInfoSerivce.findById(thisId);
			}else{
				model = issueInfoSerivce.findByStuIdAndYear(thisStuId, thisYear);
				if(model==null){
				   view =  "add";
				}
			}
		  }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return openAdd();
	}

	/**
	 * 打开课题详情页面
	 * 
	 * @return
	 */
	public String openDetail() {
		try {
			if (thisStuId != null && thisYear != null) {
			if ( thisId != null){
				model = issueInfoSerivce.findById(thisId);
			}else{
				model = issueInfoSerivce.findByStuIdAndYear(thisStuId, thisYear);
			}
		  }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return openAdd();
	}

	/**
	 * 修改课题信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String edit() {
		try {
			if (thisId != null) {
				IssueInfo issueInfo = issueInfoSerivce.findById(thisId);
				
				if (model.getIssueName() != null)issueInfo.setIssueName(model.getIssueName());
				if (model.getIssueType() != null)issueInfo.setIssueType(model.getIssueType());
				if (model.getIsPass()!=null)issueInfo.setIsPass(model.getIsPass());

				String issueType  = "";
				for(SysIssueType ite: issueTypeList){
					if(ite!=null&&ite.getIssueTypeId()!=null)
					issueType +="&"+ite.getIssueTypeId()+"&_";
				}
				issueInfo.setIssueType(issueType);
				model = issueInfoSerivce.addOrEdit(issueInfo);
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
	 * 打开课题类型统计页面
	 * 
	 * @return
	 */
	public String openChart() {
		String loginName = (String) getSession().getAttribute(
				SystemContext.LOGINNAME);
		String type = (String) getSession()
				.getAttribute(SystemContext.USERTYPE);
		// 查询安排计划中的年度
		planYear = planYearSerivce.findPlanYear();
		model.getYear();
		return SUCCESS;
	}
	
	
	/**
	 * 课题类型统计
	 * @author 黎艺侠
	 * @throws IOException 
	 */
	@SuppressWarnings("unchecked")
	public void chart() throws IOException{
		ChartMapData cData = new  ChartMapData();
		
		/************************************通过学院查询专业**************************************************/
		departmentList = sysDepartmentService.findAllSysDepartmentList();
	
		sysMajorList = sysMajorService.findAllSysMajorList();
		for (SysMajor sysMajor : sysMajorList) {
			titleList.add(sysMajor.getMajorName());
		}
		
		sysIssueTypeList = sysIssueTypeService.findSysIssueTypeListAll();
		for (SysIssueType sysIssueType : sysIssueTypeList) {
			typeList.add(sysIssueType.getIssueTypeName());
		}
		
		// 查询安排计划中的年度
		planYear = planYearSerivce.findPlanYear();
		yearList.add(planYear.getYear().toString());
		
		Series<List<Series<String>>> series = new Series<List<Series<String>>>();
		List<Series<String>> lSeries = new ArrayList<Series<String>>();
		List seriesList = new ArrayList();
		for (SysIssueType sysIssueType : sysIssueTypeList) {
			List<Series<String>> laySeries = new ArrayList<Series<String>>();
			List<String> SList = new ArrayList<String>();
			for (SysMajor sysMajor : sysMajorList) {
				//某个专业的课题类型对应多少个学生
				 List<SysStudent> sysStudentList = sysStudentService.findByMajorId(sysMajor.getMajorId());
				 int size = 0;
				 for (int i = 0; i < sysStudentList.size(); i++) {
					 issueInfoList = issueInfoSerivce.findByStuIdAndIssueType(sysStudentList.get(i).getStuId(),
							 "&"+sysIssueType.getIssueTypeId()+"&_");
					 if(issueInfoList != null && issueInfoList.size() > 0){
						 size++;
					 }
				 }
				 if(size == 0){
					 laySeries.add(new Series<String>(sysIssueType.getIssueTypeName(), "0"));
					 SList.add("0");
				 }else{
					 laySeries.add(new Series<String>(sysIssueType.getIssueTypeName(), Integer.toString(size)));
					 SList.add(Integer.toString(size));
				 }
				 
			}
			valueList.add(new IssueTypeValue<String,List<String>>(sysIssueType.getIssueTypeName(), SList));
			seriesList.add(new Series<List<Series<String>>>(laySeries));
			options.add(new Options("选题情况", seriesList));
		}
		cData.setpList(titleList);
		cData.setTypeList(typeList);
		cData.setYearList(yearList);
		cData.setValueList(valueList);
		cData.setOptions(options);
		
		jsonData = new Gson().toJson(cData);
		PrintWriter out = getResponse().getWriter();
		out.print(jsonData);
		out.flush();
		out.close();
		
	}
	
	/**
	 * 删除课题信息
	 * 
	 * @return
	 */
	public void del() {
		logger.info("删除课题信息");
		boolean isdel = false;
		try {
			PrintWriter out = getResponse().getWriter();
			if (model.getStuId() != null && thisProjectId != null && !"".equals(thisProjectId)) {
				issueInfoSerivce.delByStuId(model.getStuId());
				teacherProject = teacherProjectService.findById(thisProjectId);
				String str = teacherProject.getStuIds();
				System.out.println(str+"*****str****");
				String studentIds = "";
				String[] stuIdsArray = str.split(",");
				for (int i = 0; i < stuIdsArray.length; i++) {
					if(!stuIdsArray[i].equals(model.getStuId().toString())){
						studentIds += stuIdsArray[i] + ",";
					}
				}
				System.out.println(studentIds+"****studentIds*****");
				teacherProjectService.updateByProjectId(thisProjectId, teacherProject.getAlreadyChoose()-1, studentIds);
				isdel = true;
			}
			out.print(isdel);
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

	public Result<IssueInfo> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<IssueInfo> pageResult) {
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

	public IssueInfo getIssueInfo() {
		return issueInfo;
	}

	public void setIssueInfo(IssueInfo issueInfo) {
		this.issueInfo = issueInfo;
	}

	public ListStudent getStudent() {
		return student;
	}

	public void setStudent(ListStudent student) {
		this.student = student;
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

	public List<SysIssueType> getIssueTypeList() {
		return issueTypeList;
	}

	public void setIssueTypeList(List<SysIssueType> issueTypeList) {
		this.issueTypeList = issueTypeList;
	}

	public Integer getOwnOrChoose() {
		return ownOrChoose;
	}

	public void setOwnOrChoose(Integer ownOrChoose) {
		this.ownOrChoose = ownOrChoose;
	}

	public Integer getThisProjectId() {
		return thisProjectId;
	}

	public void setThisProjectId(Integer thisProjectId) {
		this.thisProjectId = thisProjectId;
	}

	public List<IssueInfo> getIssueInfoList() {
		return issueInfoList;
	}

	public void setIssueInfoList(List<IssueInfo> issueInfoList) {
		this.issueInfoList = issueInfoList;
	}

	public Integer getThisAlreadyChoose() {
		return thisAlreadyChoose;
	}

	public void setThisAlreadyChoose(Integer thisAlreadyChoose) {
		this.thisAlreadyChoose = thisAlreadyChoose;
	}

	public String getThisStuIds() {
		return thisStuIds;
	}

	public void setThisStuIds(String thisStuIds) {
		this.thisStuIds = thisStuIds;
	}


	public TeacherProject getTeacherProject() {
		return teacherProject;
	}

	public void setTeacherProject(TeacherProject teacherProject) {
		this.teacherProject = teacherProject;
	}

	public List<SysMajor> getSysMajorList() {
		return sysMajorList;
	}

	public void setSysMajorList(List<SysMajor> sysMajorList) {
		this.sysMajorList = sysMajorList;
	}

	public List<SysIssueType> getSysIssueTypeList() {
		return sysIssueTypeList;
	}

	public void setSysIssueTypeList(List<SysIssueType> sysIssueTypeList) {
		this.sysIssueTypeList = sysIssueTypeList;
	}

	public List<Options> getOptions() {
		return options;
	}

	public void setOptions(List<Options> options) {
		this.options = options;
	}

	public List<String> getYearList() {
		return yearList;
	}

	public void setYearList(List<String> yearList) {
		this.yearList = yearList;
	}

	public List<String> getTypeList() {
		return typeList;
	}

	public void setTypeList(List<String> typeList) {
		this.typeList = typeList;
	}

	public List<String> getTitleList() {
		return titleList;
	}

	public void setTitleList(List<String> titleList) {
		this.titleList = titleList;
	}

	public String getJsonData() {
		return jsonData;
	}

	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}

	public List<SysDepartment> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<SysDepartment> departmentList) {
		this.departmentList = departmentList;
	}

	public List<IssueTypeValue<String, List<String>>> getValueList() {
		return valueList;
	}

	public void setValueList(List<IssueTypeValue<String, List<String>>> valueList) {
		this.valueList = valueList;
	}

}
