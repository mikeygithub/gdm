package com.gxwzu.system.service.sysClassroom;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysClassroom.SysClassroom;

public interface ISysClassroomService {

	/**
	 * 列表查询
	 * @param sysClassroom
	 * @param page
	 * @param row
	 * @return
	 */
	public Result<SysClassroom> find(SysClassroom sysClassroom, int page, int row);
	
	public SysClassroom add(SysClassroom sysClassroom);

	public abstract SysClassroom findById(Integer Id);
	
	public abstract SysClassroom edit(SysClassroom model);
	
	public abstract SysClassroom del(Integer id);

	public List<SysClassroom> findByExample(SysClassroom model);

	public List<SysClassroom> findSysClassRoomList();

}
