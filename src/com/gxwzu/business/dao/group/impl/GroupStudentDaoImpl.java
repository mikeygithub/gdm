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

import com.gxwzu.business.dao.group.IGroupStudentDao;
import com.gxwzu.business.model.group.GroupStudent;
import com.gxwzu.business.model.paln.PlanProgress;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListGroupAllot;
import com.gxwzu.sysVO.ListGroupDefenseDirection;
import com.gxwzu.sysVO.ListGroupStudent;
import com.gxwzu.sysVO.ListGroupTeacher;

@SuppressWarnings("unchecked")
@Repository("groupStudentDao")
public class GroupStudentDaoImpl extends BaseDaoImpl<GroupStudent> implements
		IGroupStudentDao {

	@Override
	public Result<Object> find(ListGroupStudent model, ListGroupAllot groupAllot,int page, int size) {
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		StringBuffer queryString = new StringBuffer("SELECT * FROM (")
				.append("SELECT ")
				.append(" st.*, ")
				.append(" up.userSex,up.userAge,up.userEmail,up.userTel,up.userImg,up.userType, ")
				.append(" sdt.dept_name,scy.category_name,smr.major_name,scs.class_name, ")
				.append(" age.teacher_id ,str.teacher_name ,gtga.id,gtga.group_allot_id, gtga.group_name,gtga.`year`, ")
				.append(" ifo.issue_name ,ifo.issue_type,gtga.group_type ,gtga.defense_teacher_id,rse.reply_score_finish ")
				.append(" FROM sys_student st ")
				.append(" INNER JOIN user_hlep up ON st.user_id = up.id ")
				.append(" LEFT OUTER JOIN sys_department sdt ON st.dept_number = sdt.dept_number ")
				.append(" LEFT OUTER JOIN sys_category scy ON st.category_id = scy.category_id ")
				.append(" LEFT OUTER JOIN sys_major smr ON st.major_id =smr.major_id ")
				.append(" LEFT OUTER JOIN sys_class scs ON st.class_id = scs.class_id ")

				.append(" LEFT OUTER JOIN allot_guide age  ON st.stu_id = age.stu_id ")
				.append(" AND age.`year` =? ")
				.append(" LEFT OUTER JOIN sys_teacher str ON age.teacher_id = str.teacher_id")
				.append(" LEFT OUTER JOIN issue_info ifo ON st.stu_id = ifo.stu_id and   age.`year` = ifo.`year` ")

				.append("LEFT OUTER JOIN ( SELECT ")
				.append(" gst.*, gat.group_name,gat.group_type ")
				.append(" FROM group_student gst,group_allot gat ")
				.append(" WHERE gst.group_allot_id = gat.group_id AND gat.`year` = gst.`year` ")
				.append(" AND gat.group_type =? ")
				.append(" )  as gtga ON st.stu_id = gtga.student_id and gtga.year = age.`year`")
				
				.append(" LEFT OUTER JOIN reply_score rse ON st.stu_id = rse.stu_id and   age.`year` = rse.`year` ")
				
				.append(") AS model WHERE 1 = 1 ")
				.append(" and ISNULL(model.group_allot_id) "); // 未分配分组学生

		params.add(model.getYear()); // 筛选年度
		params.add(model.getGroupType()); // 筛选答辩组类型
		
		if("01".equals(model.getGroupType())){
			queryString.append("  and model.reply_score_finish>=90  "); //筛选成绩大于90分的学生
		}
    	  if(groupAllot!=null){
    		  //与该组答辩方向一致
		    	if(groupAllot.getDirectionList() != null&&groupAllot.getDirectionList().size()!=0){
		    		List<ListGroupDefenseDirection> gl =  groupAllot.getDirectionList();
		    		 queryString.append(" and(");
	              for(int i = 0;i< gl.size();i++){
	            	  queryString.append("model.major_id = ?");
	            	  params.add(gl.get(i).getMajorId());
	            	  if(i!=gl.size()-1){
	            		  queryString.append(" or ");  
	            	  }
	              }
	              queryString.append(") ");
		    	}
		    	//指导教师不为该组成员的学生
		    	if(groupAllot.getTeacherList() != null&groupAllot.getTeacherList().size()!=0){
		    		List<ListGroupTeacher> tl =  groupAllot.getTeacherList();
		    		 queryString.append(" and(");
	              for(int i = 0;i< tl.size();i++){
	            	  queryString.append("model.teacher_id != ?");
	            	  params.add(tl.get(i).getTeacherId());
	            	  if(i!=tl.size()-1){
	            		  queryString.append(" and ");  
	            	  }
	              }
	              queryString.append(") ");
		    	}
		    }

		if (StringUtils.isNotEmpty(model.getStuName())) {
			queryString.append(" and model.stu_name like ? ");
			params.add("%" + model.getStuName() + "%");
		}
		if (StringUtils.isNotEmpty(model.getStuNo())) {
			queryString.append(" and model.stu_no like ? ");
			params.add("%" + model.getStuNo() + "%");
		}
		if (StringUtils.isNotEmpty(model.getDeptNumber())) {
			queryString.append(" and model.dept_number =? ");
			params.add(model.getDeptNumber());
		}
		if (model.getMajorId() != null) {
			queryString.append(" and model.major_id =? ");
			params.add(model.getMajorId());
		}
		if (model.getClassId() != null) {
			queryString.append(" and model.class_id =? ");
			params.add(model.getClassId());
		}
		queryString.append(" ORDER BY model.stu_id DESC ");

		return (Result<Object>) super.findBySQL(queryString.toString(),
				params.toArray(), start, limit);
	}

	/**
	 * 查看学生分组列表
	 * 
	 * @author 黎艺侠
	 */
	@Override
	public Result<Object> findStuGroupList(ListGroupStudent model, int page, int size) {
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		StringBuffer queryString = new StringBuffer("SELECT * FROM (")
				.append("SELECT ")
				.append(" st.*, ")
				.append(" up.userSex,up.userAge,up.userEmail,up.userTel,up.userImg,up.userType, ")
				.append(" sdt.dept_name,scy.category_name,smr.major_name,scs.class_name, ")
				.append(" age.teacher_id ,str.teacher_name ,gst.id,gst.group_allot_id, gat.group_name,gst.`year`, ")
				.append(" ifo.issue_name ,ifo.issue_type,gat.group_type ,gst.defense_teacher_id,rse.reply_score_finish,rse.reply_type")
				.append(" FROM sys_student st ")
				.append(" INNER JOIN user_hlep up ON st.user_id = up.id ")
				.append(" LEFT OUTER JOIN sys_department sdt ON st.dept_number = sdt.dept_number ")
				.append(" LEFT OUTER JOIN sys_category scy ON st.category_id = scy.category_id ")
				.append(" LEFT OUTER JOIN sys_major smr ON st.major_id =smr.major_id ")
				.append(" LEFT OUTER JOIN sys_class scs ON st.class_id = scs.class_id ")
				.append(" LEFT OUTER JOIN allot_guide age ON st.stu_id = age.stu_id ")
				.append(" LEFT OUTER JOIN sys_teacher str ON age.teacher_id = str.teacher_id")
				.append(" LEFT OUTER JOIN group_student gst ON st.stu_id = gst.student_id and age.`year` = gst.`year` ")
				.append(" LEFT OUTER JOIN issue_info ifo ON st.stu_id = ifo.stu_id and   age.`year` = ifo.`year` ")
				.append(" LEFT OUTER JOIN group_allot gat ON gst.group_allot_id = gat.group_id and gst.year = gat.year ")
				.append(" LEFT OUTER JOIN reply_score rse ON st.stu_id = rse.stu_id and   age.`year` = rse.`year` ")
				.append(" WHERE gst.group_allot_id is not null  ")
				.append(") AS model WHERE 1 = 1 ");

		
		if (model.getGroupAllotId() != null) {
			queryString.append(" and model.group_allot_id = ? ");
			params.add(model.getGroupAllotId());
		}
		
		if (model.getDefenseTeacherId()!= null) {
			queryString.append(" and model.defense_teacher_id = ? ");
			params.add(model.getDefenseTeacherId());
		}
		//类型
		if (model.getGroupType()!=null){
			queryString.append(" and model.group_type = ?");
			params.add(model.getGroupType());
		}
		//成绩类型:00答辩成绩,01:大组成绩
		if (model.getGroupType()!=null){
			queryString.append(" and model.reply_type = ?");
			params.add(model.getGroupType());
		}
		
		if (model.getYear() != null) {
			queryString.append(" and model.year = ? ");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.stu_id DESC ");
		System.out.println(queryString);
		return (Result<Object>) super.findBySQL(queryString.toString(), params.toArray(), start, limit);
	}

	@Override
	public List<Object> findByExample(ListGroupStudent model) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer queryString = new StringBuffer("SELECT * FROM (")
				.append("SELECT ")
				.append(" st.*, ")
				.append(" up.userSex,up.userAge,up.userEmail,up.userTel,up.userImg,up.userType, ")
				.append(" sdt.dept_name,scy.category_name,smr.major_name,scs.class_name, ")
				.append(" age.teacher_id ,str.teacher_name ,gst.id,gst.group_allot_id, gat.group_name,gst.`year`, ")
				.append(" ifo.issue_name ,ifo.issue_type,gat.group_type ,gst.defense_teacher_id,rse.reply_score_finish")
				.append(" FROM sys_student st ")
				.append(" INNER JOIN user_hlep up ON st.user_id = up.id ")
				.append(" LEFT OUTER JOIN sys_department sdt ON st.dept_number = sdt.dept_number ")
				.append(" LEFT OUTER JOIN sys_category scy ON st.category_id = scy.category_id ")
				.append(" LEFT OUTER JOIN sys_major smr ON st.major_id =smr.major_id ")
				.append(" LEFT OUTER JOIN sys_class scs ON st.class_id = scs.class_id ")
				.append(" LEFT OUTER JOIN allot_guide age ON st.stu_id = age.stu_id ")
				.append(" LEFT OUTER JOIN sys_teacher str ON age.teacher_id = str.teacher_id")
				.append(" LEFT OUTER JOIN group_student gst ON st.stu_id = gst.student_id and age.`year` = gst.`year` ")
				.append(" LEFT OUTER JOIN issue_info ifo ON st.stu_id = ifo.stu_id and   age.`year` = ifo.`year` ")
				.append(" LEFT OUTER JOIN group_allot gat ON gst.group_allot_id = gat.group_id and gst.year = gat.year ")

				.append(" LEFT OUTER JOIN reply_score rse ON st.stu_id = rse.stu_id and   age.`year` = rse.`year` ")

				.append(" WHERE gst.group_allot_id is not null  ")
				.append(") AS model WHERE 1 = 1 ");

		if (model.getGroupAllotId() != null) {
			queryString.append(" and model.group_allot_id = ? ");
			params.add(model.getGroupAllotId());
		}
		if (StringUtils.isNotEmpty(model.getDeptNumber())) {
			queryString.append(" and model.dept_number =? ");
			params.add(model.getDeptNumber());
		}
		if (model.getGroupType() != null) {
			queryString.append(" and model.group_type =? ");
			params.add(model.getGroupType());
		}
		if (model.getStuId() != null) {
			queryString.append(" and model.stu_id =? ");
			params.add(model.getStuId());
		}

		queryString.append(" ORDER BY model.stu_id DESC ");
		return super.query(queryString.toString(), params.toArray());
	}

	@Override
	public GroupStudent findByStuId(Integer stuId) {
		List<Object> params = new ArrayList<Object>();
		GroupStudent model = null;
		if (stuId != null) {
			String queryString = "from GroupStudent model where model.studentId=?";
			params.add(stuId);
			List<GroupStudent> list = super.findByExample(queryString,
					params.toArray());
			if (list != null && list.size() != 0) {
				model = list.get(0);
			}
		}
		return model;
	}

	@Override
	public Integer delByGroupIdAndYear(final Integer thisId,final Integer year) {
		
		try {
			return getHibernateTemplate().execute(new HibernateCallback<Integer>() {

				@Override
				public Integer doInHibernate(Session arg0) throws HibernateException,
						SQLException {
						Transaction transaction =  arg0.beginTransaction();
						Query  sQuery = arg0.createSQLQuery("delete from group_student where group_allot_id="+thisId +" and year="+year);
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
