package com.gxwzu.business.dao.progressItem.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxwzu.business.dao.progressItem.IProgressItemDao;
import com.gxwzu.business.model.progressItem.ProgressItem;
import com.gxwzu.core.dao.impl.BaseDaoImpl;
import com.gxwzu.system.model.sysClassroom.SysClassroom;

@SuppressWarnings("unchecked")
@Repository("progressItemDao")
public class ProgressItemDaoImpl extends BaseDaoImpl<ProgressItem> implements IProgressItemDao{

	@Override
	public List<ProgressItem> findProgressItemList() {
		return getAll(ProgressItem.class);
	}

}
