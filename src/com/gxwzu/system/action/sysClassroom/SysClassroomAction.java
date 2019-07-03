package com.gxwzu.system.action.sysClassroom;

import java.io.PrintWriter;
import java.util.List;

import org.apache.commons.logging.Log;

import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.system.model.sysClassroom.SysClassroom;
import com.gxwzu.system.service.sysClassroom.ISysClassroomService;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import javassist.SerialVersionUID;

/**
 * 教室管理
 * @author 韦东连
 *
 */
public class SysClassroomAction extends BaseAction implements Preparable,ModelDriven{

	private static final long SerialVersionUID = 4916412819354298067L;
	protected final Log logger = LogFactory.getLog(getClass());
	
	/*****************************对象实例化**************************************************/
	@Override
	public Object getModel() {
		return model;
	}

	@Override
	public void prepare() throws Exception {
		if(null == model){
			model = new SysClassroom();
		}
	}

	
	
	/****************************** 注入Service****************************************************/
	@Autowired
	private ISysClassroomService sysClassroomService;
	
	/************************************** 声明参数********************************************/
	private Result<SysClassroom> pageResult;//分页
	private Integer id;
	private Integer thisId;
	private String mark;
	private SysClassroom model;
	
	/**************************************方法类************************************************/
	@Override
	public String execute() throws Exception{
		return SUCCESS;
		}
	
	/**
	 * 列表查询
	 * @return
	 *
	 */
	public String list(){
		logger.info("显示教室"+model.getClassroomName());
		try{
			pageResult = sysClassroomService.find(model,getPage(),getRow());
			logger.info("显示教室2"+model.getClassroomName());
    		footer = PageUtil.pageFooter(pageResult, getRequest());
		}catch(Exception e){
			e.printStackTrace();
		}
		return SUCCESS;
	}
/**
 * 添加教室
 * @return
 */
    public String add(){
    	try {
			logger.info("添加教室"+model);
			model = sysClassroomService.add(model);
			mark = "1";
		} catch (Exception e) {
			e.printStackTrace();
			setMark("0");
		}
		return list();
    }

    /**
     * 打开添加教室界面
     * @return
     */
    public String openAdd(){
    	logger.info("##打开添加教室");
		return SUCCESS;
    }
    /**
     * 打开修改教室界面
     * @return
     */
    public String openEdit() {
		try {
			logger.info("打开教师修改页面");
			model = sysClassroomService.findById(thisId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
    /**
     * 修改
     * @return
     */
    public String edit(){
    	logger.info("修改教室");
    	try {
			sysClassroomService.edit(model);
			setMark("1");
		} catch (Exception e) {
			e.printStackTrace();
			setMark("0");
		}
		return list();
    }
    /**
     * 删除
     * @return
     */
    public void del(){
    	logger.info("删除教室信息"+model.getId());
    	boolean isdel = false;
    	try {
			PrintWriter out = getResponse().getWriter();
			if(thisId!=null){
				sysClassroomService.del(thisId);
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
     * 检查教室名称是否存在
     * @return
     */
    public void checkName()throws Exception{
    	logger.info("检查教室是否存在");
    	try {
			boolean idTrue = true;
			PrintWriter out = getResponse().getWriter();
			List<SysClassroom> lists= sysClassroomService.findByExample(model);
			if(null!=lists && lists.size()>0){
				idTrue = false;
			}
			out.print(idTrue);
			out.flush();
			out.close();
		} catch (Exception e) {
             logger.info(e+"检查教室出错");
		}
    	
    }
	public Result<SysClassroom> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<SysClassroom> pageResult) {
		this.pageResult = pageResult;
	}

	public ISysClassroomService getSysClassroomService() {
		return sysClassroomService;
	}

	public void setSysClassroomService(ISysClassroomService sysClassroomService) {
		this.sysClassroomService = sysClassroomService;
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

	public Log getLogger() {
		return logger;
	}

	public void setModel(SysClassroom model) {
		this.model = model;
	}

	public static long getSerialversionuid() {
		return SerialVersionUID;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	}
