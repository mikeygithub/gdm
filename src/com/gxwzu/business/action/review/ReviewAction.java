package com.gxwzu.business.action.review;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.issueInfo.IssueInfo;
import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.review.Review;
import com.gxwzu.business.model.review.ReviewScore;
import com.gxwzu.business.model.score.ScoreItem;
import com.gxwzu.business.model.score.ScoreItemGroup;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.issueInfo.IIssueInfoSerivce;
import com.gxwzu.business.service.plan.IPlanProgressSerivce;
import com.gxwzu.business.service.plan.IPlanYearSerivce;
import com.gxwzu.business.service.review.IReviewScoreSerivce;
import com.gxwzu.business.service.review.IReviewSerivce;
import com.gxwzu.business.service.score.IScoreItemGroupSerivce;
import com.gxwzu.business.service.score.IScoreItemSerivce;
import com.gxwzu.core.context.SystemContext;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.PageUtil;
import com.gxwzu.core.util.WordUtils;
import com.gxwzu.core.web.action.BaseAction;
import com.gxwzu.sysVO.ListAllotGuide;
import com.gxwzu.sysVO.ListReview;
import com.gxwzu.sysVO.ListScoreItemGroup;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.system.model.sysClass.SysClass;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.service.sysClass.ISysClassService;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysMajor.ISysMajorService;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 评阅审查
 * 
 * @author 何志明
 * @date 2017.7.21
 */
public class ReviewAction extends BaseAction implements ModelDriven<Review> {

	private static final long serialVersionUID = -3343014949806289390L;
	protected final Log logger = LogFactory.getLog(getClass());

	/*********************** 实例化ModelDriven ******************************/
	private Review model = new Review();

	@Override
	public Review getModel() {
		return model;
	}

	public void setModel(Review model) {
		this.model = model;
	}

	/*********************** Service接口注入 ***************************/
	@Autowired
	private IReviewSerivce reviewSerivce; // 评阅审查接口
	@Autowired
	private IReviewScoreSerivce reviewScoreSerivce; // 评阅审查评分接口
	@Autowired
	private IScoreItemSerivce scoreItemSerivce; // 评分项目接口
	@Autowired
	private IScoreItemGroupSerivce scoreItemGroupSerivce; // 评分项目分组接口

	@Autowired
	private ISysTeacherService sysTeacherService; // 老师接口
	@Autowired
	private ISysStudentService sysStudentService; // 学生接口
	@Autowired
	private IAllotGuideService allotGuideService; // 指导分配接口
	@Autowired
	private IPlanYearSerivce planYearSerivce; // 年度计划接口
	@Autowired
	private IIssueInfoSerivce issueInfoSerivce; // 课题接口
	@Autowired
	private IPlanProgressSerivce planProgressSerivce; // 进度计划接口
	/*********************** 实体 ***************************/
	private PlanYear planYear; // 年度计划实体
	private SysTeacher teacher = new SysTeacher(); // 老师实体
	private ListStudent student = new ListStudent(); // 学生实体
	private IssueInfo issueInfo = new IssueInfo(); // 课题列表实体
	private ListReview review = new ListReview(); // 评语审查实体
	ScoreItemGroup scoreItemGroup = new ScoreItemGroup(); // 评分规则
	private PlanProgress planProgress = new PlanProgress();//进度计划实体
	private ListTeacher lTeacher = new ListTeacher(); // 老师实体
	/******************** 集合变量声明 *********************/
	private Result<ListReview> pageResult; // 评阅审查分页
	private List<ListScoreItemGroup> listScoreItemGroups = new ArrayList<ListScoreItemGroup>(); // 评分项目分组列表

	private List<ScoreItem> scoreItems = new ArrayList<ScoreItem>(); // 评分项目列表
	/************************** 基础变量声明 **************/
	private Integer thisId;
	private String mark;
	private String scoreIds;// 评分项目id-分值 例如1-10,4-34
	private String  thisReviewType; // 评阅审查表类型：00 指导老师评阅  01评阅人评阅  02指导老师审查 
	private Integer thisYear;
	private Integer thisStuId; //学生Id
	
	
	private String templetePath;  //指导老师评阅表路径
	private String templeteReadPath; //评阅老师评阅表路径
	private String templeteCheckPath; //指导老师评阅表路径
	
	private String fileName;
	private String filePath;
	private String flag;

	/************************** 方法类 **************************************************************************************/
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	/**
	 * 个人分页查询评阅审查信息
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

			pageResult = reviewSerivce.find(model, getPage(), getRow());
			footer = PageUtil.pageFooter(pageResult, getRequest());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}

	
	/**
	 * 学生查询课题信息
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
		return list();
	}

	/**
	 * 添加信息到数据库
	 * 
	 * @return
	 */
	public String add() {
		try {
			if (thisStuId != null && thisYear != null&&thisReviewType!=null) {
				model.setYear(thisYear);
				// 查询指导老师信息
				AllotGuide aGuide = allotGuideService.findByStuIdAndYear(thisStuId, thisYear);
			
				//添加信息
				model.setTeacherId(aGuide.getTeacherId());
				model.setStuId(thisStuId);
				model.setYear(thisYear);
				model.setReviewType(thisReviewType);
				model = reviewSerivce.save(model);
				
				//添加分数
				if (model.getReviewId() != null && scoreIds != null) {
					Float totalScore = addReviewScore(spiltScore(scoreIds),model);
					
					if (totalScore != null) {
						model.setTotalScore(totalScore);
					     reviewSerivce.update(model);
					}
				}
				//题目
				issueInfo = issueInfoSerivce.findByStuIdAndYear(thisStuId, thisYear);
				//评阅信息
				if (model.getReviewId() != null) {
					review = reviewSerivce.findViewModelById(model.getReviewId());
				}
				// 查询分值规则
				listScoreItemGroups = scoreItemGroupSerivce.findByGroupType(thisReviewType);
				
				mark = "1";
			} else {
				mark = "0";
			}
		} catch (Exception e) {
			e.printStackTrace();
			mark = "0";
		}
		return openAdd();
	}

	/**
	 * 添加评阅分数到数据库 (内部调用)
	 * 
	 * @param scoreMap
	 *            评分项目-分值集合
	 * @param model
	 */
	private Float addReviewScore(Map<Integer, Float> scoreMap, Review model) {
		float totalScore = 0;
		int weight  = 1 ; //权值
		try {
			//遍历评分 
			for (Iterator<Integer> key = scoreMap.keySet().iterator(); key.hasNext();weight++) {

				Integer scoreItemId = key.next();
				ReviewScore reviewScore = new ReviewScore();
				reviewScore = reviewScoreSerivce.findById(scoreItemId);

				if (reviewScore == null) {
					reviewScore = new ReviewScore();
					reviewScore.setReviewId(model.getReviewId());
					reviewScore.setScoreItemId(scoreItemId);
					reviewScore.setYear(model.getYear());
					reviewScore.setWeight(weight);
				}
				reviewScore.setScore(scoreMap.get(scoreItemId));
				reviewScoreSerivce.addOrEdit(reviewScore);
				totalScore += scoreMap.get(scoreItemId);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return totalScore;
	}

	/**
	 * 分割评分项目-分值(内部调用)
	 * 
	 * @return
	 */
	private Map<Integer, Float> spiltScore(String scoreIds) {
		Map<Integer, Float> scoreMap = new HashMap<Integer, Float>();
		String[] oneScore = scoreIds.split(",");
		for (String s : oneScore) {
			String[] twoScore = s.split("-");

			if (twoScore.length == 1) {
				Integer scoreItemId = Integer.parseInt(twoScore[0]);
				scoreMap.put(scoreItemId, (float) 0);
			}
			if (twoScore.length == 2) {
				Integer scoreItemId = Integer.parseInt(twoScore[0]);
				Float score = Float.parseFloat(twoScore[1]);
				scoreMap.put(scoreItemId, score);
			}
			if (twoScore.length == 3) {
				Float score = Float.parseFloat(twoScore[1]);
				Integer reviewScoreId = Integer.parseInt(twoScore[2]);
				scoreMap.put(reviewScoreId, score);
			}
		}
		return scoreMap;
	}


	/**
	 * 
	 * 打开添加评阅审查页面
	 * @return 学生信息  + 指导老师信息+ 评分规则
	 */
	public String openAdd() {
		String loginName = (String) getSession().getAttribute(
				SystemContext.LOGINNAME);
		String type = (String) getSession()
				.getAttribute(SystemContext.USERTYPE);
		/************************** 查询教研室信息 *********************************************/
		//查询 当前学生所属专业教研室  进度计划
		if(flag!=null&&"07".equals(flag)){
				if ("1".equals(type)) {
					student = sysStudentService.findByStuNo(loginName);		
			        planProgress=planProgressSerivce.findByStudMajoId(student.getMajorId(),flag);  
				}
				//查询 当前老师所属专业教研室 中的进度计划
				if ("2".equals(type)) {
					 lTeacher = sysTeacherService.findByTeacherNo(loginName);
					 planProgress=planProgressSerivce.findByTeacStaffroomId(lTeacher.getStaffroomId(),flag); 
				}
				Timestamp d = new Timestamp(System.currentTimeMillis()); 
				if(d.after(planProgress.getStartTime())){
					try {
						if (thisStuId!= null&&thisYear!=null&&thisReviewType!=null) {
							// 查询学生信息
							student = sysStudentService.findViewModelById(thisStuId);
							//查询课题信息
							issueInfo = issueInfoSerivce.findByStuIdAndYear(thisStuId, thisYear);
							// 查询指导老师信息
							AllotGuide aGuide = allotGuideService.findByStuIdAndYear(thisStuId, thisYear);
							teacher = sysTeacherService.findById(aGuide.getTeacherId());
							// 查询评分规则
							listScoreItemGroups = scoreItemGroupSerivce.findByGroupType(thisReviewType);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					return SUCCESS;
				}else{
				    return "view";
				}
	    }else{
	    	return SUCCESS;
	    }
	}
	
	/**
	 * 打开修改评阅审查页面
	 * @return 学生信息  + 指导老师信息+ 评分规则+ 评阅/审查信息
	 */
	public String openEdit() {
		String loginName = (String) getSession().getAttribute(SystemContext.LOGINNAME);
		String type = (String) getSession().getAttribute(SystemContext.USERTYPE);
		/************************** 查询教研室信息 *********************************************/
		//查询 当前学生所属专业教研室  进度计划
		if(flag!=null&&"07".equals(flag)){
				if ("1".equals(type)) {
					student = sysStudentService.findByStuNo(loginName);		
			        planProgress=planProgressSerivce.findByStudMajoId(student.getMajorId(),flag);  
				}
				//查询 当前老师所属专业教研室 中的进度计划
				if ("2".equals(type)) {
					 lTeacher = sysTeacherService.findByTeacherNo(loginName);
					 planProgress=planProgressSerivce.findByTeacStaffroomId(lTeacher.getStaffroomId(),flag); 
				}
				Timestamp d = new Timestamp(System.currentTimeMillis()); 
				if(planProgress!=null&&planProgress.getStartTime()!=null&&d.after(planProgress.getStartTime())){
					try {
						if (thisStuId!= null&&thisYear!=null&&thisId!=null&&thisReviewType!=null) {
							//查询评阅信息
							review = reviewSerivce.findViewModelById(thisId);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					return openAdd();
			   }else{
				    return "view";
				}
		}else{
	    	return SUCCESS;
	    }
	}
	
	

	/**
	 * 修改评阅审查信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String edit() {
		try {
			if (thisId != null) {
				Review mReview = reviewSerivce.findById(thisId);
				
				if (StringUtils.isNotEmpty(model.getReviewContent())) {
					mReview.setReviewContent(model.getReviewContent());
				}
				mReview.setReplyLink(model.getReplyLink());
				 reviewSerivce.update(mReview);  //更改信息
				//更改分数
				if (scoreIds != null) {
					Float totalScore = addReviewScore(spiltScore(scoreIds),
							mReview);
					if (totalScore != null) {
						mReview.setTotalScore(totalScore);
					       reviewSerivce.update(mReview);
					}
				}
				   review = reviewSerivce.findViewModelById(thisId);
				
				mark = "1";
			} else {
				mark = "0";
			}
		} catch (Exception e) {
			e.printStackTrace();
			mark = "0";
		}
		return list();
	}

	/**
	 * 导出评阅审查
	 * 
	 * @return
	 */
	public String outReview() {
		try {
			if (thisId != null) {
				ListReview	model = reviewSerivce.findViewModelById(thisId);
				student = sysStudentService.findViewModelById(model.getStuId());
				//查询课题信息
				issueInfo = issueInfoSerivce.findByStuIdAndYear(model.getStuId(), model.getYear());
				// 查询指导老师信息
				AllotGuide aGuide = allotGuideService.findByStuIdAndYear(model.getStuId(), model.getYear());
				teacher = sysTeacherService.findById(aGuide.getTeacherId());

			// ##################根据Word模板导出单个Word文档###################################################
			Map<String, String> map = new HashMap<String, String>();

			if (issueInfo != null) {
				map.put("iN", issueInfo.getIssueName());
			} else {
				map.put("iN", "");
			}
			
			map.put("dT", student.getDeptName());
			map.put("mR", student.getMajorName());
			map.put("tN", teacher.getTeacherName());
			map.put("sN", student.getStuName());
			map.put("tL", ""+model.getTotalScore());
		   List<ReviewScore> list = model.getReviewScoreList();
			for (int i = 0; i < list.size(); i++) {
				ReviewScore reviewScore = list.get(i);
				map.put("sc"+(i+1),""+reviewScore.getScore());
			}
			
			map.put("con", model.getReviewContent());
			if("00".equals(model.getReplyLink()) ){
				map.put("rL", "否");
			}else if("01".equals(model.getReplyLink()) ){
				map.put("rL", "是");
			}else{
				map.put("rL", "");
			}
			String path = "";
			String tableName="";
			// 评阅审查表类型：00 指导老师评阅  01评阅人评阅  02指导老师审查 
			if("00".equals(model.getReviewType())){
				path = getTempletePath();
				tableName = "梧州学院本科生毕业论文（设计）评阅表.doc";
			}else if("01".equals(model.getReviewType())){
				path = getTempleteReadPath();
				tableName = "梧州学院本科生毕业论文（设计）评阅表.doc";
			}else if("02".equals(model.getReviewType())){
            	 path = getTempleteCheckPath();
            	 tableName = "梧州学院本科生毕业论文（设计）规范审查表.doc";
			}
			WordUtils.exportWord(map, path, getFilePath());
			StringBuffer sBuffer = new StringBuffer(student.getClassName());
			sBuffer.append("-").append(student.getStuId()).append("-")
					.append(student.getStuName()).append("-")
					.append(tableName);
			fileName = sBuffer.toString();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "out";
	}

	/**
	 * 删除任务信息
	 * 
	 * @return
	 */
	public void del() {
		logger.info("删除任务信息");
		boolean isdel = false;
		try {
			PrintWriter out = getResponse().getWriter();
			if (thisId != null) {
				reviewSerivce.del(thisId);
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

	public Result<ListReview> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<ListReview> pageResult) {
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


	public ListStudent getStudent() {
		return student;
	}

	public void setStudent(ListStudent student) {
		this.student = student;
	}

	public String getTempletePath() {
		return ServletActionContext.getServletContext().getRealPath(
				templetePath);
	}


	public String getTempleteReadPath() {
		return ServletActionContext.getServletContext().getRealPath(
				templeteReadPath);
	}

	public void setTempleteReadPath(String templeteReadPath) {
		this.templeteReadPath = templeteReadPath;
	}

	public String getTempleteCheckPath() {
		return ServletActionContext.getServletContext().getRealPath(
				templeteCheckPath);
	}

	public void setTempleteCheckPath(String templeteCheckPath) {
		this.templeteCheckPath = templeteCheckPath;
	}

	public void setTempletePath(String templetePath) {
		this.templetePath = templetePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return ServletActionContext.getServletContext().getRealPath(filePath);
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public SysTeacher getTeacher() {
		return teacher;
	}

	public void setTeacher(SysTeacher teacher) {
		this.teacher = teacher;
	}

	public IssueInfo getIssueInfo() {
		return issueInfo;
	}

	public void setIssueInfo(IssueInfo issueInfo) {
		this.issueInfo = issueInfo;
	}

	public ListReview getReview() {
		return review;
	}

	public void setReview(ListReview review) {
		this.review = review;
	}

	public List<ListScoreItemGroup> getListScoreItemGroups() {
		return listScoreItemGroups;
	}

	public void setListScoreItemGroups(
			List<ListScoreItemGroup> listScoreItemGroups) {
		this.listScoreItemGroups = listScoreItemGroups;
	}

	public List<ScoreItem> getScoreItems() {
		return scoreItems;
	}

	public void setScoreItems(List<ScoreItem> scoreItems) {
		this.scoreItems = scoreItems;
	}

	public ScoreItemGroup getScoreItemGroup() {
		return scoreItemGroup;
	}

	public void setScoreItemGroup(ScoreItemGroup scoreItemGroup) {
		this.scoreItemGroup = scoreItemGroup;
	}

	public String getScoreIds() {
		return scoreIds;
	}

	public void setScoreIds(String scoreIds) {
		this.scoreIds = scoreIds;
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

	public String getThisReviewType() {
		return thisReviewType;
	}

	public void setThisReviewType(String thisReviewType) {
		this.thisReviewType = thisReviewType;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	
}
