package com.gxwzu.system.service.sysMenu;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.system.model.sysMenu.SysMenu;

/**
 * 系统菜单
 * @author he
 *
 */
public interface ISysMenuService extends BaseService<SysMenu> {
	public Result<SysMenu> find(SysMenu model ,int page,int size);
	public SysMenu del(Integer id);
	public SysMenu  findById(Integer id);
	public SysMenu edit(SysMenu SysMenu);
	public  SysMenu add(SysMenu SysMenu);
	public List<SysMenu> findByExample(SysMenu model);

}
