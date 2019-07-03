package com.gxwzu.business.dao.teacherProject.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.allotGuide.IAllotGuideDao;
import com.gxwzu.business.dao.teacherProject.ITeacherProjectDao;
import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.business.model.teacherProject.TeacherProject;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.GeneralUtil;
import com.gxwzu.sysVO.ListStudentAllotGuide;
import com.gxwzu.sysVO.ListTeacher;
import com.gxwzu.sysVO.ListTeacherGuideCount;
import com.gxwzu.system.model.sysClassroom.SysClassroom;
/**
 * 指导教师课题DAOIMPL实现类
 * @author黎艺侠
 * @date 2017.11.14
 */
@SuppressWarnings("unchecked")
@Repository("teacherProjectDao")
public class TeacherProjectDaoImpl extends BaseDaoImpl<TeacherProject> implements ITeacherProjectDao{

	/**
	 * 导师课题显示列表
	 * @return
	 */
	@Override
	public Result<TeacherProject> find(TeacherProject model, int page, int size) {
		String queryString = "from TeacherProject model where 1=1";
		int start = (page - 1) * size;
		int limit = size;
		List params = new ArrayList<Object>();
		if(model.getProjectName()!=null){
			queryString=queryString+" and model.projectName like '%"+model.getProjectName()+"%' ";
			
		}
		if(model.getTeacherId()!=null && !"".equals(model.getTeacherId())){
			queryString=queryString+" and model.teacherId = "+model.getTeacherId()+" ";
		}
		return (Result<TeacherProject>) super.find(queryString, params.toArray(),null, start, limit);
	}

	@Override
	public TeacherProject findById(Integer id) {
		log.debug("##########"+id);
		try {
			TeacherProject instance = (TeacherProject) getHibernateTemplate().get(
					"com.gxwzu.business.model.teacherProject.TeacherProject", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
		
		
	}

	@Override
	public List<TeacherProject> findByExample(TeacherProject model) {
		 List<Object>  params=new ArrayList<Object>();
		 String queryString="from TeacherProject model where 1=1";
		 if(model.getProjectId()!=null&&!"".equals(model.getProjectId())){
			 queryString =queryString+" and model.projectId=?";
	    	 params.add(model.getProjectId());
		}
		if(model.getProjectName()!=null&&!"".equals(model.getProjectName())){
			queryString=queryString+"and model.projectName=?";
			params.add(model.getProjectName());
		}
		
		queryString = queryString+" ORDER BY id DESC";
		return super.findByExample(queryString, params.toArray());
	}

	@Override
	public List<TeacherProject> findTeacherProjectList() {
		return getAll(TeacherProject.class);
	}


	@Override
	public List<TeacherProject> findAllByTeacherId(Integer teacherId,Integer year) {
		String queryString = "from TeacherProject model where 1=1 ";
		List<Object> params = new ArrayList<Object>();
		if(null!=teacherId && !"".equals(teacherId)){
			queryString=queryString+" and model.teacherId = ?";
			params.add(teacherId);
		}
		
		if(null!=year && !"".equals(year)){
			queryString=queryString+" and model.year = ?";
			params.add(year);
		}
		return super.findByExample(queryString, params.toArray());
	}


	@Override
	public void updateByProjectId(Integer projectId, Integer alreadyChoose,String stuIds) {
		String updateString = "";
		List<Object> params = new ArrayList<Object>();
		if(null!=projectId && !"".equals(projectId)){
			updateString = "update TeacherProject model ";
			updateString = updateString+" set model.stuIds = ? ,model.alreadyChoose = ? ";
			params.add(stuIds);
			params.add(alreadyChoose);
			updateString += " where model.projectId = ? ";
			params.add(projectId);
		}
		super.bulkUpdate(updateString, params.toArray(), null);
	}

	
}
