package com.gxwzu.business.dao.group.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.formula.functions.T;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.group.IGroupDefenseDirectionDao;
import com.gxwzu.business.model.group.GroupDefenseDirection;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;

@SuppressWarnings("unchecked")
@Repository("groupDefenseDirectionDao")
public class GroupDefenseDirectionDaoImpl extends
		BaseDaoImpl<GroupDefenseDirection> implements IGroupDefenseDirectionDao {

	@Override
	public Result<Object> find(GroupDefenseDirection model, int page, int size) {
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		StringBuffer queryString = new StringBuffer("SELECT * FROM (")
				.append("SELECT ")
				.append(" gdd.*,scy.major_name,scy.staff_name")
				.append(" FROM group_defense_direction gdd ")
				.append(" LEFT  JOIN sys_major scy ON gdd.major_id = scy.major_id ")
				.append(") AS model WHERE 1 = 1 ");

		if (model.getGroupAllotId() != null) {
			queryString.append(" and model.group_allot_id =? ");
			params.add(model.getGroupAllotId());
		}
		if (model.getMajorId() != null) {
			queryString.append(" and model.major_id =? ");
			params.add(model.getMajorId());
		}

		if (model.getYear() != null) {
			queryString.append(" and model.year =? ");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.id DESC ");

		return (Result<Object>) super.findBySQL(queryString.toString(),
				params.toArray(), start, limit);
	}

	@Override
	public List<Object> findByExample(GroupDefenseDirection model) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer queryString = new StringBuffer("SELECT * FROM (")
				.append("SELECT ")
				.append(" gdd.*,scy.major_name,scy.staff_name")
				.append(" FROM group_defense_direction gdd ")
				.append(" LEFT JOIN sys_major scy ON gdd.major_id = scy.major_id ")
				.append(") AS model WHERE 1 = 1 ");

		if (model.getGroupAllotId() != null) {
			queryString.append(" and model.group_allot_id =? ");
			params.add(model.getGroupAllotId());
		}
		if (model.getMajorId() != null) {
			queryString.append(" and model.major_id =? ");
			params.add(model.getMajorId());
		}

		if (model.getYear() != null) {
			queryString.append(" and model.year =? ");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.id DESC ");
		return super.query(queryString.toString(), params.toArray());
	}

	@Override
	public Integer delByGroupIdAndYear(final Integer thisId, final Integer year) {

		try {
			return getHibernateTemplate().execute(
					new HibernateCallback<Integer>() {

						@Override
						public Integer doInHibernate(Session arg0)
								throws HibernateException, SQLException {
							Transaction transaction = arg0.beginTransaction();
							Query sQuery = arg0
									.createSQLQuery("delete from group_defense_direction where group_allot_id="
											+ thisId + " and year=" + year);
							int count = sQuery.executeUpdate();
							transaction.commit();
							return count;
						}
					});
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public List<Object> findMajorCountByGroupIdAndYear(Integer groupAllotId,
			Integer year) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer queryString = new StringBuffer("SELECT * FROM ( ")
				.append(" SELECT newT.id,newT.group_allot_id,newT.major_id,newT.year,newT.major_name,newT.staff_name,COUNT(group_student_id)as majorNum from( ")
				.append(" SELECT gdd.*,dn.group_student_id,sr.major_name,sr.staff_name FROM group_defense_direction  gdd  LEFT JOIN ")
				.append(" (SELECT gst.id as group_student_id,gst.group_allot_id,st.major_id ")
				.append(" FROM group_student gst,sys_student st ")
				.append(" WHERE  gst.student_id = st.stu_id ) dn ")
				.append("  ON dn.major_id = gdd.major_id AND gdd.group_allot_id=dn.group_allot_id ")
				.append(" LEFT JOIN sys_major sr on sr.major_id = gdd.major_id  ")
				.append(" )as newT WHERE newT.group_allot_id=? GROUP BY newT.major_id DESC )as model  where 1=1 ");
		params.add(groupAllotId);

		if (year != null) {
			queryString.append(" and model.year =? ");
			params.add(year);
		}
		queryString.append(" ORDER BY model.id DESC ");
		return super.query(queryString.toString(), params.toArray());
	}

}
