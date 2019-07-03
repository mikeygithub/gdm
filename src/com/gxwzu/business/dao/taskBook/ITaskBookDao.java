package com.gxwzu.business.dao.taskBook;

import java.util.List;

import com.gxwzu.business.model.taskBook.TaskBook;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;

/**
 * 任务书DAO
 * @author he
 *
 */
public interface ITaskBookDao extends BaseDao<TaskBook> {
	
	public Result<TaskBook> find(TaskBook model, int page, int size);

	public List<TaskBook> findByExample(TaskBook model);
}
