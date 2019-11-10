package com.gxwzu.system.action.sysDuties;

import java.io.PrintWriter;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.system.model.sysDuties.SysDuties;
import com.gxwzu.system.model.sysTechnical.SysTechnical;
import com.gxwzu.system.service.sysDuties.ISysDutiesService;
import com.gxwzu.system.service.sysTechnical.ISysTechnicalService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 职务信息
 * @author 何金燕
 * @date 2017.9.21
 *
 */
public class SysDutiesAction extends BaseAction implements ModelDriven<SysDuties>{
	private static final long serialVersionUID = -1394746606619369685L;
	protected final Log logger = LogFactory.getLog(getClass());
	/*********************** 实例化ModelDriven ******************************/
	private SysDuties model =new SysDuties();

	@Override
	public SysDuties getModel() {
		return this.model;
	}
	public void setModel(SysDuties model) {
		this.model = model;
	}
	/*********************** 注入Service ******************************/
	@Autowired
	private ISysDutiesService sysDutiesService;
	
	/*********************** 声明参数 ******************************/
	private Result<SysDuties> pageResult;// 分页
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
				logger.info("拿到值了吗 ？"+model.getDutiesName());
				pageResult = sysDutiesService.find(model,getPage(),getRow());
				footer = PageUtil.pageFooter(pageResult, getRequest());
			}catch(Exception e){
				e.printStackTrace();
			}
			return SUCCESS;
		} 
	
	public String openAdd() {
		logger.info("## 打开添加务");
		return SUCCESS;
	}
	/**
	 * 添加职务
	 * @return
	 */
	public String add() {
		try {
				logger.info("添加职务"+model);
				model = sysDutiesService.add(model);
				model =new SysDuties();
				mark = "1";
		} catch (Exception e) {
			e.printStackTrace();
			mark = "0";
		}
		return list();
	}
	/**
	 * 修改职务
	 * @return
	 */
	public String openEdit() {
		try {
			logger.info("打开职务修改页面");
			model = sysDutiesService.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list();
	}
	
	public String edit() {
		logger.info("修改职务信息");
		try {
			sysDutiesService.edit(model);
			setMark("1");
		} catch (Exception e) {
			e.printStackTrace();
			 setMark("0");
		}
		return list();
	}
	/**
	 * 删除职务
	 * @return
	 */
	public String del() {
		logger.info("删除职务信息");
		boolean isdel = false;
		try {
			PrintWriter out=getResponse().getWriter();
			if(thisId!=null){
				sysDutiesService.del(thisId);
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
	 * 检查职务是否存在
	 * @author 何金燕
	 * @return
	 */
	public void checkName()throws Exception{
		logger.info("检查职务是否存在");
		try {
			boolean idTrue = true;
			PrintWriter out = getResponse().getWriter();
			List<SysDuties> lists = sysDutiesService.findByExample(model);
			
			if(null!=lists && lists.size()>0){
				idTrue = false;
			}
			out.print(idTrue);
			out.flush();
			out.close();
		} catch (Exception e) {
            logger.info("检查职务出错");
		}
	}
	
	
	
	
	
	/***********************getter and setter 方法*************************************/
	public ISysDutiesService getSysDutiesService() {
		return sysDutiesService;
	}
	public void setSysDutiesService(ISysDutiesService sysDutiesService) {
		this.sysDutiesService = sysDutiesService;
	}
	public Result<SysDuties> getPageResult() {
		return pageResult;
	}
	public void setPageResult(Result<SysDuties> pageResult) {
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
