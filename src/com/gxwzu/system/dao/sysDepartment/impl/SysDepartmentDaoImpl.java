package com.gxwzu.system.dao.sysDepartment.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.dao.sysDepartment.ISysDepartmentDao;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysStudent.SysStudent;


@SuppressWarnings("unchecked")
@Repository("sysDepartmentDao")
public class SysDepartmentDaoImpl extends BaseDaoImpl<SysDepartment> implements ISysDepartmentDao{

	/**
	 * 列表查询
	 * @date 2017.7.7
	 */
	@Override
	public Result<SysDepartment> find(SysDepartment sysDepartment, int page, int row) {
		int start=(page-1)*page;
		int limit =row;	
		String queryString = "from SysDepartment where 1=1";
		if(StringUtils.isNotEmpty(sysDepartment.getDeptName())){
			queryString = queryString + " and deptName like '%"+sysDepartment.getDeptName()+"%'";
		}
		if(StringUtils.isNotEmpty(sysDepartment.getDeptNumber())){	
			queryString = queryString +"and deptNumber like '%"+sysDepartment.getDeptNumber()+"%'";
		}
		return super.find(queryString, null, null, start, limit);
	}

	@Override
	public SysDepartment findById(Integer id) {
		log.debug("getting SysDepartment instance with id: " + id);
		try {
			SysDepartment instance = (SysDepartment) getHibernateTemplate().get(
					"com.gxwzu.system.model.sysDepartment.SysDepartment", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	/**
	 * 查询所有院系信息
	 * @return
	 * @author 黎艺侠
	 * @data 2017.7.8
	 */
	@Override
	public List<SysDepartment> findAllSysDepartmentList() {
		return getAll(SysDepartment.class);
	}

	/**
	 * 通过DeptName查找SysDepartment
	 * @param stringCellValue
	 * @return
	 * @author 黎艺侠
	 * @data 2017.7.8
	 */
	@Override
	public SysDepartment findSysDepartmentByDeptName(String deptName) {
		if(null != deptName && !"".equals(deptName)){
			String queryString = "from SysDepartment where deptName='"+deptName+" '";
			List<SysDepartment> sysDepartmentList = getHibernateTemplate().find(queryString);
			if(sysDepartmentList != null && sysDepartmentList.size() > 0){
				return sysDepartmentList.get(0);
			}else{
				return null;
			}
		}else{
			return null;
		}
	}

	/**
	 * 通过StudentResult（学生结果集）查询院系信息存入列表
	 * @param data
	 * @author 黎艺侠
	 * @data 2017.7.9
	 */
	@Override
	public List<SysDepartment> findSysDepartmentListByStudentResult(List<SysStudent> pageResult) {
		if(null != pageResult && pageResult.size()>0){
			String queryString = "from SysDepartment where 1=1";
			queryString = queryString + " and (";
			for(int i = 0; i < pageResult.size(); i++){
				if(i != pageResult.size() - 1){
					queryString = queryString + " deptNumber = '"+ pageResult.get(i).getDeptNumber()+"' or ";
				}else{
					queryString = queryString + " deptNumber = '"+ pageResult.get(i).getDeptNumber()+"')";
				}
			}
		    return getHibernateTemplate().find(queryString);
		}else{
			return null;
	    }
	}

	@Override
	public List<SysDepartment> findByExample(SysDepartment model) {
		List<Object> peram = new ArrayList<Object>();
		String queryString = "from SysDepartment where 1=1 ";
		if(StringUtils.isNotEmpty(model.getDeptNumber())){
			queryString = queryString+"and deptNumber=?";
			peram.add(model.getDeptNumber());
		}
		if(StringUtils.isNotEmpty(model.getDeptName())){
			queryString = queryString+"and deptName=?";
			peram.add(model.getDeptName());
		}
		queryString = queryString+" ORDER BY id DESC";
		return super.findByExample(queryString, peram.toArray());
	}

	@Override
	public SysDepartment findSysDepartmentByDeptNumber(String deptNumber) {
		if(StringUtils.isNotEmpty(deptNumber)){
			String queryString = "from SysDepartment where deptNumber='"+deptNumber+" '";
			List<SysDepartment> sysDepartmentList = getHibernateTemplate().find(queryString);
			if(sysDepartmentList != null && sysDepartmentList.size() > 0){
				return sysDepartmentList.get(0);
			}else{
				return null;
			}
		}else{
			return null;
		}
	}

	
}
