package com.gxwzu.business.service.defenseRecord;

import java.util.List;

import com.gxwzu.business.model.defenseRecord.DefenseRecord;
import com.gxwzu.business.model.taskBook.TaskBook;
import com.gxwzu.core.pagination.Result;
import com.gxwzu.core.service.BaseService;

public interface IDefenseRecordService extends BaseService<DefenseRecord>{

	public	Result<DefenseRecord> find(DefenseRecord model, int page, int size);

	public DefenseRecord addOrEdit(DefenseRecord model);
 
   public DefenseRecord findById(Integer id);
	
   public List<DefenseRecord> findByExample(DefenseRecord model);

	public void del(Integer id);

	public DefenseRecord findByStuIdAndYear(Integer stuId, Integer year);

	public DefenseRecord add(DefenseRecord model);
}
