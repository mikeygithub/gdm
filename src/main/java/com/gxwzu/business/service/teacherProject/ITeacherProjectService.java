package com.gxwzu.business.service.teacherProject;

import java.util.List;

import com.gxwzu.business.model.teacherProject.TeacherProject;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;


public interface ITeacherProjectService extends BaseService<TeacherProject>{


	Result<TeacherProject> find(TeacherProject model, int page, int row);

	TeacherProject add(TeacherProject model);

	TeacherProject findById(Integer thisId);

	TeacherProject edit(TeacherProject model);

	TeacherProject del(Integer id);

	List<TeacherProject> findAllByTeacherId(Integer teacherId, Integer year);

	void updateByProjectId(Integer projectId, Integer alreadyChoose,String stuIds);


	
	

}
