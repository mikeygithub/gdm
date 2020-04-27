package com.gxwzu.business.service.openReport;

import java.util.List;

import com.gxwzu.business.model.openReport.OpenReport;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;

public interface IOpenReportSerivce extends BaseService<OpenReport> {

	public Result<OpenReport> find(OpenReport model, int page, int size);

	public List<OpenReport> findByExample(OpenReport model);
	
	public OpenReport findById(Integer id);
	
	public OpenReport addOrEdit(OpenReport model);

	public void del(Integer id);

	public OpenReport findByStuIdAndYear(Integer stuId, Integer year);

	public OpenReport add(OpenReport model);
}
