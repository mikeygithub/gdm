package com.gxwzu.business.service.allotGuide.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.allotGuide.IAllotGuideDao;
import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.guideCount.GuideCount;
import com.gxwzu.business.model.issueInfo.IssueInfo;
import com.gxwzu.business.service.allotGuide.IAllotGuideService;
import com.gxwzu.business.service.guideCount.IGuideCountSerivce;
import com.gxwzu.business.service.teacherDirections.ITeacherDirectionsService;
import com.gxwzu.business.service.teacherMajor.ITeacherMajorService;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListAllotGuide;
import com.gxwzu.sysVO.ListStudentAllotGuide;
import com.gxwzu.sysVO.ListTeacherGuideCount;
import com.gxwzu.system.dao.sysStudent.ISysStudentDao;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.model.sysTeacher.SysTeacher;
import com.gxwzu.system.service.sysStudent.ISysStudentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;

@Service("allotGuideService")
public class AllotGuideServiceImpl extends BaseServiceImpl<AllotGuide> implements IAllotGuideService{

	@Autowired
	private IAllotGuideDao allotGuideDao;
	@Autowired
	private ISysStudentDao sysStudentDao;
	@Autowired
	private IGuideCountSerivce guideCountService;
	@Autowired
	private ISysStudentService sysStudentService;             //学生接口
	@Autowired
	private ISysTeacherService sysTeacherService;             //教师接口
	@Autowired
	private ITeacherMajorService teacherMajorService;          //老师可选专业接口
	@Autowired
	private ITeacherDirectionsService teacherDirectionsService;   //老师研究方向接口
	
	@Override
	public BaseDao<AllotGuide> getDao() {
		return this.allotGuideDao;
	}

	/**
	 * 指导老师分配显示列表
	 * @return
	 */
	@Override
	public Result<AllotGuide> find(AllotGuide model, int page, int row) {
		return allotGuideDao.find(model, page, row);
	}
	
	/**
	 * 师生双选添加到数据库
	 */
	@Override
	public AllotGuide add(AllotGuide model) {
	
		 model= allotGuideDao.save(model);
		 
		GuideCount gCount = new GuideCount();
		gCount.setGuideTeachId(model.getTeacherId());
		gCount.setYear(model.getYear());
		List<GuideCount> gList= guideCountService.findByExample(gCount);
		if(model.getId()!=null&&gList!=null&&gList.size()!=0){
			gCount  = gList.get(0);
			gCount.setAlreadyStuNum(gCount.getAlreadyStuNum()+1);
			guideCountService.update(gCount);
		}
		return model;
	}

	/**
	 * 遍历查询学生名称和老师名称通过指导老师列表
	 * @author 何金燕
	 * @date 2017.7.15
	 */
	@Override
	public List<ListAllotGuide> findByLoginName(AllotGuide model) {
		 List<ListAllotGuide> newList =  null;
	     List<AllotGuide> oldList = allotGuideDao.findByLoginName(model);
	     if(oldList!=null&&oldList.size()!=0){
	    	 newList = new ArrayList<ListAllotGuide>();
	     }
		 for(AllotGuide aGuide:oldList){
			 ListAllotGuide listAolltGuide =  new ListAllotGuide();
			SysStudent student =   sysStudentService.findById(aGuide.getStuId());
			SysTeacher teacher =   sysTeacherService.findById(aGuide.getTeacherId());
			listAolltGuide.setAllotGuide(aGuide,student,teacher);
			newList.add(listAolltGuide);
		 }
		 return newList;
	}

	@Override
	public void del(Integer id) {
	    AllotGuide model  = allotGuideDao.findById(id);
	    GuideCount gCount = new GuideCount();
		gCount.setGuideTeachId(model.getTeacherId());
		gCount.setYear(model.getYear());
		List<GuideCount> gList= guideCountService.findByExample(gCount);
		if(gList!=null&&gList.size()!=0){
			gCount  = gList.get(0);
			if(gCount.getAlreadyStuNum()>0)
			gCount.setAlreadyStuNum(gCount.getAlreadyStuNum()-1);
			guideCountService.update(gCount);
		}
	    allotGuideDao.remove(model);
	}

	
	@Override
	public ListAllotGuide findByStuId(Integer stuId) {
	  AllotGuide   allotGuide =   allotGuideDao.findByStuId(stuId);
	  ListAllotGuide listAolltGuide = null ;
		 if(allotGuide!=null){
			 listAolltGuide =  new ListAllotGuide();
			SysStudent student =   sysStudentService.findById(allotGuide.getStuId());
			SysTeacher teacher =   sysTeacherService.findById(allotGuide.getTeacherId());
			listAolltGuide.setAllotGuide(allotGuide,student,teacher);
		 }
		return listAolltGuide;
	}
	
	@Override
	public Result<ListStudentAllotGuide> findStudentByDeptAndMajor(ListStudentAllotGuide model, List<Integer> majorIds, int page,
			int size) {
		Result<ListStudentAllotGuide>  newResult = new Result<ListStudentAllotGuide>();
		List<ListStudentAllotGuide> newList = new ArrayList<ListStudentAllotGuide>();
		
		Result<Object> oldList = allotGuideDao.findStudentByDeptAndMajor(model,majorIds,page,size);
	     
	     if(oldList!=null&&oldList.getData()!=null&&oldList.getData().size()!=0){
	    
		 for(Object object:oldList.getData()){
			 Object[] o= (Object[]) object;
			  newList.add(new ListStudentAllotGuide(o));
		 }
	     }
	      newResult.setData(newList);
		  newResult.setOffset(oldList.getOffset());
		  newResult.setPage(oldList.getPage());
		  newResult.setSize(oldList.getSize());
		  newResult.setTotal(oldList.getTotal());
		  newResult.setTotalPage(oldList.getTotalPage());
		 return newResult;
	}

	@Override
	public List<AllotGuide> findByExample(AllotGuide model) {
		return allotGuideDao.findByExample(model);
	}

	@Override
	public AllotGuide findByStuIdAndYear(Integer stuId, Integer thisYear) {
		AllotGuide model = new AllotGuide();
		model.setStuId(stuId);
		model.setYear(thisYear);
		List<AllotGuide> list= findByExample(model);
		if(list==null||list.size()<=0)
			return null;
		else{
			return list.get(0);
		}
	}

	
	
	@Override
	public List<ListStudentAllotGuide> findStudentsByTeacherIdAndYear(
			Integer teacherId,Integer year) {
		 List<ListStudentAllotGuide> newList =  null;
		 ListStudentAllotGuide model = new ListStudentAllotGuide();
			model.setTeacherId(teacherId);
			model.setYear(year);
			List<Object> oldList= allotGuideDao.findStudentsByExample(model);
	     if(oldList!=null&&oldList.size()!=0){
	    	 newList = new ArrayList<ListStudentAllotGuide>();
			
	    	 for(Object object:oldList){
				 Object[] o= (Object[]) object;
				  newList.add(new ListStudentAllotGuide(o));
		     }
		}
		return newList;
	}

	@Override
	public Result<ListTeacherGuideCount> findTeacherList(
			ListTeacherGuideCount guideCount, List<Integer> majorIds, int page,
			int row) {
		
		Result<ListTeacherGuideCount>  newResult = new Result<ListTeacherGuideCount>();
		List<ListTeacherGuideCount> newList = new ArrayList<ListTeacherGuideCount>();
		
		
		Result<Object> oldList = allotGuideDao.findTeacherList(guideCount,majorIds,page,row);
	     
	     if(oldList!=null&&oldList.getData()!=null&&oldList.getData().size()!=0){
	    
		 for(Object object:oldList.getData()){
			 Object[] o= (Object[]) object;
			 ListTeacherGuideCount lAllotGuide = new ListTeacherGuideCount(o);
			 lAllotGuide.setTeacherMajorList(teacherMajorService.findByTeacherId(lAllotGuide.getTeacherId()));
			 lAllotGuide.setTeacherDirectionList(teacherDirectionsService.findByTeacherId(lAllotGuide.getTeacherId()));
			  newList.add(lAllotGuide);
		 }
	     }
	      newResult.setData(newList);
		  newResult.setOffset(oldList.getOffset());
		  newResult.setPage(oldList.getPage());
		  newResult.setSize(oldList.getSize());
		  newResult.setTotal(oldList.getTotal());
		  newResult.setTotalPage(oldList.getTotalPage());
		 return newResult;
	}
}
