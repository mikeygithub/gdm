package com.gxwzu.business.action.plan;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListAllotGuide;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.sysVO.ListTeacherGuideCount;
import com.gxwzu.system.service.sysCategory.ISysCategoryService;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 年度计划
 * @author 何志明
 * @date 2017.7.10
 */
public class PlanYearAction extends BaseAction implements ModelDriven<PlanYear>{

	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());
	
	/*********************** 实例化ModelDriven ******************************/
	private PlanYear model = new PlanYear();
	
	@Override
	public PlanYear getModel() {
		return model;
	}
 
	public void setModel(PlanYear model){
		this.model = model;
	}
	
	/*********************** Service接口注入 ***************************/
	@Autowired
	private IPlanYearSerivce planYearSerivce;              //年度计划接口
	@Autowired
	private ISysTeacherService sysTeacherService;              //老师分配接口
	@Autowired
	private ISysMajorService sysMajorService;
	@Autowired
	private ISysDepartmentService sysDepartmentService;
	@Autowired
	private ISysCategoryService sysCategoryService;
	/*********************** 实体 ***************************/
	private PlanYear planYear;                            //年度计划实体
	private ListTeacher teacher = new ListTeacher();                            //老师实体
	/******************** 集合变量声明 *********************/
	private Result<ListTeacherGuideCount> pageResult;                    //年度计划分页
	private List<ListAllotGuide> planYearList;                  //年度计划信息列表（用于查询全部）
	
	/************************** 基础变量声明 **************/
	private Integer thisId;
	private String mark;
	
	
	
	/************************** 方法类 **************************************************************************************/
	@Override
	public String execute() throws Exception{
		return SUCCESS;
	}
	/**
	 * 查询年度
	 * @return
	 */
	public String list(){
		try {
			model = planYearSerivce.findPlanYear();
			if(model!=null)
			teacher =  sysTeacherService.findModelById(model.getOpUserId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 添加信息到数据库
	 * @return
	 * @throws IOException 
	 */
	public String add() {
		
		try {
			if(model!=null){
				  String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
				  teacher =  sysTeacherService.findByTeacherNo(loginName);
				   model.setOpTime(new Date());
				   model.setOpUserId(teacher.getTeacherId());
				   model=  planYearSerivce.add(model);
			       if(model.getId()!=null){
			    	   mark="1";
			       }else{
			    	   mark="0";
			       }
			}
		} catch (Exception e) {
			e.printStackTrace();
			mark="0";
		}
		return list();
	}
	/**********************************************getter and setter方法************************************************************************/

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

	public ListTeacher getTeacher() {
		return teacher;
	}

	public void setTeacher(ListTeacher teacher) {
		this.teacher = teacher;
	}


	
	
}
