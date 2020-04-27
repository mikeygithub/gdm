package com.gxwzu.system.service.sysNotice;
import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.system.model.sysNotice.SysNotice;

/**
 * 公告信息
 * @author he
 *
 */
public interface ISysNoticeService extends BaseService<SysNotice> {
	public Result<SysNotice> find(SysNotice model ,int page,int size);
	
	public SysNotice del(Integer id);
	
	public SysNotice  findById(Integer id);
	
	
	public  SysNotice add(SysNotice SysNotice);
	
	public List<SysNotice> findByExample(SysNotice model);

	public List<SysNotice> findAll(SysNotice model);

    List<SysNotice> findByMostNew(SysNotice model,Integer newNum);
}
