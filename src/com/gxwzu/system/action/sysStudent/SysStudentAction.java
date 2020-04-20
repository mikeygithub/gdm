
package com.gxwzu.system.action.sysStudent;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.gxwzu.sysVO.MaterialInfo;
import com.gxwzu.util.ObjectConverter;
import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.DateUtils;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListClass;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.system.model.sysClass.SysClass;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysClass.ISysClassService;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.gxwzu.system.service.userHelp.IUserHelpService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 学生基本信息
 *
 * @author 黎艺侠
 * @date 2017.7.8
 */
public class SysStudentAction extends BaseAction implements ModelDriven<SysStudent> {

    private static final long serialVersionUID = -3343014949806289390L;

    protected final Log logger = LogFactory.getLog(getClass());

    /*********************** 实例化ModelDriven ******************************/
    private SysStudent model = new SysStudent();

    @Override
    public SysStudent getModel() {
        return model;
    }

    public void setModel(SysStudent model) {
        this.model = model;
    }

    /*********************** 注入Service ******************************/
    @Autowired
    private ISysStudentService sysStudentService;
    @Autowired
    private ISysDepartmentService sysDepartmentService;// 学院接口
    @Autowired
    private ISysClassService sysClassService; // 班级接口
    @Autowired
    private ISysMajorService sysMajorService; // 专业接口
    @Autowired
    private IUserHelpService userHelpService;
    @Autowired
    private ISysTeacherService sysTeacherService;
    /*********************** 实体 ******************************/
    private SysDepartment sysDepartment; // 院系实体
    private SysClass sysClass; // 班级实体
    private SysMajor sysMajor; // 专业实体
    private ListStudent student = new ListStudent();
    private UserHelp userHelp = new UserHelp();
    private ListTeacher teacher = new ListTeacher(); // 老师实体
    /*********************** 声明参数 ******************************/
    private Result<ListStudent> pageResult; // 分页
    private List<SysDepartment> sysDepartments; // 院系信息列表（用于查询分页）
    private List<SysMajor> sysMajors; // 院系信息列表（用于查询分页）
    private List<SysClass> sysClasses; // 院系信息列表（用于查询分页）

    private List<SysDepartment> departmentList = new ArrayList<SysDepartment>();
    private List<SysDepartment> sysDepartmentList; // 院系信息列表（用于查询全部）
    private List<ListClass> sysClassList = new ArrayList<ListClass>(); // 班级信息列表（用于查询全部）
    private List<SysMajor> sysMajorList = new ArrayList<SysMajor>(); // 专业信息列表（用于查询全部）
    private List<TeacherMajor> teacherMajorList = new ArrayList<TeacherMajor>();

    private Integer id;
    private Integer thisId;
    private String mark;
    private String excelFileFileName;
    private List<File> excelFile; // 导入excel
    private List<SysStudent> exitList;
    private String deptNumber;

    /************************** 方法类 **************************/
    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }

    /**
     * 学生信息显示列表
     *
     * @return
     */
    public String list() {
        logger.info("学生信息显示列表");
        try {
            String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
            String userType = (String) getSession().getAttribute(SystemContext.USERTYPE);
            //查询 当前老师所属专业教研室
            if ("2".equals(userType)) {
                teacher = sysTeacherService.findByTeacherNo(loginName);
                if (model.getDeptNumber() == null)
                    model.setDeptNumber(teacher.getDeptNumber());
                if (model.getMajorId() == null)
                    model.setMajorId(teacher.getStaffroomId());
            }
            /******************** 三级查询 学院-专业-班级 ***********************************/
            departmentList = sysDepartmentService.findAllSysDepartmentList();

            if (departmentList != null && departmentList.size() != 0) {
                if (model.getDeptNumber() == null) {
                    model.setDeptNumber(departmentList.get(0).getDeptNumber());
                }
                sysMajorList = sysMajorService.findByDeptNumber(model.getDeptNumber());

                if (sysMajorList != null && sysMajorList.size() != 0) {
                    if (model.getMajorId() == null) {
                        model.setMajorId(sysMajorList.get(0).getMajorId());
                    }
                }
                sysClassList = sysClassService.findByMajorId(model.getMajorId());
            }
            /******************** 三级查询 end ***********************************/

            pageResult = sysStudentService.find(ObjectConverter.Student2MaterialInfo(model), getPage(), getRow());

            footer = PageUtil.pageFooter(pageResult, getRequest());

        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    /**
     * 添加学生信息
     *
     * @return
     */
    public String add() {
        try {
            logger.info("添加" + model);
            model = sysStudentService.add(model, userHelp);
            mark = "1";
        } catch (Exception e) {
            e.printStackTrace();
            mark = "0";
        }
        return openAdd();
    }

    /**
     * 打开批量添加学生页面
     *
     * @return
     */
    public String openAddStudentByExcel() throws Exception {
        logger.info("到页面了…………");
        return SUCCESS;
    }

    /**
     * 打开添加学生页面
     *
     * @return
     */
    public String openAdd() {
        /************************************ 通过学院查询专业 **************************************************/
        sysDepartmentList = sysDepartmentService.findAllSysDepartmentList();

        if (sysDepartmentList != null && sysDepartmentList.size() != 0) {
            //查询该学生的学院下的专业
            if (student.getDeptNumber() != null) {
                sysMajorList = sysMajorService.findByDeptNumber(student.getDeptNumber());
            }
            /***************************************** 通过专业查询班级 **********************************************************/
            if (sysMajorList != null && sysMajorList.size() != 0) {
                if (student.getMajorId() != null) {
                    sysClassList = sysClassService.findByMajorId(student.getMajorId());
                }
            }
        }
        return SUCCESS;
    }

    /**
     * 打开学生修改页面
     *
     * @return
     */
    public String openEdit() {
        try {
            logger.info("打开学生修改页面");
            if (thisId != null) {
                student = sysStudentService.findViewModelById(thisId);
                //学院 专业 班级
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return openAdd();
    }

    /**
     * 修改学生信息
     *
     * @return
     */
    public String edit() {
        logger.info("修改学生信息");
        try {
            if (model != null && thisId != null) {
                model.setStuId(thisId);
                sysStudentService.edit(model, userHelp);
                mark = "1";
            }
        } catch (Exception e) {
            e.printStackTrace();
            mark = "0";
        }

        return openEdit();
    }

    /**
     * 删除学生信息
     *
     * @return
     */
    public void del() {
        logger.info("删除学生信息");
        boolean isdel = false;
        try {
            PrintWriter out = getResponse().getWriter();
            if (thisId != null) {
                sysStudentService.del(thisId);
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
     * 读取文件
     *
     * @param is
     * @return Workbook
     * @throws IOException
     * @author 黎艺侠
     * @date 2017.07.07
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
     * 通过导入学生信息
     *
     * @return
     * @throws Exception
     * @author 黎艺侠
     * @data 2017.7.8
     */
    public String addStudentByExcel() {
        //预先查询出所有需要匹配信息
        List<SysDepartment> allSysDepartmentList = sysDepartmentService.findAllSysDepartmentList();//二级学院
        List<SysClass> allsysClassList = sysClassService.findAllsysClassList();//班级
        List<SysMajor> allSysMajorList = sysMajorService.findAllSysMajorList();//专业

        logger.info("导入学生信息" + model.getStuName());

        try {
            mark = "1";
            if (excelFile != null) {
                for (int i = 0; i < excelFile.size(); i++) {
                    if (null != excelFile.get(i)) {
                        Workbook workbook = createWorkBook(new FileInputStream(
                                excelFile.get(i)));
                        Sheet sheet = workbook.getSheetAt(0);

                        logger.info("当前列数：" + sheet.getLastRowNum());

                        Row firstRow = sheet.getRow(0);
                        Iterator<Cell> iterator = firstRow.iterator();
                        List<String> cellNames = new ArrayList<String>();
                        while (iterator.hasNext()) {
                            cellNames.add(iterator.next().getStringCellValue());
                        }

                        // sheet.getLastRowNum() 当前列数
                        for (int j = 1; j <= sheet.getLastRowNum(); j++) {
                            Row row = sheet.getRow(j);
                            SysStudent sysStudent = new SysStudent();

                            if (row != null) {
                                // 院系
                                if (row.getCell(1) != null) {
                                    row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
                                    logger.warn("查询二级学院：" + row.getCell(1).getStringCellValue());
//                                    sysDepartment = sysDepartmentService.findSysDepartmentByDeptName(row.getCell(1).getStringCellValue());
                                    for(SysDepartment tmp :allSysDepartmentList){
                                        if (tmp.getDeptName().equals(row.getCell(1).getStringCellValue())){
                                            sysDepartment = tmp;break;
                                        }
                                    }
                                    logger.warn("查询结果:" + sysDepartment);
                                    if (sysDepartment != null) sysStudent.setDeptNumber(sysDepartment.getDeptNumber());
                                }
                                // 年级
                                if (row.getCell(2) != null) {
                                    row.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
                                    sysStudent.setStuGrade(row.getCell(2).getStringCellValue());
                                }

                                // 专业
                                if (row.getCell(3) != null) {
                                    row.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
//                                    sysMajor = sysMajorService.findSysMajorByMajorName(row.getCell(3).getStringCellValue());
                                    for (SysMajor tmp:allSysMajorList){
                                        if (tmp.getMajorName().equals(row.getCell(3).getStringCellValue())){
                                            sysMajor = tmp;break;
                                        }
                                    }
                                    if (sysMajor != null) sysStudent.setMajorId(sysMajor.getMajorId());
                                }
                                // 班级
                                if (row.getCell(4) != null) {
                                    row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
//                                    sysClass = sysClassService.findSysClassByClassName(row.getCell(4).getStringCellValue());
                                    for (SysClass tmp:allsysClassList){
                                        if (tmp.getClassName().equals(row.getCell(4).getStringCellValue())){
                                            sysClass = tmp;break;
                                        }
                                    }
                                    if (sysClass != null) sysStudent.setClassId(sysClass.getClassId());
                                }
                                // 学号
                                if (row.getCell(5) != null) {
                                    row.getCell(5).setCellType(
                                            Cell.CELL_TYPE_STRING);
                                    sysStudent.setStuNo(row.getCell(5)
                                            .getStringCellValue().trim());
                                    userHelp.setPassword(row.getCell(5)
                                            .getStringCellValue().trim());
                                }
                                // 姓名
                                if (row.getCell(6) != null) {
                                    row.getCell(6).setCellType(
                                            Cell.CELL_TYPE_STRING);
                                    sysStudent.setStuName(row.getCell(6)
                                            .getStringCellValue());
                                }
                                // 性别
                                if (row.getCell(7) != null) {
                                    row.getCell(7).setCellType(
                                            Cell.CELL_TYPE_STRING);
                                    if ("男".equals(row.getCell(7)
                                            .getStringCellValue())) {
                                        userHelp.setUserSex("0");
                                    } else if ("女".equals(row.getCell(7)
                                            .getStringCellValue())) {
                                        userHelp.setUserSex("1");
                                    }
                                }

                                // 身份证号
                                if (row.getCell(8) != null) {
                                    row.getCell(8).setCellType(
                                            Cell.CELL_TYPE_STRING);
                                    sysStudent.setStuIdcart(row.getCell(8)
                                            .getStringCellValue());
                                }

                                // 家庭地址
                                if (row.getCell(9) != null) {
                                    row.getCell(9).setCellType(
                                            Cell.CELL_TYPE_STRING);
                                    sysStudent.setStuAddress(row.getCell(9)
                                            .getStringCellValue());
                                }
                                // 学历层次
                                if (row.getCell(10) != null) {
                                    row.getCell(10).setCellType(
                                            Cell.CELL_TYPE_STRING);
                                    sysStudent.setStuArrangement(row.getCell(10)
                                            .getStringCellValue());
                                }

                                // 学制
                                if (row.getCell(11) != null) {
                                    row.getCell(11).setCellType(
                                            Cell.CELL_TYPE_STRING);
                                    sysStudent.setStuSchoollength(row.getCell(11)
                                            .getStringCellValue());
                                }
                                // 联系电话
                                if (row.getCell(12) != null) {
                                    row.getCell(12).setCellType(
                                            Cell.CELL_TYPE_STRING);
                                    userHelp.setUserTel(row.getCell(12)
                                            .getStringCellValue());
                                }
                                // email
                                if (row.getCell(13) != null) {
                                    row.getCell(13).setCellType(
                                            Cell.CELL_TYPE_STRING);
                                    userHelp.setUserEmail(row.getCell(13)
                                            .getStringCellValue());
                                }
                                try {
                                    // 入学时间
                                    if (row.getCell(14) != null) {
                                        row.getCell(14).setCellType(Cell.CELL_TYPE_NUMERIC);
                                        Date dateCellValue = row.getCell(14).getDateCellValue();
                                        if (dateCellValue != null)
                                            sysStudent.setStuEntrance(Timestamp.valueOf(DateUtils.formatTime(dateCellValue)));
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }

                                List<UserHelp> lHelps = userHelpService.findByLoginName(sysStudent.getStuNo());
                                if (lHelps.size() > 0) {
                                    if (exitList == null) {
                                        exitList = new ArrayList<SysStudent>();
                                    }
                                    exitList.add(model);
                                } else if (sysStudent.getStuName()!=null&&!("".equals(sysStudent.getStuName()))&&sysStudent.getStuNo()!=null&&!("".equals(sysStudent.getStuNo()))){
                                    sysStudentService.add(sysStudent, userHelp);
                                }
                                mark = "1";
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
     * @return
     * @author 俸捷
     */
    public String select() {
        try {
            pageResult = sysStudentService.find(ObjectConverter.Student2MaterialInfo(model), getPage(), getRow());
            footer = PageUtil.pageFooter(pageResult, getRequest());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    /**
     * 联动查询 查询专业json数据通过学院编号
     *
     * @return
     */
    public void findJsonByDept() throws Exception {
        logger.info("查询学生json数据通过学院编号、专业编号、班级编号");
        try {
            List<ListStudent> lists = new ArrayList<ListStudent>();
            HttpServletResponse response = getResponse();
            response.setCharacterEncoding("utf-8");
            PrintWriter out = response.getWriter();
            if (StringUtils.isNotEmpty(model.getDeptNumber())) {
                SysStudent sysStudent = new SysStudent();
                sysStudent.setDeptNumber(model.getDeptNumber());
                // lists=sysStudentService.findByExample(sysStudent);
            }
            if (model.getMajorId() != null) {
                SysStudent sysStudent = new SysStudent();
                sysStudent.setMajorId(model.getMajorId());
            }
            if (model.getClassId() != null) {
                SysStudent sysStudent = new SysStudent();
                sysStudent.setClassId(model.getMajorId());
                lists = sysStudentService.findByExample(sysStudent);
            }
            out.print(new Gson().toJson(lists));
            out.flush();
            out.close();
        } catch (Exception e) {
            logger.info("查询学生json数据通过学院编号、专业编号、班级编号" + e);
        }
    }

    /**
     * @author hjy
     * @date 2017.7.15 查询学号和姓名是否存在 throws Exception
     */
    public void checkName() throws Exception {
        boolean idTrue = true;
        try {
            ListStudent listStudent = null;
            PrintWriter out = getResponse().getWriter();
            if (model != null) {
                listStudent = sysStudentService.findByStuNo(model.getStuNo());
            }
            if (listStudent != null) {
                idTrue = false;
            }
            out.print(idTrue);
            out.flush();
            out.close();
        } catch (Exception e) {
            logger.info("查询学号和姓名是否存在");
        }
    }

    public void findStudentByStuId() {
        try {
            System.out.println(model.getStuId() + "************");
            model = sysStudentService.findById(model.getStuId());
            System.out.println(model.getStuName() + "&&&&&&&&&");
            HttpServletResponse response = ServletActionContext.getResponse();
            /* 设置格式为text/json */
            response.setContentType("text/json");
            /* 设置字符集为'UTF-8' */
            response.setCharacterEncoding("UTF-8");

            PrintWriter out = getResponse().getWriter();
            Gson g = new Gson();
            String json = g.toJson(model);
            out.print(json);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /************************* getter/setter方法 *****************************************/

    public ISysStudentService getSysStudentService() {
        return sysStudentService;
    }

    public void setSysStudentService(ISysStudentService sysStudentService) {
        this.sysStudentService = sysStudentService;
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

    public List<SysDepartment> getSysDepartments() {
        return sysDepartments;
    }

    public void setSysDepartments(List<SysDepartment> sysDepartments) {
        this.sysDepartments = sysDepartments;
    }

    public ISysDepartmentService getSysDepartmentService() {
        return sysDepartmentService;
    }

    public void setSysDepartmentService(
            ISysDepartmentService sysDepartmentService) {
        this.sysDepartmentService = sysDepartmentService;
    }

    public Log getLogger() {
        return logger;
    }

    public ISysClassService getSysClassService() {
        return sysClassService;
    }

    public void setSysClassService(ISysClassService sysClassService) {
        this.sysClassService = sysClassService;
    }

    public List<File> getExcelFile() {
        return excelFile;
    }

    public void setExcelFile(List<File> excelFile) {
        this.excelFile = excelFile;
    }

    public SysDepartment getSysDepartment() {
        return sysDepartment;
    }

    public void setSysDepartment(SysDepartment sysDepartment) {
        this.sysDepartment = sysDepartment;
    }

    public SysClass getSysClass() {
        return sysClass;
    }

    public void setSysClass(SysClass sysClass) {
        this.sysClass = sysClass;
    }

    public String getExcelFileFileName() {
        return excelFileFileName;
    }

    public void setExcelFileFileName(String excelFileFileName) {
        this.excelFileFileName = excelFileFileName;
    }

    public List<SysDepartment> getSysDepartmentList() {
        return sysDepartmentList;
    }

    public void setSysDepartmentList(List<SysDepartment> sysDepartmentList) {
        this.sysDepartmentList = sysDepartmentList;
    }

    public List<ListClass> getSysClassList() {
        return sysClassList;
    }

    public void setSysClassList(List<ListClass> sysClassList) {
        this.sysClassList = sysClassList;
    }

    public SysMajor getSysMajor() {
        return sysMajor;
    }

    public void setSysMajor(SysMajor sysMajor) {
        this.sysMajor = sysMajor;
    }

    public List<SysMajor> getSysMajorList() {
        return sysMajorList;
    }

    public void setSysMajorList(List<SysMajor> sysMajorList) {
        this.sysMajorList = sysMajorList;
    }

    public ISysMajorService getSysMajorService() {
        return sysMajorService;
    }

    public void setSysMajorService(ISysMajorService sysMajorService) {
        this.sysMajorService = sysMajorService;
    }

    public IUserHelpService getUserHelpService() {
        return userHelpService;
    }

    public void setUserHelpService(IUserHelpService userHelpService) {
        this.userHelpService = userHelpService;
    }

    public List<SysStudent> getExitList() {
        return exitList;
    }

    public void setExitList(List<SysStudent> exitList) {
        this.exitList = exitList;
    }

    public List<SysDepartment> getDepartmentList() {
        return departmentList;
    }

    public void setDepartmentList(List<SysDepartment> departmentList) {
        this.departmentList = departmentList;
    }

    public String getDeptNumber() {
        return deptNumber;
    }

    public void setDeptNumber(String deptNumber) {
        this.deptNumber = deptNumber;
    }

    public List<SysClass> getSysClasses() {
        return sysClasses;
    }

    public void setSysClasses(List<SysClass> sysClasses) {
        this.sysClasses = sysClasses;
    }

    public List<TeacherMajor> getTeacherMajorList() {
        return teacherMajorList;
    }

    public void setTeacherMajorList(List<TeacherMajor> teacherMajorList) {
        this.teacherMajorList = teacherMajorList;
    }

    public List<SysMajor> getSysMajors() {
        return sysMajors;
    }

    public void setSysMajors(List<SysMajor> sysMajors) {
        this.sysMajors = sysMajors;
    }

    public ListStudent getStudent() {
        return student;
    }

    public void setStudent(ListStudent student) {
        this.student = student;
    }

    public Result<ListStudent> getPageResult() {
        return pageResult;
    }

    public void setPageResult(Result<ListStudent> pageResult) {
        this.pageResult = pageResult;
    }

    public UserHelp getUserHelp() {
        return userHelp;
    }

    public void setUserHelp(UserHelp userHelp) {
        this.userHelp = userHelp;
    }

    public ListTeacher getTeacher() {
        return teacher;
    }

    public void setTeacher(ListTeacher teacher) {
        this.teacher = teacher;
    }

}
