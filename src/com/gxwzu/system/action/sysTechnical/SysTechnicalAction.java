package com.gxwzu.system.action.sysTechnical;

import java.io.PrintWriter;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.system.model.sysTechnical.SysTechnical;
import com.gxwzu.system.service.sysTechnical.ISysTechnicalService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 职称基本信息
 * @author 俸捷
 *
 */
public class SysTechnicalAction extends BaseAction implements ModelDriven<SysTechnical>{
	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());
	
	/*********************** 实例化ModelDriven ******************************/
	private SysTechnical model = new SysTechnical();
	
	@Override
	public SysTechnical getModel() {
		return model;
	}

	public void setModel(SysTechnical model){
		this.model = model;
	}
	
	/*********************** 注入Service ******************************/
	@Autowired
	private ISysTechnicalService sysTechnicalService;
	
	/*********************** 声明参数 ******************************/
	private Result<SysTechnical> pageResult;// 分页
	private Integer id;
	private Integer thisId;
	private String mark;
	/************************** 方法类 **************************/
	@Override
	public String execute() throws Exception{
		return SUCCESS;
	}
	
	
	public String list(){
		try{
			logger.info("拿到值了吗 ？"+model.getTechnicalName());
			pageResult = sysTechnicalService.find(model,getPage(),getRow());
			footer = PageUtil.pageFooter(pageResult, getRequest());
		}catch(Exception e){
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String add() {
		try {
				logger.info("添加职称"+model);
				model = sysTechnicalService.add(model);
				mark = "1";
		} catch (Exception e) {
			e.printStackTrace();
			setMark("0");
		}
		return list();
	}
	
	
	public String openAdd() {
		logger.info("## 打开添加职称");
		return SUCCESS;
	}
	
	public String openEdit() {
		try {
			logger.info("打开职称修改页面");
			model = sysTechnicalService.findById(thisId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list();
	}
	
	public String edit() {
		logger.info("修改职称信息");
		try {
			sysTechnicalService.edit(model);
			setMark("1");
		} catch (Exception e) {
			e.printStackTrace();
			 setMark("0");
		}
		return list();
	}
	
	public void del() {
		logger.info("删除职称信息");
		boolean isdel = false;
		try {
			PrintWriter out=getResponse().getWriter();
			if(thisId!=null){
				sysTechnicalService.del(thisId);
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
	 * 检查职称是否存在
	 * @author wdl
	 * @return
	 */
	public void checkName()throws Exception{
		logger.info("检查职称是否存在");
		try {
			boolean idTrue = true;
			PrintWriter out = getResponse().getWriter();
			List<SysTechnical> lists = sysTechnicalService.findByExample(model);
			
			if(null!=lists && lists.size()>0){
				idTrue = false;
			}
			out.print(idTrue);
			out.flush();
			out.close();
		} catch (Exception e) {
            logger.info("检查职称出错");
		}
		
	}
	
	/*************************getter/setter方法**********************************/
	public ISysTechnicalService getSysTechnicalService() {
		return sysTechnicalService;
	}

	public void setSysTechnicalService(ISysTechnicalService sysTechnicalService) {
		this.sysTechnicalService = sysTechnicalService;
	}

	public Result<SysTechnical> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<SysTechnical> pageResult) {
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Log getLogger() {
		return logger;
	}
	
	
	
	
	
}
