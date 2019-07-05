package com.gxwzu.business.action.paper;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.issueInfo.IssueInfo;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.paper.StudentPaper;
import com.gxwzu.business.model.taskBook.TaskBook;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.issueInfo.IIssueInfoSerivce;
import com.gxwzu.business.service.materialInfo.IMaterialInfoSerivce;
import com.gxwzu.business.service.paper.IStudentPaperSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.business.service.taskBook.ITaskBookSerivce;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.model.UploadFileResponse;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.util.UidUtils;
import com.gxwzu.core.util.WordUtils;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListAllotGuide;
import com.gxwzu.sysVO.ListPaper;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.sysVO.MaterialInfo;
import com.gxwzu.system.model.sysClass.SysClass;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysFileType.SysFileType;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.service.sysClass.ISysClassService;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysFileType.ISysFileTypeService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 论文
 * 
 * @author 黎艺侠
 * @date 2017.9.27
 */
public class PaperAction extends BaseAction implements ModelDriven<StudentPaper> {

	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());

	/*********************** 实例化ModelDriven ******************************/
	private StudentPaper model = new StudentPaper();

	@Override
	public StudentPaper getModel() {
		return model;
	}

	public void setModel(StudentPaper model) {
		this.model = model;
	}

	/*********************** Service接口注入 ***************************/
	@Autowired
	private IStudentPaperSerivce studentPaperService; // 指导老师分配接口
	@Autowired
	private ISysStudentService sysStudentService; // 学生接口
	@Autowired
	private IIssueInfoSerivce issueInfoSerivce;
	@Autowired
	private ISysTeacherService sysTeacherService; // 老师接口
	@Autowired
	private IAllotGuideService allotGuideService; // 指导老师分配接口
	@Autowired
	private IMaterialInfoSerivce materialInfoSerivce; // 学生相关材料接口
	@Autowired
	private ISysFileTypeService sysFileTypeService; //文件类型接口
	
	/*********************** 实体 ***************************/
	private PlanYear planYear; // 年度计划实体
	private SysTeacher teacher = new SysTeacher(); // 老师实体
	private ListStudent student = new ListStudent(); // 学生实体
	private SysStudent sysStudent = new SysStudent(); // 学生实体
	private IssueInfo issueInfo = new IssueInfo(); // 课题列表实体
	private MaterialInfo materialInfo = new MaterialInfo();
	private SysFileType sysFileType = new SysFileType();
	
	/******************** 集合变量声明 *********************/
	private Result<StudentPaper> pageResult; // 任务书分页
	private List<ListTeacher> sysTeacherList = new ArrayList<ListTeacher>(); // 班级信息列表（用于查询全部）
	private List<ListPaper> studentPaperList = new ArrayList<ListPaper>(); //论文信息列表（用于查询全部）
	private List<SysFileType> fileTypeList = new ArrayList<SysFileType>(); //论文信息列表（用于查询全部）
	
	/************************** 基础变量声明 **************/
	private Integer thisId;
	private String mark;
	private String thisFileType;// 文件类型
	private Integer thisYear; // 年度
	private Integer thisStuId; // 学生Id
	private String savePath; // 保存路径

	private List<File> upload;// 上传的文件
	private List<String> uploadFileName; // 上传文件名
	private List<String> uploadContentType; // 上传文件类型
	private InputStream inputStream;
	 private String fileName;
	
	/************************** 方法类 **************************************************************************************/
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	/**
	 * 个人分页查询论文信息
	 * 
	 * @return
	 */
	public String list() {
		try {
			/* 登录名称 :查询学院 */
			String loginName = (String) getSession().getAttribute(
					SystemContext.LOGINNAME);
			/* 用户类型：1-学生 2-老师 */
			String userType = (String) getSession().getAttribute(
					SystemContext.USERTYPE);

			pageResult = studentPaperService.find(model, getPage(), getRow());
			footer = PageUtil.pageFooter(pageResult, getRequest());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}
	
	/**
	 * 学生查询论文信息
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
			model.setStuId(s.getStuId());
		}

		/************************** 查询学生信息 *********************************************/
		if (model.getStuId() != null) {
			sysStudent.setStuId(model.getStuId());
			student = sysStudentService.findByExample(sysStudent).get(0);
			ListAllotGuide aGuide = allotGuideService.findByStuId(model
					.getStuId());
			teacher = sysTeacherService.findById(aGuide.getTeacherId());

		}
		return list();
	}

	/**
	 * 个人上传文件信息
	 * 
	 * @return
	 */
	public void userInfoFile() {
		logger.info("个人上传文件信息");
		try {
			String loginName = (String) getSession().getAttribute(
					SystemContext.LOGINNAME);
			String type = (String) getSession()
					.getAttribute(SystemContext.USERTYPE);
			if (type.equals("1")) {
				ListStudent s = sysStudentService.findByStuNo(loginName);
				model.setStuId(s.getStuId());
			}
			PrintWriter out = getResponse().getWriter();
			if (thisYear != null&&model.getStuId()!=null) {
				model.setYear(thisYear);
				studentPaperList = studentPaperService.findList(model);
			}
			out.print(new Gson().toJson(studentPaperList));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 加载文件类型
	 * 
	 * @return
	 */
	public void loadFileType() {
		logger.info(" 加载文件类型");
		try {
			PrintWriter out = getResponse().getWriter();
			//加载文件类型
			fileTypeList = sysFileTypeService.findAll(SysFileType.class);
			out.print(new Gson().toJson(fileTypeList));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 打开添加论文页面
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
	 * 打开修改论文页面
	 * 
	 * @return
	 */
	public String openEdit() {
		try {
			if (thisStuId != null && thisYear != null) {
				
				if ( thisId != null){
					model = studentPaperService.findById(thisId);
				}else{
					model = studentPaperService.findByStuIdAndYear(thisStuId, thisYear,"");
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
	 * 上传文件
	 * @return
	 */
	public void uploadFile() {
		
		UploadFileResponse<StudentPaper> responseList = new UploadFileResponse<StudentPaper>(); 
		try {
			PrintWriter out=getResponse().getWriter();
		
			List<String> path = upload();
			if (path != null && thisYear != null&&thisFileType!=null) {
				String loginName = (String) getSession().getAttribute(
						SystemContext.LOGINNAME);
				ListStudent student = sysStudentService.findByStuNo(loginName);
				AllotGuide allotGuide = allotGuideService.findByStuIdAndYear(
						student.getStuId(), thisYear);
				SysFileType sysFileType = new SysFileType();
				StudentPaper studentPaper = new StudentPaper();
				
				studentPaper.setStuId(student.getStuId());
				studentPaper.setTeacherId(allotGuide.getTeacherId());
				studentPaper.setYear(thisYear);
				for(int i = 0;i< path.size();i++){
				  String fileName = uploadFileName.get(i);
				  studentPaper.setFileSize((int) upload.get(i).length());
				  studentPaper.setPath(path.get(i));
				  studentPaper.setFileType(thisFileType);
				  studentPaper.setPaperName(fileName);
				  studentPaper = studentPaperService.add(studentPaper);
				
				  responseList.getData().add(studentPaper);
					responseList.setCode(0);
				if (studentPaper.getPaperId() == null) {
					responseList.setCode(1);
				}
				}
			}else{
				responseList.setCode(1);
			}
			out.print(new Gson().toJson(responseList));
			out.flush();
			out.close();
		} catch (Exception e) {
			handle = HANDLER;
			e.printStackTrace();
		}

	}

	/**
	 * 上传论文
	 * 
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public List<String> upload() {
	
		List<String>  filePathList = null;
		if (upload != null) {
			filePathList = new ArrayList<String>();
			for(int i = 0;i<upload.size();i++){
			String targetFileName = uploadFileName.get(i).substring(uploadFileName.get(i).lastIndexOf(".")); // 文件后缀
			// 得到文件后缀判断文件类型
			String name = uploadFileName.get(i).substring(0,uploadFileName.get(i).lastIndexOf(".")); // 文件名
			
			// 文件名组装：UUID.后缀
			targetFileName = UidUtils.UID() + "_" + name + targetFileName; // 上传的文件
			// 1-保存附件；
			
			 File file = new File(ServletActionContext.getServletContext().getRealPath(File.separator+"upload"));
			 
			 if (!file.exists() && !file.isDirectory()) {
				 file.mkdir();
				}
			String targetDirectory = ServletActionContext.getServletContext()
					.getRealPath(File.separator+"upload"); // 文件的绝对路径
			
			File target = new File(targetDirectory, targetFileName);
		
			try {
				FileUtils.copyFile(upload.get(i), target);
			
				filePathList.add(File.separator+"upload"+File.separator+ targetFileName);
			} catch (IOException e) {
				System.out.println("上传出错：" + e);
				return null;
			}
			}
		} 
		return filePathList;
	}
/**
 * 
 * @return
 * @throws FileNotFoundException
 */
	
	  public String downFile( ) throws FileNotFoundException{

	  		model = studentPaperService.findById(thisId);

	  		fileName=model.getPaperName();

		  	inputStream=new FileInputStream(ServletActionContext.getServletContext().getRealPath(model.getPath()));

		  	logger.info("下载文件："+inputStream);

	  		return "download";
	   }
	/**
	 * 下载单个文件
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 * @throws IllegalStateException
	 * @throws IOException
	 */
   	public String downLoad() throws UnsupportedEncodingException{
   		
   		savePath = java.net.URLDecoder.decode(model.getPath(),"UTF-8");
   		String name = java.net.URLDecoder.decode(model.getPaperName(),"UTF-8");
   		ServletOutputStream ouputStream = null;
   		InputStream inputStream = null;
   		try {
   		    //取得绝对路径
			// 文件的绝对路径
   			String path = ServletActionContext.getServletContext().getRealPath(savePath);
   	        //下载的文件名
	   	    byte[] bytes = name.getBytes();
	   	    
	   	    String fileName = new String(bytes,"ISO-8859-1");
	   	    File file = new File(path);
   			if(!file.exists()){
			    System.out.println("文件不存在！！！！！！！！！！！！！！！");
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
			e.printStackTrace();
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
	/**
	 * 删除论文信息
	 * 
	 * @return
	 */
	public void del() {
		logger.info("删除论文信息");
		boolean isdel = false;
		try {
			PrintWriter out = getResponse().getWriter();
			if (thisId != null) {
				studentPaperService.del(thisId);
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


	public Result<StudentPaper> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<StudentPaper> pageResult) {
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

	public SysStudent getSysStudent() {
		return sysStudent;
	}

	public void setSysStudent(SysStudent sysStudent) {
		this.sysStudent = sysStudent;
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

	public List<ListTeacher> getSysTeacherList() {
		return sysTeacherList;
	}

	public void setSysTeacherList(List<ListTeacher> sysTeacherList) {
		this.sysTeacherList = sysTeacherList;
	}

	public IssueInfo getIssueInfo() {
		return issueInfo;
	}

	public void setIssueInfo(IssueInfo issueInfo) {
		this.issueInfo = issueInfo;
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

	public List<ListPaper> getStudentPaperList() {
		return studentPaperList;
	}

	public void setStudentPaperList(List<ListPaper> studentPaperList) {
		this.studentPaperList = studentPaperList;
	}

	public List<File> getUpload() {
		return upload;
	}

	public void setUpload(List<File> upload) {
		this.upload = upload;
	}

	public List<String> getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public List<String> getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(List<String> uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getThisFileType() {
		return thisFileType;
	}

	public void setThisFileType(String thisFileType) {
		this.thisFileType = thisFileType;
	}

	public SysFileType getSysFileType() {
		return sysFileType;
	}

	public void setSysFileType(SysFileType sysFileType) {
		this.sysFileType = sysFileType;
	}

	public List<SysFileType> getFileTypeList() {
		return fileTypeList;
	}

	public void setFileTypeList(List<SysFileType> fileTypeList) {
		this.fileTypeList = fileTypeList;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}



}
