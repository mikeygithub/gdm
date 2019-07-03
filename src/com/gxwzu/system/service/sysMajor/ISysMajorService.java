package com.gxwzu.system.service.sysMajor;

import java.util.List;

import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysMajor.SysMajor;

public interface ISysMajorService extends BaseService<SysMajor>{

	public	 Result<SysMajor> find(SysMajor sysMajor, int page, int row);//列表

	public SysMajor add(SysMajor model);//添加专业

	public SysMajor del(Integer thisId);//删除专业

	public SysMajor findById(Integer id);//打开修改页面

	public SysMajor edit(SysMajor model);//修改专业信息


	public List<SysMajor> findByExample(SysMajor model);//检查专业编号和名称是否存在

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
	 * 通过教研室名称查询一条专业记录
	 * @param majorId
	 * @return
	 */
	public SysMajor findByStaffroomName(String staffName);

	public List<SysMajor> findSysMajorListByStudentResult(List<ListStudent> data); //通过StudentResult（学生结果集）查询专业信息存入列表

	public List<SysMajor> findAllSysMajorList();//查找所有专业信息
    /**
     * 通过学院编号查询专业
     * @param sysMajor
     * @return
     */
	public List<SysMajor> findByDeptNumber(String deptNumber);

	public List<SysMajor> findSysMajorListByTeacherMajorList(List<TeacherMajor> teacherMajorList);//查找指导老师已选专业

	public List<SysMajor> findSysMajorListByDeptNumber(String deptNumber);//通过院系ID查找专业

	public List<SysMajor> findSysMajorListBySysDepartmentList(List<SysDepartment> sysDepartmentList);

	/**
	 * 通过大类查询专业教研室
	 * @param categoryId
	 * @return
	 */
	public List<SysMajor> findByCategoryId(Integer categoryId);

	



}
