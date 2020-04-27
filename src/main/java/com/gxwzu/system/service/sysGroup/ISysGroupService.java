package com.gxwzu.system.service.sysGroup;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.system.model.sysGroup.SysGroup;

/**
 * 系统子菜单
 * @author he
 *
 */
public interface ISysGroupService extends BaseService<SysGroup> {
	public Result<SysGroup> find(SysGroup model ,int page,int size);
	public SysGroup del(Integer id);
	public SysGroup  findById(Integer id);
	public SysGroup edit(SysGroup SysGroup);
	public  SysGroup add(SysGroup SysGroup);
	public List<SysGroup> findByExample(SysGroup model);

}
