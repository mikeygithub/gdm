package com.gxwzu.business.dao.teacherMajor.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.teacherMajor.ITeacherMajorDao;
import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListAllotGuide;
import com.gxwzu.sysVO.ListTeacherGuideCount;

@SuppressWarnings("unchecked")
@Repository("teacherMajorDao")
public class TeacherMajorDaoImpl extends BaseDaoImpl<TeacherMajor> implements ITeacherMajorDao{
    /**
     * 查询老师可选专业列表
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	@Override
	public List<TeacherMajor> findAllTeacherMajorList() {
		return getAll(TeacherMajor.class);
	}

	@Override
	public TeacherMajor findById(Integer id) {
		try {
			TeacherMajor instance = (TeacherMajor) getHibernateTemplate().get(
					"com.gxwzu.business.model.teacherMajor.TeacherMajor", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	 /**
     * 查询老师可选专业列表
     * @author 俸捷
     * @Data 2017.07.18
     * @return
     */
	@Override
	public Result<Object> find(TeacherMajor model, int page, int size) {
		int start = (page - 1) * size;
		int limit = size;
		StringBuffer queryString =new StringBuffer();
		queryString.append(" SELECT * FROM ( ")
		.append(" SELECT tmr.*,mr.major_name FROM teacher_major tmr   ")
		.append(" LEFT JOIN sys_major mr ON tmr.major_id = mr.major_id ")
		.append(" )as model WHERE 1=1 ");
		
		List<Object> params = new ArrayList<Object>();
		if(model.getTeacherId()!=null){
			queryString.append(" and model.teacher_id=? ");
			params.add(model.getTeacherId());
		}
		
		if(model.getMajorId()!=null){
			queryString.append(" and model.major_id=? ");
			params.add(model.getMajorId());
		}
		
		queryString.append(" ORDER BY model.id DESC ");;
		return  super.findBySQL(queryString.toString(), params.toArray(), start, limit);
	}

	@Override
	public List<Object> findByExample(TeacherMajor model) {
		StringBuffer queryString =new StringBuffer();
		queryString.append(" SELECT * FROM ( ")
		.append(" SELECT tmr.*,mr.major_name FROM teacher_major tmr   ")
		.append(" LEFT JOIN sys_major mr ON tmr.major_id = mr.major_id ")
		.append(" )as model WHERE 1=1 ");
		
		List<Object> params = new ArrayList<Object>();
		if(model.getTeacherId()!=null){
			queryString.append(" and model.teacher_id=? ");
			params.add(model.getTeacherId());
		}
		
		if(model.getMajorId()!=null){
			queryString.append(" and model.major_id=? ");
			params.add(model.getMajorId());
		}
		
		queryString.append(" ORDER BY model.id DESC ");
		return super.query(queryString.toString(), params.toArray());
	}


}
