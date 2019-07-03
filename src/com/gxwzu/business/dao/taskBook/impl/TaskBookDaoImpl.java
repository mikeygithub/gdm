package com.gxwzu.business.dao.taskBook.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.taskBook.ITaskBookDao;
import com.gxwzu.business.model.taskBook.TaskBook;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.core.pagination.Result;

@SuppressWarnings("unchecked")
@Repository("taskBookDao")
public class TaskBookDaoImpl extends BaseDaoImpl<TaskBook>implements ITaskBookDao {

	@Override
	public Result<TaskBook> find(TaskBook model, int page, int size) {
		StringBuffer queryString = new StringBuffer("FROM TaskBook model where 1=1 ");
		int start = (page - 1) * size;
		int limit = size;
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
		
		queryString.append(" ORDER BY model.taskId DESC");

		return super.find(queryString.toString(), params.toArray(), null, start, limit);
	}


	@Override
	public List<TaskBook> findByExample(TaskBook model) {
		StringBuffer queryString = new StringBuffer("FROM TaskBook model where 1=1 ");

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
		if(model.getTaskId()!=null){
			queryString.append("and model.taskId=?");
			params.add(model.getTaskId());
		}
		
		queryString.append(" ORDER BY model.taskId DESC");
		
		return super.findByExample(queryString.toString(),params.toArray() );
	}

}
