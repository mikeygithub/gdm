package com.gxwzu.system.service.sysFileType;

import java.util.List;

import com.gxwzu.business.model.paper.StudentPaper;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.system.model.sysFileType.SysFileType;

public interface ISysFileTypeService extends BaseService<SysFileType>{
    /**
     * 列表查询
     * @param model
     * @param page
     * @param row
     * @return
     */
	public Result<SysFileType> find(SysFileType model, int page, int size);
	/**
	 * 添加文件类型
	 * @return
	 */
	public SysFileType add(SysFileType model);
	/**
	 * 修改文件类型
	 * @return
	 */
	public SysFileType findById(Integer id);
	
	public SysFileType edit(SysFileType model);
	/**
	 * 删除文件类型
	 * @return
	 */
	public SysFileType del(Integer id);
	/**
	 * 检查文件类型是否存在
	 * @return                         
	 */
	public List<SysFileType> findByExample(SysFileType model);
	
	/**
	 * 查找所有文件类型
	 * @param string 
	 * @return
	 */
	public List<SysFileType> findAllSysFileTypeList(String fileId);
	
	
	

}
