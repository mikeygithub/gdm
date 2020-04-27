package com.gxwzu.system.dao.sysClassroom.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.dao.sysClassroom.ISysClassroomDao;
import com.gxwzu.system.model.sysClassroom.SysClassroom;

@SuppressWarnings("unchecked")
@Repository("sysClassroomDao")
public class SysClassroomDaoImpl extends BaseDaoImpl<SysClassroom> implements ISysClassroomDao {

	/**
	 * 列表查询
	 * @date 2017.7.8
	 * @author 韦东连
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Result<SysClassroom> find(SysClassroom model, int page, int size) {
		String queryString = "from SysClassroom model where 1=1";
		int start = (page - 1) * size;
		int limit = size;
		List params = new ArrayList<Object>();
		if(model.getClassroomName()!=null){
			queryString=queryString+" and model.classroomName like '%"+model.getClassroomName()+"%' ";
		}
		return (Result<SysClassroom>) super.find(queryString, params.toArray(),null, start, limit);
   
	}

	@Override
	public SysClassroom findById(Integer id) {
		log.debug("##########"+id);
		try {
			SysClassroom instance = (SysClassroom) getHibernateTemplate().get(
					"com.gxwzu.system.model.sysClassroom.SysClassroom", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
		
		
	}

	@Override
	public List<SysClassroom> findByExample(SysClassroom model) {
		 List<Object>  params=new ArrayList<Object>();
		 String queryString="from SysClassroom model where 1=1";
		 if(model.getId()!=null&&!"".equals(model.getId())){
			 queryString =queryString+" and model.id=?";
	    	 params.add(model.getId());
		}
		if(model.getClassroomName()!=null&&!"".equals(model.getClassroomName())){
			queryString=queryString+"and model.classroomName=?";
			params.add(model.getClassroomName());
		}
		
		queryString = queryString+" ORDER BY id DESC";
		return super.findByExample(queryString, params.toArray());
	}

	@Override
	public List<SysClassroom> findSysClassRoomList() {
		return getAll(SysClassroom.class);
	}

	

}
