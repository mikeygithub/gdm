package com.gxwzu.business.service.progressSitu.impl;

import java.util.ArrayList;


import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.progressSitu.IProgressSituDao;
import com.gxwzu.business.model.progressSitu.ProgressSitu;
import com.gxwzu.business.service.progressSitu.IProgressSituSerivce;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
import com.gxwzu.sysVO.ListProgressSitu;
import com.gxwzu.system.model.sysStudent.SysStudent;
import com.gxwzu.system.service.sysStudent.ISysStudentService;

@Service("progressSituSerivce")
public class ProgressSituSerivceImpl extends BaseServiceImpl<ProgressSitu> implements IProgressSituSerivce{

	@Autowired
	private IProgressSituDao progressSituDao;
	
	@Autowired
	private ISysStudentService syISysStudentService;
	
	@Override
	public Result<ListProgressSitu> find(ProgressSitu model, int page, int size) {
		Result<ProgressSitu> oldResult = progressSituDao.find(model, page, size);
		Result<ListProgressSitu> newResult = new Result<ListProgressSitu>();
		List<ListProgressSitu> list = new ArrayList<ListProgressSitu>();
		if(oldResult!=null&&oldResult.getData()!=null){
		   for(ProgressSitu m:oldResult.getData()){
			   ListProgressSitu pSitul = new ListProgressSitu();
			   pSitul.setProgressId(m.getProgressId());
			   pSitul.setProgressRecord(m.getProgressRecord());
			   pSitul.setProgressTime(m.getProgressTime());
			   pSitul.setProgressWork(m.getProgressWork());
			   pSitul.setStuId(m.getStuId());
			   pSitul.setTeacherId(m.getTeacherId());
			  SysStudent student =   syISysStudentService.findById(m.getStuId());
			   if(student!=null){
				   pSitul.setStuName(student.getStuName());  
			   }
			   list.add(pSitul);			   
		   }
		}
		newResult.setData(list);
		newResult.setOffset(oldResult.getOffset());
		newResult.setPage(oldResult.getPage());
		newResult.setPageUrl(oldResult.getPageUrl());
		newResult.setSize(oldResult.getSize());
		newResult.setTotalPage(oldResult.getTotalPage());
		newResult.setTotal(oldResult.getTotal());
		return newResult;
	}

	@Override
	public BaseDao<ProgressSitu> getDao() {
		return this.progressSituDao;
	}

	@Override
	public ProgressSitu add(ProgressSitu model) {
		return progressSituDao.save(model);
	}

	@Override
	public ProgressSitu findById(Integer id) {
		return progressSituDao.findById(id);
	}

	@Override
	public ProgressSitu edit(ProgressSitu progressSitu) {
		progressSituDao.update(progressSitu);
		return progressSitu;
	}

	@Override
	public ProgressSitu del(Integer id) {
		ProgressSitu model = progressSituDao.findById(id);
		progressSituDao.remove(model);
		return model;
	}

	@Override
	public List<ListProgressSitu> findByStuIdAndYear(Integer stuId, Integer year) {
		ProgressSitu model = new ProgressSitu();
		model.setStuId(stuId);
		model.setYear(year);
		List<ListProgressSitu> list= findByExample(model);
		if(list==null||list.size()<=0)
			return null;
		else{
			return list;
		}
	}

	@Override
	public List<ListProgressSitu> findByExample(ProgressSitu model) {
		List<ProgressSitu> oldList = progressSituDao.findByExample(model);
		List<ListProgressSitu> newList = new ArrayList<ListProgressSitu>();
		if(oldList!=null&&oldList.size()!=0){
		   for(ProgressSitu m:oldList){
			   ListProgressSitu pSitul = new ListProgressSitu();
			   pSitul.setProgressId(pSitul.getProgressId());
			   pSitul.setProgressRecord(m.getProgressRecord());
			   pSitul.setProgressTime(m.getProgressTime());
			   pSitul.setProgressWork(m.getProgressWork());
			   pSitul.setYear(m.getYear());
			   pSitul.setStuId(m.getStuId());
			   pSitul.setTeacherId(m.getTeacherId());
			  SysStudent student =   syISysStudentService.findById(m.getStuId());
			   if(student!=null){
				   pSitul.setStuName(student.getStuName());  
			   }
			   newList.add(pSitul);			   
		   }
		}
      return newList;
	}

	/**
	 * 
	 */
	@Override
	public Result<Object[]> outModelByExample(ProgressSitu model, int page, int row) {
		Result<Object[]>  newProgressSitur=new Result<Object[]>();
		Result<ProgressSitu> oldProgressSitur= progressSituDao.find(model, page, row);
		//记录数
		Integer oldTotal = new Integer(0);
		oldTotal= oldProgressSitur.getTotal();
		//先写入Result的基本数据
		newProgressSitur.setOffset(oldProgressSitur.getOffset());
		newProgressSitur.setSize(oldProgressSitur.getSize());
		newProgressSitur.setTotalPage(oldProgressSitur.getTotalPage());
		newProgressSitur.setPage(oldProgressSitur.getPage());	
		//构建listdata
		List<Object[]> listProgressSitu=new ArrayList<Object[]>();
		for(int i = 0;i < oldProgressSitur.getData().size();i++){
			ProgressSitu progressSitu =  oldProgressSitur.getData().get(i);
			Object[] list = new Object[3];
			list[0] = progressSitu.getProgressTime();
			list[1] = progressSitu.getProgressWork();
			list[2] = progressSitu.getProgressRecord();
			listProgressSitu.add(list);
			}
		newProgressSitur.setData(listProgressSitu);
			return newProgressSitur;
		}

	@Override
	public List<ProgressSitu> findAll(ProgressSitu progressSitu) {
		return progressSituDao.finAll(progressSitu);
	}
	
}
