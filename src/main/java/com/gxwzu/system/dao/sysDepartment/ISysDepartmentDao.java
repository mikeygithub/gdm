package com.gxwzu.system.dao.sysDepartment;


import java.util.List;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysStudent.SysStudent;

public interface ISysDepartmentDao extends BaseDao<SysDepartment>{
    
	public Result<SysDepartment> find(SysDepartment sysDepartment, int page, int row);//列表

   public SysDepartment findById(Integer id);//通过id删除学院信息

	 public	 List<SysDepartment> findAllSysDepartmentList();

	 public	 SysDepartment findSysDepartmentByDeptName(String deptName);

	 public	List<SysDepartment> findSysDepartmentListByStudentResult(List<SysStudent> pageResult);

	public List<SysDepartment> findByExample(SysDepartment model);//校验学院编号和学院名称是否存在
	/**
	 * 通过DeptNumber查询SysDepartment
	 * @return
	 * @author 何金燕
	 * @data 2017.7.15
	 */
	public SysDepartment findSysDepartmentByDeptNumber(String deptNumber);

}
