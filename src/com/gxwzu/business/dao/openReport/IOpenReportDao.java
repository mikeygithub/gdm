package com.gxwzu.business.dao.openReport;

import java.util.List;

import com.gxwzu.business.model.openReport.OpenReport;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;

/**
 * 开题报告DAO
 * @author he
 *
 */
public interface IOpenReportDao extends BaseDao<OpenReport> {
	
	public Result<OpenReport> find(OpenReport model, int page, int size);

	public List<OpenReport> findByExample(OpenReport model);
}
