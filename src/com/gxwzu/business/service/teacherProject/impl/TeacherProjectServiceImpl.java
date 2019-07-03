package com.gxwzu.business.service.teacherProject.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.teacherProject.ITeacherProjectDao;
import com.gxwzu.business.model.teacherProject.TeacherProject;
import com.gxwzu.business.service.teacherProject.ITeacherProjectService;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.system.model.sysClassroom.SysClassroom;



@Service("teacherProjectService")
public class TeacherProjectServiceImpl extends BaseServiceImpl<TeacherProject> implements ITeacherProjectService{

	@Autowired
	private ITeacherProjectDao teacherProjectDao;
	
	@Override
	public BaseDao<TeacherProject> getDao() {
		return this.teacherProjectDao;
	}
	
	@Override
	public Result<TeacherProject> find(TeacherProject model, int page, int row) {
		return teacherProjectDao.find(model, page, row);
	}

	@Override
	public TeacherProject add(TeacherProject model) {
		model.setAlreadyChoose(0);
		return teacherProjectDao.save(model);
	}

	@Override
	public TeacherProject findById(Integer thisId) {
		return teacherProjectDao.findById(thisId);
	}

	@Override
	public TeacherProject edit(TeacherProject model) {
		teacherProjectDao.update(model);
			return model;
	}

	@Override
	public TeacherProject del(Integer id) {
		TeacherProject model = teacherProjectDao.findById(id);
		teacherProjectDao.remove(model);
		return model;
	}

	@Override
	public List<TeacherProject> findAllByTeacherId(Integer teacherId,Integer year) {
		return teacherProjectDao.findAllByTeacherId(teacherId,year);
	}

	@Override
	public void updateByProjectId(Integer projectId, Integer alreadyChoose,String stuIds) {
		System.out.println(alreadyChoose+"+++++++++++");
		teacherProjectDao.updateByProjectId(projectId, alreadyChoose,stuIds);
	}

}
