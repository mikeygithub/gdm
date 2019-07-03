package com.gxwzu.system.dao.sysNotice;

import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysNotice.SysNotice;

public interface ISysNoticeDao extends BaseDao<SysNotice> {

  public Result<SysNotice> find(SysNotice model, int page, int size);
  
  public SysNotice findById(Integer id);
  
  public List<SysNotice> findByExample(SysNotice model);

  public List<SysNotice> findSysNoticeList();

  public List<SysNotice> findAll(SysNotice model);
  
}
