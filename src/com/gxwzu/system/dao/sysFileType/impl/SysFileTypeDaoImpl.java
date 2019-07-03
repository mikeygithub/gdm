package com.gxwzu.system.dao.sysFileType.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.dao.sysDuties.ISysDutiesDao;
import com.gxwzu.system.dao.sysFileType.ISysFileTypeDao;
import com.gxwzu.system.model.sysDepartment.SysDepartment;
import com.gxwzu.system.model.sysDuties.SysDuties;
import com.gxwzu.system.model.sysFileType.SysFileType;
import com.gxwzu.system.model.sysTechnical.SysTechnical;

@SuppressWarnings("unchecked")
@Repository("SysFileTypeDao")
public class SysFileTypeDaoImpl extends BaseDaoImpl<SysFileType>implements ISysFileTypeDao{

	@Override
	public Result<SysFileType> find(SysFileType model, int page, int size) {
	String queryString = "from SysFileType model where 1=1";
	int start = (page - 1) * size;
	int limit = size;
	List params = new ArrayList<Object>();
	if(model.getFileName()!=null){
		queryString=queryString+"and model.fileName=?";
		params.add(model.getFileName());
	}
	  queryString = queryString+"ORDER BY fileId DESC";
	return (Result<SysFileType>) super.find(queryString, params.toArray(),null, start, limit);
	}

	@Override
	public SysFileType findById(Integer id) {
		log.debug("############ " + id);
		try {
			SysFileType instance = (SysFileType) getHibernateTemplate().get(
					"com.gxwzu.system.model.sysFileType.SysFileType", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@Override
	public List<SysFileType> findByExample(SysFileType model) {
		 List<Object> params = new ArrayList<Object>();
	        String queryString = "from SysFileType model where 1=1";
	        if(model.getFileId()!=null){
	        	queryString = queryString+"and model.fileId =?";
	        	params.add(model.getFileId());
	        }
	        if(model.getFileTypeNo()!=null){
	        	queryString = queryString+"and model.fileTypeNo =?";
	        	params.add(model.getFileTypeNo());
	        }
	        if(model.getFileName()!=null&&!"".equals(model.getFileName())){
	        queryString = queryString+"and model.fileName=?";
	        params.add(model.getFileName());
	        }
	        queryString = queryString+"ORDER BY fileId DESC";
			return super.findByExample(queryString, params.toArray());
	}

	@Override
	public List<SysFileType> findAllSysFileTypeList(String fileId) {
		if(null != fileId && !"".equals(fileId)) {
			String queryString = "from  SysFileType  where fileId='"+fileId+"'";
			return getHibernateTemplate().find(queryString);
		}else{
			String queryString = "from SysFileType where 1!=1";
			return getHibernateTemplate().find(queryString);
		}
	}

}
