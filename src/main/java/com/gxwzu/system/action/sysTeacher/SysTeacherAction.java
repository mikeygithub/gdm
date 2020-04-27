package com.gxwzu.system.action.sysTeacher;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.teacherDirections.TeacherDirections;
import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.business.service.teacherDirections.ITeacherDirectionsService;
import com.gxwzu.business.service.teacherMajor.ITeacherMajorService;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.sysVO.ListTeacherDirections;
import com.gxwzu.sysVO.ListTeacherMajor;
import com.gxwzu.system.model.sysCategory.SysCategory;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysDirections.SysDirections;
import com.gxwzu.system.model.sysDuties.SysDuties;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.model.sysTechnical.SysTechnical;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysCategory.ISysCategoryService;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysDirections.ISysDirectionsService;
import com.gxwzu.system.service.sysDuties.ISysDutiesService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.gxwzu.system.service.sysTechnical.ISysTechnicalService;
import com.gxwzu.system.service.userHelp.IUserHelpService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 教师基本信息
 * 
 * @author 俸捷
 * 
 */
public class SysTeacherAction extends BaseAction implements ModelDriven<SysTeacher> {

	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());

	/*********************** 实例化ModelDriven ******************************/
	private SysTeacher model = new SysTeacher();

	@Override
	public SysTeacher getModel() {
		return model;
	}

	public void setModel(SysTeacher model) {
		this.model = model;
	}

	/*********************** 注入Service ******************************/
	@Autowired
	private IPlanYearSerivce planYearSerivce; // 年度计划接口
	@Autowired
	private ISysTeacherService sysTeacherService;
	@Autowired
	private IUserHelpService userHelpService;
	@Autowired
	private ISysTechnicalService sysTechnicalService;
	@Autowired
	private ISysDutiesService sysDutiesService;
	@Autowired
	private ISysDepartmentService sysDepartmentService;
	@Autowired
	private ISysCategoryService sysCategoryService;
	@Autowired
	private ITeacherMajorService teacherMajorService;
	@Autowired
	private ISysMajorService sysMajorService;
	@Autowired
	private ITeacherDirectionsService teacherDirectionsService;
	@Autowired
	private ISysDirectionsService sysDirectionsService;
	/*********************** 实体 ******************************/
	private SysDepartment sysDepartment; // 院系实体
	private SysTechnical sysTechnical; // 职称实体
	private SysMajor sysMajor; // 专业实体
	private SysDirections sysDirections;// 研究方向实体
	private TeacherMajor teacherMajor; // 可选专业实体
	private PlanYear planYear; // 年度计划实体
	private TeacherDirections teacherDirections;// 教师研究方向实体
	private ListTeacher teacher = new ListTeacher();
	private UserHelp userHelp = new UserHelp();
	/*********************** 声明参数 ******************************/
	private Result<ListTeacher> pageResult;// 分页
	private Result<SysMajor> pageResult1;// 专业分页
	private Result<SysDirections> pageResult2;// 研究方向分页
	private List<SysDepartment> departmentList = new ArrayList<SysDepartment>();
	private List<SysTechnical> sysTechnicalList = new ArrayList<SysTechnical>();
	private List<SysDuties> sysDutiesList = new ArrayList<SysDuties>();
	private List<SysCategory> categoryList = new ArrayList<SysCategory>();
	private List<SysMajor> sysMajorList = new ArrayList<SysMajor>();
	private List<SysDirections> sysDirectionsList = new ArrayList<SysDirections>();
	private List<ListTeacherMajor> teacherMajorList = new ArrayList<ListTeacherMajor>();
	private List<ListTeacherDirections> teacherDirectionsList = new ArrayList<ListTeacherDirections>();

	private Integer thisId;
	private String mark;
	private String excelFileFileName;
	// 导入excel
	private List<File> excelFile;
	private List<SysTeacher> exitList;

	/************************** 方法类 **************************/
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	/**
	 * 教师显示列表
	 * 
	 * @return
	 */
	public String list() {

	    logger.info(" 教师显示列表");

	    try {

			String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
			String userType = (String) getSession().getAttribute(SystemContext.USERTYPE);

			//查询 当前老师所属专业教研室
			if ("2".equals(userType)) {
				teacher = sysTeacherService.findByTeacherNo(loginName);
				if(model.getDeptNumber()==null)
				model.setDeptNumber(teacher.getDeptNumber());
				if(model.getCategoryId()==null)
				model.setCategoryId(teacher.getCategoryId());
				if(model.getStaffroomId()==null)
				model.setStaffroomId(teacher.getStaffroomId());
			}
			/******************** 三级查询 学院-大类-专业教研室 ***********************************/
			departmentList = sysDepartmentService.findAllSysDepartmentList();
			//部门信息
			if (departmentList != null && departmentList.size() != 0) {
				if (model.getDeptNumber() == null) {
					model.setDeptNumber(departmentList.get(0).getDeptNumber());
				}
			//大类信息
			categoryList = sysCategoryService.findByDeptNumber(model.getDeptNumber());

				if (categoryList != null && categoryList.size() != 0) {
					if (model.getCategoryId() == null) {
						model.setCategoryId(categoryList.get(0).getCategoryId());
					}
				}
			//专业信息
			sysMajorList = sysMajorService.findByCategoryId(model.getCategoryId());
			}
			/******************** 三级查询 end ***********************************/
			
			pageResult = sysTeacherService.find(model, getPage(), getRow());
			logger.info(pageResult);
			footer = PageUtil.pageFooter(pageResult, getRequest());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 添加
	 * 
	 * @return
	 */
	public String add() {
		try {
			logger.info("添加教师" + model);
			model = sysTeacherService.add(model, userHelp);
			mark = "1";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return openAdd();
	}

	/**
	 * 打开添加教师页面
	 * 
	 * @return
	 */
	public String openAdd() {
		logger.info("## 打开添加教师");

		departmentList = sysDepartmentService.findAllSysDepartmentList();
		if (departmentList != null && departmentList.size() != 0) {

			if (teacher == null || teacher.getDeptNumber() == null) {
				teacher.setDeptNumber(departmentList.get(0).getDeptNumber());
			}

			categoryList = sysCategoryService.findByDeptNumber(teacher
					.getDeptNumber());
			if (teacher == null || teacher.getCategoryId() == null) {
				if (categoryList != null && categoryList.size() != 0) {
					teacher.setCategoryId(categoryList.get(0).getCategoryId());
				}
			}
			sysMajorList = sysMajorService.findByCategoryId(teacher
					.getCategoryId());
		}
		sysTechnicalList = sysTechnicalService.findAllSysTechnicalList();
		//sysDutiesList = sysDutiesService.findAllSysDutiesList();
		return SUCCESS;
	}

	/**
	 * 打开教师修改页面
	 * 
	 * @return
	 */
	public String openEdit() {
		try {
			logger.info("打开教师修改页面");
			if (thisId != null) {
				teacher = sysTeacherService.findModelById(thisId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return openAdd();
	}

	/**
	 * 修改教师信息
	 * 
	 * @return
	 */
	public String edit() {
		logger.info("修改教师信息");

		try {
			if (model != null && model.getTeacherId() != null) {
				sysTeacherService.edit(model, userHelp);
				mark = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
			mark = "0";
		}
		return openEdit();
	}

	/**
	 * 打开可选专业页面
	 * 
	 * @return
	 */
	public String openMajorList() {
		logger.info("打开可选专业页面");
		try {
			if (sysMajor == null)
				sysMajor = new SysMajor();

			if (teacherMajor != null && teacherMajor.getTeacherId() != null) {
				teacherMajorList = teacherMajorService
						.findByExample(teacherMajor);
				model = sysTeacherService.findById(teacherMajor.getTeacherId());

				sysMajor.setDeptNumber(model.getDeptNumber());
				pageResult1 = sysMajorService.find(sysMajor, getPage(),
						getRow());
				footer = PageUtil.pageFooter(pageResult1, getRequest());

				sysDepartment = sysDepartmentService
						.findSysDepartmentByDeptNumber(model.getDeptNumber());
				sysMajorList = sysMajorService.findByDeptNumber(model
						.getDeptNumber());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 打开研究方向页面
	 * 
	 * @return
	 */
	public String openDirectionsList() {
		logger.info("打开研究方向页面");
		try {
			if (sysDirections == null) sysDirections = new SysDirections();
			if (teacherDirections != null && teacherDirections.getTeacherId() != null) {
				/******************* 通过老师id查询老师研究方向 **********************/
				teacherDirectionsList = teacherDirectionsService.findByExample(teacherDirections);
				/******************* 查询所有研究方向 **********************/
//				sysDirectionsList = sysDirectionsService.findByExample(sysDirections);
				//TODO:待完善分页
				pageResult2 = sysDirectionsService.find(sysDirections, getPage(), getRow());

				footer = PageUtil.pageFooter(pageResult2, getRequest());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	/**
	 * 添加可选专业信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public void addTeacherMajor() {
		boolean idTrue = false;
		try {
			logger.info("添加可选专业信息" + teacherMajor.getMajorId()
					+ teacherMajor.getTeacherId());
			PrintWriter out = getResponse().getWriter();

			if (teacherMajor != null && teacherMajor.getMajorId() != null && teacherMajor.getTeacherId() != null) {

				planYear = planYearSerivce.findPlanYear();
				teacherMajor.setYear(planYear.getYear());

				teacherMajor = teacherMajorService.add(teacherMajor);
				if (teacherMajor.getId() != null) {// 不可用
					idTrue = true;
				}
			}
			out.print(idTrue);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 添加可选研究方向信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public void addTeacherDirections() {
		logger.info("添加可选研究方向信息");
		boolean idTrue = false;
		try {
			PrintWriter out = getResponse().getWriter();
			if (teacherDirections != null
					&& teacherDirections.getTeacherId() != null
					&& teacherDirections.getDirectionsId() != null) {
				planYear = planYearSerivce.findPlanYear();
				teacherDirections.setYear(planYear.getYear());
				teacherDirections = teacherDirectionsService
						.add(teacherDirections);
				if (teacherDirections.getId() != null) {// 不可用
					idTrue = true;
				}
			}
			out.print(idTrue);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 删除教师所选专业信息
	 * 
	 * @return
	 */
	public void delMajor() throws Exception {
		logger.info(" 删除教师所选专业信息");
		boolean isdel = false;
		PrintWriter out = getResponse().getWriter();
		if (thisId != null) {
			teacherMajorService.del(thisId);
			isdel = true;
		}
		out.print(isdel);
		out.flush();
		out.close();
	}

	/**
	 * 删除教师所选研究方向信息
	 * 
	 * @return
	 */
	public void delDirections() throws Exception {
		logger.info(" 删除教师所选研究方向信息");
		boolean isdel = false;
		PrintWriter out = getResponse().getWriter();
		if (thisId != null) {
			teacherDirectionsService.del(thisId);
			isdel = true;
		}
		out.print(isdel);
		out.flush();
		out.close();
	}

	/**
	 * 打开批量导入页面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String openAddTeacherByExcel() throws Exception {
		logger.info("到页面...");
		return SUCCESS;
	}

	/**
	 * 删除教师信息
	 * 
	 * @return
	 */
	public String del() {
		logger.info("删除教师信息");
		boolean isdel = false;
		try {
			PrintWriter out = getResponse().getWriter();
			if (thisId != null) {
				sysTeacherService.del(thisId);

				isdel = true;
			}
			out.print(isdel);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 导入教师信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addTeacherByExcel() {

		List<SysDepartment> allSysDepartmentList = sysDepartmentService.findAllSysDepartmentList();//学院
		List<SysMajor> allSysMajorList = sysMajorService.findAllSysMajorList();//教研室
		List<SysTechnical> allSysTechnicalList = sysTechnicalService.findAllSysTechnicalList();//职称

		logger.info("导入教师信息" + model.getTeacherName());

		mark = "1";
		SysMajor sM = new SysMajor();
		try {
			if (excelFile != null) {
				for (int i = 0; i < excelFile.size(); i++) {
					if (null != excelFile.get(i)) {
						Workbook workbook = createWorkBook(new FileInputStream(
								excelFile.get(i)));
						Sheet sheet = workbook.getSheetAt(0);
						System.out.println("当前列数：" + sheet.getLastRowNum());

						Row firstRow = sheet.getRow(0);
						Iterator<Cell> iterator = firstRow.iterator();
						List<String> cellNames = new ArrayList<String>();
						while (iterator.hasNext()) {
							cellNames.add(iterator.next().getStringCellValue());
						}

						// sheet.getLastRowNum() 当前列数
						for (int j = 1; j <= sheet.getLastRowNum(); j++) {
							Row row = sheet.getRow(j);
							SysTeacher model = new SysTeacher();
							// 职工号
							if (row.getCell(1) != null) {
								row.getCell(1).setCellType(
										Cell.CELL_TYPE_STRING);
								model.setTeacherNo(row.getCell(1)
										.getStringCellValue());
								userHelp.setPassword(model.getTeacherNo());
							}// 姓名
							if (row.getCell(2) != null) {
								row.getCell(2).setCellType(
										Cell.CELL_TYPE_STRING);
								model.setTeacherName(row.getCell(2)
										.getStringCellValue());
							}
							// 院系
							if (row.getCell(3) != null) {
								row.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
//								sysDepartment = sysDepartmentService.findSysDepartmentByDeptName(row.getCell(3).getStringCellValue());
								for (SysDepartment tmp:allSysDepartmentList){
									if (tmp.getDeptName().equals(row.getCell(3).getStringCellValue())){
										sysDepartment = tmp;break;
									}
								}
								if (sysDepartment != null)
									model.setDeptNumber(sysDepartment
											.getDeptNumber());
							}
							// 教研室
							if (row.getCell(4) != null) {
								row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);

//                                sM.setMajorName(row.getCell(4).getStringCellValue());
//                                List<SysMajor> byExample = sysMajorService.findByExample(sM);
//                                if (byExample!=null&&byExample.size()>0)this.sysMajor=byExample.get(0);

                                for(SysMajor tmp:allSysMajorList){
                                	if (tmp.getMajorName().equals(row.getCell(4).getStringCellValue())){
                                		sysMajor = tmp;break;
									}
								}

								if (this.sysMajor != null){
									model.setStaffroomId(this.sysMajor.getMajorId());//教研室
									model.setCategoryId(this.sysMajor.getCategoryId());//大类
								}else {
									logger.warn("查找教研室失败,查找条件："+row.getCell(4));
									logger.warn("Message:"+sM);
								}
							}
							// 教师职称
							if (row.getCell(5) != null) {
								row.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
//								sysTechnical = sysTechnicalService.findByName(row.getCell(5).getStringCellValue());
								for (SysTechnical tmp:allSysTechnicalList){
									if (tmp.equals(row.getCell(5).getStringCellValue())){
										sysTechnical = tmp;break;
									}
								}
								if (sysTechnical != null)
									model.setTechnicalId(sysTechnical
											.getTechnicalId());
							}
							// 性别
							if (row.getCell(6) != null) {
								row.getCell(6).setCellType(
										Cell.CELL_TYPE_STRING);
								if ("男".equals(row.getCell(6)
										.getStringCellValue())) {
									userHelp.setUserSex("1");
								} else if ("女".equals(row.getCell(6)
										.getStringCellValue())) {
									userHelp.setUserSex("0");
								}else {
									userHelp.setUserSex("0");
								}
							}
							// 年龄
							if (row.getCell(7) != null) {
								row.getCell(7).setCellType(
										Cell.CELL_TYPE_STRING);
								userHelp.setUserAge(row.getCell(7)
										.getStringCellValue());
							}
							// 邮箱
							if (row.getCell(8) != null) {
								row.getCell(8).setCellType(
										Cell.CELL_TYPE_STRING);
								userHelp.setUserEmail(row.getCell(8)
										.getStringCellValue());
							}

							// 联系电话
							if (row.getCell(9) != null) {
								row.getCell(9).setCellType(
										Cell.CELL_TYPE_STRING);
								userHelp.setUserTel(row.getCell(9)
										.getStringCellValue());
							}

							List<UserHelp> lHelps = userHelpService
									.findByLoginName(model.getTeacherNo());
							if (lHelps.size() > 0) {
								if (exitList == null) {
									exitList = new ArrayList<SysTeacher>();
								}
								exitList.add(model);
							} else if (model.getTeacherNo()!=null&&!("".equals(model.getTeacherNo()))&&model.getTeacherName()!=null&&!("".equals(model.getTeacherName()))){
								sysTeacherService.add(model, userHelp);
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list();
	}

	/**
	 * 读取文件
	 * 
	 * @param is
	 * @return Workbook
	 * @throws IOException
	 * @author 俸捷
	 * @date 2017.06.01
	 */
	public Workbook createWorkBook(InputStream is) throws IOException {
		if (excelFileFileName.toLowerCase().endsWith("xls")) {
			return new HSSFWorkbook(is);
		}
		if (excelFileFileName.toLowerCase().endsWith("xlsx")) {
			return new XSSFWorkbook(is);
		}
		return null;
	}

	/**
	 * 检查教师是否存在
	 * 
	 * @author 韦东连
	 * @date 2017.07.13.
	 */
	public void checkName() throws Exception {
		logger.info("检查教师是否存在");
		boolean idTrue = true;
		try {
			PrintWriter out = getResponse().getWriter();
			List<ListTeacher> lists = sysTeacherService.findByExample(model);
			if (null != lists && lists.size() > 0) {
				idTrue = false;
			}
			out.print(idTrue);
			out.flush();
			out.close();
		} catch (Exception e) {
			logger.info(e + "检查教师出错");
		}

	}

	/**
	 * 联动查询 查询老師json数据通过学院编号
	 * 
	 * @return
	 */
	public void findJsonByDept() throws Exception {
		logger.info("查询大类json数据通过学院编号");
		try {
			List<SysTeacher> lists = new ArrayList<SysTeacher>();
			HttpServletResponse response = getResponse();
			PrintWriter out = response.getWriter();
			if (StringUtils.isNotEmpty(model.getDeptNumber())) {
				lists = sysTeacherService.findByDeptNumber(model
						.getDeptNumber());
			}
			out.print(new Gson().toJson(lists));
			out.flush();
			out.close();
		} catch (Exception e) {
			logger.info("查询老師json数据通过学院编号" + e);
		}
	}

	/******************************** getter/settter方法 *****************************************/
	public ISysTeacherService getSysTeacherService() {
		return sysTeacherService;
	}

	public void setSysTeacherService(ISysTeacherService sysTeacherService) {
		this.sysTeacherService = sysTeacherService;
	}

	public ListTeacher getTeacher() {
		return teacher;
	}

	public void setTeacher(ListTeacher teacher) {
		this.teacher = teacher;
	}

	public List<SysMajor> getSysMajorList() {
		return sysMajorList;
	}

	public void setSysMajorList(List<SysMajor> sysMajorList) {
		this.sysMajorList = sysMajorList;
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

	public String getExcelFileFileName() {
		return excelFileFileName;
	}

	public void setExcelFileFileName(String excelFileFileName) {
		this.excelFileFileName = excelFileFileName;
	}

	public List<File> getExcelFile() {
		return excelFile;
	}

	public void setExcelFile(List<File> excelFile) {
		this.excelFile = excelFile;
	}

	public List<SysTeacher> getExitList() {
		return exitList;
	}

	public void setExitList(List<SysTeacher> exitList) {
		this.exitList = exitList;
	}

	public SysDepartment getSysDepartment() {
		return sysDepartment;
	}

	public void setSysDepartment(SysDepartment sysDepartment) {
		this.sysDepartment = sysDepartment;
	}

	public List<SysDepartment> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<SysDepartment> departmentList) {
		this.departmentList = departmentList;
	}

	public SysTechnical getSysTechnical() {
		return sysTechnical;
	}

	public void setSysTechnical(SysTechnical sysTechnical) {
		this.sysTechnical = sysTechnical;
	}

	public List<SysTechnical> getSysTechnicalList() {
		return sysTechnicalList;
	}

	public void setSysTechnicalList(List<SysTechnical> sysTechnicalList) {
		this.sysTechnicalList = sysTechnicalList;
	}

	public TeacherMajor getTeacherMajor() {
		return teacherMajor;
	}

	public void setTeacherMajor(TeacherMajor teacherMajor) {
		this.teacherMajor = teacherMajor;
	}

	public List<ListTeacherMajor> getTeacherMajorList() {
		return teacherMajorList;
	}

	public void setTeacherMajorList(List<ListTeacherMajor> teacherMajorList) {
		this.teacherMajorList = teacherMajorList;
	}

	public SysMajor getSysMajor() {
		return sysMajor;
	}

	public void setSysMajor(SysMajor sysMajor) {
		this.sysMajor = sysMajor;
	}

	public Result<SysMajor> getPageResult1() {
		return pageResult1;
	}

	public void setPageResult1(Result<SysMajor> pageResult1) {
		this.pageResult1 = pageResult1;
	}

	public PlanYear getPlanYear() {
		return planYear;
	}

	public void setPlanYear(PlanYear planYear) {
		this.planYear = planYear;
	}

	public Result<ListTeacher> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<ListTeacher> pageResult) {
		this.pageResult = pageResult;
	}

	public ISysDirectionsService getSysDirectionsService() {
		return sysDirectionsService;
	}

	public void setSysDirectionsService(
			ISysDirectionsService sysDirectionsService) {
		this.sysDirectionsService = sysDirectionsService;
	}

	public SysDirections getSysDirections() {
		return sysDirections;
	}

	public void setSysDirections(SysDirections sysDirections) {
		this.sysDirections = sysDirections;
	}

	public TeacherDirections getTeacherDirections() {
		return teacherDirections;
	}

	public void setTeacherDirections(TeacherDirections teacherDirections) {
		this.teacherDirections = teacherDirections;
	}

	public List<SysDirections> getSysDirectionsList() {
		return sysDirectionsList;
	}

	public void setSysDirectionsList(List<SysDirections> sysDirectionsList) {
		this.sysDirectionsList = sysDirectionsList;
	}

	public List<ListTeacherDirections> getTeacherDirectionsList() {
		return teacherDirectionsList;
	}

	public void setTeacherDirectionsList(
			List<ListTeacherDirections> teacherDirectionsList) {
		this.teacherDirectionsList = teacherDirectionsList;
	}

	public UserHelp getUserHelp() {
		return userHelp;
	}

	public void setUserHelp(UserHelp userHelp) {
		this.userHelp = userHelp;
	}

	public List<SysCategory> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<SysCategory> categoryList) {
		this.categoryList = categoryList;
	}

	public List<SysDuties> getSysDutiesList() {
		return sysDutiesList;
	}

	public void setSysDutiesList(List<SysDuties> sysDutiesList) {
		this.sysDutiesList = sysDutiesList;
	}

	public Result<SysDirections> getPageResult2() {
		return pageResult2;
	}

	public void setPageResult2(Result<SysDirections> pageResult2) {
		this.pageResult2 = pageResult2;
	}
}
