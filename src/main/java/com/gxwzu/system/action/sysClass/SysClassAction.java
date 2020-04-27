package com.gxwzu.system.action.sysClass;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListClass;
import com.gxwzu.system.model.sysClass.SysClass;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.service.sysClass.ISysClassService;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 班级信息
 * @author 黎艺侠
 * @date 2017.7.7
 */
public class SysClassAction extends BaseAction implements ModelDriven<SysClass>{

	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());
	
	/*********************** 实例化ModelDriven ******************************/
	private SysClass model = new SysClass();
	
	@Override
	public SysClass getModel() {
		return model;
	}
 
	public void setModel(SysClass model){
		this.model = model;
	}
	
	/*********************** Service接口注入 ***************************/
	@Autowired
	private ISysClassService sysClassService;              //班级接口
	@Autowired
	private ISysDepartmentService sysDepartmentService;    //院系接口
	@Autowired
	private ISysMajorService sysMajorService;            //专业接口
	
	
	
	/******************** 变量声明 *********************/
	private Result<ListClass> pageResult;                   //分页
	private List<SysDepartment> sysDepartments;            //院系信息列表（用于查询全部）
	private List<SysClass> sysClassList;                   //班级信息列表（用于页面判断）
	private List<SysDepartment> departmentList = new ArrayList<SysDepartment>();         //院系信息列表（用于页面判断）
	private List<SysMajor> sysMajorList = new ArrayList<SysMajor>();                 //专业信息列表（用于页面判断）
	private Integer id;
	private Integer thisId;
	private String mark;
	private List<File> excelFile;                          //导入excel

	/************************** 方法类 **************************/
	@Override
	public String execute() throws Exception{
		return SUCCESS;
	}
	
	/**
	 * 班级显示列表
	 * @return
	 */
	public String list(){
		logger.info("到这里了");
		try{
			pageResult = sysClassService.find(model,getPage(),getRow());
			footer = PageUtil.pageFooter(pageResult, getRequest());
			
			sysMajorList=sysMajorService.findAllSysMajorList();
			setMark("1");
		}catch(Exception e){
			e.printStackTrace();
			setMark("1");
		}
		
		/************************************通过学院查询专业**************************************************/
		departmentList = sysDepartmentService.findAllSysDepartmentList();
	    sysMajorList= sysMajorService.findByDeptNumber(model.getDeptNumber());
		return SUCCESS;
	}

	/**
	 * 添加班级
	 * @return
	 */
	public String add() {
		try {
				logger.info("添加班级"+model);
				model = sysClassService.add(model);
				mark = "1";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(departmentList!=null&&departmentList.size()!=0){
		 SysDepartment department =   departmentList.get(0);
		 SysMajor sysMajor  = new  SysMajor();
		 sysMajor.setDeptNumber(department.getDeptNumber());
	    sysMajorList= sysMajorService.findByExample(sysMajor);
		}
		return list();
	}
	
	/**
	 * 打开添加班级页面
	 * @return
	 */
	public String openAdd() {
		logger.info("## 打开添加班级");
		/************************************通过学院查询专业**************************************************/
		departmentList = sysDepartmentService.findAllSysDepartmentList();
		if(departmentList!=null&&departmentList.size()!=0){
		 SysDepartment department =   departmentList.get(0);
		 SysMajor sysMajor  = new  SysMajor();
		 sysMajor.setDeptNumber(department.getDeptNumber());
	     sysMajorList= sysMajorService.findByExample(sysMajor);
		}
		return SUCCESS;
	}
	
	
	
	/**
	 * 打开班级修改页面
	 * @return
	 */
	public String openEdit() {
		try {
			logger.info("打开班级修改页面");
			if(thisId!=null){
			model = sysClassService.findById(thisId);
			/************************************通过学院查询专业**************************************************/
			departmentList = sysDepartmentService.findAllSysDepartmentList();
		     sysMajorList= sysMajorService.findByDeptNumber(model.getDeptNumber());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	/**
	 * 修改班级信息
	 * @return
	 */
	public String edit() {
		logger.info("修改班级信息");
		try {
			sysClassService.edit(model);
			mark = "1";
		} catch (Exception e) {
			e.printStackTrace();
			mark = "0";
		}
		return list();
	}
	
	/**
	 * 删除班级信息
	 * @return
	 */
	public void del() {
		logger.info("删除班级信息");
		boolean isdel = false;
		try {
			PrintWriter out=getResponse().getWriter();
			if(thisId!=null){
			sysClassService.del(thisId);
			isdel= true;
			}
			out.print(isdel);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 导入班级信息
	 * @return
	 * @throws Exception
	 */
/*	public String AddByExcel()throws Exception{
		logger.info("导入班级信息"+model.getClassName());
		if(excelFile != null){
			System.out.println("............");
			for(int i=0;i<excelFile.size();i++){
				if(null != excelFile.get(i)){
					System.out.println("11111111111");
					Workbook workbook = createWorkBook(new FileInputStream(excelFile.get(i)));
					Sheet sheet = workbook.getSheetAt(0);
					System.out.println("当前列数："+sheet.getLastRowNum());
					Row firstRow = sheet.getRow(0);
					Iterator<Cell> iterator = firstRow.iterator();
					List<String> cellNames = new ArrayList<String>();
					while (iterator.hasNext()){
						cellNames.add(iterator.next().getStringCellValue());
					}
					//sheet.getLastRowNum() 当前列数
					for (int j = 1; j <= sheet.getLastRowNum(); j++){
						Row row = sheet.getRow(j);
						SysTeacher model = new SysTeacher();
						//班级编号
						if(row.getCell(1)!=null){
					         row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
					         model.setClassId(row.getCell(1).getStringCellValue());
					    }//班级名称
						if(row.getCell(2)!=null){
					         row.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
					         model.setClassName(row.getCell(2).getStringCellValue());
					    }
						//专业编号
						if(row.getCell(3)!=null){
					         row.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
					         model.setMajorId(row.getCell(3).getStringCellValue());
					    }
						
						sysClassService.add(model);
					}
				}
			}
		}
		return list();
	}*/
	/** 
	 * 联动查询
	 * 查询班级json数据通过专业编号
	 * @return
	 */
	public void findJsonByMajorId()throws Exception{
		logger.info("查询班级json数据通过专业编号");
		try {
			List<ListClass> lists = new ArrayList<ListClass>();
			HttpServletResponse response = getResponse();
			response.setCharacterEncoding("utf-8");
			PrintWriter out=response.getWriter();
			if(model.getMajorId()!=null){
			SysClass sysClass = new SysClass();
			sysClass.setMajorId(model.getMajorId());
			 lists=sysClassService.findByExample(sysClass);
			}
			out.print(new Gson().toJson(lists));
			out.flush();
			out.close();
		} catch (Exception e) {
			logger.info("查询班级json数据通过专业编号"+e);
		}
	}

	/**
	 * 检查班级是否已经存在
	 * @throws Exception
	 */
	public void checkClassName() throws Exception {
		logger.info("检查班级是否存在");
		try {
			boolean idTrue = true;
			PrintWriter out = getResponse().getWriter();
			SysClass sysClassByClassName = sysClassService.findSysClassByClassName(model.getClassName());
			if (null != sysClassByClassName && sysClassByClassName.getClassName()!="") {// 不可用
				idTrue = false;
			}
			out.print(idTrue);
			out.flush();
			out.close();
		} catch (Exception e) {
			logger.info("检查班级出错");
		}
	}
	/********************************getter/setter方法*******************************/


	public List<SysDepartment> getSysDepartments() {
		return sysDepartments;
	}

	public Result<ListClass> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<ListClass> pageResult) {
		this.pageResult = pageResult;
	}

	public void setSysDepartments(List<SysDepartment> sysDepartments) {
		this.sysDepartments = sysDepartments;
	}

	public List<SysClass> getSysClassList() {
		return sysClassList;
	}

	public void setSysClassList(List<SysClass> sysClassList) {
		this.sysClassList = sysClassList;
	}

	

	public List<SysDepartment> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<SysDepartment> departmentList) {
		this.departmentList = departmentList;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Log getLogger() {
		return logger;
	}



	public List<File> getExcelFile() {
		return excelFile;
	}

	public void setExcelFile(List<File> excelFile) {
		this.excelFile = excelFile;
	}

	public List<SysMajor> getSysMajorList() {
		return sysMajorList;
	}

	public void setSysMajorList(List<SysMajor> sysMajorList) {
		this.sysMajorList = sysMajorList;
	}

	
}
