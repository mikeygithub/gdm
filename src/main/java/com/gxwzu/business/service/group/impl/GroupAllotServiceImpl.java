package com.gxwzu.business.service.group.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.group.IGroupAllotDao;
import com.gxwzu.business.model.group.GroupAllot;
import com.gxwzu.business.model.group.GroupTeacher;
import com.gxwzu.business.service.group.IGroupAllotService;
import com.gxwzu.business.service.group.IGroupDefenseDirectionService;
import com.gxwzu.business.service.group.IGroupTeacherService;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListGroupAllot;
import com.gxwzu.sysVO.ListGroupDefenseDirection;
import com.gxwzu.sysVO.ListGroupTeacher;
import com.gxwzu.system.model.sysClassroom.SysClassroom;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.service.sysClassroom.ISysClassroomService;
import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
import com.gxwzu.system.service.sysTeacher.ISysTeacherService;

@Service("groupAllotService")
public class GroupAllotServiceImpl extends BaseServiceImpl<GroupAllot> implements IGroupAllotService{

	@Autowired
	private IGroupDefenseDirectionService groupDefenseDirectionService;//分组答辩方向接口
	@Autowired
	private IGroupTeacherService groupTeacherService;  //老师分组
	@Autowired
	private ISysTeacherService sysTeacherService;  //老师接口
	@Autowired
	private ISysDepartmentService sysDepartmentService;//学院接口
	@Autowired
	private ISysClassroomService sysClassroomService;//教室接口
	@Autowired
	private IGroupAllotDao groupAllotDao;
	
	@Override
	public BaseDao<GroupAllot> getDao() {
		return this.groupAllotDao;
	}
	
	@Override
	public GroupAllot del(Integer id) {
		GroupAllot model = groupAllotDao.findById(id);
		groupAllotDao.remove(model);
		return model;
	}

	@Override
	public GroupAllot edit(GroupAllot model) {
		groupAllotDao.update(model);
		return model;
	}

	@Override
	public GroupAllot findById(Integer id) {
		return groupAllotDao.findById(id);
	}
	
	 /**
     * 查询分组列表
     * @author 俸捷
     * @return
     */
	@Override
	public List<GroupAllot> finAllGroupAllotList() {
		return groupAllotDao.finAllGroupAllotList();
	}
	
	/**
	 * @author 俸捷
	 * 将分组表里面的信息添加到老师分组表里
	 */
	@Override
	public GroupAllot add(GroupAllot model) {
    	return groupAllotDao.save(model);
	}

	
	/**
	 * 查看分组列表
	 * @return
	 */
	@Override
	public Result<ListGroupAllot> find(GroupAllot model, int page, int row) {
		
		Result<ListGroupAllot>  newResult = new Result<ListGroupAllot>();
		List<ListGroupAllot> newList = new ArrayList<ListGroupAllot>();
		 Result<Object> oldResult = groupAllotDao.find(model,page,row);
	     
	     if(oldResult.getData()!=null&&oldResult.getData().size()!=0){
	    
			 for(Object os:oldResult.getData()){
				 Object[] o = (Object[]) os; 
				 ListGroupAllot lAllot = new ListGroupAllot(o);
				 
				 ListGroupTeacher groupTeacher = new ListGroupTeacher();
				 groupTeacher.setGroupAllotId(lAllot.getGroupId());
				 groupTeacher.setYear(model.getYear());
					 //查询组内老师
					List<ListGroupTeacher> teacherList = groupTeacherService.findByExample(groupTeacher);
					if(teacherList!=null&&teacherList.size()!=0){
						 lAllot.setTeacherList(teacherList);
					}
					 //查询分组答辩方向
					List<ListGroupDefenseDirection> directionList = groupDefenseDirectionService.findMajorCountByGroupIdAndYear(lAllot.getGroupId(), model.getYear());
					if(directionList!=null&&directionList.size()!=0){
						 lAllot.setDirectionList(directionList);
					}	
				 newList.add(lAllot);
			  }
	     }
	      newResult.setData(newList);
		  newResult.setOffset(oldResult.getOffset());
		  newResult.setPage(oldResult.getPage());
		  newResult.setSize(oldResult.getSize());
		  newResult.setTotal(oldResult.getTotal());
		  newResult.setTotalPage(oldResult.getTotalPage());
		 return newResult;
	}


	@Override
	public GroupAllot findGroupAllotById(Integer id) {
		return groupAllotDao.get(GroupAllot.class, id);
	}
	
	@Override
	public List<ListGroupAllot> findByExample(GroupAllot model) {
		// TODO:need fix the bug , shit
		// see : https://blog.csdn.net/wxyf2018/article/details/99756962
		List<Object> oldResult = groupAllotDao.findByExample(model);

		List<ListGroupAllot> newList = new ArrayList<ListGroupAllot>();
		if (oldResult != null && oldResult.size() != 0)

			 for(Object os:oldResult){
				 Object[] o = (Object[]) os; 
				 ListGroupAllot lAllot = new ListGroupAllot(o);
				 
				 ListGroupTeacher groupTeacher = new ListGroupTeacher();
				 groupTeacher.setGroupAllotId(lAllot.getGroupId());
				 groupTeacher.setYear(model.getYear());
					 //查询组内老师
					List<ListGroupTeacher> teacherList = groupTeacherService.findByExample(groupTeacher);
					if(teacherList!=null&&teacherList.size()!=0){
						 lAllot.setTeacherList(teacherList);
					}
					 //查询分组答辩方向
					List<ListGroupDefenseDirection> directionList = groupDefenseDirectionService.findMajorCountByGroupIdAndYear(lAllot.getGroupId(), model.getYear());
					if(directionList!=null&&directionList.size()!=0){
						 lAllot.setDirectionList(directionList);
					}	
				 newList.add(lAllot);
			}
		return newList;
	}

	@Override
	public ListGroupAllot findViewModelById(Integer thisId) {
		GroupAllot model = new GroupAllot();
		model.setGroupId(thisId);
		List<ListGroupAllot> list = findByExample(model);
		if(list==null|| list.size()==0)
		return null;
		else{
			return list.get(0);
		}
	}

	@Override
	public List<ListGroupAllot> findByGroupTypeAndYear(String groupType,Integer year) {
		GroupAllot model = new GroupAllot();
		model.setYear(year);
		model.setGroupType(groupType);
		List<ListGroupAllot> list = findByExample(model);
		if(year==null||list==null|| list.size()==0)
		return new ArrayList<ListGroupAllot>();
		else{
			return list;
		}
	}


}
