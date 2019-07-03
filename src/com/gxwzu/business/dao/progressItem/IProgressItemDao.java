package com.gxwzu.business.dao.progressItem;

import java.util.List;

import com.gxwzu.business.model.progressItem.ProgressItem;
import com.gxwzu.core.dao.BaseDao;


public interface IProgressItemDao extends BaseDao<ProgressItem>{

	List<ProgressItem> findProgressItemList();

}
