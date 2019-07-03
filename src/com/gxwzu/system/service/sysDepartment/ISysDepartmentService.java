package com.gxwzu.system.service.sysDepartment;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.model.sysTeacher.SysTeacher;

import com.gxwzu.system.model.sysStudent.SysStudent;


public interface ISysDepartmentService {
	/**
	 * 列表查询
	 * @date 2017.7.7
	 * @param sysDepartment
	 * @param page
	 * @param row
	 * @return
	 */
	public Result<SysDepartment> find(SysDepartment sysDepartment, int page, int row);
   /**
    * 添加学院
    * @param model
    * @return
    */
	public SysDepartment add(SysDepartment model);
	/**
	 * 删除学院信息
	 * @param thisId
	 * @return 
	 */
    public  SysDepartment del(Integer id);
    /**
     * 打开修改学院信息页面
     * @param id
     * @return
     */
	public SysDepartment findById(Integer id);
	/**
	 * 修改学院信息
	 * @param model
	 * @return
	 */
	public SysDepartment edit(SysDepartment model);
	
	/**
	 * 查询所有院系信息
	 * @return
	 * @author 黎艺侠
	 * @data 2017.7.8
	 */
	public List<SysDepartment> findAllSysDepartmentList();
	
	/**
	 * 通过DeptName查询SysDepartment
	 * @return
	 * @author 黎艺侠
	 * @data 2017.7.8
	 */
	public SysDepartment findSysDepartmentByDeptName(String deptName);
	/**
	 * 通过DeptNumber查询SysDepartment
	 * @return
	 * @author 何金燕
	 * @data 2017.7.15
	 */
	public SysDepartment findSysDepartmentByDeptNumber(String deptNumber);
	/**
	 * 通过StudentResult（学生结果集）查询院系信息存入列表
	 * @param data
	 * @author 黎艺侠
	 * @data 2017.7.9
	 */
	public List<SysDepartment> findSysDepartmentListByStudentResult(List<SysStudent> data);
	/**
	 * 学院编号和名称查重
	 * @author 何金燕
	 * @date 2017.7.10
	 * @param model
	 * @return
	 */
	public List<SysDepartment> findByExample(SysDepartment model);
	/**
	 * 查询所有学院信息
	 * @author hjy
	 * @date 2017.7.10
	 * @param data
	 * @return
	 */
	public List<SysDepartment> findSysDepartmentListByMajorResult(List<SysDepartment> data);

	


}
   
