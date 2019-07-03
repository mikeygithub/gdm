package com.gxwzu.business.dao.group.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.group.IGroupTeacherDao;
import com.gxwzu.business.model.group.GroupTeacher;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListGroupTeacher;

@SuppressWarnings("unchecked")
@Repository("groupTeacherDao")
public class GroupTeacherDaoImpl extends BaseDaoImpl<GroupTeacher> implements
		IGroupTeacherDao {
	/**
	 * 按条件查找已选教师信息
	 * 
	 * @return
	 */
	@Override
	public GroupTeacher findById(Integer id) {
		try {
			GroupTeacher instance = (GroupTeacher) getHibernateTemplate().get(
					"com.gxwzu.business.model.group.GroupTeacher", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@Override
	public Result<Object> find(ListGroupTeacher model, int page, int size) {
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		StringBuffer queryString = new StringBuffer("SELECT * FROM (")
				.append("SELECT ")
				.append(" st.*,up.userSex,up.userAge,up.userEmail,up.userTel,up.userImg,up.userType, ")
				.append(" sdt.dept_name,scy.category_name,smr.staff_name,stl.technical_name ,")
				.append(" gtga.id,gtga.group_allot_id,gtga.group_name as groupName,gtga.type as teacherType,gtga.`year`,gtga.group_type")
				.append(" FROM sys_teacher st ")
				.append(" INNER JOIN user_hlep up ON st.user_id = up.id ")
				.append(" LEFT JOIN sys_department sdt ON st.dept_number = sdt.dept_number ")
				.append(" LEFT OUTER JOIN sys_category scy ON st.category_id = scy.category_id ")
				.append(" LEFT OUTER JOIN sys_major smr ON st.staffroom_id =smr.major_id ")
				.append(" LEFT OUTER JOIN sys_technical stl ON st.technical_id = stl.technical_id ")
				
				.append("LEFT JOIN ( SELECT ")
				.append(" gtr.*, gat.group_name,gat.group_type ")
				.append(" FROM group_teacher gtr,group_allot gat ")
				.append(" WHERE gtr.group_allot_id = gat.group_id AND gat.`year` = gtr.`year` ")
				.append(" AND gat.`year` =? ")
				.append(" AND gat.group_type =? ")
				.append(" )  as gtga ON st.teacher_id = gtga.teacher_id ")
				.append(") AS model WHERE 1 = 1 ");

		params.add(model.getYear()); // 筛选年度
		params.add(model.getGroupType()); // 筛选答辩组类型
		if (model.getGroupAllotId() != null) {
			queryString.append(" and model.group_allot_id = ?");
			params.add(model.getGroupAllotId());
		}
		if (StringUtils.isNotEmpty(model.getTeacherNo())) {
			queryString.append(" and model.teacher_no = ?");
			params.add("%" + model.getTeacherNo() + "%");
		}

		if (StringUtils.isNotEmpty(model.getDeptNumber())) {
			queryString.append(" and model.dept_number = ?");
			params.add(model.getDeptNumber());
		}
		if (model.getCategoryId() != null) {
			queryString.append(" and model.category_id = ?");
			params.add(model.getCategoryId());
		}
		if (model.getStaffroomId() != null) {
			queryString.append(" and model.staffroom_id = ?");
			params.add(model.getStaffroomId());
		}
		
		if (StringUtils.isNotEmpty(model.getTeacherName())) {
			queryString.append(" and model.teacher_name like ? ");
			params.add("%" + model.getTeacherName() + "%");
		}
		
		queryString
		.append(" ORDER BY category_name is not null and category_name!='' desc,convert(category_name using gbk)  ASC");
		
		return (Result<Object>) super.findBySQL(queryString.toString(),
				params.toArray(), start, limit);
	}

	@Override
	public List<Object> findByExample(ListGroupTeacher model) {
		
		List<Object> params = new ArrayList<Object>();
		StringBuffer queryString = new StringBuffer("SELECT * FROM (")
				.append("SELECT ")
				.append(" st.*,up.userSex,up.userAge,up.userEmail,up.userTel,up.userImg,up.userType, ")
				.append(" sdt.dept_name,scy.category_name,smr.staff_name,stl.technical_name ,")
				.append(" gtr.id,gtr.group_allot_id,gat.group_name as groupName,gtr.type as teacherType,gtr.`year`,gat.group_type")
				.append(" FROM   group_teacher gtr  ")
				.append(" LEFT  JOIN sys_teacher st ON st.teacher_id = gtr.teacher_id ")
				.append(" LEFT  JOIN user_hlep up ON st.user_id = up.id ")
				.append(" LEFT JOIN sys_department sdt ON st.dept_number = sdt.dept_number ")
				.append(" LEFT OUTER JOIN sys_category scy ON st.category_id = scy.category_id ")
				.append(" LEFT OUTER JOIN sys_major smr ON st.staffroom_id =smr.major_id ")
				.append(" LEFT OUTER JOIN sys_technical stl ON st.technical_id = stl.technical_id ")
				.append(" LEFT OUTER JOIN group_allot gat ON gtr.group_allot_id = gat.group_id and gtr.year = gat.year ")
				.append(") AS model WHERE 1 = 1 ");
		

		if (model.getGroupAllotId() != null) {
			queryString.append(" and model.group_allot_id = ? ");
			params.add(model.getGroupAllotId());
		}

		if (model.getTeacherId() != null) {
			queryString.append(" and model.teacher_id = ? ");
			params.add(model.getTeacherId());
		}
		if (model.getType() != null) {
			queryString.append(" and model.teacherType = ? ");
			params.add(model.getType());
		}
		if (model.getGroupType() != null) {
			queryString.append(" and model.group_type = ? ");
			params.add(model.getGroupType());
		}
		
		if (model.getYear() != null) {
			queryString.append(" and model.year = ? ");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY  model.id  DESC ");

		return super.query(queryString.toString(), params.toArray());
	}

	@Override
	public Integer delByGroupIdAndYear(final Integer thisId,final Integer year) {
		
		try {
			return getHibernateTemplate().execute(new HibernateCallback<Integer>() {

				@Override
				public Integer doInHibernate(Session arg0) throws HibernateException,
						SQLException {
						Transaction transaction =  arg0.beginTransaction();
						Query  sQuery = arg0.createSQLQuery("delete from group_teacher where group_allot_id="+thisId +" and year="+year);
						int count = sQuery.executeUpdate();
						transaction.commit();
						return count;
				}
			});
		} catch (Exception e) {
			e.printStackTrace();
			return 0 ;
		}
	}
}
