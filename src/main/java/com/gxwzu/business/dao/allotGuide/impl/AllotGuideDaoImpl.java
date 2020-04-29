package com.gxwzu.business.dao.allotGuide.impl;

import java.util.ArrayList;
import java.util.List;

import com.gxwzu.core.util.SysConstant;
import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.allotGuide.IAllotGuideDao;
import com.gxwzu.business.model.allotGuide.AllotGuide;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.util.GeneralUtil;
import com.gxwzu.sysVO.ListStudentAllotGuide;
import com.gxwzu.sysVO.ListTeacherGuideCount;
/**
 * 指导分配DAOIMPL实现类
 * @author黎艺侠
 * @date 2017.7.10
 */
@SuppressWarnings("unchecked")
@Repository("allotGuideDao")
public class AllotGuideDaoImpl extends BaseDaoImpl<AllotGuide> implements IAllotGuideDao{

	/**
	 * 指导老师分配显示列表
	 * @return
	 */
	@Override
	public Result<AllotGuide> find(AllotGuide model, int page, int size) {
		String queryString = "from AllotGuide model where 1=1";
		
		int start = (page - 1) * size;
		int limit = size;
		List params = new ArrayList<Object>();
		logger.info("到这里了"+model);
		queryString = queryString + " ORDER BY model.id DESC";
		return (Result<AllotGuide>) super.find(queryString, params.toArray(),null, start, limit);
	}

	/**
	 * 指导老师分配显示列表
	 * @return
	 */
	@Override
	public List<AllotGuide> findByExample(AllotGuide model) {
		StringBuffer queryString = new StringBuffer( "from AllotGuide model where 1=1");
		List<Object> params = new ArrayList<Object>();
		
		if(model.getId()!=null){
			queryString.append("and model.id=?");
			params.add(model.getId());
		}
		if(model.getTeacherId()!=null){
			queryString.append("and model.teacherId=?");
			params.add(model.getTeacherId());
		}
		if(model.getStuId()!=null){
			queryString.append("and model.stuId=?");
			params.add(model.getStuId());
		}
		if(model.getYear()!=null){
			queryString.append("and model.year=?");
			params.add(model.getYear());
		}
		queryString.append("ORDER BY model.id DESC");
		return (List<AllotGuide>) super.findByExample(queryString.toString(), params.toArray());
	}

	@Override
	public AllotGuide findById(Integer id) {
		try {
			AllotGuide instance = (AllotGuide) getHibernateTemplate().get(
					"com.gxwzu.business.model.allotGuide.AllotGuide", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	@Override
	public List<AllotGuide> findByLoginName(AllotGuide model) {
		List<AllotGuide> list = new ArrayList<AllotGuide>();
		List<Object> params = new ArrayList<Object>();
		if(model==null){
			return list;
		}
		if(!GeneralUtil.isEmpty(model.getStuId())){
			String queryString = "from AllotGuide model where  model.stuId=?";
			params.add(model.getStuId());
			list = super.findByExample(queryString, params.toArray());
		}
		if(model.getTeacherId()!=null){
			String queryString = "from AllotGuide model where  model.teacherId=?";
			params.add(model.getTeacherId());
			list = super.findByExample(queryString, params.toArray());
		}
		return list;
	}

	@Override
	public AllotGuide findByStuId(Integer stuId) {
		List<Object>  params=new ArrayList<Object>();
		AllotGuide model = null;
		  if(stuId!=null){
			  String queryString="from AllotGuide model where model.stuId=?";
		    	 params.add(stuId);
		       List<AllotGuide> list = super.findByExample(queryString, params.toArray());	 
		        if(list!=null&&list.size()!=0){
		    	   model = list.get(0);
		       }
	 	   }
		return model;
	}
	
	@Override
	public Result<Object> findStudentByDeptAndMajor(ListStudentAllotGuide model, List<Integer> majorIds,String tabFlag, int page, int size) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer queryString = new StringBuffer("SELECT * FROM (")
				.append("SELECT ")
				.append(" st.*,up.userSex,up.userAge,up.userEmail,up.userTel,userImg,up.userType, ")
				.append(" sdt.dept_name,scy.category_name,smr.major_name,scs.class_name,")
				.append(" age.id,age.teacher_id ,str.teacher_name,age.`year` ")
				.append(" FROM sys_student st ")
				.append(" INNER JOIN user_hlep up ON st.user_id = up.id ")
				.append(" LEFT JOIN sys_department sdt ON st.dept_number = sdt.dept_number ")
				.append(" LEFT OUTER JOIN sys_category scy ON st.category_id = scy.category_id ")
	            .append(" LEFT OUTER JOIN sys_major smr ON st.major_id =smr.major_id ")
		        .append(" LEFT OUTER JOIN sys_class scs ON st.class_id = scs.class_id ")
				.append(" LEFT OUTER JOIN allot_guide age ON age.stu_id = st.stu_id and age.year=? ")
				.append(" LEFT OUTER JOIN sys_teacher str ON age.teacher_id = str.teacher_id ")
				.append(") AS model WHERE 1 = 1   ");

		
		int start = (page - 1) * size;
		int limit = size;
		params.add(model.getYear()); //通过年度筛选
		if (SysConstant.NOT_ALEADLY_ALLOTGUIDE.equals(tabFlag)) {
			queryString.append(" and ISNULL(model.teacher_id) ");//筛选 未分配指导老师的学生
		}
		if (SysConstant.ALEADLY_ALLOTGUIDE.equals(tabFlag)){
			queryString.append(" and model.teacher_id = ? ");//已经分配指导老师的学生
			params.add(model.getTeacherId());
		}
	
		if (model.getStuId()!=null) {
			queryString.append(" and model.stu_id=? ");
			params.add(model.getStuId());
		}
		if (StringUtils.isNotEmpty(model.getDeptNumber())) {
			queryString.append(" and model.dept_number=? ");
			params.add(model.getDeptNumber());
		}
		if (model.getMajorId()!=null) {
			queryString.append(" and model.major_id = ? ");
			params.add(model.getMajorId());
		}
		
		if (StringUtils.isNotEmpty(model.getStuName())) {
			queryString.append(" and model.stu_name like ? ");
			params.add("%"+model.getStuName()+"%");
		}
	
		queryString.append("ORDER BY stu_id DESC");

		System.out.println(queryString.toString());

		return super.findBySQL(queryString.toString(), params.toArray(), start,limit);
	}

	@Override
	public List<Object> findStudentsByExample(ListStudentAllotGuide model) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer queryString = new StringBuffer("SELECT * FROM (")
				.append("SELECT ")
				.append(" st.*,up.userSex,up.userAge,up.userEmail,up.userTel,userImg,up.userType, ")
				.append(" sdt.dept_name,scy.category_name,smr.major_name,scs.class_name,")
				.append(" age.id,age.teacher_id ,str.teacher_name,age.`year`,up.sign ")
				.append(" FROM sys_student st ")
				.append(" INNER JOIN user_hlep up ON st.user_id = up.id ")
				.append(" LEFT JOIN sys_department sdt ON st.dept_number = sdt.dept_number ")
				.append(" LEFT OUTER JOIN sys_category scy ON st.category_id = scy.category_id ")
	            .append(" LEFT OUTER JOIN sys_major smr ON st.major_id =smr.major_id ")
		        .append(" LEFT OUTER JOIN sys_class scs ON st.class_id = scs.class_id ")
				.append(" LEFT OUTER JOIN allot_guide age ON age.stu_id = st.stu_id and age.year=? ")
				.append(" LEFT OUTER JOIN sys_teacher str ON age.teacher_id = str.teacher_id ")
				.append(") AS model WHERE 1 = 1  ");
		params.add(model.getYear());
		
		if (model.getStuId()!=null) {
			queryString.append(" and model.stu_id=? ");
			params.add(model.getStuId());
		}
		if (model.getTeacherId()!=null) {
			queryString.append(" and model.teacher_id=? ");
			params.add(model.getTeacherId());
		}
		if (model.getYear()!=null) {
			queryString.append(" and model.year=? ");
			params.add(model.getYear());
		}
		
		queryString.append(" ORDER BY stu_id DESC" );
		return  super.query(queryString.toString(), params.toArray());
	}

	@Override
	public Result<Object> findTeacherList(ListTeacherGuideCount model,
			List<Integer> majorIds, int page, int size) {
		List<Object> params = new ArrayList<Object>();
        StringBuffer queryString = new StringBuffer("SELECT * FROM (");
        int start = (page - 1) * size;
		int limit = size;
		queryString.append("SELECT ")	
			.append(" st.*,up.userSex,up.userAge,up.userEmail,up.userTel,userImg,up.userType ,")
			.append(" sdt.dept_name,scy.category_name,smr.staff_name,stl.technical_name ,sde.duties_name,")
			.append("gt.id as gcId,gt.max_stuNum,gt.already_stuNum,gt.`year`")
			.append(" FROM sys_teacher st ")
			.append(" INNER JOIN user_hlep up ON st.user_id = up.id ")
			.append(" LEFT JOIN sys_department sdt ON st.dept_number = sdt.dept_number ")
			.append(" LEFT OUTER JOIN sys_category scy ON st.category_id = scy.category_id ")
			.append(" LEFT OUTER JOIN sys_major smr ON st.staffroom_id =smr.major_id ")
			.append(" LEFT OUTER JOIN sys_technical stl ON st.technical_id = stl.technical_id ")
			.append(" LEFT OUTER JOIN sys_duties sde ON st.duties_no = sde.duties_id ")
			.append(" LEFT JOIN guide_count gt ON st.teacher_id = gt.guide_teachId and  gt.year=?  ")
		    .append(") AS model WHERE 1 = 1 ");
	
    	   params.add(model.getYear());
		
		 if(StringUtils.isNotEmpty(model.getDeptNumber())){
	        	queryString.append(" and model.dept_number=? ");
	        	params.add(model.getDeptNumber());
	        }
//		 if(StringUtils.isNotEmpty(model.getDeptNumber())){
//	        	queryString.append(" and model.dept_number=? ");
//	        	params.add(model.getDeptNumber());
//	        }
//         if(StringUtils.isNotEmpty(model.getTeacherName())){
//        	queryString.append(" and model.teacher_name like ? ");
//			params.add("%"+model.getTeacherName()+"%");
//		 }
         if(StringUtils.isNotEmpty(model.getTeacherName())){
         	queryString.append(" and model.teacher_name like ? ");
 			params.add("%"+model.getTeacherName()+"%");
 		 }
         
         /*  majorIds: 预留已实现 通过老师可选专业进行查询*/
         if(majorIds!=null&&majorIds.get(0)!=null){
        	queryString.append(" AND model.teacher_id = any( ");
        	queryString.append(" SELECT tm.teacher_id ");
        	queryString.append(" FROM teacher_major tm ");
        	queryString.append(" WHERE tm.major_id = any( ");
        	queryString.append(" SELECT sm.major_id ");
         	queryString.append(" FROM sys_major sm ");
         	queryString.append(" WHERE sm.major_id = ?  ");
         	queryString.append(" ) ");
         	queryString.append(" ) ");
 			params.add(majorIds.get(0));
 		 }
        
        queryString.append(" ORDER BY model.teacher_id DESC");
        
        return super.findBySQL(queryString.toString(), params.toArray(), start, limit);
	}
}
