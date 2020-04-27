package com.gxwzu.business.service.taskBook.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.taskBook.ITaskBookDao;
import com.gxwzu.business.model.review.Review;
import com.gxwzu.business.model.taskBook.TaskBook;
import com.gxwzu.business.service.taskBook.ITaskBookSerivce;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListReview;

@Service("taskBookService")
public class TaskBookServiceImpl extends BaseServiceImpl<TaskBook> implements ITaskBookSerivce{
    @Autowired
    private ITaskBookDao taskBookDao;
    
    public BaseDao<TaskBook> getDao() {
		return this.taskBookDao;
	}

	@Override
	public TaskBook addOrEdit(TaskBook model) {
		
		
		return taskBookDao.saveOrUpdate(model);
	}


	@Override
	public Result<TaskBook> find(TaskBook model, int page, int size) {
		 return taskBookDao.find(model, page, size);
	}


	@Override
	public List<TaskBook> findByExample(TaskBook model) {
		return taskBookDao.findByExample(model);
	}


	@Override
	public TaskBook findById(Integer id) {
		return taskBookDao.get(TaskBook.class, id);
	}

	@Override
	public void del(Integer id) {
		remove(TaskBook.class,id);
	}

	@Override
	public TaskBook findByStuIdAndYear(Integer stuId, Integer year) {
		TaskBook model = new TaskBook();
		model.setStuId(stuId);
		model.setYear(year);
		List<TaskBook> list= findByExample(model);
		if(list==null||list.size()<=0)
			return null;
		else{
			return list.get(0);
		}
	}

	@Override
	public TaskBook add(TaskBook model) {
		return taskBookDao.save(model);
	}


}
