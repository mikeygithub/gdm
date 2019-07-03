package com.gxwzu.system.dao.sysTeacher;

import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysTeacher.SysTeacher;

public interface ISysTeacherDao extends BaseDao<SysTeacher>{

	public Result<Object> find(SysTeacher model, int page, int size);

	public SysTeacher findById(Integer id);


	public List<Object> findByExample(SysTeacher model);
	/**
	   * 查询指导老师通过老师职工号
	   * @author 何金燕
	   * @date 2017.7.15
	   * @param teacherId
	   */
	public SysTeacher findTeacherByTeacherId(String teacherId);
	

}
