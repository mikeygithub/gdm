package com.gxwzu.system.action.sysDirections;

import java.io.PrintWriter;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.system.model.sysDirections.SysDirections;
import com.gxwzu.system.service.sysDirections.ISysDirectionsService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 
 * @author wdl
 *@data 2017.08.05
 */
@SuppressWarnings("serial")
public class SysDirectionsAction extends BaseAction implements ModelDriven<SysDirections>{
	
	private static final long serialVersionUID = 3400581425620304125L;
	protected final Log logger = LogFactory.getLog(getClass());
	/*********************************实例化对象****************************************/
	
	@Override
	public SysDirections getModel() {
		if(model == null){
			model = new SysDirections();
		}
		return model;
	}

	/*********************** 注入Service ******************************/
	@Autowired
	private ISysDirectionsService sysDirectionsService;
	/*********************** 声明参数 ******************************/
	private Result<SysDirections> pageResult;//分页
	
	private Integer id;
	private Integer thisId;
	private String mark;
	private SysDirections model;
	/************************** 方法类 **************************/
	@Override
	public String execute() throws Exception{
		return SUCCESS;
		
	}
	
	/**
	 * 研究方向列表显示
	 * @return
	 * @author 韦东连
	 * @data 2017.08.05
	 */
	public String list(){
		logger.info("拿到研究方向名字？"+model.getDirectionsName());
		try {
			pageResult = sysDirectionsService.find(model, getPage(), getRow());
			footer = PageUtil.pageFooter(pageResult, getRequest());
			setMark("1");
		} catch (Exception e) {
            e.printStackTrace();
            setMark("0");
		}
		return SUCCESS;
	}
	
	/**
	 * 添加研究方向
	 * @return
	 */
	public String add(){
		try {
			logger.info("添加研究方向"+model);
			model = sysDirectionsService.add(model);
			mark = "1";
		} catch (Exception e) {
            e.printStackTrace();
            setMark("0");
		}
		return list();
	}
	/**
	 * 打开添加研究方向界面
	 * @return
	 */
	public String openAdd(){
		logger.info("##打开添加研究方向");
		return SUCCESS;
	}
	/**
	 * 打开修改研究方向界面
	 * @return
	 */
	public String openEdit(){
		try {
			logger.info("打开研究方向修改界面");
			model = sysDirectionsService.findById(thisId);
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
		logger.info("修改教研室");
		try {
			sysDirectionsService.edit(model);
			mark = "1";
			System.out.println(mark+"**********mark***********");
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
		logger.info("删除教研室");
		boolean isdel = false;
		try {
			PrintWriter out = getResponse().getWriter();
			if(thisId!=null){
				sysDirectionsService.del(thisId);
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
	 * 检查研究方向名称是否存在
	 * @return
	 */
	public void checkName()throws Exception{
		logger.info("检查研究方向是否存在");
		try {
			boolean idTrue = true;
			PrintWriter out = getResponse().getWriter();
			List<SysDirections> lists = sysDirectionsService.findByExample(model);
			
			if(null!=lists && lists.size()>0){
				idTrue = false;
			}
			out.print(idTrue);
			out.flush();
			out.close();
		} catch (Exception e) {
            logger.info("检查研究方向出错");
		}
		
	}
	/************************** getter/setter方法 **************************/
	public ISysDirectionsService getSysDirectionsService() {
		return sysDirectionsService;
	}
	public void setSysDirectionsService(ISysDirectionsService sysDirectionsService) {
		this.sysDirectionsService = sysDirectionsService;
	}
	public Result<SysDirections> getPageResult() {
		return pageResult;
	}
	public void setPageResult(Result<SysDirections> pageResult) {
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Log getLogger() {
		return logger;
	}
	public void setModel(SysDirections model) {
		this.model = model;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
}
