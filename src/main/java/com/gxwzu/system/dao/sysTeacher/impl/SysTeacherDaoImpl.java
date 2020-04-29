package com.gxwzu.system.dao.sysTeacher.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.dao.sysTeacher.ISysTeacherDao;
import com.gxwzu.system.model.sysTeacher.SysTeacher;

/**
 * 教师DAOIMPL实现类
 * 
 * @author俸捷
 * 
 */
@SuppressWarnings("unchecked")
@Repository("sysTeacherDao")
public class SysTeacherDaoImpl extends BaseDaoImpl<SysTeacher> implements
		ISysTeacherDao {

	
	@Override
	public Result<Object> find(SysTeacher model, int page, int size) {
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		StringBuffer queryString = new StringBuffer("SELECT * FROM (")
				.append("SELECT ")
				.append(" st.*,up.userSex,up.userAge,up.userEmail,up.userTel,up.userImg,up.userType, ")
				.append(" sdt.dept_name,scy.category_name,smr.staff_name,stl.technical_name,sds.duties_name")
				.append(" FROM sys_teacher st ")
				.append(" INNER JOIN user_hlep up ON st.user_id = up.id ")
				.append(" LEFT JOIN sys_department sdt ON st.dept_number = sdt.dept_number ")
				.append(" LEFT OUTER JOIN sys_category scy ON st.category_id = scy.category_id ")
				.append(" LEFT OUTER JOIN sys_major smr ON st.staffroom_id = smr.major_id ")
				.append(" LEFT OUTER JOIN sys_technical stl ON st.technical_id = stl.technical_id ")
				.append(" LEFT OUTER JOIN sys_duties sds ON st.duties_no = sds.duties_id ")
				.append(") AS model WHERE 1 = 1 ");

		if (StringUtils.isNotEmpty(model.getTeacherNo())) {
			queryString.append(" and model.teacher_no like ?");
			params.add("%" + model.getTeacherNo() + "%");
		}
		if (StringUtils.isNotEmpty(model.getDeptNumber())) {
			queryString.append(" and model.dept_number=?");
			params.add(model.getDeptNumber());
		}
		if (model.getCategoryId() != null) {
			queryString.append(" and model.category_id = ? ");
			params.add(model.getCategoryId() );
		}
		if (model.getStaffroomId() != null) {
			queryString.append(" and model.staffroom_id = ? ");
			params.add(model.getStaffroomId() );
		}
		if (StringUtils.isNotEmpty(model.getTeacherName())) {
			queryString.append(" and model.teacher_name like ? ");
			params.add("%" + model.getTeacherName() + "%");
		}

		queryString.append(" ORDER BY model.teacher_id DESC ");
		return super.findBySQL(queryString.toString(), params.toArray(), start,
				limit);
	}

	@Override
	public SysTeacher findById(Integer id) {
		try {
			SysTeacher instance = (SysTeacher) getHibernateTemplate().get(
					"com.gxwzu.system.model.sysTeacher.SysTeacher", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	@Override
	public List<Object> findByExample(SysTeacher model) {

		List<Object> params = new ArrayList<Object>();
		StringBuffer queryString = new StringBuffer("SELECT * FROM (")
		.append("SELECT ")
		.append(" st.*,up.userSex,up.userAge,up.userEmail,up.userTel,up.userImg,up.userType, ")
		.append(" sdt.dept_name,scy.category_name,smr.staff_name,stl.technical_name,sds.duties_name,up.sign")
		.append(" FROM sys_teacher st ")
		.append(" INNER JOIN user_hlep up ON st.user_id = up.id ")
		.append(" LEFT JOIN sys_department sdt ON st.dept_number = sdt.dept_number ")
		.append(" LEFT OUTER JOIN sys_category scy ON st.category_id = scy.category_id ")
		.append(" LEFT OUTER JOIN sys_major smr ON st.staffroom_id =smr.major_id ")
		.append(" LEFT OUTER JOIN sys_technical stl ON st.technical_id = stl.technical_id ")
		.append(" LEFT OUTER JOIN sys_duties sds ON st.duties_no = sds.duties_id ")
		.append(") AS model WHERE 1 = 1 ");

		if (model.getTeacherId() != null) {
			queryString.append(" and model.teacher_id=?");
			params.add(model.getTeacherId());
		}
		if (StringUtils.isNotEmpty(model.getTeacherNo())) {
			queryString.append(" and model.teacher_no=?");
			params.add(model.getTeacherNo());
		}
		if (model.getCategoryId() != null) {
			queryString.append(" and model.category_id = ? ");
			params.add(model.getCategoryId() );
		}
		if (model.getStaffroomId() != null) {
			queryString.append(" and model.staffroom_id = ? ");
			params.add(model.getStaffroomId() );
		}
		if (StringUtils.isNotEmpty(model.getTeacherName())) {
			queryString.append(" and model.teacher_name =? ");
			params.add(model.getTeacherName());
		}
		queryString.append(" ORDER BY model.teacher_id DESC ");

		return super.query(queryString.toString(), params.toArray());
	}

	/**
	 * 查询指导老师通过老师职工号
	 * 
	 * @author 何金燕
	 * @date 2017.7.15
	 * @param teacherId
	 */
	@Override
	public SysTeacher findTeacherByTeacherId(String teacherId) {
		List<Object> params = new ArrayList<Object>();
		SysTeacher model = null;
		if (StringUtils.isNotEmpty(teacherId)) {
			String queryString = "from SysTeacher model where model.teacherId=?";
			params.add(teacherId);

			List<SysTeacher> list = super.findByExample(queryString,
					params.toArray());
			if (list != null && list.size() != 0) {
				model = list.get(0);
			}
		}

		return model;
	}

	@Override
	public SysTeacher findTeacherByUserId(Integer userId) {
		Session session = this.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(SysTeacher.class);
		List<SysTeacher> teacher = criteria.add(Restrictions.eq("userId", userId)).list();
		session.close();
		return teacher.get(0);
	}

}
