package com.gxwzu.system.service.sysTechnical;

import java.util.List;

import com.gxwzu.core.pagination.Result;
import com.gxwzu.system.model.sysTechnical.SysTechnical;

public interface ISysTechnicalService {

	public  Result<SysTechnical> find(SysTechnical model, int page, int size);

	public SysTechnical add(SysTechnical sysTechnical);

	public  SysTechnical findById(Integer id);
	
	public  SysTechnical findByName(String technicalName);

	public  SysTechnical findByNo(String technicalNo);

	public  SysTechnical del(Integer thisId);

	public  SysTechnical edit(SysTechnical model);

	public List<SysTechnical> findAllSysTechnicalList();

	public List<SysTechnical> findByExample(SysTechnical model);//检查职称是否存在

}
