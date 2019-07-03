package com.gxwzu.business.dao.group.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.group.IGroupAllotDao;
import com.gxwzu.business.model.group.GroupAllot;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;

/**
 * 分组DAOIMPL实现类
 * 
 */
@SuppressWarnings("unchecked")
@Repository("groupAllotDao")
public class GroupAllotDaoImpl extends BaseDaoImpl<GroupAllot> implements
		IGroupAllotDao {

	@Override
	public GroupAllot findById(Integer id) {
		try {
			GroupAllot instance = (GroupAllot) getHibernateTemplate().get(
					"com.gxwzu.business.model.group.GroupAllot", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@Override
	public Result<Object> find(GroupAllot model, int page, int size) {
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		StringBuffer queryString = new StringBuffer(" SELECT * from( ");
		queryString.append(" SELECT gt.*,dt.dept_name,cm.classroom_name,")
		.append(" IFNULL(gptr.teacher_num,0) as teacher_num,IFNULL(gpsr.student_num,0)as student_num  ")
		.append(" FROM  group_allot gt  ")
		.append(" LEFT JOIN sys_department dt ON dt.dept_number = gt.dept_number ")
		.append(" LEFT JOIN sys_classroom cm ON cm.id = gt.classRoom_id ")
		.append(" LEFT JOIN ( ")
		.append(" SELECT group_allot_id,year,COUNT(*)AS teacher_num   ")
		.append(" FROM group_teacher  GROUP BY group_allot_id DESC ")
		.append(" ) gptr  ON gt.group_id = gptr.group_allot_id AND gt.`year` = gptr.`year` ")
		.append(" LEFT JOIN ( ")
		.append(" SELECT group_allot_id,year,COUNT(*)AS student_num   ")
		.append(" FROM group_student  GROUP BY group_allot_id DESC)  ")
		.append(" gpsr  ON gt.group_id = gpsr.group_allot_id AND gt.`year` = gpsr.`year` ")
		.append(" )as model where 1=1 ");
				 
		
		if (StringUtils.isNotEmpty(model.getDeptNumber())) {
			queryString.append(" and model.dept_number = ? ");
			params.add(model.getDeptNumber());
		}
		if (model.getGroupType()!= null) {
			queryString.append(" and model.group_type = ? ");
			params.add(model.getGroupType());
		}
		if (model.getYear() != null) {
			queryString.append(" and model.year = ? ");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.group_id DESC ");

		return super.findBySQL(queryString.toString(), params.toArray(),start, limit);
	}

	/**
	 * 查询分组列表
	 * 
	 */
	@Override
	public List<GroupAllot> finAllGroupAllotList() {
		return getAll(GroupAllot.class);
	}

	@Override
	public List<Object> findByExample(GroupAllot model) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer queryString = new StringBuffer(" SELECT * from( ");
		queryString.append(" SELECT gt.*,dt.dept_name,cm.classroom_name,")
		.append(" IFNULL(gptr.teacher_num,0) as teacher_num,IFNULL(gpsr.student_num,0)as student_num  ")
		.append(" FROM  group_allot gt  ")
		.append(" LEFT JOIN sys_department dt ON dt.dept_number = gt.dept_number ")
		.append(" LEFT JOIN sys_classroom cm ON cm.id = gt.classRoom_id ")
		.append(" LEFT JOIN ( ")
		.append(" SELECT group_allot_id,year,COUNT(*)AS teacher_num   ")
		.append(" FROM group_teacher  GROUP BY group_allot_id DESC ")
		.append(" ) gptr  ON gt.group_id = gptr.group_allot_id AND gt.`year` = gptr.`year` ")
		.append(" LEFT JOIN ( ")
		.append(" SELECT group_allot_id,year,COUNT(*)AS student_num   ")
		.append(" FROM group_student  GROUP BY group_allot_id DESC)  ")
		.append(" gpsr  ON gt.group_id = gpsr.group_allot_id AND gt.`year` = gpsr.`year` ")
		.append(" )as model where 1=1 ");
				 
		if (model.getGroupId()!= null) {
			queryString.append(" and model.group_id = ? ");
			params.add(model.getGroupId());
		}
		
		if (StringUtils.isNotEmpty(model.getDeptNumber())) {
			queryString.append(" and model.dept_number = ? ");
			params.add(model.getDeptNumber());
		}
		if (model.getGroupType()!= null) {
			queryString.append(" and model.group_type = ? ");
			params.add(model.getGroupType());
		}
		if (model.getYear() != null) {
			queryString.append(" and model.year = ? ");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.group_id DESC ");
		return super.query(queryString.toString(), params.toArray());
	}

}
