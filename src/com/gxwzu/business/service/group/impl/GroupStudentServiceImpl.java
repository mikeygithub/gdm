package com.gxwzu.business.service.group.impl;

import java.util.ArrayList;
import java.util.List;

import com.gxwzu.core.context.SystemContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.group.IGroupStudentDao;
import com.gxwzu.business.model.group.GroupAllot;
import com.gxwzu.business.model.group.GroupStudent;
import com.gxwzu.business.service.group.IGroupAllotService;
import com.gxwzu.business.service.group.IGroupStudentService;
import com.gxwzu.business.service.group.IGroupTeacherService;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListGroupAllot;
import com.gxwzu.sysVO.ListGroupStudent;
import com.gxwzu.sysVO.ListGroupTeacher;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.system.service.sysIssueType.ISysIssueTypeService;
import com.gxwzu.system.service.sysStudent.ISysStudentService;

@Service("groupStudentService")
public class GroupStudentServiceImpl extends BaseServiceImpl<GroupStudent> implements IGroupStudentService {
	
	@Autowired
	private ISysStudentService sysStudentService;             //学生接口
	@Autowired
	private IGroupStudentDao groupStudentDao;
	@Autowired
	private IGroupAllotService groupAllotService;
	@Autowired
	private IGroupTeacherService groupTeacherService; // 老师分组接口
	@Override
	public BaseDao<GroupStudent> getDao() {
		return this.groupStudentDao;
	}

	@Override
	public Result<ListGroupStudent> find(ListGroupStudent model,ListGroupAllot groupAllot,int page, int row) {
		Result<ListGroupStudent>  newResult = new Result<ListGroupStudent>();
		List<ListGroupStudent> newList = new ArrayList<ListGroupStudent>();
		Result<Object> oldList = groupStudentDao.find(model,groupAllot,page,row);
	     
	     if(oldList!=null&&oldList.getData()!=null&&oldList.getData().size()!=0){
	    	
	    	 
		 for(Object object:oldList.getData()){
			 Object[] o= (Object[]) object;
			  newList.add( new ListGroupStudent(o));
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
	public GroupStudent add(GroupStudent groupStudent) {
		return groupStudentDao.save(groupStudent);
	}


	@Override
	public Result<ListGroupStudent> findStuGroupList(ListGroupStudent model, int page, int row) {
		Result<ListGroupStudent>  newResult = new Result<ListGroupStudent>();
		List<ListGroupStudent> newList = new ArrayList<ListGroupStudent>();
		Result<Object> oldList = groupStudentDao.findStuGroupList(model,page,row);
	     if(oldList!=null&&oldList.getData()!=null&&oldList.getData().size()!=0){
	    
		 for(Object object:oldList.getData()){
			 Object[] o= (Object[]) object;
			  newList.add(new ListGroupStudent(o));
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

	/**
	 * 查询大组学生
	 * @param model
	 * @param page
	 * @param row
	 * @return
	 */
	@Override
	public Result<ListGroupStudent> findStuGroupListByExcellent(ListGroupStudent model, int page, int row) {
		Result<ListGroupStudent>  newResult = new Result<ListGroupStudent>();
		List<ListGroupStudent> newList = new ArrayList<ListGroupStudent>();
		Result<Object> oldList = groupStudentDao.findStuGroupListByExcellent(model,page,row);
		if(oldList!=null&&oldList.getData()!=null&&oldList.getData().size()!=0){
			for(Object object:oldList.getData()){
				Object[] o= (Object[]) object;
				newList.add(new ListGroupStudent(o));
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
	public List<ListGroupStudent> findByExample(ListGroupStudent model) {
		List<ListGroupStudent> newList = new ArrayList<ListGroupStudent>();
		List<Object> oldList = groupStudentDao.findByExample(model);
	     if(oldList!=null&&oldList.size()!=0){
		 for(Object object:oldList){
			 Object[] o= (Object[]) object;
			  newList.add(new ListGroupStudent(o));
		 }
	     }
	     return newList;
	}

	@Override
	public void del(Integer thisId) {
		groupStudentDao.remove(GroupStudent.class, thisId);
	}

	/**
	 * 通过学生id , 年度查询
	 * @param stuId
	 * @param thisYear
	 * @return
	 */
	@Override
	public ListGroupStudent findByStuIdAndYear(Integer stuId, Integer thisYear) {
		ListGroupStudent model = new ListGroupStudent();
		model.setStuId(stuId);
		model.setYear(thisYear);

		log.info("Model : "+model.toString());

		List<ListGroupStudent> list= findByExample(model);
		if(list==null||list.size()<=0)
			return null;
		else{
			return list.get(0);
		}
	}

	@Override
	public Integer delByGroupIdAndYear(Integer thisId, Integer year) {
		return groupStudentDao.delByGroupIdAndYear(thisId,year);
	}

	@Override
	public Result<ListGroupStudent> findByGroupAllotIdAndYearAndGroupType(Integer groupAllotId,String groupType, Integer year, int page, int size) {
		ListGroupStudent model = new ListGroupStudent();
		model.setGroupAllotId(groupAllotId);
		model.setYear(year);

		if (SystemContext.REPLY_TYPE_BIG_GROUP.equals(groupType))return findStuGroupListByExcellent(model,page,size);//大组

		return findStuGroupList(model, page, size);
	}

	@Override
	public Result<ListGroupStudent> findByGroupAllotIdAndDefenseTeacherIdAndYear(Integer groupAllotId, Integer teacherId, Integer year, int page, int size) {
		ListGroupStudent model = new ListGroupStudent();
		model.setGroupAllotId(groupAllotId);
		model.setDefenseTeacherId(teacherId);
		model.setYear(year);
		return findStuGroupList(model, page, size);
	}

	/**
	 * 自动分配
	 */
	@Override
	public void updateAutoAllotTeacher(ListGroupAllot groupAllot) {
		
		try {
			List<ListGroupTeacher> gList =   groupTeacherService.findByGroupIdAndTypeAndYear(groupAllot.getGroupId(), null, groupAllot.getYear());
			 String updateString = " UPDATE group_student SET defense_teacher_id = ? WHERE student_id IN (SELECT student_id  ";
			 updateString =updateString+ "FROM (SELECT student_id FROM  group_student where group_allot_id=? and year=? LIMIT ?,?)as tb_1) ";
			 
			    int studentCount = Integer.parseInt(groupAllot.getStudentNum());
				int teacherCount = Integer.parseInt(groupAllot.getTeacherNum());

				if(gList!=null&&gList.size()!=0&&teacherCount!=0){
				int limt = 0;
				int size = studentCount/teacherCount;
				
			     for(ListGroupTeacher gTeacher:gList){
					List<Object> params = new ArrayList<Object>();
					params.add(gTeacher.getTeacherId());
					params.add(gTeacher.getGroupAllotId());
					params.add(gTeacher.getYear());
					params.add(limt*size);
					params.add(size);
					limt = limt+1;
					
					groupStudentDao.updateBySql(updateString, params.toArray());
				}
			    GroupAllot gAllot =  groupAllotService.findById(groupAllot.getGroupId());
			    gAllot.setFirstDefense("01");
			    groupAllotService.update(gAllot);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public ListGroupStudent findByStuIdAndYearAndType(Integer id, Integer year, String s) {

		ListGroupStudent model = new ListGroupStudent();
		model.setStuId(id);
		model.setYear(year);
		model.setGroupType(s);

		log.info("Model : "+model.toString());

		List<ListGroupStudent> list= findByExample(model);
		if(list==null||list.size()<=0)
			return null;
		else{
			return list.get(0);
		}
	}


}

