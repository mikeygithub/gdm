package com.gxwzu.system.service.sysClass.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListClass;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.system.dao.sysClass.ISysClassDao;
import com.gxwzu.system.model.sysClass.SysClass;
import com.gxwzu.system.service.sysClass.ISysClassService;

@Service("sysClassService")
public class SysClassServiceImpl extends BaseServiceImpl<SysClass> implements ISysClassService{

	@Autowired
	private ISysClassDao sysClassDao;
	
	
	
	public BaseDao<SysClass> getDao() {
		return this.sysClassDao;
	}
	
	
	@Override
	public Result<ListClass> find(SysClass model, int page, int row) {
		Result<Object> oldResult = sysClassDao.find(model, page, row);
		Result<ListClass> newResult = new Result<ListClass>();
		List<ListClass> newList = new ArrayList<ListClass>();
		if (oldResult != null && oldResult.getData() != null
				&& oldResult.getData().size() != 0) {

			for (Object object : oldResult.getData()) {
				Object[] o = (Object[]) object;
				newList.add(new ListClass(o));
			}
		}
		newResult.setData(newList);
		newResult.setOffset(oldResult.getOffset());
		newResult.setPage(oldResult.getPage());
		newResult.setSize(oldResult.getSize());
		newResult.setTotal(oldResult.getTotal());
		newResult.setTotalPage(oldResult.getTotalPage());
		return newResult;
	}

	@Override
	public SysClass add(SysClass sysClass) {
		return sysClassDao.save(sysClass);
	}

	@Override
	public SysClass findById(Integer id) {
		return sysClassDao.findById(id);
	}

	@Override
	public SysClass edit(SysClass model) {
		sysClassDao.update(model);
		return model;
	}
	
	@Override
	public SysClass del(Integer id) {
		SysClass model = sysClassDao.findById(id);
		sysClassDao.remove(model);
		return model;
	}

	/**
	 * 查找所有的班级信息
	 */
	@Override
	public List<SysClass> findAllsysClassList() {
		return sysClassDao.findAllsysClassList();
	}

	/**
	 * 通过ClassName查询SysClass
	 * @return
	 * @author 黎艺侠
	 * @data 2017.7.8
	 */
	@Override
	public SysClass findSysClassByClassName(String className) {
		return sysClassDao.findSysClassByClassName(className);
	}

	/**
	 * 通过StudentResult（学生结果集）查询班级信息存入列表
	 * @param data
	 * @author 黎艺侠
	 * @data 2017.7.9
	 */
	@Override
	public List<SysClass> findSysClassListByStudentResult(List<ListStudent> pageResult) {
		return sysClassDao.findSysClassListByStudentResult(pageResult);
	}


	@Override
	public List<ListClass> findByExample(SysClass model) {
		
		List<Object> oldList = sysClassDao.findByExample(model);
		List<ListClass> newList = new ArrayList<ListClass>();
		if (oldList != null && oldList.size() != 0)
			for (Object object : oldList) {
				Object[] o = (Object[]) object;
				newList.add(new ListClass(o));
			}
		return newList;
	}

	/**
     * 通过专业编号查找班级
     * @param majorId
     * @return
     */
	@Override
	public List<ListClass> findByMajorId(Integer majorId) {
		SysClass mode = new SysClass();
		mode.setMajorId(majorId);
		return findByExample(mode);
	}
}
