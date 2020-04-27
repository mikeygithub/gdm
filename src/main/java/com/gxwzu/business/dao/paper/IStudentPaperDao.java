package com.gxwzu.business.dao.paper;

import java.util.List;

import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.paper.StudentPaper;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.sysVO.ListPaper;

public interface IStudentPaperDao extends BaseDao<StudentPaper> {

	Result<StudentPaper> find(StudentPaper model, int page, int size);

	List<StudentPaper> findByExample(StudentPaper model);

	List<Object> findList(StudentPaper model);

	
	
}
