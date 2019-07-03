package com.gxwzu.business.dao.defenseRecord;

import java.util.List;

import com.gxwzu.business.model.defenseRecord.DefenseRecord;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.pagination.Result;

public interface IDefenseRecordDao extends BaseDao<DefenseRecord> {

	public	Result<DefenseRecord> find(DefenseRecord model, int page, int size);
	public List<DefenseRecord> findByExample(DefenseRecord model);
}
