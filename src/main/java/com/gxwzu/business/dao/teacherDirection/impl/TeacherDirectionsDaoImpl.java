package com.gxwzu.business.dao.teacherDirection.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.teacherDirection.ITeacherDirectionsDao;
import com.gxwzu.business.model.teacherDirections.TeacherDirections;
import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListTeacherDirections;

@SuppressWarnings("unchecked")
@Repository("teacherDirectionsDao")
public class TeacherDirectionsDaoImpl extends BaseDaoImpl<TeacherDirections> implements ITeacherDirectionsDao{

	/**
     * 查询研究方向列表
     * @author 韦东连
     * @Data 2017.08.02
     * @return
     */
	@Override
	public List<TeacherDirections> findAllTeacherDirectionsList() {
		return getAll(TeacherDirections.class);
	}

	@Override
	public TeacherDirections findById(Integer id) {
		try {
			TeacherDirections instance = (TeacherDirections) getHibernateTemplate().get(
					"com.gxwzu.business.model.teacherDirections.TeacherDirections", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	/**
     * 查询研究方向列表
     * @author 韦东连
     * @Data 2017.08.02
     * @return
     */
	@Override
	public Result<Object> find(TeacherDirections model, int page, int size) {
        int start = (page - 1) * size ;
        int limit = size;
		StringBuffer queryString =new StringBuffer();
		queryString.append(" SELECT * FROM ( ")
		.append(" SELECT tds.*,ds.directions_name FROM teacher_directions tds   ")
		.append(" LEFT JOIN sys_directions ds ON tds.directions_id = ds.directions_id ")
		.append(" )as model WHERE 1=1 ");
		
		List<Object> params = new ArrayList<Object>();
		if(model.getTeacherId()!=null){
			queryString.append(" and model.teacher_id=? ");
			params.add(model.getTeacherId());
		}
		
		if(model.getDirectionsId()!=null){
			queryString.append(" and model.directions_id=? ");
			params.add(model.getDirectionsId());
		}
		queryString.append(" ORDER BY model.id DESC ");
		return  super.findBySQL(queryString.toString(), params.toArray(), start, limit);
	}
	/**
     * 查找研究方向list
     * @author wdl
     * @Data 2017.08.13
     * @return
     */
	@Override
	public List<Object> findByExample(TeacherDirections model) {

		StringBuffer queryString =new StringBuffer();
		queryString.append(" SELECT * FROM ( ")
		.append(" SELECT tds.*,ds.directions_name FROM teacher_directions tds   ")
		.append(" LEFT JOIN sys_directions ds ON tds.directions_id = ds.directions_id ")
		.append(" )as model WHERE 1=1 ");
		
		List<Object> params = new ArrayList<Object>();
		if(model.getTeacherId()!=null){
			queryString.append(" and model.teacher_id=? ");
			params.add(model.getTeacherId());
		}
		
		if(model.getDirectionsId()!=null){
			queryString.append(" and model.directions_id=? ");
			params.add(model.getDirectionsId());
		}
		queryString.append(" ORDER BY model.id DESC ");
		
		return super.query(queryString.toString(), params.toArray());
	}


}
