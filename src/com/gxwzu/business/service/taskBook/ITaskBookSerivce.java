package com.gxwzu.business.service.taskBook;

import java.util.List;

import com.gxwzu.business.model.taskBook.TaskBook;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;

public interface ITaskBookSerivce extends BaseService<TaskBook> {

	public Result<TaskBook> find(TaskBook model, int page, int size);

	public List<TaskBook> findByExample(TaskBook model);
	
	public TaskBook findById(Integer id);
	
	public TaskBook addOrEdit(TaskBook model);

	public void del(Integer id);

	public TaskBook findByStuIdAndYear(Integer stuId, Integer year);

	public TaskBook add(TaskBook model);

}
