package com.gxwzu.system.dao.sysNotice.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.dao.sysClassroom.ISysClassroomDao;
import com.gxwzu.system.dao.sysNotice.ISysNoticeDao;
import com.gxwzu.system.model.sysClassroom.SysClassroom;
import com.gxwzu.system.model.sysNotice.SysNotice;

@SuppressWarnings("unchecked")
@Repository("sysNoticeDao")
public class SysNoticeDaoImpl extends BaseDaoImpl<SysNotice> implements ISysNoticeDao {

	/**
	 * 列表查询
	 * @date 2017.10.3
	 * @author 黎艺侠
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Result<SysNotice> find(SysNotice model, int page, int size) {
		String queryString = "from SysNotice model where 1=1";
		int start = (page - 1) * size;
		int limit = size;
		List params = new ArrayList<Object>();
	
		
		if(model.getNoticeId()!=null){
			queryString=queryString+" and model.noticeId = ? ";
			params.add(model.getNoticeId());
		}
		if(StringUtils.isNotEmpty(model.getNoticeName())){
			queryString=queryString+" and model.noticeName like '%"+model.getNoticeName()+"%' ";
			
		}
		
		if(StringUtils.isNotEmpty(model.getNoticeContent())){
			queryString = queryString + " and noticeContent like '%"+model.getNoticeContent()+"%'";
			
		}
		if(model.getNoticeType()!=null){	
			queryString = queryString +"and noticeType = ? ";
			params.add(model.getNoticeType());
		}
		
		if(model.getDeptNumber()!=null){	
			queryString = queryString +"and deptNumber = ? ";
			params.add(model.getDeptNumber());
		}
		if(model.getUserId()!=null){	
			queryString = queryString +"and userId = ? ";
			params.add(model.getUserId());
		}
		queryString = queryString + "order by noticeTime desc";

		return (Result<SysNotice>) super.find(queryString, params.toArray(),null, start, limit);
   
	}

	@Override
	public SysNotice findById(Integer id) {
		log.debug("findNoticeById : "+id);
		try {
			SysNotice instance = (SysNotice) getHibernateTemplate().get(
					"com.gxwzu.system.model.sysNotice.SysNotice", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
		
		
	}

	@Override
	public List<SysNotice> findByExample(SysNotice model) {
		 List<Object>  params=new ArrayList<Object>();
		 String queryString="from SysNotice model where 1=1";
		
		 
		 if(model.getNoticeId()!=null&&!"".equals(model.getNoticeId())){
			 queryString =queryString+" and model.noticeId=?";
	    	 params.add(model.getNoticeId());
		}
		if(model.getNoticeName()!=null&&!"".equals(model.getNoticeName())){
			queryString=queryString+"and model.noticeName=?";
			params.add(model.getNoticeName());
		}
		
		queryString = queryString+" ORDER BY id DESC";
		return super.findByExample(queryString, params.toArray());
	}

	@Override
	public List<SysNotice> findSysNoticeList() {
		return getAll(SysNotice.class);
	}

	@Override
	public List<SysNotice> findAll(SysNotice model) {
		 List<Object>  params=new ArrayList<Object>();
		 String queryString="from SysNotice model where 1=1";
		 if(model.getMajorId()!=null&&!"".equals(model.getMajorId())){
			 queryString =queryString+" and (model.majorId = ? or model.majorId = -2)";
	    	 params.add(model.getMajorId());
		 }
		queryString = queryString+" ORDER BY id DESC";
		return super.findByExample(queryString, params.toArray());
	}

	/**
	 * 查询最新的公告
	 * @param model
	 * @param newNum
	 * @return
	 */
	@Override
	public List<SysNotice> findByMostNew(SysNotice model,Integer newNum) {

        Session session = super.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(SysNotice.class);

		List<SysNotice> list = null;
		if (model!=null&&model.getMajorId()!=null) {
			list = criteria.add(
					Restrictions.or(
							Restrictions.eq("majorId", model.getMajorId()),
							Restrictions.eq("majorId", -2)))
					.setFirstResult(1)
					.setMaxResults(10).addOrder(Order.desc("noticeTime")).list();
		}else {
			list = criteria.setFirstResult(1).setMaxResults(10).addOrder(Order.desc("noticeTime")).list();
		}
		session.close();
		return list;
	}


}
