package com.gxwzu.system.service.sysClassroom.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.system.dao.sysClassroom.ISysClassroomDao;
import com.gxwzu.system.model.sysClassroom.SysClassroom;
import com.gxwzu.system.service.sysClassroom.ISysClassroomService;

@SuppressWarnings("unchecked")
@Service("sysClassroomService")
public class SysClassroomServiceImpl extends BaseServiceImpl<SysClassroom>  implements ISysClassroomService {

	@Autowired
	private ISysClassroomDao sysClassroomDao;
	
	public void setSysClassroomDao(ISysClassroomDao sysClassroomDao) {
		this.sysClassroomDao = sysClassroomDao;
	}
	
	@Override
	public BaseDao<SysClassroom> getDao() {
		return this.sysClassroomDao;
	}
	
	/**
	 * 列表
	 */
	@Override
	public Result<SysClassroom> find(SysClassroom sysClassroom, int page, int size) {
		return sysClassroomDao.find(sysClassroom,page,size);
	}
	@Override
	public SysClassroom add(SysClassroom model) {
		return sysClassroomDao.save(model);
	}

	@Override
	public SysClassroom findById(Integer id) {
		return sysClassroomDao.findById(id);
	}

	@Override
	public SysClassroom edit(SysClassroom model) {
       sysClassroomDao.update(model);
		return model;
	}

	@Override
	public SysClassroom del(Integer id) {
        SysClassroom model = sysClassroomDao.findById(id);
        sysClassroomDao.remove(model);
		return model;
	}

	@Override
	public List<SysClassroom> findByExample(SysClassroom model) {

		return sysClassroomDao.findByExample(model);
	}

	@Override
	public List<SysClassroom> findSysClassRoomList() {
		return sysClassroomDao.findSysClassRoomList();
	}

	
	
	
	

}
