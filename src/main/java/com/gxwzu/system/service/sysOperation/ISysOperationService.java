package com.gxwzu.system.service.sysOperation;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.system.model.sysOperation.SysOperation;

/**
 * 系统菜单
 * @author he
 *
 */
public interface ISysOperationService extends BaseService<SysOperation> {
	public Result<SysOperation> find(SysOperation model ,int page,int size);
	public SysOperation del(Integer id);
	public SysOperation  findById(Integer id);
	public SysOperation edit(SysOperation SysOperation);
	public  SysOperation add(SysOperation SysOperation);
	public List<SysOperation> findByExample(SysOperation model);

}
