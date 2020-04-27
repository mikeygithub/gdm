package com.gxwzu.system.dao.sysMajor.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.model.teacherMajor.TeacherMajor;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListStudent;
import com.gxwzu.system.dao.sysMajor.ISysMajorDao;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysMajor.SysMajor;

@SuppressWarnings("unchecked")
@Repository("sysMajorDao")
public class SysMajorDaoImpl extends BaseDaoImpl<SysMajor>implements ISysMajorDao{
	
	/**
	 * 专业列表
	 */
	 @Override
	public Result<SysMajor> find(SysMajor model, int page, int row) {
		int start=(page-1)*row;
		int limit =row;	
		String queryString = "from SysMajor model where 1=1";
		List<Object> params = new ArrayList<Object>();
		
		if(StringUtils.isNotEmpty(model.getDeptNumber())){
			queryString = queryString + " and model.deptNumber =?";
			params.add(model.getDeptNumber());
		}
		if(StringUtils.isNotEmpty(model.getMajorNo())){
			queryString = queryString + " and model.majorNo like ?";
			params.add("%"+model.getMajorNo()+"%");
		}
		if(model.getCategoryId()!=null){
			queryString=queryString+"and model.categoryId=?";
			params.add(model.getCategoryId());
		}
		if(StringUtils.isNotEmpty(model.getMajorName())){
			queryString = queryString + " and model.majorName like ?";
			params.add("%"+model.getMajorName()+"%");
		}
		queryString = queryString+" ORDER BY model.majorId DESC";
		return super.find(queryString, params.toArray(), null, start, limit);
	}

	@Override
	public SysMajor findById(Integer id) {
		try {
			SysMajor instance = (SysMajor) getHibernateTemplate().get(
					"com.gxwzu.system.model.sysMajor.SysMajor", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@Override
	public List<SysMajor> findAllSysMajorList() {
		String queryString="from SysMajor where 1=1 ";
     	return getHibernateTemplate().find(queryString);
	}

	/**
	 * 通过StudentResult（学生结果集）查询专业信息存入列表
	 * @param data
	 * @author 黎艺侠
	 * @data 2017.7.9
	 */
	@Override
	public List<SysMajor> findSysMajorListByStudentResult(List<ListStudent> pageResult) {
		if(null != pageResult && pageResult.size()>0){
			String queryString = "from SysMajor where 1=1";
			queryString = queryString + " and (";
			for(int i = 0; i < pageResult.size(); i++){
				if(i != pageResult.size() - 1){
					queryString = queryString + " majorId = '"+ pageResult.get(i).getMajorId()+"' or ";
				}else{
					queryString = queryString + " majorId = '"+ pageResult.get(i).getMajorId()+"')";
				}
			}
		    return getHibernateTemplate().find(queryString);
		}else{
			return null;
	    }
	}

	/**
	 * 查找所有的专业信息
	 * @author hjy
	 * @date 2017.7.10
	 */
	@Override
	public List<SysMajor> findAllsysMajorList() {
		return getAll(SysMajor.class);
	}
	
	/**
	 * 对专业编号和名称查重
	 *  @author hjy
	 *   @date 2017.7.10
	 */
	@Override
	public List<SysMajor> findByExample(SysMajor model) {
		 List<Object>  params=new ArrayList<Object>();
		  String queryString="from SysMajor model where 1=1";
		  if(StringUtils.isNotEmpty(model.getMajorNo())){
				 queryString =queryString+" and model.majorNo=?";
		    	 params.add(model.getMajorNo());
			}
			if(model.getMajorName()!=null&&!"".equals(model.getMajorName())){
				queryString=queryString+"and model.majorName=?";
				params.add(model.getMajorName());
			}
			if(StringUtils.isNotEmpty(model.getStaffName())){
				queryString=queryString+"and model.staffName=?";
				params.add(model.getStaffName());
			}
			if(StringUtils.isNotEmpty(model.getDeptNumber())){
				queryString=queryString+"and model.deptNumber=?";
				params.add(model.getDeptNumber());
			}
			
			if(model.getCategoryId()!=null){
				queryString=queryString+"and model.categoryId=?";
				params.add(model.getCategoryId());
			}
			queryString = queryString+" ORDER BY majorId DESC";
			return super.findByExample(queryString, params.toArray());
	}
	
	@Override
	public SysMajor findByMajorNo(String majorNo) {
		 List<Object>  params=new ArrayList<Object>();
		  SysMajor model = null;
		  if(StringUtils.isNotEmpty(majorNo)){
			  String queryString="from SysMajor model where model.majorNo=?";
		    	 params.add(majorNo);
		    	 
		       List<SysMajor> list = super.findByExample(queryString, params.toArray());	 
		        if(list!=null&&list.size()!=0){
		    	   model = list.get(0);
		       }
	 	   }
		  
		return model;
	}
	
	
	@Override
	public List<SysMajor> findSysMajorListByTeacherMajorList(List<TeacherMajor> teacherMajorList) {
		if(null != teacherMajorList && teacherMajorList.size()>0){
			String queryString = "from SysMajor where 1=1";
			queryString = queryString + " and (";
			for(int i = 0; i<teacherMajorList.size(); i++){
				if(i != teacherMajorList.size()-1){
					queryString = queryString + "id = '"+teacherMajorList.get(i).getMajorId()+"' or ";
				}else{
					queryString = queryString + "id = '"+teacherMajorList.get(i).getMajorId()+"')";
				}
			}
			return getHibernateTemplate().find(queryString);
		}else{
			String queryString = "from SysMajor where 0=1";
			return getHibernateTemplate().find(queryString);
		}
	}

	/**
	 * 通过院系id查找专业
	 * @param deptNumber
	 * @return
	 */
	@Override
	public List<SysMajor> findSysMajorListByDeptNumber(String deptNumber) {
		if(null != deptNumber && !"".equals(deptNumber)) {
			String queryString = "from  SysMajor  where deptNumber='"+deptNumber+"'";
			return getHibernateTemplate().find(queryString);
		}else{
			String queryString = "from SysMajor where 1!=1";
			return getHibernateTemplate().find(queryString);
		}
	}


@Override
public SysMajor findSysMajorByMajorName(String majorName) {
	 List<Object>  params=new ArrayList<Object>();
	  SysMajor model = null;
	  if(StringUtils.isNotEmpty(majorName)){
		  String queryString="from SysMajor model where model.majorName=?";
	    	 params.add(majorName);
	    	 
	       List<SysMajor> list = super.findByExample(queryString, params.toArray());	 
	        if(list!=null&&list.size()!=0){
	    	   model = list.get(0);
	       }
	   }
	return model;
}

@Override
public List<SysMajor> findByDeptNumber(String deptNumber) {
	List<SysMajor> sysMajorList=new ArrayList<SysMajor>();
	List<Object>  params=new ArrayList<Object>();
	  if(StringUtils.isNotEmpty(deptNumber)){
		  String queryString="from SysMajor model where model.deptNumber=?";
	    	 params.add(deptNumber);
	    	 sysMajorList= super.findByExample(queryString, params.toArray());	 
	   }
	return sysMajorList;
}
/**
 * 通过院系查找专业列表
 */
@Override
public List<SysMajor> findSysMajorListBySysDepartmentList(List<SysDepartment> sysDepartmentList) {
	if(null != sysDepartmentList && sysDepartmentList.size()>0){
		String queryString = "from SysMajor where 1=1";
		queryString = queryString + " and (";
		for(int i = 0; i<sysDepartmentList.size(); i++){
			if(i != sysDepartmentList.size()-1){
				queryString = queryString + "deptNumber = '"+sysDepartmentList.get(i).getDeptNumber()+"' or ";
			}else{
				queryString = queryString + "deptNumber = '"+sysDepartmentList.get(i).getDeptNumber()+"')";
			}
		}
		return getHibernateTemplate().find(queryString);
	}else{
		String queryString = "from SysMajor where 0=1";
		return getHibernateTemplate().find(queryString);
	}
}

@Override
public SysMajor findByStaffName(String staffName) {
	 List<Object>  params=new ArrayList<Object>();
	  SysMajor model = null;
	  if(StringUtils.isNotEmpty(staffName)){
		  String queryString="from SysMajor model where model.staffName=?";
	    	 params.add(staffName);
	    	 
	       List<SysMajor> list = super.findByExample(queryString, params.toArray());	 
	        if(list!=null&&list.size()!=0){
	    	   model = list.get(0);
	       }
	   }
	return model;
}

}

