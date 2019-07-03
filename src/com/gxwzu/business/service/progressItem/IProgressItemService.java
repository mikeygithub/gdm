package com.gxwzu.business.service.progressItem;

import java.util.List;

import com.gxwzu.business.model.paln.PlanYear;
import com.gxwzu.business.model.progressItem.ProgressItem;
import com.gxwzu.core.service.BaseService;

public interface IProgressItemService extends BaseService<ProgressItem>{

	List<ProgressItem> findProgressItemList();

}
