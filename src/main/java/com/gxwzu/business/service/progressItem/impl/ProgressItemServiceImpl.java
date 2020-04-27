package com.gxwzu.business.service.progressItem.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxwzu.business.dao.progressItem.IProgressItemDao;
import com.gxwzu.business.model.progressItem.ProgressItem;
import com.gxwzu.business.service.progressItem.IProgressItemService;
import com.gxwzu.core.dao.BaseDao;
import com.gxwzu.core.service.impl.BaseServiceImpl;

@Service("progressItemService")
public class ProgressItemServiceImpl extends BaseServiceImpl<ProgressItem> implements IProgressItemService{
	
	@Autowired
    private IProgressItemDao progressItemDao;

	@Override
	public BaseDao<ProgressItem> getDao() {
		return this.progressItemDao;
	}

	@Override
	public List<ProgressItem> findProgressItemList() {
		return progressItemDao.findProgressItemList();
	}

}
