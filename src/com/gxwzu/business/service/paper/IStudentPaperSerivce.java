package com.gxwzu.business.service.paper;

import java.util.List;

import com.gxwzu.business.model.paper.StudentPaper;
import com.gxwzu.business.model.taskBook.TaskBook;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;
import com.gxwzu.sysVO.ListPaper;

public interface IStudentPaperSerivce extends BaseService<StudentPaper> {

	public StudentPaper  add(StudentPaper studentPaper);

	public Result<StudentPaper> find(StudentPaper model, int page, int row);
	

	public void del(Integer thisId);

	public StudentPaper findById(Integer thisId);

	public StudentPaper findByStuIdAndYear(Integer thisStuId, Integer thisYear, String fileType);

	public List<StudentPaper> findByExample(StudentPaper model);

	public List<ListPaper> findList(StudentPaper model);

	

	
}
