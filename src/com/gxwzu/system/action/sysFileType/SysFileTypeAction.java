package com.gxwzu.system.action.sysFileType;

import java.io.PrintWriter;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.system.model.sysFileType.SysFileType;
import com.gxwzu.system.service.sysFileType.ISysFileTypeService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 文件类型信息
 * @author 黎艺侠
 * @date 2017.9.30
 *
 */
public class SysFileTypeAction extends BaseAction implements ModelDriven<SysFileType>{
	private static final long serialVersionUID = -1394746606619369685L;
	protected final Log logger = LogFactory.getLog(getClass());
	/*********************** 实例化ModelDriven ******************************/
	private SysFileType model =new SysFileType();

	@Override
	public SysFileType getModel() {
		return this.model;
	}
	public void setModel(SysFileType model) {
		this.model = model;
	}
	/*********************** 注入Service ******************************/
	@Autowired
	private ISysFileTypeService sysFileTypeService;
	
	/*********************** 声明参数 ******************************/
	private Result<SysFileType> pageResult;// 分页
	private Integer id;
	private Integer thisId;
	private String mark;
	/************************** 方法类 **************************/
	@Override
	public String execute() throws Exception{
		return SUCCESS;
	}
	/**
	 * 列表查询
	 */
	public String list(){
			try{
				logger.info("拿到值了吗 ？"+model.getFileName());
				pageResult = sysFileTypeService.find(model,getPage(),getRow());
				footer = PageUtil.pageFooter(pageResult, getRequest());
			}catch(Exception e){
				e.printStackTrace();
			}
			return SUCCESS;
		} 
	
	
	/**
	 * 打开添加文件类型
	 * @return
	 */
	public String openAdd() {
		logger.info("## 打开添加");
		return SUCCESS;
	}
	/**
	 * 添加职务
	 * @return
	 */
	public String add() {
		try {
				logger.info("添加文件类型"+model);
				model = sysFileTypeService.add(model);
				model =new SysFileType();
				/*mark = "1";*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list();
	}
	/**
	 * 修改文件类型
	 * @return
	 */
	public String openEdit() {
		try {
			logger.info("打开文件类型修改页面");
			model = sysFileTypeService.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list();
	}
	
	public String edit() {
		logger.info("修改文件类型信息");
		try {
			sysFileTypeService.edit(model);
			setMark("1");
		} catch (Exception e) {
			e.printStackTrace();
			 setMark("0");
		}
		return list();
	}
	/**
	 * 删除文件类型
	 * @return
	 */
	public String del() {
		logger.info("删除文件类型信息");
		boolean isdel = false;
		try {
			PrintWriter out=getResponse().getWriter();
			if(thisId!=null){
				sysFileTypeService.del(thisId);
			 isdel= true;
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
	 * 检查文件类型是否存在
	 * @return
	 */
	public void checkName()throws Exception{
		logger.info("检查文件类型是否存在");
		try {
			boolean idTrue = true;
			PrintWriter out = getResponse().getWriter();
			List<SysFileType> lists = sysFileTypeService.findByExample(model);
			
			if(null!=lists && lists.size()>0){
				idTrue = false;
			}
			out.print(idTrue);
			out.flush();
			out.close();
		} catch (Exception e) {
            logger.info("检查文件类型出错");
		}
	}
	
	

	/***********************getter and setter 方法*************************************/
	public ISysFileTypeService getSysFileTypeService() {
		return sysFileTypeService;
	}
	public void setSysFileTypeService(ISysFileTypeService sysFileTypeService) {
		this.sysFileTypeService = sysFileTypeService;
	}
	public Result<SysFileType> getPageResult() {
		return pageResult;
	}
	public void setPageResult(Result<SysFileType> pageResult) {
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
	
	
	
	
	
	
	
	

}
