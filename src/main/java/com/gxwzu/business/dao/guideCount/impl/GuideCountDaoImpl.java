package com.gxwzu.business.dao.guideCount.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.guideCount.IGuideCountDao;
import com.gxwzu.business.model.guideCount.GuideCount;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListTeacherGuideCount;

@SuppressWarnings("unchecked")
@Repository("guideCountDao")
public class GuideCountDaoImpl extends BaseDaoImpl<GuideCount>implements IGuideCountDao {

	@Override
	public Result<GuideCount> find(GuideCount model, int page, int size) {
		String queryString = "from GuideCount model where 1=1";
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();
		if(model.getGuideTeachId()!=null){
			queryString=queryString+"and model.guideTeachId=?";
			params.add(model.getGuideTeachId());
		}
		if(model.getYear()!=null){
			queryString=queryString+"and model.year=?";
			params.add(model.getYear());
		}
		
		queryString = queryString + " ORDER BY model.id DESC";
		return (Result<GuideCount>) super.find(queryString, params.toArray(),null, start, limit);
	}


	@Override
	public List<GuideCount> findByExample(GuideCount model) {
		String queryString = "from GuideCount model where 1=1";
		List<Object> params = new ArrayList<Object>();
		
		if(model.getGuideTeachId()!=null){
			queryString=queryString+"and model.guideTeachId=?";
			params.add(model.getGuideTeachId());
		}
		if(model.getYear()!=null){
			queryString=queryString+"and model.year=?";
			params.add(model.getYear());
		}
		
		queryString = queryString + " ORDER BY model.id DESC";
		return super.findByExample(queryString, params.toArray());
	}
	@Override
	public Result<Object> findGuideCount(ListTeacherGuideCount model,int page, int size) {
		List<Object> params = new ArrayList<Object>();
        StringBuffer queryString = new StringBuffer("SELECT * FROM (");
        int start = (page - 1) * size;
		int limit = size;
		queryString.append("SELECT ")
			.append(" st.*,up.userSex,up.userAge,up.userEmail,up.userTel,up.userImg,up.userType,")
			.append(" sdt.dept_name,scy.category_name,smr.staff_name,stl.technical_name, sds.duties_name,")
			.append(" gt.id as gcId,gt.max_stuNum,gt.already_stuNum,gt.`year`")
			.append(" FROM sys_teacher st ")
			.append(" INNER JOIN user_hlep up ON st.user_id = up.id ")
			.append(" LEFT JOIN sys_department sdt ON st.dept_number = sdt.dept_number ")
			.append(" LEFT OUTER JOIN sys_category scy ON st.category_id = scy.category_id ")
			.append(" LEFT OUTER JOIN sys_major smr ON st.staffroom_id =smr.major_id ")
			.append(" LEFT OUTER JOIN sys_technical stl ON st.technical_id = stl.technical_id ")
			.append(" LEFT OUTER JOIN sys_duties sds ON st.duties_no = sds.duties_id ")
			.append(" LEFT JOIN guide_count gt ON st.teacher_id = gt.guide_teachId and  gt.year=?  ")
		    .append(") AS model WHERE 1 = 1   ")
		    .append(" AND model.teacher_id IN(SELECT teacher_id FROM teacher_major) "); //查询专业老师
    	   params.add(model.getYear());
		
		 if(StringUtils.isNotEmpty(model.getDeptNumber())){
	        	queryString.append(" and model.dept_number=? ");
	        	params.add(model.getDeptNumber());
	        }
		 if(model.getCategoryId() != null){
	        	queryString.append(" and model.category_id=? ");
	        	params.add(model.getCategoryId());
	        }
		 if(model.getStaffroomId() != null){
	        	queryString.append(" and model.staffroom_id=? ");
	        	params.add(model.getStaffroomId());
	        }
		 
         if(StringUtils.isNotEmpty(model.getTeacherName())){
        	queryString.append(" and model.teacher_name like ? ");
			params.add("%"+model.getTeacherName()+"%");
		 }
         if(StringUtils.isNotEmpty(model.getTeacherName())){
         	queryString.append(" and model.teacher_name=? ");
 			params.add("%"+model.getTeacherName()+"%");
 		 }
        
        queryString.append(" ORDER BY model.teacher_id DESC");
     
		return super.findBySQL(queryString.toString(), params.toArray(), start, limit);
	}
	


}
