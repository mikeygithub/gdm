package com.gxwzu.business.service.teacherMajor.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.teacherMajor.ITeacherMajorDao;
import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.business.service.teacherMajor.ITeacherMajorService;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListAllotGuide;
import com.gxwzu.sysVO.ListTeacherMajor;
import com.gxwzu.sysVO.ListTeacherGuideCount;
import com.gxwzu.sysVO.ListTeacherMajor;

@Service("teacherMajorService")
public class TeacherMajorServiceImpl extends BaseServiceImpl<TeacherMajor> implements ITeacherMajorService{
	
	@Autowired
	private ITeacherMajorDao teacherMajorDao;
	
	@Override
	public BaseDao<TeacherMajor> getDao() {
		return teacherMajorDao;
	}
	  /**
     * 查询老师所带专业列表
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	@Override
	public List<TeacherMajor> findAllTeacherMajorList() {
		return teacherMajorDao.findAllTeacherMajorList();
	}
	 /**
     * 查询老师所带专业列表
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	@Override
	public Result<ListTeacherMajor> find(TeacherMajor model, int page, int row) {
		Result<ListTeacherMajor>  newResult = new Result<ListTeacherMajor>();
		List<ListTeacherMajor> newList = new ArrayList<ListTeacherMajor>();
		Result<Object> oldList = teacherMajorDao.find(model,page,row);
	     
	     if(oldList!=null&&oldList.getData()!=null&&oldList.getData().size()!=0){
	    
		 for(Object object:oldList.getData()){
			 Object[] o= (Object[]) object;
			  newList.add(new ListTeacherMajor(o));
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
     * 添加所带专业
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	@Override
	public TeacherMajor add(TeacherMajor teacherMajor) {
		return teacherMajorDao.save(teacherMajor);
	}
	 /**
     * 查找所带专业
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	@Override
	public TeacherMajor findById(Integer id) {
		return teacherMajorDao.findById(id);
	}
	 /**
     * 修改所带专业
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	@Override
	public TeacherMajor edit(TeacherMajor teacherMajor) {
		teacherMajorDao.update(teacherMajor);;
		return teacherMajor;
	}
	 /**
     * 删除所带专业
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	@Override
	public TeacherMajor del(Integer id) {
		TeacherMajor teacherMajor = teacherMajorDao.findById(id);
		teacherMajorDao.remove(teacherMajor);
		return teacherMajor;
	}
	
	@Override
	public List<ListTeacherMajor> findByExample(TeacherMajor model) {
		List<ListTeacherMajor> newList = new ArrayList<ListTeacherMajor>();
		List<Object> oldList = teacherMajorDao.findByExample(model);
	     if(oldList!=null&&oldList.size()!=0){
		 for(Object object:oldList){
			 Object[] o= (Object[]) object;
			  newList.add(new ListTeacherMajor(o));
		 }
	     }
	     return newList;
	}
	
	@Override
	public List<ListTeacherMajor> findByTeacherId(Integer teacherId) {
		TeacherMajor model = new TeacherMajor();
		model.setTeacherId(teacherId);
		List<ListTeacherMajor> list = findByExample(model);
		if(list!=null){
			return list;
		}else{
			return  new ArrayList<ListTeacherMajor>();
		}
	}
	@Override
	public List<ListTeacherMajor> findByMajorId(Integer majorId) {
		TeacherMajor model = new TeacherMajor();
		model.setMajorId(majorId);
		List<ListTeacherMajor> list = findByExample(model);
		if(list!=null){
			return list;
		}else{
			return new ArrayList<ListTeacherMajor>();
		}
	}
}
