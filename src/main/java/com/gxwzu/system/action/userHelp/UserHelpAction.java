package com.gxwzu.system.action.userHelp;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;

import com.gxwzu.system.model.sysCategory.SysCategory;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysDuties.SysDuties;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.model.sysTechnical.SysTechnical;
import com.gxwzu.system.service.sysCategory.ISysCategoryService;
import com.gxwzu.system.service.sysClass.ISysClassService;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysDuties.ISysDutiesService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.gxwzu.system.service.sysTechnical.ISysTechnicalService;
import com.gxwzu.util.R;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.model.UploadFileResponse;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.util.UidUtils;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.system.model.sysClass.SysClass;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.sysRole.SysRole;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.model.userHelp.UserHelp;
import com.gxwzu.system.service.sysRole.ISysRoleService;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.gxwzu.system.service.userHelp.IUserHelpService;

/**
 * 用户管理控制层
 *
 * @author he
 */
public class UserHelpAction extends BaseAction {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    protected final Log logger = LogFactory.getLog(getClass());

    /********************** 对象实例化 *******************/
    private UserHelp model = new UserHelp();
    public UserHelp getModel() {
        return model;
    }

    public void setModel(UserHelp model) {
        this.model = model;
    }

    /*********************** Service接口注入 ***************************/

    @Autowired
    private IUserHelpService userHelpService;
    @Autowired
    private ISysRoleService sysRoleService;
    @Autowired
    private ISysStudentService sysStudentService;// 学生接口
    @Autowired
    private ISysTeacherService sysTeacherService;// 老师接口
    @Autowired
    private ISysDepartmentService sysDepartmentService;//学院
    @Autowired
    private ISysDutiesService iSysDutiesService;//职务
    @Autowired
    private ISysTechnicalService iSysTechnicalService;//职称
    @Autowired
    private ISysCategoryService iSysCategoryService;//大类
    @Autowired
    private ISysMajorService iSysMajorService;//专业及教研室
    @Autowired
    private ISysClassService iSysClassService;//班级

    /******************** 实体 *********************/

    /******************** 变量声明 *********************/
    private Result<UserHelp> pageResult;
    private Integer thisId;
    private List<String> roleIds;
    private String mark;
    private String allot; // 权限分配状态 1-取消分配 2-分配
    private List<SysRole> roles;
    private ListStudent student = new ListStudent();
    private ListTeacher teacher = new ListTeacher();
    private List<SysClass> classes = new ArrayList<>();//班级
    private List<UserHelp> userHelpList = new ArrayList<UserHelp>(); //论文信息列表（用于查询全部）
    private List<SysDepartment> sysDepartments = new ArrayList();//学院
    private List<SysTechnical> sysTechnicals = new ArrayList<>();//职称
    private List<SysDuties> duties = new ArrayList<>();
    private List<SysMajor> majors = new ArrayList<>();
    private List<SysCategory> sysCategorys = new ArrayList<>();


    private File image; // 上传的文件
    private String imageFileName; // 文件名称
    private String imageContentType; // 文件类型
    //定义一个ServletContext
    private ServletContext context;
    private File upload;//上传的文件
    private String uploadFileName; // 上传文件名
    private String targetFileNames;
    private String savePath; // 保存路径
    private String path;//保存路径


    /************************ 方法体 ********************/

    /**
     * 用户管理列表
     *
     * @return
     */
    public String list() {
        try {
            UserHelp userHelp = new UserHelp();

            if (model == null) {
                model = userHelp;
            }
            if (model.getUserType() == null) {
                model.setUserType("3"); // 0.所有后勤用户，1.学生用户2.办公用户,3.管理员
            }

            roles = sysRoleService.findAll(SysRole.class);
            pageResult = userHelpService.find(model, getPage(), getRow());
            footer = PageUtil.pageFooter(pageResult, getRequest());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    /**
     * 打开用户添加页面
     *
     * @return
     */
    public String openAdd() {
        logger.info("打开用户添加页面");
        try {
        } catch (Exception e) {
            e.printStackTrace();
        }
        roles = sysRoleService.findAll(SysRole.class);
        return SUCCESS;
    }

    /**
     * 添加用户
     *
     * @return
     */
    public String add() {
        logger.info("添加用户" + roleIds);
        try {
            if (null != model) {
                java.util.Date date = new java.util.Date();
                long time = date.getTime();
                model.setOpTime(new Timestamp(time));
                if (roleIds != null)
                    model.setSysRoles(getRoleSet(null, roleIds));
                model.setUserType("3"); // 0.所有后勤用户，1.学生用户2.办公用户,3 管理员
                model = userHelpService.add(model);
                mark = "1";
            }

        } catch (Exception e) {
            e.printStackTrace();
            mark = "0";
        }
        return list();
    }

    /**
     * 打开用户修改页面
     *
     * @return
     */
    public String openEdit() {
        logger.info("打开用户修改页面");
        try {
            model = userHelpService.findById(thisId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        roles = sysRoleService.findAll(SysRole.class);
        return SUCCESS;
    }

    /**
     * 打开用户个人信息页面
     *
     * @return
     */
    public String openUserInfo() {
        logger.info("打开用户个人信息页面");
        try {
            Integer thisId = (Integer) getSession().getAttribute(SystemContext.USERID);
            String userNo = (String) getSession().getAttribute(SystemContext.LOGINNAME);
            String userType = (String) getSession().getAttribute(SystemContext.USERTYPE);

            model = userHelpService.findById(thisId);
            //教研室/专业
            majors = iSysMajorService.findAllSysMajorList();
            //二级学院
            sysDepartments = sysDepartmentService.findAllSysDepartmentList();
            //大类
            sysCategorys = iSysCategoryService.findAllSysCategoryList();
            // 1-学生 2-老师 3-管理员
            if ("1".equals(userType)) {
                student = sysStudentService.findByStuNo(userNo);
                classes = iSysClassService.findAllsysClassList();//班级
            }
            if ("2".equals(userType)) {
                teacher = sysTeacherService.findByTeacherNo(userNo);
                //职务
                duties = iSysDutiesService.findAllSysDutiesList();
                //职称
                sysTechnicals = iSysTechnicalService.findAllSysTechnicalList();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    /**
     * 打开用户个人修改信息页面
     *
     * @return
     */
    public String openEditUserInfo() {
        logger.info("打开用户个人修改信息页面");
        try {
            Integer thisId = (Integer) getSession().getAttribute(SystemContext.USERID);
            String userNo = (String) getSession().getAttribute(SystemContext.LOGINNAME);
            String userType = (String) getSession().getAttribute(SystemContext.USERTYPE);

            model = userHelpService.findById(thisId);
            getRequest().setAttribute("userSign",
                    getRequest().getParameter("userHelpSign"));

            // 1-学生 2-老师 3-管理员
            if ("1".equals(userType)) {
                student = sysStudentService.findByStuNo(userNo);
            }
            if ("2".equals(userType)) {
                teacher = sysTeacherService.findByTeacherNo(userNo);
                //二级学院
                sysDepartments = sysDepartmentService.findAllSysDepartmentList();
                //职务
//                staffrooms = iSysDutiesService.findAllSysDutiesList();
                //职称
                sysTechnicals = iSysTechnicalService.findAllSysTechnicalList();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    /**
     * 修改用户信息
     *
     * @return
     */
    public String edit() {
        logger.info("修改用户信息" + model.getId());
        try {
            if (null != model && model.getId() != null) {

                UserHelp userHelp = userHelpService.findById(model.getId());

                Set<SysRole> set = new HashSet<SysRole>();
                userHelp.setSysRoles(getRoleSet(set, roleIds));
                userHelpService.edit(userHelp);

                mark = "1";
            }
        } catch (Exception e) {
            e.printStackTrace();
            mark = "0";
        }
        return list();
    }

    /**
     * 修改个人信息
     *
     * @return
     */
    public String editUserInfo() {
        try {
            if (null != model && model.getId() != null) {
                UserHelp userHelp = userHelpService.findById(model.getId());
                String oldPsd = getRequest().getParameter("oldPsd");
                String newPsd = getRequest().getParameter("newPsd");
                String isPsd = getRequest().getParameter("isPsd");
                if (newPsd != null && userHelp.getPassword().equals(oldPsd) && isPsd.equals("1")) {
                    userHelp.setPassword(newPsd);
                }
                //性别
                userHelp.setUserSex(model.getUserSex());
                //电话
                userHelp.setUserTel(model.getUserTel());
                //邮箱
                userHelp.setUserEmail(model.getUserEmail());

                userHelpService.edit(userHelp);

                if (SystemContext.USER_STUDENT_TYPE.equals(userHelp.getUserType())){//学生

                    SysStudent oldStudent = sysStudentService.findByUserId(userHelp.getId());
                    //班级
                    if (student.getClassId()!=null)oldStudent.setClassId(student.getClassId());
                    //学院
                    if(student.getDeptNumber()!=null)oldStudent.setDeptNumber(student.getDeptNumber());
                    //专业
                    if (student.getMajorId()!=null)oldStudent.setMajorId(student.getMajorId());
                    //身份证
                    if (student.getStuIdcart()!=null)oldStudent.setStuIdcart(student.getStuIdcart());
                    //大类
                    if (student.getCategoryId()!=null)oldStudent.setCategoryId(student.getCategoryId());
                    //家庭住址
                    if (student.getStuAddress()!=null)oldStudent.setStuAddress(student.getStuAddress());
                    //学历
                    if (student.getStuArrangement()!=null)oldStudent.setStuArrangement(student.getStuArrangement());
                    //学制
                    if (student.getStuSchoollength()!=null)oldStudent.setStuSchoollength(student.getStuSchoollength());
                    //年级
                    if (student.getStuGrade()!=null)oldStudent.setStuGrade(student.getStuGrade());

                    sysStudentService.update(oldStudent);

                }else if (SystemContext.USER_TEACHER_TYPE.equals(userHelp.getUserType())){//教师

                    SysTeacher oldTeacher = sysTeacherService.findTeacherByUserId(userHelp.getId());
                    //教研室
                    if (teacher.getStaffroomId()!=null)oldTeacher.setStaffroomId(teacher.getStaffroomId());
                    //大类
                    if (teacher.getCategoryId()!=null)oldTeacher.setCategoryId(teacher.getCategoryId());
                    //二级学院
                    if (teacher.getDeptNumber()!=null)oldTeacher.setDeptNumber(teacher.getDeptNumber());
                    //职称
                    if (teacher.getDutiesNo()!=null){
                        oldTeacher.setDutiesNo(teacher.getDutiesNo());
                        oldTeacher.setDutiesNo(iSysDutiesService.findByDutiesNo(teacher.getDutiesNo()).getDutiesNo());
                    }
                    //职务
                    if (teacher.getTechnicalId()!=null)oldTeacher.setTechnicalId(teacher.getTechnicalId());

                    sysTeacherService.saveOrUpdate(oldTeacher);
                }
                mark = "1";
            }
        } catch (Exception e) {
            e.printStackTrace();
            mark = "0";
        }
        return openUserInfo();
    }


    /**
     * 个人图片上传
     *
     * @return
     * @author 黎艺侠
     */
    public void loadUserHelpImg() {
        logger.info(" 个人图片上传");
        try {
            PrintWriter out = getResponse().getWriter();
            //判断是否上传成功
            UploadFileResponse<UserHelp> userHelpList = new UploadFileResponse<UserHelp>();
            logger.info("ceshi文件：" + upload);
            UserHelp userHelp = userHelpService.findById(thisId);
            if (upload != null) {
                //1-保存附件；
                // 文件的绝对路径
                String targetDirectory = ServletActionContext.getServletContext().getRealPath("/attached/userImg");
                // 得到文件后缀判断文件类型
                String targetFileName = uploadFileName.substring(uploadFileName.lastIndexOf("."));
                // 得到文件名
                String name = uploadFileName.substring(0, uploadFileName.lastIndexOf("."));
                //保存到数据库的文件名
                targetFileName = UidUtils.UID() + "_" + name + targetFileName;
                //保存到数据库的相对路径
                path = "/attached/userImg/" + targetFileName;
                File target = new File(targetDirectory, targetFileName);
                try {
                    FileUtils.copyFile(upload, target);
                    userHelpList.setCode(0);
                } catch (IOException e) {
                    userHelpList.setCode(1);
                }
            }
            userHelp.setUserImg(path);
            userHelpService.update(userHelp);
            out.print(new Gson().toJson(userHelpList));
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 删除用户信息
     *
     * @return
     */
    public String del() {
        logger.info("删除用户信息");
        boolean isdel = false;
        try {
            PrintWriter out = getResponse().getWriter();
            if (thisId != null) {
                userHelpService.del(thisId);
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
     * 检查用户名称/登录名是否存在
     *
     * @return
     */
    public void checkName() throws Exception {
        logger.info("检查用户是否存在");
        try {
            boolean idTrue = true;
            PrintWriter out = getResponse().getWriter();
            List<UserHelp> lists = userHelpService.findByExample(model);

            if (null != lists && lists.size() > 0) {// 不可用
                idTrue = false;
            }
            out.print(idTrue);
            out.flush();
            out.close();
        } catch (Exception e) {
            logger.info("检查用户出错");
        }
    }

    /**
     * 检查密码是否匹配
     *
     * @return
     */
    public void checkPassword() throws Exception {
        logger.info("检查密码是否匹配");
        try {
            boolean idTrue = true;
            PrintWriter out = getResponse().getWriter();
            if (getRequest().getParameter("oldPsd") != null) {
                Integer uid = (Integer) getSession().getAttribute(SystemContext.USERID);
                UserHelp userHelp = userHelpService.findById(uid);
                userHelp.setPassword(getRequest().getParameter("oldPsd"));

                List<UserHelp> lists = userHelpService.findByNamePawd(userHelp);
                if (null == lists || lists.size() <= 0) {// 不可用
                    idTrue = false;
                }
            } else {
                idTrue = false;
            }
            out.print(idTrue);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
            logger.info("检查用户出错");
        }
    }

    /**
     * 获取角色集合
     *
     * @param set
     * @param roleIds
     * @return
     */
    private Set<SysRole> getRoleSet(Set<SysRole> set, List<String> roleIds) {
        if (set == null)
            set = new HashSet<SysRole>();
        if (roleIds == null)
            return set;
        for (String roleId : roleIds) {
            if (StringUtils.isEmpty(roleId))
                continue;
            set.add(sysRoleService.findById(Integer.parseInt(roleId)));
        }
        return set;
    }
    /**
     * 修改签名
     */
    public void updateSign() throws Exception{

        logger.info("修改签名："+model.getSign());

        PrintWriter out = getResponse().getWriter();

        Integer thisId = (Integer) getSession().getAttribute(SystemContext.USERID);

        UserHelp userHelp = userHelpService.findById(thisId);

        userHelp.setSign(model.getSign());

        userHelpService.update(userHelp);

        out.print(new R().ok());
        out.flush();
        out.close();
    }

    /*********************** setter/getter方法 ***************************/
    public Result<UserHelp> getPageResult() {
        return pageResult;
    }

    public void setPageResult(Result<UserHelp> pageResult) {
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

    public List<String> getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(List<String> roleIds) {
        this.roleIds = roleIds;
    }

    public List<SysRole> getRoles() {
        return roles;
    }

    public void setRoles(List<SysRole> roles) {
        this.roles = roles;
    }

    public String getAllot() {
        return allot;
    }

    public void setAllot(String allot) {
        this.allot = allot;
    }

    public ISysStudentService getSysStudentService() {
        return sysStudentService;
    }

    public void setSysStudentService(ISysStudentService sysStudentService) {
        this.sysStudentService = sysStudentService;
    }

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

    public ListStudent getStudent() {
        return student;
    }

    public void setStudent(ListStudent student) {
        this.student = student;
    }

    public List<UserHelp> getUserHelpList() {
        return userHelpList;
    }

    public void setUserHelpList(List<UserHelp> userHelpList) {
        this.userHelpList = userHelpList;
    }

    public File getImage() {
        return image;
    }

    public void setImage(File image) {
        this.image = image;
    }

    public String getImageFileName() {
        return imageFileName;
    }

    public void setImageFileName(String imageFileName) {
        this.imageFileName = imageFileName;
    }

    public String getImageContentType() {
        return imageContentType;
    }

    public void setImageContentType(String imageContentType) {
        this.imageContentType = imageContentType;
    }

    public ServletContext getContext() {
        return context;
    }

    public void setContext(ServletContext context) {
        this.context = context;
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

    public String getTargetFileNames() {
        return targetFileNames;
    }

    public void setTargetFileNames(String targetFileNames) {
        this.targetFileNames = targetFileNames;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }


    public List<SysDepartment> getSysDepartments() {
        return sysDepartments;
    }

    public void setSysDepartments(List<SysDepartment> sysDepartments) {
        this.sysDepartments = sysDepartments;
    }

    public List<SysMajor> getMajors() {
        return majors;
    }

    public void setMajors(List<SysMajor> majors) {
        this.majors = majors;
    }

    public List<SysCategory> getSysCategorys() {
        return sysCategorys;
    }

    public void setSysCategorys(List<SysCategory> sysCategorys) {
        this.sysCategorys = sysCategorys;
    }

    public List<SysTechnical> getSysTechnicals() {
        return sysTechnicals;
    }

    public void setSysTechnicals(List<SysTechnical> sysTechnicals) {
        this.sysTechnicals = sysTechnicals;
    }

    public List<SysDuties> getDuties() {
        return duties;
    }

    public void setDuties(List<SysDuties> duties) {
        this.duties = duties;
    }

    public List<SysClass> getClasses() {
        return classes;
    }

    public void setClasses(List<SysClass> classes) {
        this.classes = classes;
    }
}
