package com.gxwzu.business.dao.paper.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.paper.IStudentPaperDao;
import com.gxwzu.business.dao.plan.IPlanYearDao;
import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.paper.StudentPaper;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;

@SuppressWarnings("unchecked")
@Repository("studentPaperDao")
public class StudentPaperDaoImpl extends BaseDaoImpl<StudentPaper>implements IStudentPaperDao {

	@Override
	public Result<StudentPaper> find(StudentPaper model, int page, int size) {
		StringBuffer queryString = new StringBuffer("FROM StudentPaper model where 1=1 ");
		int start = (page - 1) * size;
		int limit = size;
		List<Object> params = new ArrayList<Object>();

		if(model.getYear()!=null){
			queryString.append("and model.year=?");
			params.add(model.getYear());
		}

		if(model.getStuId()!=null){
			queryString.append("and model.stuId=?");
			params.add(model.getStuId());
		}
		
		if(model.getTeacherId()!=null){
			queryString.append("and model.teacherId=?");
			params.add(model.getTeacherId());
		}

		if(model.getPaperId()!=null){
			queryString.append("and model.paperId=?");
			params.add(model.getPaperId());
		}
		
		if(StringUtils.isNotEmpty(model.getPaperName())){
			queryString.append("and model.paperName like ?");
			params.add(model.getPaperName());
		}
		
		if(StringUtils.isNotEmpty(model.getPath())){
			queryString.append("and model.path like ?");
			params.add(model.getPath());
		}
		
		queryString.append(" ORDER BY model.paperId DESC");

		return super.find(queryString.toString(), params.toArray(), null, start, limit);
	}

	@Override
	public List<StudentPaper> findByExample(StudentPaper model) {
		StringBuffer queryString = new StringBuffer("FROM StudentPaper model where 1=1 ");

		List<Object> params = new ArrayList<Object>();
		if(model.getYear()!=null){
			queryString.append("and model.year=?");
			params.add(model.getYear());
		}

		if(model.getTeacherId()!=null){
			queryString.append("and model.teacherId=?");
			params.add(model.getTeacherId());
		}
		
		if(model.getStuId()!=null){
			queryString.append("and model.stuId=?");
			params.add(model.getStuId());
		}
		if(model.getPaperId()!=null){
			queryString.append("and model.paperId=?");
			params.add(model.getPaperId());
		}
		
		
		if(StringUtils.isNotEmpty(model.getFileType())){
			queryString.append("and model.fileType = ?");
			params.add(model.getFileType());
		}
		if(model.getYear()!=null){
			queryString.append("and model.year=?");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.paperId DESC");
		return super.findByExample(queryString.toString(),params.toArray() );
	}

	@Override
	public List<Object> findList(StudentPaper model) {
		List<Object> params = new ArrayList<Object>();
		StringBuffer queryString = new StringBuffer("SELECT * FROM(");

		queryString.append(" SELECT sp.*,sft.file_name as file_type_name ")
		           .append(" FROM student_paper sp  ")
		           .append(" LEFT JOIN sys_file_type sft ON sp.file_type = sft.file_type_no ")
		           .append(" ) as model where 1=1 ");

		if(model.getTeacherId()!=null){
			queryString.append(" and model.teacher_id=?");
			params.add(model.getTeacherId());
		}
		if(model.getStuId()!=null){
			queryString.append(" and model.stu_id=?");
			params.add(model.getStuId());
		}
		if(model.getPaperId()!=null){
			queryString.append(" and model.paper_id=?");
			params.add(model.getPaperId());
		}
		
		if(StringUtils.isNotEmpty(model.getFileType())){
			queryString.append(" and model.file_type = ?");
			params.add(model.getFileType());
		}
		if(model.getYear()!=null){
			queryString.append(" and model.year=?");
			params.add(model.getYear());
		}
		queryString.append(" ORDER BY model.paper_id DESC");
		return super.query(queryString.toString(), params.toArray());
	}


}
