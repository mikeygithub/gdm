package com.gxwzu.system.dao.sysMajor;

import java.util.List;

import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysMajor.SysMajor;

public interface ISysMajorDao extends BaseDao<SysMajor>{

	public	Result<SysMajor> find(SysMajor sysMajor, int page, int row);//专业列表

	public SysMajor findById(Integer id);//

	public List<SysMajor> findAllSysMajorList();

	public List<SysMajor> findSysMajorListByStudentResult(List<ListStudent> pageResult);

	public List<SysMajor> findAllsysMajorList();

	public List<SysMajor> findByExample(SysMajor model);//专业编号和名称查重
	/**
	 * 通过专业编号查询专业
	 * @param majorId
	 * @return
	 */
	public SysMajor findByMajorNo(String majorNo);
	/**
	 * 通过专业名称查询一条专业记录
	 * @param majorId
	 * @return
	 */
	public SysMajor findSysMajorByMajorName(String majorName);
  /**
   * 通过学院编号查询专业
   * @author 何金燕
   * @param sysMajor
   * @return
   */
	public List<SysMajor> findByDeptNumber(String deptNumber);

	public List<SysMajor> findSysMajorListByTeacherMajorList(List<TeacherMajor> teacherMajorList);

	/**
	 * 通过院系id查找专业
	 * @param deptNumber
	 * @return
	 */
	public List<SysMajor> findSysMajorListByDeptNumber(String deptNumber);

	public List<SysMajor> findSysMajorListBySysDepartmentList(List<SysDepartment> sysDepartmentList);

	public SysMajor findByStaffName(String staffName);

}
