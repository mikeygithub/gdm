package com.gxwzu.system.dao.sysDirections.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.dao.sysDirections.ISysDirectionsDao;
import com.gxwzu.system.model.sysDirections.SysDirections;

@SuppressWarnings("unchecked")
@Repository("sysDirectionsDao")
public class SysDirectionsDaoImpl extends BaseDaoImpl<SysDirections> implements ISysDirectionsDao{

	@Override
	public Result<SysDirections> find(SysDirections model, int page, int size) {
		String queryString = "from SysDirections model where 1=1";
        int start = (page-1)*size;
        int limit = size;
        List<Object> params = new ArrayList<Object>();
        logger.info("到这里了"+model);
        if(model.getDirectionsId()!=null){
        	queryString = queryString+"and model.directionsId like '%"+model.getDirectionsId()+"%'";
        }
        if(model.getDirectionsName()!=null){
        	queryString = queryString+"and model.directionsName like '%"+model.getDirectionsName()+"%'";
        }
        logger.info("研究方向名称"+queryString);
        queryString = queryString + "ORDER BY model.directionsId DESC";
		return (Result<SysDirections>) super.find(queryString, params.toArray(), null, start, limit);
	}

	@Override
	public SysDirections findById(Integer id) {
		 log.debug("#######"+id);
	        try {
	        	SysDirections instance = (SysDirections)getHibernateTemplate().get(
						"com.gxwzu.system.model.sysDirections.SysDirections", id);
				return instance;
			} catch (RuntimeException re) {
	            log.error("get failed", re);
	            throw re;
			}
			
		}

	/**
	 *  查重
	 */
	@Override
	public List<SysDirections> findByExample(SysDirections model) {
		List<Object> params = new ArrayList<Object>();
        String queryString = "from SysDirections model where 1=1";
        
        if(model.getDirectionsId()!=null){
            queryString = queryString+"and model.directionsId=?";
            params.add(model.getDirectionsId());
            }
        if(StringUtils.isNotEmpty(model.getDirectionsName())){
            queryString = queryString+"and model.directionsName=?";
            params.add(model.getDirectionsName());
            }
        queryString = queryString+"ORDER BY model.directionsId DESC";
		return super.findByExample(queryString, params.toArray());
	}

}
