package com.gxwzu.system.dao.sysClass;

import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.system.model.sysClass.SysClass;

public interface ISysClassDao extends BaseDao<SysClass>{


	Result<Object> find(SysClass model, int page, int row);

	public	SysClass findById(Integer id);

	List<SysClass> findAllsysClassList();

	SysClass findSysClassByClassName(String className);

	List<SysClass> findSysClassListByStudentResult(List<ListStudent> pageResult);
 
/**
 * 通过id查找
 * @param classId
 * @return
 */
	SysClass findByCalssId(String classId);

	List<Object> findByExample(SysClass sysClass);
}
