package com.gxwzu.business.service.group.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.group.IGroupDefenseDirectionDao;
import com.gxwzu.business.model.group.GroupDefenseDirection;
import com.gxwzu.business.service.group.IGroupDefenseDirectionService;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListGroupDefenseDirection;
import com.gxwzu.system.service.sysStudent.ISysStudentService;

@Service("groupDefenseDirectionService")
public class GroupDefenseDirectionServiceImpl extends BaseServiceImpl<GroupDefenseDirection> implements IGroupDefenseDirectionService {
	
	@Autowired
	private ISysStudentService sysStudentService;             //学生接口
	
	@Autowired
	private IGroupDefenseDirectionDao groupDefenseDirectionDao;
	
	@Override
	public BaseDao<GroupDefenseDirection> getDao() {
		return this.groupDefenseDirectionDao;
	}

	@Override
	public Result<ListGroupDefenseDirection> find(GroupDefenseDirection model,int page, int row) {
		Result<ListGroupDefenseDirection>  newResult = new Result<ListGroupDefenseDirection>();
		List<ListGroupDefenseDirection> newList = new ArrayList<ListGroupDefenseDirection>();
		Result<Object> oldList = groupDefenseDirectionDao.find(model,page,row);
	     
	     if(oldList!=null&&oldList.getData()!=null&&oldList.getData().size()!=0){
	    
		 for(Object object:oldList.getData()){
			 Object[] o= (Object[]) object;
			  newList.add(new ListGroupDefenseDirection(o));
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
	public GroupDefenseDirection add(GroupDefenseDirection GroupDefenseDirection) {
		return groupDefenseDirectionDao.save(GroupDefenseDirection);
	}


	@Override
	public List<ListGroupDefenseDirection> findByExample(GroupDefenseDirection model) {
		List<ListGroupDefenseDirection> newList = new ArrayList<ListGroupDefenseDirection>();
		List<Object> oldList = groupDefenseDirectionDao.findByExample(model);
	     if(oldList!=null&&oldList.size()!=0){
		 for(Object object:oldList){
			 Object[] o= (Object[]) object;
			  newList.add(new ListGroupDefenseDirection(o));
		 }
	     }
	     return newList;
	}

	@Override
	public void del(Integer thisId) {
		groupDefenseDirectionDao.remove(GroupDefenseDirection.class, thisId);
	}
	

	@Override
	public Integer delByGroupIdAndYear(Integer thisId, Integer year) {
		return groupDefenseDirectionDao.delByGroupIdAndYear(thisId,year);
	}

	@Override
	public List<ListGroupDefenseDirection> findMajorCountByGroupIdAndYear(Integer groupAllotId,
			Integer year) {
		List<ListGroupDefenseDirection> newList = new ArrayList<ListGroupDefenseDirection>();
		List<Object> oldList = groupDefenseDirectionDao.findMajorCountByGroupIdAndYear(groupAllotId, year);
	     if(oldList!=null&&oldList.size()!=0){
		 for(Object object:oldList){
			 Object[] o= (Object[]) object;
			  newList.add(new ListGroupDefenseDirection(o));
		 }
	     }
	     return newList;
	}
}

