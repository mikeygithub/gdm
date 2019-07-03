package com.gxwzu.business.service.openReport.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.openReport.IOpenReportDao;
import com.gxwzu.business.model.openReport.OpenReport;
import com.gxwzu.business.model.taskBook.TaskBook;
import com.gxwzu.business.service.openReport.IOpenReportSerivce;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.impl.BaseServiceImpl;

@Service("openReportService")
public class OpenReportServiceImpl extends BaseServiceImpl<OpenReport> implements IOpenReportSerivce{
    @Autowired
    private IOpenReportDao openReportDao;
    
    public BaseDao<OpenReport> getDao() {
		return this.openReportDao;
	}

	@Override
	public OpenReport addOrEdit(OpenReport model) {
		return openReportDao.saveOrUpdate(model);
	}


	@Override
	public Result<OpenReport> find(OpenReport model, int page, int size) {
		 return openReportDao.find(model, page, size);
	}


	@Override
	public List<OpenReport> findByExample(OpenReport model) {
		return openReportDao.findByExample(model);
	}


	@Override
	public OpenReport findById(Integer id) {
		return openReportDao.get(OpenReport.class, id);
	}

	@Override
	public void del(Integer id) {
		remove(OpenReport.class,id);
	}

	@Override
	public OpenReport findByStuIdAndYear(Integer stuId, Integer year) {
		OpenReport model = new OpenReport();
		model.setStuId(stuId);
		model.setYear(year);
		List<OpenReport> list= findByExample(model);
		if(list==null||list.size()<=0)
			return null;
		else{
			return list.get(0);
		}
	}

	@Override
	public OpenReport add(OpenReport model) {
		return openReportDao.save(model);
	}

}
