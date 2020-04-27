package com.gxwzu.system.service.sysMajor.impl;
import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.system.dao.sysMajor.ISysMajorDao;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysMajor.SysMajor;
import com.gxwzu.system.service.sysMajor.ISysMajorService;

@Service("sysMajorService")
public class SysMajorServiceImpl extends BaseServiceImpl<SysMajor> implements ISysMajorService{
    @Autowired
    private ISysMajorDao sysMajorDao;
    
    @Override
	public BaseDao<SysMajor> getDao() {
	return this.sysMajorDao;
	}
    /**
     * 专业列表
     */
	@Override
	public Result<SysMajor> find(SysMajor sysMajor, int page, int row) {
		return sysMajorDao.find(sysMajor,page,row);
	}
	/**
	 * 添加专业
	 */
	@Override
	public SysMajor add(SysMajor model) {
		return sysMajorDao.save(model);
	}
	/**
	 * 删除专业
	 */
	@Override
	public SysMajor del(Integer id) {
		 SysMajor model=sysMajorDao.findById(id);
		 sysMajorDao.remove(model);
		 return model;
	}
	/**
	 * 打开修改页面
	 */
	@Override
	public SysMajor findById(Integer id) {
		return sysMajorDao.findById(id);
	}
	/**
	 * 修改专业信息
	 */
	@Override
	public SysMajor edit(SysMajor model) {
		 sysMajorDao.update(model);
		 return model;
	}

	/**
	 * @author hjy
	 * @date 2017.7.10
	 */
	@Override
	public List<SysMajor> findByExample(SysMajor model) {
		return sysMajorDao.findByExample(model);
	}

	
	/**
	 * 通过StudentResult（学生结果集）查询专业信息存入列表
	 */
	@Override
	public List<SysMajor> findSysMajorListByStudentResult(List<ListStudent> pageResult) {
		return sysMajorDao.findSysMajorListByStudentResult(pageResult);
	}

		
	/**
	 * 查找所有的专业信息
	 */
	@Override
	public List<SysMajor> findAllSysMajorList() {
		return sysMajorDao.findAllsysMajorList();
	}
	/**
	 * 查找一條記錄 通過专业编号
	 */
	@Override
	public SysMajor findByMajorNo(String majorNo) {
		return sysMajorDao.findByMajorNo(majorNo);
	}
	@Override
	public SysMajor findSysMajorByMajorName(String majorName) {
		return sysMajorDao.findSysMajorByMajorName(majorName);
	}
	@Override
	public SysMajor findByStaffroomName(String staffName) {
		return sysMajorDao.findByStaffName(staffName);
	}
	
	@Override
	public List<SysMajor> findByDeptNumber(String deptNumber) {
		SysMajor model = new SysMajor();
		model.setDeptNumber(deptNumber);
		return findByExample(model);
	}
	
	@Override
	public List<SysMajor> findSysMajorListByTeacherMajorList(List<TeacherMajor> teacherMajorList) {
		return sysMajorDao.findSysMajorListByTeacherMajorList(teacherMajorList);
	}
	
	/**
	 * 通过院系id查找专业
	 */
	@Override
	public List<SysMajor> findSysMajorListByDeptNumber(String deptNumber) {
		return sysMajorDao.findSysMajorListByDeptNumber(deptNumber);
	}
	@Override
	public List<SysMajor> findSysMajorListBySysDepartmentList(List<SysDepartment> sysDepartmentList) {
		return sysMajorDao.findSysMajorListBySysDepartmentList(sysDepartmentList);
	}
	
	@Override
	public List<SysMajor> findByCategoryId(Integer categoryId) {
		
		List<SysMajor> list = new ArrayList<SysMajor>();
		if(categoryId!=null){
			SysMajor model = new SysMajor();
			model.setCategoryId(categoryId);
			list =  sysMajorDao.findByExample(model);
		}
		return list;
	}

	


}
