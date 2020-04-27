package com.gxwzu.system.service.sysDepartment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.system.dao.sysDepartment.ISysDepartmentDao;

import com.gxwzu.system.model.sysDepartment.SysDepartment;

import com.gxwzu.system.model.sysStudent.SysStudent;

import com.gxwzu.system.service.sysDepartment.ISysDepartmentService;
@Service("sysDepartmentService")

public class SysDepartmentServiceImpl extends BaseServiceImpl<SysDepartment> implements ISysDepartmentService{
	
	@Autowired
	private ISysDepartmentDao sysDepartmentDao;
	
	@Override
	public BaseDao<SysDepartment> getDao() {
		return this.sysDepartmentDao;
	}
	/**
	 * 列表查询
	 */
	@Override
	public Result<SysDepartment> find(SysDepartment sysDepartment, int page, int row) {
		return sysDepartmentDao.find(sysDepartment,page,row);
	}
	/**
	 * 添加学院
	 */
	@Override
	public SysDepartment add(SysDepartment model) {
		return sysDepartmentDao.save(model);
	}
	/**
	 * 删除学院信息
	 */
	@Override
	public SysDepartment del(Integer id) {
		SysDepartment model = sysDepartmentDao.findById(id);
		sysDepartmentDao.remove(model);
		return model;
	}
	/**
	 * 打开修改页面
	 */
	@Override
	public SysDepartment findById(Integer id) {
		return sysDepartmentDao.findById(id);
		
	}
	/**
	 * 修改学院信息
	 */
	@Override
	public SysDepartment edit(SysDepartment model) {
		sysDepartmentDao.update(model);
		return model;
	}
	/**
	 * 查询所有院系信息
	 * @return
	 * @author 黎艺侠
	 * @data 2017.7.8
	 */
	@Override
	public List<SysDepartment> findAllSysDepartmentList() {
		return sysDepartmentDao.findAllSysDepartmentList();
	}
	
	/**
	 * 通过DeptName查询SysDepartment
	 * @return
	 * @author 黎艺侠
	 * @data 2017.7.8
	 */
	@Override
	public SysDepartment findSysDepartmentByDeptName(String deptName) {
		return sysDepartmentDao.findSysDepartmentByDeptName(deptName);
	}
	
	/**
	 * 通过StudentResult（学生结果集）查询院系信息存入列表
	 * @param data
	 * @author 黎艺侠
	 * @data 2017.7.9
	 */
	@Override
	public List<SysDepartment> findSysDepartmentListByStudentResult(List<SysStudent> pageResult) {
		return sysDepartmentDao.findSysDepartmentListByStudentResult(pageResult);
	}

	/**
	 * 学院编号和名称查重
	 * @author hjy
	 * @date 2017.7.10
	 */
	@Override
	public List<SysDepartment> findByExample(SysDepartment model) {
		return sysDepartmentDao.findByExample(model);
	}
	@Override
	public List<SysDepartment> findSysDepartmentListByMajorResult(List<SysDepartment> data) {
		return null;
	}
	
	/**
	 * 通过DeptNumber查询SysDepartment
	 * @return
	 * @author 何金燕
	 * @data 2017.7.15
	 */
	@Override
	public SysDepartment findSysDepartmentByDeptNumber(String deptNumber) {
		return sysDepartmentDao.findSysDepartmentByDeptNumber(deptNumber);
	}
}
