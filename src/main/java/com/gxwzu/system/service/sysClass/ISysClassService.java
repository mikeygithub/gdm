package com.gxwzu.system.service.sysClass;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListClass;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.system.model.sysClass.SysClass;

public interface ISysClassService extends BaseService<SysClass> {

	public Result<ListClass> find(SysClass model, int page, int row);

	public SysClass add(SysClass sysClass);

	public SysClass findById(Integer id);

	public SysClass edit(SysClass sysClass);

	public SysClass del(Integer id);

	public List<SysClass> findAllsysClassList();

	/**
	 * 通过ClassName查询SysClass
	 * @return
	 * @author 黎艺侠
	 * @data 2017.7.8
	 */
	public SysClass findSysClassByClassName(String className);

	/**
	 * 通过StudentResult（学生结果集）查询院系信息存入列表
	 * @param data
	 * @author 黎艺侠
	 * @data 2017.7.9
	 */
	public List<SysClass> findSysClassListByStudentResult(List<ListStudent> data);
   /**
    * 查询班级通过专业编号
    * 三级联动
    * @param sysClass
    * @return
    */
	public List<ListClass> findByExample(SysClass sysClass);


   /**
    * 通过专业编号查找班级
    * @param majorId
    * @return
    */
   public List<ListClass> findByMajorId(Integer majorId);

}
