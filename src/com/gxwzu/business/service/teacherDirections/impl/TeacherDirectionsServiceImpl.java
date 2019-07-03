package com.gxwzu.business.service.teacherDirections.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.teacherDirection.ITeacherDirectionsDao;
import com.gxwzu.business.model.teacherDirections.TeacherDirections;
import com.gxwzu.business.service.teacherDirections.ITeacherDirectionsService;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListTeacherDirections;
import com.gxwzu.system.service.sysDirections.ISysDirectionsService;

@Service("teacherDirectionsService")
public class TeacherDirectionsServiceImpl extends BaseServiceImpl<TeacherDirections> implements ITeacherDirectionsService{

	@Autowired
	private ITeacherDirectionsDao teacherDirectionDao;
	@Autowired
	private ISysDirectionsService sysDirectionsService;

	@Override
	public BaseDao<TeacherDirections> getDao() {
		return teacherDirectionDao;
	}
	/**
     * 查询研究方向列表
     * @author 韦东连
     * @Data 2017.08.02
     * @return
     */
	@Override
	public List<TeacherDirections> findAllTeacherDirectionsList() {
		return teacherDirectionDao.findAllTeacherDirectionsList();
	}

	/**
     * 查询研究方向列表
     * @author 韦东连
     * @Data 2017.08.02
     * @return
     */
	@Override
	public Result<ListTeacherDirections> find(TeacherDirections model, int page, int row) {
		Result<ListTeacherDirections>  newResult = new Result<ListTeacherDirections>();
		List<ListTeacherDirections> newList = new ArrayList<ListTeacherDirections>();
		Result<Object> oldList = teacherDirectionDao.find(model,page,row);
	     
	     if(oldList!=null&&oldList.getData()!=null&&oldList.getData().size()!=0){
	    
		 for(Object object:oldList.getData()){
			 Object[] o= (Object[]) object;
			  newList.add(new ListTeacherDirections(o));
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
     * 查找研究方向list
     * @author wdl
     * @Data 2017.08.13
     * @return
     */
	@Override
	public List<ListTeacherDirections> findByExample(TeacherDirections model) {
		List<ListTeacherDirections> newList = new ArrayList<ListTeacherDirections>();
		List<Object> oldList = teacherDirectionDao.findByExample(model);
	     if(oldList!=null&&oldList.size()!=0){
		 for(Object object:oldList){
			 Object[] o= (Object[]) object;
			  newList.add(new ListTeacherDirections(o));
		 }
	     }
	     return newList;
	}
	

	@Override
	public TeacherDirections add(TeacherDirections model) {
		return teacherDirectionDao.save(model);
	}

	@Override
	public void del(Integer thisId) {
		teacherDirectionDao.remove(TeacherDirections.class, thisId);
	}

	@Override
	public TeacherDirections findById(Integer thisId) {
		return teacherDirectionDao.findById(thisId);
	}

	@Override
	public List<ListTeacherDirections> findByTeacherId(Integer teacherId) {
		List<ListTeacherDirections> listT =  new ArrayList<ListTeacherDirections>();
		TeacherDirections model = new TeacherDirections();
		model.setTeacherId(teacherId);
		List<ListTeacherDirections> list = findByExample(model);
		if(list!=null){
			return list;
		}else{
			return listT;
		}
		
	}
}
	
	

	
	
	