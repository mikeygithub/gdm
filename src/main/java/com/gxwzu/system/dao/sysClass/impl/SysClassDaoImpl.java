package com.gxwzu.system.dao.sysClass.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.system.dao.sysClass.ISysClassDao;
import com.gxwzu.system.model.sysClass.SysClass;

/**
 * 班级DAOIMPL实现类
 * 
 * @author黎艺侠
 * @date 2017.7.7
 */
@SuppressWarnings("unchecked")
@Repository("sysClassDao")
public class SysClassDaoImpl extends BaseDaoImpl<SysClass> implements
		ISysClassDao {

	/**
	 * 班级显示列表
	 * 
	 * @return
	 */
	@Override
	public Result<Object> find(SysClass model, int page, int size) {
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		logger.info("到这里了" + model);
		StringBuffer queryString = new StringBuffer("SELECT * FROM (")
				.append("SELECT ")
				.append(" cla.*, ")
				.append(" sdt.dept_name,smr.major_name ")
				.append(" FROM sys_class cla ")
				.append(" LEFT JOIN sys_department sdt ON cla.dept_number = sdt.dept_number ")
			    .append(" LEFT OUTER JOIN sys_major smr ON cla.major_id =smr.major_id ")
				.append(") AS model WHERE 1 = 1 ");
				
	
		if (StringUtils.isNotEmpty(model.getDeptNumber())) {
			queryString.append( "and model.dept_number = ? ");
			params.add( model.getDeptNumber() );
		}
		if (model.getMajorId()!=null) {
			queryString.append("and model.major_id = ? ") ;
			params.add( model.getMajorId() );
		}
		
		if (StringUtils.isNotEmpty(model.getClassNo())) {
			queryString.append("and model.class_no like ?  ");
			params.add("%"+ model.getClassNo() + "%");
		}

		if (model.getClassName() != null && !"".equals(model.getClassName())) {
			queryString.append("and model.class_name like ? ");
			params.add("%"+ model.getClassName() + "%");

		}
		queryString.append(" ORDER BY model.class_id DESC");
		return (Result<Object>) super.findBySQL(queryString.toString(),params.toArray(), start, limit);
	}

	/**
	 * 通过id查找
	 */
	@Override
	public SysClass findById(Integer id) {
		log.debug("############ " + id);
		try {
			SysClass instance = (SysClass) getHibernateTemplate().get(
					"com.gxwzu.system.model.sysClass.SysClass", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	/**
	 * 查找所有的班级信息
	 */
	@Override
	public List<SysClass> findAllsysClassList() {
		return getAll(SysClass.class);
	}

	/**
	 * 通过ClassName查询SysClass
	 * 
	 * @return
	 * @author 黎艺侠
	 * @data 2017.7.8
	 */
	@Override
	public SysClass findSysClassByClassName(String className) {
		if (null != className && !"".equals(className)) {
			String queryString = "from SysClass where className='" + className
					+ " '";
			List<SysClass> sysClassList = getHibernateTemplate().find(
					queryString);
			if (sysClassList != null && sysClassList.size() > 0) {
				return sysClassList.get(0);
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

	/**
	 * 通过StudentResult（学生结果集）查询班级信息存入列表
	 * 
	 * @param data
	 * @author 黎艺侠
	 * @data 2017.7.9
	 */
	@Override
	public List<SysClass> findSysClassListByStudentResult(
			List<ListStudent> pageResult) {
		if (null != pageResult && pageResult.size() > 0) {
			String queryString = "from SysClass where 1=1";
			queryString = queryString + " and (";
			for (int i = 0; i < pageResult.size(); i++) {
				if (i != pageResult.size() - 1) {
					queryString = queryString + " classId = '"
							+ pageResult.get(i).getClassId() + "' or ";
				} else {
					queryString = queryString + " classId = '"
							+ pageResult.get(i).getClassId() + "')";
				}
			}
			return getHibernateTemplate().find(queryString);
		} else {
			return null;
		}
	}

	@Override
	public List<Object> findByExample(SysClass model) {
		
		List<Object> params = new ArrayList<Object>();
		StringBuffer queryString = new StringBuffer("SELECT * FROM (")
				.append("SELECT ")
				.append(" cla.*, ")
				.append(" sdt.dept_name,smr.major_name ")
				.append(" FROM sys_class cla ")
				.append(" LEFT JOIN sys_department sdt ON cla.dept_number = sdt.dept_number ")
			    .append(" LEFT OUTER JOIN sys_major smr ON cla.major_id =smr.major_id ")
				.append(") AS model WHERE 1 = 1 ");
	
		if (StringUtils.isNotEmpty(model.getDeptNumber())) {
			queryString .append( "and model.dept_number = ?");
			params.add( model.getDeptNumber() );
		}
		if (model.getMajorId()!=null) {
			queryString.append( "and model.major_id = ?");
			params.add( model.getMajorId() );
		}
		
		if (StringUtils.isNotEmpty(model.getClassNo())) {
			queryString.append("and model.class_no like ?");
			params.add("%"+model.getClassNo()+"%");
		}

		if (model.getClassName() != null && !"".equals(model.getClassName())) {
			queryString .append("and model.class_name like ?") ;
			params.add("%"+model.getClassName()+"%");
		}
		queryString.append( " ORDER BY  model.class_id DESC");
		return super.query(queryString.toString(), params.toArray());
	}

	@Override
	public SysClass findByCalssId(String classId) {
		List<Object> params = new ArrayList<Object>();
		SysClass model = null;
		if (StringUtils.isNotEmpty(classId)) {
			String queryString = "from SysClass model where model.classId=?";
			params.add(classId);

			List<SysClass> list = super.findByExample(queryString,
					params.toArray());
			if (list != null && list.size() != 0) {
				model = list.get(0);
			}
		}

		return model;
	}
}
