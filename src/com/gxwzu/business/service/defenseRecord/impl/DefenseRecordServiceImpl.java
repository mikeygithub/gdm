package com.gxwzu.business.service.defenseRecord.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.defenseRecord.IDefenseRecordDao;
import com.gxwzu.business.model.defenseRecord.DefenseRecord;
import com.gxwzu.business.model.openReport.OpenReport;
import com.gxwzu.business.model.taskBook.TaskBook;
import com.gxwzu.business.service.defenseRecord.IDefenseRecordService;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;
@Service("defenseRecordService")
public class DefenseRecordServiceImpl extends BaseServiceImpl<DefenseRecord>implements IDefenseRecordService{
 
	@Autowired
	private IDefenseRecordDao defenseRecordDao;
	
	@Override
	public BaseDao<DefenseRecord> getDao() {
		return this.defenseRecordDao;
	}

	@Override
	public Result<DefenseRecord> find(DefenseRecord model, int page, int size) {
		return defenseRecordDao.find(model,page,size);
	}

	@Override
	public DefenseRecord addOrEdit(DefenseRecord model) {
		return defenseRecordDao.saveOrUpdate(model);
	}

	@Override
	public DefenseRecord findById(Integer id) {
		return defenseRecordDao.get(DefenseRecord.class, id);
	}

	@Override
	public List<DefenseRecord> findByExample(DefenseRecord model) {
		return defenseRecordDao.findByExample(model);
	}

	@Override
	public void del(Integer id) {
		remove(DefenseRecord.class,id);	
	}

	@Override
	public DefenseRecord findByStuIdAndYear(Integer stuId, Integer year) {
		DefenseRecord model = new DefenseRecord();
		model.setStuId(stuId);
		model.setYear(year);
		List<DefenseRecord> list= findByExample(model);
		if(list==null||list.size()<=0)
			return null;
		else{
			return list.get(0);
		}
	}

	@Override
	public DefenseRecord add(DefenseRecord model) {
		return defenseRecordDao.save(model);
	}

}
