package com.gxwzu.business.dao.teacherProject;


import java.util.List;

import com.gxwzu.business.model.teacherProject.TeacherProject;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;

public interface ITeacherProjectDao extends BaseDao<TeacherProject>{

	Result<TeacherProject> find(TeacherProject model, int page, int row);

	TeacherProject findById(Integer id);

	List<TeacherProject> findTeacherProjectList();

	List<TeacherProject> findByExample(TeacherProject model);

	List<TeacherProject> findAllByTeacherId(Integer teacherId, Integer year);

	void updateByProjectId(Integer projectId, Integer alreadyChoose,String stuIds);


	
	
}
