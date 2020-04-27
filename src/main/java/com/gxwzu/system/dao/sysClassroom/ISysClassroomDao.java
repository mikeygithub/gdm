package com.gxwzu.system.dao.sysClassroom;

import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysClassroom.SysClassroom;

public interface ISysClassroomDao extends BaseDao<SysClassroom> {

  public Result<SysClassroom> find(SysClassroom model, int page, int size);
  
  public SysClassroom findById(Integer id);
  
  public List<SysClassroom> findByExample(SysClassroom model);

  public List<SysClassroom> findSysClassRoomList();
  
}
